Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59984CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 14:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrX9iJeaH+qHcBBbNyjcQovDyYRfm1h8+VjK0dWA66c=; b=hTExZmd9uHuCbKXl4aogHyj91Q
	kQxbEzy0fJCR13IoJm1eC7AGdCP5GFZJHZBWqoemiz57bpjl5Y0bjeSZopS/43mhEanEG9rufaC2w
	VDJR0/ADCyXMgH9eTkCGwc+DQXufiBSqLOZAGK5gmhASCDbeyU/uDpZMoVOeQCet+O+3/lOPVe3Gj
	qsoJCTX6cJWGSAiwJN50xltQ9MmfSnRUJNkY4ai4MBCeM9K7fmo2OIi6m0NoAf8Gf8UoG13vKoaoi
	NrVcVqZb0phriI9nA1fMAvHBBvE+5GDURDtG4IkjFi6NRMavgbbTn5CMEeEGLU54msO/ixk1Cnms8
	YHR0h0LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvGLp-0000000BTMr-0Gd8;
	Sun, 07 Sep 2025 14:26:41 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvFub-0000000BN7G-1zPG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 13:58:34 +0000
DKIM-Signature: a=rsa-sha256; bh=rrX9iJeaH+qHcBBbNyjcQovDyYRfm1h8+VjK0dWA66c=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1757253365; v=1; x=1757685365;
 b=SitENeWTOe05E9aU5RBQXMIIrQXwyD2Hxs3KeocAhlbDITmX6s8wKYdXVl7vNiiUak76egCQ
 FMdVU883/nq+Nt16/OF/jPNpeENnpnYTa+HdIgvx37XkXgXvoRaptV6Ty5poxfsDtCVNQ7t+ePZ
 S74xt46bLJEHYOtrVGpkTmJV7Dh3K/SFoSKxYH9ykLaLanF/63t7KiGMoCj1dE/pURBCHSwoQOb
 r3V4nTQaUGNvFTkfBsbhpLtreMOtt0Pe2qLdmyOmyzCzyw6J+I1Qos2ISzLpTqXyfEMrYhjPGb9
 ephrnvOMF8TWbGWlD60o11Il9ZCM2ABfFy1MW5tAX/YKg==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id a7353863; Sun, 07 Sep 2025 15:56:05 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Date: Sun, 07 Sep 2025 15:55:19 +0200
Subject: [PATCH 6/9] arm64: dts: marvell: pxa1908: Move ramoops to SoC dtsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250907-pxa1908-dts-v1-6-da776eb29e45@dujemihanovic.xyz>
References: <20250907-pxa1908-dts-v1-0-da776eb29e45@dujemihanovic.xyz>
In-Reply-To: <20250907-pxa1908-dts-v1-0-da776eb29e45@dujemihanovic.xyz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2065;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=x0fqWkqgQtK1SSNlROzTYDeTJ7VSRsicm6OwB8pn5ns=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBl7+94VPuWt2tOyrMB/rt7b0vy8Xw3WImY2p1ZesLVPl
 d76VaCro5SFQYyLQVZMkSX3v+M13s8iW7dnLzOAmcPKBDKEgYtTACayZDYjw1OnOam7r3bzFCvM
 eT4z5Hrt3dMxrsn/X8gsbO6T93Dp7GJkOGB2X4JLkr02YFX7Mb0dRsdWaZjZbmrpbNSJ4SnjWPS
 NFwA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_065833_695189_CBA68662 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
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

The ramoops memory region is the same for all boards based on the SoC.
Move its node to the appropriate dtsi.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 .../dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts     | 12 ------------
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi               | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index c28c2eadc42cc538fc5491ecdfcfbe0191004794..dc58b19ef5d11c69f52ea7804323fe2fb2257ca7 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -37,10 +37,6 @@ memory@0 {
 	};
 
 	reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
 		framebuffer@17000000 {
 			reg = <0 0x17000000 0 0x1800000>;
 			no-map;
@@ -62,14 +58,6 @@ cm3@a000000 {
 		seclog@8000000 {
 			reg = <0 0x8000000 0 0x100000>;
 		};
-
-		ramoops@8100000 {
-			compatible = "ramoops";
-			reg = <0 0x8100000 0 0x40000>;
-			record-size = <0x8000>;
-			console-size = <0x20000>;
-			max-reason = <5>;
-		};
 	};
 
 	i2c-muic {
diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
index 61498fd75d1dcaf0d068943c1ac14d3e5a7ca9ae..deb1a9df27c2f7c946096c05a684c3f1f0f16d6c 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
@@ -58,6 +58,20 @@ psci {
 		method = "smc";
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ramoops@8100000 {
+			compatible = "ramoops";
+			reg = <0 0x8100000 0 0x40000>;
+			record-size = <0x8000>;
+			console-size = <0x20000>;
+			max-reason = <5>;
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,

-- 
2.51.0


