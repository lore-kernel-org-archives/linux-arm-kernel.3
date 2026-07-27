Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D955FC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 07:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7MzOsUeybMS9dXaNgD2Ggm/YXuUKfNu/EThsAs7XLtY=; b=5FvHlXcUqGDpu3KV/ABkUU/RJA
	zbkEAWoVZwI3jBC8abjxp/L2sI6uCJHyZ5Ijl3tI/q1sTC5tTVnz7KkFHfWwcHlK8lULij25SJ4eC
	1rP0DdGVFgMd9pwZr9ClMcKaeFtjq+LnisEAPdoGi7CZK9ITsrvG6qZ0tapBK0wkfXgVx3Vt9fwFF
	FwKLYlz+9e4rZ/X0HkIHl72aNwsGi0zhLTJd6+9KTArBunIE1V9YQkzjlrIDqR9/snH0tHceJEkPv
	RXMIRogyM9TImbKOfxt40LSlCnUKbb3/41gkHdy1EqAwS4jJansQSYTMNX8bGRBA/9ojAGutm/LT3
	yxqG+e0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFmu-000000027qV-3EI8;
	Mon, 27 Jul 2026 07:30:12 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFmn-000000027nR-3IMo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 07:30:06 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso21827375e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 00:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785137404; x=1785742204; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7MzOsUeybMS9dXaNgD2Ggm/YXuUKfNu/EThsAs7XLtY=;
        b=e60Pd4qnuRYQ9RhT0e8+k43Qh38L+VB9tdBc9JeQPIQXAL52K8DdrVhCHmbALLdNT0
         1eF2OMkoegAgpP2mrA0aGT+ithoYPnSSyAh8ateBbxL0iUeOHFxMCroH2y22vrJTrtBV
         v2JN5wSwPhjXugsGcnN/f7fIz5I3Lrzx3ZXX2Tc3yK3H8EfhemEXizuiEUEGIG/hR/3O
         zNRlRUVK862uYbpj4x8mFe6ILnTw2r7oHW8Iw4d9QykSnwyPDqiiAa4f7m+VzMscvHyg
         QwPHMcpz1zob7Lj3Y9N4xH2Yqk+5vaDKf7Liqq7/vNvjfrDEsZuARfezXkV+PxXOdx98
         0dgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785137404; x=1785742204;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7MzOsUeybMS9dXaNgD2Ggm/YXuUKfNu/EThsAs7XLtY=;
        b=RLinQpSw8t1nQVAPDLeWE7TA5N10Xz6gYQMPiS/47MQxnPQeRQidLZtIMTDjgujaaj
         jDYgP/sOrUpr+p5il5mXFJBq4BUg7/AAOL8ZK8EZSHqtwfuN5WA+BbX9cHBo68DVKW9B
         l4pl6ZuDnbmosepMDbO7BlhE7MZF7CimISBxcaUYWNm8im+LsirNpJZx0y9zbqUzGVWO
         xyn4kTiCch9ZEEljDzvxrkamefh7LDgBxlmXi+k02YeqgS0qJ8S9AhWWh3QkGPNRrOdh
         3rezEydFVycsYEo9W/hUkBPNlqHe98Z6b2XOJUXgKhhcdfrGqLISBGAyq/eaWEW+zNnD
         XltQ==
X-Forwarded-Encrypted: i=1; AHgh+RqEnx9NAmr3tZB+JhF1DD0OWT4lo0LmlE8unzjYOetNvXEMpqUx0ExNzU5kJirZxlQoICQTb7JElf2jSzR+dkNv@lists.infradead.org
X-Gm-Message-State: AOJu0YzdiGyGFJuqiZ6MIIkIZqY5HQLmqfv0IFwBxxS5fDIfwEOm0jMJ
	KDT6qVem7UaOiIXKleHbTtIojVlo6A+EQxJdtRq9W15l66uP6ixFJd86kDfzAwfHEjA=
