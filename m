Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DE0C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 21:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWoJYzcW0AWxwtfPly+dHtM2f9cvjv3KZD392LRH0AA=; b=gv0I9umfQ77kBZbmF8RhgbWhNp
	Nphkr2jryXdyUmT92OYOujOFQJtJxmVdnrxKhquVFf/x+64k0kipLXn4lAYJFLVLLWT5eAqaAvZoI
	ETmJ5/TSEVKwkFxynNEVfl5blL7DxJSGhDlfKimqc/Tre/QWspDW37OsXxQoBQyx6IjgHmBlo8135
	rlUN+bYrQxK3aYcOgqbIyTAW56lkyvllab2pYBAeH5ANKK8qllShh1bygRIlVFer9cPcaOzyelnHf
	qvysaL+G7tVdnMR0bRBG3PJ1hj95csrIRAz1H+5kyL+lPCJ9I7cXno8gRcxnHrEIsVVP/KgWdtbU+
	ddtPDU4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bXX-00000003KZP-11ei;
	Fri, 04 Sep 2026 21:33:39 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bXU-00000003KYN-0MXl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 21:33:37 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-90cc0ebbf4bso13779376d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 14:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788557615; x=1789162415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KWoJYzcW0AWxwtfPly+dHtM2f9cvjv3KZD392LRH0AA=;
        b=BlHwD/OQXmgkMUULRm1EBpOFkgeIrFcE6fPc98MiDGZwLCMnljitp8sX/KoB+r8w6P
         7EwYIPu/ZRem4lhEDvVSSm8cqz8BAMEvR6T7+46r5ewtvZIx5LND6BKm13W6rOczDcID
         KIQiUmCH4KbTKRR/ESCas4+uZB7XdS9y1C9/CKPRen5sPEVCpHjI0MxB4llCyQoZ+bRm
         3k8VWEs1YAzeSIU0AV9ftmYdtzvHSehQlMzEv/4hnzHpPluIidCjqth2gaf2dGMYlDPh
         XgPiGbqK9vTdAr+fxHZ5LR2KXmX8s0WxqksaBfurFNhR4i5FahAiw4BX5P9JwfseFLnZ
         3Wyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788557615; x=1789162415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KWoJYzcW0AWxwtfPly+dHtM2f9cvjv3KZD392LRH0AA=;
        b=cNI8g940QZsTFg5PvR1yZw/v7s+WCWh46r8ET8Ag5IlTDdtmKav0e3n9KEF7+uaUHo
         SvOKdH1ymG3TqFmk1+Kklsah0drmmtY5KCkDOWUISD6ayEC0yOq9rHJLCETDRgIchtGN
         kcaT388hWbAHJU2gW11t1zSOdsTYZYNjotYbrvQMiqiOX9eOCJjWNzeSPlpQRaMODW3N
         6+dh/f1lsLTAbPUtV7HkGL89aDIepzbOyI+AQ7hVf3laBNUKAU1XMWuZkGTgotW7WLSO
         kIXnQctF7WdiXSx5zBrAzuZDDlARsVPWcxwq6586mU2fcSzBANRbtyKW4nSdUxfCkOEG
         ZPQg==
X-Forwarded-Encrypted: i=1; AKwUvBx0qqfpaRejhYFmU/T9mkR9gxwIRWdhv6Qs4eZFUR1wY0h1AT3o0Y3qy5OEPjRe88vhyZgDwvf9Y6fSvysYleHo@lists.infradead.org
X-Gm-Message-State: AFuF++kAUjx+PARg5dw6f+eVuHsRR44o+PhJygytMfElLgAjptnWqykZ
	kFo4tRyWTdHt2e6LAlNyrYPEkhRSEQz6qCIlwy1Eq7cBDAgAb4JPhUc=
X-Gm-Gg: AYBFou1Dckh21A2CQAaDP/bEPwhWw3az3Uz/84gqKHKO/69MZbvL+Q49nkPfwnGhiyg
	uLH+YoRPmM2NcYwryhb2te4e+UL0Fcfr5smbfHntx9JYpq4/s5VRufSiZt2u6MUakl3C2sH5iOh
	mc67eLyHiZnn9B2HuI4YMDILjaYU0B36TM6ODldD7u4qUwVbAfE7EMLg1KBhraRhl/KFqfi4KTR
	XtVUxXH/DXdb/3Mqq3fha7qJDuNyeiTEBtjNQUjW+GIJ1Cnid7A/196FyGleUV7VqufaIRxtrdR
	icoTAHy8hT8G3GSxTVTsp017GKEcd7+gPBkdJwAT4rXMlJAsobD/o2Ug7WsmthCxsnh8Mh/FApU
	8sij+bcoHAhomLRHbA1nG6IWFiFAjLEEzEn8aIPbnogjT58VGkZ0hjLNAVY4kG0heb3ULaV/Z3p
	92yBp2DyVIF/5mkyTart/NXaJNFVwib7KZWiHS2ofFky4YH6kpLJHZvBj7N9V54nOTnS4xxk1q4
	1XwSE75wQyt8JVdcaCxyzz+lg==
