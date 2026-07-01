Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C336CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dujbRhMeiNyK8kLqgQiL31zEQA6WQpfWd+jTQhC83E=; b=aaVNY9elSAfhNJQ/k7JmZX6rPW
	wMxNsce7qx+QUWAYKxFHudNzj7N/XsKvPq5qIwdH6CJXDTUkj7740rCXkTbseM17fxY9Dhx7bI2Mf
	/atDArygB3Gc/0rfWtxJTJVB7TUnNsQYZHNIpttuw+r9OiMje1ITzOHphlcDmwYwcKAzityUI3gEP
	C/rDQRyUV7QQZ4c+qeL8+rZuu0ICPZy+dxbS3cujgdpFl6lUKNWhrvFMopPJ6jG7Bod0mOHOxU8oY
	JyIo81X0X1g1ShBl42GTGEQksMxZ9jelDlmkYFHKdEJ8WL9ORpkJr5hGyqWnD5AZ4/vaQMbPmx0ub
	IJ4nqs2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuFV-000000021UB-1KWO;
	Wed, 01 Jul 2026 12:41:05 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuFQ-000000021ME-03z4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 12:41:01 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-472326ca506so456244f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 05:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909658; x=1783514458; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3dujbRhMeiNyK8kLqgQiL31zEQA6WQpfWd+jTQhC83E=;
        b=eKRL6gbarPKfAM3EYm097h88C5bgngI3sw6Qsw6/Dihp5y0k1P3CnyfSMZ2fxXdTB2
         cVt53iYZjFVDYljUGL+cVwpSTODDv3Rlu7R2mD9NF449EtDyO/kgo9R2+IZbpG5Cet/S
         MWKUXBT5zRY3zxZ4l0StFwTESjFGD0IWq4L1izbH8ChdElnHiXOwdcgkTBhhhmliKP7p
         mZAE0EEXZRPZsNW47n/M2Yq3CFQRhmMLTDSwa227Xoe9Qug39TNw2d1J6t/B30rmd1OU
         wpNDnSKpcAwfnzjQXcHvfpAA88TmjD2OzsqSzRguegLDirIBr0xxhdw+0dtJd8gJOvwY
         nFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909658; x=1783514458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3dujbRhMeiNyK8kLqgQiL31zEQA6WQpfWd+jTQhC83E=;
        b=mEqsKlOCwUGz/THJdbJ2jPlOOCeCoEyjPR+c6ywwKfzSYc1DvqCQygoWxxb0wNYey0
         5BT1qS/k/6htxlhyac/16SkU9NQ3UHFc6TOyA8AvcyNnaN6S3+3rEkZzGW8fpGsCJyaf
         I4c0WayyD0jNRw5eAp6iFXIZ9VWpZY2bSrqTz0JNAjU89sXKCYDD634aCs/WQn1ZFoHN
         AqgzJlYfrfT1wWF7DYIdpn43/NJwGEFw4JY+Csn4C0HLbpremA+MB2b4Z2pQ7GWsVvGx
         FRS9OqD28zBk6BoJkCXhZdJTy3jWvBnvUEE/aSes3vGFLpcMlQzsaHJsK9lljwUW2JT8
         thjA==
X-Forwarded-Encrypted: i=1; AHgh+RoMmlwddPti2xZv36efl+gBlCe3b/W0KcKIaiSE/fyoifXIe/sRFe34T2WD/Tl1YygvIlcIAZjm+pzmBncyBeQq@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0tdQFVNQV1EsA7D2sG0nyU4C3I7llrqicOLxLLKNOq7D38nRg
	sJ1Wo/M6k15nnkM40V6VuuhNyZWgR9s/gBRYKc8U/8e8irwlRxW9QikYpFKHWtVFBXs=
