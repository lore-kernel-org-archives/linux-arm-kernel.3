Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0995CCD343B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 06:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XndlQw1vEUKvftg+tDwjaYGyrUBmct9QSEEl9yDREPU=; b=CtCvVlQMEnuVSyoUKrqftXdSdW
	zc00OxomwqAzWdhw7kQUqJlHBkJz/lZCdmWKblLi3EyR/yrOMJ+jrqXTOu/nJFsEMf4r4HK5Dxaf0
	bOUMGWXsbZLkwldPgngdQWev1E+0OwBzPry+xiQBx0f17KCTWvH6UHl0srKZIBuFTbWmpwjynGzqo
	xgCEqLGdp8aa76vGmWDmSLTCjoqwM4VJEljlrOPXZKWNSCfu5Hp429huOKciz8rqHyfrvZvQ9hxU/
	PVd6pzvjD+ihzoIQ9Cw3KFIYDGAkOfIYYBREZRQUbjVVgP72FGCxIGAS9sk5WX9elzm+5Z5AUSYg+
	HPt8f6Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsZO-00000002wyw-06Jt;
	Thu, 07 May 2026 06:50:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsZM-00000002wyE-48qJ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 07 May 2026 06:50:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XndlQw1vEUKvftg+tDwjaYGyrUBmct9QSEEl9yDREPU=; b=CJxjAMxWuLp4/Mr8WCG2MH2WJ2
	gxgoSFm1jc26Fm/9D5p+s4CUU4J3HANKxmvkDGo1eG9617WlWtw5AxNtlRRInuaBXB0gDldilHkdP
	LJqpKYYJKOORF+O5M0EZDLnj6/Ac0S9WRN2J/qBzYy4Xb326t4ZVXnukfrO+YOSvsh4XK7XUP0PIr
	PY8tlMP6hj9aSqfkkC/6lUq8FD4QfO9czzpTYisR7NEulFE/4nqA1dhzp2IxrDKphls7B9i7I7mea
	tpQ3FlR6V5F20Cu7/sU5w/SbNBG0KCmiD1aHi75N1AtcGrfb5CLkK7XfrWiPfjtUACrzwrJNLmWGw
	EQiGHWXg==;
Received: from cp2.siel.si ([46.19.12.180])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsZH-00000002kA4-3coB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 06:50:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=XndlQw1vEUKvftg+tDwjaYGyrUBmct9QSEEl9yDREPU=; b=WbLCmWzzRRAB0itnHzJJsvQ8ys
	wW9q2qm+pHJcq58Zz7oQa5Lt1xfPDgHeE4gHW2Idd8uji5zwE31GtFLPAv2CJZoEI5de7iJqVGFEF
	fZ+ns0VC3MOUrZVALHSCP7yMfW4O2ycOipxDLDRZiVBJsmHcrrhw5ddx5JJMB1LzGun8es/uGsA++
	YBuQgkz993L+3Wj8WcCkXfcnhh5sNawQYl2EpxGxZzYgk5Gr7sBxalGcyKwqc20vyOOmuzvhPsbYw
	WxHDWsegVEN7j/oloXfY7urn9olB1TGkkE/FqjvV9k5uBZm1VIcM6dC4VMQ2gHXloqEUdmeC9CWc3
	VRj+mW3g==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:40514 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1wKs6Y-0000000AGWs-3Wgs;
	Thu, 07 May 2026 08:21:02 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 2/3] arm64: dts: freescale: imx{91,93}-phycore-som: Adjust PHY RST drive-strength
Date: Thu,  7 May 2026 08:20:57 +0200
Message-Id: <20260507062058.1711292-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507062058.1711292-1-primoz.fiser@norik.com>
References: <20260507062058.1711292-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_075044_964128_D7D3D763 
X-CRM114-Status: UNSURE (   6.40  )
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

According to measurements, the PHY reset signal shows an overshoot on
the rising edge that exceeds the specified limits (max 2.1V) when using
X4 strength on ENET2_RXC. Reduce drive-strength to X1 to decrease the
overshoot and bring signal within specification limits.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi
index 19e7e84ad6f7..8038d92da2aa 100644
--- a/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi
@@ -220,7 +220,7 @@ MX91_PAD_ENET2_TD0__ENET2_RGMII_TD0		0x50e
 			MX91_PAD_ENET2_TD1__ENET2_RGMII_TD1		0x50e
 			MX91_PAD_ENET2_TX_CTL__ENET2_RGMII_TX_CTL	0x50e
 			MX91_PAD_ENET2_TD2__ENET2_TX_CLK2		0x4000050e
-			MX91_PAD_ENET2_RXC__GPIO4_IO23			0x51e
+			MX91_PAD_ENET2_RXC__GPIO4_IO23			0x502
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 626160132e3c..a624aed48efe 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -222,7 +222,7 @@ MX93_PAD_ENET2_TD0__ENET1_RGMII_TD0		0x50e
 			MX93_PAD_ENET2_TD1__ENET1_RGMII_TD1		0x50e
 			MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL	0x50e
 			MX93_PAD_ENET2_TD2__ENET1_TX_CLK		0x4000050e
-			MX93_PAD_ENET2_RXC__GPIO4_IO23			0x51e
+			MX93_PAD_ENET2_RXC__GPIO4_IO23			0x502
 		>;
 	};
 
-- 
2.34.1