X-Gm-Gg: AR+sD132vZGQ7CQONQd8eIaxelh6O1aMVC6xiuSkEfaFyYGPVLp3EgpI/sDaahVC8tX
	IWN/o2USBOWJJkoll2tYKQaq6k2KXUs8fSKT0O5xEthMu7vrg57CIKtV0dVzNBARSPEzyvfW/zW
	whrSzauolL7FPTRN7JU6huSL9DvOIkOvOw+DQRBxU2coSpedjWbIH89LWfpK46SbUe4nDqIVnFb
	RJqeX4fsAEA3yhGIOAKQwMWJTjvF2jk6x5l35xdtk+V/Dy7Ab+wLbkoiE+Nj0aN4U8s9timS+9R
	1kHziY2iKZKd/ds29DaaYyzQCo3qpl4ut0DL/RoF/5sywV3xOUsI8IGu1xOh9ceITDuWXrxbKdq
	YRGGccaPZ+HcWvaDM5nb+zol8QxbrF9vDGRs75nBvyEtgp2zgnbUiawXb5YsSXJlc8fzOvt7Kxx
	gzSaBtWSR57ajwWU3Y7QGNGJ8aouzCAYRdIcmKL05AHiS1O3cS2h9bSSjbkelk5nsaMvi6cLaAd
	nb+MHLqcPltdUAtMA==
X-Received: by 2002:a05:600c:310d:b0:495:7b1b:f387 with SMTP id 5b1f17b1804b1-496b56f141dmr93289595e9.24.1785137404083;
        Mon, 27 Jul 2026 00:30:04 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4ee4504sm201823685e9.6.2026.07.27.00.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:30:03 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corey@minyard.net,
	devicetree@vger.kernel.org
Cc: jammy_huang@aspeedtech.com,
	yc_hsieh@aspeedtech.com,
	openipmi-developer@lists.sourceforge.net,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v3 1/2] ipmi: kcs_bmc_aspeed: g6: Add KCS Channel 4 over PCIe
Date: Mon, 27 Jul 2026 09:27:40 +0200
Message-ID: <45f36ea6a3a2df18b51c5b83200c7596dbafe133.1785135437.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1785135437.git.gregoire.layet@9elements.com>
References: <cover.1785135437.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_003005_859017_FA52B83C 
X-CRM114-Status: GOOD (  18.03  )
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

Created a 5th KCS channel to match against the KCS 4 over PCIe addresses.

The ASPEED AST2600 has a PCIe to LPC controller. It includes a KCS
interface on channel 4. This is a fully KCS-compatible interface
that is exposed over PCIe.

The 5th channel created is only valid on the AST2600.
This cannot be used for AST2400 and AST2500 chips, as they don't have LPC
over PCIE.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 drivers/char/ipmi/kcs_bmc_aspeed.c | 41 ++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index a13a3470c17a..97daa2b3d6a0 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -26,7 +26,7 @@
 
 #define DEVICE_NAME     "ast-kcs-bmc"
 
