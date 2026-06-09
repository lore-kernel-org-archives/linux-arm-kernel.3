Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6672FCD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 18:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vMM7Dpw28MiXIgCohTOe5dYzbZ0DClw94YJQlMLEgg=; b=OCkTDtDO60c81wD+QsBLjpyXbz
	ikiVfUr8nrjQ4/fw8ZSNOKUSeSLL6n+JP5SPg+h7obDNaVsc4/gjuNtNDkhJa9FT8zBItdJffu8xY
	R9eTC1v4JOVaSNtGdMn1irBlc3Z2i/gsilBdXitkR8dCH8bEfwYfe6p1sZqi62EF4IIDyKsbwJsDq
	Zn2joOnEva4StGjiTkzN8MR93W49qCf2M2zVLYNU+eVY+i8NoUDuFJfkp7iRrCES+R3TnlYULtcjR
	7MYEsiGHtKUW5MWvM62HrntvoVwrwdyOvyNMbDSi6h4+1L41OjiBfIw0LZXIpvugPXQqaJx9GYPv/
	4CJShWpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1eC-00000006EPk-3Kgo;
	Tue, 09 Jun 2026 18:58:00 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1e9-00000006ELB-16x3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 18:57:58 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-490afc47455so31393145e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 11:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781031475; x=1781636275; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4vMM7Dpw28MiXIgCohTOe5dYzbZ0DClw94YJQlMLEgg=;
        b=BUpvXIYiJvUE7iISbKUUwAjZcbj4uG0BsdsEP4FVc9MtXAZDQzgJCmo3QAO2QfY567
         QaKIWcK2+iB7soJFCxuyKcT5d1Fi/l89WPxpvHqPut4HXiJLW9DEpS+qj2in31IrAhNX
         ZV9m9UbjTPlReFVMxYqieSzUJHAMQ/XqOrTu3HRa6QEaf1a4ekCfEuadbC99627ccT8L
         IjO5AeAZSTiPiCeb5JlvZbZ8Qe0Fx7g/PF8tToMCwxHB9HM4HeCHu39Mp5a/jNA+yem0
         xVkQw2hLtIraFYS55Ls3z8Ka9Cgx0+8BiE6WorqmQ/8MdOWokbEMTyC/LYvPVf+dmO13
         weAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031475; x=1781636275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4vMM7Dpw28MiXIgCohTOe5dYzbZ0DClw94YJQlMLEgg=;
        b=RgnbQA1gKj6THcsudO3siIZVGZPnpo87h0NjVEB7Iwx6RGYHORqi9NPpBY4dkwafsV
         AzfNRqGeXVaelGCz11IySKQ7tWXV4Cat49dIXJzBn5Bw4Ra6NmouMu8ptFvhMsiNH8qO
         /YjV0gvBDnyu/IId+BRuwA41DgxrM0gSGhBwU23aVqPf7g8qz+PJj32y2GDlhBHrMC1B
         m5Zy5uMOi004tB/PD1n3OyzUXZyCqz5blz2TL5NgN27LOz8BcsHbkTd2kW9I4j1PfL59
         xpGSk6UkkYhLcmpfgLtG7/G7j8dpcfIKm1eD7tFDeG7qq3kT4LZhsD/KNU8cypYhBhAk
         /Izg==
X-Forwarded-Encrypted: i=1; AFNElJ/hcQkcSwxyFTuGRngIoph95FcHJtM5p1JfoK/+Vb9ah+mdEBxnyN9pa51Daik0lpl+bJIXkcbd/k4KmFRFpuSj@lists.infradead.org
X-Gm-Message-State: AOJu0YwYR8NzUPAuMG3JH1hQZAIFnpLW8141rdav9P+D0sfY6xEY8Tpj
	iUko//+dpSyzHsdnYbA9zP7JsngIxHLGj5s9vtPhNUFlP1vtX/0perF9xNRD9KIojqQ=
X-Gm-Gg: Acq92OF8UkfbcJWtMdhXPRi2ifJp3iPNKXVIL4nG111V0/Xq7cvYfD1gUPFOM3RvKKV
	yGMB6Z1x2NwKphskvkiBUl/7wsiNajxmTWp7LXOxi2gNAE7HWkcLKeNWoyPggkSqkkh0QZxLEcO
	cIIVbRTROhOWqz8V216aYAdXER0D/EVhNnYocmFCrgeU2EscYFgXklqcawBCE0ELNgix/gyS3Lw
	Ocuq7sEyRa9ejH+iia6xRhyF027E3K2gTOQev9kquxp46426h6x8WnELCRnxLKTmI2CduS1LLrT
	cjUg9Z9SwQdpJR8wwSP4yFY5u3JUISwrEbhkryr/cYHsAd6/3dacT7+Tc6q+/qa3SIFCfxVbvzD
	S2RUQfyf1wA90Nml9TXmwpjiB3qiqLvtscGvmRVCpJ2UNa1sy6wugPtfppuAuvx5Hb3RbQG2wNJ
	Pj0DqUZFB5lQpJk3dYt4SemR/je0fEIL27i6GhXFBOJg==
X-Received: by 2002:a05:600c:444f:b0:490:d354:bd01 with SMTP id 5b1f17b1804b1-490d722db58mr49827795e9.26.1781031475289;
        Tue, 09 Jun 2026 11:57:55 -0700 (PDT)
Received: from localhost ([2001:4091:a245:857c:bd97:47c2:83e4:8d45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f5612sm62772292f8f.15.2026.06.09.11.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:57:54 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 09 Jun 2026 20:56:19 +0200
Subject: [PATCH v6 07/11] arm64: dts: ti: k3-am62a-ti-ipc-firmware: Move
 wkup reserved memory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-topic-am62a-ioddr-dt-v6-19-v6-7-16afba97fbe0@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4480; i=msp@baylibre.com;
 h=from:subject:message-id; bh=mdp5N6pQOfilMfK/PUMGUhkxAL6EJ1ef+4CRwr1AwlA=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhiyNJOZHv2Lv/BWK/CUgcDicV03nnk2w29PNMQeci5UbQ
 x/dFpfvKGVhEONikBVTZOlMDE37L7/zWPKiZZth5rAygQxh4OIUgInomjP8lcv/w1fNJn74k+2V
 ZsNdns5vFO0VLgu45jI+KWYujpqzjOF/yu99+z1sDWb5HLpQpvml8GCP6TTxjMfCX4VUTmuwZZ3
 mBQA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_115757_414925_1220C289 
X-CRM114-Status: GOOD (  13.08  )
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
index e13da7c95a30459e7649f284689039b89a95f651..228ffa4be4be7b32e43a06d807d3fee073d203dc 100644
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
-			reg = <0x00 0x9c900000 0x00 0x01d00000>;
-			no-map;
-		};
-
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			alignment = <0x1000>;
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
index 06d4e815b1670beafb8852b76a3f6a79295ce8ca..682b1c9f3071ddf23044c1fde1e88f2b901ec64c 100644
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
+		reg = <0x00 0x9c900000 0x00 0x01d00000>;
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
index 63a4fb03dc0acac63bc573e290ec613617f492f0..8dda657f854cc4456c38dae812f9e00646c6c0d0 100644
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
-			reg = <0x00 0x9c900000 0x00 0x01d00000>;
-			no-map;
-		};
-
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			alignment = <0x1000>;
diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index 463a3f6130b8f2927a032137e87c01df446cffda..dd6937789a9c6b7c92ef5ad1fcc3ae94a90e2353 100644
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
-			reg = <0x00 0x9c900000 0x00 0x01d00000>;
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


