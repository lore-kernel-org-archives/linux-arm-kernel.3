Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1A6CA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 18:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nd4AtQBT76nHZ3omEOk4hVxLdCylSGw0mBdnNv1wzzw=; b=zV6+gpik3otA0kso5NbRjV110q
	MfkBK+OkPQ6TVxclOw+Eu/x/rUcPqJyh9WpyaNmK4F4xHubmacJ89I0OVI1jPWMUwRgV8VWjtzfJq
	swG2sgkuzL9FHMpCIsw5KuR8wMp43W9L7hDAbVpb6ihwSSlewQsf+sN4Ygud9PBJn+YcZo5l5/wgY
	i2lf/CF85sNX5jlyeWUs85y+WBoPgQI0F78e8jC8id8mW0IL9jlFYpBuahAVWk/c/GFP/syXdVrG0
	nd3lTkNmURSe+2/Fw4HTtm4lubDwuoIgbZlRv08t+MKhDyLW5fZxh+9dyarP20+X8flfypUQgSfko
	+kM9P3cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKyE-0000000BGcv-0Ams;
	Mon, 12 Oct 2026 18:41:58 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKy8-0000000BGam-3H7w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 18:41:53 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-990256a0d4cso783921241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 11:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791830511; x=1792435311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nd4AtQBT76nHZ3omEOk4hVxLdCylSGw0mBdnNv1wzzw=;
        b=dm+kCDgLBbERMQhxCWJOoExLIutHXSnkkWUGEOSAaCmOqodAEPRDEufclpV3zoRLpj
         iA3wkulz0FS+LzgitYyz4DRwRTc1Qo5Qs2hI8cdzFgq/1esRhGl7N1Yk98uGbqjg8vOX
         HfgBsJkNZK2ieaWRtCst08CIhO2qJJEA0mZ8CASTKzMm6YGJ2BkCatxJVCnuK2RYRs5X
         hYAlHtzPfJb24km5fOgtRcMKZuaAzm3VT+HGSdQaXP2WRmi4c8h6Tq8+eQEy7EVGsEEK
         AmY8Z4Yadn6WN4eVEcArPCmULQJLUGvG1k/xtxeDMxBoFOdvtgtmlysMzUPNa5uGGHPy
         Ytnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791830511; x=1792435311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nd4AtQBT76nHZ3omEOk4hVxLdCylSGw0mBdnNv1wzzw=;
        b=odv+eT1Xgkt5VBRJzuc/uMZPItNL/P2Z/knVY7W8NaK8FkK6C8eRNBUdhcfUWnctPf
         JfarRcPH+8STHqKYV1PB1lvhFoQROWM15/rLSyL9AgCjmJ8TpYaTjT4RO06lbCHgWcw6
         FxyGd/U3OO1IC1uz1kwvdJDLpElGXlkjEqaw4b/HKZuaOhc1xuJjetJ4UwCMDCQpI7p9
         5RVuie9BrqC9YGMz+ZHLohSfNAy8HT3RmfEiaeFRtqCI8W3cbJ50hFLjSg6NdAw/Ld8D
         W510jrqgZvlc94pUlkm6cSITwZWE5x+8eBOwgyS6bEg4WiX/8tmnQGpCZZSwN5i9NKnH
         nMiQ==
X-Forwarded-Encrypted: i=1; AKwUvBypvq3YX57LE06aYIV8sYyWINFi8MkLGuXVY5idvfxt7z5ylEY1bCwWrP2slAXS6LPWT9wYkM2ExmqghTPHkFLz@lists.infradead.org
X-Gm-Message-State: AFq9FYJ00zFS167AWf7iMFvXkfmLoRNPhf9THRSiWjxo/nRxjsKCmYPr
	ZERBzJlbj5zK8R1c20RBXh1vrKzuI5RmXZPkg46rtB9jDlFxQsD3eVg/
