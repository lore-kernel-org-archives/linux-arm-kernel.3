Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5852CD98C9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 18:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dujbRhMeiNyK8kLqgQiL31zEQA6WQpfWd+jTQhC83E=; b=Bzpfvue9dWYGz17/WLgEvjaSbm
	jN1eL/G0gIyzaiKB5DjJ8yzgMJ9IKkruZhSBCbH87SMKTyOkTdxY8ywole8kFhXvmwlbsKZjEIn2b
	GhYVOIxcuHB9GuUzdbfBtPluPURjjiR1UK7ve1BxdxTtBQy/3hfCei2syCvkCOg27DtrexQHdC5iQ
	B4onsoKRgGFY3FBvkPqk4lAhhWN1qV3aWqzzfJgdxcdiVLGBiukRMOlDUiAqrXOGJfPDfX34OGgws
	sFK+mBeP8mMxeDwDJ13FG6lM3ixaExDutZuCpwIHrXgLinyLjVL9NzFLjm3xkKJ8tCGvRtNfE4KNf
	uyXxUe6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1eL-00000006EX0-07hF;
	Tue, 09 Jun 2026 18:58:09 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1eA-00000006ELd-2UVm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 18:57:59 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-45eedc94d37so3016934f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 11:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031477; x=1781636277; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3dujbRhMeiNyK8kLqgQiL31zEQA6WQpfWd+jTQhC83E=;
        b=MNH4vwHSlmzt4vdVDpbCsbX11EJJUmR/en+zEr2iIxklyQPAI1JuIYoPUQX8Rylt9E
         JHIH/OuzARPwSTfQnUP7YNpg5hxBLav+KUMyKXXFDXpGZG6L3FKE+VrXVHbNNcX+te/R
         FSSE5uzgW+Ck5g2SeRlxch5BO+ubn/iqAkFwssweM65YiGbxunIKS2G5UMTqBYcq7rgv
         nxNGxgiMbjixMwtVPCv/ZFlnUQnjCiZfegJu4EDV6scnT6eVLtzAWxcjtsqLBPuDwdex
         xEkfxflFD29ESde8OxtvaPmctj8OWHDSskn7I1ynGQ/g/Kqi1bpA2kb3nR+ccdGn9bWz
         zLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031477; x=1781636277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3dujbRhMeiNyK8kLqgQiL31zEQA6WQpfWd+jTQhC83E=;
        b=mC0dlc4vjV4ndYlCrwDUREvIql6djQ5O4Ec1C+vgcomrz7QkLDwsD3nUEVhjyi3Nkh
         WhsCPp6iwye/VTqIS6tl7kzdVweYigotkp6j7kjqFXOBp86jRnNSqe+Xw8tDcOeq1Nja
         6aBCFIdJUc9qGrEi2sVObbPRMZBjU8Qhdqbym0QLhz288lTCyoMifORZZowODCYksjVR
         WeBeYDhqAyCzjLIv42OlKkM49caGNBsIp0KuDGdT4ovCKQkizuNia7++ziLV5VD4ZJo2
         xpSmWaMm84NKDmbFj9VckvWPPKx+2fWNrTZItUt9biEqb2IK8eYEubg2EsgqSngvvCZa
         U3Yg==
X-Forwarded-Encrypted: i=1; AFNElJ85wkFEiQDjbUeYfrggDHDaPXz4jk02xdvXEFTX5b9MUIBlGVU+k4j/qM5uo4vVjBRMtWONR92ws0n5jkZAOvLV@lists.infradead.org
X-Gm-Message-State: AOJu0Ywkm275zUiYr6urV7Qi6+C0NIFJ/2ryuhe+0wzSPp94BwriNCe+
	xEg7OMG2m7C/lrjfwlv1WtjtyT/EV1yMpkCIE5ELcRc1RPJzc+UNv4my9mqSR1HeHwo=
X-Gm-Gg: Acq92OEzuAGCvcJ10PLkHnYyNSkn8uMqD4uA4jd52YmrymzHwpncSW35MlnOr3yyXrj
	FTgsRjggtMIGB0wn9tPRN4O9mRCu2Dcd2Iq1AodYy6qfOhznUEKSWEaM00BHnOP+ZMVgDzwClmr
	rFCvdpmdt95RM5Om1wp8ehKgozWh6aXVKhxiLlHePuimPdK16t+/KBvJLiNsNwn05ZHNEWh1gah
	mVssD3e/L5VyEGa9pBswvUaXNOKrZXktRW/slrPU69GG9SUbckqH2GIKw4dYBwfPSlzbVrqIIzG
	oCwT542r0DRYPOVMwIVC9olm6IeMrvSgiZwn+/kUFpx4Zmh1wCuCmThPyQ+YsmeFrHAEF26Vcyr
	62E4xA8/32zVtQAWXybjUcNqv38H1O2QkSpZZBD+AAttTEpge6MVwnXUsIxe52zGQntP6mYH8zA
	ZyWMV+XIeRVuIter1uYKUJ51IeZfykzhA=
X-Received: by 2002:a05:6000:2889:b0:45e:f765:ff9 with SMTP id ffacd0b85a97d-460566bef00mr5308637f8f.24.1781031476604;
        Tue, 09 Jun 2026 11:57:56 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35eae5sm65167368f8f.33.2026.06.09.11.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:57:56 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 09 Jun 2026 20:56:20 +0200
Subject: [PATCH v6 08/11] arm64: dts: ti: k3-am62p-ti-ipc-firmware: Move
 wkup reserved memory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-8-16afba97fbe0@baylibre.com>
References: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
In-Reply-To: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
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
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNJK611UFRM0x/bFNb+lb7EWeUXvok/sYN24//Cxben
 nT42aujHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjARvvmMDD/lH5yOLgmR9V8o
 pPXCMOfNiveOhi/EQwuaWnUlG/Msahn+6f9p5QlwkJXh3XP9YIdL2gsx06ByMQOdT4zCu71XpOt
 wAwA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_115758_700063_9AC8BFD6 
X-CRM114-Status: GOOD (  11.67  )
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


