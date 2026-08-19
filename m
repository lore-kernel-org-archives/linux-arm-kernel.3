Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C52C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 08:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42iduETGlknsslp/j7ZqOxLTb0nElQTxLcQCYseFPTw=; b=kJQ2doZzEokFRfOjTnqVh7jlVW
	hPtEHBsAbSmYVq34AoHSdcckAl15cT+UUmBC/oFvl63eBZbGfHed5adDwe7pPUpuV5PNZB8BsCy8r
	vobTLT/SFr7TRu1TR5Xg/R6J8nnIPFYfOV8xutryvGZQLQZgt3xHiN6h+vSxGEckInBBd3W5eK24i
	WlEFo1TaGLX5o7Yumsj4zxvZEpi9a9alV5faP2D7B8o3FU6Y3g0hU9M/sQQ6Gh0WACXM3G1vro6FG
	WNPIYrGrKHrNd3lX4cHmtpaW86pfgZb8x/kAuEvTl78gUXrPE7sHgN/4il8aSNPp30N/Pqh3262uG
	Jnanvsiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwbvI-00000009Khb-2am8;
	Wed, 19 Aug 2026 08:45:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwbvF-00000009Kgw-2Oj7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 08:45:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EFF4153B;
	Wed, 19 Aug 2026 01:45:14 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8981C3F66F;
	Wed, 19 Aug 2026 01:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787129118; bh=+aHPlIAKmlb/qA4aZRXFzfPHKV26rayOq1J+KtH4ivQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TZipHbMWLvpXTTZgT91Nhe/tCT/Q6bKzjQFFaEc464Re2lX5Jnfsq1RFMdIy5QSqv
	 2b8CxoPh03mEyHdYQ7M/3Z6cpSEuCQlu7GxNih6RI725ERT4NmOiR1v6Du+xMRDMiA
	 g3wltJNirnKR7sjBRrAZT8wuHSAojxGDcP2qKifA=
Date: Wed, 19 Aug 2026 09:45:15 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>, Suyash Mahar <smahar@meta.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 4/8] coresight: tmc-etr: Prevent per-thread events
 from sharing a sink
Message-ID: <20260819084515.GF8904@e132581.arm.com>
References: <20260728-james-cs-multiple-per-threads-v3-0-6aee7579f1dc@linaro.org>
 <20260728-james-cs-multiple-per-threads-v3-4-6aee7579f1dc@linaro.org>
 <20260813160504.GC8904@e132581.arm.com>
 <dcea48bc-6a64-413b-acf5-9783f979ab6d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dcea48bc-6a64-413b-acf5-9783f979ab6d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_014521_791406_35B301FE 
X-CRM114-Status: GOOD (  24.65  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Aug 14, 2026 at 10:09:01AM +0100, James Clark wrote:

[...]

> There isn't any sharing with "another perf session", unless there is a
> mistake somewhere? Checking that the owners are equivalent enforces this. Or
> do you mean another event owned by the same process?

Now I understand that the problem is constrained to different events
within the same session.

> I'm not sure the exact model you had in mind was that still supports this
> and fixes the bugs?

Let me try to describe my understanding of the problem.

  ./perf test -w named_threads 2 1000000 &
  ./perf record -e cs_etm//u --per-thread --pid $!

We can simplify the flow as:

                | T1 |
  CPU0        ------------------------------
                   |   T2      |
  CPU1        ------------------------------
                               `> T2 stops and the driver reports
                                  the warning when trying to sync
                                  ETR_BUF(T1), while T2 is associated
                                  with ETR_BUF(T2).

  AUX_BUF(T1) |                            |
  ETR_BUF(T1) | Bounce buf0                |  -> Used by H/W trace


  AUX_BUF(T2) |                            |
  ETR_BUF(T2) | Bounce buf1                |  -> Not used by H/W trace

With `--per-thread --pid $PID`, perf creates separate events for the
child threads, say T1 and T2. Perf allocates a separate AUX buffer
for each event, and the ETR driver also allocates a separate bounce
buffer for each event. However, because there is only one shared ETR
sink, only one of those bounce buffers can actually be used by the
hardware at a time.

If T1 stops while T2 is still running, the ETR remains enabled. Later,
when T2 stops, the ETR is still using ETR_BUF(T1). This mismatch
triggers the warning and prevents the data from being copied.

I am just wandering if we can improve the sink driver to only allocate
a single bounce buffer that is independent of any threads (and any
associated events).

                | T1 |
  CPU0        ------------------------------
                   |   T2      |
  CPU1        ------------------------------
                               `> T2 stops and can sync trace
                                  from the shared bounce buffer
                                  to AUX_BUF(T2).

  AUX_BUF(T1) |                            |
  AUX_BUF(T2) |                            |

  ETR_BUF     | Bounce buf                 |  -> Used by H/W trace

This might also simplify the CPU-wide case. Each CPU would still have
its own AUX buffer, but the ETR driver would maintain only one bounce
buffer for the shared sink. A reference count could track how many
events are using the sink, with the final event responsible for
stopping the sink and copying the trace data from bounce buffer to aux
buffer.

> The one in this change is pretty complete and only does 4 comparisons,
> which seems quite simple to me.

Before going further with the heavily sink buffer refactoring, perhaps
a more pragmatic solution would be to reject the problematic case for
now. Can we do something like below?

+void coresight_trace_id_is_perf_started(struct coresight_trace_id_map *id_map)
+{
+	PERF_SESSION(atomic_read(&id_map->perf_cs_etm_session_active));
+}

@@ -399,6 +399,15 @@ etm_event_build_path(struct perf_event *event, int cpu,
 			goto out;
 	}
 
+	if (!coresight_trace_id_is_perf_started(&sink->perf_sink_id_map)) {
+		sink->perf_owner = event->owner;
+		sink->perf_target = event->hw.target;
+	} else {
+		if (sink->perf_owner != event->owner ||
+		    sink->perf_target != event->hw.target)
+			goto out;
+	}
+

We use a central place etm_event_build_path() to record and compare
event's owner and target process, then we don't need to spread the
check into sink drivers. We only care about if owner and target must
be consistent.

Regard of the inherit/inherit_thread, I always see they are consistent
within the same session. Should we ignore them?

Thanks,
Leo