X-Gm-Gg: AYBFou0Pep60iu6wvw44FQ07xo9zFZ/o22gXJ8eUIxapXgsP2YANR/CrnwY+kH/HXJf
	vNC0OeSet6YeUCkoS83Z8jHbqhqubvYKrniv5E4XR0tnP1tfT0swu/pD6w1QCRGzFXKMNRDHIGn
	A6p3bhG96gsEcXbVPsPO30OqhH5mx9LRt4AUVsdnznS1KGoiN+lajwZIdQKrsFlpoLcYDziuNK2
	DZjk9FfCqzEfbTCoeagy+G7Xwgh9dajS0FDyuZukv/quWXj04hbnCDi6McijaQquxtKLaO/FkzM
	iHgDPlptuRxS3fQZ1B8gC2u5Vh9DsWWtE1RvtzJDXRaTUPg5/Cs9edcDvsCYs/dMGHHo6t+lKm7
	ttlG+MP7FzgPYIIqgZmYoeXoWRnvD9+55jnmp76lWX3A66ceZIjGHvPI33dqYa95pepnfwnZp0N
	mO2Q05aGtJpLFmfB/sgTzQk/FTTwuV98hm9rdrYfepi+Z/5qNEX7Ad7QtUqweY9MnuPPPCea33u
	s3KSp8fVxB36hT0ISfIoL820TLXVyzaGjEQRMk5dNaEmh5lo6cKncL/HP1w0xs8El2QMpZnlyhZ
	TxQ+Sck=
X-Received: by 2002:a05:6102:5cc7:b0:7a7:198b:6748 with SMTP id ada2fe7eead31-7cb3735ff5cmr3147159137.29.1791830511319;
        Mon, 12 Oct 2026 11:41:51 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.244.163])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003f230b8sm6830180241.8.2026.10.12.11.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:41:50 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linusw@kernel.org
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andre.przywara@arm.com,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: sunxi: a733: program the two-bit I/O voltage fields
Date: Mon, 12 Oct 2026 15:41:28 -0300
Message-ID: <20261012184130.548261-2-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_114152_840690_C74FB6B5 
X-CRM114-Status: GOOD (  23.50  )
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

The A733 GPIO_POW_MOD_SEL register has a two-bit field per bank, but
the A733 uses the helper written for one bit per bank, so a request
for one bank can change the field of another one. With the register
as firmware leaves it on a Radxa Cubie A7Z (the fields of PB, PC, PD,
PE, PG, PH, PJ and PK in automatic mode, 0x01155550), a PJ request at
1.8 V turns the PE field into fixed 1.8 V (0x01155750).

Add a variant that takes the field of each bank from a mask table. It
keeps automatic mode and a fixed 3.3 V mode that already fits, and
writes only the field of the requested bank. PF is left out: its field
(11:10) is known, but it is tied to the MMC vqmmc voltage switching.
PI is left out as well, since its supply domain is not documented.
Only silicon revision B, as reported through SMCCC, is programmed,
since the encoding is documented for that revision only.

Computed with both helpers on that register value, the old one changes
it and the new one leaves it as it is.

Fixes: 0535bfbfa97b ("pinctrl: sunxi: add support for the Allwinner A733")
Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c | 15 +++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c       | 57 +++++++++++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.h       |  6 +++
 3 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
