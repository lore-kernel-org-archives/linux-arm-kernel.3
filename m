Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B9FC44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 15:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXzXulSKAPLcRuX3YZiepbKZUvKjmLNyPDEVWHi2rOQ=; b=zWYYSaQ+oWFAge7bzDLvTqOs6T
	9s9WmRlN7cKNP4uGArHN2EeSx44x1WgU7BI6+oPeznfQ+q6DvhHZyfbWp0FxlI+uNFIDUqHXxMO1S
	TzadiKv8jdLc/ZPBh+dNj1OwD/c2k3R7CS8MjtToYj1i46ORKR7lm4iZE8pIa7gdgUbFGfavN9Qsc
	6Lwh14zMnjC6t3tAjjXumMUoHDWYf3E5JMwGlgvgvJCK+DDFVWszz/byCe+Q2jvYLfv5NZD/Ab7Uy
	glvO+k2eMtsDZ2s/849VWD046cDICF7M/LONjzip7SwWL7tVkXyc8TVGenfg6ydd4SBI6lpNc62+J
	HFv0RgtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYfU-0000000C7aW-1538;
	Wed, 22 Jul 2026 15:15:32 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYfR-0000000C7Zx-1Wst
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 15:15:30 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49553515a8bso48908835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 08:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784733327; x=1785338127; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qXzXulSKAPLcRuX3YZiepbKZUvKjmLNyPDEVWHi2rOQ=;
        b=gwXdaPllMqQOg0pLrYSF1PQf6m1ZoqmhLkXuL4RTwFZSyeoAlIJxZbc4YWGmvKg4BK
         g90pej2dW2XWmGhPVTTF5vRuqV1e+5apYEDFAYbvHHjtAbO13NnpY8/iO22oVR5lplHk
         HcdrigR0fj8AOGa3oN/pUABVT1L0pvd2XwA62EPqwcpRklp4XwpodqnLrYgVAipjaWbw
         L2mHw3G+pjFr5s6uci/S0LypNAeu/yIJaC9FYiuNtLmHYO8wN+OtNz6mls8vvrR6M6zU
         Czogy2E4wUOKJ3FCIlyYzi71ffVrq5QpaR+bk4loR6KJzzui9Uck+q9f5+4H9TOLleKQ
         FAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784733327; x=1785338127;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qXzXulSKAPLcRuX3YZiepbKZUvKjmLNyPDEVWHi2rOQ=;
        b=Wg9S9eV82zIQDdt1KT7sL9dxLfMYdW6NPUjVe/+zUaiSXSAnXj2hzlQ3lpuYX7tXmr
         KMyDpezjdUfLMHS0c5PWO1SVLOO6TQxOVA2cxgmH96vGTFTBTt3Pvq1raIaNdYfCfHGq
         BFVsPSQ5SuLUH8AolNObRqym7S3iSzx+NjdYOJmSk9/HQZpGq/mRoP6xImsp2f35xeeM
         nQ2HfGsnIBWXIjPnwAGMJ9VX/o84SnOzRD4p6vCvXGxzQ3iLBgPBnSc1uPMEqg/ciX0m
         V9+EHIn52Hk7LPnPny07eSZLNnx960lgBP8zecabwaZJUlo8HGvJC92tADZZYssY7iYt
         m/PQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZtowCqlSCLmA3h1WQrTRA9Fc+nNM554kciiVZ9lXeFdu7+LdWsX/m5FEs3b4QEzc3gATLQwVxz2aWbZxIKETu@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3tlZLddeIK45EtL+ZsEZYBplV//gDzl6pfZzEQ0z8Zu0ZJZMG
	g9qg8jMTsHweeQ8K1crOsrBZBAGIO9nzl+sObTljEueFrpvBfLcGEOT5IG4rJAW5psk=
