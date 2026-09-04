Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97434C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 07:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GLyFekJ0N8Lq/xlKUVCeo3LPrbIlgpH48f7aKuVq5pE=; b=r73GH8cpE76ae0/zNxQRig21H3
	z7EUPBgYZ+N53lkRAsVmVy4hO+Qoks6kXsmXPnQkHZtOmHeaQk4NItzJdhcP8ArxUJKwYaZsiLP8i
	EG5OAiEDAvcNgJbLNKDRoE0hwQJlpArJpVN8uRTnZUyaUGNitjVQznGsATM+wPg8cfPozdTDZHFDC
	vmuO+LRgkGXEw8pEzqIMu4lVnky77A4nZY6NmtPIQlST0i2eHpW2yQbktEdfS40cV9OthYq+/Y/Wr
	fWr8ckm307mbmLgRQit66VyVlImW74lFSci8DJKO1MwIl3qu/xd/oFbITidXrGLZ4kq0iKkKz+QxE
	pYu5dwZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Omv-00000001J5a-3tja;
	Fri, 04 Sep 2026 07:56:41 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Omt-00000001J2I-0Oh5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 07:56:40 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1ab16a9beso27838a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 00:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788508598; x=1789113398; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GLyFekJ0N8Lq/xlKUVCeo3LPrbIlgpH48f7aKuVq5pE=;
        b=OwgJegL1U4BEuDHIGpRyO4VFl8vcZXzEaJ9sBWkHKq0pMBmYM3iShyP6LKvBTW/cCZ
         s5KqkC70vHWlQiahKHaaOfsZ7woHL8lK9gCOsW2F2pgKloCppgqTlzT/qK8RDCikZ+Lq
         o4E2GwqadEhxpM1R8Ey3bp8ZKCyutnj1g2B7rEAvnyHUyqWpvDg+I65ckynG2R48TgyL
         T8ImTzKYHuuFmwc00whg+PVOMDy9Gk5rxzamDv9uyi7if2u9UpnyQ3Ixnt8YuM5Pqb0X
         yF5y0WFiKr1NEYKHMbSJPmSlN5N3yTAcQwR6TQVukRIjEAD0As9NcNmtYc5boktxVAoO
         x92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788508598; x=1789113398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GLyFekJ0N8Lq/xlKUVCeo3LPrbIlgpH48f7aKuVq5pE=;
        b=cU7vge4/N6D5UaVOTwsIpK1RCcaBXd2QmZ1Q4OOEdB/uEDcwgNtX6zkQ+eYIlGYBwR
         mf7pqsK9bI3cm9XISfP6+5/bcA/o70AyzPcQ7r3VVv2kZn2hEffjWxlwFt974xbHqh2P
         xqnJoxlwKVhEZA5l/gXWBr2FRDVhd0ZMBIVqbqRPmllsA6yMXl5FPvxQgJFaYk5oo66d
         +Zu3oFVdtS4D5Sq5CrryuNB1ItresDZ4+F4mkTEfech3UHfbthflW4nPCXAMc9kJd9qR
         IDhRV318su3maky+dNXCQCCIs48x0dGIp52DoY7D/bV06ds/aaCVE4jaR8gHbKO1gU9r
         vGCA==
X-Forwarded-Encrypted: i=1; AKwUvByTRgr752nD6WOfhtu/BE/O2OIprD6x+j9CUZTMwwURuGWXw3J6S/coI+qq1jJIOSnMCYAvSrjMFZmumdcIpJJP@lists.infradead.org
X-Gm-Message-State: AFuF++lHrft2AdIKj2vkadiR1v9evyBlTjqVtGbC0VAfY23gJOzySteF
	+O3Zz2Omt+hguh1/YhhBLbWV7i67dPNSXCq33wT/0oLf4TxGHHRIVcyb
X-Gm-Gg: AYBFou1utZToNOTvFYPeDQi4HJ8Sq3KMZe/sE2IaB+2uMki8RKn0bvV/8soqJftu2eq
	YWq5GtYYfB8fhxTiKXNVIaU/D16n2pcqpOu+FzpWn94vAKQKXUbuaZfPbh4YKkLaR76WMxEigcB
	9eddrWJ220VIOFddoAT+YFCuzaMYP9Vea4BnqTPWbdm35FDwMdCcVtc8IibO1p5pa0qCAHPttoz
	WLlIAcCevr7sGX7en/qWteVeh2vN1TXnaf5M5XPOl2YtzvQHmeTLYycY8OpgJ/QVRXFbZg4b4CM
	MyGfNZ+cl+cqUQa6DNZCwgEJ0D9h/kCjh5QHbWX64/3k+CPPY3jUzq2PhFoH66IzPH+V9sDtrDV
	G6f/qwHQhU1BwbwAdRIIi4fg9H5eztxpSbtF27nKlr2sryg0fAR6InCue5HCPte16/XiGYNAJ7X
	DybIkgck3/5axKue7QRcUq0WTSvpjoaVMTT3PVdYVcTTFmOufiuylnDKb1kummpISGXuDdO6ruk
	Vdi4j1Jlh1NTw==
X-Received: by 2002:a17:90b:3882:b0:396:a47f:d38f with SMTP id 98e67ed59e1d1-39b268ce386mr3923722a91.3.1788508597140;
        Fri, 04 Sep 2026 00:56:37 -0700 (PDT)
