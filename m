Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77085CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 22:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIbZ2Qb+jhg9YxUorYRFCm5h/dMc9oDQD6qvJFZg4XI=; b=rSY81AOdMQ/NGc+6ZwAr95bZ5k
	8xncycWLZdxNb3zI4lg/sKqvTgrg6fSPnLXMuppO8obxNctvRE+Lo8R//jcY9zy0U3kRetFNSuaEJ
	0CZT+TtmmT7rLKGPN+7bt/n1ZG/Ixdaof5ZSAaLN//JlC7N57TezPMDN16H06IHGtnadPh71SqN+8
	ryVvnuvNwZJflEmSpHjIedWke1n6J8DxyFsQ3tzCL0F6tuHfnYn5erEucmoTlDMQXSDwc9HpAad8R
	tM+K9DNZwG/IpaaKaqM8CjhgmSHpjbyFZ85y+85jMeDwQ7YLaTTySJPzheSqwKxZ34U55C4ONOLSl
	jYkrH0+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDrMU-0000000HHeZ-2Rgm;
	Mon, 05 Oct 2026 22:40:46 +0000
Received: from mail-pj2-x08.google.com ([2607:f8b0:4864:39::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDrMQ-0000000HHc7-3YcI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 22:40:45 +0000
Received: by mail-pj2-x08.google.com with SMTP id d9443c01a7336-2e4a61a2ff9so10488615ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 15:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791240042; x=1791844842; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIbZ2Qb+jhg9YxUorYRFCm5h/dMc9oDQD6qvJFZg4XI=;
        b=Sl9apdmZxAPJ9EzcfWLL6JXvPW8+FnR32OlcY02JMoqwpvzji3ihi9qTTdFndtXeL5
         juAlvijMI3B3QLy0kEirpLQ/qFbaI1rUQFU9siwJ0exMLcQrBL+TkpnslZUQbvzq6Ezh
         PFzp3P7HoeZxCrf3hJDwaAwEBHfc40drVhdHhmByrOvTzzYTiGILD/ttBcpMXEGp9dff
         tCxDSsGA7n3e7yQ2y2jwuf1cLcLcTS8g/m7btdUwNqJth1Be14tjUQSJj7W71CIcGfSk
         /HT35WiY9qn98TG9zdm7zthN6IUkfr5KDgwDltBQ1ifm00d7S3iwcrajj5oySWIVbUGt
         dCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791240042; x=1791844842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pIbZ2Qb+jhg9YxUorYRFCm5h/dMc9oDQD6qvJFZg4XI=;
        b=S8VPRYRkWZ9WIa5yQHL74ZywlWqQY+hx5/WCan3uO7rRuL/9CCPHt5xH7w94EsnFTy
         wgvGWYzRt9BAvj4xD8VHmBHQxEcIfWhw8Sx8NL6hrZNe4RimB6XEAgPor8uiN7DJldGi
         XNEp+/M3Y0Of+fFRe7H8OiEvKWqLLBnsCRiQhlqkr8Ipcv5sgWHQmvqorOJXSXIx1Ub3
         WfeF2nQQYfBAPEu05snSwHaxGF/Vm54zYVz3fcRx/7ovoK8FxpMmPlyzbn8b900tIxnR
         Lc3h/HW1iYkhCnUZwOEwht/5njvxMrrJk68MhYvY+yJD5Li4lO4JHOq7L8ifnLEjW6/d
         t8fg==
X-Forwarded-Encrypted: i=1; AKwUvBzippjaLSeJfss/6prPSC/yaQYoCHzVuRcJQTEwAu3CLbT3+6EYK0u3H3OrzzgfZ/9pg5UrLn2sB9xkns8Zxy5N@lists.infradead.org
X-Gm-Message-State: AFq9FYKxMiPQYq8JvAoKV8X0G5D3pU2R9HNYrd8j096zg2m+hzYnMgrW
	3mRx+TZKVPod16BXL9mmLEnnm6FVE7Wmb6GkqkKzx2OWbTmzHB1bh8XrH5tkTV2m
X-Gm-Gg: AYBFou1uegwuMwLxTtsGtTcDavOrB8Q4nCEXxmJj43tEJLlb7MbnehK5WMgMI47nVyc
	CGMS4FtC9WZCtqOkLbX0aZR6lLg/lc1wYWwTd7ozhjFWycTwq5fT5MWqn8Rk1Fq15QqpzF0eJhJ
	zFp4dFG5CIb0f9995RqCZ1yyH6FJrktMa6hVgKI+BN5He8B8w4XLQDGOJtVaw+H0++ROQpe28X+
	DcfeJYgQzhQe0DFmwL9nQUN3QTlVha+1LGM52AIM+MsVLP4v/ig8yXmJsVtLid2nRFpRH97p7LX
	atzvxIelcbYO5ZlK70+U6GOYPaZwVhtBSQL8H2gvTl2wn3/t5DuHi+61RttQCmD/A1M4rdfO9qX
	dzpA38MWQiDBDB+xTHycm8LbGGRlvQfwJRegj45QBJ4ICcKkOiEkGAz5eE45sRsXIZfNvTRAKuR
	WY4XCW4seyrumHgSnHahK002Cg/3J7J8dxHGQO3KVoBfDUkPBc19X+vb1Dvi2jNOObWLUM
X-Received: by 2002:a17:90b:1cc4:b0:3a4:b8f3:8193 with SMTP id 98e67ed59e1d1-3a6cecb7bdemr5049021a91.48.1791240042184;
        Mon, 05 Oct 2026 15:40:42 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853e66d7fsm1496243a91.5.2026.10.05.15.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:40:41 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v10 1/2] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
Date: Tue,  6 Oct 2026 06:40:07 +0800
Message-ID: <20261005224008.1140250-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005224008.1140250-1-coiaprant@gmail.com>
References: <20261005224008.1140250-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_154044_077380_B411F22F 
X-CRM114-Status: GOOD (  13.95  )
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
index 3bc653f027f1f..2cea108b31a4e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
@@ -8,6 +8,20 @@
 / {
 	compatible = "rockchip,rk3568";
 
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
 	cpu0_opp_table: opp-table-0 {
 		compatible = "operating-points-v2";
 		opp-shared;
@@ -110,6 +124,37 @@ sata0: sata@fc000000 {
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
 	pipe_phy_grf0: syscon@fdc70000 {
 		compatible = "rockchip,rk3568-pipe-phy-grf", "syscon";
 		reg = <0x0 0xfdc70000 0x0 0x1000>;
-- 
2.47.3


