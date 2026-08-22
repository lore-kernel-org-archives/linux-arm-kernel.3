Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11268C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 05:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5WH5D0JtSfK72vdeI0nhh2PL53o2bVvJzV3Cx+3KNFU=; b=VgHTCUIQKn35IrfyTeDXATVtGZ
	IN19km4MGuOwZt3mdheXRZp7Oh77JzZNTeHCH4A8T/uxutHT/+UierjZ4S6QxT6qLMooIUvz6dD8a
	BixfYxBIqCO1zx0pNgxUHrotnRQMldZekQwwfqqmh42G62PlT4Bw6nv/bbHqA6wzSWaxVZlAzKJZO
	dlaZYZqrN+ZqyP0yCHUKvwvLLEKw0w5q68NVrlkS738Q4r5uRaDEfbOEOoLc8aQ+qtNomWIg4ll6v
	R5rsV6O6RPwc6V6dmkYyv4KH4OzyHfMhf6z6rdY0ynLH1jO7obphT+iX2G/of7qiatCEbIREuchTM
	lRHvW4Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxeED-0000000EIh9-3n1x;
	Sat, 22 Aug 2026 05:25:13 +0000
Received: from mini.riabenko.com ([2a01:d0:333:0:d250:99ff:fe83:4d25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxeEB-0000000EIgg-1iBM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 05:25:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=riabenko.com; s=selector; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:Subject:Date:
	Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5WH5D0JtSfK72vdeI0nhh2PL53o2bVvJzV3Cx+3KNFU=; b=T3JuoMR9ELdbyGbSwz1h2H7w0d
	8r576PZcWwLwV9x67G5rGYNtHRfValfZ7J+GcWdPMKC/z+SOKEoruLQRsTM4P0HyFt71TYiKb/mmr
	ju5hiy2a4u4+du8GrSsvNOpjYIt+W4BVZYIUwjvyQJX4Oyq+I4AfwZktqHO/nTMCQM8QJsgF68j9r
	imfSVJYP9SYAADXdsJni6gJk4anBkdQP2h1PNwfkNjSS11AB5AQl8n70YXx1VGw5M40whcBdWXCTH
	QXJsI+ULEzMq1RrGxV0h+mGubY13r9wttE0UTLvjCfkmd4Z/hW/bbzqNKLM7QfBX3gss9f8/RC4tc
	lkW3BqWA==;
Received: from librecmc.lan ([192.168.10.1] helo=desk.lan)
	by mini.riabenko.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <roman@riabenko.com>)
	id 1wxeDt-0000000005R-1xxc;
	Sat, 22 Aug 2026 08:24:53 +0300
From: Roman Riabenko <roman@riabenko.com>
To: andrew@lunn.ch,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Roman Riabenko <roman@riabenko.com>
Subject: [PATCH v2] arm64: dts: allwinner: a64: olinuxino: Fix phy-mode
Date: Sat, 22 Aug 2026 08:23:53 +0300
Message-ID: <20260822052353.22881-1-roman@riabenko.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_222511_504734_FE5CA2D4 
X-CRM114-Status: GOOD (  10.40  )
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

The 'rgmii' mode does not appear to describe the RGMII timing in Olimex
A64-OlinuXino boards. The PCB layout shows that the clock and data
traces have roughly the same lengths for both RX and TX and, thus, do
not appear to implement the 2 ns RGMII delay or introduce any
significant delay.

According to the KSZ9031RNX datasheet, the PHY adds a typical 1.2 ns RX
delay and no TX delay by default. The 'rgmii-id' mode causes the PHY
driver to enable appropriate internal RGMII delays.

Packet loss in the downlink direction is observed with the 'rgmii' mode
and is severe enough to interfere with downloads and disrupt software
installation. No packet loss is observed with 'rgmii-id'.

Adjusting the TX delay in the DT was found to be unnecessary with
'rgmii-id'.

Signed-off-by: Roman Riabenko <roman@riabenko.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
index fd3794678c33..8cb2381e21da 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
@@ -102,10 +102,9 @@ &ehci1 {
 &emac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&rgmii_pins>;
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 	phy-handle = <&ext_rgmii_phy>;
 	phy-supply = <&reg_dcdc1>;
-	allwinner,tx-delay-ps = <600>;
 	status = "okay";
 };
 
-- 
2.54.0


