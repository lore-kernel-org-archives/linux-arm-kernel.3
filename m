Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7281DC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 15:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/ufsj+YTp5B4a6XdY0sQWUkJ+NQSUpM6CSLQJOVS40=; b=q3z8JorJXAx5NpBVZjtbON+wwj
	mLqlfDSRyp46t5UcRDJJcZo43Vvmgu2xkwlqu3C5XH9/d/phZrcNVY+qFmkyCjVfScgrzWMH0FCGc
	Ehw/FjN5Y0u5fSX+BSg97TFhUK/G24tdWUHZnh6a4mLm9ymgPWlOmmPK3U1kW1As86aLo77scFmmx
	LD0Hg05G+iJMawgMNoEVktA+jjXP4CrxtNkLxi7IPj0Ypvv8clwNeMr3ZF4OBUdqf3WIBhdkLyXFR
	5IE9e6e340K+6XcaJVT0/0mh9e0uApjiWJqnShDE/et1oLPOS9XhX1yhXwibPjpUPkMIHaqiVeADn
	pFHPDvEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Q0m-0000000CPj9-1nWu;
	Tue, 01 Sep 2026 15:02:56 +0000
Received: from mail-pz2-x0b.google.com ([2607:f8b0:4864:3b::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Q0j-0000000CPgV-3Qi2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 15:02:55 +0000
Received: by mail-pz2-x0b.google.com with SMTP id 41be03b00d2f7-cc188c38a4cso2651200a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 08:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788274973; x=1788879773; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/ufsj+YTp5B4a6XdY0sQWUkJ+NQSUpM6CSLQJOVS40=;
        b=TvZeRT+QMHL6HqUL2ZNFqAgnpGAvwCWvYlXVFu7Q6QhspCm8sHejbJXqu5K/Q89wdX
         xEMp8W1gjk20eAUyomBLFFxqVYX1NeKjfjPm9zmp5vUnLFVw+aPD28jSErIPKS4D0XDK
         QOG/2ZMRGnwkxqoXTaNh+88Yu/VEUp6FKrSMpg/k9czFPRPf0uL57yCmen+C/sX+VLC3
         yQFHwT6y5ReFkSR7OgPrpSpWclh70BszSI1rQ39Jso/5qVNV4zrFRv0IoBt8v1l3nkKy
         ijr7+sMSclMky/Xeb5FEgUoAfhS1k2CwyunCg5/r9XYuMWwNvJIDW6BlRUeCl2k4ICvp
         LZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274973; x=1788879773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/ufsj+YTp5B4a6XdY0sQWUkJ+NQSUpM6CSLQJOVS40=;
        b=DT7w9056GRdSpOX4uDKg7bIIJ45wmg17cvFOeIIOGbhsN5FfuS5nkivIElsw/2VtAV
         3ZSzCd48cZTRA6btiHAP2wP1xPiOLiKGJis8mbZLJ6n/JBXFpGlhFkhA/ADJpPJPjXNi
         d9cqw0Me5VYSflWqxxUfoHVsxq9+Cpwzl7N7StLyUBK8U5qXspjFGf5YtwPbxdBPpdc0
         CW7hvLM2guldV0HPUD4D2E/1cb/x9Kw7cXw9E3f0ZgmrmgYcRPnZnKlhsO+0Wxfl+MlP
         ok+1OlrtCqCZkeiQcx/QQljyDFNlUlqV/lliMHx+2cPnN1oFWDbbw0BPAzCU3XJuWeB9
         7rzw==
X-Forwarded-Encrypted: i=1; AHgh+RqU8W21MsJWu43fnMA7is3mQ87EXdT3IC3XdPCLACHGnSXld4rtnxo6Ubzo8yOGhw/oCjKiAk2P1XFxfZCwhTXo@lists.infradead.org
X-Gm-Message-State: AFuF++n+KGDwHdMOJTADGQ2nt/PhHPXt7dMFx2hQeE/1RPVEsKdIr5H5
	T3ChsMgNT0SBtnDHCCxeCasDv11iTdIQYA3TTn1yar95WtEkErdqvg0U
X-Gm-Gg: AR+sD13pJ1MiTqGb2IJ0UkYUEjP8rWUWgPsaQZCv0xQDQYsmdE/zjkF3w7qqRUXnK4v
	Luiq5j3St5pEAsc5j3pZWglax7kFHvz6TK38o9eGAGXRFH1RKH8R7JhSfM6XJrZdx3rI001ZaRF
	DXbzhs8prGwB+BI86Fy4Nczs1AFmfsKu6vn5WLcOwNeDKOMd/0+XwdWANrCUEJqQamUJ1nWNZfY
	+skzTKie0N7aph6xDhJWSw1PPxmOQbqbwYh6tYLc7tOmXzt5HJYeFXtzjJcvjvIY+42XqNBqyt7
	U5cMl5JHcv4GJLUAShDZKPUAUoKMt+021A8HmHeeqVstbGrQxQeskpAEDlty7638CBJF8DzE931
	iP87xIlynm8HlNLkl7HoGT3NdIHuva7h5PvDvkWmsvqfXSFv3tjCfeDi7EjSMPJvg+rOYzQf1Xz
	R7OnPtvntXTrKXK2+T6BgMoUIcvV8IPGKGjqhs+5n1+2sRY4Ir1eBMFEtW3oU=
X-Received: by 2002:a05:6a00:4187:b0:851:b03a:fcb with SMTP id d2e1a72fcca58-85629543442mr61618818b3a.14.1788274968953;
        Tue, 01 Sep 2026 08:02:48 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc0716846sm27914b3a.45.2026.09.01.08.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:02:47 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v3 05/10] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
Date: Tue,  1 Sep 2026 23:01:05 +0800
Message-ID: <20260901150111.141037-6-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901150111.141037-1-coiaprant@gmail.com>
References: <20260901150111.141037-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_080253_860419_728A60A3 
X-CRM114-Status: GOOD (  14.00  )
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

The RK3568 SoC integrates a Synopsys DesignWare XPCS that provides
the Physical Coding Sublayer for 1000BASE-X, SGMII, and QSGMII
interfaces via its four MII ports.  Add the XPCS device node and
its pcs-mii sub-nodes to the SoC device tree.

The XPCS device is accessed via the APB3 bus at 0xfda00000 and
requires the CSR clock (PCLK_XPCS) for register access and the EEE
clock (CLK_XPCS_EEE) for Energy Efficient Ethernet operation.  The
PD_PIPE power domain must be enabled before any register access.

Also add two fixed-clock nodes (xpcs_gmac0_clk and xpcs_gmac1_clk)
providing the 125 MHz reference clock for the GMACs when operating
with XPCS.  These clocks are used as the assigned-clock-parents
for the respective GMAC nodes in board-level device trees.

The XPCS node and its pcs-mii sub-nodes are disabled by default and
must be enabled at the board level when 1000BASE-X/SGMII/QSGMII is
in use.  The fixed-clock nodes are always present and do not have a
status property, as they are static clock sources.

The XPCS node also requires a reference to the appropriate Naneng
Combo PHY via the phys property at the board level.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568.dtsi | 45 ++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
index 3bc653f027f1f..989e164c0eb39 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
@@ -110,6 +110,51 @@ sata0: sata@fc000000 {
 		status = "disabled";
 	};
 
+	xpcs: pcs@fda00000 {
+		compatible = "rockchip,rk3568-xpcs";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x0 0xfda00000 0x0 0x200000>;
+		clocks = <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
+		clock-names = "csr", "eee";
+		power-domains = <&power RK3568_PD_PIPE>;
+		status = "disabled";
+
+		xpcs_mii0: pcs-mii@0 {
+			reg = <0>;
+			status = "disabled";
+		};
+
+		xpcs_mii1: pcs-mii@1 {
+			reg = <1>;
+			status = "disabled";
+		};
+
+		xpcs_mii2: pcs-mii@2 {
+			reg = <2>;
+			status = "disabled";
+		};
+
+		xpcs_mii3: pcs-mii@3 {
+			reg = <3>;
+			status = "disabled";
+		};
+	};
+
+	xpcs_gmac0_clk: xpcs-gmac0-clock {
+		compatible = "fixed-clock";
+		clock-frequency = <125000000>;
+		clock-output-names = "clk_gmac0_xpcs_mii";
+		#clock-cells = <0>;
+	};
+
+	xpcs_gmac1_clk: xpcs-gmac1-clock {
+		compatible = "fixed-clock";
+		clock-frequency = <125000000>;
+		clock-output-names = "clk_gmac1_xpcs_mii";
+		#clock-cells = <0>;
+	};
+
 	pipe_phy_grf0: syscon@fdc70000 {
 		compatible = "rockchip,rk3568-pipe-phy-grf", "syscon";
 		reg = <0x0 0xfdc70000 0x0 0x1000>;
-- 
2.47.3


