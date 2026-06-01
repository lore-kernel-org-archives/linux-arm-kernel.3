Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFCCCD6E4C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 08:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivoUdfOE8Ta2RbgeRzZsz/bf48Yn0D8i5te5bRdSAV8=; b=WHlIZik8hPU04oiFLzx5Ug5Re/
	GaELHTsHTLejlLW87s8PK8Undi5rPUfR9uFMz4ggFBV2PiqBtdyf2Bjcnld63E+B0mv7X9UZA9Qzp
	e9RvCtM/9ZniapJj0gQ7zDcVvOrifGFlPu0xzq7cNebhqLEaLPlw9Sc27ziDsfF0FbbaW7Z5qhswr
	KOrFAHcimtKBzgdgzTSvTqHwUCKJlzHLxgdf7G/qPdibcJBRX27FiGW6MiQq+Q24ymoBbO0CdA8M6
	ZgcyCnqQviozKjIFhYMBvsZhQs/e7hsgEteMLbAVS3eoOIkU6+r7cxtWrB+QEYGQfn5Xobmx8IFTr
	kYXOGMNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyIW-0000000AP8S-3t9F;
	Mon, 01 Jun 2026 08:47:00 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyIT-0000000AP6r-41kF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 08:46:59 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49068493267so53739595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 01:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780303616; x=1780908416; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ivoUdfOE8Ta2RbgeRzZsz/bf48Yn0D8i5te5bRdSAV8=;
        b=K3dUyzwtBOAtzfqsdsyhBlN2DahRuNhojRz5ODAXUswMdDNzbFDJelSoJoH0Ce5eAj
         H5+4hUVruMJmsCvbEXTFQIul1mrt37uXLWPrgE9Sy3uNRDa2f/borzKg+lj9uraLAl6a
         h6h+TxjeJ09blu1ucvasXsr0YU5T44TaKKXZOaSUkuskqUcVUYJpM5cr9mRYf/4pVfyA
         qWeTHnP3VEfl3D7NiJIX1buogZsY1CG75or2LqF2gBga4TMC8NdRIz2vlMlCTZ4SemAC
         IJ1fD3GWlW5V9+gxaA/aSp9pmkQD0t85+yfIVPi8jb6X36Kuu5U85FA2J+6o4xwimoL8
         Ck7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303616; x=1780908416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ivoUdfOE8Ta2RbgeRzZsz/bf48Yn0D8i5te5bRdSAV8=;
        b=HwQrtEVIwQSA2ApcYc94WbqE2d5rjjq0uoHehV+BkVeC7qe8ehOGjelYI0KU97PzQQ
         4PDsoMfRt7/VukTL9NrRSyvQYUiaftCb+bGxni6zJFNv38vXfqft24SXrzKtl1Rvqss/
         jt9aSVhVCfdm76yc7yOk3VX+HdqxgjijkP7jFoqd8OwSN7WylVycggirPOyYFAUIGLEH
         R6qI/DRf9UAQrTjXoi3gS0jsDN23nTpiu+Vo3vmXRyBuZp5FQfxtClgHwozVkphgVVld
         76IRqzqzS8Fs4duHRakfZDCqmliUuJOf12vjC2NQTklF9g0qXaXVb2q5CtV67t1hZ++f
         uagA==
X-Forwarded-Encrypted: i=1; AFNElJ+J75XlgUEZTNkZJGq+sMSn7MgkeudpeX3VbplfbnmqVziZbr+VgtTCdEBT58mz+BYEVJ/xQK+djff497sWPR3V@lists.infradead.org
X-Gm-Message-State: AOJu0YzssYyTCRZE7GtoUhLdI67w5TrTUVhCttP+eMJDQH0ivvEE8k4b
	x/wu/2RD6C6K7sjTAcoZnKMvEg48jbeYyPfd1YM7kOBmun8iHTftVQOA4sukDEFLYWW3ZDHZHJh
	90QE9
X-Gm-Gg: Acq92OEWy/kFohkXgSPUq+a3JRbnSCnXulntgfwfO1F1VfGwGFd2XooHfZ7kLoNLCOQ
	6UhPatYoPugJj//KF+Slk4wrRKbrW0m5IQxqiNo+DuCtfnYK08fBf0pEQffjYjd8wImEaJJSc8H
	amAlq4Z23MXD5NliZd3ZdLDuKbI9jtHyxFo8MTMlQqmxSRIziLYRpoGIVN3agEF9oSWKdvHYXNE
	Ht5LS3YqMTzW3S70bhdZbjej7c82Ab2wNAJAgV8EhDgx7xoHNtusOUSNMH667+C1QKlRB9JzjW5
	GZWj3+5Busli5d8m6+RVIhSJqdr/YNYQk/a42eZalUR/9oGQA6LtTYYfBzYZWWvl1nylVpSesdx
	EjqWabD1ZX0rslxA1Acf75/wuj2fThWvjR+GV3rI12JjLidCNKqqvBE5mK5PhCeh3y9gaZdjr8j
	Sd79y/Vlp+pBLWNVjHEoKuB+QdxelEBpQhmWNTy1TTuA==
