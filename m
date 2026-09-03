Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690CFC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 12:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TLTaF4F3F/RF0AsKabQCWTXBlZKCu3a7EnZSO2FPDV4=; b=yVnICHm+eda7qjvPY2NNdhyHBn
	nK7aOMq1Fyzpnre0kYnPCEHSMCEEUr2owR13UIC7R4arXCFvZtat9Z8FIDUIjNYRuu5iiPJqhwsCL
	rL4lG6EotaJKSZy2nkxDdtCQxvEF7mTEi8+fQD11CKbJszdLDRjFNyGAdx4FGXqkyvKOqgyaf3Ave
	HgnWcR8G5VNHGBYzPUrytWF9OMdmVVHG+qUKt29FuGNLh1bNiGQ3tnxU8OhnbUdBt6KZNZRgeisuR
	IPcb4fvxa8iPYa0jXiR6/Dtg6w+GL3P9EEYz+yFWnXxK7iRWSK8SvcLK5p7svPLP7n/U38QgdlcWo
	S2o4L0KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26kN-0000000HKEC-369C;
	Thu, 03 Sep 2026 12:40:51 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26kI-0000000HK8n-3Bub
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 12:40:47 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso24412685e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 05:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439245; x=1789044045; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TLTaF4F3F/RF0AsKabQCWTXBlZKCu3a7EnZSO2FPDV4=;
        b=lH27PHPlMci+QDyboWkLBni72Th5F0fkFrZTv0C+PRHkqhtkrOBLoTTL4Pu4sq5QzW
         7j2sKjIofrnf/tvgH+U+RrG05xetD+7H5xbVQ6jmBP/NAXTb7+mbYGzYL4ub8SjqoQTM
         ZntPqTrL8KnrrxVmIMHCnecJ7x1JI1MtBweuBSeopWu6CkxmfaKfrzob4wwBTC24t7M0
         bCiYx9n8T1QbjwFMighIO5iZuVfbEjn7yqlrDcGDxvIvBb81brIn7t+/BikXSOcxRqjW
         g2p8APR4Tw6IVCbyE2gaKwcUdl03tZK1Y792y4Xl5oaheOg89bhI0H/yPGWvIoIg1+78
         Qhlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439245; x=1789044045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TLTaF4F3F/RF0AsKabQCWTXBlZKCu3a7EnZSO2FPDV4=;
        b=UYXHJWipLB40WbfS8VS3CJ9ZROM7Y0UdAmjjFOFyU3KoKkpFh1p4ifX4el1XGg0EST
         CQtDmTPLWDk1UNB1WL5QXVdy8yhclKCGrjYzQa8tERzojAVe4gJ9dxGGTAVpGPeDniN7
         LhJiuXsbWEkjXVFnV4reNhLSn6tVoHUVtPmBfXjBdcI/AQxvjMo3qx+vgdB3Jn8tBZC0
         t3XBzYwGSGS0/45gtjuoqwa+9KgRUry/7xgPG4w/O7i2PchbwJ98XEDZSqhS/G5TR3GN
         1VATdoX2iN7OdxcMjwLghoT1UH8gaYvBLqA9mlJ9vwN2wchUTveypL6uyNvNgy+z1wF4
         VZww==
X-Forwarded-Encrypted: i=1; AKwUvBzq8gxrWV9z/nQhYBlp1uVirDNSHgRFvTQ2kzP+9/UkzO5fHwCHjeKFCt6zoWQ1hK+QAnG3gZmnV3RlzA4YHNFB@lists.infradead.org
X-Gm-Message-State: AFuF++lodI+2tBnYNkS0DfxNfQvsFYcBjCU3xC4tncZzemDGtkbPKx8E
	CVb3NNIEQWqWlAUCGARoIZ8LI4Nf7pviVF/iKdSxl0Y1xWjYuuDdPywgqJ1iXZZXWu8=
X-Gm-Gg: AYBFou3fJCutAz8/32as+IQUuY+iJh0cN9dEuP6HtZlL2eX9Z4LTLM45kw6pu24hY4r
	LlHc3zsenuBFlM2mgTDl4ATcMkSfj8Bnjvqj4x0VmIK/uYctNd7zBpdCMHjnj5WgPAOki9iH7yU
	1IslTaHmBU0+huAkvS0umffYvAtzUjxsn0iXJNfGnJagVm4HVWffHQanJrEoP5tJ/6oSIar8BKu
	M03HyQStmcFmbja4L5Y2q+a+CqAk/iJFvZSZdbCuIE18dyyervq35vtTbQCiy8LtjVGm6tsQH9I
	r7LcI+V+V4y8sIKygcuejpXdtd/RuH3itAOi+ppnXtlui+3myghX99uJLamg9QwDudqUMII5DCR
	u5WK4b35OKkrufQ12D4c76ChQguECnADeQWD28AsrVJzofykhb5s9KFFDHzc0plOvBQFQxHSH8d
	hCzGhcXh7GSIqjpp5a6L2NSqGeA3PFWVkhe5qQT9Yo0VmvN7HKrLy7CJBmIS11vV+DtrQpo9VVA
	jD8gs2n
X-Received: by 2002:a05:600c:5306:b0:49c:c9ac:a4f3 with SMTP id 5b1f17b1804b1-49ce5810b6amr242693105e9.1.1788439244839;
        Thu, 03 Sep 2026 05:40:44 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:4373:6c2f:4372:b8ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce7ac52c3sm92330065e9.4.2026.09.03.05.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:40:44 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 03 Sep 2026 14:39:28 +0200
Subject: [PATCH v8 7/9] arm64: dts: ti: k3-am62a: Split r5f memory region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-am62a-ioddr-dt-v6-19-v8-7-74c650dfdea6@baylibre.com>
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
In-Reply-To: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5457; i=msp@baylibre.com;
 h=from:subject:message-id; bh=DH50lV/dqbquT6Sm3x8Cg+FWHILrsd8o5PxQFy+G9AY=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyZWZuc1pYm/wh9XdQbysHzl1/QI/r4LH/h9x1sETXvx
 SVnblnTUcrCIMbFICumyNKZGJr2X37nseRFyzbDzGFlAhnCwMUpABPZ843hD+/0hS/OB+lNshTa
 /fWx0kKveLFnTjsqXzNN39Txeo2vkTrDL+b+NbMlfC2eT23h+Zl4RjG1r2iDxi2m/AOsc85+37c
 ujRUA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_054046_840727_0CB27D8B 
X-CRM114-Status: GOOD (  12.92  )
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


