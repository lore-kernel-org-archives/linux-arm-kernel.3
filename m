Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75224CD4842
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPckqbRjLTLwCI5HFnRsqpqanDyUhEorHSYwo0jMzO4=; b=0naCvg6yw5AZVGXZFJFC0Sy9uo
	h58/HvwHATLAGsq26wJvpjsfuLYgZz9aPYT2y3AfjFDn2vu22fVuHy1gNvlm7Uyor2N1qHo3rYl5u
	KiN2AYchaJT18GlNc4VsQSDntxgFOM7LHAGtMVvNH1VcZO/yk/shZqGuScxanG7jX3bAfwAKlN5F6
	mcuKOsu9q2YaG2o8u5S71dxnqHH+wBg/HeKht08hNnmdnXisiu89Mg2wLSifbDaTigbNWgV0upU1r
	ns/JOmeMeUzQMpKSodQhCwY45ku69S6w0+8MEkH/DhYsnuNh4TohZz81TjD1xa+he5Kt3rItJDQK4
	IZ5T0UZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOYn-0000000DGP6-2VtB;
	Mon, 11 May 2026 11:12:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOYZ-0000000DG5v-1iwT
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 11:12:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=wPckqbRjLTLwCI5HFnRsqpqanDyUhEorHSYwo0jMzO4=; b=uHvgDlM16bHkFYLR9UjpFzUAIp
	DBfiOCBvmA+/xRFbzxR4kpDJkLrbzFr0g5RtHS99u7yxlEEGq/ovvPZ1O5cSTbNfRmH16WM0RDhxE
	EkH1QXynqZKqFMStCRsXJhmkcLF05F3usJuknZ230lgyMgD+ojbF2iKu22jra90JxwTbXDVkreLR5
	6GVRDbyKISh+RVGtKCR0t0xfWCcgFcTEkc584hJBEFnN/mDRTmQdN3InAkIXRZxc4NzTGtTuAKyER
	nrUgnIv/tR00kkzW1Gy8IRj1sA8TMhXqrtlSHRIFPct844Kk691QZ74aZnk58QJy9ZupE3WZl2a26
	AKs6mX7w==;
Received: from foss.arm.com ([217.140.110.172])
	by casper.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOYV-000000082pV-49w5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:12:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA9B015A1;
	Mon, 11 May 2026 04:12:04 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3C4C3F85F;
	Mon, 11 May 2026 04:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778497930; bh=Rs8sqRP9AM2fkjgREmH03R5eNh7JZ49EjWSqgHnuMhk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AMaxs2zjLXYZSBZbC+htjHom3P4wLo1SHUb7sO9kp6F+wreIExLWzzXnQDjN+AeeN
	 xv0F37c5ohTzQyhGY/9g/qV/FdLwzz95UR5ozBZtDsreKt8TEzCtS5/1PPuQ6IWnLo
	 LFl3QqU/wLwtrQ2xL1p4tHWINZytWSf3PswvByfU=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 11 May 2026 12:11:08 +0100
Subject: [PATCH v12 24/28] coresight: Add PM callbacks for sink device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-arm_coresight_path_power_management_improvement-v12-24-1c9dcb1de8c9@arm.com>
References: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
In-Reply-To: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, Jie Gan <jie.gan@oss.qualcomm.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778497860; l=4031;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Rs8sqRP9AM2fkjgREmH03R5eNh7JZ49EjWSqgHnuMhk=;
 b=m7UoZSFNHDxW0iokZI4SvcdEZvK19jSyqiXzGLEo3np0xFGNDHgi+CuRW/CrKaW3h1HfYQ7JX
 wC4wCCO+yGyCvWeVExHmBfTqS0tZDMQwLxDL9I6rXwNc+CA0fr4VUjx
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_121212_411539_252476B0 
X-CRM114-Status: GOOD (  18.31  )
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

Unlike system level sinks, per-CPU sinks may lose power during CPU idle
states.  Currently, this applies specifically to TRBE.  This commit
invokes save and restore callbacks for the sink in the CPU PM notifier.

If the sink provides PM callbacks but the source does not, this is
unsafe because the sink cannot be disabled safely unless the source
can also be controlled, so veto low power entry to avoid lockups.

Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 35 ++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 674fc375ff44e732405563af7be9dc8fae118e41..424727ed12b2fd26be1267ce3e88bab9e3858772 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1868,7 +1868,7 @@ static struct coresight_path *coresight_cpu_get_active_path(void)
 /* Return: 1 if PM is required, 0 if skip, or a negative error */
 static int coresight_pm_is_needed(struct coresight_path *path)
 {
-	struct coresight_device *source;
+	struct coresight_device *source, *sink;
 
 	if (this_cpu_read(percpu_pm_failed))
 		return -EIO;
@@ -1877,7 +1877,8 @@ static int coresight_pm_is_needed(struct coresight_path *path)
 		return 0;
 
 	source = coresight_get_source(path);
-	if (!source)
+	sink = coresight_get_sink(path);
+	if (!source || !sink)
 		return 0;
 
 	/* pm_save_disable() and pm_restore_enable() must be paired */
@@ -1885,16 +1886,35 @@ static int coresight_pm_is_needed(struct coresight_path *path)
 	    coresight_ops(source)->pm_restore_enable)
 		return 1;
 
+	/*
+	 * It is not permitted that the source has no callbacks while the sink
+	 * does, as the sink cannot be disabled without disabling the source,
+	 * which may lead to lockups. Fix this by enabling self-hosted PM
+	 * mode for ETM (see etm4_probe()).
+	 */
+	if (coresight_ops(sink)->pm_save_disable &&
+	    coresight_ops(sink)->pm_restore_enable) {
+		pr_warn_once("coresight PM failed: source has no PM callbacks; "
+			     "cannot safely control sink\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
 static int coresight_pm_device_save(struct coresight_device *csdev)
 {
+	if (!csdev || !coresight_ops(csdev)->pm_save_disable)
+		return 0;
+
 	return coresight_ops(csdev)->pm_save_disable(csdev);
 }
 
 static void coresight_pm_device_restore(struct coresight_device *csdev)
 {
+	if (!csdev || !coresight_ops(csdev)->pm_restore_enable)
+		return;
+
 	coresight_ops(csdev)->pm_restore_enable(csdev);
 }
 
@@ -1913,15 +1933,24 @@ static int coresight_pm_save(struct coresight_path *path)
 	to = list_prev_entry(coresight_path_last_node(path), link);
 	coresight_disable_path_from_to(path, from, to);
 
+	/*
+	 * Save the sink. Most sinks do not implement a save callback to avoid
+	 * latency from memory copying. We assume the sink's save and restore
+	 * always succeed.
+	 */
+	coresight_pm_device_save(coresight_get_sink(path));
 	return 0;
 }
 
 static void coresight_pm_restore(struct coresight_path *path)
 {
 	struct coresight_device *source = coresight_get_source(path);
+	struct coresight_device *sink = coresight_get_sink(path);
 	struct coresight_node *from, *to;
 	int ret;
 
+	coresight_pm_device_restore(sink);
+
 	from = coresight_path_first_node(path);
 	/* Enable up to the node before sink */
 	to = list_prev_entry(coresight_path_last_node(path), link);
@@ -1934,6 +1963,8 @@ static void coresight_pm_restore(struct coresight_path *path)
 	return;
 
 path_failed:
+	coresight_pm_device_save(sink);
+
 	pr_err("Failed in coresight PM restore on CPU%d: %d\n",
 	       smp_processor_id(), ret);
 

-- 
2.34.1


