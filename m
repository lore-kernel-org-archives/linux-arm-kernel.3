Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01579CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 03:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/yj8V5UqS/5iIEMEVjqHpk+FkeeteV1a4+bzZZ6nSk=; b=eICz/uyQPitE2w9fujLDxADcA7
	M1qntkooA6H+VycbWxqNqPuNadyc1h1VkitDB8FIXWkZCCXcG5TflmJVsL05wTKX9JU6LVFqon7b0
	JODHDhEYwIVJPtA/pXLvbgEzsOtQHXrwZoVf7scEoAvHLFyiCyQNY90T3nGE2HlGKZeK6pIFag8jx
	/0fJrMEYAEId/fZEQSszjkxRkOK84klbky6/QP2jcn06yiCSUt2HVgYuI7DooiXAjPCN9uQhh2olw
	ae1dPYFlAZoZeAAvux5PaUDbhyd7QGN6RhTPrj/qxJQP+S5ZcjcdjQHO8lOT+9FD2gY9NXQ930TQy
	kR6BF0UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow7l-0000000Fdmw-0cWs;
	Thu, 21 Aug 2025 03:38:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uotR5-0000000FKUk-0cLq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 00:45:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFC8C1F37;
	Wed, 20 Aug 2025 17:45:34 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2996A3F63F;
	Wed, 20 Aug 2025 17:45:41 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [RFC PATCH 1/9] pinctrl: sunxi: rename SUNXI_PINCTRL_NEW_REG_LAYOUT
Date: Thu, 21 Aug 2025 01:42:24 +0100
Message-ID: <20250821004232.8134-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250821004232.8134-1-andre.przywara@arm.com>
References: <20250821004232.8134-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_174547_313639_9BD0BE03 
X-CRM114-Status: GOOD (  15.99  )
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

After keeping the pinctrl IP mostly register compatible for almost a
decade, in 2021 Allwinner introduced some changes to the register
layout, which made us use a flag called SUNXI_PINCTRL_NEW_REG_LAYOUT.
Now with their latest SoC (A733), Allwinner changed the pinctrl IP
again, so "NEW" isn't really a fitting name anymore.

Rename the symbol to SUNXI_PINCTRL_NCAT2_REG_LAYOUT, with "NCAT2" being
a name often used in vendor source code to signify this "new" generation
of SoCs.

Just a rename of the symbol, no actual code changes.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c     | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c b/drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c
index 8efe35b77af4d..37a60e5d1163b 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c
@@ -821,7 +821,7 @@ static const struct sunxi_pinctrl_desc d1_pinctrl_data = {
 static int d1_pinctrl_probe(struct platform_device *pdev)
 {
 	return sunxi_pinctrl_init_with_flags(pdev, &d1_pinctrl_data,
-					     SUNXI_PINCTRL_NEW_REG_LAYOUT);
+					     SUNXI_PINCTRL_NCAT2_REG_LAYOUT);
 }
 
 static const struct of_device_id d1_pinctrl_match[] = {
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
index 69cd2b4ebd7d7..86a12bce0e335 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
@@ -36,7 +36,7 @@ static int a523_r_pinctrl_probe(struct platform_device *pdev)
 	return sunxi_pinctrl_dt_table_init(pdev, a523_r_nr_bank_pins,
 					   a523_r_irq_bank_muxes,
 					   &a523_r_pinctrl_data,
-					   SUNXI_PINCTRL_NEW_REG_LAYOUT);
+					   SUNXI_PINCTRL_NCAT2_REG_LAYOUT);
 }
 
 static const struct of_device_id a523_r_pinctrl_match[] = {
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
index 7d2308c37d29e..0f703cacfe5e3 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
@@ -35,7 +35,7 @@ static int a523_pinctrl_probe(struct platform_device *pdev)
 	return sunxi_pinctrl_dt_table_init(pdev, a523_nr_bank_pins,
 					   a523_irq_bank_muxes,
 					   &a523_pinctrl_data,
-					   SUNXI_PINCTRL_NEW_REG_LAYOUT |
+					   SUNXI_PINCTRL_NCAT2_REG_LAYOUT |
 					   SUNXI_PINCTRL_ELEVEN_BANKS);
 }
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 0fb057a07dccb..0a5acbd978da9 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -1521,7 +1521,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 	pctl->dev = &pdev->dev;
 	pctl->desc = desc;
 	pctl->variant = flags & SUNXI_PINCTRL_VARIANT_MASK;
-	if (flags & SUNXI_PINCTRL_NEW_REG_LAYOUT) {
+	if (flags & SUNXI_PINCTRL_NCAT2_REG_LAYOUT) {
 		pctl->bank_mem_size = D1_BANK_MEM_SIZE;
 		pctl->pull_regs_offset = D1_PULL_REGS_OFFSET;
 		pctl->dlevel_field_width = D1_DLEVEL_FIELD_WIDTH;
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index ad26e4de16a85..fb17fae2dab69 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -88,7 +88,7 @@
 #define SUN4I_FUNC_IRQ		6
 
 #define SUNXI_PINCTRL_VARIANT_MASK	GENMASK(7, 0)
-#define SUNXI_PINCTRL_NEW_REG_LAYOUT	BIT(8)
+#define SUNXI_PINCTRL_NCAT2_REG_LAYOUT	BIT(8)
 #define SUNXI_PINCTRL_PORTF_SWITCH	BIT(9)
 #define SUNXI_PINCTRL_ELEVEN_BANKS	BIT(10)
 
-- 
2.46.3


