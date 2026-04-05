Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A262FE9D800
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 15:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oXW8G9Pa9b17zPKGM1oreiDSB2JnQ7fw9IFedbWMS7c=; b=r+/uRnN3lbkC73nr/DfqHkpun5
	Z+YDafS2sfG/ZLhYk61bafZE3lpGKzWjZC+3jNMvEXJvKneq/D2zidW3m1/eIPkMcUforfm0xUQKC
	LM2dn62QIYRPtTHNGtDuYVlEGAwOXxCtP8+dj4eJwwiJgYdnrt6fBOWPv4XeVARhpdqqNX20F+TcH
	zosGuBWOgeDfLaY46HNqrCPzFvhlUjMEJ/1XwHiZlF26coS+R5mHnsUxMalKFH+BaMypzwtSXapd3
	4Y6uDs5lLgKlbcUxM9Q8fhUvrEKR5jldpeXNbTzPCYnLqU6sWTR8NrZLKMpHdVHaGLAX/YdO/weTL
	E7k2jDkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P0y-00000004HqN-0f99;
	Sun, 05 Apr 2026 15:03:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P0u-00000004HlY-1vlf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Apr 2026 15:03:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F9951758;
	Sun,  5 Apr 2026 08:03:42 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B95B3F62B;
	Sun,  5 Apr 2026 08:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775401428; bh=QQpJvJMLcyiFr74EQSFZBPwiVCm8wR0vVTW2kmtHRrg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NUABRLubzSwH1mKCdLX9twQsQwwq6ivv52/O+DkeXCQYt2MtFrpJvIHkn+yrGpakG
	 SgtObZi1DFop3LIWz/kIoPcX2GlWnOPrcIdJZ9h5fTePYdFd5yxq92NPrxX2P0byQe
	 VjZS8mPKNO6YjlekUG5kYjKHxXFwvk8KjBFFT77k=
From: Leo Yan <leo.yan@arm.com>
Date: Sun, 05 Apr 2026 16:02:51 +0100
Subject: [PATCH v10 15/20] coresight: Control path during CPU idle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-arm_coresight_path_power_management_improvement-v10-15-13e94754a8be@arm.com>
References: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
In-Reply-To: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775401378; l=4013;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=QQpJvJMLcyiFr74EQSFZBPwiVCm8wR0vVTW2kmtHRrg=;
 b=wFeBJwEKQ4Gieac/ilEWG8zvLmNot3XVqA/fb0f6IFBc0RqUQChDZr48AJg0HPOF4gZ2Xz79w
 JbTBUWnDQjHCshv6YLk2/yA+RqRQ7wsANmSW7oE2ZYgFTgkOnAyRd9Z
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_080348_602680_88680E04 
X-CRM114-Status: GOOD (  16.26  )
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

Extend the CPU PM flow to control the path: disable from source up to
the node before the sink, then re-enable the same range on restore.
To avoid latency, control it up to the node before the sink.

Track per-CPU PM restore failures using percpu_pm_failed.  Once a CPU
hits a restore failure, set the percpu_pm_failed and return NOTIFY_BAD
on subsequent notifications to avoid repeating half-completed
transitions.

Setting percpu_pm_failed permanently blocks CPU PM on that CPU.  Such
failures are typically seen during development; disabling PM operations
simplifies the implementation, and a warning highlights the issue.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 47 +++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 02d26dd0171ebf4e884bb3e0028b9a21588f061a..c1e8debc76aba7eb5ecf7efe2a3b9b8b3e11b10c 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -37,6 +37,7 @@ DEFINE_MUTEX(coresight_mutex);
 static DEFINE_PER_CPU(struct coresight_device *, csdev_sink);
 
 static DEFINE_PER_CPU(struct coresight_path *, percpu_path);
+static DEFINE_PER_CPU(bool, percpu_pm_failed);
 
 /**
  * struct coresight_node - elements of a path, from source to sink
@@ -1732,7 +1733,7 @@ static void coresight_release_device_list(void)
 	}
 }
 
-/* Return: 1 if PM is required, 0 if skip */
+/* Return: 1 if PM is required, 0 if skip, <0 on error */
 static int coresight_pm_check(struct coresight_path *path)
 {
 	struct coresight_device *source;
@@ -1749,6 +1750,9 @@ static int coresight_pm_check(struct coresight_path *path)
 	if (coresight_get_mode(source) == CS_MODE_DISABLED)
 		return 0;
 
+	if (this_cpu_read(percpu_pm_failed))
+		return -EIO;
+
 	/* pm_save_disable() and pm_restore_enable() must be paired */
 	source_has_cb = coresight_ops(source)->pm_save_disable &&
 			coresight_ops(source)->pm_restore_enable;
@@ -1771,24 +1775,59 @@ static void coresight_pm_device_restore(struct coresight_device *csdev)
 static int coresight_pm_save(struct coresight_path *path)
 {
 	struct coresight_device *source = coresight_get_source(path);
+	struct coresight_node *from, *to;
+	int ret;
+
+	ret = coresight_pm_device_save(source);
+	if (ret)
+		return ret;
+
+	from = coresight_path_first_node(path);
+	/* Up to the node before sink to avoid latency */
+	to = list_prev_entry(coresight_path_last_node(path), link);
+	coresight_disable_path_from_to(path, from, to);
 
-	return coresight_pm_device_save(source);
+	return 0;
 }
 
 static void coresight_pm_restore(struct coresight_path *path)
 {
 	struct coresight_device *source = coresight_get_source(path);
+	struct coresight_node *from, *to;
+	int ret;
+
+	from = coresight_path_first_node(path);
+	/* Up to the node before sink to avoid latency */
+	to = list_prev_entry(coresight_path_last_node(path), link);
+	ret = coresight_enable_path_from_to(path, coresight_get_mode(source),
+					    from, to);
+	if (ret)
+		goto path_failed;
 
 	coresight_pm_device_restore(source);
+	return;
+
+path_failed:
+	pr_err("Failed in coresight PM restore on CPU%d: %d\n",
+	       smp_processor_id(), ret);
+
+	/*
+	 * Once PM fails on a CPU, set percpu_pm_failed and leave it set until
+	 * reboot. This prevents repeated partial transitions during idle
+	 * entry and exit.
+	 */
+	this_cpu_write(percpu_pm_failed, true);
 }
 
 static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
 				   void *v)
 {
 	struct coresight_path *path = coresight_get_percpu_local_path();
+	int ret;
 
-	if (!coresight_pm_check(path))
-		return NOTIFY_DONE;
+	ret = coresight_pm_check(path);
+	if (ret <= 0)
+		return ret ? NOTIFY_BAD : NOTIFY_DONE;
 
 	switch (cmd) {
 	case CPU_PM_ENTER:

-- 
2.34.1


