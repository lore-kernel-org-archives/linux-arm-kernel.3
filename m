Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C5CCD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WvRlDNPd907U87yIndLhCKBBwk0x0oHkEk0pAVg2DU8=; b=yoTjwO06E6Rs8rpuCqSX0xNGPM
	JBGtOlwMOY/nVW66yiwfB2PfFIIwPqyGEWgyLu44FH4pkwtFzVNMZqsA82Qpy/kN+CSHP0Vad8rE/
	/o+X4jNmqIg+Rwv2wPF6TvP2yfl2s6l4YHNK37KTXD5+01w0kYuBikfTA8hTaf4ZijFUCOiYMigiv
	0FoQ+3tPb2gTQ+lFV699WjFuhgHcEZHzpjhQyVCDhQRnMt6NXK3HW37KHNw8UlYzg51+2u4bf7wQ+
	4Uy9J3keSaurbvxBXVZNfCKEPbGMOMPx5nMO70z658uulPedMwVCXraj2DIOdzHUBdcFU0zutCs9w
	BNBFLmTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbAW-00000003oFO-4BKQ;
	Mon, 08 Jun 2026 14:41:37 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbAT-00000003o9Y-2DZu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:41:34 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so3341463f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929692; x=1781534492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvRlDNPd907U87yIndLhCKBBwk0x0oHkEk0pAVg2DU8=;
        b=d4SsfRZZj52TPtBzK4ZHV3tIt5k1eFAb4At2ZxM5zyWBrvbtJR5coGbcDSSShFrF4r
         IPt28wlI0r/oME03C+wc4sM3yIwry4LyL5QE/obwb6TBrD2vA/E7bqsm3jMSxouDSMRs
         Jtg9NpHksuIUiGaVkdfAs53CjFUnuXFPKEAhuPNUqdlv3J5SuKQbS+O+CYduZfEXfHDs
         dXcGKPMcyzS5YwsugxjyAGz0gr2TLNoA/MJwQ+3xzyxu4QUH7XXT3LKc89LU6krOqudI
         zzXmAdu4OHXEQfN2LciO93Tvke0MddoDxH/4cuk3Db6LGNW5t3Qu7ik1JMhkbnYmwfHt
         EZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929692; x=1781534492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WvRlDNPd907U87yIndLhCKBBwk0x0oHkEk0pAVg2DU8=;
        b=Jo/Hxq/Y9RGW+OSiKRTZetdeiUUWQThoS54ltOyvwAtajfkOV3pI8mQ6u60t2LXylJ
         Zb7wxVrGDzxl/iG0nWrDlej8ZlpeeneeYNr0S37wgdjx/LUluIeQoldWRPZP4dDu0xx7
         5b+fgOf+Bs0TGftHawiqLrcpGDX88xrtSDLn8TDbAVTgWMQTxdHZ4fWhYHsltZcK9Siz
         lfTRnIBsQdfluN/P3dYphl8xFzaf4n/fnZ/51NWmE/M0TbMR6nwCgoitNYj0DDDQtJOI
         AqNXh+/Jhyuf/9p0TIJ/uJ+/EZ9+OHmDgRduPk1grSFgLXKOzBAhHLQ8sr4xobDOVDBd
         TVjw==
X-Forwarded-Encrypted: i=1; AFNElJ8xbtPILO3T2dTz0IXmvcdcni28g9aCXMK/PpdNnJtDiqWpZff1yyFRgXz9/ExGOqNlruk7LdGInfVaVUuy37X/@lists.infradead.org
X-Gm-Message-State: AOJu0YyhqvItFk9NQDIQBtZ0d1CX7e8i/8vUUdQgOVic3jiXVYcemTB+
	BaCFLec7/JnpTm9CR/PA7MYe7V0tgPonkLcgsQWmYCGSshbnFj6vRU6D
X-Gm-Gg: Acq92OHRpqEiNhOM/j2JgwCD5FqN3hePQ1JZYHU0zApma8u7C5QT+x+YRjEdOOAway6
	APy3I0x0NVioX/tOn3wm15Tjaat+oKLXyPiLTb2/A0uEOKYQXFrgE+5P6Mm3pSDwRGg7zOoPXgm
	vKKnCvlUtB6oSBo9yHVbsh2jUTnRVWPGiINBi2IULUSvujwIKsL3nJARRbrC4BYzpIAO3mMq2Wc
	v0tugyyQRYQDjt9RLyOb6dGvL2pyVxn2f8ox6j50hs7p7+Alyput7YGeF62MDDIRz+ThBZt06xn
	d0P8JcSwwnuRK35mjyXzN5Z6IzR2U+cLJEShBa+ET+zQTSXpWaxlwklaTodRfOcDctaFJmAq0nK
	dy3ZmtXqbPHR4SJ6/YF89DIHdQngUgA1wm99GoFcY+caXQxKeuPVa+THJfFTrDsDb0iv9UyyNz1
	wSeRfiXtcDQHMWJ7OnvVpht1W5r7IYussnQN0TXtoUslrLXCy0Tvaf78kiOyFuhn1XAiqqYAHSp
	Xl8+kOFQTWVOMuKbHilpWahyA4ylaMwp2zqVMunzcAhomB1
X-Received: by 2002:a5d:4610:0:b0:460:e00:1215 with SMTP id ffacd0b85a97d-46030617c50mr17401096f8f.31.1780929691647;
        Mon, 08 Jun 2026 07:41:31 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:31 -0700 (PDT)
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
Subject: [PATCH v5 08/14] arm64: dts: imx8mp-var-som-symphony: add capacitive touchscreen
Date: Mon,  8 Jun 2026 16:41:09 +0200
Message-ID: <cf961b59769f34505a9b6f1f73849346c57ca7c0.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074133_586644_0879F665 
X-CRM114-Status: GOOD (  10.83  )
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

Add the FT5206 capacitive touchscreen controller on the Symphony carrier
board.
Describe the interrupt pin and touchscreen geometry.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 0beaee5f81c9..f8a4b5b2e9fb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -195,6 +195,21 @@ st33ktpm2xi2c: tpm@2e {
 		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
 	};
 
+	/* Capacitive touch controller */
+	ft5x06_ts: touchscreen@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_captouch>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		wakeup-source;
+	};
+
 	rtc@68 {
 		compatible = "dallas,ds1337";
 		reg = <0x68>;
@@ -306,6 +321,12 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_captouch: captouchgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03				0x16
+		>;
+	};
+
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
-- 
2.47.3


