Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8077EC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 12:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mg8/YZyIZ3CihMksQCv23yBYBJSGhmM45ppIsWYSP5M=; b=y6cOfPHqbfE37OWWtJcWK8dgEy
	E8MW6p4l02xEvtshFIo+CSN9HRommh6QvFGTE4kG11YUxC0aVKewqeRNDXiOz3+abox7GgiR/9B4E
	jafBq1acj0HKyF9fe+bgg2OBCbIWQwIszXq+q/dt4x9HmUTnVVOESu1ksHnQ/G/5ddKBu6+cqmN1k
	d4FCBxXaNETDOoIeR5cHZHKBnF+GgvnXmOWTSEgBXzwfMEMA95JYgqtmxjKFl/TVx/0tPdKoX6+UA
	QYVDO5xKDArUdyvK0lxzgdB4kyXCgN+Y65o/je+CNSrt/dKCU6Xna4tFA03dBSDwKZTBeNhMSDw4+
	D4FtPSbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uYO-0000000GHEj-3P3a;
	Sat, 19 Sep 2026 12:52:28 +0000
Received: from mail-pz2-x0a.google.com ([2607:f8b0:4864:3b::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uYL-0000000GHB2-2wLg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 12:52:27 +0000
Received: by mail-pz2-x0a.google.com with SMTP id 41be03b00d2f7-cc4aa027fe4so436138a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 05:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789822345; x=1790427145; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mg8/YZyIZ3CihMksQCv23yBYBJSGhmM45ppIsWYSP5M=;
        b=NRkahPtNQPpWbJTrJttmQehKRUP5Hpx8ji3mjBrb8FQFQEaFdjlF4jdLaZlWFjLdRa
         /4ZlBdE0hP1F3b0QFtX44wrLaBH0ZpQSrLcYVMfr3dSBZSk2wsdCDq41m1LCfOGeAXLh
         BI30hjtFfU+F2LT6gcq1cZIHZABH/5NPUoe7rnnKiiLgoW3La1B+aPvyYRmrOHZTb8Oa
         nJaSpwG7YNKTz6zJOVxsAiveamBjEymhLlUaZdlDhD4EpCQxIJm+JsP/FH1xSRGrkuRV
         VDcKvWxhkjDAgQz8xykistai4UcInEScna7FbZ9DuA9qLrXF5DBpgMkWXno52VPtSS36
         Y0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789822345; x=1790427145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mg8/YZyIZ3CihMksQCv23yBYBJSGhmM45ppIsWYSP5M=;
        b=A6JM7F+exld/K2ps9StRPx/4O/7Tr2im5yJwkZpLLBO3gSbSzxoBcHIEvWzdpoLcl8
         I5KE4GqDdfxXztTlQVtrGY+6NANHQiYarrfmyizQnHCkf7qrbVOVPjJwllbOCwm3GOEv
         fmeB0CuEm9tC4vijzU3ZXuAJ7bgezqZJwjFEWMzc+Vc2rUNiU5ktZVWFz+CgQAWHK340
         tuUoRdPNdME755F616J/cBY4aJ2Y2talW5k0vR0nbAeIIsbiv3X2/1Jg5wZtdOoyrT+Y
         RDKc9sLiHxoxUZeRTQfTk/T7cr9EIAr9P7JRviiovB+Yc24GRKG0DooG4WXr8yoIgbJn
         pO+Q==
X-Forwarded-Encrypted: i=1; AKwUvByg7RvpfI3EmYX4gcb+dp1C+mvtG+Op2NnRhfh8J15aLtYOY4ff7ah2shz7heEcj0akS7rW40KwnS8ZZBdO4pZf@lists.infradead.org
X-Gm-Message-State: AFuF++k2vjPaCT6215L1Um/Vmti2wEzS/x3tL5kgmS+kQfo1B4RKGzKB
	C6fFNxTO1KCy8Q3d34S0bXfZ3PfIhnMiY1N0Fa34mLlMS5ES+cJRqJSV2aQmzAqViR0+Ng==
X-Gm-Gg: AYBFou0eb0qC0ghCjWR6N3lzGzB6sT78b3X7aaEGk/1+ORC2ygThoLCNQSwufDK6Ho0
	wmaDuJXujqQxlEYPJCdV2MkC0OjZJIgPBo4Ra7yTnqjq3oYRAy4iImvjXjjJIL0/gL+E2Bcdlg9
	YUtPXKJec/WXi1Ksh/R7AQMTdcCJU9qCWbZo/Xi0xexxnmJh9VHeiyqd1S6N/ww6PCppysQ+LqE
	Rau5flxeBV4cX0CFF2LyXFbcgEJEeRg+FxAvEFhlw5a/iaTHCFUr+sWnUGayFZu0h9wHs8pGd6M
	tRURO8xkYf5M8mPHSh6uHCzUtFhnTFGK6W7Nbzsc6jGeAEzg3Z5jE6aEdjYuCrEEQ6FDoYp2sNG
	1u/hbIBSEvcRgfTGBdQSD281aCxs/iBmP0C3T7A/B/peSbtAHEiP7SLeGCfjypQyDKqGAh33ArW
	fUsqzrSDqklk/rvvZ9n+4jGlF7ovdts4YWMHAB89/F3bVSKdhZgM+hVbHqbdGsrkKECCSkkw==
X-Received: by 2002:a05:6a00:148a:b0:878:34d7:69b0 with SMTP id d2e1a72fcca58-87834d76faamr1660285b3a.55.1789822344779;
        Sat, 19 Sep 2026 05:52:24 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa0026b2sm991805b3a.44.2026.09.19.05.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:52:23 -0700 (PDT)
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
Subject: [PATCH net-next v8 05/11] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
Date: Sat, 19 Sep 2026 20:51:12 +0800
Message-ID: <20260919125119.2107089-6-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919125119.2107089-1-coiaprant@gmail.com>
References: <20260919125119.2107089-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_055225_813141_E56BA390 
X-CRM114-Status: GOOD (  14.77  )
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

Also add two fixed-clock nodes (clock-xpcs-gmac0 and clock-xpcs-gmac1,
labelled clk_gmac0_xpcs_mii and clk_gmac1_xpcs_mii) providing the
125 MHz reference clock for the GMACs when operating with XPCS.  Their
clock-output-names match the CRU mux parent names in clk-rk3568.c, so
boards can reparent SCLK_GMAC0_RX_TX / SCLK_GMAC1_RX_TX through
assigned-clock-parents.

The XPCS node and its mii sub-nodes are disabled by default and
must be enabled at the board level when 1000BASE-X/SGMII/QSGMII is
in use.  The fixed-clock nodes are always present and do not have a
status property, as they are static clock sources.

The XPCS node requires a reference to the appropriate Naneng Combo PHY
via the phys property.  dtbs_check only validates required properties
for enabled nodes, so the SoC dtsi does not provide phys/phy-names:
boards that enable the XPCS must supply them, since the SerDes link is
a board-level design choice (combphy1 on some boards, combphy2 on
others).

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568.dtsi | 45 ++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
index 3bc653f027f1f..227d03e336043 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
@@ -110,6 +110,51 @@ sata0: sata@fc000000 {
 		status = "disabled";
 	};
 
+	xpcs: ethernet-pcs@fda00000 {
+		compatible = "rockchip,rk3568-xpcs";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x0 0xfda00000 0x0 0x200000>;
+		clocks = <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
+		clock-names = "csr", "eee";
+		power-domains = <&power RK3568_PD_PIPE>;
+		status = "disabled";
+
+		xpcs_mii0: ethernet-pcs-mii@0 {
+			reg = <0>;
+			status = "disabled";
+		};
+
+		xpcs_mii1: ethernet-pcs-mii@1 {
+			reg = <1>;
+			status = "disabled";
+		};
+
+		xpcs_mii2: ethernet-pcs-mii@2 {
+			reg = <2>;
+			status = "disabled";
+		};
+
+		xpcs_mii3: ethernet-pcs-mii@3 {
+			reg = <3>;
+			status = "disabled";
+		};
+	};
+
+	clk_gmac0_xpcs_mii: clock-xpcs-gmac0 {
+		compatible = "fixed-clock";
+		clock-frequency = <125000000>;
+		clock-output-names = "clk_gmac0_xpcs_mii";
+		#clock-cells = <0>;
+	};
+
+	clk_gmac1_xpcs_mii: clock-xpcs-gmac1 {
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


