Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3468CD1BDE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 21:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQhWJ+eZUIq/ASkiydz0nS8vMs4pxW0kNav8P/wBabI=; b=4+Egb2lw4Db00xYFw+sNYbeoxd
	PriAbVO1ZKPIph3t6MiVvvxrw2kV/jCV5nCHQ+ZM5FDUD/kmhHLIIJjDcarML7NZebjfljAPmQSxQ
	y/StksoXyUeOCK37SG0+tEdG5/uOaHWBwZ2Q4gsI+EaBtsz3N34sUrW+iVy3EG+WpCmyT56bVC+nb
	vfnysUwiAumY0mOtbm88puOLHkaymi9gRav/R7/VRL/FT5ijwJND+cv6do5TpR0/EQv1qPIqjqMNm
	lEwfv6tRbLIRiRTbtyvp/FASzKngRhIx/0ZXkky9WNksKYwa2OeZ84MuZ3A4doZpCLllhxqfGZtsY
	GcSH32/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQuHq-000000077Zf-0a6B;
	Wed, 03 Dec 2025 21:21:22 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQuHm-000000077T8-1P22
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 21:21:20 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so2204715e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 13:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764796876; x=1765401676; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQhWJ+eZUIq/ASkiydz0nS8vMs4pxW0kNav8P/wBabI=;
        b=kSfOYLnO/MRgy4TsYQEDZ9b+FN804U0gv5Do4Qy46ypQSEpHbPnbc1jOkIVogyZqtm
         vtmC4UJo2lVAsWPVdqSYPV32jJ2+jlVnJGFiSt7Vjsi2Pq5UGRAeLLANHZQ2DKAtOHHR
         0RvF8kK8XX4PjPIa1L7mk/ErjpyyXXZhh9FH3YqF1LsblmLMRvBvOQMQzorqKIG+dV16
         FpGT7n/uDOI1A6x47VrtxKT8s51o6qBXfZBCH3otQx5ax4eKz3yjGVpVq5nRQMFPTaM1
         eAvCY7Bb9BXRuhW5GjurEJ6lLrfYpILKf5CVzBXZQtIz3QDx/akQzaBiAndgKEG9JyZk
         qYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764796876; x=1765401676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EQhWJ+eZUIq/ASkiydz0nS8vMs4pxW0kNav8P/wBabI=;
        b=elydqmWnaNRb4YmEtxUA0X+QcdKqtgNo6u/jyVArDs9Fk4t+kZlyAzIvKlN4X4kPXt
         GHX/HRr8asYNcGLE9QQw8i0hGJHhXu3KphE/ygl0fJ4XNvObwvEv5ViEFmsN64U8YoU+
         Wrgl8TEsvWEjMzKRKXRRlq46NXOiyx+wdYMJ95kUILCA8MbYTdtBfLv7ydwefR64yEKS
         Fb4tKfzE+PGQS6OIpaJiDg7LcPCfqDfR1dGFycRmQVrFiitS0OE6bP0NO/ahZbfJ5QZl
         bvdPT8fwNsXaz8U5Vy0VPFHbWLbhbkMWYOIe35CQzUKAiG45xbTIOZDYq91s3+NxTHDO
         hKsA==
X-Forwarded-Encrypted: i=1; AJvYcCV+AQe6A33sVIO2i52G+qUzKMOG50f+qr1tmFp49kij6M6ZKDvDajCclDdo4fkhsomKphM1GtWXj7PBWFU+pT8g@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+LcEW7pDoySvyJ5VYIaKub7p+rxqhb3IIP+EvPF62dHNfS20w
	bMPkL/bESKpN6h/9H+RVweBNPlKoHAyakekcStZDVj/GxZq0NMC8Ltrf