index ca82f08a3a65..6f5757b8adea 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -21,10 +21,23 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
 	{  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
 
+/* PA is not implemented. PF and PI are left to the firmware, so are not listed. */
+static const u32 a733_io_bias_masks[SUNXI_PINCTRL_MAX_BANKS] = {
+	[1] = GENMASK(25, 24),	/* PB, VCC-IO */
+	[2] = GENMASK(5, 4),	/* PC */
+	[3] = GENMASK(7, 6),	/* PD */
+	[4] = GENMASK(9, 8),	/* PE */
+	[6] = GENMASK(13, 12),	/* PG */
+	[7] = GENMASK(15, 14),	/* PH */
+	[9] = GENMASK(19, 18),	/* PJ */
+	[10] = GENMASK(21, 20),	/* PK */
+};
+
 static struct sunxi_pinctrl_desc a733_pinctrl_data = {
 	.irq_banks = 10,
 	.irq_read_needs_mux = true,
-	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL_2BIT,
+	.io_bias_masks = a733_io_bias_masks,
 };
 
 static int a733_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 3ee5012463da..8e62111d3409 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -10,6 +10,8 @@
  * warranty of any kind, whether express or implied.
  */
 
+#include <linux/arm-smccc.h>
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/export.h>
 #include <linux/gpio/driver.h>
@@ -722,6 +724,58 @@ static const struct pinconf_ops sunxi_pconf_ops = {
 	.pin_config_group_set	= sunxi_pconf_group_set,
 };
 
+/*
+ * The two-bit encoding is documented for A733 silicon revision B, which
+ * firmware reports through the SMCCC SOC_ID call. Do not assume it for any
+ * other revision, or when the firmware does not tell.
+ */
+#define SUNXI_A733_SOC_ID		0x091e1903
+#define SUNXI_A733_REV_B		1
+
+static bool sunxi_pinctrl_a733_rev_b(void)
+{
+#ifdef CONFIG_HAVE_ARM_SMCCC_DISCOVERY
+	s32 id = arm_smccc_get_soc_id_version();
+
+	/* Bit 23 is the JEP106 parity bit. */
+	return id >= 0 && (id & ~BIT(23)) == SUNXI_A733_SOC_ID &&
+	       arm_smccc_get_soc_id_revision() == SUNXI_A733_REV_B;
+#else
+	return false;
+#endif
+}
+
+/*
+ * Fields: 0 and 2 fixed 3.3V, 1 automatic, 3 fixed 1.8V. Leave automatic
+ * mode and any other supply voltage to the firmware, and touch only the
+ * field of this bank.
+ */
+static void sunxi_pinctrl_set_io_bias_2bit(struct sunxi_pinctrl *pctl,
+					   unsigned int bank, int uV)
+{
+	u32 mask = pctl->desc->io_bias_masks[bank];
+	unsigned long flags;
+	u32 val, cur, reg;
+
+	if (!mask || !sunxi_pinctrl_a733_rev_b())
+		return;
+
+	if (uV >= 1620000 && uV <= 1980000)
+		val = 3;
+	else if (uV >= 2970000 && uV <= 3630000)
+		val = 2;
+	else
+		return;
+
+	raw_spin_lock_irqsave(&pctl->lock, flags);
+	reg = readl(pctl->membase + pctl->pow_mod_sel_offset);
+	cur = field_get(mask, reg);
+	if (cur != 1 && cur != val && !(val == 2 && cur == 0))
+		writel((reg & ~mask) | field_prep(mask, val),
+		       pctl->membase + pctl->pow_mod_sel_offset);
+	raw_spin_unlock_irqrestore(&pctl->lock, flags);
+}
+
 static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 					 unsigned pin,
 					 struct regulator *supply)
@@ -795,6 +849,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 		       pctl->membase + pctl->pow_mod_sel_offset);
 		raw_spin_unlock_irqrestore(&pctl->lock, flags);
 		return 0;
+	case BIAS_VOLTAGE_PIO_POW_MODE_SEL_2BIT:
+		sunxi_pinctrl_set_io_bias_2bit(pctl, bank, uV);
+		return 0;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 7c2f29e75519..c37170b2e4f4 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -130,6 +130,11 @@ enum sunxi_desc_bias_voltage {
 	 */
 	BIAS_VOLTAGE_PIO_POW_MODE_CTL,
 	BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
+	/*
+	 * Bias voltage is set through two-bit fields in PIO_POW_MOD_SEL_REG,
+	 * whose positions are given by io_bias_masks[], as seen on A733.
+	 */
+	BIAS_VOLTAGE_PIO_POW_MODE_SEL_2BIT,
 };
 
 struct sunxi_desc_function {
@@ -155,6 +160,7 @@ struct sunxi_pinctrl_desc {
 	bool				irq_read_needs_mux;
 	bool				disable_strict_mode;
 	enum sunxi_desc_bias_voltage	io_bias_cfg_variant;
+	const u32			*io_bias_masks;
 };
 
 struct sunxi_pinctrl_function {
-- 
2.43.0


