Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1277DCAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 15:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvUD5sOX0XUPtTt6UDJ0HCSVZvbwurD550OyaX/37Lk=; b=G9oT/PtSdSG/J+gVzy7d/Cd883
	Zqvn0iMLGxZAdY09Xw39ftB3PeygyTON5oT9+QXB6WL32DNAn3A3Z7KTKKHXrQmE3iSQTOcfKdHU6
	YQJoZldmjoj7WpSq0K+yfsjwGsZHkR0+Yqq6mL6CtRVch0RBZklM9xn5oRr//9rWS7EsNN3GaXVq3
	MMoY5EVpun/3zEBr45PPlUsnc0jXeAZlPwTfj5U3Eb+/HetuaMYIeZYJFncG9gjSKWyErHY1n7csv
	Nw69Z1KMJERTYnemWamylycZuKPrw81PoH6w9fq/oNBN0q2LUZoWPJpVzEx08ugoHeuCO7jHrvAb+
	iDi2Y9JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyXfZ-00000008IZJ-3rAE;
	Tue, 16 Sep 2025 15:32:37 +0000
Received: from finn.gateworks.com ([108.161.129.64] helo=finn.localdomain)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyXfV-00000008IW1-09N3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 15:32:34 +0000
Received: from syn-068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
	by finn.localdomain with esmtp (Exim 4.95)
	(envelope-from <tharvey@gateworks.com>)
	id 1uyXfK-00Aysu-8N;
	Tue, 16 Sep 2025 15:32:22 +0000
From: Tim Harvey <tharvey@gateworks.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH 4/7] arm64: dts: imx8mm-venice-gw700x: reduce RGMII CLK drive strength
Date: Tue, 16 Sep 2025 08:32:13 -0700
Message-Id: <20250916153216.1042625-5-tharvey@gateworks.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250916153216.1042625-1-tharvey@gateworks.com>
References: <20250916153216.1042625-1-tharvey@gateworks.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_083233_072030_60198F09 
X-CRM114-Status: UNSURE (   8.85  )
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

The i.MX8M Mini FEC RGMII tracelength is less than 1in and does not
require a x6 drive strength. Reduce the CLK drive strength to x1 for
better emissions.

Signed-off-by: Tim Harvey <tharvey@gateworks.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi
index baf46fe28133..dca213c85cc3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi
@@ -446,7 +446,7 @@ MX8MM_IOMUXC_ENET_RD3_ENET1_RGMII_RD3		0x91
 			MX8MM_IOMUXC_ENET_RD2_ENET1_RGMII_RD2		0x91
 			MX8MM_IOMUXC_ENET_RD1_ENET1_RGMII_RD1		0x91
 			MX8MM_IOMUXC_ENET_RD0_ENET1_RGMII_RD0		0x91
-			MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x1f
+			MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x0
 			MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x91
 			MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
 			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
-- 
2.25.1


