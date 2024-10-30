Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EAED5CC9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 11:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0RaA8Oq2TnPgWUFVlg85ZPuyptoCXBTMqrBfg+ChE0c=; b=VugT+t4qqzHFWcVmWTr4PuJsnn
	bgUQNmN5SXGrxNIFJkRNH3uOGTS4mv1hX4pu9Q5k7cN3edOjqGl+G6uAhM+m5DdfmWvyPudi51/S9
	9/L9nAiY6qD6CybLPmwkSPnd4gFVhhVLAEfVUERuVY6rfWNwnsSJwDzEkv5YVyfpxCQECv3zwkDIw
	qRzuWtPLTQq3pihlM4m1Z5HKqRUJoce5DH0u4aRfwn4scgYqFI4zlMMseICepyEL335fzzh9tbHZE
	8mJI5XxfSGqmRctP3qYDLZ+yrWf1QKvObi0TIO4INm8pPLeZKAplsdfAqslPa3NTREzb1PCNmRMtk
	/mh/e0qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t66rq-0000000085d-3Z2l;
	Wed, 30 Oct 2024 11:28:02 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t66SV-000000003i5-10AW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 11:01:52 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-539eb97f26aso6759655e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 04:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730286109; x=1730890909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RaA8Oq2TnPgWUFVlg85ZPuyptoCXBTMqrBfg+ChE0c=;
        b=npLDnfqq2/CJ77mHhdExaNSR9ssJW82s4mrP5u2xXztnxl4NtH1uZQjSQMTSthchMa
         R6s/zvSwLSgJzGyDJeiWoV4evWmPTG6cvTc8ZjFx8C839bR0AaCFf+zNbTM/BoYIB2SF
         cwI/PAyOpEU0cWB4TkGXy1GMVbdu8ooCK13aKqeMEM69S+frWtXDmzD9k8eJ6v+Pwdg+
         mneEK9YFbKpdVibn3lu9C2Ezb0DvI3yhK85CNcviDlC0SEZwYkWG8sF5UQsVHXAkBYZ4
         Kc5hoj0e7SbxTklxNc2N5GwSU6lDQvTCVuTTyAvmQ9TkNbsr+vEn4KggeJeLdo5Cyyby
         WOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730286109; x=1730890909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RaA8Oq2TnPgWUFVlg85ZPuyptoCXBTMqrBfg+ChE0c=;
        b=sf9VkkTGp5EuAE1Jy/a0kogqz/e2FwGfpb7A0MlRqCvz0Kb8fNBTuIMpDLfn+0DPqz
         IWmOT+mn8dJmOK1eCRE9BIg1BQ9nHQdkYE/Uu0WISnmb+2+hewgZr4TQ2tyRiOgDKOuB
         wGfoyRkOmtMYoswI4BlqMRQZMSQbSWlv7kPYko6du7sJ21Ku7rq4mPuczzCaa6tI0/NV
         bLXOnG3JoiiW0bvFrPB3XvlnXuuXBtBvszp0bvgxHIaiBitjukeUeVclDqkO2zBwU7tY
         QffGKuD5XOf9arHEcScNAkwgtXIfJZllCriVQQWz4896E6zdLf6XAwusDD0MksKMOHXi
         bQhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI/pFl7z0IvZe66QLOxE2urngpStP58Upe/KgLIGbprghdEkr2WH/+iu78rdOll1xwiq6+KaGq2AlKu+tmvRgd@lists.infradead.org
X-Gm-Message-State: AOJu0YxGRuNFga2LyuvkeWrgsehL5/hxO/W2nZSSlauPzvGRZRfbxTbI
	xIOMyPP1vQqLO61EM0zEPSqxV706IwZbCD5nhvo2I2gUbmF3fn2CmCuV1IA5W7g=
X-Google-Smtp-Source: AGHT+IGLcUn8UrUCFSXa2wdI7F5DblgU1h3Tlqu+CabGKPz2NXZLaP7HRpfptZfpKopeGY3o0sPrRg==
X-Received: by 2002:ac2:4c4b:0:b0:52f:ca2b:1d33 with SMTP id 2adb3069b0e04-53b7ece170dmr1555512e87.20.1730286108705;
        Wed, 30 Oct 2024 04:01:48 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd99edebsm17956935e9.45.2024.10.30.04.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:01:48 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 07/10] arm64: dts: renesas: r9a08g045: Add RTC node
Date: Wed, 30 Oct 2024 13:01:17 +0200
Message-Id: <20241030110120.332802-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_040151_331071_FB38A8E0 
X-CRM114-Status: GOOD (  10.89  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add the DT node for the RTC IP available on the Renesas RZ/G3S SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- collected tags

Changes in v4:
- dropped the assigned-clocks, assigned-clock-parents properties as they
  fit better on vbattb node
- moved the RTC close to serial node for ordering

Changes in v3:
- added CPG clock, power domain, reset
- and assigned-clocks, assigned-clock-parents to configure the
  VBATTCLK
- included dt-bindings/clock/r9a08g045-vbattb.h

Changes in v2:
- updated compatibles

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index a1d5084b074a..be8a0a768c65 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/r9a08g045-cpg.h>
+#include <dt-bindings/clock/renesas,r9a08g045-vbattb.h>
 
 / {
 	compatible = "renesas,r9a08g045";
@@ -72,6 +73,20 @@ scif0: serial@1004b800 {
 			status = "disabled";
 		};
 
+		rtc: rtc@1004ec00 {
+			compatible = "renesas,r9a08g045-rtca3", "renesas,rz-rtca3";
+			reg = <0 0x1004ec00 0 0x400>;
+			interrupts = <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "alarm", "period", "carry";
+			clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb VBATTB_VBATTCLK>;
+			clock-names = "bus", "counter";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G045_VBAT_BRESETN>;
+			status = "disabled";
+		};
+
 		vbattb: clock-controller@1005c000 {
 			compatible = "renesas,r9a08g045-vbattb";
 			reg = <0 0x1005c000 0 0x1000>;
-- 
2.39.2


