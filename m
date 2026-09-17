Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFD7C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 20:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mg8/YZyIZ3CihMksQCv23yBYBJSGhmM45ppIsWYSP5M=; b=nVrNt2+GyCEd5Q5BPhZZ4kVJ2S
	sY9MDlvOtajahym/5u5/moLEjWwrjcDajVVHt0e2uQfU6VtwGZPNvBO0Ke1jr/6hlrHRMc1tPZH6z
	+RgzPWxWHYP4eQSe8jLuaF5xFqaPyjqquDM7QgE1fU6a9auJ/JYW+IwsrfIwg9/lBjGLEa+piVS8j
	Y+RQFxETR4msZRE3+642tLdISnn0Z/NIWMUMEKhbLoh26WrNifRTKgl7xgS8MBzPOEOgoCubesKxn
	Q1hmuhR4DbMJ2TrsqFV6803z+1QPkY99aNAYAFVvtGdWzOr0MYP/5NrVke+ed7eiHOt8Xz3kKosmk
	YIJThQnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7J1P-0000000CSzM-27v1;
	Thu, 17 Sep 2026 20:47:55 +0000
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7J1L-0000000CSuR-320O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 20:47:53 +0000
Received: by mail-pj2-x0b.google.com with SMTP id 98e67ed59e1d1-39569e136f9so64828a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 13:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789678071; x=1790282871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mg8/YZyIZ3CihMksQCv23yBYBJSGhmM45ppIsWYSP5M=;
        b=Be1b8WTHOYzSZL5t0BVD/C3nUSG7S+7QoMoh/FkfxWhJvHnz8MjQicnRVEHMkg7lLv
         3ZOCATLc2MbwGOQFj9OWu/HXc89zDJ1ZBXSwbImKExpRNFA4m2k/4/xsZLCFepwerM44
         noNpx7y0EoooPeOLo2INY4d+4Zm8gR+QlxqWDYgopyBLZEmY655qRuqtiDQ3xVmWCWyr
         Z0hEpJWDmuekj05K83/FX66UQjhGzecPiwu44rAezBqQfFhUwXFtGSG+EOzvMVXOTtVr
         KnYBDn/mj3UUIgGsaCfon0g+C/K3s1TgiOtiAJ79lrhLdNEQv1ReKe6OsWL+y72gmnKm
         Kogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678071; x=1790282871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mg8/YZyIZ3CihMksQCv23yBYBJSGhmM45ppIsWYSP5M=;
        b=F1gyRaCamqmNUYRoUDi/ZnEoUyA+9eNpMz68MWpYC0w7kQkxisZvyOUs3MGCZxI45u
         RQe/FZxZNhbnCNVr1KvnwhDG/BD3vHmoQPTyEtaG2tohwYbrKXjmlE3YpXJ3fZwRZjyU
         J6hHwpvXaxSoJMLoo2LIJS/QzhnLYYRL0KKc+9wAtYd3YuuT14VIqUbIuqsl3OSYP77M
         OmSX6FwrxXVaPwUSE0vWP4smGrk5r1/QAloEp52+Gv2A074eVtf1jfgdsnPBnP7Xu8AY
         Y0fsneyeZKW8WW11t677Ifku/n86cV3tbsxG3IycoLgiokNNdtRq0D+h7ZMen3oG5RrR
         a4/w==
X-Forwarded-Encrypted: i=1; AKwUvByHwzN7DrZ7WyR2kc4Zbs7L3Pl91br7/dY0jb2+Piqyg9Y+HXhGNoMuU7Ks1kCLeF8I+lhIenUunG/B+tqeSspg@lists.infradead.org
X-Gm-Message-State: AFuF++m5VSwLlBKxMjI3+66b9vBaLT4uZ0bSbPws4tb4wIdarO/NwYgm
	jdCzeSOqUwptIb77rD5iR5EdXYEYz4UXU6QPrw+c5uqRBvmgvIpL5APy
X-Gm-Gg: AYBFou3p55VuolAazwYqAvh8qOy6nK75vsAnjQExvvYknUweaEaXhB/6u5fTzhc2O+a
	jld27bT8/YA9sDS+bwR/w3yFtmVfOyE8eNkybvuTL3n9dWiXWk+glkRoae42o2Dw1PWc0hV1PuA
	BurmeKCZUCX9J7bXmuYaCEjSVpqpmRa8nYZkIBEkHa2t1SEAvuVdI2T0MT3tqjjZnWBRL4exzzE
	C2WOD+plAYNsqBUk2CJ6eAjQ0ojN1jet9vE2x6IoBmYgD8meudaP5jlM5LTBq74QsFl0yrv+qvD
	q3XB78meywyDJQK6UCrC10uuHW2GsiRYAHTrOQrdUozBF8Pq/zOpUdQzT6n41786UFWW5tladTW
	sjDUKRS1rP/y69BNyq/d0akC7pFChjBdKuoBSmJMk6edLx/J/wOjmvJfRNLfJ16m0/x5SP8DmZB
	KxDcoEYbWqfIaY4o/9J5yZhARV41dZgXc8vTLiIHjFz1WCc1U2TVNK08ZQmMOHf5jyXhotqxvLe
	LZxl4mx
X-Received: by 2002:a17:90b:3b4b:b0:39e:d2a:e25a with SMTP id 98e67ed59e1d1-39e54b771c2mr760897a91.13.1789678071020;
        Thu, 17 Sep 2026 13:47:51 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e50a4bc22sm1232196a91.17.2026.09.17.13.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:47:50 -0700 (PDT)
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
Subject: [PATCH net-next v7 05/11] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
Date: Fri, 18 Sep 2026 04:46:16 +0800
Message-ID: <20260917204624.2427486-6-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917204624.2427486-1-coiaprant@gmail.com>
References: <20260917204624.2427486-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_134751_865348_EC47F2E6 
X-CRM114-Status: GOOD (  13.62  )
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


