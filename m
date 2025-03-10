Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAF4C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 12:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vNHJdkQkdANIyhjCV838w9fBCSsAZpOcLeJV1/DqSc4=; b=CfxokmMnktY27KizvcCndzQ0p1
	alOxw7nwqHj6/Z3PnsFKBCKkhBAubtuOMRE2NY20fc/ExbOyeQ8latI9kyp9K8WfOwXnp8SBKeMGE
	uU1G8UXXEMM5ZEuMgimDM9EFZylzAmWZnXoGNrK3FC9WPVvcguU19W9TmjOLJL8DRbVjhd7gA0bQu
	3JdoEVAiVaiLQkxMUErWyAXMmT05GRIZa78mg0HBWA+0J27B1zw8X9gAgon2bH1YMaUWvctzI/eyB
	4q3vDxZkSUvfGSiC0ujh5miL9hoHrfolPvyRpLYGa19k7wfsRWnA1t5zdy0GKfnxbgX7cCfluuQZT
	p0ZZHdiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trcFP-00000002cgO-3Mud;
	Mon, 10 Mar 2025 12:28:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trbN4-00000002RDS-3f5n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 11:32:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2CB61516;
	Mon, 10 Mar 2025 04:32:45 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BB21B3F5A1;
	Mon, 10 Mar 2025 04:32:32 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v6 0/9] coresight: change some driver' spinlock type to raw_spinlock_t
Date: Mon, 10 Mar 2025 11:32:05 +0000
Message-ID: <174160625284.2197960.9649186230571551042.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306121110.1647948-1-yeoreum.yun@arm.com>
References: <20250306121110.1647948-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_043234_950763_F7DF4429 
X-CRM114-Status: UNSURE (   7.32  )
X-CRM114-Notice: Please train this message.
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


On Thu, 06 Mar 2025 12:11:01 +0000, Yeoreum Yun wrote:
> In some coresight drivers, drvdata->spinlock can be held during __schedule()
> by perf_event_task_sched_out()/in().
> 
> Since drvdata->spinlock type is spinlock_t and
> perf_event_task_sched_out()/in() is called after acquiring rq_lock,
> which is raw_spinlock_t (an unsleepable lock),
> this poses an issue in PREEMPT_RT kernel where spinlock_t is sleepable.
> 
> [...]

Applied, thanks!

[1/9] coresight: change coresight_device lock type to raw_spinlock_t
      https://git.kernel.org/coresight/c/26f060c1
[2/9] coresight-etm4x: change etmv4_drvdata spinlock type to raw_spinlock_t
      https://git.kernel.org/coresight/c/743c5a97
[3/9] coresight: change coresight_trace_id_map's lock type to raw_spinlock_t
      https://git.kernel.org/coresight/c/4cf364ca
[4/9] coresight-cti: change cti_drvdata spinlock's type to raw_spinlock_t
      https://git.kernel.org/coresight/c/e3044065
[5/9] coresight-etb10: change etb_drvdata spinlock's type to raw_spinlock_t
      https://git.kernel.org/coresight/c/6b80c0ab
[6/9] coresight-funnel: change funnel_drvdata spinlock's type to raw_spinlock_t
      https://git.kernel.org/coresight/c/56eb02f0
[7/9] coresight-replicator: change replicator_drvdata spinlock's type to raw_spinlock_t
      https://git.kernel.org/coresight/c/982d0a0e
[8/9] coresight-tmc: change tmc_drvdata spinlock's type to raw_spinlock_t
      https://git.kernel.org/coresight/c/db11f75b
[9/9] coresight/ultrasoc: change smb_drv_data spinlock's type to raw_spinlock_t
      https://git.kernel.org/coresight/c/d11eb31d

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

