Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AA9CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 11:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CK2vPtw6nmwOXZe4DQG1rl1YjTDgIezxSNxpZi6ytLM=; b=xEIaD+RBN5PWGY/LQhy5aml5vH
	cIHJb8jmqj62J+8nwpUw5SL6rkd6lCcpyljHJcw/irq/uiDqbPAVy2kOFFY17SxKztvPkYRZY8Opu
	xoLHywVlxNheYN8UfNyBjcPERPFgg4WDoKGCnBGOIuv0rqaZ0XtGxaCS/f/2pmHiE1n9osyiCqrdE
	XvtKSwlf80mwZPHCAtT43owoENBAOo9invg5ghlNSbsDdK6pgWhmA3LGBwMT/kMHr26LVC4jN8Bky
	UaeEhlRD0MBdYRnn+ZLkbulF2L37NNp69SOJx5TOXtipo6kc+De6xYg2C4PeiaEBpI8+7k2kIZdXJ
	ngty9slA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9VN-00000008jUz-34xh;
	Wed, 12 Nov 2025 11:59:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9VE-00000008jMo-20iP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 11:59:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5210A1515;
	Wed, 12 Nov 2025 03:59:00 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E0FE3F5A1;
	Wed, 12 Nov 2025 03:59:06 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 12 Nov 2025 11:58:41 +0000
Subject: [PATCH v7 05/11] coresight: etm4x: Add context synchronization
 before enabling trace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-arm_coresight_power_management_fix-v7-5-33e0b6f995f7@arm.com>
References: <20251112-arm_coresight_power_management_fix-v7-0-33e0b6f995f7@arm.com>
In-Reply-To: <20251112-arm_coresight_power_management_fix-v7-0-33e0b6f995f7@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762948736; l=2916;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=ZLyN1p08etKBFkhoTOtFmTAUHCumCT3IPHXno9mBXs4=;
 b=Tk7EVbZ+lTUugEe6OKVJhmVRSnHhDncgruBfCpqdHqUDHcIFKTTMpwLF9r6hkbNs1EPg32Eqh
 GhAToUbCqYMDLaJRyoG45YU17D4sMdCk5lCCm/94YnCV5OdpJdcv7nu
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_035909_102640_6A5C03CB 
X-CRM114-Status: GOOD (  14.42  )
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

According to the software usage PKLXF in Arm ARM (ARM DDI 0487 L.a), a
Context synchronization event is required before enabling the trace
unit.

An ISB is added to meet this requirement, particularly for guarding the
operations in the flow:

  etm4x_allow_trace()
   `> kvm_tracing_set_el1_configuration()
	`> write_sysreg_s(trfcr_while_in_guest, SYS_TRFCR_EL12)

Improved the barrier comments to provide more accurate information.

Fixes: 1ab3bb9df5e3 ("coresight: etm4x: Add necessary synchronization for sysreg access")
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Reviewed-by: Yeoreun Yun <yeoreum.yun@arm.com>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 27 ++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index c562f82985192ad71e181be1b570c9a2f334f29f..5e707d082537a405e86fc30e28957ef8beec250f 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -446,10 +446,24 @@ static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
 		etm4x_relaxed_write32(csa, TRCRSR_TA, TRCRSR);
 
 	etm4x_allow_trace(drvdata);
+
+	/*
+	 * According to software usage PKLXF in Arm ARM (ARM DDI 0487 L.a),
+	 * execute a Context synchronization event to guarantee the trace unit
+	 * will observe the new values of the System registers.
+	 */
+	if (!csa->io_mem)
+		isb();
+
 	/* Enable the trace unit */
 	etm4x_relaxed_write32(csa, 1, TRCPRGCTLR);
 
-	/* Synchronize the register updates for sysreg access */
+	/*
+	 * As recommended by section 4.3.7 ("Synchronization when using system
+	 * instructions to progrom the trace unit") of ARM IHI 0064H.b, the
+	 * self-hosted trace analyzer must perform a Context synchronization
+	 * event between writing to the TRCPRGCTLR and reading the TRCSTATR.
+	 */
 	if (!csa->io_mem)
 		isb();
 
@@ -931,11 +945,16 @@ static void etm4_disable_trace_unit(struct etmv4_drvdata *drvdata)
 	 */
 	etm4x_prohibit_trace(drvdata);
 	/*
-	 * Make sure everything completes before disabling, as recommended
-	 * by section 7.3.77 ("TRCVICTLR, ViewInst Main Control Register,
-	 * SSTATUS") of ARM IHI 0064D
+	 * Prevent being speculative at the point of disabling the trace unit,
+	 * as recommended by section 7.3.77 ("TRCVICTLR, ViewInst Main Control
+	 * Register, SSTATUS") of ARM IHI 0064D
 	 */
 	dsb(sy);
+	/*
+	 * According to software usage VKHHY in Arm ARM (ARM DDI 0487 L.a),
+	 * execute a Context synchronization event to guarantee no new
+	 * program-flow trace is generated.
+	 */
 	isb();
 	/* Trace synchronization barrier, is a nop if not supported */
 	tsb_csync();

-- 
2.34.1


