Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8F8C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 12:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wnl1KeJgVHfqTjz+jf+qVoKyfQU1onphkpSJDzU5fyk=; b=N/qmaUkJMPYpXXe5O4W0u7MYAq
	EubLgr3Qian0dS2ZeFMcLl+uVKpMUsQ/bf7OwF0MTqG/0uOO4XbL+l8cu39IGcZvnnrve8KI/Qe1X
	7x3jHCv4IPaqsHHJ8pwOEPQJMAUn4j1d4Ym3xAXBCqBj/nO6rmMmlV/yxBuTS+U3kewG9OgY5p2/B
	2msMra8TyNZxhXlVL9a7uoQMKKs02XBFtV6qiYdosYxQEUkEpkmuSDWixZjlUTk61e6XIY/GNgRna
	x5IDlpKb/LxUhU6HnMQDLz4zQHg2+bMAo4XZqHQcQO3/Ly86bQuJk3+Qp1m+mqFrgflSUklbaEjr3
	IBxKWFbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCs5-00000002RWT-2vds;
	Wed, 26 Aug 2026 12:36:49 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCrx-00000002RTp-2pNs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 12:36:47 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49954b88fffso7457295e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 05:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787747800; x=1788352600; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wnl1KeJgVHfqTjz+jf+qVoKyfQU1onphkpSJDzU5fyk=;
        b=BVLg1ahrY9K04DcgeJjgp+catWhW9doujB6y0O/77ye3cmdggVqSfe3UAjWSFQE/lB
         quWfyQpzH7JOoeb2KZFs4h6O4aMFjiDOo5VhhZ6LW+SpbzlP/k5hDqvzyMzMQqBk4nAf
         IiRMoJb0I/N7ckn1eQ2wYPiPIaYCihxxxMHhQPhIurgOZYPBS5qQjPw+iDnpSVPqL5r8
         4SyTcy8gaNTUrsjIEhCTUOI2Pfv8JImDghmdV7bQnm6Vc1XXhYmE8AFzpbCv6HldUSFU
         j9k1Si/tGbJlo3P45C5HrX9nIrFcqeFXdvWUbHe0fGDBpHaud+ihGLuglH4I8jGmERpr
         ozTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747800; x=1788352600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wnl1KeJgVHfqTjz+jf+qVoKyfQU1onphkpSJDzU5fyk=;
        b=PBnZhxuFa9CoA7POmmHncg9DjrMTgpigU6xExi9eZOZU+4YEpEr4gkBCbVZabEOhXt
         buI7AdY0JgoeteHxXXPlm9SIp1jk6mynVjHpIF3ETsozf0FLwfReIwLZ/aW5VNVR7T8o
         vLM43fjZu8rvSTcw+ioiZgvZI/1GhfCahnvm8C1o2pA5SO+vGmxugOvCyAK+ulmuX1aD
         m39//tLRccg23Qgx00lxbshVFx4wbP0dCxLScmFtYxFvCSa22rtrX+KrRSwWmTXeoeoJ
         JbxcSidMaRPoDnloOZOW56GFihuvGdFeeb7jlsBddctQaTOsjjDwjh1k/zA6QkZrGkKM
         WWkQ==
X-Forwarded-Encrypted: i=1; AHgh+Roxw6NZnylbHDb3aMmBqLt/5jLWnC+pZBS4j6htADMNj0F7A6ymtOlTONUXx9O5lO0IfgJqge+YzX8+rOsecZP9@lists.infradead.org
X-Gm-Message-State: AFuF++mmZdxmQUetTG1WFe8BnuTtDJEX7yu0q7zSrK92usW1l5u+6RDS
	QY+E+AO0hliq8FNFQaXKUy8pKp8/Zy9RcxCAEd2l+q4TQYLYpPe17Y5lvvn2Nw==
