Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FADCAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 09:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugLw6Txl/Nh1pQ7d2wkRFx9L+dNw/roMpkSALIkryUE=; b=Yl1B6YjFy4Y1ZnOy9cr3s0YBgp
	gpqcTOzquwlNSi9Z1jSc+JomtsuNA0P2yH2l4gmEbpy2mLBJ3zhNEEX0z5T1gQX7V1rNRI1sznuKA
	5+hRtHTfPx80cRcT65f9Pv3EPh9NUrmUGbabTf730ooWF26bkElvmd0VQp/btF5vrOnD3nRAf+5aS
	ddZdrqcfBEak1LD18CLWSafeR3dEDVX34bQ/E5VyscWFRB0nwuu6FU1jBjc7LydAgA3e0dKZVc6cf
	FDeIqP50CA5Ybzagz6I1SXKyJNFAoX/oOaVyiRQGj7tzEl0HKTTuiQl9kJ8RiSazZ5N6ZildyZSP7
	XyHN7hoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iJX-00000007dVd-1IxV;
	Thu, 25 Sep 2025 09:30:59 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iJM-00000007dHQ-0Mhd;
	Thu, 25 Sep 2025 09:30:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=ugLw6Txl/Nh1pQ7d2wkRFx9L+dNw/roMpkSALIkryUE=; b=xqWLxhadPrCEifekvoxMzB+bzo
	TEYZRD45vsXvFx0bxQwHYqD8pSdFqD1GjemIJ3g+svmZGa3U/ozP1cRs2yYD0IwOz2MAeriVUUzO5
	DbzKNytNOd7nHFtkSD82cXX7MdvY0p1PQVacUK8E0Z+VmEwv0X48ZYXd56Hx2HB4nhPgvj84qHIYa
	HBEEQqT5kHqF6DqPdvHwA98FAwtIA0qL6j08wOth/KdFEVQTi7yi22s/yyKHgdO4J0IEEscf8I3Xc
	bG8ovESVXE6M7fUoyZGabMN1IjMM8ACwFPEeUZ77hZ7G4gYV7WNEqYSFfszx/Ct12ZD71CzFQ0CRA
	USJFzE1Q==;
Received: from i53875a54.versanet.de ([83.135.90.84] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v1iJG-0001Nz-4h; Thu, 25 Sep 2025 11:30:42 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ukleinek@debian.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH 2/6] arm64: dts: rockchip: Fix the 1Ghz ethernet on Qnap TS433
Date: Thu, 25 Sep 2025 11:29:19 +0200
Message-ID: <20250925092923.2184187-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250925092923.2184187-1-heiko@sntech.de>
References: <20250925092923.2184187-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_023048_122796_B3EE754C 
X-CRM114-Status: GOOD (  18.79  )
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

While I want to remember that the dwmac on the TS433 was working at some
point, it seems I had my network always connected to the 2.5G nic after
that "point". And testing now revealed that the gmac does not actually
manages to transfer data.

Currently the gmac is set to rgmii-id with no rx-/tx-delay values set
which makes the driver use default values. Setting the delays to 0
also does not provide a working interface.

The vendor kernel is running with phy-mode set to rgmii and delays of
    tx_delay = 0x3c, rx_delay = 0x2f

As Andrew points out often, those delay values "are magic" and rgmii-id
should definitly be used "with small values" for delays, if really needed.

The Rockchip vendor-kernel actually contains additional code in the dwmac
driver to use the loopback function of a phy to find a window of usable
delay values. Code can be found for example on [0] and the process is
described in a document called "Rockchip GMAC RGMII Delayline Guide"
which has made its way onto the internet in a lot of places [1].

So I used this process, with the interface set to rgmii-id to get values
for this mode, which are in face lower than the ones for rgmii with
    tx_delay = 0x21, rx_delay = 0x15
and results in a working interface on the dwmac.

[0] https://github.com/armbian/linux-rockchip/blob/rk-6.1-rkr6.1/drivers/net/ethernet/stmicro/stmmac/dwmac-rk-tool.c
[1] https://gitlab.com/firefly-linux/docs/-/blob/rk356x/firefly/Common/GMAC/Rockchip_Developer_Guide_Linux_GMAC_RGMII_Delayline_EN.pdf

Cc: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
index 5656554ca284..e8af92a011d6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
@@ -257,6 +257,8 @@ &gmac0_tx_bus2
 		     &gmac0_rx_bus2
 		     &gmac0_rgmii_clk
 		     &gmac0_rgmii_bus>;
+	rx_delay = <0x15>;
+	tx_delay = <0x21>;
 	status = "okay";
 };
 
-- 
2.47.2