X-Gm-Gg: ASbGncsCVcelr1Vp6FZZI49uEIue7Ks3VMLY8687ooJ1l4KKvxB6aVsHC02wJr2Snkt
	DgEn7hrl3hYB87vgSKw7JPdLiPwXOpjiztb/h4+zXUkAga0xuV4g2jiN+jOefd3ADdhXujDqM6s
	nxrAxdb+DsRGiJUiSxFLrlOaO89NU+FMjNwmzUTNX4kAgrAY1M/KnEkf1pk0n01g0Q0MjHHUP7o
	FkikH8y+dI2NijOqwf0BDkPPX2YLMVLJ8tev7+rIVok7NelSxWJt1lO+vg4ltGBFAG8C744E8TD
	7Bg5QJlj6Obv3s/9H2gYwsrkdcfuA5b7KdkAPoOZrvWqv+d6UgE9Iytf9ZN0jfQHg0DhZoCjsiD
	p4Jw7+k4Vvvn/7G5Sg6EfLzbAUyfTs+14zBHyXvC8j9Q1uI4XmAGyJo+NiWsBKpVo2K0NDNe2zm
	WT92tI+6dGiNa/uimTmdYGaddKnw==
X-Google-Smtp-Source: AGHT+IEZunEpe//frhiLdeTM4oc5NR9n84V4te1dih4RZ4tO0H2gi5ZrfJvPPSfzRkaN0ZyCPVH1ew==
X-Received: by 2002:a5d:588b:0:b0:425:8bc2:9c43 with SMTP id ffacd0b85a97d-42f7970544amr423736f8f.1.1764796876449;
        Wed, 03 Dec 2025 13:21:16 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:2034:6883:1f40:e708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c3c81sm41648667f8f.3.2025.12.03.13.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 13:21:16 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Wed, 03 Dec 2025 22:20:39 +0100
Subject: [PATCH v5 3/5] arm64: dts: mediatek: mt8188: switch mmc nodes to
 interrupts-extended
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-review-v5-3-b26d5512c6af@gmail.com>
References: <20251203-review-v5-0-b26d5512c6af@gmail.com>
In-Reply-To: <20251203-review-v5-0-b26d5512c6af@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764796869; l=1902;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=D0brhOSlQ6XpHrvqk4mV02jDuacWgrfRP6AOquTJ7yY=;
 b=aZHqoB8QhtYSfvDqkCjiYxJ2KutmCtdQYZ5Z3AxxpgvK0CdISzHX8hpeRnrZVAg5b+DpB60pF
 +9FuNRYEeTtBuwgKD+NyLdJ3lXwqAT2CzJEN5+tQ/swxniMV+wMOH4W
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_132118_421079_EBC0C39D 
X-CRM114-Status: GOOD (  11.57  )
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

No functional change but will allow other dts including this one to
override the interrupts, for eint support for instance, without having
to delete the 'interrupts' property.

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 90c388f1890f..e3209a9a5f01 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1800,7 +1800,7 @@ mmc0: mmc@11230000 {
 			compatible = "mediatek,mt8188-mmc", "mediatek,mt8183-mmc";
 			reg = <0 0x11230000 0 0x10000>,
 			      <0 0x11f50000 0 0x1000>;
-			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupts-extended = <&gic GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&topckgen CLK_TOP_MSDC50_0>,
 				 <&infracfg_ao CLK_INFRA_AO_MSDC0>,
 				 <&infracfg_ao CLK_INFRA_AO_MSDC0_SRC>,
@@ -1813,7 +1813,7 @@ mmc1: mmc@11240000 {
 			compatible = "mediatek,mt8188-mmc", "mediatek,mt8183-mmc";
 			reg = <0 0x11240000 0 0x1000>,
 			      <0 0x11eb0000 0 0x1000>;
-			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupts-extended = <&gic GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&topckgen CLK_TOP_MSDC30_1>,
 				 <&infracfg_ao CLK_INFRA_AO_MSDC1>,
 				 <&infracfg_ao CLK_INFRA_AO_MSDC1_SRC>;
@@ -1827,7 +1827,7 @@ mmc2: mmc@11250000 {
 			compatible = "mediatek,mt8188-mmc", "mediatek,mt8183-mmc";
 			reg = <0 0x11250000 0 0x1000>,
 			      <0 0x11e60000 0 0x1000>;
-			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupts-extended = <&gic GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&topckgen CLK_TOP_MSDC30_2>,
 				 <&infracfg_ao CLK_INFRA_AO_MSDC2>,
 				 <&infracfg_ao CLK_INFRA_AO_MSDC30_2>;

-- 
2.43.0


