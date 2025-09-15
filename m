Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425F3CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DkS4QDZJl0FAF44nxv0bvfSPzZQ6k9P+76AzUqw7np8=; b=D4+JlLHsA+JYIiKe2RF76yNT0j
	VbpyL0QyeB03sdB5+H+RnEpnF+6d62JE/+w5xYu2jvMxtlwnjfsTJdhAosYJUX7y0moDNzV0AK084
	Pu3RwJtMSRRN3Z8r7qA8AwnegEPfUoP44UtHSUZMM3+MoGL7wL1QozLySRyha+IovEX3hqVR1ysWJ
	5Dotmy6CIABw1eqjEEvY3E2Px2DHYIsuV5Y6gUCaHS9/E2VqjQbQuNDyJ29QB8i4Oanft9B740nSR
	E6lgMH0hCt8tHcGjp3PgAKy1kvu9YFQ7vS4A91UlMEJQk6nis9W94o6kesPU1o+5vjnJGLaxQVtmJ
	I6kIMDCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Xy-00000003glD-1YqZ;
	Mon, 15 Sep 2025 10:34:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Xc-00000003gGV-3r4a
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 15 Sep 2025 10:34:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=DkS4QDZJl0FAF44nxv0bvfSPzZQ6k9P+76AzUqw7np8=; b=myCvQrqApy9VN/FSrV9TRBrt4J
	4MENW/+sjHBbrminW8mYKfLFpyun8zv6bZlyIoxlNViLMXc2yNtQniZjjmgmHeMsFNAYJICnhuH3r
	V/FxBbQxhbhQbq73ky2oSqoo3dtOXpMNoY36ENU1snXVjAq3TZqu7DPwRJP7P2Umn26HQFOQDveqS
	Toks++6THJeQV6jyztJNJw/oQBS4cKn2nMZtlPbua7++KOnrI3n0luiCNmfvmFBhVd2q/ism26S7W
	4ZPpzmAEdFr95NUH6YIHyQHF3kJnSojXOBFBuYli74GuQV/gqylcWh/w1r5K1DIxsHoVadRZEjdoT
	EO7MHbpg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6XY-00000006vcl-1kNk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:34:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 699CD1424;
	Mon, 15 Sep 2025 03:34:23 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CB6E3F66E;
	Mon, 15 Sep 2025 03:34:29 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 15 Sep 2025 11:33:49 +0100
Subject: [PATCH v3 26/31] coresight: Control path during CPU idle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-arm_coresight_power_management_fix-v3-26-ea49e91124ec@arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757932420; l=2166;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=KwIhiri/sJmEvh97azofHC9NoAnGmVPBF9JG1+ZGz9M=;
 b=rBvtlE6l8ovDJbwABFOHrjqrXSi0ryCNGU07wqFwtGrYLnMvlrnb4SAogkTpyfMit4YeyfvMo
 GDhX0wk8WB2D2W/NuQlTpB0Pu0mDy96s1JL2qd4+EY8sUZYTAQJhn1X
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_113433_012003_BB95CE0A 
X-CRM114-Status: GOOD (  13.01  )
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

Control links and helpers on an activated path during CPU idle. Since
coresight_disable_path_from() does not handle a source device's
helpers, explicitly disable them alongside the source device.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 0e8506d5eaa01d1cc4846324a64eae5f0f442da3..04e8c3b862494abb2a5a46d385f0ff4cad93b71f 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -460,8 +460,15 @@ static bool coresight_need_save_restore_source(struct coresight_device *csdev)
 
 static int coresight_save_source(struct coresight_device *csdev)
 {
-	if (csdev && source_ops(csdev)->save)
-		return source_ops(csdev)->save(csdev);
+	int ret;
+
+	if (csdev && source_ops(csdev)->save) {
+		ret = source_ops(csdev)->save(csdev);
+		if (ret)
+			return ret;
+
+		coresight_disable_helpers(csdev, NULL);
+	}
 
 	/* Return success if callback is not supported */
 	return 0;
@@ -1665,17 +1672,33 @@ static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
 {
 	unsigned int cpu = smp_processor_id();
 	struct coresight_device *source = per_cpu(csdev_source, cpu);
+	struct coresight_path *path;
 
 	if (!coresight_need_save_restore_source(source))
 		return NOTIFY_OK;
 
+	/*
+	 * When run at here, the source device mode is enabled.
+	 * The activated path pointer must not be NULL.
+	 */
+	path = per_cpu(csdev_cpu_path, source->cpu);
+	if (WARN_ON(!path))
+		return NOTIFY_BAD;
+
 	switch (cmd) {
 	case CPU_PM_ENTER:
 		if (coresight_save_source(source))
 			return NOTIFY_BAD;
+
+		coresight_disable_path_from(path, NULL, true);
 		break;
 	case CPU_PM_EXIT:
 	case CPU_PM_ENTER_FAILED:
+		if (_coresight_enable_path(path,
+					   coresight_get_mode(source),
+					   NULL, true))
+			return NOTIFY_BAD;
+
 		coresight_restore_source(source);
 		break;
 	default:

-- 
2.34.1


