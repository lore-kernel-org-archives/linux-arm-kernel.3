Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D000FE77173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 01:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGc4DhiwP4hQqpIPqOByzi9cwl6xkJFGYVCRBH8+9Uw=; b=Of2eAeBuu4vcUJRUhUWpU3yP/4
	vhaBMCAJvyKof5TYnHEkD1dU7qs/wHLvT8v2oXjIbUmY8X0MrGDfbQghhWqerjJeOhq63j5HQWloV
	TO10pohHqS4eDb+pUhnES5Z0KNHyVrLzbT9mBz1WpwHrPbXdaXXy+RrVd8/vWshNk3DfjFMVCh6XZ
	5QGL58GL/N5HOrQje1llcN23bY/sbM18oWHy13YhKm31SedbJV9Wi2OL/e8V0cQGgA71LC86p356B
	R6cQKn7MCAQPq+OMlxUb2M/7S4QTMtq2f5XCInMSTACT4Mv7jn4jcIXHlUxkcmhyQh+AX275qwgBi
	kmX64ylw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJjXz-0000000392O-37UT;
	Sat, 07 Dec 2024 01:23:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJjVs-000000038qH-2p5m
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 01:21:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC7D512FC;
	Fri,  6 Dec 2024 17:22:07 -0800 (PST)
Received: from u200865.usa.arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A53613F5A1;
	Fri,  6 Dec 2024 17:21:39 -0800 (PST)
From: Jeremy Linton <jeremy.linton@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: suzuki.poulose@arm.com,
	gshan@redhat.com,
	steven.price@arm.com,
	sami.mujawar@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-kernel@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>
Subject: [PATCH v3 1/1] arm64: rsi: Add automatic arm-cca-guest module loading
Date: Fri,  6 Dec 2024 19:21:28 -0600
Message-ID: <20241207012128.247522-2-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241207012128.247522-1-jeremy.linton@arm.com>
References: <20241207012128.247522-1-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_172144_210486_7F626B67 
X-CRM114-Status: GOOD (  12.84  )
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

The TSM module provides guest identification and attestation when a
guest runs in CCA mode. By creating a dummy platform device, let's
ensure the module is automatically loaded. The udev daemon loads the
TSM module after it receives a device addition event. Once that
happens, it can be used earlier in the boot process to decrypt the
rootfs.

Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
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
index 488153879ec9..87f162736b2e 100644
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
+static const struct platform_device_id arm_cca_match[] __maybe_unused = {
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


