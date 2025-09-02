Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA9DCA1009
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T/y06Gmi2YKrrkosXBcgItcjWVhKpLu+AJ811DXq2W4=; b=Si/8d8V3BFGkTrDDS+V75kAT1M
	aqbpwCx9+/IlivNkGqgVh2E5+4fOH6Xp9L3XYdrURRcNHKU7EBQCTQPlVezh7XIGE3h4+EC7QKyfI
	I1U9goZMb7/5+mSwqt/mzX/myUl3L8PPay+9xcUpwuIh0u26pPpRmwvMIbo8eYkLpeIdfCEa8pe60
	3X8h4PogJoNfrgflJEBWX7jBAPG4hSKsbJzZ5V9lN9xEsmzuQnl5VhYkUd4DB12jaYNbCwJvdEtZm
	kZDNiKnsV3JFzRCPZAbIF3GUA6IWVhHFO6BAkxrv1GDPTCDg9VDBMe3YxviAPyvV4iDseKtP8/Zmp
	PBgDmt2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYoh-00000002E1P-1ntW;
	Tue, 02 Sep 2025 21:45:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utUgn-00000001AN9-0TDx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 17:21:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE81A2720;
	Tue,  2 Sep 2025 10:20:49 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.33.8.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 32B4B3F694;
	Tue,  2 Sep 2025 10:20:57 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>
Cc: Paul Benoit <paul@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: smccc: Fix Arm SMCCC SOC_ID name call
Date: Tue,  2 Sep 2025 18:20:53 +0100
Message-Id: <20250902172053.304911-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_102101_193304_7794E0FB 
X-CRM114-Status: GOOD (  16.97  )
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

Commit 5f9c23abc477 ("firmware: smccc: Support optional Arm SMCCC SOC_ID
name") introduced the SOC_ID name string call, which reports a human
readable string describing the SoC, as returned by firmware.
The SMCCC spec v1.6 describes this feature as AArch64 only, since we rely
on 8 characters to be transmitted per register. Consequently the SMCCC
call must use the AArch64 calling convention, which requires bit 30 of
the FID to be set. The spec is a bit confusing here, since it mentions
that in the parameter description ("2: SoC name (optionally implemented for
SMC64 calls, ..."), but still prints the FID explicitly as 0x80000002.
But as this FID is using the SMC32 calling convention (correct for the
other two calls), it will not match what mainline TF-A is expecting, so
any call would return NOT_SUPPORTED.

Add a 64-bit version of the ARCH_SOC_ID FID macro, and use that for the
SoC name version of the call.

Fixes: 5f9c23abc477 ("firmware: smccc: Support optional Arm SMCCC SOC_ID name")
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Hi,

as somewhat expected, this now fails on an Ampere machine, which
reported a string in /sys/devices/soc0/machine before, but is now missing
this file.
Any idea what's the best way to handle this? Let the code try the 32-bit
FID, when the 64-bit one fails? Or handle this as some kind of erratum?

Cheers,
Andre

 drivers/firmware/smccc/soc_id.c | 2 +-
 include/linux/arm-smccc.h       | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/smccc/soc_id.c b/drivers/firmware/smccc/soc_id.c
index c24b3fca1cfe3..8f556df34fc42 100644
--- a/drivers/firmware/smccc/soc_id.c
+++ b/drivers/firmware/smccc/soc_id.c
@@ -60,7 +60,7 @@ static char __init *smccc_soc_name_init(void)
 	 * to the ARM_SMCCC_ARCH_SOC_ID function.  Fetch it if
 	 * available.
 	 */
-	args.a0 = ARM_SMCCC_ARCH_SOC_ID;
+	args.a0 = ARM_SMCCC_ARCH_SOC_ID64;
 	args.a1 = 2;    /* SOC_ID name */
 	arm_smccc_1_2_invoke(&args, &res);
 
diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 50b47eba7d015..976c5f8001ff2 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -90,6 +90,11 @@
 			   ARM_SMCCC_SMC_32,				\
 			   0, 2)
 
+#define ARM_SMCCC_ARCH_SOC_ID64						\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_64,				\
+			   0, 2)
+
 #define ARM_SMCCC_ARCH_WORKAROUND_1					\
 	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
 			   ARM_SMCCC_SMC_32,				\
-- 
2.25.1


