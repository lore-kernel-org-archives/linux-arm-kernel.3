Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B62D5B17D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 14:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=84weadUU+C6THnPjEye+1jz++CMiGXqxDbtNCXSzIE8=; b=yBhPIY8DFxR4J+RK4g4auC6O8N
	vLU/gcYO9csmFbHDw0m06xCEeey6VfBknLnUY9XOVQ0MP3fixuaeu+ycolRC4Crnv6/h3iGhEY/Z4
	lFjgiKs/eyERaDzuXsWA2RP2IcG0SJnJ2jEqex9lSMH3hhTal0QveqS5f5KE9e/LwLE0Blq1D4CKa
	jodTjbT+3XxXTAI/Z1h6osraYm969MoK36MMxNKxAm9EBdTGQMiF7kXEQpfcZL/FvyRBDT726reeJ
	KyVxg5eCivjuk14jV5vGG2vZI4EpXwpZw25nAsb6l0GuxQ5u2eSJMgYdJxYjNcQofoYpZc5eYEUed
	/7hIZd2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5n1Q-0000000EheK-053w;
	Tue, 29 Oct 2024 14:16:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5mwP-0000000Eggi-03yf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 14:11:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30A48113E;
	Tue, 29 Oct 2024 07:11:52 -0700 (PDT)
Received: from u200865.usa.arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BF393F528;
	Tue, 29 Oct 2024 07:11:22 -0700 (PDT)
From: Jeremy Linton <jeremy.linton@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: steven.price@arm.com,
	suzuki.poulose@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	gshan@redhat.com,
	sami.mujawar@arm.com,
	linux-kernel@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>
Subject: [PATCH] arm64: rsi: Add automatic arm-cca-guest module loading
Date: Tue, 29 Oct 2024 09:11:14 -0500
Message-ID: <20241029141114.7207-1-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_071125_121625_E0D0E1D4 
X-CRM114-Status: GOOD (  12.34  )
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
boot. Once it is in place it can be used earlier in the boot process
to say decrypt a LUKS rootfs.

Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
---
 arch/arm64/include/asm/rsi.h                    |  2 ++
 arch/arm64/kernel/rsi.c                         | 15 +++++++++++++++
 drivers/virt/coco/arm-cca-guest/arm-cca-guest.c |  7 +++++++
 3 files changed, 24 insertions(+)

diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
index 188cbb9b23f5..1b14a4c4257a 100644
--- a/arch/arm64/include/asm/rsi.h
+++ b/arch/arm64/include/asm/rsi.h
@@ -10,6 +10,8 @@
 #include <linux/jump_label.h>
 #include <asm/rsi_cmds.h>
 
+#define ARMV9_RSI_PDEV_NAME "arm-cca-dev"
+
 DECLARE_STATIC_KEY_FALSE(rsi_present);
 
 void __init arm64_rsi_init(void);
diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
index 3031f25c32ef..ad963eb12921 100644
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
+	.name = ARMV9_RSI_PDEV_NAME,
+	.id = -1
+};
+
+static int __init rsi_init(void)
+{
+	if (is_realm_world())
+		if (platform_device_register(&rsi_dev))
+			pr_err("failed to register rsi platform device");
+	return 0;
+}
+
+arch_initcall(rsi_init)
diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
index 488153879ec9..e7ef3b83d5d9 100644
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
@@ -219,6 +220,12 @@ static void __exit arm_cca_guest_exit(void)
 }
 module_exit(arm_cca_guest_exit);
 
+static const struct platform_device_id arm_cca_match[] = {
+	{ ARMV9_RSI_PDEV_NAME, 0},
+	{ }
+};
+
+MODULE_DEVICE_TABLE(platform, arm_cca_match);
 MODULE_AUTHOR("Sami Mujawar <sami.mujawar@arm.com>");
 MODULE_DESCRIPTION("Arm CCA Guest TSM Driver");
 MODULE_LICENSE("GPL");
-- 
2.46.0


