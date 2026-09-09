Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5462C79FBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 19:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oi1B5SovbX07FFLvzdNpIPpwtrKOTqPfPy81gDmX7YI=; b=AI/Q/ic3y2kO3NWNA/TvaH2CC4
	E91AWwNDXbuswCStyynnxXf5s2AuAiV4BQZLl6n2fMy1Fkw0qVPVVKqM9pFrnXGH1bmm+3GxtKM4q
	G5kFNbySnzn3+oYAwycSGq5MMw0qg+uqACTl7fXg1Ou2SGqLXLLbOdkSpQxRXSdVhh2MYxeQ83ic2
	CrYNbcur8/ndXOC9naTBcbQ/8oqx6O0nHpLzlpvgPewK1/c6E4ve7nTT64x+kRPDsMJYWe29NuoWQ
	UMgxF+vRiTAoCNcdCUUI5DrQjwBhtm9gVV9UnC3RVyIdc8aW1KONumXeh+axq3RLgHUHlX/iGaeU1
	YgqvTTlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4O6w-0000000CjAl-0HZz;
	Wed, 09 Sep 2026 19:37:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4O6u-0000000Cj9t-2MgA
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 19:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Oi1B5SovbX07FFLvzdNpIPpwtrKOTqPfPy81gDmX7YI=; b=YxGTuV3nupulLqCNltmrVVO1J2
	QofWFsH9lGCQuHqSKT0WD8R2Wxut7Gt+E9mKQga1nrRwjolkSgzMrzOvKLgBebImRsPJQK05wRoB2
	PiD/XjfbONfYCP+3xaCYiZ5wbC9+QmwybbFWsWOwRCsgXb/ec7yNwpLj/oWiB6LXKBeNCZqOfUMib
	h2NZHu+eV9P72KqLFmkYBn34dIzW3cE8ch/sJ8WcUkNYQ+kJtCqyHrEQjIjTT94XTXsYH5iubSJj8
	DgG+IASRUEYoM/GxC5tk2/0Sfh3baYB5e+mtliqMxYMWjI4kKR6CFk5eoqKlM/CT/dXOkBKBvndFw
	oaf01eww==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4O6r-00000001bi1-01Qh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 19:37:30 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso7185585e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 12:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982647; x=1789587447; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oi1B5SovbX07FFLvzdNpIPpwtrKOTqPfPy81gDmX7YI=;
        b=QcPglm8ZWxgNIvbfVV+mESMuSuSLTJM0xne/PdwEfi+YI4GLIplT3icejHzzs2OTxa
         8hgVMcxQ1ZOaYU4G8lIzn9a/VjL7FjlTvAtqwooZfYR1iIk3PkxeQykGCA7ruztTe+z5
         QoMjAJN35R1WGJpYv5C1bt7QBeT0h4aoTPFjP0kQISXXCikBl5PxLg6Dcg0z0dH6BvRt
         Xr1RbDSSTdLIO6EPq1mOHGymPpYWiC4Jbg1ZnCvshlaIeVl4zWMRVyeC9UI6YNI8DF50
         gaj8dQ3xdyyTRb1/WnT/2PwrKT+OI2EPeNgZ76ZHE15fxi2+0d09NmR3Su5EGdBTDM2O
         tJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982647; x=1789587447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oi1B5SovbX07FFLvzdNpIPpwtrKOTqPfPy81gDmX7YI=;
        b=lRuqLQ3PAbtqgBn7X2t+3yOqxb5wc5RIcEp5Z+AGvEDeaeMIj82ROlns3K6tyGSfzK
         q1ggZwtmNBcWCFdCc+h1sFzGQjncHFqyQPzfPYC2YeqpCE64di0vStOJATxbuXxSA7K8
         pVW3V1POV1b2nqA3S8znfe7VfKclFBQzz4IxiThxD4pWj1OnoEeShUSljuroAZu5e8aw
         riFhPrtBbV1GlBPbCd+fDtQ0ZmWy0L+b4I2G/cdxH4lAJhdTQFynXJmDdoOl/IvOjthh
         Y2nyWGVsgj+9macCqICMU9w1pOYiwaR5Bw8FBCeAWpSDemtyuTaTCSPOOTmGiRB5RMWa
         CKdg==
X-Forwarded-Encrypted: i=1; AKwUvBzIwNBEuBGM+pvDAKRXf3rNPYhwjocke82a49+BeLYre3aaoXwUHa87vdoRhQ1IJByDQ4cxGXMqdKfUzIA+Xmav@lists.infradead.org
X-Gm-Message-State: AFuF++kpZewz2+z0UoDmWW935bswsNzmx7xh64S5gYwZmH1AqzPjSyw8
	zef+1Gn70JdOXhW9TjDzwGzwDpZunapLlBqQEoSAgPp8i7x5ezYCrLKz
