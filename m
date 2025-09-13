Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AB5CAC594
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 21:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xc1itu5KlQDWqH+H4ca13G4lDoFzZa+J7vZRdBNUkg8=; b=EKdZ/YFE+yBBhT1u4Xur0nip8v
	IhJuoUPBynu3ppL6N2e1D2G7m4I7NEaui3kuKE4XgYQ7jqnjo5diszu1RumeO7Q10CMWdSjnk1gvT
	zFsF5gcmC3rA9Am6aT9YAFKALt6hX/Y5mV5jO8D3zoUnGnQ8p28Xi5pf+n00YsxRMtV81524Q8OD2
	rii2HebEcL5KiJRF+zpazPmnnK+8XAQ0emGj+u8yAfo4bfzfz2o4XV0ZKUvsKB27eMq2YUuLhFl+x
	jCMKHMTb8/xcuEm7Bdin2vnqFdhG23fr5VipBCnR1EwlSwNLjKLNv0lrOdqpMWkUnzH2dkaRwdIhk
	MpgNZQ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXbp-0000000GI7Y-2wPC;
	Sat, 13 Sep 2025 21:16:37 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXbi-0000000GI2X-0vtQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 21:16:31 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45dcff2f313so19428305e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 14:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757798188; x=1758402988; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xc1itu5KlQDWqH+H4ca13G4lDoFzZa+J7vZRdBNUkg8=;
        b=EgyriK6+rsyk0sCG6AXDTXCjAQU9As7Exadn+aadsfzblCP3A3mRtJugZWptb44qz2
         pYpS8OyXnfy5/RZZmSPr23w4DLC3ZHwxwcikCvdisRDF2O2uRC6iituRc2QR0xbrg9SE
         Sgrx7hkkaC4u3LqVm8/uS9thiHsUzYy+GaO0MDKvNPvAXRtqf9NMsw4qkATp53gfPgc5
         174zeamfCHzc0ZzO7SbsTwtdLjsfQi5FAnwOR7/FxTKZqg0aVk7YVUTTLyUPvhOFLwC3
         gNunwN1yoVYlO3h89Uwv2tM4QeEsTSgIHpkmuJ87DaCACsfm/6vbcme7acEmLTUjCQrM
         9Rsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757798188; x=1758402988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xc1itu5KlQDWqH+H4ca13G4lDoFzZa+J7vZRdBNUkg8=;
        b=EgF/ho2KzBFcbXLxDPP4mIQLu17NfwdWu5ej1QGz7A/k1cwNpM/FMBIPY2INY/71oo
         877ipjH5ZhK3kfZd/lSMMJUAdia0WegxIHaduimKuDRQP3vOdGHGaSpeGA5M24oU91N5
         9dujY0PVAXWVJOjdYFLBcohWFE64KFVSWqQ8F5mRBTo0DEhvr5k5IKaxgKRl+QSd6H46
         RhDzGu8eana4d+0bo5RL/9puCDu93CrHPtGgUr4p5Aiw7YaE1SrrDZLz+q6RV3Lkd76C
         aWyV+6xoTdQRFvAfCvE5I3B/3RgzHvTq2PKA9qNRA4Z24fZ5wAnDgB5YHrDswmbQoCzy
         yulA==
X-Forwarded-Encrypted: i=1; AJvYcCWbBBQ1r7NkoyIAYLdv7uw2O4d2ejopDIKwxSdeH/iJwZUYdhCJBB642xSXZmDwN6RyU4n2Mpk/AcOFMq1qe/7Z@lists.infradead.org
X-Gm-Message-State: AOJu0YzTZPakj8KWhU59dZUbYlwmE26s9WSTxTCzyl5W+kSMwXhckuT5
	RKwplHGkSjl1isvBipNr2n6VkpVNywWo2VqRXfp5j2b1Uk4JfGqVsxFJ