Received: from jason.. (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c397b1sm9356695a91.8.2026.09.04.00.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 00:56:36 -0700 (PDT)
From: Jason Yang <jason98166@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Guochun Huang <hero.huang@rock-chips.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jason Yang <jason98166@gmail.com>
Subject: [RFC PATCH] arm64: dts: rockchip: add mipi csi-2 receiver nodes for the dcphys on rk3588
Date: Fri,  4 Sep 2026 15:55:34 +0800
Message-ID: <20260904075534.574037-1-jason98166@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <8e10a8c0-3648-47b5-9131-a1abdd7eb8c5@kernel.org>
References: <8e10a8c0-3648-47b5-9131-a1abdd7eb8c5@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_005639_130675_33CE4347 
X-CRM114-Status: GOOD (  13.28  )
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

This is test patch, contains the following 3 changes:
  - raise #phy-cells to 2
  - add PHY_TYPE_DSI to the dsi nodes
  - add mipi csi0 and csi1

Signed-off-by: Jason Yang <jason98166@gmail.com>
---
Hi Michael, Krzysztof,

Here is the test patch for
https://lore.kernel.org/r/20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com

I have tested imx219/ov5640 stream with csi0 and meanwhile stream on
rpi panel with dsi0, both using mipidcphy0.

Related commits:
  2e177b85541d ("arm64: dts: rockchip: add mipi dcphy nodes to rk3588")
  0d0947766d87 ("arm64: dts: rockchip: add dsi controller nodes on rk3588")
  5052c99cf052 ("arm64: dts: rockchip: add mipi csi-2 receiver nodes to rk3588")

Best regards,
Jason

 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 76 ++++++++++++++++++-
 1 file changed, 72 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index fc1fdbfd3162..dd2bbc02f8d8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1516,10 +1516,18 @@ vicap_dvp: port@0 {
 
 			vicap_mipi0: port@1 {
 				reg = <0x1>;
+
+				vicap_mipi0_input: endpoint {
+					remote-endpoint = <&csi0_output>;
+				};
 			};
 
 			vicap_mipi1: port@2 {
 				reg = <0x2>;
+
+				vicap_mipi1_input: endpoint {
+					remote-endpoint = <&csi1_output>;
+				};
 			};
 
 			vicap_mipi2: port@3 {
@@ -1568,6 +1576,66 @@ vicap_mmu: iommu@fdce0800 {
 		status = "disabled";
 	};
 
+	csi0: csi@fdd10000 {
+		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
+		reg = <0x0 0xfdd10000 0x0 0x10000>;
+		interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "err1", "err2";
+		clocks = <&cru PCLK_CSI_HOST_0>;
+		phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_TYPE_CSI>;
+		power-domains = <&power RK3588_PD_VI>;
+		resets = <&cru SRST_P_CSI_HOST_0>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			csi0_in: port@0 {
+				reg = <0>;
+			};
+
+			csi0_out: port@1 {
+				reg = <1>;
+
+				csi0_output: endpoint {
+					remote-endpoint = <&vicap_mipi0_input>;
+				};
+			};
+		};
+	};
+
+	csi1: csi@fdd20000 {
+		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
+		reg = <0x0 0xfdd20000 0x0 0x10000>;
+		interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "err1", "err2";
+		clocks = <&cru PCLK_CSI_HOST_1>;
+		phys = <&mipidcphy1 PHY_TYPE_DPHY PHY_TYPE_CSI>;
+		power-domains = <&power RK3588_PD_VI>;
+		resets = <&cru SRST_P_CSI_HOST_1>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			csi1_in: port@0 {
+				reg = <0>;
+			};
+
+			csi1_out: port@1 {
+				reg = <1>;
+
+				csi1_output: endpoint {
+					remote-endpoint = <&vicap_mipi1_input>;
+				};
+			};
+		};
+	};
+
 	csi2: csi@fdd30000 {
 		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
 		reg = <0x0 0xfdd30000 0x0 0x10000>;
@@ -1788,7 +1856,7 @@ dsi0: dsi@fde20000 {
 		resets = <&cru SRST_P_DSIHOST0>;
 		reset-names = "apb";
 		power-domains = <&power RK3588_PD_VOP>;
-		phys = <&mipidcphy0 PHY_TYPE_DPHY>;
+		phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_TYPE_DSI>;
 		phy-names = "dcphy";
 		rockchip,grf = <&vop_grf>;
 		status = "disabled";
@@ -1816,7 +1884,7 @@ dsi1: dsi@fde30000 {
 		resets = <&cru SRST_P_DSIHOST1>;
 		reset-names = "apb";
 		power-domains = <&power RK3588_PD_VOP>;
-		phys = <&mipidcphy1 PHY_TYPE_DPHY>;
+		phys = <&mipidcphy1 PHY_TYPE_DPHY PHY_TYPE_DSI>;
 		phy-names = "dcphy";
 		rockchip,grf = <&vop_grf>;
 		status = "disabled";
@@ -3429,7 +3497,7 @@ mipidcphy0: phy@feda0000 {
 			 <&cru SRST_P_MIPI_DCPHY0_GRF>,
 			 <&cru SRST_S_MIPI_DCPHY0>;
 		reset-names = "m_phy", "apb", "grf", "s_phy";
-		#phy-cells = <1>;
+		#phy-cells = <2>;
 		status = "disabled";
 	};
 
@@ -3445,7 +3513,7 @@ mipidcphy1: phy@fedb0000 {
 			 <&cru SRST_P_MIPI_DCPHY1_GRF>,
 			 <&cru SRST_S_MIPI_DCPHY1>;
 		reset-names = "m_phy", "apb", "grf", "s_phy";
-		#phy-cells = <1>;
+		#phy-cells = <2>;
 		status = "disabled";
 	};
 
-- 
2.43.0


