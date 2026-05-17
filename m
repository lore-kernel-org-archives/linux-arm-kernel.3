Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA13CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 00:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tm3rv+P1fuj1nvvkkvit+LQXf1Erfz+kwHU/iWOaQh0=; b=AQds4AHdALHT0X6+BaWGeCnRoF
	70YmKLdq0RWKnt/wXwXcFMtb0wwBrLTrNajlT2PbzCpXkDwF82WwhRUOg14z72eZ/4tWw6vjLr/xy
	aIeMVBi2ekcoe5rDPCn68CsnIHp/19MSnYtCqaaOEttPfB1EkXfL6Wns/nrNRRJCH4WWnGRxb6D1y
	bjS/eubFUGc1Iwn4WKyHCPFeamp7vOwIn4oeeDAyBAzxnufTDLFrRqtqdSHraaFiX3Jfb/tj4NXNH
	GXKpHHPryNdk0p17Bm4r9fnnFXLVTW2k0DqCoRidAtBWjpm2vGp7LV4WjeV8c4oDE/uq9Q8/cdBFi
	zRz7iOww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOlOo-0000000DiL4-2FLK;
	Sun, 17 May 2026 23:59:58 +0000
Received: from mail-dy1-x1344.google.com ([2607:f8b0:4864:20::1344])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOlOm-0000000DiKh-3SxS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 23:59:57 +0000
Received: by mail-dy1-x1344.google.com with SMTP id 5a478bee46e88-2f0ad52830cso1873331eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 16:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779062396; x=1779667196; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tm3rv+P1fuj1nvvkkvit+LQXf1Erfz+kwHU/iWOaQh0=;
        b=oRAXEp3kEQmAdMDWhg6tPuctgOD/OH3InkTFZ6MMwJjCyYzuKWco4fhdyssdjaQaCH
         2rMGNpPOvGqQATD4Zcyq7/1/C/sC1Yr7uJL5nAXg6N/PL+NkSN7f0GbEOu0WbCYShvAA
         mo2DKeT9VSrw1psxhEdXyNFvTRIaLS3SgUzb0t8AstVjJsxTR7531EL68/SITzXPEVcz
         JMF01fg2VXu7PiwPLP/F8eYqybde7XLqcWJHXgedRtz7aJRe1c+Z3cSaqch+3i9tgw2y
         Nh5NtexPL5PDcbfwfV/T7WnY/l7dnNyKsjnX3MTjF3CYGNUGzQcG0nRmgcNBh/e9QwJx
         ZLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779062396; x=1779667196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tm3rv+P1fuj1nvvkkvit+LQXf1Erfz+kwHU/iWOaQh0=;
        b=OJdMAxSb4NvL+Anv6NyqDzuew5Q/k3fup0lFJO/a3eNT1aAjzK7bhpMIPGNMd3D0PZ
         FpMfyyqN8LzlvxSORyzcrRasT1ijGxxh6S8i2rwGH1aUGwSXYzCVdhCgQwtTUU5/vm+R
         Qeo4jW9AIgEXwQm3R9APkjFnVl7RWK3w/+nGhmKS0KottpUu18Xyvw8PPIezIJCucFG6
         wcl4wjETD/iqQch8uVArfsM4G2xMDJsc/BWRg5PVYiWv45gOhwy13LMfAcXVSgClrf5V
         6HuV4xCqTGRIg7XhW0rmtMA5iP9bmIz+PYLpPiJ2WAcHgrJYTinnOn66q9Zyawzz5+cR
         gXOQ==
X-Gm-Message-State: AOJu0YwZEm0wE8y8776ZX9j4z4WMvEmyM8wIpppmP15LsLbFg3qtoNmK
	lVpHDU09vRzB4z9fwgcNfiEZ0OkfS6UDInBdp3szVOiVtpaLof0CcqtFZI9Jmos9mFk=