-#define KCS_CHANNEL_MAX     4
+#define KCS_CHANNEL_MAX     5
 
 /*
  * Field class descriptions
@@ -102,6 +102,12 @@
 #define     LPC_LSADR12_LSADR2_SHIFT 16
 #define     LPC_LSADR12_LSADR1_MASK  GENMASK(15, 0)
 #define     LPC_LSADR12_LSADR1_SHIFT 0
+#define PCIE_LPC_HICRB       0x900
+#define PCIE_LPC_HICRC       0x904
+#define PCIE_LPC_LADR4       0x910
+#define PCIE_LPC_IDR4        0x914
+#define PCIE_LPC_ODR4        0x918
+#define PCIE_LPC_STR4        0x91C
 
 #define OBE_POLL_PERIOD	     (HZ / 2)
 
@@ -159,6 +165,7 @@ static void aspeed_kcs_outb(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 data)
 	case LPC_ODR2:
 	case LPC_ODR3:
 	case LPC_ODR4:
+	case PCIE_LPC_ODR4:
 		break;
 	default:
 		return;
@@ -191,6 +198,9 @@ static void aspeed_kcs_outb(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 data)
 	case 4:
 		regmap_update_bits(priv->map, LPC_HICRC, LPC_HICRC_IRQXE4, LPC_HICRC_IRQXE4);
 		break;
+	case 5:
+		regmap_update_bits(priv->map, PCIE_LPC_HICRC, LPC_HICRC_IRQXE4, LPC_HICRC_IRQXE4);
+		break;
 	default:
 		break;
 	}
@@ -278,6 +288,14 @@ static int aspeed_kcs_set_address(struct kcs_bmc_device *kcs_bmc, u32 addrs[2],
 
 		break;
 
+	case 5:
+		if (nr_addrs == 1)
+			regmap_write(priv->map, PCIE_LPC_LADR4, ((addrs[0] + 1) << 16) | addrs[0]);
+		else
+			regmap_write(priv->map, PCIE_LPC_LADR4, (addrs[1] << 16) | addrs[0]);
+
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -344,6 +362,11 @@ static int aspeed_kcs_config_upstream_irq(struct aspeed_kcs_bmc *priv, u32 id, u
 		val = (id << LPC_HICRC_ID4IRQX_SHIFT) | (hw_type << LPC_HICRC_TY4IRQX_SHIFT);
 		regmap_update_bits(priv->map, LPC_HICRC, mask, val);
 		break;
+	case 5:
+		mask = LPC_HICRC_ID4IRQX_MASK | LPC_HICRC_TY4IRQX_MASK | LPC_HICRC_OBF4_AUTO_CLR;
+		val = (id << LPC_HICRC_ID4IRQX_SHIFT) | (hw_type << LPC_HICRC_TY4IRQX_SHIFT);
+		regmap_update_bits(priv->map, PCIE_LPC_HICRC, mask, val);
+		break;
 	default:
 		dev_warn(priv->kcs_bmc.dev,
 			 "SerIRQ configuration not supported on KCS channel %d\n",
@@ -373,6 +396,10 @@ static void aspeed_kcs_enable_channel(struct kcs_bmc_device *kcs_bmc, bool enabl
 	case 4:
 		regmap_update_bits(priv->map, LPC_HICRB, LPC_HICRB_LPC4E, enable * LPC_HICRB_LPC4E);
 		return;
+	case 5:
+		regmap_update_bits(priv->map, PCIE_LPC_HICRB, LPC_HICRB_LPC4E,
+				   enable * LPC_HICRB_LPC4E);
+		return;
 	default:
 		pr_warn("%s: Unsupported channel: %d", __func__, kcs_bmc->channel);
 		return;
@@ -452,6 +479,10 @@ static void aspeed_kcs_irq_mask_update(struct kcs_bmc_device *kcs_bmc, u8 mask,
 			regmap_update_bits(priv->map, LPC_HICRB, LPC_HICRB_IBFIE4,
 					   enable * LPC_HICRB_IBFIE4);
 			return;
+		case 5:
+			regmap_update_bits(priv->map, PCIE_LPC_HICRB, LPC_HICRB_IBFIE4,
+					   enable * LPC_HICRB_IBFIE4);
+			return;
 		default:
 			pr_warn("%s: Unsupported channel: %d", __func__, kcs_bmc->channel);
 			return;
@@ -492,6 +523,7 @@ static const struct kcs_ioreg ast_kcs_bmc_ioregs[KCS_CHANNEL_MAX] = {
 	{ .idr = LPC_IDR2, .odr = LPC_ODR2, .str = LPC_STR2 },
 	{ .idr = LPC_IDR3, .odr = LPC_ODR3, .str = LPC_STR3 },
 	{ .idr = LPC_IDR4, .odr = LPC_ODR4, .str = LPC_STR4 },
+	{ .idr = PCIE_LPC_IDR4, .odr = PCIE_LPC_ODR4, .str = PCIE_LPC_STR4 },
 };
 
 static int aspeed_kcs_of_get_channel(struct platform_device *pdev)
@@ -575,11 +607,16 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 	if (channel < 0)
 		return channel;
 
+	np = pdev->dev.of_node;
+	if (channel == 5 && !of_device_is_compatible(np, "aspeed,ast2600-kcs-bmc")) {
+		dev_err(&pdev->dev, "LPC over PCIE KCS4 only supported on ast2600\n");
+		return -ENODEV;
+	}
+
 	nr_addrs = aspeed_kcs_of_get_io_address(pdev, addrs);
 	if (nr_addrs < 0)
 		return nr_addrs;
 
-	np = pdev->dev.of_node;
 	rc = of_property_read_u32_array(np, "aspeed,lpc-interrupts", upstream_irq, 2);
 	if (rc && rc != -EINVAL)
 		return -EINVAL;
-- 
2.54.0


