Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B744C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 17:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u+uFiP/cQeKkOTD6fc5wQMcjMGmy3Mcby1TgFOYHp5E=; b=uiMB9VjBwW0n4G4tCjI06/vh/H
	iH+EIJdRdNA4aAyigI5qXiod0jwX3RXIdZFZ9QSEJA65LpCREteHH+K3sDe03zXLraoOrURS67zeb
	3P39ntSIoPJ4jkoNAXF2kQsJU0eCY0+T3Q5Dd38Yd/xwcDkoTWAJX3frR/u+uMHLPYQSYNoZFxBmj
	EV+UI2OEf/6nyoH3cVvD77c+KaJjimpWzMGvsnF0uOBWlj8BUxMgTMdE8KBNg9/V3Df5xMl4Ts4m2
	JdI0seKGVRK4LiQm67sbAn8LPdjvaj1X9L0IB1/UR1PKXs3RzZnVnvZztbAJ8NBhKhN+D+PtDNgaw
	KWDus3sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlM8-00000003c1A-084J;
	Mon, 23 Jun 2025 17:53:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThBg-00000002rzK-0mp6
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Jun 2025 13:26:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=u+uFiP/cQeKkOTD6fc5wQMcjMGmy3Mcby1TgFOYHp5E=; b=qygE+S3G+LNQu5q1cV7qpkZkwd
	F4V3JO06a2EpjaTmoZDC2x/7HZUZmBttQ+xLTaXpaaTegQFPsxPtoorvSLdl367qSO6OuPNpn7Uoj
	T8D19QbMg1Qm1yfX5wDJdrVYqgbKq/zEbUMqcyFWarbAlRs8kxIxv5mtZsNAcPknKz6Gfi/BWDwhv
	kEzUvsPZ1vakQO6ELb6t63PoHsUvTxLOr84pot3eY/2F62Q+cbg3fTMt1D9VSjsXU/TNQ09G1DgqD
	OMBu4IjO/j2DL3zb0BPmWdD4RnMXA/UcCZEqMlz5sTNaBRjZl4NhuKOdpwoO0CZWoouKBC0rZm+y9
	NOHwpeLw==;
Received: from mail11.truemail.it ([217.194.8.81])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThBb-00000005Drx-2b9U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 13:26:14 +0000
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 84BC71FC30;
	Mon, 23 Jun 2025 15:26:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1750685166;
	bh=u+uFiP/cQeKkOTD6fc5wQMcjMGmy3Mcby1TgFOYHp5E=; h=From:To:Subject;
	b=rO6nA/SFi386mqqis4g2A7h4UbC+DOwyyYEhBIcZUrQOvduPGB9q1ake9SCkiUGjA
	 3bQ24qb0BVQvS+6SSdF3N6W/rEn4QIOqiBdqJuXqgRtKlT5JX0myKtimX81ukmm4JW
	 LNiyRuPf2m8P0hSKfxEtV2SzX5GNcbDmmgAZVy+L+uymG0eVrIMipRzt0Z9HhwtVHL
	 ev1m1+6TfyAY5aECOULVChITLLIDtPPt5EwXpqp7lf1hFktPiJNdyB8zNojZU7G1cO
	 UKN/qF7vYSaHJoXlmmPYh1H450pJizr0Ytha2iNgRxV790/uKAVXY53Kn+EeKNHTK5
	 IK2gCsyu13BQQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1] arm64: dts: freescale: imx8mm-verdin: Keep LDO5 always on
Date: Mon, 23 Jun 2025 15:25:45 +0200
Message-Id: <20250623132545.111619-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_142611_995049_3FEA86ED 
X-CRM114-Status: GOOD (  10.26  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

LDO5 regulator is used to power the i.MX8MM NVCC_SD2 I/O supply, that is
used for the SD2 card interface and also for some GPIOs.

When the SD card interface is not enabled the regulator subsystem could
turn off this supply, since it is not used anywhere else, however this
will also remove the power to some other GPIOs, for example one I/O that
is used to power the ethernet phy, leading to a non working ethernet
interface.

[   31.820515] On-module +V3.3_1.8_SD (LDO5): disabling
[   31.821761] PMIC_USDHC_VSELECT: disabling
[   32.764949] fec 30be0000.ethernet end0: Link is Down

Fix this keeping the LDO5 supply always on.

Cc: stable@vger.kernel.org
Fixes: 6a57f224f734 ("arm64: dts: freescale: add initial support for verdin imx8m mini")
Fixes: f5aab0438ef1 ("regulator: pca9450: Fix enable register for LDO5")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index d29710772569..1594ce9182a5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -464,6 +464,7 @@ reg_vdd_phy: LDO4 {
 			};
 
 			reg_nvcc_sd: LDO5 {
+				regulator-always-on;
 				regulator-max-microvolt = <3300000>;
 				regulator-min-microvolt = <1800000>;
 				regulator-name = "On-module +V3.3_1.8_SD (LDO5)";
-- 
2.39.5


