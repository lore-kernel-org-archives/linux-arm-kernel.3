Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7009103E19D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J7J/XuAEJGTEZtvWSSq3yXfnStm9aseiZmgqCqYghcM=; b=q4H7SEYRObOuL1BJtxEQoGc4lH
	HLVUut4KtIfo4UQoxZwcQ28xzVECO2T+LMV4izAUL0MvntQyBM/3pJS9/XgG1QaFAa2ru6x7IT3MK
	pKNZ279UpPvJb2Yq3pKOoJ1hytxhRbaGrKbCv3kR9ucUIkhJJ+RN2/8FNtGst3XCJOISkJZ7qCYNu
	1gkfw0cpAzHDQjvclOTvg/5Q58wuD4DssuSiwU+qMnSeciGHwGINgXev3BqThwiYGn4/a5KS5Jv5O
	0WnqRyCOcNg1ux5RTAUBdhtTqk0KFTN1jGY68LhIheMyvv2/pQ+hcnIHrJtWgw1PtvQ3uzqet1+8X
	f6fo3/TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sbN-00000008fQL-0kf5;
	Wed, 18 Mar 2026 15:14:29 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sbH-00000008fL3-1JVs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:14:24 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-43a03cb1df9so6967123f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773846861; x=1774451661; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7J/XuAEJGTEZtvWSSq3yXfnStm9aseiZmgqCqYghcM=;
        b=gZKeDJbsupVCnlxSKBEIee6wFBEgU6Bfnt3oa89skNE6hOxFN44bRzavkLQFATpKx4
         E3Ov2NaEakNitM8EyzeNaz1dqg/deZq9fI2H6fAG9Mh++uHYaDrjMIduS0lpUsRIMiie
         GOscEPz/do3SY4382xvp+h8Ct4BsIiocR/tpilXHrqUv2I6fdCjyS+DPZ423n+3c66pW
         hBmJffWRbFV7sCipwwgeUJp8PXh0qzr9YWZal3qttxNrhwoI+9WA0I0SUbLNHFydzHKY
         YuyZII5Qc1c8+NA2J1T3bRPDP4MQsCArqL/MNU6i9UDL5a+sG2D3NLanO6jwApb/Xm5h
         lqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846861; x=1774451661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J7J/XuAEJGTEZtvWSSq3yXfnStm9aseiZmgqCqYghcM=;
        b=ZLAdgr73eTBLx2BjvCmcLxokWk6+moTj2YWmsbojLpd/xWEw5FWe4xjF7HAz95HlHt
         Cp7VIIDrAWYpb81cVxXLur0aBigftySTUujsnDx+BLFaK5HDclYPBFcc86FKon0rg+F1
         A9xM5dlywvpdTCpHqN0FdWxR8amgycLpPGKhawvd8RoNtScmj/rzy5KVVBtom7L70K6a
         QqHllcL3cBk66c/lD/6dVkAEyhr5tF8cM4gFawfowM2AtZ7D10Z5uAPn7NVlEQyfGLBm
         s5uATc/PjSGzqeQF7JDQxnqSULy14RAIfHd0vRnTexaT+7Ctp8PqDKQAEosArP3XMTHZ
         8o8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQWw35+a55HdWeYB0zzMAu0LIdAiEIvWdYsMz1pFA7e4h2COIuj/sWA1CaeHgDDUlmq0pvGwUXvVj8AOIq644H@lists.infradead.org
X-Gm-Message-State: AOJu0YxmorClGlDdwLQns6NQNrp/VQ0CQ3yv5goJ8P9bgLvujaOc8KGE
	f3a+TBxH78dUjQSTNuXOLtBDgnpAjqH+GhQT8Rfp0ym+OIqFEMd4wJVfszJmIAqNvvI=
X-Gm-Gg: ATEYQzyvibChKse00fk8bDYvyK8/2RRqMI3MLh6izZaDGf3Gkg5/FiRG68wI93NoloK
	+TJwC+GXKGuAYrLVcIUOaWN8C/Xs2Qz0Pn8E00pGKLJH1hVCKmG5as2+vXvScvjran2XfMTbUWM
	O7E0+s73nJyj5x4OlH/TycvxLG6oe73srwxyvLvrIdTb68yxlfZTCo4HvMrc0qnn1KyYO509hOP
	66LUOYU7Nc4W3cOab/YTkeFajITy2+odQTS9diF5UO0Fl2EsLHN5EUb+YFqErjAo8Y8YuVWRRz9
	YxhXj1axStwBAUvpunGeCoR8sqQTfUzUV2daepknzAJjx6FzNWguvsLN1Yv0Lm9BNiQ7i8BQuha
	CbJe3Bcww0bzkqgEi2yOiASHQi8SV+PNrDGlam7b3nFgeOvqoP3eaerI7DXKf9JotbddSADOgtt
	ug3rXtt4aJ6gokfNZrg/PY
X-Received: by 2002:a05:6000:608:b0:439:b858:1d28 with SMTP id ffacd0b85a97d-43b527c429cmr6235032f8f.26.1773846859401;
        Wed, 18 Mar 2026 08:14:19 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892290sm8063440f8f.20.2026.03.18.08.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:14:19 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 18 Mar 2026 16:13:11 +0100
Subject: [PATCH v3 5/7] arm64: dts: ti: k3-am62p5-sk: Split r5f memory
 region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-topic-am62a-ioddr-dt-v6-19-v3-5-c41473cb23c3@baylibre.com>
References: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
In-Reply-To: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2273; i=msp@baylibre.com;
 h=from:subject:message-id; bh=XPX0yeV9y6Q1/hILfx/rQYzRxhs7KMWJhy8D6EKmBWY=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxdB3V2ZCVcX7v3SmPaKv6pV+bsuL0mR8HO9Vl7AV9gt
 PnGo188O0pZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAisXKMDM/3O8zdU5XYcGoN
 w0qV9funcVevuKr08a1G6HHGmJPqxx8z/E+ekj6jXfL2iQX6wqL8H3/M0KufrLN7ocWrxN2f169
 s2sYMAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_081423_392992_81E30FFF 
X-CRM114-Status: GOOD (  12.21  )
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
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 40 +++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index 4f7f6f95b02ef94a140edcef595ad8f6cc4b4113..7fa4924ab52484c7ac4243a0cd6c0d7aacaf8b30 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -55,9 +55,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
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
+			reg = <0x00 0x9caa0000 0x00 0xd60000>;
 			no-map;
 		};
 
@@ -833,3 +857,15 @@ &mcu_uart0 {
 };
 
 #include "k3-am62p-ti-ipc-firmware.dtsi"
+
+&wkup_r5fss0_core0 {
+	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
+			<&wkup_r5fss0_core0_ipc_region>,
+			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
+			<&wkup_r5fss0_core0_lpm_metadata_region>,
+			<&wkup_r5fss0_core0_lpm_rest_region>,
+			<&wkup_r5fss0_core0_dm_region>;
+	memory-region-names = "dma", "ipc", "lpm-stub",
+			      "lpm-metadata", "lpm-context",
+			      "dm-firmware";
+};

-- 
2.53.0


