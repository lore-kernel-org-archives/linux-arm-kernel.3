Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEEBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 19:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtWPQDrl7FjrTDw2AZGEltJb9ojtSFWiuxzeYupPQ0s=; b=cphqORnYWr9jVKGerwfdndaXyF
	CeFCTJxX2YemP6JNsDFJPlbJV6vuJw7fS/w41xSOvPRvLmb9DSeN3NHpZP2l2Ex36PkSlM+BR1fqV
	BOR+9bkRCj8sXjruCesLuUAWDait/a1FJJCCpHjS1tdw1E1RiJmbCF1jRc5JkOZ9/otPqfuPzXNOp
	/2nzeKb6Fc6zpWGQjO+vD7HIEAoOCFbtvCd47G5LjX3LeoYvNVkfuikwOJKWYkm9lfALk/UVKwMf9
	QxjDGxYmsE95RLj8N4QNExJ0S5WIIL33DiL+M5wszFkiARzQwae6FzHTK/INEn5buaF0dXI+FypKq
	cIOJzPmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfNSS-00000005OvN-3bpC;
	Thu, 02 Jul 2026 19:52:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfNSQ-00000005Osu-3Ldl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 19:52:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1ECE35B7;
	Thu,  2 Jul 2026 12:52:17 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 286F93F673;
	Thu,  2 Jul 2026 12:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783021942; bh=fWKnWG0XxHYhp737OPV3xLbFPiT3yu4LRky6F/1DhAs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fIfgg+QvFyZx7l65u1kX6PnBjph4njk8XiZ/VAVZ8zu12tbtG/iar71coIeXK6Gzj
	 BCEH2vSnHuXg6GcG7TPzmhenunl0MinNNHqz1zgiC7MG6WcH0O0O4PPC7/j7lKwU0y
	 cwglbOVkibjY5i+BNCIDPmp7PIB64c6G+hpxXwMY=
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 02 Jul 2026 20:51:41 +0100
Subject: [PATCH v11 6/9] perf cs-etm: Flush thread stacks after decoder
 reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-b4-arm_cs_callchain_support_v1-v11-6-846abbf600d7@arm.com>
References: <20260702-b4-arm_cs_callchain_support_v1-v11-0-846abbf600d7@arm.com>
In-Reply-To: <20260702-b4-arm_cs_callchain_support_v1-v11-0-846abbf600d7@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>, 
 Paschalis Mpeis <paschalis.mpeis@arm.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783021918; l=2436;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=fWKnWG0XxHYhp737OPV3xLbFPiT3yu4LRky6F/1DhAs=;
 b=EPQypMpJmD7A2fCuPuIa2rBffyHDWk2UmnFx6ll9HkmhERKoZFdEH3iV5rItp6x/SF83wOVsD
 8+09NH/UthAAyrr/COTO18vm2INYDEqaLvA/NOrtBL0ILFo7OJCnaWG
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_125222_951854_BE1111CD 
X-CRM114-Status: GOOD (  13.19  )
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

Perf resets the CoreSight decoder when moving to a new AUX trace buffer,
this causes trace discontinunity globally.

For callchain synthesis, keeping thread-stack state after decoder reset
can leave stale call/return history attached to threads that are decoded
later, producing incorrect synthesized callchains.

Flush all host thread stacks after a decoder reset. When virtualization
is present, flush the guest thread stacks as well.

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index ba9ffb7bdb4bd95c9dc6c323c0d56f516aae56b8..996317687ce7b241afed83444b554155edb09564 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -2033,6 +2033,45 @@ static int cs_etm__end_block(struct cs_etm_queue *etmq,
 
 	return 0;
 }
+
+static int cs_etm__flush_stack_cb(struct thread *thread,
+				  void *data __maybe_unused)
+{
+	thread_stack__flush(thread);
+	return 0;
+}
+
+static void cs_etm__flush_machine_stack(struct cs_etm_queue *etmq, pid_t pid)
+{
+	struct machine *machine;
+
+	machine = machines__find(&etmq->etm->session->machines, pid);
+	if (machine)
+		machine__for_each_thread(machine, cs_etm__flush_stack_cb, NULL);
+}
+
+static void cs_etm__flush_all_stack(struct cs_etm_queue *etmq)
+{
+	enum cs_etm_pid_fmt pid_fmt = cs_etm__get_pid_fmt(etmq);
+
+	if (!etmq->etm->synth_opts.last_branch)
+		return;
+
+	switch (pid_fmt) {
+	case CS_ETM_PIDFMT_CTXTID2:
+		/* Clear the guest stack if virtualization is supported */
+		cs_etm__flush_machine_stack(etmq, DEFAULT_GUEST_KERNEL_ID);
+		fallthrough;
+	case CS_ETM_PIDFMT_CTXTID:
+		cs_etm__flush_machine_stack(etmq, HOST_KERNEL_ID);
+		break;
+	case CS_ETM_PIDFMT_NONE:
+	default:
+		break;
+
+	}
+}
+
 /*
  * cs_etm__get_data_block: Fetch a block from the auxtrace_buffer queue
  *			   if need be.
@@ -2055,6 +2094,12 @@ static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
 		ret = cs_etm_decoder__reset(etmq->decoder);
 		if (ret)
 			return ret;
+
+		/*
+		 * Since the decoder is reset, this causes a global trace
+		 * discontinuity. Flush all thread stacks.
+		 */
+		cs_etm__flush_all_stack(etmq);
 	}
 
 	return etmq->buf_len;

-- 
2.34.1


