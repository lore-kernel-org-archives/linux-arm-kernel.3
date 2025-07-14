Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E74DC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 10:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5RnWE8Ygsf6YGJd0DVniDSNOEKXVvEcC+0NZbP3MQSw=; b=l8m9P2I6Ig2VdAHJGen6u+esbo
	NLbKiy6avDXlKj+z8+m7BRD8KNwi+20vZFljctGVsTUfL1kjY0ItpdGAOu5WLGRyXlVIsByGL+UQM
	2XrEo8oUF/etBDoUnXdXebDSozw6EVS0J7RLVa7YpAsrbo6Uxh5GG8gDTKIqrqfKygfkkSIMPBVN4
	unltF44wHGi5VJTotXVKC4bRO+6ruc5HcYzsRW28hiVfAcQjKCeyJCLIe2/5kod0sQmWTBobMezSn
	GhgLHDa7b/7YADrEkJ1pmMrixw3qCDfOuucTrIAp0IwDb45zY1i/r3MOXAF3ZLPuLm/kbDTct/Ty8
	4TRd4ujQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubGbc-00000001vai-47iK;
	Mon, 14 Jul 2025 10:40:20 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubGXs-00000001vLi-3nxH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 10:36:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=5RnWE8Ygsf6YGJd0DVniDSNOEKXVvEcC+0NZbP3MQSw=; b=Sth0hU4N6oWEa4M7hiRQG5QKuA
	ncVTUQvfjHf4pVE4tEXM2Im5wgae3XOaSfumAzZzUAe9uMkbdDziWeNCIRg6qWzJKsm5L1z/IwQdg
	ZY0OKwH4gnGXc/v+8QG+CjoUk6Go2WNYaDHboSo5yg8IcEItnmgvIJTS/aBOw7i47hn/NqeMTSOaF
	+6XJjaykSXJmDxgKYzMPmLOoJvdQeD61EOYWyxYoz+sYsljz/47CJUhZmAXD/+qNdI6CZMe9Q3DEv
	OCfOqEmj6wEA/9v8spnp3503TFP1sFhrPdgBsnnaCxAAHRT9LBVlSN+fWdtHWuC63vi0buSyblnBg
	D/GXzmpA==;
Received: from [89.212.21.243] (port=57634 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1ubGXp-001ATQ-1V;
	Mon, 14 Jul 2025 12:36:25 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
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
	upstream@lists.phytec.de
Subject: [PATCH] arm64: dts: freescale: imx93-phyboard-nash: Add current sense amplifier
Date: Mon, 14 Jul 2025 12:36:24 +0200
Message-Id: <20250714103624.857493-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_033629_409307_B37D8437 
X-CRM114-Status: UNSURE (   6.83  )
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

There is a current sensing circuitry on the phyBOARD-Nash-i.MX93 capable
of measuring input current consumption of the phyCORE-i.MX93 SoM @ 3.3V.
Circuity consists of MAX4372 current-sense amplifier (50V/V) with two 70
mOhm shunts resistors in parallel configuration (effective R = 35 mOhm)
connected to the SoC internal 12-bit ADC channel #1 (Vref = 1.8V) via
voltage divider with ratio of 1/2. This results in a current scaling
factor of 0.502232142 mA/LSB.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
index 00143f201876..8de7e174976f 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
@@ -28,6 +28,14 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	current-sense {
+		compatible = "current-sense-amplifier";
+		io-channels = <&adc1 1>;
+		sense-gain-div = <2>;
+		sense-gain-mult = <50>;
+		sense-resistor-micro-ohms = <35000>;
+	};
+
 	flexcan1_tc: can-phy0 {
 		compatible = "ti,tcan1042";
 		#phy-cells = <0>;
-- 
2.34.1


