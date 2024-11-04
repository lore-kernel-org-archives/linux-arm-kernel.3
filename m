Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1300D132DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 15:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JCLk/wc3MKwAF912ySsq2eZpu6hxxtGQsnffSicJSqo=; b=dyvislR7PRFcYt2U+f8e+Rk0AM
	VKdJhbRUiOinuFnOPc++JV5j8zm5/QK+OGo8Tnld350Z1o0rqQ07OH3T4YWjLFdh+u7UHf6fOyos7
	MZV+GYMTV3MyyiHDqGjwhEEkD6QjNu/FnVKruY9HilVeoh4f3MN30gx/TgxWhfBwczWWHztV1MPoM
	LewoV1Z8lReoycahj4rW28S2NVIk7u211EhDwabQ3kz9qWxCGN1L6lPUBLJLrVjdGPKSQn1Ii5VLC
	TfKhNZVGd5VajvrWLWSvWH2QDEEkTlyE+opxYNw/DIGMu9gSXF3OqeL9JXtyERqMvPQ3wMmO4K+eK
	/9ojjSZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yqf-0000000EB10-1l4b;
	Mon, 04 Nov 2024 15:18:33 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yny-0000000EAfW-3GaG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 15:15:48 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-539f58c68c5so7824968e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 07:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730733343; x=1731338143; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JCLk/wc3MKwAF912ySsq2eZpu6hxxtGQsnffSicJSqo=;
        b=nbyxA/QG6fUexc+2J1aJDiRKtFMFsqvhrC9j60RYbo+ZDf6X3XtHDplS4y/HtHLkVn
         ozEGE6sRvlKLEStvzzLTOWX0ubSeyLrxqRP8zV2lXGar3HbB+KLwODhLPfvWPMKS3Z0t
         e+MKpMHumH4qBqdxK/AAfE5gCU+ScJ+Xagf5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730733343; x=1731338143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JCLk/wc3MKwAF912ySsq2eZpu6hxxtGQsnffSicJSqo=;
        b=sdS+xzMQz/cffeE+eU8Qre03AA5rFQmrzQGhBIPz/Qmh9QDZRK8lzSmVFjeWPornqz
         dsiLza7W6kJ7y+2pza7M18WJ4wrGsp2dc7nugsu3ukEeQnS+hvK7GlXjlu0iuDh/DKd9
         GO29nAdNYZ4H7vY5YbyR9zKzFtkoeX9yefSPyqdSNTdY1h3NjCsZG4dTgWtSOB6bJMJs
         KFTThcAdDOmUzXuZL+mvCauBrD41Ya5w1rUfVE8eTuccLnLngxjYU8VddRN36C9/vRFo
         CxgdckZmRtVi0u4U/SHeW0LY2TzAqptzTtrShBgZc62GD97YB0WMrkVw/wfWSvlaVQE9
         YHBA==
X-Forwarded-Encrypted: i=1; AJvYcCVVPgW7sVk6g3vS1h0fMG3yPNB2SYKarjj6FY3Mm2dQ89oO/0yN77EIWInBHtrskm1AO7bUCnoOKv0aXt26iJxF@lists.infradead.org
X-Gm-Message-State: AOJu0YyoCy5SVwS2RuzZAepcVD1Wi6zEPgxMoyiTLbz77PnJlEv3eYCc
	ci15MWq+QMQ7Do0BFEG1ZvQd2T1NfcE0SvEXwU5y/Whz0QUK8adVyTiwEM+TUUI=
X-Google-Smtp-Source: AGHT+IHZ+MhzY+cG10/XeJWXQh7+JhLBbhGrXh2ptOIna5FlTvipU/iFvh7dLTIkTlqmlf8NGjimig==
X-Received: by 2002:a05:6512:1087:b0:539:936c:9845 with SMTP id 2adb3069b0e04-53d65e0b4afmr9070518e87.37.1730733343135;
        Mon, 04 Nov 2024 07:15:43 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.195])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564c4fafsm561885666b.47.2024.11.04.07.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 07:15:42 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] arm64: dts: imx8mn-bsh-smm-s2/pro: add simple-framebuffer
Date: Mon,  4 Nov 2024 16:15:20 +0100
Message-ID: <20241104151539.1678388-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_071546_877795_ECD07F77 
X-CRM114-Status: GOOD (  11.82  )
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

Add a simple-framebuffer node for U-Boot to further fill and activate.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Fix the warnings:
  (ranges_format): /chosen:ranges: empty "ranges" property but its #address-cells (1) differs from / (2)
  (ranges_format): /chosen:ranges: empty "ranges" property but its #size-cells (1) differs from / (2)
  by setting both #address-cells and #size-cells to 2.

 .../freescale/imx8mn-bsh-smm-s2-display.dtsi  | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
index 7675583a6b67..98dec3c42060 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
@@ -4,6 +4,34 @@
  */
 
 / {
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer-panel0 {
+			compatible = "simple-framebuffer";
+			clocks = <&clk IMX8MN_CLK_DISP_PIXEL_ROOT>, /* lcdif */
+				 <&clk IMX8MN_CLK_DISP_APB_ROOT>,
+				 <&clk IMX8MN_CLK_DISP_AXI_ROOT>,
+				 <&clk IMX8MN_VIDEO_PLL1>,
+				 <&clk IMX8MN_CLK_DISP_AXI_ROOT>, /* pgc_dispmix */
+				 <&clk IMX8MN_CLK_DISP_APB_ROOT>,
+				 <&clk IMX8MN_CLK_DISP_AXI>,
+				 <&clk IMX8MN_CLK_DISP_APB>,
+				 <&clk IMX8MN_SYS_PLL2_1000M>,
+				 <&clk IMX8MN_SYS_PLL1_800M>,
+				 <&clk IMX8MN_CLK_DSI_CORE>, /* mipi_disi */
+				 <&clk IMX8MN_CLK_DSI_PHY_REF>;
+
+			power-domains = <&disp_blk_ctrl IMX8MN_DISPBLK_PD_LCDIF>,
+					<&disp_blk_ctrl IMX8MN_DISPBLK_PD_MIPI_DSI>;
+			dvdd-supply = <&reg_3v3_dvdd>;
+			avdd-supply = <&reg_v3v3_avdd>;
+			status = "disabled";
+		};
+	};
+
 	backlight: backlight {
 		compatible = "pwm-backlight";
 		pwms = <&pwm1 0 700000 0>;	/* 700000 ns = 1337Hz */
-- 
2.43.0


