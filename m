Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D3CCC6B27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nv1QRKVD0rhHN7pKsXLPrsiYoxShZ0enIr7QyxQJp0s=; b=wdywOFmj15qy9sSpcNuZSz/Dre
	oyMrMFYRxrDy2aMYDVhqW/emVkZGJpPLtNJ73/hJec9mbpZwxl6j8Dpy9T7ngTaXHBLn/RFThOWnv
	a8QohKPicO560KLbxpprNJLUDGHgKiugylljPsj+nARek3SUYihcEZVgpx/IUXjSQLnnKO2X7SU97
	7chqFuJ9t1soc5xQufN+6sIsDigxAqXkFFWERvbW18aumFItDlQurlyELgt6rvDGhu7/LfTUiLK/X
	fguZrqi7G8H902Tc+dolqVdCVXHdiZDMrvfgg1bElUBnEY2oE0Nt5hphb9PbY4uk2nsVYR/s09adt
	dl/jWTTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtsq-0000000Epo0-0e2j;
	Wed, 14 Oct 2026 07:58:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtsl-0000000Epmo-168Q
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 07:58:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Nv1QRKVD0rhHN7pKsXLPrsiYoxShZ0enIr7QyxQJp0s=; b=BSoLhe2qjibpwKYK5j73xCneBe
	G4le/99qbaw4DuUVPXKj2aqD73g++QIti/DU2ZTbIqAT6FXj9ZxsAb1IaCM7h0FROphlp82UiwoGf
	qNQj8o5g58WqnyLhf5jOCtK6kSQX96ow7x9gjOxEKDKKKlJBoyNyFoVuaTq+3ktSzpblZeVTu0b1k
	CQZ2rvnJfCadU7pqHAX7cTzgGnbTNphCDSzpIxQgvHKe5BgExBKQyYc+zG5gS4h7c6DAV5GnINdGo
	5P3xzokcg17/ZtZefh+ueHSh2B3W3CWfINgJus2nlVcurz+XR1NyuA85eSEuKCBkAozOrDUb7ojQQ
	sryL0nRA==;
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGtsh-0000000GTVR-0aX4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:58:37 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 42C4F22B73;
	Wed, 14 Oct 2026 09:58:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1791964709;
	bh=Nv1QRKVD0rhHN7pKsXLPrsiYoxShZ0enIr7QyxQJp0s=; h=From:To:Subject;
	b=YQpi4LNQGJxIumQ2T5EsXikjrwl07DOxUA6tybUsS8Q1OCAMNEVEFry5Z95/30zQ6
	 XHIgfQ1oICc3wceqlCd4BhvE4ar2yaB+PCF4hqKDkOXpiIXl9GslDsPGfLDF/Ebj05
	 D0C1ZO0BX94XScAABV+JWSYNJv0McG9Ke3c7Kn20TWkdqJzYRFA5LkMIYMN4RD6I3J
	 OOjCkDtPEwt93ho8SoKSJ5iBsYtwEyzJ9YbSP2hCCSFIKNZqOvlYNGn1cMtQ/Og50B
	 DEJJiVqiuxkufOU7iIR0c6gCyPaiFuGNMvbhLwQbLNsFpwPDGA5YuNm5EuW6MxoUka
	 iPwg/ofD/9n3A==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: freescale: imx93-imx91-toradex-osm-dev: Remove ETH_A PHY interrupt
Date: Wed, 14 Oct 2026 09:58:10 +0200
Message-ID: <20261014075812.29154-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261014075812.29154-1-francesco@dolcini.it>
References: <20261014075812.29154-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_085835_627501_B91633E1 
X-CRM114-Status: GOOD (  11.31  )
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

The OSM Development Board is shared across OSM modules. The Ethernet PHY
interrupt connection to GPIO_A7 has been removed to resolve a boot strap
conflict on OSM iMX95.

Update the OSM iMX93 and iMX91 Device Trees accordingly. Remove the PHY
interrupt configuration to use polling, and move the GPIO_A7 pinctrl
configuration to the GPIO controller. The pin is now available in the
jumper area for general-purpose use.

Fixes: e8a8c86875f4 ("arm64: dts: freescale: Add Toradex OSM iMX93")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi   | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
index 566671b32308..24b4bf579835 100644
--- a/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-imx91-toradex-osm-dev-common.dtsi
@@ -93,7 +93,7 @@ &gpio2 {
 
 &gpio4 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_gpio_a6>;
+	pinctrl-0 = <&pinctrl_gpio_a6>, <&pinctrl_gpio_a7>;
 };
 
 /* OSM I2C_B */
@@ -262,10 +262,6 @@ &mdio {
 
 	ethphy_a: ethernet-phy@2 {
 		reg = <2>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_gpio_a7>;
-		interrupt-parent = <&gpio4>;
-		interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 	};
-- 
2.47.3


