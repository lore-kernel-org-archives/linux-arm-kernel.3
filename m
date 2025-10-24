Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA7ECCF9EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 16:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4XeOgjUUEvDIEeIPd9FeohOBQRxyWtWFoK2Gm0ejCIc=; b=amlE2cRQ/K/k1I6d9TlHACgyXU
	SuyHEMDn+kFktb1KdO7RfwSBKyTX1NcTFDcnS9rLEzfkYmBL50C93zs29iMNNzLcSbsII9zeHx1iI
	PPO82NO4dhdJWmD7BcZdIgCKckIG6cumXtwM4VO9UPXUF+tu/T1Sx5uNFab+/3snndoCwVCyHswnb
	I76Uq1cH/d7hj/RWSl7row8ocIum/RiFB0C0hswAZjoBd7NnLc1KZHjeuV/dbHBkUUX6yFMbwzmJj
	tIPzqjZ6QOFpFtgfRQdkUCMmlZ0TbJbra+VB6uWRedfU2sArSBDyx5RuGDbj3eeaWVUjcyNeoUZu4
	zrkZjfog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKw9-0000000A11L-3sKv;
	Fri, 24 Oct 2025 16:46:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKvz-0000000A0sv-20e8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 16:46:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 224731D34;
	Fri, 24 Oct 2025 09:46:27 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5EEA63F66E;
	Fri, 24 Oct 2025 09:46:33 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 24 Oct 2025 17:45:54 +0100
Subject: [PATCH v4 06/11] coresight: etm4x: Add context synchronization
 before enabling trace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-arm_coresight_power_management_fix-v4-6-690e69ae6977@arm.com>
References: <20251024-arm_coresight_power_management_fix-v4-0-690e69ae6977@arm.com>
In-Reply-To: <20251024-arm_coresight_power_management_fix-v4-0-690e69ae6977@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761324381; l=3327;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=uUokXbzj3lTFzHjdjpgzcnIgkn9czrsut9OqlCcZNcw=;
 b=7eqz4oSSRva+hlQIrP6/2c6PIINgiFJAVakTpwdChAxN8VrgWNC3TC78emJwOcAdEMstRq8QF
 4752nbBWMQxAGam2rWda2r6ycSjya1OAhLcwujvXbpS8OrJXUgSRg8/
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_094635_639741_674744A5 
X-CRM114-Status: GOOD (  16.19  )
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
unit. An ISB is added to meet this requirement.

Improved the barrier comments to provide more accurate information by
specifying which section of the document the requirement comes from and
clarifying its intended purpose.

Fixes: 1ab3bb9df5e3 ("coresight: etm4x: Add necessary synchronization for sysreg access")
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 37 +++++++++++++++++++---
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 45bf76901650641d45a0d85965651667a8762b8c..7eb30e85bf03d1eda8212faa3c831338b70f86c3 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -446,13 +446,37 @@ static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
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
 
+	/*
+	 * For the memory-mapped interface, the registers are mapped as Device
+	 * type (Device-nGnRE). As described in section 4.3.7 ("Synchronization
+	 * of register updates") of ARM IHI0064H.b, read back the value of any
+	 * register in the trace unit to ensure writes have completed.
+	 *
+	 * Therefore, polling on TRCSTATR ensures that the writing TRCPRGCTLR
+	 * is complete.
+	 */
+
 	/* wait for TRCSTATR.IDLE to go back down to '0' */
 	if (etm4x_wait_status(csa, TRCSTATR_IDLE_BIT, 0)) {
 		dev_err(etm_dev,
@@ -931,11 +955,16 @@ static void etm4_disable_trace_unit(struct etmv4_drvdata *drvdata)
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


