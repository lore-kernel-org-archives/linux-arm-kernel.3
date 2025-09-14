Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E0ECA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 17:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VeIUZQnFQ6a6zAGoQDZv+bvlaQadCTCZH0QLhkeT9NE=; b=tvTC8oNVefI/7yt2Wrez4ls9Sg
	hF4ystsNPZVGA8w4TegqAgoRAAhJqtMXH9A3sGUs6lqfJwvqOoGHSI90uofkTlv+7CLPVq6ZRoOgb
	+4JZrSmPuo1BEiMW60ooljK/XRSd9RzNRCsr6i0JiaoK1IXwJLT1MsL13R4/zFHAd/OVAfsKwBPB6
	dg1mTXW5y/HBgAea+bfaXBaEROblh/tqN7Zc8+bQ1Ub+Ggn13v7HsjAUKcav//csN9FhEx/PL69QS
	ZfhWe+G/PZvL3UUrkRolFYqAruE7Cn97pEs+fXTBVe97h5Y53eVEhmkxTu0oxd6wzCtxppoRja/x4
	8wOn42Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxqL0-00000001ueg-1Nwb;
	Sun, 14 Sep 2025 17:16:30 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxqKw-00000001ubI-0JAn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 17:16:27 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b0473327e70so582391866b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 10:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757870184; x=1758474984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VeIUZQnFQ6a6zAGoQDZv+bvlaQadCTCZH0QLhkeT9NE=;
        b=BfvTFDijL+U0GS5ESI7PpKKSjmdYajH11/BAtXm1WjT2ymX48HGsVCByiQ3Y9svATA
         ooCMpdD4PZAgE/lX6cIzGzowwA0mooOj+QNLrUud7OTZg963YZKsnFdIvu8wi51IYm+s
         ZF9asMGnf3U81OxuUK2+YVssjD6CSNveXMXUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757870184; x=1758474984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VeIUZQnFQ6a6zAGoQDZv+bvlaQadCTCZH0QLhkeT9NE=;
        b=bwni+lTHqKBMyrVGnfl1yaDleBGwN5xQ7aeHad7x/ZiNMDNZnWZd1410L2Tc0q8MLR
         eg/Rk1fLpoWXLgQYB4ni1nXnfMvIL5k6pPvXVNdNSTc0dZCXpA48aMKHlUQHpCm26HcN
         A+s96wzSsnGp/j9cEPbOCnFdTP2r+eSesuOr0sPrZpKZpJ4W3qM3jiiCavrawtkKKD9Y
         Ct21pfDGbVxg75ZFmlPM46mwxgoFUrp3nIblA48rUjqq39DPpgJIhQdjSgud3L2drp7x
         rnbh3dV8KVkzao8paIE/f23kvtjLASDnD6Q/Kmo7sU2rDQ46awpWV1y4NXYKPjF7Amjs
         6r6g==
X-Forwarded-Encrypted: i=1; AJvYcCX01D95DmOq8di3+Jd4Yf0JiU5/c2SvZQECQGqkmzMDZqjEsZDe+MTMNYNCdMyiivqH/6yj1uh54Iohbpj94HcV@lists.infradead.org
X-Gm-Message-State: AOJu0YzTj9UlhFt7RMMu3/YafWVzU7dzriiHPOmcmMCziV8MpFlQjTFb
	1Ko4gB0BJgzW77ic9tyQ2HHdyfs1yX65D/hWdp9SNtCCr0SuABVXPDOW6LADaGMWysE=
X-Gm-Gg: ASbGncsEAEELZpVQY7yZ6kS/wbo45jDxUXrpvAUnis2dKhJus5UL5LY0kNaLGdIuPVq
	mtckryI/g8llr437p6ThUQIdtgmVqN87hNgvKJwojBSvb4ttz5rMiSLExojSj21g4YIQGpHesN/
	bU3pwBhVzvhjhsAI5vxYXsRtBQRs4CqLJCUezf6Zp5ZTT48/DTivQyTWk9NJSBEUocqsufB1az/
	FGYjOFXDzuuVpi17I4ckN99NEJblFVTH4G1+z3sFoAvbGt/Qmqa1tMw/RlrAs4pem5ZA3c1ZPla
	7so9cTrhDW2Ke9SeXQQojaqPdGrXmmc58ubON8UMAhISZXuYLpeFADDT/PGr+sjSt7iy9m/C2wa
	Ssc7o2vI5bs6myDpzSACKfL9zOKaLEBIZ6qDRAoLy3SMNryY9tCArtYWRySfia8iUiqZVpRhhGv
	y8Y/HSLS0rrcmx4cv14nDTFXsPYFjgVj3553Iq7VMnYMYpvszZsEXr+xD7vVTcPF5u