X-Received: by 2002:a05:622a:11cd:b0:530:27d9:ffc2 with SMTP id d75a77b69052e-530546cf80fmr94981561cf.5.1788557614529;
        Fri, 04 Sep 2026 14:33:34 -0700 (PDT)
Received: from X570.phub.net.cable.rogers.com ([2607:fea8:744f:d200:9441:f2ae:56aa:8a81])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53054227a0esm29646561cf.29.2026.09.04.14.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:33:34 -0700 (PDT)
From: Barzin Lotfabadi <barzin221@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Ryan Walklin <ryan@testtoast.com>,
	dri-devel@lists.freedesktop.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: allwinner: h616: add display engine and HDMI nodes
Date: Fri,  4 Sep 2026 17:33:28 -0400
Message-ID: <20260904213329.3910099-2-barzin221@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904213329.3910099-1-barzin221@gmail.com>
References: <20260904213329.3910099-1-barzin221@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_143336_140915_13C8E3A9 
X-CRM114-Status: GOOD (  15.32  )
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

The H616 and its variants (H618, H700, T507) carry a Display Engine 3.3
(DE33) block feeding a TCON TOP, a TV TCON and a DesignWare HDMI 2.0
transmitter with an Allwinner-specific PHY.  None of this is described in
the SoC .dtsi, so nothing probes and the HDMI port stays dark even though
the DE33 mixer support is present in the sun4i DRM driver.

Add the display pipeline:

  display-engine        - the DRM pipeline root
  bus@1000000           - DE33 bus, holding the display clock controller
                          and the mixer
  clock@8000            - display clock controller
  mixer@100000          - DE33 mixer 0
  tcon-top@6510000      - TCON TOP, muxing the mixer onto the TCONs
  lcd-controller@6515000 - TCON TV 0
  hdmi@6000000          - DesignWare HDMI TX controller v2.12a
  hdmi-phy@6010000      - Allwinner H616 HDMI PHY

All register addresses, clock indices and reset lines were read from the
vendor device tree shipped with the board and translated to the mainline
dt-bindings macros; the clock and reset numbering was verified identical
between the vendor and mainline CCU headers.

The mixer's three register regions are named "layers", "top" and
"display".  On DE33 the global control registers moved out of the mixer
block into separate windows, and the driver looks up the latter two by
name, so these names are load-bearing rather than decorative.

Everything is left disabled; boards opt in.


Signed-off-by: Barzin Lotfabadi <barzin221@gmail.com>
---
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 1598e8625..21aa94482 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -7,7 +7,10 @@
 #include <dt-bindings/clock/sun50i-h616-ccu.h>
 #include <dt-bindings/clock/sun50i-h6-r-ccu.h>
 #include <dt-bindings/clock/sun6i-rtc.h>
+#include <dt-bindings/clock/sun8i-de2.h>
+#include <dt-bindings/clock/sun8i-tcon-top.h>
 #include <dt-bindings/reset/sun50i-h616-ccu.h>
+#include <dt-bindings/reset/sun8i-de2.h>
 #include <dt-bindings/reset/sun50i-h6-r-ccu.h>
 #include <dt-bindings/thermal/thermal.h>
 
@@ -94,6 +97,12 @@ l2_cache: l2-cache {
 		};
 	};
 
