Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF398C55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 14:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/ufsj+YTp5B4a6XdY0sQWUkJ+NQSUpM6CSLQJOVS40=; b=u5F0hLTwXy5JUOPIGctKnIB5Nm
	0W2tuQq3qkdP1RP8WG+/6irz4tWt9Bo4vTE91QBrwC8Cvgo98BMH10DeoASIh0J+6qXUuL8iuy5N7
	Twc0lOrl7bcZuJjYhTQssGabOv/fFYzpaRHhOr44po5Wg9j4X0fYOnyW6elo9nMyUTcDLAC9k1PDN
	QBZLHiyBaIJaX7EBfUXflGFnEtqSpFAP6S942GELbe2yuxIPEGxgwvfTc649NSlEyEOZp+xA7JJUn
	fE5xkDjZbNB4WOcpV8w2ev782USeeS3EKLorHCXnZu1DRvtNzJhT5kNvZ98GqCX501q8xUQNSotWY
	pTArl18A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqAcx-0000000Eijm-1Spo;
	Sat, 01 Aug 2026 14:23:51 +0000
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqAct-0000000EifD-3o06
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 14:23:49 +0000
Received: by mail-pj2-x04.google.com with SMTP id d9443c01a7336-2cabfb70501so5896185ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 07:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785594227; x=1786199027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/ufsj+YTp5B4a6XdY0sQWUkJ+NQSUpM6CSLQJOVS40=;
        b=cILHdB7t3gGnaxxUPK0u8OR1uMDTPWrxXOqJGoKaMi+C205btIlmzAs/C1xQIZs/PA
         vDYaQhqc+w1ymM/oH0A1n4hh78Ar2TvvWolDgYaggF80LKgXplKSR16jfGq6m507xYs4
         pOjHInkkibXPaxDKPgqKZvrngyIZzTl28dhaWwpMj0zpQoG5h8OD247IDfI3evAuL3Jp
         lidQGqRsISBwwvMPOMdN/5+KvKQh89y4wsWYONx4QymEpOEl7sFB3j97bAf35e2qfrLZ
         eNEnEgniFgPy9qrYYsloF6IUc2XfCU063xdSK2Z/MkpcKaZnPHb4KQuB3ji2OgIt7gFB
         jC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785594227; x=1786199027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/ufsj+YTp5B4a6XdY0sQWUkJ+NQSUpM6CSLQJOVS40=;
        b=l8dTPYSQ7FBNHJ5/+imsiCj7smoVrEfod1QXzRZ0IkolP27B2Rj8oEWgWlwsHCpF2w
         F42KovfxG0wvVbu1yNc1pGLrGjqolMAg+AdA28EEsU8O/iKu4PL7BMGXNwkXEQSyJuRR
         jvoVGdOiJYKmitrYTG5ea62AiNfKP5dNdGgFwmifW+H8kProVa+Y1mF8gtlalQkBS0Nq
         byb62cQ684UY0kOr+mDUunvQZo+z1PFp3n9SP1KZhKcJPh3WvOJPQDOECja6BMf4JYMm
         nmaHZIO/64okIn7eU/re58NscKFKezrKuTVZXv5S3ssqjYzZZ4b09l/S1PngBxfvMKJr
         +OWA==
X-Forwarded-Encrypted: i=1; AHgh+Rr5TyhrXLO0mEW2tifrwhplnuuRv4wYKGQ4piAmG5EVEEiicm9K5+2nBKGKytIzogHXb20YleT91HJ8WD9aY8gO@lists.infradead.org
X-Gm-Message-State: AOJu0YygEatrpO4q31IOTDGiLf6CbdZG8wyTvjGcGuU6Kkg10pOCiGeM
	RO0gNwMEawIEstkKIGoEMoNlrK6tExlc1/qg2Kg3AB53w6Icp4BgsN80
X-Gm-Gg: AR+sD1005g6mBmJKJPQSFuxeRk+GR5GILeek54itqvlyeEqW9gIdkQc5sH0PQDoXc9p
	D4cVrr+NF9JW/Xoy724we4/n4TVpmtnRNzvr+QWh066YJV929xbXQZ/0QgaAlTOcYyrYjlaW730
	YrU9OUQcDNrDcrnVXZ7byHgUl9uSEFCVGLX2XmZVMpcxa7IeY/vBiLIuRCOxRmtg10KDS39s9lY
	1cdKqgVncw5NCU+90Y3RLSN0/BYGqYqrmegcKIX+HF4MegKcMXtO1WFqHPXLMCJxgV2IUNE41F2
	feqAGpeGE+NvlCa3x1oiBt9PS13tsZsAfqZCUjChI5GvlCsj+BQw40W9rOoz75NYQNrU94TlB49
	JkdeL4dCXuCxqUwQN2Bu5NMw4782dY/z8MM11omL8uVIBPyBDdPLh1gmDM2/J6uIs5WY3Kn5yBR
	ixtEzpu4x2tmS0C2zAo4nrwrM3uFSAOJZhvod0C0Ne2bGcBGExoh06HuU=
X-Received: by 2002:a17:903:1a30:b0:2cc:670d:9b2f with SMTP id d9443c01a7336-2d052412606mr37512065ad.33.1785594227258;
        Sat, 01 Aug 2026 07:23:47 -0700 (PDT)
Received: from server.lan ([103.213.4.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae5ac3dsm18043845ad.23.2026.08.01.07.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 07:23:46 -0700 (PDT)
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
Subject: [PATCH v2 05/10] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
Date: Sat,  1 Aug 2026 22:22:29 +0800
Message-ID: <20260801142244.679437-7-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260801142244.679437-2-coiaprant@gmail.com>
References: <20260801142244.679437-2-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_072348_138858_1F255D37 
X-CRM114-Status: GOOD (  13.60  )
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


