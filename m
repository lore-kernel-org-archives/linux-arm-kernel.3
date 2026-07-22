Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD8FC44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 11:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CtM+fsCt4wxJcsndijBxF/F1yhByHuvUrkUU2HREy8Q=; b=dm+MWxhFZOAlNMG0t21hDJndbp
	MDYAitkKJ4cGCXRviPiokzHXpDDMejC0T1F0ZWIpfL0Qq4S+BSbqNDd0lOETlUJC03smBwwkKVUZo
	/dQ53zUZd15VOkkX/BMz/r5xyjhqK0xehe3P7VH/FpAHPYnBr2k34ivBkZgs1nwDwBUYwSv1n4Eax
	fkOljMkPYOlnkmtLp3vkvMoaZfn5RuDIiZUhyjquVax7WlwE6VlvpkubgW+au6nbuOzCwTeqijFkX
	KW8pP3DVJ2rm61kg8wCrjPUADUFh/pcPJVH4Nu7ZAfwe5vXt5aqi8TqEk2oA+CwAZMLlPX9qU2NuS
	wskEuCYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVCL-0000000Bf4J-487P;
	Wed, 22 Jul 2026 11:33:13 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVCJ-0000000Bf3g-2UwG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 11:33:12 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso40275395e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 04:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784719989; x=1785324789; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CtM+fsCt4wxJcsndijBxF/F1yhByHuvUrkUU2HREy8Q=;
        b=aWx3h0ZayJbpMRz9MfBgt336+lw0vsyYpN9S6HNsfNmFRH92/IUx16ffyLxcC2TLQ/
         sB3wUjIe475RJkII3kpkXt5NiOeWWibRGFHBTa/eEJ/UD+fffm63MhVTk9Vo5Xi15MyM
         Zr9X9St3///BeOFM9NM8qVsPGW0FFV0gLerLAK7ukUGc5H2f7vVzK7dh5HiQ7AzLej9J
         2KRmFStxGntqW68CLcxRkoeDFI91mRaR2KTiOASSgMk2jZFr70qNcJH3IUpST7DI7NS6
         j8YBMgSb9UHve0Fu7wlf3HnxansXkTbiErcxjH5OiY2jZMh5fd0sIzuTM/WmZbxdn64I
         1aqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784719989; x=1785324789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CtM+fsCt4wxJcsndijBxF/F1yhByHuvUrkUU2HREy8Q=;
        b=hx5DHYo+5I/TD2FqXIgvBCIQ3BiRlzbVmRA1P5cBPMRSQMW2PvgYMg/2UfTR1VkAbs
         4b5A4gt1hcDP3m5m+xdujMDSHp//9ai4U2VUfaMtVH1g5KBr4LAE5xHyrKxF1tm5m2rm
         L3A+sxNNQYM5iJ9c62J6b8qw8LH57t+qWzv6oZHGFeigK4Ke/xJsoQyqcACjOSXWYkii
         NjfkX4ZKGnUVzXVYOHSgMLJJDXS/XqVna/Rjo0XveZU/XPufu3i4cgpHRYK7/QbgCmnw
         nHic6ds9aHs6eHxMLh2nvNeg+NvDvI97eYZgmR8p8NyD1TlFPLoNPlGTb2dh1YR9dGDQ
         vWWw==
X-Forwarded-Encrypted: i=1; AHgh+Rp2K16t/mcFWbifigqR8NSPyppU0+BResVp8caaIlsFyQTHiEd/g8VoxP3C757NyptYYrc2NGDA5mV/F6O0AO/c@lists.infradead.org
X-Gm-Message-State: AOJu0YxxE3CImW5WFGWss7nQNSu8DgG9VsOt+bntWPolBdR5ZkSM1xI9
	d0qW26WlnAZq4AeMRc0H5X+acCNeyOxEqkCQZZNaSpscN1ViX7DLyllR
X-Gm-Gg: AR+sD13ShxOz52woWAAVPiIozkKXUD4cTBt0GtZLEIk9C/Mj8gscnFm4BEoE8AmL1j6
	HnJuPqIaQ5bFDac+FM9JX1AkhnyN6xcVvTP4pVY8RPeZ4XwuWg/lNrZKSY0728eFZ6RbEDw1Ccb
	GxVSk78KwDcgNqBwVP+gkFKJCu1co8XMWNpZm7LbQHCZhUpRf7c5Xqmaq7NOg7PGTudQ5iZWYZw
	oKjUEBhz9MT8lRzgjyPgK41bTR9k+R7J0xEQjoMlK6OVoGhLDcv897Nb2DoGqrQXXDvsLAfpfP4
	+Ig+f9pPa9svqh3FWSB9aL3HHhhclDcl94ZkrOtg7ubYCFTjJxD/d4DDZcKVrMws9g3owS95hQW
	UarYx0J1Y7WZwCFtdV1AR8F/Qxl9XzZGjH8GjDVkAd7EIL5w6YpmyvjdX77nq3h2W8kF9m4ohKw
	T9CCaaVgZ+zz4KgHqd3HpsO1Bun50SyCs9aKhdTQ0205v17NVX1Y7igiEhxvIlrgXVO9mTILlwY
	Vh3KtrF+EdNK7hIHtULW1N63g==
X-Received: by 2002:a05:600c:19cf:b0:493:a438:7f98 with SMTP id 5b1f17b1804b1-4954aa1a116mr275465885e9.18.1784719989472;
        Wed, 22 Jul 2026 04:33:09 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495686a8600sm118911045e9.6.2026.07.22.04.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 04:33:09 -0700 (PDT)
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
Subject: [PATCH v1 1/1] arm64: dts: imx8qm-var-som-symphony: enable expansion header UART
Date: Wed, 22 Jul 2026 13:33:05 +0200
Message-ID: <20260722113305.28817-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_043311_649143_2A784A3B 
X-CRM114-Status: GOOD (  10.88  )
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

Enable LPUART4 and configure its pin multiplexing to expose the UART
interface on the Symphony expansion header.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8qm-var-som-symphony.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
index c7d3073b4041..ec55b86c220d 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
@@ -287,6 +287,13 @@ &lpuart2 {
 	status = "okay";
 };
 
+/* header */
+&lpuart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart4>;
+	status = "okay";
+};
+
 &pca9534 {
 	usb3-signal-route-hog {
 		gpio-hog;
@@ -428,6 +435,13 @@ IMX8QM_LVDS0_I2C1_SDA_DMA_UART2_RX			0x06000020
 		>;
 	};
 
+	pinctrl_lpuart4: lpuart4grp {
+		fsl,pins = <
+			IMX8QM_M40_GPIO0_01_DMA_UART4_TX			0x06000020
+			IMX8QM_M40_GPIO0_00_DMA_UART4_RX			0x06000020
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			IMX8QM_MIPI_CSI0_MCLK_OUT_LSIO_GPIO1_IO24		0x00000021
-- 
2.47.3


