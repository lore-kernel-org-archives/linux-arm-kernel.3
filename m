Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0031CC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 22:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89/6esdxobIB3oXPFQQO57dHmv1o6cOWK2fx905kC30=; b=v+LlVkvO+dOxTAUz7VEFUNTAOX
	bLCNnsFKMhIOtqGlod+0EyG8Sx2wrL7nhSaCTlSLNMDpXKzcJ+2sOPIZAl9EQ3yxpG3gqzyJ59CVH
	HuFTnLM9elOhEVVB2hl1r3Gk14fAl8W9gStdRSNZ2rq1yYDYtuot74FFjyB+oNj4ePFMuDmcw3ntB
	Iumgvuu4437OtJEVCJ70KWODn2wcgAnHfi0SI6WWYe02bNfivEwoVK4tOBGIXCUYweFEkFEEmeda3
	42vdkzGXTMhaUk86ZP6qA8f03yM+GkDMuaLWJyvchDOZbHpisTSqDiYgwu9glsJFVK1qGi8GwQdja
	DoPmEJsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL8D7-000000023yP-0cXT;
	Fri, 30 May 2025 22:28:21 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL82c-000000021a2-36dU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 22:17:31 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6face367320so16627026d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 15:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748643449; x=1749248249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89/6esdxobIB3oXPFQQO57dHmv1o6cOWK2fx905kC30=;
        b=NUSZWIb9eX65B1RE7FgR3loobWwnsSkdvc8Pi+T0mK5b8GQ9gwwVRcuu20oITH1vZV
         kJwSdfhMKL5B7qA1bem2BXY95S7jg9KKoyLdSt+99HVnUo+GqhZBCrAtOfgZDU3MfoKU
         vbKNtsaY5ltVLlGhCkfFkh6bldYRXw37p6c5ovnb3gf+tnTBxvzzn5QWiL4vzplkkFUt
         QwICop4WEGwAbzFsxaX5QA9BryzOT4c0FcC5kq4tvA1nSZH3HkQp0t0JSNCBrTf7WgFr
         M2CQe5NHWES8B2ZUQ2GaVqHlUJMVRKgQSjUCVHZCiiAbcUL09D9hgDLOK8xXatvZXnam
         h0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748643449; x=1749248249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89/6esdxobIB3oXPFQQO57dHmv1o6cOWK2fx905kC30=;
        b=okeWSNGRyMadI3QHtTs2WB8N8HmQmTuOsxxcSbteWEuqvUlh8aTTtuk2qgYNLrmMFt
         q6EPauN0MKFCkXD7E2FA+ZJEH/7s4e8sFMTZ5Rd2bbyTWpLZ1POwJmOZ50ZK34pevUmZ
         mczrNbWBo0htH5lvr4B9r0NXWpxRmjG0dSvAXgJ3Unj2u1ynYAQVea+KV5VHLkPRXSgC
         wucvxijKrf+iAUVCLxdq3XOqAvcJxRXUvRaYMvkGCj7/3wq/Y7FeS4Qvwic5ISmILikQ
         sNaWNtyFO87BDWKLFFyyAun4CvK5DSSb+LQWslGtmAsxm44BEl+q281AcrR+qcj/rl+9
         vKlA==
X-Gm-Message-State: AOJu0YzfrvcDEU7kptxOz4y6ppnZ1yY8ssehas5JTc6xWroh5x19jjKi
	MMD9GNb4sGDTEHCyD5PDmrordSKxEW+KPyhIu2HIX4BJnD1qGiNMTYM1zzY23Q==
X-Gm-Gg: ASbGncs7RbltwarVRc+bF9ycOpSxz0UhOojnnPtEjILcouLnv0AuRlSrbQjwEJKUxCW
	0KikfjUTM1UJXZQYB/Am44c2NnaEKa6VjPPaSD+jnmHkx+Ot3X8robAtfcYaCXINBBjp1SQkFWz
	Uu7tw0+p4i0sTpRNVBsPuXqO/RGm7mFIYirNbcVbty62fCk97IIyb0CWmPUeDZ+KZRMBAH4GWsv
	B/JrVBMdzs8OJKrqbNohLRJzhjEh70JkpDYti5iVZTBOdxcXFw5crXvwPVA5Qdpj37z7qG1QpcM
	FzV5SJLXiOA0PnamhRz2sz1aWhH3rCI7TSt/dY/M0iErE4OjoaHo7stHbUkvYTnbmzlWN9Jbfya
	lagQsbdUsErzAY15ioP6xyp9yLA==
X-Google-Smtp-Source: AGHT+IH6ZsYKk6i7ecLc1HWTvwLW3YahjSaeJf60X60SsGSRpv9givwN0lV3GVO1/HEeeqSYTFYdjA==
X-Received: by 2002:ad4:574e:0:b0:6d4:19a0:202 with SMTP id 6a1803df08f44-6fad1a9d02amr63019336d6.33.1748643449174;
        Fri, 30 May 2025 15:17:29 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d4d0cesm29986866d6.35.2025.05.30.15.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 15:17:28 -0700 (PDT)
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
Subject: [PATCH 4/4] arm64: dts: imx8mp: Configure VPU clocks for overdrive
Date: Fri, 30 May 2025 17:17:11 -0500
Message-ID: <20250530221713.54804-5-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250530221713.54804-1-aford173@gmail.com>
References: <20250530221713.54804-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_151730_780394_4A705AF2 
X-CRM114-Status: GOOD (  13.25  )
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
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 909555a5da4b..848b25c9b752 100644
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
 
@@ -2267,8 +2267,8 @@ vpu_g2: video-codec@38310000 {
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk IMX8MP_CLK_VPU_G2_ROOT>;
 			assigned-clocks = <&clk IMX8MP_CLK_VPU_G2>;
-			assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
-			assigned-clock-rates = <500000000>;
+			assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
+			assigned-clock-rates = <700000000>;
 			power-domains = <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_G2>;
 		};
 
@@ -2284,8 +2284,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
 				 <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
 			clock-names = "g1", "g2", "vc8000e";
 			assigned-clocks = <&clk IMX8MP_VPU_PLL>, <&clk IMX8MP_CLK_VPU_BUS>;
-			assigned-clock-parents = <0>, <&clk IMX8MP_VPU_PLL_OUT>;
-			assigned-clock-rates = <600000000>, <600000000>;
+			assigned-clock-parents = <0>, <&clk IMX8MP_SYS_PLL1_800M>;
+			assigned-clock-rates = <700000000>, <800000000>;
 			interconnects = <&noc IMX8MP_ICM_VPU_G1 &noc IMX8MP_ICN_VIDEO>,
 					<&noc IMX8MP_ICM_VPU_G2 &noc IMX8MP_ICN_VIDEO>,
 					<&noc IMX8MP_ICM_VPU_H1 &noc IMX8MP_ICN_VIDEO>;
-- 
2.48.1