X-Gm-Gg: Acq92OGylkshi9vd7oP8YW9WpwN7g7+CQuyAinGpA/NGO29nZJcOa+SsQIx71wnjL9C
	FeJ+Zjophqyrt/wDGOuctGqz2xPjIZkoIQCWubSz/jxAyq8MazxfZtslF5ufhkFNy9eyqfzcXzG
	LqHBysY3TH4ooj1bWSGQsdvqq49pZUdb9ygbh6e5mrloL/NBHy/mW+nSJXTyS3rsDl6YS6h5PjY
	ufLhJiTJTMZpEIjKMyOH+ZDkTieyq8tF9Q1VvsfTV3H8f6ZqN4xr15bah/G5W5f2O9lCYb12Dtw
	tBmiw0EVaXQr+orBTVWbL8j6nku+bMJzrWcStGFBqA+m0tPuX5zCBf1Iyp4rwm5oV4V9VtT8cy6
	y72I1lQGeEnf03m8JxlBrjZ6YGqvsgbP5mP3TJT3gSvKeZcVxdM/r4b1tlEHxaG5ym2b0nIM0E2
	9yL6Bsd1j0UTy6rc7sUVRzUCP0uAE7+GEkSPnHziw308PSWyPhaJVmoZua7eGhbQ+6i1rRaZwwh
	cuuqOnk12TrIr/2zuojlm5mNJn6KujEDOBDQb/dZG/FxpgUxeIfbrai2KNFPVYOwTOvoCLJYybO
	BN+Oj9RtZNQ3j9OHyQ==
X-Received: by 2002:a05:7300:cc15:b0:2f8:1f2b:bb5d with SMTP id 5a478bee46e88-3039867e93emr5064378eec.25.1779062395847;
        Sun, 17 May 2026 16:59:55 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb9ef5sm17803400c88.2.2026.05.17.16.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 16:59:55 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>
Subject: [PATCH] ARM: PCI: expand single-line pci_common_init() wrapper function
Date: Sun, 17 May 2026 16:59:11 -0700
Message-ID: <20260517235916.57178-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_165956_872724_F343A39B 
X-CRM114-Status: GOOD (  16.39  )
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

pci_common_init() is a compatibility wrapper that simply calls
pci_common_init_dev() with an additional NULL argument. The comment
above it implies that it should be replaced by pci_common_init_dev(),
but that has never happened - there are no callers of
pci_common_init_dev() in the kernel. Make the PCI code more
straightforward by updating all uses of pci_common_init() to instead
call pci_common_init_dev() with a NULL first argument and removing
pci_common_init().

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/include/asm/mach/pci.h                | 9 ---------
 arch/arm/mach-dove/pcie.c                      | 2 +-
 arch/arm/mach-footbridge/ebsa285-pci.c         | 2 +-
 arch/arm/mach-footbridge/netwinder-pci.c       | 2 +-
 arch/arm/mach-mv78xx0/pcie.c                   | 2 +-
 arch/arm/mach-orion5x/board-mss2.c             | 2 +-
 arch/arm/mach-orion5x/board-rd88f5182.c        | 2 +-
 arch/arm/mach-orion5x/dns323-setup.c           | 2 +-
 arch/arm/mach-orion5x/kurobox_pro-setup.c      | 2 +-
 arch/arm/mach-orion5x/terastation_pro2-setup.c | 2 +-
 arch/arm/mach-orion5x/ts209-setup.c            | 2 +-
 arch/arm/mach-orion5x/ts409-setup.c            | 2 +-
 12 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/arch/arm/include/asm/mach/pci.h b/arch/arm/include/asm/mach/pci.h
