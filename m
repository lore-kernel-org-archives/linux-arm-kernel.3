Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8511CC71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 03:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VyLSDtp3/79+REpFtOfivoiwhQtWS2WlyGvRoudAipo=; b=fzmm429iqqwPG8FzJ3O311JReX
	MAYSX8HjXy5EgdNq0vCXYDzQdAsmAMrSKnazL+CXvRdIW4oNVrvkmZwQcrEwwWEvGJHTRfmoFh39+
	aucsjZsfhcyM1xlJeaCqNM5K1h7XTRYC1PSuJmDOap890GTL6+iRRQhHdZ/jPUntLNtxxuthzkgor
	s54y9lBbAHldCOtAnkMbSqrgTL19PaF7YjL4aKZ12OfEfP7Zii236/dYwB5a0bDHhPsxpb6aQHd+Z
	lJ+GStmaOOC6pDGM54nYlk2f2dxYegYVPnhqapILdCrh2tNPd6hYkJcjhfM8Rx6OKU/0ztzCghgGL
	eann2ZgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPYRc-0000000C3P3-1imi;
	Thu, 12 Jun 2025 03:17:36 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVyh-0000000BnfB-1STw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 00:39:36 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7d3900f90f6so41035185a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 17:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749688774; x=1750293574; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyLSDtp3/79+REpFtOfivoiwhQtWS2WlyGvRoudAipo=;
        b=VvYkiyuc5apIXgo5BXkKWcKbevJPsdAjfy1lH1R4gvLsc0g4dKHZFZMO6xLSZh0Obh
         H3kZs0QFFFLoFlI/B9RPKd3iGsBg+FqaGTP3orXPKMaud9g4wAo3b1RMJk5VIOiVYee2
         BNuiJulWPrG2W2B1VV5uW1BX/farJ/DO2Rl8xoW8G/K64L2P+YIQ9ah/542uzuaNURfn
         2JsEn5RDz3XE0CDqXr/+hRaPGIn5Hgq721s6XZP14GnlDRsq8YR4Ayw6Lsu/oiBt9FiZ
         82iFvEQupUw/lbJHQScEkz+e0qvgg+JT1IbClWxepeFK9ig03TNoH6krZTq1YGvtov10
         Zp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749688774; x=1750293574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VyLSDtp3/79+REpFtOfivoiwhQtWS2WlyGvRoudAipo=;
        b=VStNtbyF7I5TDEa5c+TrGrrtsP5Q/SrkJl96zKPHXQ4oFx4Li+bN3LgkzFmxJoyjGv
         gU3X8ZiJ7QRHn2qjZd4L/aFr7kWahwBNXnRhMeazQ0debsMu0w2h0yYWlqOJ8NHy1KuN
         WtvSysATb1oA0F4msRs8tDRaUaQKfBBw/hJsBm/g0ifCneI5CeV4tH/Mp5sT8kF57It0
         39K3eCDyYZNNXDNA0Hj7YFhc5iT5SKLa5ToPCV30TYjf2+UCIiTNpQJMbaInBHVBbPpA
         ksgO4QKaZxGZGOgRGJK2gQgxKnXOY6sDQTBfDTA83oWqvzqlIl4mhgZURacFtTFADoan
         flMg==
X-Gm-Message-State: AOJu0Ywmh1mWuL2TeXj+arm7dQoX0EjLBhbuFDEtOhn7GcEUU8FXvxYA
	HQaHnQHvQLbOlrHVKv3c8w236d0F/VNiMxU+MtE3fyLp43zPmR/LlM+REMrQkg==
X-Gm-Gg: ASbGncuIvfnZjRpNbYkVXceFC1frvRQX47D9Jin44+e8BzAd48r1nR6oza5pHKFuCxA
	4yl2XUQU+T5FwiyNpFvwfaDrUAR5AY8f4yNtb3Pad13A6S/nE2mR7sB+UUQ+zU4gS1w1rWbx3AZ
	cfgxf1mGVCFz0qhqdCQSXMiEsHcmeXG4xmVzEtHS4LmkuUXKVe3sME2eS8MaAAhPynxHSGZlp2C
	siq6J6q5PGeTfeHNew2f29ZutsW11xcU4pIaHQYpOKRrFPZKHO4g0FiSUrKa84rJt/WhErXQWZ4
	VT9fQYjqRv08Crh64EKSD1z8UrM+9Mw5uKx0ZCZZiLgIJyuxsI6ck+lkXiIEAqVJ9FTyeRWHFS2
	oJ9IHywZY99KzGftvp3DN573EYikLYGViOY8w
