Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6981FC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 11:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSObQBHAPu0fXn6/uVS83Vw2xOwdtVTcMmwcpXwTo+g=; b=4LC84cekrK6JuNAvbkPxzLsBXM
	NP5kcnw5grD9CVUNXm3fBAUYY7wjblhT6ZUcwrnAworwqvCbm2e8pP7RzELi2lj3LzKfpZKfsiZoR
	IT7zfxJ3L0DqfesQMjn3gAy1/YESQpD9enIz1GeQ0a2YGjZ2KTsMMcQAvri2nw1L1UlgDQFSB7VOE
	xnVuvMlu9Kaw+cQIm80zv+FzteOSXqjniA32aYU1ofv/klCGPfTcaFJK7vyqlCly7n0dJx79pNTF2
	yBjhqRGXCcPJXaeQYggGGXimnS3SY3GVCNI+5wyl18LYbvTUUn0sRy3FL7iIqQvTwuCBOCUA55QIB
	12/eEWcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RmX-00000006KhR-0zqR;
	Tue, 15 Sep 2026 11:57:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RmN-00000006KbV-45KG
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 11:56:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=MSObQBHAPu0fXn6/uVS83Vw2xOwdtVTcMmwcpXwTo+g=; b=irVnja73x4YrfE/ViAMRtvsk3h
	qAsdGVc7CQbFbIWSWo7f/ASLvF0UCjWt4UCTqNOCH1FdgsUyb6NQO4AfHbC4jD0WbKzNxKp5pRtl6
	hTjFLqqTJURS5bkUBKMBDKUY7aCgEcwrEUVfGQNor6BRtGqiG+6tqivR5Bq7iCtBLdiVD2k6+pPBR
	0o2A92eJQM7FBuFqcmVtFg2MKnxrYqLu6Qd3x+orNH2Gz2/l3Ml2vmmtQLPC2U3pr9xOdHdZKo0JL
	o3GTzlmpvLDxDIfrX2yWsrOlJYiiacbk8OdKIXX9aQUVRnIY5qvEZeNGmhYXECJNXXe6UYrKN2omV
	rkIMUxGg==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6RmL-00000006git-0PkV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 11:56:50 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso25028525e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 04:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789473407; x=1790078207; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MSObQBHAPu0fXn6/uVS83Vw2xOwdtVTcMmwcpXwTo+g=;
        b=NZ2uHWw2nOBTYEfxtYFy1Iga94XHwKHXjqpvuzpbEj7Egr9IsU4V0XCq/X4uSzycLZ
         gV5bQeCDmeS+7JvqH4qrxQ5boAsxyHsdfFzjl+AytP/3c+prAb6kI8R5NPsz20ZWf+Ti
         HHOEn7FDUqx3qhX2YrmR8lJPMrb3zHt0DSwknkUF35D4w/OghLcIKLsjROBhtFiCpjN/
         BLl/JU0kPRk5rDY8x9R16ouN4cg53XGnM32iAjxqXkptuKvUcdlfCUiV+i9om04fLGc4
         kyXElPQnvP0enu4MsdIK1q46DroowbaIExdqaMJgbbXWDjgGqRirYtdiVMzY41DzZkBa
         X8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473407; x=1790078207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MSObQBHAPu0fXn6/uVS83Vw2xOwdtVTcMmwcpXwTo+g=;
        b=eyFhn2RpPzkLsnPrwXfZZQd3eZVtmZp9p8eQ1D8bM00eaXTXgAv8lYMJ/hSXwvXiPp
         p3M7H59GTsZznNrwocA04TMrtqUTJ3CkpGC6IU5eYi82UcRxBvFjwymYzRFsvzuNZAfF
         vU4LVuCtfM43f771WToyDNTxCyUqwt1xPcSZpALeX11SNlbEFSKnx1eyZkhhOH2B0G2G
         tFMAw6IosAR5KgYnnFOtQtECUY9cCBDKJzBwMX4KjwhenvdbHox/2YPXJ4aHaxvcf3Ty
         yTvpvav8yGCnC0Z+N6JSf1ZSC/k2+RLXla5G8vAjpauTbr5Cdu+GfhQ1qmVf2xZnOP11
         Li+w==
X-Forwarded-Encrypted: i=1; AKwUvByAMVcekwiBNeVCa09Qrf4hVQqJr4Okv0lg58cdGkE8/RbiwUj1Soby43B+b/Txdwl8Ge+Z0wtl0AviRYS27mSf@lists.infradead.org
X-Gm-Message-State: AFuF++kZklYN+FyFeyhZz8wQGKU/NWb6Lu50XdFpWFpTNEqvzyqoqkkl
	BGUF7W9Bg3vLmx1fgd3rBSGHTRs7FsJ836zQDeGDMx2z6Uj1vbicVclk0end7w==
X-Gm-Gg: AYBFou0N8Fc0ET81AlEitb7EiuZZEDavQ4jRh/KVsjssZj7HsLtDDbr4utiJCFuchPl
	p61Xc4A5j7BMpnj9IkmLukq1VfDyIr/FQYenb1iyiPSGQotQVBPFetKezHTlAPC9/X7Icb7Xwm3
	HaM6zrFJ/Em2sYlfnKAGGH0xVEul3D81Vx1mg81aWEnj7qPDheTDoCfoOLM15rvh44EwDzxP+yr
	Y1UhDmJ+gARrNW5dk1FG04WTLQ8iIMkwx/wR+/rofhGdjNiU984XvFIK4DcmweMpbpmTWb+GZRF
	nWjJJMsCDrRQ1afwnuGaSUBEcfcip+XX4XDET8PcpocPLdQiqsM6u1grdC2TjRXaAkhWIMLOT3P
	TTa9kKWlD77d0kmLW9FOs7Oy/2KNO/T9/uaBf67WD041bRGtNMg/7y4ghN7F3Fx1PERwmDyLYy8
	qAw/zumMnRfxLdEVE3+rMzqx6dpSvi5XVD38VLamEWVcbpdqE+qKzLcB79uh/ZNY+s+SdCFHNrO
	RvoD785C36ndJwVBo9ZQgAJ0uoE1L/NqEFoTjIOzUiFhuPMu75kc/zg2P+tiERs2fwv
X-Received: by 2002:a05:600c:3487:b0:49d:1cc7:5ec3 with SMTP id 5b1f17b1804b1-49e7a66af92mr186642285e9.9.1789473406677;
        Tue, 15 Sep 2026 04:56:46 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c59900d73f8285c1e647ab.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:d73f:8285:c1e6:47ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef88754sm63175565e9.13.2026.09.15.04.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:56:46 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Tue, 15 Sep 2026 13:56:41 +0200
Subject: [PATCH v2 2/2] arm64: dts: rockchip: add mipi csi-2 receiver nodes
 to rk3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-csi-2-rcv-dts-v2-2-bdaf8141616a@gmail.com>
References: <20260915-csi-2-rcv-dts-v2-0-bdaf8141616a@gmail.com>
In-Reply-To: <20260915-csi-2-rcv-dts-v2-0-bdaf8141616a@gmail.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789473404; l=2691;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=hz7ecKJMlWN4w7YByidxbnhsifV5HkA2kX05eT5H6SA=;
 b=tj68X/IcmWZX/XZiXkGeeRk0CFzYyPr/Y7qcNgyol3bOUZ7O2Jnd8YAYI2xuhQ50+w+iMS1+r
 8idipYTKQdOAh89PeeC1du381r95I3oTVoV/s0oBkv93JJ63M6jymvM
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_125649_185434_9581572B 
X-CRM114-Status: GOOD (  13.06  )
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

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
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