+	de: display-engine {
+		compatible = "allwinner,sun50i-h6-display-engine";
+		allwinner,pipelines = <&mixer0>;
+		status = "disabled";
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -965,6 +974,188 @@ ohci3: usb@5311400 {
 			status = "disabled";
 		};
 
+		bus: bus@1000000 {
+			compatible = "allwinner,sun50i-h616-de33",
+				     "allwinner,sun50i-a64-de2";
+			reg = <0x1000000 0x400000>;
+			allwinner,sram = <&sram_c 1>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x1000000 0x400000>;
+
+			display_clocks: clock@8000 {
+				compatible = "allwinner,sun50i-h616-de33-clk";
+				reg = <0x8000 0x100>;
+				clocks = <&ccu CLK_DE>,
+					 <&ccu CLK_BUS_DE>;
+				clock-names = "mod", "bus";
+				resets = <&ccu RST_BUS_DE>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
+			mixer0: mixer@100000 {
+				compatible = "allwinner,sun50i-h616-de33-mixer-0";
+				reg = <0x100000 0x100000>,
+				      <0x8100 0x40>,
+				      <0x280000 0x20000>;
+				reg-names = "layers", "top", "display";
+				clocks = <&display_clocks CLK_BUS_MIXER0>,
+					 <&display_clocks CLK_MIXER0>;
+				clock-names = "bus", "mod";
+				resets = <&display_clocks RST_MIXER0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					mixer0_out: port@1 {
+						reg = <1>;
+
+						mixer0_out_tcon_top_mixer0: endpoint {
+							remote-endpoint = <&tcon_top_mixer0_in_mixer0>;
+						};
+					};
+				};
+			};
+		};
+
+		tcon_top: tcon-top@6510000 {
+			compatible = "allwinner,sun50i-h6-tcon-top";
+			reg = <0x6510000 0x1000>;
+			clocks = <&ccu CLK_BUS_TCON_TOP>,
+				 <&ccu CLK_TCON_TV0>;
+			clock-names = "bus", "tcon-tv0";
+			clock-output-names = "tcon-top-tv0";
+			resets = <&ccu RST_BUS_TCON_TOP>;
+			#clock-cells = <1>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_top_mixer0_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					tcon_top_mixer0_in_mixer0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&mixer0_out_tcon_top_mixer0>;
+					};
+				};
+
+				tcon_top_mixer0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					tcon_top_mixer0_out_tcon_tv: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&tcon_tv_in_tcon_top_mixer0>;
+					};
+				};
+
+				tcon_top_hdmi_in: port@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+
+					tcon_top_hdmi_in_tcon_tv: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_tv_out_tcon_top_hdmi>;
+					};
+				};
+
+				tcon_top_hdmi_out: port@5 {
+					reg = <5>;
+
+					tcon_top_hdmi_out_hdmi: endpoint {
+						remote-endpoint = <&hdmi_in_tcon_top>;
+					};
+				};
+			};
+		};
+
+		tcon_tv: lcd-controller@6515000 {
+			compatible = "allwinner,sun50i-h6-tcon-tv",
+				     "allwinner,sun8i-r40-tcon-tv";
+			reg = <0x6515000 0x1000>;
+			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON_TV0>,
+				 <&tcon_top CLK_TCON_TOP_TV0>;
+			clock-names = "ahb", "tcon-ch1";
+			resets = <&ccu RST_BUS_TCON_TV0>;
+			reset-names = "lcd";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_tv_in: port@0 {
+					reg = <0>;
+
+					tcon_tv_in_tcon_top_mixer0: endpoint {
+						remote-endpoint = <&tcon_top_mixer0_out_tcon_tv>;
+					};
+				};
+
+				tcon_tv_out: port@1 {
+					reg = <1>;
+
+					tcon_tv_out_tcon_top_hdmi: endpoint {
+						remote-endpoint = <&tcon_top_hdmi_in_tcon_tv>;
+					};
+				};
+			};
+		};
+
+		hdmi: hdmi@6000000 {
+			compatible = "allwinner,sun50i-h616-dw-hdmi",
+				     "allwinner,sun50i-h6-dw-hdmi";
+			reg = <0x6000000 0x10000>;
+			reg-io-width = <1>;
+			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_HDMI>,
+				 <&ccu CLK_HDMI_SLOW>,
+				 <&ccu CLK_HDMI>,
+				 <&ccu CLK_HDMI_CEC>;
+			clock-names = "iahb", "isfr", "tmds", "cec";
+			resets = <&ccu RST_BUS_HDMI_SUB>;
+			reset-names = "ctrl";
+			phys = <&hdmi_phy>;
+			phy-names = "phy";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				hdmi_in: port@0 {
+					reg = <0>;
+
+					hdmi_in_tcon_top: endpoint {
+						remote-endpoint = <&tcon_top_hdmi_out_hdmi>;
+					};
+				};
+
+				hdmi_out: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		hdmi_phy: hdmi-phy@6010000 {
+			compatible = "allwinner,sun50i-h616-hdmi-phy";
+			reg = <0x6010000 0x10000>;
+			clocks = <&ccu CLK_BUS_HDMI>,
+				 <&ccu CLK_HDMI_SLOW>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_HDMI>;
+			reset-names = "phy";
+			#phy-cells = <0>;
+		};
+
 		rtc: rtc@7000000 {
 			compatible = "allwinner,sun50i-h616-rtc";
 			reg = <0x07000000 0x400>;

-- 
2.51.0


