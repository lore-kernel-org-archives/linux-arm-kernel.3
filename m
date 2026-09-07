Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37636C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 15:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/ufsj+YTp5B4a6XdY0sQWUkJ+NQSUpM6CSLQJOVS40=; b=4O7Fv6tSs3MHBQN2H5cgp9xGqK
	HmLh8VEra7UVeE5zilcYpU6aqMVAhyrzMnxvUoZKNiSmKrcMhBwAVTuqri6Atj79lSyxvubOq+W4H
	Bwhk8n3ppxABF/yv22ut/Cd4AoTL7aKas7bWKKORae3MdJCsBpY3sbyG3p58S5kErG50vT/g5UMgZ
	27CcsObawsn9/1AKEtpQ8NdUxjYEhhCyIZBeEEPPQowIUBj63S/eYItV7nbaOrjWAT7VeREWIfpxR
	jXOb9I3vQTM9MLQIv/YpvyIhXsd2e7kbySjkXVK4XMh48rRg/oyqtzz5yzQtro3KBQans32HoQqSN
	+mgula0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bRH-00000007CNb-32wc;
	Mon, 07 Sep 2026 15:39:19 +0000
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bRE-00000007CKM-07pn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 15:39:17 +0000
Received: by mail-pj2-x0b.google.com with SMTP id 98e67ed59e1d1-39569e136f9so2170203a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 08:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788795555; x=1789400355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/ufsj+YTp5B4a6XdY0sQWUkJ+NQSUpM6CSLQJOVS40=;
        b=GB7SxJxpzJLBstxNf6WW/4ihVwuw73WZi90bbSzXco+WHV0r5VM1rrm4fE2MNmhB+i
         ICvZagvr7/kkoWOw2A3l1wmDwP7beFWuu/+f7nnqkD3bUs9kVA69fBcxglwmkee6CRQB
         SYYkl66WLJnDM5V2ixGbSRiJ1LDmCmxgs5ifZ9CvbNLb17hROKqVtWN0GWwCs0RKud8z
         0f7j/3tbV9C7IwToUTM4GXReQCgF3r3JkBdRDjpXb+uk1k6uAMeXtIg6QSbsjREVdGQR
         614QD6xbyy3UsnXamx9ndTZI8VWyMDK0EVFbFg8xEYVkdrCi6yeFfwX5npXCV2vn3ZpW
         /crg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788795555; x=1789400355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/ufsj+YTp5B4a6XdY0sQWUkJ+NQSUpM6CSLQJOVS40=;
        b=FRvNUZXmgRzxsd+TJrpkItPHU2DjJhSlerVrfaMhdAgnx/gzV4wzvFFOaPlTrxAYQp
         xcqKQp3nwlk/lK2kH5tPyx3JBbyCqJjutuZIDsA7OHDIPzWwfnthUMaFSKQzL32SooR6
         nTJuPeavshGZqtptAGnwVaXESHnRfTJ3LVHJ91qKDZKODsUcPrTerc3UHVQlZf4raLqq
         Jwm8qy2oqhx0IZkyfk79SgosnU5DQ4LypuW+maeZLHaw5DddGiXEb+Wmg6khblmgKLaQ
         txkViG5sN0qP6uyVgjEvNi9EvTZ+uAWzKybSOxale9kiNc7NPoNilJwFUZ7zWg6rhJM2
         GRGw==
X-Forwarded-Encrypted: i=1; AKwUvByN+7os99/Qje7hyJ5BR92Hxw6WmQSrZ2dmr2iHcdA8/MsbtsQgfFRWMOWQHn9IMtAtHTPsChukKtmrOdUTPqAb@lists.infradead.org
X-Gm-Message-State: AFuF++lmfE8qoXLkijbFtzTzrQZoJAcPPG9Ya6VshIb4H+yT/snbLzAJ
	3Wi22Np9jcpna95mWXWpb+99zlOY+O+0NhWFmoZlpq1k3uiTnwSXnjm6
X-Gm-Gg: AYBFou2RXySbfg27d0v/45KNblGXCnSE98qATpSu5Ujy3mNFY1wbYK+/y5RYYYQkOoN
	eByG/OhHRvPJBwW00nW3r10wFIQjf8v00nhjELi33LE3k+kggK57EtKIPfpWgf/BugAPqT+cihY
	4VIk8PiwiEvlnfDe5gtDL1M0Byh7OYC8X7ZqRowZnrmJ+r/+iDegP03ECAIrBhVOXXZIbTV9V+G
	h7Xe5FHGaizLlLA4pf3cf5b9CRzCXgc3is4JygiYvJy7UMw0R2FgJ+LLTTKQlOo4q9WLrFXJCDi
	SEUb7Ko0KxbBBJDUOLLi1GdHFdJM79Ocg13FiLUZqTg2rGe4cfO7zoVxGomYZTgBznGRXRfGnE1
	t7PXvhdIZPs27BPTFWLEyjfJT8jEC/K54F7M64SycwFuDKKbPkRORyCvhFGEsizNS9JYYiECf+a
	UZ0IZQ4QZO4izBu0nGcOzhENxxxinFKgvcrvH/qEOft05SX06QBpM24iac52c=
X-Received: by 2002:a17:90b:2681:b0:38f:5801:dc0e with SMTP id 98e67ed59e1d1-39b261d52a4mr35850991a91.15.1788795555107;
        Mon, 07 Sep 2026 08:39:15 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm21690121a91.9.2026.09.07.08.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:39:12 -0700 (PDT)
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
Subject: [PATCH net-next v4 05/10] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
Date: Mon,  7 Sep 2026 23:37:08 +0800
Message-ID: <20260907153713.2572547-7-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907153713.2572547-2-coiaprant@gmail.com>
References: <20260907153713.2572547-2-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_083916_847268_D8450AC1 
X-CRM114-Status: GOOD (  13.47  )
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


