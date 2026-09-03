Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2610EC624D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 12:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qbzsY/FQUhuAGeeioamOWte0zZ4sj9lGHGXUa9x4qgM=; b=IGTBrMIODm3X1xLNdL198nsOpb
	ehE39SeNHuuCIWvDmXp6GFx2XiRD1FJpI8CPcD9nzBKd2dIvTwt80+w17O8hLlhxGYyRD2xFMLnZY
	0KwIBd7dy16JBu4OTdD7ijZdnqGzsK1YGEQG2Ja+U6agkq74C2IlILJQ4Yy0f9Z+N/7RUDeW5W4aj
	TXKMC9TGf/tqCwS1SIDviVOOThEqtKLRZK2xq/Ry4kSovExO91SPztgoR0FCsRAYhzUorWY5HaevR
	5vpGR2WsoChtiZGriGAjBoNY5qu3NkQqFaDZRS8L1v6CHm/ObeaVJi464+NXj/yHO1TPELXT5MwXD
	UwyfbJ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26kN-0000000HKEY-3afS;
	Thu, 03 Sep 2026 12:40:51 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26kJ-0000000HK9K-37kx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 12:40:48 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so2208378f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 05:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439246; x=1789044046; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qbzsY/FQUhuAGeeioamOWte0zZ4sj9lGHGXUa9x4qgM=;
        b=A+amMOtwTQ6lBruwh7/dU2lVfdKx+T09sEPTlVSCgCvVG+9g8fwKF1WeoK3/VmnPbl
         NoY59rlKX1HdMPmT81OnGil6RrO/Fc2LSsdiaMujOmAQnIJnY+0rg7JrMmsM3JgFK0Zs
         /B75BuGdEhAdayXQXnk11HfRFYuj5WzeJmaGlVzFx7Eabqgg1ZIGucZPv2sXkNboTJOT
         yTfTaUIoC1cdsU3uxEH6oFHZR96Ra8Nwls1nZ+9iCcrVJIJw4sbPhZEJkLisMmjiF27d
         yTVlU93HARLRw0VK2PBywQ0bF/3oWnmOPilyvRVwvnvsAROioxsItCfiqlMHHjqo9rvM
         EqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439246; x=1789044046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbzsY/FQUhuAGeeioamOWte0zZ4sj9lGHGXUa9x4qgM=;
        b=N2tZcS64xfqbBXMkO6okYExBWGqqvFv7yGzpWJP2XdPA4uWrxaoLP4KsYo+Cybuvyn
         uNReSBjB31MtSIWY+SvZsyi3XQDmBTv7D1irnX93g6+RBeD2jaYU1y8zoFlzpBYSUjkF
         JE3jy/aLI/Em5pR72IOCKqZFOr3ctKVmINxGHVBOHNmLb2SUziWuKR6Y9Dk6qrzRo0CB
         DAhFH79We1VFu26diFEGiQGyaa/SJ84UPLwzngQZ6Qtypn+vVBqCd1Sh2/GEkCGvZsng
         O8wHNbZsjQ4Y3NKVBKtXvLq2IncCOVGpSD0UTwBRfJPJBhSYfcPESJOcFZP9kaKpGD0e
         Ip2g==
X-Forwarded-Encrypted: i=1; AKwUvBwmf4j5Q+/JCXkBo5BzOrq/ezisJktePGi7+q2AUwhJE2W6O/uoDNK6RVcGR5EqqWuHT4sSn0vLKq4R89/HYtgI@lists.infradead.org
X-Gm-Message-State: AFuF++nvXvfsHHpNgpeUkjHRZVgLw8SWIfZFlSndIRy0G5++QdDlf68R
	LOMr1vxy9rMLs+JToyP4r5WQOrqINP6g6cxv0caJRG2VulApmr+jS14gbPsR8x5Voks=
X-Gm-Gg: AYBFou32yoq2xhYnh4Re3/9wBhGLQ8gGhts978JSd3daNHCseuaW9Vbiyn/O0TOVCXL
	lXrIRh159q1SM5CxxB9ZS+JdkxVPWnJ4ImUV0OH4bdmJtfgACjb+mUxjj3IUujjZtdiL58z4rgb
	Y9d4iqCNvRsana/ezYcrJ348+4pBTWXLmJVmDSYAZrWFh6/CPzYO9f2GFP3Stb4RpyDt+EsaKIK
	rD41Pak7KTGWmT0Coyq1qMhTV5IWM1mXBWMvnU3mKMDUCqnJzOWBc07naK5gJuvs7LlJQxF8z9J
	gm0Zqv8MRlU0mjP2zHGdIM/dy27j+5/iK5gxITZFD1A63d9ZdlhwnRHgh2cqeqvgwT8P3FXCvts
	xxw736arr6peI/WllU76BHAfa1c/6wOambqsoK1Y0th1v8hT6QqkY05yrDc51m52xINRfHXqItj
	5sOrnRPU4S0eTbiAVGtjExbgEHxz1a1z9fo2Lmmp+1Zv+Psib5jVpHFLxj7g==
X-Received: by 2002:a05:6000:4913:b0:483:ca4a:504b with SMTP id ffacd0b85a97d-48488dfa19fmr24924311f8f.7.1788439246099;
        Thu, 03 Sep 2026 05:40:46 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:4373:6c2f:4372:b8ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492ce236sm15801863f8f.35.2026.09.03.05.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:40:45 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 03 Sep 2026 14:39:29 +0200
Subject: [PATCH v8 8/9] arm64: dts: ti: k3-am62p: Split r5f memory region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-topic-am62a-ioddr-dt-v6-19-v8-8-74c650dfdea6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5362; i=msp@baylibre.com;
 h=from:subject:message-id; bh=UUUoF3s09RiDXoX7/gGcmRjq03IW0OJaVw01lmbJgnU=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyZWTtcb6sWKt+6nOdyegdripPis9Mz+2UUvp6Ya2D1L
 bDy0C72jlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZjINXmGf9aRNX/nbWq2MHzV
 bltuy8X73jXshHDLXF4VtZPLlgT9yWNkmLhVJmwGyx7zXYq7O1fsPl58PWPWh3DLX0e0Z/beaJn
 rxwsA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_054047_821119_B1D12DF0 
X-CRM114-Status: GOOD (  12.70  )
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
 .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      | 10 ++++++--
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi        | 28 ++++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            | 28 ++++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi      | 28 ++++++++++++++++++++--
 4 files changed, 86 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index 5d7f701420e2..84dfbfd1986c 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -44,8 +44,14 @@ &wkup_r5fss0 {
 &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
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
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 8a5ff5c45757..45ab9d947b3a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -168,9 +168,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01d08000>;
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
+			reg = <0x00 0x9caa0000 0x00 0x1b68000>;
 			no-map;
 		};
 	};
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index b8af9ec81b0c..bb027c65eddd 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -55,9 +55,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x1d08000>;
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
+			reg = <0x00 0x9caa0000 0x00 0x1b68000>;
 			no-map;
 		};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index 3d1a2c5bc464..31f670fdd91d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -69,9 +69,33 @@ wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
+		wkup_r5fss0_core0_ipc_region: r5f-memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01d08000>;
+			reg = <0x00 0x9c900000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_fs_stub_region: r5f-memory@9ca00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca00000 0x00 0x8000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_metadata_region: r5f-memory@9ca08000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca08000 0x00 0x1000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_rest_region: r5f-memory@9ca09000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca09000 0x00 0x97000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dm_region: r5f-memory@9caa0000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9caa0000 0x00 0x1b68000>;
 			no-map;
 		};
 

-- 
2.55.0


