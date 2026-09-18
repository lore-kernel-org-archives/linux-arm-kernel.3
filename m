Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61246C982DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7yMJYTYJgQ/oqLDe8tgjpeMjyJjtzDo3z5nAQca+jEA=; b=uzXhTyAVMxVcyPCsB6H9qgXGVk
	4sYaE8cnc5Ua77kN4htjaL7Riy0tC/whafEcKcXHvRDjpa9CjOvOLxiaQ9tPo8cLrR2VAc32Qmh4d
	fbAwUeio0V6Xtbprf6TrAB+99XuYIipK4f9SVZ+xlLT9DdaGGzqQrsrJuVdrzqnYK3IMgMZLt/k7a
	IZkVJKfksw/+LivU5GsFILy9ZLwcpfaT1BFEBsrkHnbxwCDSCiASESTCKOIie/U4Yn29VWJmjhqj7
	4vOubfHG3dhE1lD6iidbLxqyREYIM2SVQLHdt7s8RodXDhuGdpRuFg702B5wZtsfqsIEVqyTM92Bn
	aw3R1Mww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Uke-0000000DvPP-0yAI;
	Fri, 18 Sep 2026 09:19:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UkS-0000000DvFB-0wRR
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 09:19:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7yMJYTYJgQ/oqLDe8tgjpeMjyJjtzDo3z5nAQca+jEA=; b=ODJrXqanGyy/Fv+9TZosgCElKA
	soEZPUjjhebUly7PYMgjGIg+ySRnPLvrA3ntlv7YUsX0N8tyPrHy1dKcWD07mNc9JmbOHYwK15V5e
	oCwfqWwvHGrI/ymz3Kyw8mXLrXxmpTlPsSFWevijHQ/XgqN37sxmyJNiL2Oenm3Hvylhpz9xpoXec
	ije5Gxo1z83Ot+wmhvcdLSTLHAWpArQcFpD0rCGOnsIFaunbCE+jLls3uB8M6USxULVbr58cMdeMH
	m1tWuCiHoYJxMiv9313ojNDdNEHGlGUHXe5z7BC78E9P2of1d3o4I87owiwR/o2MLNtPftc2svGe7
	0Ng+n0tQ==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7UkP-00000009qad-2UA9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:19:11 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f635552aso384269f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 02:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723148; x=1790327948; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7yMJYTYJgQ/oqLDe8tgjpeMjyJjtzDo3z5nAQca+jEA=;
        b=m5ml8no5ml1i7Ae/8zi4Vfalj8pZ+FTnoNAH/FLTErGXTciJPozYskN4efHKTATSQ8
         UYX091+3Wh1VhT79sKiz0eEnWA69+yR/8I8Jr+YYy5Qf0/egg4Fw//xnWO/qTnxAd5Yf
         P4q4Aao+nuBa+ZWlYvBuv5dffLHSuTgyd0uJ7fjo+gtTxT84+HdHYRA4eYT+wKMIEj7n
         y9zoIQBl6P3EunYq0ELm2g9uEzcj2kxzr9e6aEerGReleFzg9JsxzE2HpUO/WwdTQfX6
         ssOr+38vot8cTSuFra+woRmBtT4WhVEx+3YmF4ZjtDAaKKQYqM1exSTXV99/0HmEu8cv
         zJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723148; x=1790327948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7yMJYTYJgQ/oqLDe8tgjpeMjyJjtzDo3z5nAQca+jEA=;
        b=UjnRPovTowsO2Z0YPkMPf2uqqZl//u6xnRSI0kYIUb/3t0d4h1m6d0yzcB/zZqWrTH
         TeWmQeYqwg8/XaANM6NBkEpspWnRrE+edkizZvZl30GsKrYfM5UCmnoMABm8WNLU+5Qy
         MwHrQFQEtoDNyMeSbmpiAeKpqfxHH+ermxR9WLYp+qtvs0nL+cr+LP/ZzgCbNvN7MD+E
         q2PfvbyNN2mK8j4G/RzvVIbeX0pyCjjCphI1fCofxpfECdZFZJo21E1Dug65Nvjd1MFo
         FbiFAgSdMYvGpjqCtlmwLMK6bGJGWwHzjyFCpZRH4ZqVqyq6CqaRBtoyxEHqb29AOLfn
         IJ2g==
X-Forwarded-Encrypted: i=1; AKwUvBxuWqqGeBnlCuRwfYIA9n1Ar8cJsrjIe+9pC/XoJc90pR+ajIuDw3Ay7FUXeQxifRAr+geHl4/7RzFY1dkGoRb9@lists.infradead.org
X-Gm-Message-State: AFuF++ly5mcb+tUMCGMROHaEVWcXgY+uJ+vth7Rwox34jfdkenom35Ul
	MnGGCZmJmljPIbTKy5w3f/RzM51FUWiQcf09w6TIXusBF/HW2WExj+h+kE67+WhATJ8=