X-Gm-Gg: AYBFou34wKZ9TYfxjPel2wRv2H7Uy33q3O6Q7dazvEV5dBc/62iifApj2/FzIid+I+U
	jCBeJ+mqKw2/OnhkSS9iFP+dDs1WHwMyUCkq+o5wdnLR03qyvT15m0SHHjorbrL2GNUneyA+my3
	eSVv74ZZwQlUQI2ze0XD0xxHsARNF5N0oV8MvopRioMBgbexfOiICdDZHHIuApb6sdPnMnxJ9Wi
	vsvFMC7zUwJcfIlScSTGVJJNB6f3Ft77CvzV9XKBIszfO3iPwX7XCKmBcHXSB9vMxKxxNI7A7lN
	s24PY/FkeyfCraO0Z2kGXbDDQn4hFOa5FKVYMzOZypFLXRs9xJHtT8chJXUTEp3Hu2egdPrAfE7
	TY3fK5p09f14d5CcnjHYPIfDiEBcWLVVYpMvQ1pqo0j/DsowEhevbPsuTaSS6KUAwc5fAdZZp/a
	CMRYdfnBodiMfvjhKtk1SMx/T9v5duHLtK4qCKHmRuxY28O/H+LRN67WLQ6qus4ykyQ/PgqfmA1
	2+nBKjatQH7Z7urKtcPw1ubFLyzdls386FKjpquz50JAudLCdw98OwS5B6U4x9b8cHGwKwDEsgF
	BgV1eewvU6Sm4AbeEI+Lcw==
X-Received: by 2002:a05:600c:1d9a:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49d258ef83amr68465945e9.6.1788982647257;
        Wed, 09 Sep 2026 12:37:27 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:d357:e592:d56c:d3b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be64a5sm13123995e9.6.2026.09.09.12.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:37:26 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 2/3] arm64: dts: renesas: r9a09g057: Move SDHI nodes into bus nodes
