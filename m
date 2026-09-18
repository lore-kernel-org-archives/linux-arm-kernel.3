Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D215DC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46OVOvm52EGzniG08o+lzXCszJzLBf6CXcWqmTIxVyA=; b=1Cc3WGXYRbGUx+Q/98nrO+vQQm
	d+fhTvPWRNtKKF5awlQEiTgcwSm8odpymwLSgnpfjr3g6xDzOxo5eC8AfjhvOn5SPW6kOZ+IsBGGL
	BmHqImX28k9W1gtVSv5vreXBPSs2+M9eij2VPphsSnV6N7/+7cJcVSSVZM2NSseSNP8NproPRsWWi
	VlvFPWNR7J6tkbSqtMDy7P3o4iqpQHwoJYk1/reryd/6hVjN+nRtF+FWpAsjdGz7x9jyKdm16tgy5
	KdmEnZh2K1SeEuccXVRGA/9ccFmQdtPxNVT+Vf1HMT4rh5uNNrOe7wbBiULX5s/FQbohvC7wGlP6M
	SwTlBGNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Uke-0000000DvPi-1Vj7;
	Fri, 18 Sep 2026 09:19:24 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UkS-0000000DvFe-3eSU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:19:14 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so2695425e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 02:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723151; x=1790327951; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=46OVOvm52EGzniG08o+lzXCszJzLBf6CXcWqmTIxVyA=;
        b=ixfnUGKVI+7ZWmpIOPxXVjTWtS2S6ZHnygN4BPopkcRSiK2YduBmxgnbKR27AZI0kT
         +xaj9n73N+2tiMEktfz0ea694tegJgCuyyxmQVbWkEx7qq/EVTp9/9OqE4Z9Ry5L+Bq0
         lZtiWwzss/9aFOhUdNvrWMWLXhaGHJopHjun4Ut62yUuDeFmn4lJru9XuZvMNhZHUHUK
         O4iYT1zAQIaAm6zRfVq5viwOtRrwT8szC3E/chV15t9kkEKQvw0u4LUdRmg7jik8McmG
         K81uuLV8kOp2ZOuMrWpNhiW6xcI1yhwCLPfx19S7rveoOAvDTAp2ztvMsmAnkqAl5ia0
         w4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723151; x=1790327951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=46OVOvm52EGzniG08o+lzXCszJzLBf6CXcWqmTIxVyA=;
        b=XVh26PEgDrNoiWKGHVw+d8LfRMkyAlCI9N8rWCHyuRa/VMceNqq1CocrhTaDl7DQ8C
         2XX8EfL3OeQ9JsKS3b64u7GaOncrmot0b2Jbz05u452vWWGgZW2rnTpVyXdV9R7cjISa
         8hS9Z9xK+qGKLACK7WGX1ZWuQyEpMVUrIHu1h2/OmGMFbRw+nFNgFSb8DLuONMI2udCp
         kZWCz8kGFKnYOtt2xF1DxJjw1ZdDgjWyqFg/GOlddgELdoq7hOLjUMpiwZWiLJLVEKJR
         nh5QefzHgZrQCAaJ410bZB/9+OPln9+Vy/X4KIF9T0p2ZnMTSsVkOZg1C1f7ECPsYL+i
         XtXw==
X-Forwarded-Encrypted: i=1; AKwUvBwtaHY5plceSm4laAuGw/nLjbUprOoMducTJSbdqyFW41FrtYN9daRdPGYqZDxG6j40RfnaFc7qEwlKeXnTnq6z@lists.infradead.org
X-Gm-Message-State: AFuF++kEPgfNmrs+DE6NjG2Kjss56FhnA6x9Z7cnBChvP8/h0EYgIP3O
	JD6xbVlMYwGRI1ySgwzuDqg0jMga8+Ae/iAw9V/v/kpHnGzPPn9+jSMo3Lb7E1TgXVI=
X-Gm-Gg: AYBFou1sH090sHLpDRXZ4ZTEzaSUBmHYNIbUeDGHEa2OIhjlbPZEkPDv+t+p8rud8oA
	JVAnKDH4y1o4sJzQ8f3A9/OUxbrMPz68U427Kh/PkOYKZ7mhIjCQAiC8KVgXt+7tvo2tL7Gf5Gm
	nYzjiHewAVBhvl9priJRHm//2ZsLNqRqWHW3PYZQIcZydiBWOh1UMtcKpH+oqSuLyWyirz0yG8k
	YjRqnXuN+GdNVk+FxrXDD4wvN52DLloalQbDZiQJC2NSfzJR8pgygfVygP0mvWe2Ca5tv9ZvI4R
	CpySini/hTWjVE9ttJ3OsANypgbXxHXHvolQbO63lKIKjR769YKnNb15BgZPz54K9r5vi/m0r4U
	jo4uQg9lOh9c8KkQ//s4YpkJxNCU0AvDuUHyB723pDK/NsOU6OJDQPl86oeLhvPIPgGmkvL3QYK
	bB3R+p4GBgm4jtIkBB0MritRVqhe7YzKmUjNVE3l18MBLdSDyjYBUknEQOMwzNVLAZZm0=
