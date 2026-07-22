Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5078C44532
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 10:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EU/+Qn2XRS4DDn4lGHvzZzxZVrDtGY5ngYyeG3iNo5M=; b=sy6xJVZ2f329B/BEmm4YDuM4S8
	kkykrjehA62ygbHZrkvQlTkdV/WIzjV0q6M5k/EASkGNN2E7fjaje4MSgq26w7mOgGgbltm1UBz8L
	1tgVEyxFPcCr5J4cWno7HHNMlCH2Z8AeLWfZONqCl0xBeXnEulwWHiDFWB8fy1mnV6wykmwQhu+9A
	hhs7eGcxi27B040oQ2nREZSXHs5bG8cDQEYqxVjYYJYJCcUDID7Y+QxyaearnDrVF590PY5dO518j
	DBJzeTWkE6XZglQVKJh/bFd73Ygk/dHUWQI9uwWzIPTqta83I4F5kQxPDe0TVbMqHhu+Bb0Td/bLA
	sHvOZ/tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUOw-0000000Ba6n-0dqg;
	Wed, 22 Jul 2026 10:42:10 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUOu-0000000Ba6C-0R1A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 10:42:09 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso21851055e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 03:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784716926; x=1785321726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EU/+Qn2XRS4DDn4lGHvzZzxZVrDtGY5ngYyeG3iNo5M=;
        b=otDU+yvZ+f4YxfdeJcgYCJC4H97BUYV8S84lid1mmstif83DAHwSkuIwXubWQ6fIUh
         pBpz45/hSiVkd8YO7osI3OtqHkvnv/BQRgFiA4MGwho/G/U1zKHSikiryvt50zrWWpx6
         08aG3S5L1Tj5LGf1gr9CKTbkVRFAiwabVyjE36/WfJbbBvOVA0XFpjXPn1LPgXtdvhgX
         MSSNFPFO9iqKRmUnsls30XdWtxdt6UOPC6pgcVuNG3+NVPxHYq4Jrn1gEx1HsO/VdXh3
         B5k5dKGvIBrxmjO5Bd1DsTZJXQ3EFqMcF2uhisfxEKkqJwZsoB6MacO08T1rxTkg3gRr
         ebVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784716926; x=1785321726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EU/+Qn2XRS4DDn4lGHvzZzxZVrDtGY5ngYyeG3iNo5M=;
        b=H3jr0wNG6e3N5SjIEUOPxbzjMrFtZNnnyJp5qyHNsiIViqO7keY4FzVqkTwW/ODig7
         IpYA8fajb+l+PpZTNaSSAOl6/1pdDQgVVe46i4oiUnuyde5QBFPUXlpV/j7a4E5WKPP9
         W94SfOfHQXcv73KHSnoziKEuDx6zYiccUVQThPZTA5U3vmQgleg0h8CrATfagT1+/oMd
         +LBaYMTVxLIoWZJk9+boO9yGcmNUtx2cTeDLJ7JFF+QmQQvdShMdnBnyYeqK61HNRrBf
         vEAmMK4jlfAQyqqOLGc/6op+1POXQDZrktPw5SoDFFWFI2pkAm5We+bAiqu/AGyIIEb5
         zMMw==
X-Forwarded-Encrypted: i=1; AHgh+Roh2+K2ATkQU2odwCParJxSxL5lejlZNktZMv4J4H78zLJLm7jgzHHl1avIjiw8SDOJ9GuoHZ6c3kq7Egh0RRos@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3PaUsDrClBlm4NG1wg21YDL4i9cfh74FOwhsjiNIqmQxrRYiz
	R4pW4CIWgLCkBViUtYtChI9O2R9/8q8yt9rJ2hYblF7ZSm30c+twsVEE
X-Gm-Gg: AR+sD11uOIQG3fw7FxAMFofoQPVS65IcOORV5Evnb8OpXv85Trir9Jkat5L/m2bjGiB
	rpeNSurnDnrzG0OELM7SvVrgMzKN2vBok6QE2IHqgv803/frlalIv+jpwsnRS/nNrglAtbb4vr4
	+kV9s8ZTjvBRLYD643WOURkSSQCx41WI2f7tc5sUOI2H3KFACJHPTob8LjbVqIldNar/G+bQRFY
	ozShy4PYCzdNEVh8ZamEx+JLc/V5DfpWfpyeyPO9LruG7BIUDa7rkL0LYNl242b6QgRn1FjuFt6
	r1nTVAPzcgsBlrchdtEfu6OsgCiC/BaUOYL8cQ9HU75Q90vvkgp3AO5wS6naLpL992q2oUpDcc3
	nZc2d9vElLupqdDO6p7lyWx1RmSeqy9A4PPxEx8H7QcrPLIlRtTDldwRvRMjNsHWLxrc5sDLusW
	OC+sucInCZB/5UVHyXIz+zoFGrlbkIwD590MD1weOY+guimhh70smSRQ1z0y+tbjwTsdnce/OdK
	USomxz7oT25+l0=
X-Received: by 2002:a05:600c:5490:b0:495:6130:7805 with SMTP id 5b1f17b1804b1-49561307a51mr114097015e9.14.1784716925698;
        Wed, 22 Jul 2026 03:42:05 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c98ebsm126602615e9.13.2026.07.22.03.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:42:05 -0700 (PDT)
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
Subject: [PATCH v1 1/1] arm64: dts: imx8qm-ss-dma: add LPUART4
Date: Wed, 22 Jul 2026 12:42:00 +0200
Message-ID: <20260722104200.17729-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_034208_182113_784CF1EF 
X-CRM114-Status: GOOD (  10.87  )
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

Add the missing LPUART4 node to the i.MX8QM DMA subsystem description.

The peripheral is present in the SoC and its LPCG clock controller is
already described, but the UART device node is currently missing.
Describe its registers, interrupt, clocks, power domain and eDMA
channels based on the NXP downstream device tree.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
index 974e193f8dcb..25c5e4423163 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
@@ -8,6 +8,22 @@
 /delete-node/ &adma_pwm_lpcg;
 
 &dma_subsys {
+	lpuart4: serial@5a0a0000 {
+		compatible = "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
+		reg = <0x5a0a0000 0x1000>;
+		interrupts = <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-parent = <&gic>;
+		clocks = <&uart4_lpcg 1>, <&uart4_lpcg 0>;
+		clock-names = "ipg", "baud";
+		assigned-clocks = <&clk IMX_SC_R_UART_4 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <80000000>;
+		power-domains = <&pd IMX_SC_R_UART_4>;
+		dma-names = "rx","tx";
+		dmas = <&edma2 20 0 1>,
+		       <&edma2 21 0 0>;
+		status = "disabled";
+	};
+
 	uart4_lpcg: clock-controller@5a4a0000 {
 		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5a4a0000 0x10000>;
-- 
2.47.3


