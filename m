Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716A5CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7xhxHbGK6ZztdBWb0pqhgV5oa0fD8oyXHXsLeb4c66M=; b=aPPO1CF25oSHQa12SDSIW+Lzcj
	e4b+4xCt2px0o1m2/cfOm/ZfboLTOPQQCxXHHBqcnsjoIJ1OoqtB3423aC9dTSS3Js26jummsAQ0W
	z+fYw3E4yKZzhjFoI7l2ap/B4NCew9pBT/dAwG9AM+uq8hHmUY9t0jArITGemwmicTGkKwjIG2eSG
	6f5rlxQjQdMayXyhf7d7pWT7CejjAe+BCl01Och/xv57qbF+l6KPohFzvztdf5mgZhx2Xl/4BcSUy
	iKw8W25E2LTJGgiL2B1ouq6XQUrOBAthV4A7ve6IiNJ8QR17eWEq5ocFUHo8s1CsaZRsVB2ou6Lsq
	qQ5ZgRJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnEa-0000000FL0q-313E;
	Wed, 03 Jun 2026 15:10:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnEZ-0000000FL09-0zyF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:10:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 45424601DD;
	Wed,  3 Jun 2026 15:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF011F00893;
	Wed,  3 Jun 2026 15:10:16 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: rcar-gen2: Use of_machine_compatible_match() helper
Date: Wed,  3 Jun 2026 17:10:14 +0200
Message-ID: <2230eb28da9b8d8bdee4e4fd7e19dc8f074531bc.1780499233.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Replace sequences of of_machine_is_compatible() calls by single calls to
the of_machine_compatible_match() helper, to simplify the code, and to
reduce code size.

Note that this does have a slight performance impact on matching
platforms: while the C sequences terminated evaluation after a match,
(internal) of_device_compatible_match() calculates a matching score, and
thus always checks against all passed compatible values.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v7.3.

 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 10 +++++-----
 arch/arm/mach-shmobile/setup-rcar-gen2.c           |  9 +++++----
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
index 747a96c58df15075..647e5f9f6aa8ba40 100644
--- a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
@@ -140,6 +140,10 @@ static struct notifier_block regulator_quirk_nb = {
 
 static int __init rcar_gen2_regulator_quirk(void)
 {
+	static const char *const boards[] __initconst = {
+		"renesas,koelsch", "renesas,lager", "renesas,porter",
+		"renesas,stout", "renesas,gose", NULL
+	};
 	struct regulator_quirk *quirk, *pos, *tmp;
 	struct of_phandle_args *args;
 	const struct of_device_id *id;
@@ -147,11 +151,7 @@ static int __init rcar_gen2_regulator_quirk(void)
 	u32 mon, addr;
 	int ret;
 
-	if (!of_machine_is_compatible("renesas,koelsch") &&
-	    !of_machine_is_compatible("renesas,lager") &&
-	    !of_machine_is_compatible("renesas,porter") &&
-	    !of_machine_is_compatible("renesas,stout") &&
-	    !of_machine_is_compatible("renesas,gose"))
+	if (!of_machine_compatible_match(boards))
 		return -ENODEV;
 
 	for_each_matching_node_and_match(np, rcar_gen2_quirk_match, &id) {
diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
index 3cd34a42e39bb1d7..5145589059191a96 100644
--- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
@@ -56,6 +56,10 @@ static unsigned int __init get_extal_freq(void)
 
 static void __init rcar_gen2_timer_init(void)
 {
+	static const char *const fixed_freq_socs[] __initconst = {
+		"renesas,r8a7745", "renesas,r8a77470", "renesas,r8a7792",
+		"renesas,r8a7794", NULL
+	};
 	bool need_update = true;
 	void __iomem *base;
 	u32 freq;
@@ -76,10 +80,7 @@ static void __init rcar_gen2_timer_init(void)
 
 	secure_cntvoff_init();
 
-	if (of_machine_is_compatible("renesas,r8a7745") ||
-	    of_machine_is_compatible("renesas,r8a77470") ||
-	    of_machine_is_compatible("renesas,r8a7792") ||
-	    of_machine_is_compatible("renesas,r8a7794")) {
+	if (of_machine_compatible_match(fixed_freq_socs)) {
 		freq = 260000000 / 8;	/* ZS / 8 */
 	} else {
 		/* At Linux boot time the r8a7790 arch timer comes up
-- 
2.43.0