X-Gm-Gg: AR+sD11Oh+OWu4mH25htE851rHuJaacpKWPsdl8bjBqPV0W19utLcI/S8m9nv0ufhld
	5KWd7LAq1A7WehXrUE0JAk4h5FWLwHb5z7cajIQDkp2SqQ3YnjvOz2stUNuAREbYnPN8oYrwmPu
	qrEV6yR/DzRLwdMb1J7P9TMWmjF9XL045hMoSgSRGY1ZjxJsqr4vugXAOj3L5M2O6AEInxafShZ
	G01nbGCvLoIEPPrjxT1zMCCPISfZFqILgKnKVMVdLfqjKDEAZIh8J4obV/PGgVy7qPaSLFz3JZL
	nLiuvXdSupmwZunrV+U96So3hBjW/4+o3lT2VWKoV7tSODe/ermoEFCm8mcC84gZIBTxHAzmjmG
	JXG7u3Clj51TF/yL9FIlE8I87Oj/Fe535BVGc3100meOtYTAh4/G1C1a1cWJCtakmIsTMZiY6Ph
	DJ0QaW8bH4Ik4dNbIqmrvdeRvaQN8X2k9dkJbfcl+SqHTJZEzZsdnNGoLKOFRzAuO+igfZEqfhb
	EoKek9l8ZAu5zydM9jRAsDmHOTY
X-Received: by 2002:a05:600c:3153:b0:493:e97c:216e with SMTP id 5b1f17b1804b1-4954a41382fmr284426115e9.39.1784733327405;
        Wed, 22 Jul 2026 08:15:27 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a500dbfsm70595615e9.6.2026.07.22.08.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 08:15:26 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corey@minyard.net,
	devicetree@vger.kernel.org
Cc: openipmi-developer@lists.sourceforge.net,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v2 1/2] ipmi: kcs_bmc_aspeed: g6: Add KCS Channel 4 over PCIe
Date: Wed, 22 Jul 2026 15:11:57 +0000
Message-ID: <a283420c1fb6a99df5331e078c7f15b3c97822c6.1784732161.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784732161.git.gregoire.layet@9elements.com>
References: <cover.1784732161.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_081529_430842_4B518EB6 
X-CRM114-Status: GOOD (  18.20  )
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
 drivers/char/ipmi/kcs_bmc_aspeed.c | 39 ++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index a13a3470c17a..4d93af2455b8 100644
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
 
@@ -191,6 +197,9 @@ static void aspeed_kcs_outb(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 data)
 	case 4:
 		regmap_update_bits(priv->map, LPC_HICRC, LPC_HICRC_IRQXE4, LPC_HICRC_IRQXE4);
 		break;
+	case 5:
+		regmap_update_bits(priv->map, PCIE_LPC_HICRC, LPC_HICRC_IRQXE4, LPC_HICRC_IRQXE4);
+		break;
 	default:
 		break;
 	}
@@ -278,6 +287,14 @@ static int aspeed_kcs_set_address(struct kcs_bmc_device *kcs_bmc, u32 addrs[2],
 
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
@@ -344,6 +361,11 @@ static int aspeed_kcs_config_upstream_irq(struct aspeed_kcs_bmc *priv, u32 id, u
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
@@ -373,6 +395,9 @@ static void aspeed_kcs_enable_channel(struct kcs_bmc_device *kcs_bmc, bool enabl
 	case 4:
 		regmap_update_bits(priv->map, LPC_HICRB, LPC_HICRB_LPC4E, enable * LPC_HICRB_LPC4E);
 		return;
+	case 5:
+		regmap_update_bits(priv->map, PCIE_LPC_HICRB, LPC_HICRB_LPC4E, enable * LPC_HICRB_LPC4E);
+		return;
 	default:
 		pr_warn("%s: Unsupported channel: %d", __func__, kcs_bmc->channel);
 		return;
@@ -452,6 +477,10 @@ static void aspeed_kcs_irq_mask_update(struct kcs_bmc_device *kcs_bmc, u8 mask,
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
@@ -492,6 +521,7 @@ static const struct kcs_ioreg ast_kcs_bmc_ioregs[KCS_CHANNEL_MAX] = {
 	{ .idr = LPC_IDR2, .odr = LPC_ODR2, .str = LPC_STR2 },
 	{ .idr = LPC_IDR3, .odr = LPC_ODR3, .str = LPC_STR3 },
 	{ .idr = LPC_IDR4, .odr = LPC_ODR4, .str = LPC_STR4 },
+	{ .idr = PCIE_LPC_IDR4, .odr = PCIE_LPC_ODR4, .str = PCIE_LPC_STR4 },
 };
 
 static int aspeed_kcs_of_get_channel(struct platform_device *pdev)
@@ -575,11 +605,16 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
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


