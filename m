Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B7FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 15:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rLSqKzoS0MDBgH85oxBP3pDE47WSrruOac4uchD3dFY=; b=jbZ0udfp1UuhKAugWldmfHT3Lc
	9HjMzhbXsFs3w1n1CNGTezqZ0QEjpLplaL2b7/vjf7n/gS/FpvhE2+P1l8acsYTsPRXZGuakgKgH8
	t8JSOMC2qPFe/2CqaGVr6f5TKb+m5rs1Wyey5Cs/fXTLB8/C1pA9sw0m3MXU0pU2K1mhMwYmrqZmk
	IAw5uIxxCv0EsAIV1d24uSkVx/FMXsPcOgIDFpwhoOUe4uN121slMv3dFb8VyDMWyzvu05F/cg3SH
	asHSSglt3mjbr9A5IznAl4BVwtuyL1rEAOE59MjokMGylSwizxiQc9IzmQN7esmq2NI542Ye0JnbJ
	ktv8zZWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuFS-000000021QW-046K;
	Wed, 01 Jul 2026 12:41:02 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuFP-000000021LR-08Ip
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 12:41:00 +0000
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4763b0c1dcdso723794f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 05:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909657; x=1783514457; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rLSqKzoS0MDBgH85oxBP3pDE47WSrruOac4uchD3dFY=;
        b=NBJeHvd+o0588Nx6CtWctSUwiKWN80oKtZUN5X4HFOWa2GxZV7+suOvod/yIczq8Gu
         AZFLAexIhicrqlmo4WuwnEQ51Yb4aBie+Sh/E3CLeAhppWFSLlHLyDqeld5hNwPprcfb
         8PLCx/kRWUEBgXQDu459bmpaMkM66pY20Gc4vAR6twkUoJEVo8TpPwxJ74QvV3Jzwyn1
         J4n/xKWf5EbP7QGTBsT6BgYOUKpY8WVcVdh2VEUgTC6ONuu7S3gzJCeruCWuwGBiQfR7
         dabyK51PtrtRynaJLxMGOKxc/pYu77MxP6sQaYkldMnFMJcxz97bhQsNA/rFCQOKMth9
         gYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909657; x=1783514457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rLSqKzoS0MDBgH85oxBP3pDE47WSrruOac4uchD3dFY=;
        b=i3F7XVTUwDgAsjO0/23Hgnu9XogFxCZIjVLnhgJtXr8JdshYOSXbOCdPEI8uADV/Ox
         Mp+QTCRi8gA3rZqS7Y7YMNDP80wMYck+3d4uMsGHTqfU8ASVHpnbqLdn8lWcTAziHxmv
         tXcTYk9zQzbPURTKaDswSC0DJxCxz5ZHM6/QQPENLiNRIQ3+vfL7SebiipIx6+Kyz87w
         7+3uBh0TDG69aZjuAizJh4OUgdrWSciMFjVsu/DKrbcDEnr19Z7+P1MDkOnIzDmhxSeH
         raM6DWyTUrt0FUMRLkJ2zl/oa4a3YrE4O0lkGiD5UaTBD5sA6xX4fIJvg/gKdwI+h/+b
         pkhw==
X-Forwarded-Encrypted: i=1; AHgh+Rpy0JO4+zZPDEB3a7Re/LpnxrS9KxE7LwGjYEYqWExUEcFfdN7FG29SQKRbePAHRhvsOdA2/yZu+kKLnis3hRu9@lists.infradead.org
X-Gm-Message-State: AOJu0YzC/3UOwmDU+w3f+HlATNBP7mTlEctQ5th3YFnqeUlR/N4snIdr
	21iqxfXgGPijDlsBYr4btMCrbMq4YSXxlawdX+hwxgIarKQxC5kQ65xcCsHo2aAsiEo=
X-Gm-Gg: AfdE7clgFheoXhql0qzeyjm37o1BdvEtbPp4+8ALLHLCrYPvxg3DrQb1n8p8zIfCtyo
	KldafKpYtcYRnICiBg8m+zv5P3gPS26iByDPFGXZdjTQr0ArF0HRCj/7Nsk1Ig5LyFdkX+MognZ
	VJswtMXkk3dWPx4GXjjZtC39BZC0WjbNkCQ5k09fHw/ELWjm9Dlu417SX9IGzapVk1EHBnq/+i+
	QgoOIC8Qg2iQezadyFUdo0p1wWt7zPEdVjivkwtgxU389rgms5+25SexQ9vWVksnVg09EfdyCCI
	ZyWE7Y9WciLxJtjVXyDsPA/BZO94q93QDlg2PwXNI/Ffs5o5NlWPZ4sf3+fUrlP8Pht/srC7TmU
	Y3hprrKxo24kpz56vtdbxPiaaDpKp6UP/eNWZ0yearPpq+I43ogJHHC9HhKfZa6N2pk2P3tlpSN
	zN0iAkSddPMA==
X-Received: by 2002:a05:600c:9a3:b0:492:4723:166b with SMTP id 5b1f17b1804b1-493c3cd70e6mr5739425e9.13.1782909656935;
        Wed, 01 Jul 2026 05:40:56 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-476792758aasm9625656f8f.11.2026.07.01.05.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:40:56 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:19 +0200
Subject: [PATCH v7 07/11] arm64: dts: ti: k3-am62a-ti-ipc-firmware: Move
 wkup reserved memory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-7-e9db8b16821a@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4480; i=msp@baylibre.com;
 h=from:subject:message-id; bh=hhLOVviNovSyV3jCQbGI+vZbPMnJi+hWYd14KZ/n2h0=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixXrhWm1kv4d5+ckVewTliyr9Fg9vXEV3fK1xy0ZTL9l
 GK/xtOho5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACZyby7Df8dz2WfUzl/41pXL
 8mPfjyPqRjUnOV/xnVQPbYvnfMBWPYHhn6FlChPbfNGHPWsfJ25ZlvHw0E754+nxfk2OfkcXzTI
 6ww0A
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_054059_109605_03CE6587 
X-CRM114-Status: GOOD (  13.46  )
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
index 08c73cae26c73993a613372110bfd5611c403846..27801c22a550330b52c4424f919d80f10dc76403 100644
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