X-Gm-Gg: AfdE7clWMpX2HO+z9IGnabrTqd/sCCe0KkKkOv5lXJXIZyE3QbKhH2M/SNddqPrM/zc
	jgHoGRtDPh4x5fiu6NHxjL2dwc1rdFPyBq0ua7txe7rebz/kmyydeasPm1ZLALfGXLzJ/UmQq/k
	Bnza2u2S457Wt2B9bm9g396HoQT/BVwyW/6uKBlCe8WujnJnYZHR0wgUdeeXhqeIclYHPdPqDPy
	jDZxhKjJtJA8+B8ObMDVNYvwxmSWbftptG1ktd/dC7YZrn7bxC3br3fXeN4JcpacSKIjmsel3FW
	TxshVTK//ewrcLIdXHzCk0jF2TKCzZv9m+3WeJp9VtDydANNKWbqAyf3fCIFMd6D/f8N1u5qVMY
	+eUDJCIA2D0o9phiG9O200HSM3R5L0pkTidRiph87po8UMtJelE4I+HbU21CTTWZSBEJDVHDIOm
	Ae3fHWYH3xiA==
X-Received: by 2002:a05:6000:4687:b0:475:e015:c2a with SMTP id ffacd0b85a97d-47757e57e6cmr1834835f8f.8.1782909658387;
        Wed, 01 Jul 2026 05:40:58 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-476792758aasm9625791f8f.11.2026.07.01.05.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:40:57 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:20 +0200
Subject: [PATCH v7 08/11] arm64: dts: ti: k3-am62p-ti-ipc-firmware: Move
 wkup reserved memory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-8-e9db8b16821a@baylibre.com>
References: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
In-Reply-To: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
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
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3910; i=msp@baylibre.com;
 h=from:subject:message-id; bh=4xo0fn2TK5jkPi/2917g98xkU+Bs/Sy82TdJFYV28F0=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixXrvXqwpH7ehcf/qivasnx8O7DphXLF7euW8/L+7Tq9
 IJNKXzJHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCRjUsYGabrp578P2cm0+Kk
 rTavo7Zv2T7v6jTzEzNCXfQS+9yMtj5iZPg/83jIeqZdjI/fZMyYxbfyfs375+tPL+AOUltovXn
 qik4OAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_054100_111479_11CBAE4A 
X-CRM114-Status: GOOD (  12.16  )
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
k3-am62p-ti-ipc-firmware.dtsi. These are all the same for the other
boards as well, so we can combine them here similar to what is already
done for the mcu_r5fss0_core0 memory regions.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi | 12 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi          | 12 ------------
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts              | 12 ------------
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi        | 12 ------------
 4 files changed, 12 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index 5d7f701420e2d8308b637f3064c560e485ed85f2..f77651109564224408723b72baba93e39a82be07 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -17,6 +17,18 @@ mcu_r5fss0_core0_memory_region: memory@9b900000 {
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
+		reg = <0x00 0x9c900000 0x00 0x01d08000>;
+		no-map;
+	};
 };
 
 &mailbox0_cluster0 {
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 8a5ff5c457579c7b1be7157d235fd4b4e5c6af11..49c78b6b8b2b43fe381c761823bbd93725f331aa 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -161,18 +161,6 @@ secure_ddr: optee@9e800000 {
 			reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
 			no-map;
 		};
-
-		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c800000 0x00 0x100000>;
-			no-map;
-		};
-
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01d08000>;
-			no-map;
-		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index 16549fd7340a556798cf5a242746c219d3168d83..6444aa0c106197eb44088ec99d7c7dba7f8f854d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -49,18 +49,6 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c800000 0x00 0x100000>;
-			no-map;
-		};
-
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01d08000>;
-			no-map;
-		};
-
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index 1408c970f1942e8a720c9cf071b2f49eafa9db5e..76295e47eca9d6373a89430355330c9a4ac9be32 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -63,18 +63,6 @@ rtos_ipc_memory_region: rtos-ipc-memory@9b500000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c800000 0x00 0x00100000>;
-			no-map;
-		};
-
-		wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01d08000>;
-			no-map;
-		};
-
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			no-map;

-- 
2.53.0


