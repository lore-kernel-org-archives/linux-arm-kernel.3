Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAF1CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 10:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgtnLKHSY2AVtPo+97MnJT2AA2h1V52oQfGIO76/OrU=; b=WI/bE5ZXCunjAeL8wfw8MoN0Qy
	Y76DPG3dmO/c4hie6O6beakCewJphhg+afaJtG7eU8ZrPIbJ0PzEh7kSEQDuMdLO9KTDs+/3g+j92
	7P9o838tjRih7gq4vAe4+sq5IA1EeYtpe1jURSQd2bVWJQ6IqCmKCDGmuGH2klyPsjpjiHjNUURzj
	lyBhKefvtFn/hxeUvlnjXcSDcK1gf2LbPfLMPgTQVGGFQcWozn3mm2x8gp3Z8nV1lvdnVE7Q5IhWw
	WHXDlTB4/lSwqlOwLrhoimgU4qoI38gGiiwuLl8/GrjbzfReV75f9dMJEuHRQ5SlYBE4wevJ3XENK
	AOYIoSjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvY-00000003HjP-07jR;
	Mon, 08 Jun 2026 10:09:52 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvS-00000003Hb3-3vnF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 10:09:48 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490d1e54b3bso2916275e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 03:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913385; x=1781518185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgtnLKHSY2AVtPo+97MnJT2AA2h1V52oQfGIO76/OrU=;
        b=rtY+ezGsssZlYi13/rp8fnp3AVdlxyD6r2F3BHsjUbv4ajHVHNxgWMyqafEv2KsqH7
         d1t69NNTb7EQE5pAYtwHnkqdNCdKQ81b0GkwwLIyEGz9ilcWqwT5o1jJuoAv9JSMJaMW
         jYNXSUTs0qpdrgqrc1wwSndAuWcao3J+9rspPvxdoqvHhw+I84k/u5qe0HmMgWPOsZX0
         m+d4yzVuy39lKYhlljo3QqgHD+ispHjcwwkusdy2yOG+CaK8rYbbFWqlOItRC8vqz6zR
         rzMPStWQyOBeD1YpH3lCaScNqkR1uknCViYJFrpn/7++ogzFb7hTozotewvVJ9wuNucH
         V/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913385; x=1781518185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZgtnLKHSY2AVtPo+97MnJT2AA2h1V52oQfGIO76/OrU=;
        b=Y/kro56RgXo7DBVQAT4FT2CF+2KgU/cWQrMzjtpx2dOmkYCLqEd5nQi86YiyUcahSW
         yfNjmZ9GEBngDJZdP4Wr0DpLMaYp6U3hjq32r0j/RblsmzEDAcNRMvKDcIPBzExSoI9F
         3I5Z1VLL50NzKRg5fXP6+fZUmRoTXXDEXZj5xwQvfsUx5bNS7aB3AaLdKqgGawrY2u3U
         yG2GMjNEH/FSbEa1YBJYUSoU2/dDRNCLErjXXzmMcnY6kpsvF0EdrCGJX5Zyv97wpZMM
         g2BCFv51Bk2NsUcKaoFuQ0tneh1JFr4xMKROda8kpzPTWbtaKgA981HnOYeUH9Xzhuui
         OyGg==
X-Forwarded-Encrypted: i=1; AFNElJ/j9r7AfGExvp0ODsyiiMaih6LHUMv7JnHr8yVV3yKc8A/ElunrJ3oDxgKMsdFi3dZ2Hon/1m3S5bwugNdGo00b@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1kggewsgIUccVK0ABT1tju35MXaABKJ3bbv/L+pC1GOEsDXiN
	bOdDmNyBvwjer1U0RAYPpqPKWlMXJDvSCxeEsZlFGmzrLnRv0wfdmnn5
X-Gm-Gg: Acq92OEUKyZBNAsESCweAc5jOomKp1pcow1/sYzSjTDIOyYxibAQxBQJEOQOGEh6IkL
	feqr0XLG5Z+87lkxxtljGgpMVGJmeXUATEPe+V9O6aUoOcPbw7YlCnfdGdhBwrolpjfrGGB8zX2
	hYdH8n4AVcj9sqxen8nfxQe+y20Am9ppnmCHZrpEpnPTrFuIU8WFtCV+hgYcErxGoDND6qrEZ4l
	/hIRJFnauqfSi9cxlrkZfJ9C6mftmQY/v4YCDCObsT/A7UHlRIUMIDNPGnDK39HSMa18rEOQuM5
	vqBy+5qi/XgYK1pN6kX2uobTKqOOmcXknL9+T2uYMuwxjWm1ALQdr2ZHdGx/9SQSHeaSREWsd4s
	X2AGZ368yTFE3ekX6l5PoI1zUZEPv9oxldYL4N55+NwmlEMyHLxi23tMl9oL0Bj7A6pK8B0kFLU
	JZ14svfJhRFTTg678WEyUSGrT4AZVzeYmIcQ/xnWbozI/tK6AHm4f51UL+5Ne5EChJ0R2oLuBHu
	MsLf6GoXmSNFIbyrRY6qBG8azSbsBbD2+0nJ0YVSmLAJpaX9EWaDqyVTac=
X-Received: by 2002:a05:600c:3551:b0:490:6237:521b with SMTP id 5b1f17b1804b1-490c25cc5c2mr241349195e9.27.1780913384743;
        Mon, 08 Jun 2026 03:09:44 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:44 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4 07/14] arm64: dts: imx8mp-var-som-symphony: add HDMI support
Date: Mon,  8 Jun 2026 12:09:25 +0200
Message-ID: <2ee49ad6bf9313d00e64d74128399e45ad4f519c.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_030947_023151_A6E87CFC 
X-CRM114-Status: GOOD (  12.30  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the HDMI display pipeline and HDMI audio support on the Symphony
carrier board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Add HDMI HPD support

v2->v3:
 - 

v1->v2:
 - Add missing HDMI pinctrl configuration
 - Enable LCDIF3 for the HDMI display pipeline

 .../dts/freescale/imx8mp-var-som-symphony.dts | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index a2becf5409cf..f27ba602c743 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -48,6 +48,18 @@ led-0 {
 		};
 	};
 
+	native-hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "HDMI OUT";
+		type = "a";
+
+		port {
+			hdmi_in: endpoint {
+				remote-endpoint = <&hdmi_tx_out>;
+			};
+		};
+	};
+
 	pcie0_refclk: pcie0-refclk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -74,6 +86,43 @@ reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
 		states = <3300000 0x0 1800000 0x1>;
 		vin-supply = <&ldo5>;
 	};
+
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		model = "audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+	};
+};
+
+&aud2htx {
+	status = "okay";
+};
+
+&hdmi_pai {
+	status = "okay";
+};
+
+&hdmi_pvi {
+	status = "okay";
+};
+
+&hdmi_tx {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hdmi>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			hdmi_tx_out: endpoint {
+				remote-endpoint = <&hdmi_in>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
 };
 
 &i2c3 {
@@ -152,6 +201,10 @@ rtc@68 {
 	};
 };
 
+&lcdif3 {
+	status = "okay";
+};
+
 &pcie {
 	reset-gpios = <&pcal6408 1 GPIO_ACTIVE_LOW>;
 	status = "okay";
@@ -253,6 +306,15 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA			0x1c2
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC				0x10
+			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD				0x10
+		>;
+	};
+
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL                                 0x400001c2
-- 
2.47.3