X-Received: by 2002:a05:600c:828c:b0:490:ade0:6129 with SMTP id 5b1f17b1804b1-490ade061c8mr19542475e9.33.1780303616006;
        Mon, 01 Jun 2026 01:46:56 -0700 (PDT)
Received: from localhost ([2001:4091:a246:8595:a745:3210:d732:4094])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909dff2a80sm271291435e9.3.2026.06.01.01.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:46:55 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Mon, 01 Jun 2026 10:46:12 +0200
Subject: [PATCH v5 1/5] arm64: dts: ti: k3-am62a-ti-ipc-firmware: Move wkup
 reserved memory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-topic-am62a-ioddr-dt-v6-19-v5-1-3856a023aff2@baylibre.com>
References: <20260601-topic-am62a-ioddr-dt-v6-19-v5-0-3856a023aff2@baylibre.com>
In-Reply-To: <20260601-topic-am62a-ioddr-dt-v6-19-v5-0-3856a023aff2@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4472; i=msp@baylibre.com;
 h=from:subject:message-id; bh=+gnqMdF6sQvdDRSsLkFmNOCWP1iFQjEJ5t3wReQzdXM=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixZt3sbIng/W9/4Ih/28Ma+RflSFVVV61hby7Z89dKcp
 3tuo5x2RykLgxgXg6yYIktnYmjaf/mdx5IXLdsMM4eVCWQIAxenAExkyl+G/45Vj/VTL278Md3y
 /yux0jnMF6o2tL6Zf7RLcgFfrtgHpp8Mv5jm3b99xfmiqALb27nr7ym7eFfIVy9LvbKbk6FcRuW
 RATcA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_014658_027679_EB1FFA69 
X-CRM114-Status: GOOD (  13.52  )
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

Move the reserved memory regions used for wkup_r5fss0_core0 to the
k3-am62a-ti-ipc-firmware.dtsi. These are all the same for the other
boards as well, so we can combine them here similar to what is already
done for the mcu_r5fss0_core0 memory regions.

It also moves the bootph-pre-ram flags from k3-am62d2-evm.dts into the
firmware dtsi so that all boards inherit them.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi     | 12 ------------
 arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts              | 12 ------------
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts             | 17 -----------------
 4 files changed, 14 insertions(+), 41 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index de4048a3564bcac9558f88c94381f07db30d4f99..228ffa4be4be7b32e43a06d807d3fee073d203dc 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -59,18 +59,6 @@ linux,cma {
 			linux,cma-default;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c800000 0x00 0x100000>;
-			no-map;
-		};
-
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
-			no-map;
-		};
-
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			alignment = <0x1000>;
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
index 06d4e815b1670beafb8852b76a3f6a79295ce8ca..dceaee6ac57b01a280e891f70587a679f5b732a6 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
@@ -29,6 +29,19 @@ mcu_r5fss0_core0_memory_region: memory@9b900000 {
 		reg = <0x00 0x9b900000 0x00 0xf00000>;
 		no-map;
 	};
+
+	wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9c800000 0x00 0x100000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9c900000 0x00 0xf00000>;
+		no-map;
+		bootph-pre-ram;
+	};
 };
 
 &mailbox0_cluster0 {
@@ -67,6 +80,7 @@ &wkup_r5fss0_core0 {
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
 			<&wkup_r5fss0_core0_memory_region>;
 	memory-region-names = "dma", "firmware";
+	bootph-pre-ram;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index c1e9067b3bdd5ab0591541d4685bb17a5dac4f65..8dda657f854cc4456c38dae812f9e00646c6c0d0 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -53,18 +53,6 @@ linux,cma {
 			linux,cma-default;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c800000 0x00 0x100000>;
-			no-map;
-		};
-
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
-			no-map;
-		};
-
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			alignment = <0x1000>;
diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index f5ceb6a1b5debabf1ead67eea634b48db1540186..dd6937789a9c6b7c92ef5ad1fcc3ae94a90e2353 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -59,19 +59,6 @@ secure_tfa_ddr: tfa@80000000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c800000 0x00 0x100000>;
-			no-map;
-		};
-
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
-			no-map;
-			bootph-pre-ram;
-		};
-
 		secure_ddr: optee@9e800000 {
 			reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
 			no-map;
@@ -776,10 +763,6 @@ partition@3fc0000 {
 	};
 };
 
-&wkup_r5fss0_core0 {
-	bootph-pre-ram;
-};
-
 &mcu_r5fss0_core0 {
 	firmware-name = "am62d-mcu-r5f0_0-fw";
 };

-- 
2.53.0


