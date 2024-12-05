Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A131DE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 16:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JCLk/wc3MKwAF912ySsq2eZpu6hxxtGQsnffSicJSqo=; b=Fh6Wp/Gr0QgwdMLI/oPZ/m8F2I
	rh3lVjJE/pWxnZ9sT34d9R1pkkNRdJIfN0KVApv+8Vqoakba7O/VdLaZAsqZ+0y7zvtBIk+DOw3Id
	AH66XnFPKQmTxLzXu31mxczyHEp2X20GvOtRCRBVkUX9+bI3lZ6dSJW74i4ltI3P1FKbKOK0eo9MA
	lzgOMBY+RZi1II9zfX1bSbcHSwHsniq706f6wsadEeeIDS0Gu6dJmT+23TzcXxBoC4lbdqXxt+0z4
	6a1n2E79K70YT6wS1LLGhMxSKkxf/8pp8dNYsNMa9QHuz6nPyGlGG9kOBr+BPXisxxEFeUVW1A/DW
	Chqz2qGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEhF-0000000GkJu-0w4Y;
	Thu, 05 Dec 2024 16:27:21 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEgD-0000000Gk6m-2xEs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 16:26:18 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5d12709e262so1593701a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 08:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733415976; x=1734020776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JCLk/wc3MKwAF912ySsq2eZpu6hxxtGQsnffSicJSqo=;
        b=PjcTvxx2Kuqx7kjjik+m04VI0qu04+qZuW7lZziyifWw8oD+t0C47c71rscoSRwHYt
         w043crsGadFZTzurmrHmFjipY0Hvqv25EBIO/P2YCcK9PR4y5rsne+vABJ64VJmqpO7p
         N3c2HIw3p/lHytIhM8cdq2bPCNtDTej1iKiI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733415976; x=1734020776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JCLk/wc3MKwAF912ySsq2eZpu6hxxtGQsnffSicJSqo=;
        b=XuOeU8rKNNd9Wkb6x6CCelLPwvn0HMdOorTtVZQ3l1fra1ynahZo+SqwH6erkCAVkt
         nXmJ+RIn8z2gcPcjtjqo7+wNzf7aUy18W6+yso3dXEfgcmPod/1ZiU9VVynD5Dw0C/nk
         EqymDX2EnXteQxUK0cN8/erVJmh9TAhlInet9MdZ6c1pnGiqzkVFyXthrJniKHK+BxYQ
         UNselg5lCoNyyegJH7HzSiP0H02Mgm6T1rWlcoV514NasuSlvTdDGr1S8eK6B9jnA+t0
         zxQAjHsNfbqV8tmMoDbgWevXtgte6Bo+yU32gL261XiJ0f2bbVsVyagxtn+AWHz8PcVt
         cYcg==
X-Forwarded-Encrypted: i=1; AJvYcCVg/+8hYde4GGvLj+j4ZxU6Pi6g00bV5FqVgO8Ug/r1TmWLcbjZBca4zwQnka3bdmkMGSTzBH7uPy2EsKC71nKt@lists.infradead.org
X-Gm-Message-State: AOJu0YwfikV0ZieVz6RIMvNhqeKIAU9sekJ+cVmGNadiPUdtC0BJ3F2A
	/v5CJbFODxLRRpLe+H6yuV+RWEupDo3DeYSWDTDDNmucafg64R+oF+fJ12ghbCXyJD8AtCokBvU
	1
X-Gm-Gg: ASbGncszTqZ8m/Pu5mgEW0qcWV8lhd6Y82zj3Ra+eNQxhwKLhoxwl2W6qRrkFdvvo0I
	CevWhFT7hI4vgDiXL/MYBMsasKS/SO8kD+A+rGTtpNZnGzOc+pqZ+xipqJOtvrXhUIATvwvnAza
	Zeyi4Xw7rT10RXGoX01Z7p8+5kWOqrPm11IWLmj+csiS1gYXB6ds/eUZaUiS7SEpIM7OVyx5d6n
	1bAWIiLYRgQJ7h1g2WMA4qSWxnaJABLt7bQocXeh8IkYejlAbBO9AjuL4+VbXUQxSBKMYAKUzkU
	dwi1u0BfjUOxVnvg6LkEqHyMLeLvNRVcYj+6Pnx0fJ1ydg==
X-Google-Smtp-Source: AGHT+IFXrt5EyVJNmwjOInbQwIR0hRyAYkVbpEnHiym56laCVf9oh8OvxH+kl7ISbHpLv75ASv1ecQ==
X-Received: by 2002:a05:6402:5107:b0:5d0:eb2d:db97 with SMTP id 4fb4d7f45d1cf-5d10cb80219mr11709960a12.25.1733415975690;
        Thu, 05 Dec 2024 08:26:15 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14c798f98sm965026a12.57.2024.12.05.08.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 08:26:15 -0800 (PST)
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
Subject: [RESEND PATCH v2] arm64: dts: imx8mn-bsh-smm-s2/pro: add simple-framebuffer
Date: Thu,  5 Dec 2024 17:26:04 +0100
Message-ID: <20241205162612.1804274-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_082617_737528_39931661 
X-CRM114-Status: GOOD (  10.68  )
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


