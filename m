Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96563C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 13:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=af5XJnE7hcWtAkVsrU4T0JVcIxPb3Aa/NhPJOVNgxm8=; b=RsKvDALhkkUxUlkgl5zqkAPL8P
	TAOlMSGTMNIU5aghr+dtOcAfBWIxuVmpFFsJGR1Qfzz/k4xEe/9+Gn0Su0lEHA/f4BQDLwz4NHzR/
	S9JiGmxYTUS3TCgSY1mbWvUyYKcLdwK2v2ZmuA5fBdkNjTMkYCdcx6AFEYNW1AtYXk621wWumqhg7
	PlnNjzQvd/s/QWBZQTSqLAP+qFYWpao1X9k7EfHuu03YBgeXHdLaItKzl50vy1cPUbvwZ8wHOF2Lk
	p11qTX0CQ0xKqzxYt755DNr1SwWC32THdH1tzBFiBptS8B2MFwXUklQwFr4E4eIebuFIh+EL4xqb/
	pdGRJHXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SRZ-00000006Xtp-2RMc;
	Tue, 15 Sep 2026 12:39:25 +0000
Received: from mail-pj2-f5.google.com ([74.125.227.133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SRJ-00000006XMT-06mA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:39:13 +0000
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d942de6574so28155685ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 05:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475948; x=1790080748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=af5XJnE7hcWtAkVsrU4T0JVcIxPb3Aa/NhPJOVNgxm8=;
        b=A+umL6mM38G9nU3EOVVJB35+J8QCDJS7Q1K2eXG+bhJHaIEGBJYzBVy/Xdi1L7qlSB
         Zp9Feu1fVUCqf1HJUxnoHK4OV+4sbVWcHb/OlvRXnESyBI/elGa8mt6i0WSTeINBs9Fs
         ytnRLNdgIx3rWVuLhr3SblBx4+LaKA6XlIhuYHH88tLcfXHuUXOk4vCHFfp+0BUKhWm4
         PqRyXmZ+9ICwobT58GiUezVx+JxGjbTrOdAHEWC7TKuCcVKVja8WLTc67pbS7I/eAme9
         xX7C6HAfbAseH54gKE/Rg/HduFqH4c1y2B1GUb/oOqvvl6R5kFXC8BNzKIR2WFbcIcyr
         e+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475948; x=1790080748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=af5XJnE7hcWtAkVsrU4T0JVcIxPb3Aa/NhPJOVNgxm8=;
        b=BM5PaAIXjmKqrnfUcMe9EKZnxU/gAr00zP7tB9ACDZ1uWZfnE5l8mKmXVojQ20ElKk
         SiN8P8jVWGVGc4CkAffhA72255j/ybrWWce/S94AUnJOLGJ4LOOAs2wyP/h/EFJP8C1L
         DCSXppM5MPtjDLGdx5cxgyNfVBawpS9hUH7CfEIgiCJ14/yqAFnJ+0ZJoBqzdjz2I0Vf
         oZQbzb2wm52YlOrc5kk6dm5K3//jo+KXpfnXeRdBKKkx6KecEpKp2JZzsLr6RMTTM0r3
         QtK/HhApzu/uwgDsUDL1fy8Jl9WvOuVzflXqjPYuET+bi+QzOXiAF8jboZKTShLl18B+
         +HMg==
X-Forwarded-Encrypted: i=1; AKwUvBxPaeaAU4s+nneQSdGL5+AP38hpOZjK+YHTkVzcEpv0Tc4JVN9jNu2T1duCQN2Al/86CMcaVsUF4Bcnsokb1msO@lists.infradead.org
X-Gm-Message-State: AFuF++mSOpUHJY0977OfAfiiNQu+OPYQGFFEEKdsLWEK2XdF1tk+Bohg
	QgMY+sA+Gm7yc6js7mCeNESY3IXxnma7voHbjLW7eQRQ0Rad1ALT0Ucg
X-Gm-Gg: AYBFou0y2hjpIBR5GGI0Lk1Ow3ukD5COyf8STGqSxOtHXeFTqfEYj0sIqiwfqrdnkGO
	bKNl4PFH5Y+0MqRAzBZKk8HhybNEYHAGEroiVZXwFUE1CigkJ2K9DlGGYjZU0mVCP4/YIJ9149w
	QTnEKjHFv91TP9YKqtQL0oWx0+TA0yrglKv43Jm7uiAGaG/trJFx8SmIx3spkFNu7QGiDmrTpFr
	dFV8gailkIOpflqBRpdmGOwf4ebjQPO/y5Zcn9wnIBso/fkrpVSja/hnaBeCIR6gFzBbNXswr/U
	OxlXK+jnoTayxoZfpUjAIoXhojvvJFQBJpFU8bgBWMRVmjPkzuZDw35KyGu/X2z01nO5RGXlI4r
	nllJiw0VGJxhCHGH+bD9z31cr+efPUwRTqaDdc6+OP5ilaGU3F6HCwj9tGs7LEThLxHZ5GQ4xET
	uPTNsrm/veGcHyfMUNl60MBCF+mR/skoG6CTmpRY6yEheKNXMs6ysiLqNt4cmQE9dfnvhDZA==
X-Received: by 2002:a17:90b:440b:b0:39d:e784:3e1c with SMTP id 98e67ed59e1d1-39dec0f7193mr14930029a91.19.1789475947417;
        Tue, 15 Sep 2026 05:39:07 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd28acbsm5307259a91.10.2026.09.15.05.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:39:06 -0700 (PDT)
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
Subject: [PATCH net-next v6 05/11] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
Date: Tue, 15 Sep 2026 20:37:54 +0800
Message-ID: <20260915123802.1561724-6-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915123802.1561724-1-coiaprant@gmail.com>
References: <20260915123802.1561724-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_053909_189694_734FBAA5 
X-CRM114-Status: GOOD (  13.48  )
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