X-Google-Smtp-Source: AGHT+IG1wkiN8hZKQxPPHMcYnO6q68DrpDvat0v3sRECZKC1dxLK1aUfI6nU+MNWxjZ/Pnf7eAsbVg==
X-Received: by 2002:a05:620a:450e:b0:7c0:b523:e1b6 with SMTP id af79cd13be357-7d3b2a0001dmr241481285a.11.1749688773986;
        Wed, 11 Jun 2025 17:39:33 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b528c300sm35935485a.101.2025.06.11.17.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 17:39:33 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	m.felsch@pengutronix.de,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 4/4] arm64: dts: imx8mp: Configure VPU clocks for overdrive
Date: Wed, 11 Jun 2025 19:39:22 -0500
Message-ID: <20250612003924.178251-5-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250612003924.178251-1-aford173@gmail.com>
References: <20250612003924.178251-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_173935_386658_91DC1363 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

The defaults for this SoC are configured for overdrive mode, but
the VPU clocks are currently configured for nominal mode.
Increase VPU_G1_CLK_ROOT to 800MHZ from 600MHz,
Increase VPU_G2_CLK_ROOT to 700MHZ from 500MHz, and
Increase VPU_BUS_CLK_ROOT to 800MHz from 600MHz.

This requires adjusting the clock parents. Since there is already
800MHz clock references, move the VPU_BUS and G1 clocks to it.
This frees up the VPU_PLL to be configured at 700MHz to run
the G2 clock at 700MHz.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Move VPU_PLL assignment into the G2 node, since it's only needed
     for it.

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 909555a5da4b..8884b3fe5e60 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2256,8 +2256,8 @@ vpu_g1: video-codec@38300000 {
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk IMX8MP_CLK_VPU_G1_ROOT>;
 			assigned-clocks = <&clk IMX8MP_CLK_VPU_G1>;
-			assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
-			assigned-clock-rates = <600000000>;
+			assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>;
+			assigned-clock-rates = <800000000>;
 			power-domains = <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_G1>;
 		};
 
@@ -2266,9 +2266,9 @@ vpu_g2: video-codec@38310000 {
 			reg = <0x38310000 0x10000>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk IMX8MP_CLK_VPU_G2_ROOT>;
-			assigned-clocks = <&clk IMX8MP_CLK_VPU_G2>;
-			assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
-			assigned-clock-rates = <500000000>;
+			assigned-clocks = <&clk IMX8MP_CLK_VPU_G2>, <&clk IMX8MP_VPU_PLL_OUT>;
+			assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
+			assigned-clock-rates = <700000000>, <700000000>;
 			power-domains = <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_G2>;
 		};
 
@@ -2283,9 +2283,9 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
 				 <&clk IMX8MP_CLK_VPU_G2_ROOT>,
 				 <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
 			clock-names = "g1", "g2", "vc8000e";
-			assigned-clocks = <&clk IMX8MP_VPU_PLL>, <&clk IMX8MP_CLK_VPU_BUS>;
-			assigned-clock-parents = <0>, <&clk IMX8MP_VPU_PLL_OUT>;
-			assigned-clock-rates = <600000000>, <600000000>;
+			assigned-clocks = <&clk IMX8MP_CLK_VPU_BUS>;
+			assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>;
+			assigned-clock-rates = <800000000>;
 			interconnects = <&noc IMX8MP_ICM_VPU_G1 &noc IMX8MP_ICN_VIDEO>,
 					<&noc IMX8MP_ICM_VPU_G2 &noc IMX8MP_ICN_VIDEO>,
 					<&noc IMX8MP_ICM_VPU_H1 &noc IMX8MP_ICN_VIDEO>;
-- 
2.48.1


