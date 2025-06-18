Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89954C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 12:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIzLatU61BABGI1VibIYf/IsJQn164yHu53a+YCb5SI=; b=PTWKET8pKP+xhsIG9UOC7Kfpac
	D0E0/Q4lvStnPRRhxYSY+FBDVGmOvIsSjd1vJyg09yzqBj6Zqrx0Xn1YLCuyDQPfvbblXKA5bpv9E
	MIF07DAz06TX6V3qG5x99CiCIKBmRM+RET0IO/56wTHyetZfjlQnz1jacapX3D4Etr2CgXY2C2Fzn
	ZAG1FDfRE4aIaAeaHbMwNCR95XlvEnZbYb11zeamBgXd8o5oTTQECIf5mxse1qeRvVNnZODNwrT/5
	M/jmgccN/y1YDl0/ItlO82ozadn9r2ne00bR1mDT5JmqoZETVAIJvOI3Ggp8uMuMPPDmRkKaq3Tx0
	id03G1wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRraq-0000000A4PZ-3YFp;
	Wed, 18 Jun 2025 12:08:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpwi-00000009lfT-0blW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 10:23:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 418281BC0;
	Wed, 18 Jun 2025 03:22:47 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 78ADB3F66E;
	Wed, 18 Jun 2025 03:23:06 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: jarkko@kernel.org,
	sudeep.holla@arm.com,
	peterhuewe@gmx.de,
	jgg@ziepe.ca,
	stuart.yoder@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v4 1/2] firmware: arm_ffa: Change initcall level of ffa_init() to rootfs_initcall
Date: Wed, 18 Jun 2025 11:23:01 +0100
Message-Id: <20250618102302.2379029-2-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618102302.2379029-1-yeoreum.yun@arm.com>
References: <20250618102302.2379029-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_032308_224435_F883AC94 
X-CRM114-Status: GOOD (  15.27  )
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

The Linux IMA (Integrity Measurement Architecture) subsystem used for secure
boot, file integrity, or remote attestation cannot be a loadable module
for few reasons listed below:

 o Boot-Time Integrity: IMA’s main role is to measure and appraise files
   before they are used. This includes measuring critical system files during
   early boot (e.g., init, init scripts, login binaries). If IMA were a module,
   it would be loaded too late to cover those.

 o TPM Dependency: IMA integrates tightly with the TPM to record measurements
   into PCRs. The TPM must be initialized early (ideally before init_ima()),
   which aligns with IMA being built-in.

 o Security Model: IMA is part of a Trusted Computing Base (TCB). Making it a
   module would weaken the security model, as a potentially compromised system
   could delay or tamper with its initialization.

IMA must be built-in to ensure it starts measuring from the earliest possible
point in boot which inturn implies TPM must be initialised and ready to use
before IMA.

To enable integration of tpm_event_log with the IMA subsystem, the TPM drivers
(tpm_crb and tpm_crb_ffa) also needs to be built-in. However with FF-A driver
also being initialised at device initcall level, it can lead to an
initialization order issue where:
 - crb_acpi_driver_init() may run before tpm_crb_ffa_driver()_init and ffa_init()
 - As a result, probing the TPM device via CRB over FFA is deferred
 - ima_init() (called as a late initcall) runs before deferred probe completes,
   IMA fails to find the TPM and logs the below error:

   |  ima: No TPM chip found, activating TPM-bypass!

Eventually it fails to generate boot_aggregate with PCR values.

Because of the above stated dependency, the ffa driver needs to initialised
before tpm_crb_ffa module to ensure IMA finds the TPM successfully when
present.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index fe55613a8ea9..1a690b8186df 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -2058,7 +2058,7 @@ static int __init ffa_init(void)
 	kfree(drv_info);
 	return ret;
 }
-module_init(ffa_init);
+rootfs_initcall(ffa_init);
 
 static void __exit ffa_exit(void)
 {
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