index ea9bd08895b7..caad50f64a9c 100644
--- a/arch/arm/include/asm/mach/pci.h
+++ b/arch/arm/include/asm/mach/pci.h
@@ -52,15 +52,6 @@ struct pci_sys_data {
  */
 void pci_common_init_dev(struct device *, struct hw_pci *);
 
-/*
- * Compatibility wrapper for older platforms that do not care about
- * passing the parent device.
- */
-static inline void pci_common_init(struct hw_pci *hw)
-{
-	pci_common_init_dev(NULL, hw);
-}
-
 /*
  * Setup early fixed I/O mapping.
  */
diff --git a/arch/arm/mach-dove/pcie.c b/arch/arm/mach-dove/pcie.c
index 3044b7e03890..f990836409f4 100644
--- a/arch/arm/mach-dove/pcie.c
+++ b/arch/arm/mach-dove/pcie.c
@@ -222,5 +222,5 @@ void __init dove_pcie_init(int init_port0, int init_port1)
 	if (init_port1)
 		add_pcie_port(1, DOVE_PCIE1_VIRT_BASE);
 
-	pci_common_init(&dove_pci);
+	pci_common_init_dev(NULL, &dove_pci);
 }
diff --git a/arch/arm/mach-footbridge/ebsa285-pci.c b/arch/arm/mach-footbridge/ebsa285-pci.c
index c3f280d08fa7..93078a031383 100644
--- a/arch/arm/mach-footbridge/ebsa285-pci.c
+++ b/arch/arm/mach-footbridge/ebsa285-pci.c
@@ -41,7 +41,7 @@ static struct hw_pci ebsa285_pci __initdata = {
 static int __init ebsa285_init_pci(void)
 {
 	if (machine_is_ebsa285())
-		pci_common_init(&ebsa285_pci);
+		pci_common_init_dev(NULL, &ebsa285_pci);
 	return 0;
 }
 
diff --git a/arch/arm/mach-footbridge/netwinder-pci.c b/arch/arm/mach-footbridge/netwinder-pci.c
index e8304392074b..5fc0023f988f 100644
--- a/arch/arm/mach-footbridge/netwinder-pci.c
+++ b/arch/arm/mach-footbridge/netwinder-pci.c
@@ -55,7 +55,7 @@ static struct hw_pci netwinder_pci __initdata = {
 static int __init netwinder_pci_init(void)
 {
 	if (machine_is_netwinder())
-		pci_common_init(&netwinder_pci);
+		pci_common_init_dev(NULL, &netwinder_pci);
 	return 0;
 }
 
diff --git a/arch/arm/mach-mv78xx0/pcie.c b/arch/arm/mach-mv78xx0/pcie.c
index 533cb7856943..9cca6841644e 100644
--- a/arch/arm/mach-mv78xx0/pcie.c
+++ b/arch/arm/mach-mv78xx0/pcie.c
@@ -276,5 +276,5 @@ void __init mv78xx0_pcie_init(int init_port0, int init_port1)
 		}
 	}
 
-	pci_common_init(&mv78xx0_pci);
+	pci_common_init_dev(NULL, &mv78xx0_pci);
 }