X-Gm-Gg: AR+sD13wvIUjGAp3W8kl2PDaw6FwHNeNpRQ9RstQWlFTBPMna/HIdDfUYR7DLqUNTmx
	YKAK9KwxLhlpqPGcYSSircMi/QeAl3LQdOMZfLoAO/R8ZmuBYlIo2KFl3pD3NQF8bz67YHtlOEB
	rbzud0VHxSK5Sc4ysRCB7o427aSosrL9gWW/E4Ws6kDkamIZU40q5yD5ifsXNG5uy+gozFvn+Ls
	C6ZYvSZMJ2XF+080obd48sv9uOKFFyJhxRzrr62hTebX2R8cyrgjBcNV3WT286stLCS2qe/rSrt
	mxRw8HUuBG0MF/ZEnpvg+PdFbHvELUBhynBIjJxsrljjREys84roYb5Cp2D2Czi6rz7DrwdXP9t
	Z0PlPMVJ4XHpRADCh0vraaeg+CiskwPTiO7FqdDSydYqDlM3hfzpH7zEcXQQM4Cg5LO980lR5uC
	vkd5DvSLyQoOS7txL4iZ0rF+FftlvSyZMMJ/Ir4Klm9QLZVrSWpYvpH0DtgNGYXEY5NFnReZIC5
	mTgexAz0Ttf4Ti/aWTLJ43BZLVEI1gQtN7R9OMhiXcCbyE=
X-Received: by 2002:a05:600c:8486:b0:499:49f3:77b1 with SMTP id 5b1f17b1804b1-499dc6e1267mr68666055e9.3.1787747799611;
        Wed, 26 Aug 2026 05:36:39 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dc977692sm26009465e9.6.2026.08.26.05.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:36:39 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Wed, 26 Aug 2026 14:33:50 +0200
Subject: [PATCH 2/2] arm64: dts: rockchip: add mipi csi-2 receiver nodes to
 rk3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-csi-2-rcv-dts-v1-2-bcd8d459684d@gmail.com>
References: <20260826-csi-2-rcv-dts-v1-0-bcd8d459684d@gmail.com>
In-Reply-To: <20260826-csi-2-rcv-dts-v1-0-bcd8d459684d@gmail.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787747795; l=2631;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=qeGW5LpBgkLTF3oueK+lUIcMOPfyOq3EXFr+2a4jTmM=;
 b=Uj2PG2rjARWU4fhCPtVG8vSsygORspaiXfNPYB4WCs73KwD+d8M6ssdACXnNi68ENOup3DFjM
 s1X70tpbA9eBuRdXV9fkuL8Bndo7i8tqM7BzdY2UY2JbtcZPkynJ0IS
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_053641_733930_F37372B2 
X-CRM114-Status: GOOD (  12.76  )
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

The Rockchip RK3576 features five MIPI CSI-2 receiver units:
 - MIPI0: connected to MIPI DCPHY0 (not supported)
 - MIPI1: connected to MIPI DPHY0
 - MIPI2: connected to MIPI DPHY0 lanes 2-3 in split mode (not supported)
 - MIPI3: connected to MIPI DPHY1
 - MIPI4: connected to MIPI DPHY1 lanes 2-3 in split mode (not supported)

The PHY to receiver routing is fixed. Only the full/split mode of each
DPHY is selectable, via SYS_GRF_SOC_CON5 bits 1 and 2, whose reset value
selects full mode, so no software configuration is required.

As the MIPI DCPHY as well as the split DPHY mode are not yet supported,
add only the device tree nodes for the MIPI1 and MIPI3 units.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 52 ++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index b7a527614243..cbf8b70cc15a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1324,6 +1324,58 @@ vdec_mmu: iommu@27b00800 {
 			#iommu-cells = <0>;
 		};
 
+		csi1: csi@27c90000 {
+			compatible = "rockchip,rk3576-mipi-csi2", "rockchip,rk3568-mipi-csi2";
+			reg = <0x0 0x27c90000 0x0 0x10000>;
+			interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "err1", "err2";
+			clocks = <&cru PCLK_CSI_HOST_1>;
+			phys = <&csi_dphy0>;
+			power-domains = <&power RK3576_PD_VI>;
+			resets = <&cru SRST_P_CSI_HOST_1>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				csi1_in: port@0 {
+					reg = <0>;
+				};
+
+				csi1_out: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csi3: csi@27cb0000 {
+			compatible = "rockchip,rk3576-mipi-csi2", "rockchip,rk3568-mipi-csi2";
+			reg = <0x0 0x27cb0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "err1", "err2";
+			clocks = <&cru PCLK_CSI_HOST_3>;
+			phys = <&csi_dphy1>;
+			power-domains = <&power RK3576_PD_VI>;
+			resets = <&cru SRST_P_CSI_HOST_3>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				csi3_in: port@0 {
+					reg = <0>;
+				};
+
+				csi3_out: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		vop: vop@27d00000 {
 			compatible = "rockchip,rk3576-vop";
 			reg = <0x0 0x27d00000 0x0 0x3000>, <0x0 0x27d05000 0x0 0x1000>;

-- 
2.43.0