X-Received: by 2002:a05:600c:a0a:b0:49e:84bf:6110 with SMTP id 5b1f17b1804b1-49fc56dbb49mr23707885e9.6.1789723151224;
        Fri, 18 Sep 2026 02:19:11 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd23ac75sm141690505e9.13.2026.09.18.02.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:19:10 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 11:17:53 +0200
Subject: [PATCH v9 9/9] arm64: dts: ti: Add wkup R5F nodes to pre-ram
 bootphase
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-9-40972ef1f663@baylibre.com>
References: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
In-Reply-To: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5163; i=msp@baylibre.com;
 h=from:subject:message-id; bh=JMttWZLJBxNJg22BrePdNzNZmWTgkc5WUsraEC2+rhQ=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jK82L3y4Me74v9D7pxcVs69t52vj02hK7FDhyDq/p
 qJq972ajlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZjIiq0M/4NOCW3h0743xVih
 eveOJX8PuvzfWuI1dV9u5peSJX8yOA4xMhy0WR8fcuyoYESsstkRx6j/XGkXuX5q/Hcx37xt63I
 LVyYA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_021912_957429_F6FA7439 
X-CRM114-Status: GOOD (  13.42  )
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

For IO+DDR the wkup_r5fss0_core0 and the
wkup_r5fss0_core0_lpm_metadata_region need to be accessed before RAM
setup is done. These are used to read the lpm metadata region in
which data is stored to resume. This needs to be done before RAM is
in use to avoid overwriting data.

Add the bootph-pre-ram flag to the wkup_r5fss0_core0 node in both
ipc-firmware dtsi files and to the lpm metadata region nodes of the
AM62A and AM62P boards.

The board level bootph-pre-ram flag of k3-am62d2-evm.dts becomes
redundant with the dtsi-wide flag and is dropped.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi     | 1 +
 arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi | 1 +
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts              | 1 +
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts             | 4 ----
 arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi | 1 +
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi          | 1 +
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts              | 1 +
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi        | 1 +
 8 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index 7fa19ced1a23..12be777a35ca 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -80,6 +80,7 @@ wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
 		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
+			bootph-pre-ram;
 			no-map;
 		};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
index 94c1d60d8d7a..7beca54e75ee 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
@@ -63,6 +63,7 @@ &wkup_r5fss0 {
 };
 
 &wkup_r5fss0_core0 {
+	bootph-pre-ram;
 	mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
 			<&wkup_r5fss0_core0_ipc_region>,
diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 871ec227def9..fe75f6b6b50b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -74,6 +74,7 @@ wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
 		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
+			bootph-pre-ram;
 			no-map;
 		};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index 7cba3ff99e6a..f87d6d515e2b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -800,10 +800,6 @@ partition@3fc0000 {
 	};
 };
 
-&wkup_r5fss0_core0 {
-	bootph-pre-ram;
-};
-
 &mcu_r5fss0_core0 {
 	firmware-name = "am62d-mcu-r5f0_0-fw";
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index 84dfbfd1986c..277d7e268cfe 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -42,6 +42,7 @@ &wkup_r5fss0 {
 };
 
 &wkup_r5fss0_core0 {
+	bootph-pre-ram;
 	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
 			<&wkup_r5fss0_core0_ipc_region>,
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 45ab9d947b3a..62a518dbbdbe 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -183,6 +183,7 @@ wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
 		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
+			bootph-pre-ram;
 			no-map;
 		};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index bb027c65eddd..39af098e4db2 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -70,6 +70,7 @@ wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
 		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
+			bootph-pre-ram;
 			no-map;
 		};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index 31f670fdd91d..2eefbd8d47a4 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -84,6 +84,7 @@ wkup_r5fss0_core0_lpm_fs_stub_region: r5f-memory@9ca00000 {
 		wkup_r5fss0_core0_lpm_metadata_region: r5f-memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
+			bootph-pre-ram;
 			no-map;
 		};
 

-- 
2.55.0


