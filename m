Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7B0E6B242
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 10:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tfW7W38u73oXDY58ExSVjQCRIYrMmZQTfpbBo08M7pQ=; b=0NxWtmkQFGT5UQzoGVippfZV3v
	fQni/nm3VFAy3sdiFXO7R/zhMEH1kWcCv1C0MZEYWfpwphzgNjRU2yL2mubCs85lepAAZe+gXF6iM
	hzhidNdLkw3Ey9884/t1t00WjMnV0Ji1Is4y/a6kpglEPKIFQeu2F17MN8lu4D2zltoxcoLvRf3YP
	Rnw8qLnax61pQWsstSHHSTQWkPSyEJbeaZBIeK9mruPx21Bupr6Rb2q8gznxbjYVBaVvCbJfQ2BsJ
	wYT1g2vRIjKyxbZX7loYI69jJjtXiiueOCUuFD7P3uk+x/NBMgaApzLexCt8hp9KXRGun01WD6PD0
	oqxUFyqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6obG-00000006W5B-22Ca;
	Fri, 01 Nov 2024 10:09:50 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6oPg-00000006TO7-1wuL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 09:57:53 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a9932aa108cso265374766b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 02:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730455071; x=1731059871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfW7W38u73oXDY58ExSVjQCRIYrMmZQTfpbBo08M7pQ=;
        b=icZaxnh5jwvaWV9LKkjnerKDWTPOzZt8DBydvVwSffJVHjtKpNxBXabGwD9JxmPS5d
         fTlE8+zTO6HyVyDiXuGojSFkDjx32AgIQzmB2MHtZ9ka4CpGXjR1dT2k+rZE+AO0QJCJ
         69RjgblDeAhk7PbMyLkzrHmf9qOBlj27DHxS2SEqopbnm59zwFL7wbq/eh0l0EJyC8N7
         3PJ1/amsZmIIx8ogTGewgAl94ol2iGeIARn2qG9FJc6oXHLd+iv50yi7Fc83OlF8O5Q4
         sjLHQiDNsATUx2pTIVsyjVE7vaVuXuY5OSAkvg3xYJdsNdJY02SodAcLUINWjb/aHkmY
         cA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730455071; x=1731059871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfW7W38u73oXDY58ExSVjQCRIYrMmZQTfpbBo08M7pQ=;
        b=nLzNpncMpRoYSgpepwtnH01JxjFjecsjQX0YRbwZkAqo/k5I0TbjpOM8fYPO7w0a0/
         3WiLilYhGZraKi4gJb+NVQ636Xjxuuzgso/c+tMWLZWO8SBtJVgPelSMo4aN52cI06Ky
         I6X9iLZ2gfDr5o/kcWb5nEmBvP5QQC2nzLkYke6UIQjG8FqIlW3tsHi2yVITVuZDgfnl
         xBPipcyoiZiBo6dHTLiuG57+oPaiw6K0QG2BsWYJhLgnnaC4XbM2PyPma3HNsvlkA8vy
         tvRQrHeTEJjMSwmx3C/PWT0//j/SzjJlBCXnyXNFFsVS6B/euNkENn4PXnbQpKWG5m90
         d+NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVup7v1eomZKWpxNVyWqlcL+vgjRVXvWyOutGe9zlXXXhUaqpVIH66F7IFAkoU+DyXePQOuoO3lqJHsHNd2Ihsu@lists.infradead.org
X-Gm-Message-State: AOJu0YwEN9Hz6bqdd/+gdSw14l/qRMhxwiKM7qHAN48S7Z5f7T5eQWOY
	m3GUUL884cc0It8oP3lAMdsICHPIP07KYeL2oEfCE9M8sMggf9MYHfmxECn6gYA=
X-Google-Smtp-Source: AGHT+IFE0JHqlkVDmb2/TxlqXR6484r4+5y4byueSe80U+33dxBrQC5ZdYOn6F1eecNFW0u/e9w1Bw==
X-Received: by 2002:a17:907:97ce:b0:a9a:e91:68c5 with SMTP id a640c23a62f3a-a9e5093efccmr607271566b.33.1730455070606;
        Fri, 01 Nov 2024 02:57:50 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7c8d87sm1364136a12.76.2024.11.01.02.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 02:57:50 -0700 (PDT)
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
Subject: [PATCH v6 6/9] arm64: dts: renesas: r9a08g045: Add RTC node
Date: Fri,  1 Nov 2024 11:57:17 +0200
Message-Id: <20241101095720.2247815-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_025752_559262_5CCC3B15 
X-CRM114-Status: GOOD (  11.20  )
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

Changes in v6:
- none

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


