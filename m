Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD88CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWhqxmVXBe8OwGEfmg0H65Vr9sFjtl+Amo4eOW4GKXs=; b=kssXjAPJZYjFtBPCZZQRzbFe2+
	81JPIY9zV7pUdDl2uQe/3b6EPB5oHJ9ERp0NYwyspcZx0UwsT7wyNjtv4EnEx2VHcMfT+Scff9sur
	IX3HdCDkO2zU/W8F/r7hyM7rJfrI6ztSri8VUniqN0T9YV5nX1hjje2ySS+mAo09qMUaGt01/VNx0
	mJ86ZzNxD/L9z6xOxOD9So8rsFihoGPNFtY4PbmniUmUiQ9FENza3jMbTsqfRBnFsW/ooxpb2eNPg
	sa9pth/EW4hlRLIjL/Gug4BTJitb/HWkasFbgCJFwbSq/aLgs1YaxRFfQYQWtGoVzsVXZjAkBfx9F
	6C9u5vbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6X3-00000003fWp-0nCv;
	Mon, 15 Sep 2025 10:34:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Wz-00000003fSe-2Ng7
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 15 Sep 2025 10:33:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=NWhqxmVXBe8OwGEfmg0H65Vr9sFjtl+Amo4eOW4GKXs=; b=aE1pb7cS+gDh5MdUiqdibaq0t4
	dikevMnW1GGXP5KSNiusVg/RMVkyDj4irc6tWMY91w1w1VX5Ah90KqoOnPV5o7qj+ekm2bF072f7W
	LxcltW9/es40JIkgyaWFyIdqdz6hcLiYNcvbYV1YEA6p3c5QrV7tIL7AThMn79xBiqdR9MtzYLbwJ
	tuorjPDOuhXu+PPfP8NRPwRDGX0Fd/jujRd5+B7eiPIHqjD5PY5zS2kcLhuweSR4VFB/7Q0yNGB1o
	RKAPGx08W0muBflsR14gsTy3hlDM1MQ7V0M279npKb2CtwO6DiWEuQsBKYW/tqLznhYvd9VL8l/fc
	LBOre0Bw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Ww-00000006vWf-1sO1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:33:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43AAD1BF7;
	Mon, 15 Sep 2025 03:33:45 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DDBC83F66E;
	Mon, 15 Sep 2025 03:33:51 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 15 Sep 2025 11:33:29 +0100
Subject: [PATCH v3 06/31] coresight: etm4x: Add context synchronization
 before enabling trace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-arm_coresight_power_management_fix-v3-6-ea49e91124ec@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757932420; l=3229;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=wtplQZnk2COFLZgsFfTMiTcUfeZs11HXNUYO8iqNeqA=;
 b=iPSJNvctuU7HwXnfbo/fcmkskRaRUkPEqTk2rLWqV+QaNkPvKUe9HBwvL0vOmXf8T/2XADHcB
 N156Ymdd/8tBjFB+mc9U/YXOrgcftErMYV0xs85VmjL9kI/z1Bi8ovb
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_113354_961889_F0F0088A 
X-CRM114-Status: GOOD (  16.81  )
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
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 37 +++++++++++++++++++---
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 31d4838b47ae4a3a96c6a06774707214943268fc..999bceef4cd771e46aec891f4c814a95e0921c2f 100644
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
@@ -933,11 +957,16 @@ static void etm4_disable_trace_unit(struct etmv4_drvdata *drvdata)
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