X-Gm-Gg: ASbGncsLx6y/KjrHeVAfaVa4RKaWc6mEY+2G9xgtdRtSaUPpnoK7I3ZYz0gj6rZKiTd
	Ze7rxLkMX+Xllp3s1yMQxQhpdKqkGQ5MnhGoHHQTlPGwkBotrYj6F5BECFCRpu/za6/Th5zlJKh
	Olyp0OWYZkArx8RlNxsHI3UVPZunVx3AL6ll9e7oqmaowHjgB9Q76IItn+nLVfbELvxyyRaQZHH
	979gZL52cF78FmuocwUoClUN0n/DYrbMC1PCphnu3QSYjtBwm81F65ImyLkWP2TH3Jwh8XLE6xX
	XBsURa9PWhG7StvosOHgAAFnwbCFn3HAoKVu/qbjrVetLwJGVuaw4ui+98Kgc6fzL8j3CKYCg/g
	jcWp2I59hFp5yjKNKYsTpQZWOEYKDsoO4BdnBylJQTQ==
X-Google-Smtp-Source: AGHT+IGhdgswjdcu+5JC+27xL3gEdZUaPnM5znx2uaoFA5uc1n2maYqdCXzlYh1D0GuyCTtQVTqWqA==
X-Received: by 2002:a05:600c:1c13:b0:45d:db2a:ce30 with SMTP id 5b1f17b1804b1-45f25971c61mr39608505e9.0.1757798188371;
        Sat, 13 Sep 2025 14:16:28 -0700 (PDT)
Received: from Radijator.localdomain ([93.140.65.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e014ac468sm65403145e9.0.2025.09.13.14.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 14:16:27 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Sat, 13 Sep 2025 23:12:51 +0200
Subject: [PATCH v4 4/4] arm64: dts: marvell: pxa1908: Add power domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250913-pxa1908-genpd-v4-4-55e4cf32f619@dujemihanovic.xyz>
References: <20250913-pxa1908-genpd-v4-0-55e4cf32f619@dujemihanovic.xyz>
In-Reply-To: <20250913-pxa1908-genpd-v4-0-55e4cf32f619@dujemihanovic.xyz>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2261;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=+LiKf5xAdZ3VQjErBPnxDlU3GQ3YyQ0Gx7TmBGM/obc=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBlH7ysdPpw0RT3vQf4RtxL3zu1vTtn5ZOwt9qz2YQhlz
 BXfJbSso5SFQYyLQVZMkSX3v+M13s8iW7dnLzOAmcPKBDKEgYtTACZyaiLDP+1NE9us7d3Xf1+/
 vbXEtXlV949f9+TOOPZX37FVFJh0UJDhN+tPww0L66uakjo2sWksUrm+eyXf0oDUq8/EZyrWzZW
 z5QYA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_141630_278684_F3AAE567 
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

From: Duje Mihanović <duje@dujemihanovic.xyz>

Update the APMU clock controller's compatible to allow the new power
domain driver to probe. Also add the first two power domain consumers:
IOMMU (fixes probing) and framebuffer.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
v2:
- Drop power controller node
- &pd -> &apmu
---
 arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 1 +
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi                       | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index 47a4f01a7077bfafe2cc50d0e59c37685ec9c2e9..d61922f326a4654a45ab4312ea512ac1b8b01c50 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -23,6 +23,7 @@ chosen {
 		fb0: framebuffer@17177000 {
 			compatible = "simple-framebuffer";
 			reg = <0 0x17177000 0 (480 * 800 * 4)>;
+			power-domains = <&apmu PXA1908_POWER_DOMAIN_DSI>;
 			width = <480>;
 			height = <800>;
 			stride = <(480 * 4)>;
diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
index cf2b9109688ce560eec8a1397251ead68d78a239..ae85b90eeb408a8f4014ec7b60048ae1fd3d4044 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
@@ -3,6 +3,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/marvell,pxa1908.h>
+#include <dt-bindings/power/marvell,pxa1908-power.h>
 
 / {
 	model = "Marvell Armada PXA1908";
@@ -79,6 +80,7 @@ smmu: iommu@c0010000 {
 			#iommu-cells = <1>;
 			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&apmu PXA1908_POWER_DOMAIN_VPU>;
 			status = "disabled";
 		};
 
@@ -291,9 +293,10 @@ sdh2: mmc@81000 {
 			};
 
 			apmu: clock-controller@82800 {
-				compatible = "marvell,pxa1908-apmu";
+				compatible = "marvell,pxa1908-apmu", "syscon";
 				reg = <0x82800 0x400>;
 				#clock-cells = <1>;
+				#power-domain-cells = <1>;
 			};
 		};
 	};

-- 
2.51.0