Date: Wed,  9 Sep 2026 20:36:38 +0100
Message-ID: <20260909193640.8069-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909193640.8069-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260909193640.8069-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_203729_160544_7A03663A 
X-CRM114-Status: GOOD (  12.40  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Wrap sdhi0, sdhi1, and sdhi2 in dedicated "simple-bus" wrapper nodes
(aof_sdhi0_bus, aof_sdhi1_bus, aof_sdhi2_bus), each carrying a dma-ranges
property.

Add dma-ranges to the enclosing bus node instead of the SDHI node itself,
since of_dma_configure() applies a dma-ranges property found on a device's
parent bus node, not one placed directly on the device. Wrapping each SDHI
instance in its own simple-bus node lets each one carry an independent
dma-ranges without affecting its siblings.

The same dma-ranges also let the rz-sysc driver derive the SYS_AOFn address
extension register programming for each SDHI instance, identified by its
MMIO base, per the SoC's address space extension mechanism.

Set each wrapper's dma-ranges to:

    dma-ranges = <0x0 0x40000000  0x0 0x40000000  0x0 0xc0000000>;

Leave the corresponding SDHI's low 1 GiB device-side segment
(0x0 - 0x3fffffff, SRAM/peripheral/xSPI/PCIe space) at its
identity-mapped reset default, and remap its remaining 3 GiB device-side
space (0x40000000-0xffffffff) 1:1 onto the same physical range. DDR on
this SoC spans up to 16 GiB starting at 0x40000000 (DDR0 and DDR1
combined), so this 3 GiB range stays entirely within DDR0's native base
and changes nothing for any of the three SDHI instances.

Allow boards that need a different target window (e.g. DDR1, or a
dedicated reserved-memory pool) to override dma-ranges per instance, as
done for SDHI1 on the RZ/V2H EVK in a subsequent commit.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 123 +++++++++++++--------
 1 file changed, 75 insertions(+), 48 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index bbaab75681c2..34639106d2cc 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -1577,63 +1577,90 @@ usb3_phy1: usb-phy@15880000 {
 			status = "disabled";
 		};
 
-		sdhi0: mmc@15c00000 {
-			compatible = "renesas,sdhi-r9a09g057";
-			reg = <0x0 0x15c00000 0 0x10000>;
-			interrupts = <GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 736 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 0xa3>, <&cpg CPG_MOD 0xa5>,
-				 <&cpg CPG_MOD 0xa4>, <&cpg CPG_MOD 0xa6>;
-			clock-names = "core", "clkh", "cd", "aclk";
-			resets = <&cpg 0xa7>;
-			power-domains = <&cpg>;
-			status = "disabled";
-
-			sdhi0_vqmmc: vqmmc-regulator {
-				regulator-name = "SDHI0-VQMMC";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <3300000>;
+		aof_sdhi0_bus: sdhi0-bus {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			dma-ranges = <0x0 0x40000000 0x0 0x40000000 0x0 0xc0000000>;
+
+			sdhi0: mmc@15c00000 {
+				compatible = "renesas,sdhi-r9a09g057";
+				reg = <0x0 0x15c00000 0 0x10000>;
+				interrupts = <GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 736 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&cpg CPG_MOD 0xa3>, <&cpg CPG_MOD 0xa5>,
+					<&cpg CPG_MOD 0xa4>, <&cpg CPG_MOD 0xa6>;
+				clock-names = "core", "clkh", "cd", "aclk";
+				resets = <&cpg 0xa7>;
+				power-domains = <&cpg>;
 				status = "disabled";
+
+				sdhi0_vqmmc: vqmmc-regulator {
+					regulator-name = "SDHI0-VQMMC";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <3300000>;
+					status = "disabled";
+				};
 			};
 		};
 
-		sdhi1: mmc@15c10000 {
-			compatible = "renesas,sdhi-r9a09g057";
-			reg = <0x0 0x15c10000 0 0x10000>;
-			interrupts = <GIC_SPI 737 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 738 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 0xa7>, <&cpg CPG_MOD 0xa9>,
-				 <&cpg CPG_MOD 0xa8>, <&cpg CPG_MOD 0xaa>;
-			clock-names = "core", "clkh", "cd", "aclk";
-			resets = <&cpg 0xa8>;
-			power-domains = <&cpg>;
-			status = "disabled";
-
-			sdhi1_vqmmc: vqmmc-regulator {
-				regulator-name = "SDHI1-VQMMC";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <3300000>;
+		aof_sdhi1_bus: sdhi1-bus {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			dma-ranges = <0x0 0x40000000 0x0 0x40000000 0x0 0xc0000000>;
+
+			sdhi1: mmc@15c10000 {
+				compatible = "renesas,sdhi-r9a09g057";
+				reg = <0x0 0x15c10000 0 0x10000>;
+				interrupts = <GIC_SPI 737 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 738 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&cpg CPG_MOD 0xa7>, <&cpg CPG_MOD 0xa9>,
+					<&cpg CPG_MOD 0xa8>, <&cpg CPG_MOD 0xaa>;
+				clock-names = "core", "clkh", "cd", "aclk";
+				resets = <&cpg 0xa8>;
+				power-domains = <&cpg>;
 				status = "disabled";
+
+				sdhi1_vqmmc: vqmmc-regulator {
+					regulator-name = "SDHI1-VQMMC";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <3300000>;
+					status = "disabled";
+				};
 			};
 		};
 
-		sdhi2: mmc@15c20000 {
-			compatible = "renesas,sdhi-r9a09g057";
-			reg = <0x0 0x15c20000 0 0x10000>;
-			interrupts = <GIC_SPI 739 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 740 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 0xab>, <&cpg CPG_MOD 0xad>,
-				 <&cpg CPG_MOD 0xac>, <&cpg CPG_MOD 0xae>;
-			clock-names = "core", "clkh", "cd", "aclk";
-			resets = <&cpg 0xa9>;
-			power-domains = <&cpg>;
-			status = "disabled";
-
-			sdhi2_vqmmc: vqmmc-regulator {
-				regulator-name = "SDHI2-VQMMC";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <3300000>;
+		aof_sdhi2_bus: sdhi2-bus {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			dma-ranges = <0x0 0x40000000 0x0 0x40000000 0x0 0xc0000000>;
+
+			sdhi2: mmc@15c20000 {
+				compatible = "renesas,sdhi-r9a09g057";
+				reg = <0x0 0x15c20000 0 0x10000>;
+				interrupts = <GIC_SPI 739 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 740 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&cpg CPG_MOD 0xab>, <&cpg CPG_MOD 0xad>,
+					<&cpg CPG_MOD 0xac>, <&cpg CPG_MOD 0xae>;
+				clock-names = "core", "clkh", "cd", "aclk";
+				resets = <&cpg 0xa9>;
+				power-domains = <&cpg>;
 				status = "disabled";
+
+				sdhi2_vqmmc: vqmmc-regulator {
+					regulator-name = "SDHI2-VQMMC";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <3300000>;
+					status = "disabled";
+				};
 			};
 		};
 
-- 
2.55.0


