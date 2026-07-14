Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A98C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D31Jk59RNQrVzT/A24ayRfZRG2gdPQCEGTF2WIN9kY8=; b=FjH1ESH7Y/18yOzdbDXtE1i9hV
	lWr+dvpHiFeusslhvzOiYWdvc860tNAb5/Si4ruLK3rWr9NaMZMVRy/yftPCOrKyboD2Ce1EmDWx3
	7RDFSdrAzSEsw7oxpdXd2uBRJJ2/2f8Yk15gCmb7BOZRC3txHRWXEU9nU9exMJMSxj+MiaPYT4AnK
	TN+UahN2k3RhF1G0ejfYRrkO8zd9cG/1b5pVbDpulpyYJnz0MGF2Xlrhx5oFgjWTh7B8w/OnUXq+k
	r2HG2e3yhLRyyQSJEInwTgn4Gur8/n0tMGwwZC/7hCtBi2Rumo1D4EI3nytD1lMFTiGntu+qRuHJH
	9JveVYvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiaF-0000000D09l-0gjR;
	Tue, 14 Jul 2026 19:14:23 +0000
Received: from mail-pj2-f11.google.com ([74.125.227.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiaB-0000000D03y-1UPg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 19:14:21 +0000
Received: by mail-pj2-f11.google.com with SMTP id d9443c01a7336-2ceb5a39c48so4975045ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 12:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784056458; x=1784661258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D31Jk59RNQrVzT/A24ayRfZRG2gdPQCEGTF2WIN9kY8=;
        b=MGSGUAdmykY5iDpmAX5OCHr5tSuY1eXCVpARy+PYu9GtRjpCLgU5/cb+OtrpfLy01Y
         M06i2RoclkVs/v/jPeTTUfhGo9YWwaMDXEaMVkVIR+H+oeu86+zPgzABckH+fPhvnl60
         HMm2/bZIbZslM0Voxc69kKixsbqNB7+dWuvKq8kaxVQwg3FjvZcIl31QroZxs7cuYUH0
         DQ77D/4oSv7lDhf3aOKELf9QiBJZUILGWB1WsBPxx2sqvRWKeYRhLM22hbTt+61bbLkZ
         +S9n6oHqzC3eNj4hcrmb80zJNwMT6PZ/zRNjiJG3mhJ+5p2DvOKLh7iDUlS/mJ+/fF2G
         k3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784056458; x=1784661258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D31Jk59RNQrVzT/A24ayRfZRG2gdPQCEGTF2WIN9kY8=;
        b=KW0M7b+26+9XubeZCVdqG6FCBT/mpgFfqF3VM8Uu62VOWszph1+8k9h/yLE08JMi3H
         JslxWL5KKSgXTJAxk7JRD92Q++MmF9n8ZE6rYSQ9G5Dd2jhuzt9PD6GQIcW2JRd+MgaD
         Jr16fJNU4S+iyCC/NLpp6aaDN1ZmIsSVtNXZRbFw49qzm8GYqNYm8j6TctQE//hl84A0
         1UodQPF0TPonygiWIRRH46dT9RNzIjMmnPattOmi3/RuXRX7SDjzy7oVk1ZDFfY11hpJ
         e3vFNllbUw2Peezxn/Wvlnl1xcEPGCG/AYKkrP64t6Is+gHKNvB6zMcX1l8hNUvq264V
         oZCQ==
X-Forwarded-Encrypted: i=1; AHgh+RrT8iRr+PxsVXYp9+p6KMHNfI2UXLpnq4E9ahypgl6GgbztfZXCaFjYWD6qAexdANtmKnXkpE/30Iimx04LEOuX@lists.infradead.org
X-Gm-Message-State: AOJu0YxT0TJgP3gwZzBqaWPKn5Mpiye/sNEkLxWD6j/FkB2+JoEs49p8
	DIlwh6Voj5l5kQ+Kzfl5DKPm7ck1aTILs7aqiWOXuHIrbi5jJJCIGNDT
X-Gm-Gg: AfdE7ck6n1m6n0i50LQTPsxCrMEAoVDRcgVl9I28mMwFJN+6Fwmq438ZRCy89Zcif5n
	sXcEp701LcgSQO4RnVX+KYLiYzgjr3P98ohdnAVodWX0RGG+omRZxliiZxmLT8XWq8KF1AjIl1b
	/UUISqn7gbEM6HbcPPpmFEyj6GPsZ6PN/ETPyTKvmDUqJhUA3QVyM4moHTzAHBimxa1zs/3smV0
	adtF6LghsBkzfdSI7H0hbHWCg0H8dkmZ4E7JzRgtXahglIQDTqdPWUwumQ/yhmEYva8PDUwI81Z
	2/Q9uCRJ1n1SRBKtUoSMlxxyNGR6XlEe/YDZfs45A9bAJgVu51KzhVtNBQGQjyy8mDBYdpYbUE1
	b7Muj1a/dqFSmU7vsI/VrxD4XI3xOqRgCd37RIra9WVdof4ESfhHwjdN/5+XzILRq7gaSc+WSMd
	BR4ZYwsAwiatA=
X-Received: by 2002:a17:903:1b08:b0:2ca:17a8:cfce with SMTP id d9443c01a7336-2ce9f2852b2mr148789445ad.29.1784056458374;
        Tue, 14 Jul 2026 12:14:18 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d451sm120763245ad.65.2026.07.14.12.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:14:17 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: kuba@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	heiko@sntech.de
Cc: netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [RFC PATCH 05/10] arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
Date: Wed, 15 Jul 2026 03:08:33 +0800
Message-ID: <20260714191341.690906-6-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714191341.690906-1-coiaprant@gmail.com>
References: <20260714191341.690906-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_121419_401736_B1484253 
X-CRM114-Status: GOOD (  11.58  )
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
for the respective GMAC nodes.

All nodes are left disabled by default and must be enabled at the
board level when 1000BASE-X/SGMII/QSGMII is in use.  The XPCS node
also requires a reference to the appropriate Naneng Combo PHY via
the phys property at the board level.

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