X-Gm-Gg: AYBFou2D0p6ZrdmUTfLKSzyz8pmCjJ4Nfqeghk9W8dkUFnd+Mxq+kWOETNlWMHBGtik
	jxIDMgbRq7iByCwXJCFmJ2cOx/0GUhWiCVCulyn44LJEDR/+eE0BCzu32fl7promvjLwgdT+s2Y
	huiiIM/94UTCkIviHd1HELXaOi6A5kGTnKSGmcaj4BABmcw2R/ktMT9I20ZqnoQDCs9lF174Cf8
	2i04qQM8bN5BoxlqDyMwyAv52FlRjE4vg1ZCgskoRUwMkJ0limdGXu4E8RVQC2hNR2R7ssH+Q4N
	mDpYMG7jSKPZrgl5Z4wX2/nZb639UORvo4kVxVWmRMYLzM0t4MvOm/jD/Fx51IvDShVePhDmdES
	wxdrFXQ/8gj9YJ39pOxPtGx/6/EH/ZDhvV91nXNg9JNMxOOQO4VzwOEGscOWMfZcsfMxEok+paR
	sR2kXOdyKTTylj7wwbeCkK3+r11n07iKv3yX4cOZ7ecP+wD3F6VcCdWqtsrykHXrev1ps=
X-Received: by 2002:a5d:5f42:0:b0:487:360:f17e with SMTP id ffacd0b85a97d-4871e2552a7mr2255975f8f.17.1789723148442;
        Fri, 18 Sep 2026 02:19:08 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487200737d6sm2804109f8f.24.2026.09.18.02.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:19:07 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 11:17:51 +0200
Subject: [PATCH v9 7/9] arm64: dts: ti: k3-am62a: Split r5f memory region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-7-40972ef1f663@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5545; i=msp@baylibre.com;
 h=from:subject:message-id; bh=5mALnbyOqdBZH9llVp3wtVFp2kPe5tzU1gIjquZokes=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jA+4CvbPi9PXdTr/vslkeoaD96yzh7h3GF1ctlK0z
 Xqfnf3tjlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZjIP0GG/15bzP/ar7keeHDt
 5MiqOYwH5Cv4K2a/CZoX/H+jgO6ZJZMZ/js8WC72NkNfuzSueKPwGZ6dUSrrBN0NNVPn8k475+P
 xix0A
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_101909_742006_1C13F539 
X-CRM114-Status: GOOD (  12.71  )
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

Split the firmware memory region in more specific parts so it is better
described where to find which information. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data.

Reviewed-by: Bryan Brattlof <bb@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi   | 28 ++++++++++++++++++++--
 .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi      | 10 ++++++--
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            | 28 ++++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts           | 28 ++++++++++++++++++++--
 4 files changed, 86 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index 53c096da68b5..7fa19ced1a23 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -65,9 +65,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x1e00000>;
+			reg = <0x00 0x9c900000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca00000 0x00 0x8000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca08000 0x00 0x1000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca09000 0x00 0x97000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dm_region: memory@9caa0000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9caa0000 0x00 0x1c60000>;
 			no-map;
 		};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
index 06d4e815b167..94c1d60d8d7a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
@@ -65,8 +65,14 @@ &wkup_r5fss0 {
 &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
-			<&wkup_r5fss0_core0_memory_region>;
-	memory-region-names = "dma", "firmware";
+			<&wkup_r5fss0_core0_ipc_region>,
+			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
+			<&wkup_r5fss0_core0_lpm_metadata_region>,
+			<&wkup_r5fss0_core0_lpm_rest_region>,
+			<&wkup_r5fss0_core0_dm_region>;
+	memory-region-names = "dma", "ipc", "lpm-stub",
+			      "lpm-metadata", "lpm-context",
+			      "dm-firmware";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 6e5419de8e35..871ec227def9 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -59,9 +59,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x1e00000>;
+			reg = <0x00 0x9c900000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca00000 0x00 0x8000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca08000 0x00 0x1000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca09000 0x00 0x97000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dm_region: memory@9caa0000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9caa0000 0x00 0x1c60000>;
 			no-map;
 		};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index a8c794d07343..7cba3ff99e6a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -65,13 +65,37 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x1e00000>;
+			reg = <0x00 0x9c900000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca00000 0x00 0x8000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca08000 0x00 0x1000>;
 			no-map;
 			bootph-pre-ram;
 		};
 
+		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca09000 0x00 0x97000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dm_region: memory@9caa0000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9caa0000 0x00 0x1c60000>;
+			no-map;
+		};
+
 		secure_ddr: optee@9e800000 {
 			reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
 			no-map;

-- 
2.55.0


