Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A74C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 00:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I84Q8tFj/5hdwbXKS7CoYAvhQlFojmyaJjpO8Q/d9UA=; b=N8jyHEGJ7XUrA8ysAqH/vreWOv
	37rBebMi+rym7gNidILafHQOaiOWaoNnsjZ3FERZ452ocJnhUbwchhkqU2OH1BX3DHUPoRih45DTk
	p9cNqdF03zl/OmQ1+Nn8VQHhYNJXsUcQ+flNftmcTaIbXYUMRX8tjX/CFmn4HCl2vHkGNCSLGKKsz
	xhYPgZMiIxQdLQiJXDOUnqSWqyKbjoyMvGyHcEB9xMdWBiqw3gqNUcUlYLJeMzBg9oguUbSCyhYY5
	KnoFEl1x3ymnhut/ItDpRsYeAs3tJaKXloND2eqNX8ectqgexSvWM2kQcSU7na5l39sMVzCCqpLC6
	R+NT3wyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqLEs-0000000CZzh-3ALM;
	Fri, 07 Mar 2025 00:06:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqL6z-0000000CYLu-0Myu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 23:58:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAD8C2103;
	Thu,  6 Mar 2025 15:58:54 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CC823F673;
	Thu,  6 Mar 2025 15:58:40 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/8] pinctrl: sunxi: move bank K register offset
Date: Thu,  6 Mar 2025 23:58:22 +0000
Message-ID: <20250306235827.4895-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250306235827.4895-1-andre.przywara@arm.com>
References: <20250306235827.4895-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_155845_220017_B04A22D6 
X-CRM114-Status: GOOD (  17.82  )
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

The Allwinner pincontroller register layout used to allow for at least
11 banks per controller, any more banks would reside at a second
controller instance.
When the per-bank register map size was increased with the D1, it turned
out that the last bank (port K) of those maximum 11 banks actually would
not fit anymore in the 512 bytes reserved for the pincontroller registers.
On new SoCs Allwinner thus moved the last bank beyond the existing
registers, at offset 0x500.

So far SoCs never used more than 9 banks per controller, but the new
Allwinner A523 actually uses all 11 banks. Since that SoC also uses the
extended layout, its PortK needs to be programmed at offset 0x500.

Factor out the bank offset calculation into a new function, and handle
the case for the last bank separately. Since none of the older SoCs ever
used PortK, we can ignore this case, and just always use offset 0x500
for the last bank.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 29 +++++++++++++++++++--------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  4 ++++
 2 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index ae281a3c2ed34..83a031ceb29f2 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -58,13 +58,29 @@ static struct irq_chip sunxi_pinctrl_level_irq_chip;
  * The following functions calculate the register and the bit offset to access.
  * They take a pin number which is relative to the start of the current device.
  */
+
+/*
+ * When using the extended register layout, Bank K does not fit into the
+ * space used for the other banks. Instead it lives at offset 0x500.
+ */
+static u32 sunxi_bank_offset(const struct sunxi_pinctrl *pctl, u32 pin)
+{
+	u32 offset = 0;
+
+	if (pin >= PK_BASE) {
+		pin -= PK_BASE;
+		offset = PIO_BANK_K_OFFSET;
+	}
+
+	return offset + (pin / PINS_PER_BANK) * pctl->bank_mem_size;
+}
+
 static void sunxi_mux_reg(const struct sunxi_pinctrl *pctl,
 			  u32 pin, u32 *reg, u32 *shift, u32 *mask)
 {
-	u32 bank   = pin / PINS_PER_BANK;
 	u32 offset = pin % PINS_PER_BANK * MUX_FIELD_WIDTH;
 
-	*reg   = bank * pctl->bank_mem_size + MUX_REGS_OFFSET +
+	*reg   = sunxi_bank_offset(pctl, pin) + MUX_REGS_OFFSET +
 		 offset / BITS_PER_TYPE(u32) * sizeof(u32);
 	*shift = offset % BITS_PER_TYPE(u32);
 	*mask  = (BIT(MUX_FIELD_WIDTH) - 1) << *shift;
@@ -73,10 +89,9 @@ static void sunxi_mux_reg(const struct sunxi_pinctrl *pctl,
 static void sunxi_data_reg(const struct sunxi_pinctrl *pctl,
 			   u32 pin, u32 *reg, u32 *shift, u32 *mask)
 {
-	u32 bank   = pin / PINS_PER_BANK;
 	u32 offset = pin % PINS_PER_BANK * DATA_FIELD_WIDTH;
 
-	*reg   = bank * pctl->bank_mem_size + DATA_REGS_OFFSET +
+	*reg   = sunxi_bank_offset(pctl, pin) + DATA_REGS_OFFSET +
 		 offset / BITS_PER_TYPE(u32) * sizeof(u32);
 	*shift = offset % BITS_PER_TYPE(u32);
 	*mask  = (BIT(DATA_FIELD_WIDTH) - 1) << *shift;
@@ -85,10 +100,9 @@ static void sunxi_data_reg(const struct sunxi_pinctrl *pctl,
 static void sunxi_dlevel_reg(const struct sunxi_pinctrl *pctl,
 			     u32 pin, u32 *reg, u32 *shift, u32 *mask)
 {
-	u32 bank   = pin / PINS_PER_BANK;
 	u32 offset = pin % PINS_PER_BANK * pctl->dlevel_field_width;
 
-	*reg   = bank * pctl->bank_mem_size + DLEVEL_REGS_OFFSET +
+	*reg   = sunxi_bank_offset(pctl, pin) + DLEVEL_REGS_OFFSET +
 		 offset / BITS_PER_TYPE(u32) * sizeof(u32);
 	*shift = offset % BITS_PER_TYPE(u32);
 	*mask  = (BIT(pctl->dlevel_field_width) - 1) << *shift;
@@ -97,10 +111,9 @@ static void sunxi_dlevel_reg(const struct sunxi_pinctrl *pctl,
 static void sunxi_pull_reg(const struct sunxi_pinctrl *pctl,
 			   u32 pin, u32 *reg, u32 *shift, u32 *mask)
 {
-	u32 bank   = pin / PINS_PER_BANK;
 	u32 offset = pin % PINS_PER_BANK * PULL_FIELD_WIDTH;
 
-	*reg   = bank * pctl->bank_mem_size + pctl->pull_regs_offset +
+	*reg   = sunxi_bank_offset(pctl, pin) + pctl->pull_regs_offset +
 		 offset / BITS_PER_TYPE(u32) * sizeof(u32);
 	*shift = offset % BITS_PER_TYPE(u32);
 	*mask  = (BIT(PULL_FIELD_WIDTH) - 1) << *shift;
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index fbbf070a87542..6cf721876d89d 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -25,6 +25,8 @@
 #define PG_BASE	192
 #define PH_BASE	224
 #define PI_BASE	256
+#define PJ_BASE	288
+#define PK_BASE	320
 #define PL_BASE	352
 #define PM_BASE	384
 #define PN_BASE	416
@@ -89,6 +91,8 @@
 #define PIO_POW_MOD_SEL_REG	0x340
 #define PIO_POW_MOD_CTL_REG	0x344
 
+#define PIO_BANK_K_OFFSET		0x500
+
 enum sunxi_desc_bias_voltage {
 	BIAS_VOLTAGE_NONE,
 	/*
-- 
2.46.3