diff --git a/arch/arm/mach-orion5x/board-mss2.c b/arch/arm/mach-orion5x/board-mss2.c
index 9e3d69891d2f..aad8d088f839 100644
--- a/arch/arm/mach-orion5x/board-mss2.c
+++ b/arch/arm/mach-orion5x/board-mss2.c
@@ -48,7 +48,7 @@ static struct hw_pci mss2_pci __initdata = {
 static int __init mss2_pci_init(void)
 {
 	if (machine_is_mss2())
-		pci_common_init(&mss2_pci);
+		pci_common_init_dev(NULL, &mss2_pci);
 
 	return 0;
 }
diff --git a/arch/arm/mach-orion5x/board-rd88f5182.c b/arch/arm/mach-orion5x/board-rd88f5182.c
index 1c14e49a90a6..cee3902a95ae 100644
--- a/arch/arm/mach-orion5x/board-rd88f5182.c
+++ b/arch/arm/mach-orion5x/board-rd88f5182.c
@@ -106,7 +106,7 @@ static struct hw_pci rd88f5182_pci __initdata = {
 static int __init rd88f5182_pci_init(void)
 {
 	if (of_machine_is_compatible("marvell,rd-88f5182-nas"))
-		pci_common_init(&rd88f5182_pci);
+		pci_common_init_dev(NULL, &rd88f5182_pci);
 
 	return 0;
 }
diff --git a/arch/arm/mach-orion5x/dns323-setup.c b/arch/arm/mach-orion5x/dns323-setup.c
index fcd38ff7ca45..cdc12b4ce4c5 100644
--- a/arch/arm/mach-orion5x/dns323-setup.c
+++ b/arch/arm/mach-orion5x/dns323-setup.c
@@ -99,7 +99,7 @@ static int __init dns323_pci_init(void)
 	 * gets in the way of initialising the SATA controller.
 	 */
 	if (machine_is_dns323() && system_rev == DNS323_REV_A1)
-		pci_common_init(&dns323_pci);
+		pci_common_init_dev(NULL, &dns323_pci);
 
 	return 0;
 }
diff --git a/arch/arm/mach-orion5x/kurobox_pro-setup.c b/arch/arm/mach-orion5x/kurobox_pro-setup.c
index 339b10891808..c1791aeefeeb 100644
--- a/arch/arm/mach-orion5x/kurobox_pro-setup.c
+++ b/arch/arm/mach-orion5x/kurobox_pro-setup.c
@@ -144,7 +144,7 @@ static int __init kurobox_pro_pci_init(void)
 {
 	if (machine_is_kurobox_pro()) {
 		orion5x_pci_disable();
-		pci_common_init(&kurobox_pro_pci);
+		pci_common_init_dev(NULL, &kurobox_pro_pci);
 	}
 
 	return 0;
diff --git a/arch/arm/mach-orion5x/terastation_pro2-setup.c b/arch/arm/mach-orion5x/terastation_pro2-setup.c
index a9f01859d101..c7af30134fab 100644
--- a/arch/arm/mach-orion5x/terastation_pro2-setup.c
+++ b/arch/arm/mach-orion5x/terastation_pro2-setup.c
@@ -126,7 +126,7 @@ static struct hw_pci tsp2_pci __initdata = {
 static int __init tsp2_pci_init(void)
 {
 	if (machine_is_terastation_pro2())
-		pci_common_init(&tsp2_pci);
+		pci_common_init_dev(NULL, &tsp2_pci);
 
 	return 0;
 }
diff --git a/arch/arm/mach-orion5x/ts209-setup.c b/arch/arm/mach-orion5x/ts209-setup.c
index de9092e992c5..a2c05f039d72 100644
--- a/arch/arm/mach-orion5x/ts209-setup.c
+++ b/arch/arm/mach-orion5x/ts209-setup.c
@@ -174,7 +174,7 @@ static struct hw_pci qnap_ts209_pci __initdata = {
 static int __init qnap_ts209_pci_init(void)
 {
 	if (machine_is_ts209())
-		pci_common_init(&qnap_ts209_pci);
+		pci_common_init_dev(NULL, &qnap_ts209_pci);
 
 	return 0;
 }
diff --git a/arch/arm/mach-orion5x/ts409-setup.c b/arch/arm/mach-orion5x/ts409-setup.c
index 725688aa5cba..94e0100dee36 100644
--- a/arch/arm/mach-orion5x/ts409-setup.c
+++ b/arch/arm/mach-orion5x/ts409-setup.c
@@ -145,7 +145,7 @@ static struct hw_pci qnap_ts409_pci __initdata = {
 static int __init qnap_ts409_pci_init(void)
 {
 	if (machine_is_ts409())
-		pci_common_init(&qnap_ts409_pci);
+		pci_common_init_dev(NULL, &qnap_ts409_pci);
 
 	return 0;
 }
-- 
2.43.0


