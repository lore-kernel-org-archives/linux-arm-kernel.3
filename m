Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581F1CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 03:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FE6EHf03d4dnv42rEQZEa8qv7T8PBVFGaXhCr/Cav0=; b=o1UePVjrQX6Cp+/N3RNsQOOqYc
	SBRSSAQ7yw124flsnhQ7nCrmkLQatCi7dZ2oZTJTBb2fuVq34jMGULU72Hy3NgJSjpXt2n2eC1mGt
	HnW/gzB3MZgtrZnTwPlSyiPlLhmsjGurZSxQXpKzgy7uOLNzQMVGiOmSGJill3ncO+FPYUaIDu3gR
	hgD3rQ4W5crLOCmJBW1T1b3GqMgE/c3BEdPTEg7PLlZIze8l0jkTCKZgSYo7mLmjN9OP4L0GIiW59
	C8sl3/zj5HBAnGc4RW9FAC7uGLxUBHbcODOfuTTUDOyVwLmiKZZMWjaCdJhOlljuAf6xMAky1q2cX
	8uhsvbeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow7r-0000000FdyU-2tME;
	Thu, 21 Aug 2025 03:38:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uotRC-0000000FKYI-33ko
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 00:45:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E75812FC;
	Wed, 20 Aug 2025 17:45:46 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6AF953F63F;
	Wed, 20 Aug 2025 17:45:52 -0700 (PDT)
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
Subject: [RFC PATCH 6/9] pinctrl: sunxi: add support for set/clear regs
Date: Thu, 21 Aug 2025 01:42:29 +0100
Message-ID: <20250821004232.8134-7-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250821004232.8134-1-andre.przywara@arm.com>
References: <20250821004232.8134-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_174554_848625_BEA02516 
X-CRM114-Status: GOOD (  18.26  )
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

The Allwinner pinctrl/GPIO IP so far features just a single GPIO data
register, which holds the logic level for every output pin on each port.
To set or clear the level of a single pin, we need to do a
read/modify/write operation, which needs to be protected by a lock.

The new pinctrl IP introduced with the Allwinner A733 now supports two
extra registers, the value of which will be ORed in respectively NANDed
out from the current value when being written. This allows for lockless
single writes to set or clear GPIO pins.

Add support for this feature to the sunxi pinctrl code, by adding a quirk
bit and checking this when writing to the data register. If the new
registers are available, skip the lock and read/modify/write operation,
and just write the mask directly to the respective register.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 27 +++++++++++++++------------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  3 +++
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index ff7c5439a458e..0d08c48b57b65 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -971,18 +971,21 @@ static int sunxi_pinctrl_gpio_set(struct gpio_chip *chip, unsigned int offset,
 
 	sunxi_data_reg(pctl, offset, &reg, &shift, &mask);
 
-	raw_spin_lock_irqsave(&pctl->lock, flags);
-
-	val = readl(pctl->membase + reg);
-
-	if (value)
-		val |= mask;
-	else
-		val &= ~mask;
-
-	writel(val, pctl->membase + reg);
-
-	raw_spin_unlock_irqrestore(&pctl->lock, flags);
+	if (pctl->flags & SUNXI_PINCTRL_HAS_SET_CLEAR_REGS) {
+		if (value)
+			writel(mask, pctl->membase + reg + DATA_SET_OFFSET);
+		else
+			writel(mask, pctl->membase + reg + DATA_CLR_OFFSET);
+	} else {
+		raw_spin_lock_irqsave(&pctl->lock, flags);
+		val = readl(pctl->membase + reg);
+		if (value)
+			val |= mask;
+		else
+			val &= ~mask;
+		writel(val, pctl->membase + reg);
+		raw_spin_unlock_irqrestore(&pctl->lock, flags);
+	}
 
 	return 0;
 }
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 2b9e93972a5d3..96f1cb9d6c89c 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -43,6 +43,8 @@
 #define MUX_REGS_OFFSET		0x0
 #define MUX_FIELD_WIDTH		4
 #define DATA_REGS_OFFSET	0x10
+#define DATA_SET_OFFSET			0x04
+#define DATA_CLR_OFFSET			0x08
 #define DATA_FIELD_WIDTH	1
 #define DLEVEL_REGS_OFFSET	0x14
 #define DLEVEL_FIELD_WIDTH	2
@@ -99,6 +101,7 @@
 #define SUNXI_PINCTRL_PORTF_SWITCH	BIT(9)
 #define SUNXI_PINCTRL_ELEVEN_BANKS	BIT(10)
 #define SUNXI_PINCTRL_NCAT3_REG_LAYOUT	BIT(11)
+#define SUNXI_PINCTRL_HAS_SET_CLEAR_REGS	BIT(12)
 
 #define PIO_NCAT3_POW_MOD_SEL_REG	0x040
 #define PIO_POW_MOD_SEL_REG		0x340
-- 
2.46.3


