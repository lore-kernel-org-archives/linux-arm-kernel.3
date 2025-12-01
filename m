Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23D2D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 13:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ART4te0v+vV281V0YHRF37dtpcBxay9iLJ0GSUM95g=; b=b8O4K8OuBHFEnh098nwhijYSAG
	+/VABqDueG9s3Lq4Jl4k+a1AbZuedmrFhvtzCHAsOYHGYseRE4iXyOJm4L5SMqwA8XK880hHF8n7X
	mTn4rfLeQVBEYyVuW+/j4vwCxNZNob2BGbotUgBMwEFABqD62bJUOQ9MwnULnXovuVFS0gYQVHsDW
	XvZ+sqUVBVG40+RL/SPeGeVMw75ETPKjUBRRrt16RRPfH7CoeIpNhT2LprjLQVgw3JlI8XgA6DsEG
	jNJFcuFjVZO6oZl444JtFVp0iiYyPnQt2W1YgyMLO3KphoGAHQO680we0Nl4P5nJo3AOC4WtrxNzt
	pcDj/Fww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ411-00000003z1e-1r6i;
	Mon, 01 Dec 2025 13:32:31 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3du-00000003hDQ-3bEz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 13:08:40 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6419b7b4b80so6194138a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 05:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764594517; x=1765199317; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ART4te0v+vV281V0YHRF37dtpcBxay9iLJ0GSUM95g=;
        b=K21RFkBJEoIdeSpSlRn61wKbuFXXZy+/wsszuSZ+XTKjR4sxA2w2AZ5E2McJWS4OmN
         MsEKbNVxoG/gCgcIL0pvtfA0ZP84bEqHLnjtQjkGYQBuw9Zf/VTDBf+U0SUUPgTC+vsh
         jY5GrYGpf4iXo+L3gaO0hG/8HHS7visQl3GxfU9OtcuMBaZDS7Ot6hmAGgCa3/ja627d
         3J+EqnpJsSujPraBwtTiwe4M5hkoyaEwpf0UEbuNXT/m3OTuUO96CSw1dYXS1WdOJ32J
         GAT0Xwj7Pk+YmW4HZn6yYqCTOGfyZSVFlQh7Z2G907qxCEE/Qra0N6q9VCUA+PFBWItV
         7bVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764594517; x=1765199317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ART4te0v+vV281V0YHRF37dtpcBxay9iLJ0GSUM95g=;
        b=mrmaUZ/WER9LDcCU/Q4JUQo8xiCF9t6L02U3+5AXdyyxy2vgkv+U46dT7KfCXN+CAV
         lowqgTdJgHbfCfkYCVVG8Q+7dMX8gPEb2MLxOFmMf4qpyV7Y0w6/+7qI8+sdU0bIS3jI
         gOQ6FPvzrdMtRUKzOYjQx85Ro/4DDsx9Anr7mtZWzKQpnF6GEo85qXmiXo7hgNr+fJ9X
         6Z72rZcwjkSuu8qxiEqC9AEM8H2lNsnEbORdO4dnHvjOGIxPetYCclm4IkQl2MRpsIyG
         nq5Tf2kXta9v+GrQRZyUu4SdaZHunaiReE/lbkpqMqHhcJ57JBpifVwPvNCU4FaU4ImH
         ++9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXiN8dl4m9R324j3JuP1OfrP8JUJLrJ6PVxGszS9h8CFB+U6+vvZdiEisyqQ3ES/f6ZN2A83eaImOXCE47whlO+@lists.infradead.org
X-Gm-Message-State: AOJu0YwCn9kbOp49NUXBMu1eJA2WDlGcn0mQf2lRSVUYOzDk7CC6n5cw
	yCLAsCoRqbddO6bDiJhk57u9oiHF69nrHoSTK6XsRs/pfXze6eFfWw8zW4Sa/Zqb3no=
X-Gm-Gg: ASbGncu98JMmeviaxqzpmyEJCBKpmRyz3eylro4heZ/hkq0fGDZszdPq2icpZTNnR/8
	MnLn2Uk80U4KQRTeRKiTsRQ/wUhRlz039kibSVT8pGQEELd1yl6/xpVRFT2OSdezsIp3WG3nzoM
	HPnZErcE/ch8ophoRAOWI5IvT/FQD7Hb9mmcejC7OqcfhBbVi4woJr7i6a53prM70soYyklKE2w
	f31nQ9dYrmN5KRmNQS/YRwB6JgcPM5vXujP2UwLMcjbM2/F4iMMZIOUE27d9E63b7bIi/KoE6l0
	LB43tBOI6GKYfPari8YQaxcq63lHaiHoI6ObQsqncowTD8iLaHjtr6oKGmy66P8Jeg65DHeqpTI
	xYrHpNv/UvkM433TE6NT610Td6arw//vFVXBod2fYR7mXpbFbobbjmqMFuHS7FIJV9EAnFTmATu
	vvK9Yo6jHIVYxhDFgiqJa/Sc2A92I=
X-Google-Smtp-Source: AGHT+IGy8H4hZkMdsPgp5ClNfSZPP5T+1EX7uyKwcjKjvElb0fOWVlyxh4nPkZ/Ts/Rfemd9Q4kkuA==
X-Received: by 2002:a17:906:b4a:b0:b73:53ab:cfa1 with SMTP id a640c23a62f3a-b76715ab9ebmr3096430866b.17.1764594516820;
        Mon, 01 Dec 2025 05:08:36 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b76f51c67e2sm1228965866b.27.2025.12.01.05.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 05:08:36 -0800 (PST)
Date: Mon, 1 Dec 2025 16:08:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org
Subject: [PATCH 4/4] dts: s32g: Add GPR syscon region
Message-ID: <c8302f53fcbb5cb5afe42cdb15aba7e2e6ed7338.1764592300.git.dan.carpenter@linaro.org>
References: <cover.1764592300.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1764592300.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_050838_912731_097A516F 
X-CRM114-Status: GOOD (  11.37  )
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

Add the GPR syscon region for the s32 chipset.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 8 ++++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 51d00dac12de..3c9472f6c174 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -325,6 +325,13 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		gpr: syscon@4007c000 {
+			compatible = "nxp,s32-gpr", "syscon";
+			reg = <0x4007c000 0x3000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		ocotp: nvmem@400a4000 {
 			compatible = "nxp,s32g2-ocotp";
 			reg = <0x400a4000 0x400>;
@@ -731,6 +738,7 @@ gmac0: ethernet@4033c000 {
 			compatible = "nxp,s32g2-dwmac";
 			reg = <0x4033c000 0x2000>, /* gmac IP */
 			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
+			phy-sel = <&gpr 0x4>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index eff7673e7f34..0ceca3caf133 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -383,6 +383,13 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		gpr: syscon@4007c000 {
+			compatible = "nxp,s32-gpr", "syscon";
+			reg = <0x4007c000 0x3000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		ocotp: nvmem@400a4000 {
 			compatible = "nxp,s32g3-ocotp", "nxp,s32g2-ocotp";
 			reg = <0x400a4000 0x400>;
@@ -808,6 +815,7 @@ gmac0: ethernet@4033c000 {
 			compatible = "nxp,s32g2-dwmac";
 			reg = <0x4033c000 0x2000>, /* gmac IP */
 			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
+			phy-sel = <&gpr 0x4>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
-- 
2.51.0


