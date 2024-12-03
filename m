Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE604E69E9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 00:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whaaziq6hsRQUJEmQXZ5nYXkFLSWAgp+qb3fW3L3ymo=; b=rgQ9ap1W1Pr1F0A4m6+0mi+YMB
	SepMTJDY5wkmSMAI46R5YCA/VCJHfWqTS7zJJZ5Z0lzaP8ePszVF5uam+Kwje3bzIBiocOEovzDde
	iq1akaBdBFQ3jnE6Iy5c2rLMfpp2+SyP+4I/P07rF0USxDCvVCyXARoPRSVCVyzkAEnfKXZ2i/Gss
	1ztogtDlVHopIS2xyJIYFR3w5aPn8GOnMp79YkkwAQWClwi8hcGCI9eE8yxVnuyqrPH2fK7PBSPbg
	MAAH3c+O9sJwlcpMrTp91bGyyzLcqwLQ5n8QhAu4EN8K06BUKhvyH15g42vxVlR/59IzP2Dnn1k3h
	cqIoIRmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIGOm-00000007lcv-3dU4;
	Tue, 03 Dec 2024 00:04:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIGMo-00000007lHY-3Rkm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 00:02:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C763B1515;
	Mon,  2 Dec 2024 16:02:40 -0800 (PST)
Received: from u200865.usa.arm.com (U203867.austin.arm.com [10.118.30.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CC583F71E;
	Mon,  2 Dec 2024 16:02:12 -0800 (PST)
From: Jeremy Linton <jeremy.linton@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: gshan@redhat.com,
	steven.price@arm.com,
	sami.mujawar@arm.com,
	suzuki.poulose@arm.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>
Subject: [PATCH v2 1/1] arm64: rsi: Add automatic arm-cca-guest module loading
Date: Mon,  2 Dec 2024 18:01:56 -0600
Message-ID: <20241203000156.72451-2-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241203000156.72451-1-jeremy.linton@arm.com>
References: <20241203000156.72451-1-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_160214_904490_40D64F72 
X-CRM114-Status: GOOD (  14.26  )
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

The TSM module provides both guest identification as well as
attestation when a guest is run in CCA mode. Lets assure by creating a
dummy platform device that the module is automatically loaded during
boot.  The TSM module will be loaded by udev daemon after it receives
the device addition event. Once it is in place it can be used earlier
in the boot process to say decrypt a LUKS rootfs.

Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
---
 arch/arm64/include/asm/rsi.h                    |  2 ++
 arch/arm64/kernel/rsi.c                         | 15 +++++++++++++++
 drivers/virt/coco/arm-cca-guest/arm-cca-guest.c |  8 ++++++++
 3 files changed, 25 insertions(+)

diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
index 188cbb9b23f5..b42aeac05340 100644
--- a/arch/arm64/include/asm/rsi.h
+++ b/arch/arm64/include/asm/rsi.h
@@ -10,6 +10,8 @@
 #include <linux/jump_label.h>
 #include <asm/rsi_cmds.h>
 
+#define RSI_PDEV_NAME "arm-cca-dev"
+
 DECLARE_STATIC_KEY_FALSE(rsi_present);
 
 void __init arm64_rsi_init(void);
diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
index 3031f25c32ef..5434e5496ac2 100644
--- a/arch/arm64/kernel/rsi.c
+++ b/arch/arm64/kernel/rsi.c
@@ -8,6 +8,7 @@
 #include <linux/psci.h>
 #include <linux/swiotlb.h>
 #include <linux/cc_platform.h>
+#include <linux/platform_device.h>
 
 #include <asm/io.h>
 #include <asm/mem_encrypt.h>
@@ -140,3 +141,17 @@ void __init arm64_rsi_init(void)
 	static_branch_enable(&rsi_present);
 }
 
+static struct platform_device rsi_dev = {
+	.name = RSI_PDEV_NAME,
+	.id = PLATFORM_DEVID_NONE
+};
+
+static int __init rsi_init(void)
+{
+	if (is_realm_world() &&
+	    platform_device_register(&rsi_dev))
+		pr_err("failed to register rsi platform device\n");
+	return 0;
+}
+
+arch_initcall(rsi_init)
diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
index 488153879ec9..1f8d8439f617 100644
--- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
+++ b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
@@ -6,6 +6,7 @@
 #include <linux/arm-smccc.h>
 #include <linux/cc_platform.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/smp.h>
 #include <linux/tsm.h>
@@ -219,6 +220,13 @@ static void __exit arm_cca_guest_exit(void)
 }
 module_exit(arm_cca_guest_exit);
 
+/* modalias, so userspace can autoload this module when RSI is available */
+static const struct __maybe_unused platform_device_id arm_cca_match[] = {
+	{ RSI_PDEV_NAME, 0},
+	{ }
+};
+
+MODULE_DEVICE_TABLE(platform, arm_cca_match);
 MODULE_AUTHOR("Sami Mujawar <sami.mujawar@arm.com>");
 MODULE_DESCRIPTION("Arm CCA Guest TSM Driver");
 MODULE_LICENSE("GPL");
-- 
2.46.0


