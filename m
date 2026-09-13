Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795D6C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 19:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=af5XJnE7hcWtAkVsrU4T0JVcIxPb3Aa/NhPJOVNgxm8=; b=fNP/1tBmNya+0Le0E5labaG5oD
	ADwfBjabCWhuXIO0V0NB2nCXcPipGrIxU5lK8ko7mdt7BpL8zKQT6an3IJunUKTsVbNi50Ip7aPKI
	tVS6Ol7XnJJLkw8Di2wr4rxdhcCIwIR4zxPve61o5EPn+UQ9wHG9c3DxdvO0w2VPnf42ObEYW5BzR
	3y9mELuy22A/p8Y6J0tH74vWNJ828Fst0UI8q+tn6aqbtWDLGyrEVIXaR0g0iP+y/yPUvTnt6X5j/
	vKSTfODJOCGVZdiVZ/Es5GPg9bal/Uxba9wJrFNA4D3SVaNOBpLpmMFsUNBU3LmOq1uEUqiQtbA3H
	yKeUDnEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5pRE-00000001xCx-3NIE;
	Sun, 13 Sep 2026 19:00:29 +0000
Received: from mail-pj2-x07.google.com ([2607:f8b0:4864:39::7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5pRB-00000001x9H-03e2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 19:00:26 +0000
Received: by mail-pj2-x07.google.com with SMTP id 98e67ed59e1d1-398e03cc38aso1059010a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 12:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789326024; x=1789930824; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=af5XJnE7hcWtAkVsrU4T0JVcIxPb3Aa/NhPJOVNgxm8=;
        b=TjBlRMTRXuipyNnkB6hp1839pP2tDIdjUfYIPyye7Xdp2RN6P7Fc0uSONAmec0Dgyy
         i0SgHTvQlmVoZDHF6trN0/1MIjhKyKyOTxbNca5g0sDzINnmvbIjClGcG/T8WKbuNvj7
         CVRM+3dl9Le6G64qBZqFJkLv5wxKVRnMUqd3jKJG+9TKcPyYiUHqej1NR+60o4Sj8ZB1
         krPqyu8MxACOLnn47lKgaNaEnqURCWtOBdJdHjgZCylCYjvZs+NEZiPDkBlgQn57vfYN
         zeOwmLIsSSiLjfvmlioHVyUgSxDbRs6lDEHOD/Z/muhuAGUJpJ+9zUG050U6aFMVMPZd
         zcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789326024; x=1789930824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=af5XJnE7hcWtAkVsrU4T0JVcIxPb3Aa/NhPJOVNgxm8=;
        b=GCYPqWy80PSmXwo0Z0m3t0mCwjGh/a4bptDs5Q7QDOmkDejDwKxG1IWwS7BpdnYg/J
         00m/3I8DXjT2wy7ew2rrOgXzilP+olM4I+lCDbMT9qqOQTbaQ2yeziul1RLFw+mRu4nl
         wLvdbrwdd64mxOhOE5AGdENbKaQDDijluX5gmhwZ/Yblt1TuzFYN48GavrMUpu6K5WX2
         74H9j73XysP+q+Mv0Y1b06RfmkGHz7RSz4gcYz51dFVCqKymd1TpuECfuuZTWRvGU5Q7
         XyeYpIpjydPS4x19QQJw5bDsDXm7JlhtD+QUMHko9EiRRN9hO+DzZnhk707upt4Qzdmj
         lh8A==
X-Forwarded-Encrypted: i=1; AKwUvByPOyVPHIK02EkSYl2d1MBp2zG7JVlTMrIJg10n6iD/u4SKALNOwTBlzOXHY/lSxCIFhjgozURtNBw6fdsdXEBD@lists.infradead.org
X-Gm-Message-State: AFuF++k4FGHflhvedjXXzT1ydXxzgSQMY4JLCQ8NenCOcOYtwyLZfo3b
	7sxuIna36FNKiPRcKlm/fmWyWBCoF5PTe/6SgmJa0m/GVuxX6XwrQ1QO
X-Gm-Gg: AYBFou1/cO5wz/pjxJZJDdQmPvaYGhQKWpyLDl/+dcQzBJ8njFqRhG9IY4SrixQy0hd
	bKS9rG3Kv4ZJmVt+fat6fFoy4E7o9PTwow1QF/WNRYgbBL5be/mFf4WUlYAFBkTdk8jCHqkphNw
	OpRryB5O56xJBM1ZiaSyH1om0hv23Fs2NZwTChtbGa8AnMS+dhWK4uArgwEPzr7xqzd64VvDAdU
	7bXjaHnYlSbltZ0rh4q6u90L6qGbF9+wbBK0UE1xigvFfSH6TxWemPmAG/G428cuOW3+gxw1/Co
	K8p6qiV1nzWXiLZdQ+Ud1hfMi8hsW341qr108XN0nc57l0HQP6Nhk06DHv0cEmjeYyj3uTjPA+S
	3zhpKgnlHm8zJlnGQk4YYPA2KmyGKgnkg34VN+nmJkzTH7q+SaIyxbTNeCb0zWV2l9BMwjdqFD8
	rZf0HcX22VBTJf9K4V1pXW8SIGuYJPcvH7tSrS9PewIbPiVdaWe7bu6+zjWMuIqhZBDGgp6A==
X-Received: by 2002:a17:903:98f:b0:2d9:26b3:547 with SMTP id d9443c01a7336-2dd2a46f4cfmr250162755ad.20.1789326022854;
        Sun, 13 Sep 2026 12:00:22 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca6b7bsm36808655ad.3.2026.09.13.12.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 12:00:19 -0700 (PDT)
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
Subject: [PATCH net-next v5 05/11] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
Date: Mon, 14 Sep 2026 02:58:40 +0800
Message-ID: <20260913185849.907479-6-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260913185849.907479-1-coiaprant@gmail.com>
References: <20260913185849.907479-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_120025_079733_DF7F7CB4 
X-CRM114-Status: GOOD (  13.19  )
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