X-Google-Smtp-Source: AGHT+IETORtFdx7V7/ajkoRQBW7LbAmBCbFNX2/FEUSZSUzDQGbJV03GOggXdksYhxvqH+4PusvMbA==
X-Received: by 2002:a17:907:78b:b0:b10:aab8:3816 with SMTP id a640c23a62f3a-b10aab8432amr71331666b.32.1757870184256;
        Sun, 14 Sep 2025 10:16:24 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b334e76dsm776980466b.102.2025.09.14.10.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 10:16:23 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v2 6/6] Input: imx6ul_tsc - set glitch threshold by DTS property
Date: Sun, 14 Sep 2025 19:16:03 +0200
Message-ID: <20250914171608.1050401-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
References: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_101626_128777_FBB5AB1B 
X-CRM114-Status: GOOD (  17.02  )
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

Set the glitch threshold previously hardcoded in the driver. The change
is backward compatible.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Replace patch ("dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add
  fsl,glitch-threshold") with ("dt-bindings: touchscreen: add
  touchscreen-glitch-threshold-ns property"), making the previous property
  general by moving it to touchscreen.yaml.
- Rework "Input: imx6ul_tsc - set glitch threshold by DTS property" patch
  to match changes made to the DTS property.
- Move "Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros"
  patch right after the patch fixing the typo.
- Rework to match changes made to the DTS property.

 drivers/input/touchscreen/imx6ul_tsc.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index e2c59cc7c82c..0d753aa05fbf 100644
--- a/drivers/input/touchscreen/imx6ul_tsc.c
+++ b/drivers/input/touchscreen/imx6ul_tsc.c
@@ -79,7 +79,7 @@
 #define MEASURE_SIG_EN		BIT(0)
 #define VALID_SIG_EN		BIT(8)
 #define DE_GLITCH_MASK		GENMASK(30, 29)
-#define DE_GLITCH_2		0x02
+#define DE_GLITCH_DEF		0x02
 #define START_SENSE		BIT(12)
 #define TSC_DISABLE		BIT(16)
 #define DETECT_MODE		0x2
@@ -98,6 +98,7 @@ struct imx6ul_tsc {
 	u32 pre_charge_time;
 	bool average_enable;
 	u32 average_select;
+	u32 de_glitch;
 
 	struct completion completion;
 };
@@ -205,7 +206,7 @@ static void imx6ul_tsc_set(struct imx6ul_tsc *tsc)
 	basic_setting |= AUTO_MEASURE;
 	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETTING);
 
-	debug_mode2 = FIELD_PREP(DE_GLITCH_MASK, DE_GLITCH_2);
+	debug_mode2 = FIELD_PREP(DE_GLITCH_MASK, tsc->de_glitch);
 	writel(debug_mode2, tsc->tsc_regs + REG_TSC_DEBUG_MODE2);
 
 	writel(tsc->pre_charge_time, tsc->tsc_regs + REG_TSC_PRE_CHARGE_TIME);
@@ -391,6 +392,7 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 	int tsc_irq;
 	int adc_irq;
 	u32 average_samples;
+	u32 de_glitch;
 
 	tsc = devm_kzalloc(&pdev->dev, sizeof(*tsc), GFP_KERNEL);
 	if (!tsc)
@@ -513,6 +515,26 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	err = of_property_read_u32(np, "touchscreen-glitch-threshold-ns",
+				   &de_glitch);
+	if (err) {
+		tsc->de_glitch = DE_GLITCH_DEF;
+	} else {
+		u64 cycles;
+		unsigned long rate = clk_get_rate(tsc->tsc_clk);
+
+		cycles = DIV64_U64_ROUND_UP((u64)de_glitch * rate, NSEC_PER_SEC);
+
+		if (cycles <= 0x3ff)
+			tsc->de_glitch = 3;
+		else if (cycles <= 0x7ff)
+			tsc->de_glitch = 2;
+		else if (cycles <= 0xfff)
+			tsc->de_glitch = 1;
+		else
+			tsc->de_glitch = 0;
+	}
+
 	err = input_register_device(tsc->input);
 	if (err) {
 		dev_err(&pdev->dev,
-- 
2.43.0


