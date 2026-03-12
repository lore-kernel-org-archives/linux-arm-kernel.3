Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AB6106705A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J7J/XuAEJGTEZtvWSSq3yXfnStm9aseiZmgqCqYghcM=; b=2Et1aXBHXxLNqQ5k9b2vsixt8a
	5juyvwQy7468Rss/GlMiwDmFKhWr1s7jkoNCfPBkB7NywG3aeI/FXF5gprUAY92cix/CDy8dIVvqc
	dRJ9aS0qkv1cUFrqqXfgxN11/yWzdUHjoMHWBVT8wohwXeGhLYQW/Kg1L/h9E+60o4tIfFwCS8fKE
	c4sz7bq1X8fSrJa2jzAZYUGS2xEq5Rm6R1HB79Qog/XtdTctAgtgQNgFG54I6fRWs9MQrOm5i++53
	91l8utPnvSr3779uyXPNIKl19A4IanTfNW0WzjgFHgaG9/SNw0XRocfjYsBzxmplqNuXS4m3JQdrD
	3Al5+oaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iIk-0000000ERYg-2fro;
	Thu, 12 Mar 2026 15:50:18 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iIf-0000000ERUX-0FI5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 15:50:14 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so13648475e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 08:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773330611; x=1773935411; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7J/XuAEJGTEZtvWSSq3yXfnStm9aseiZmgqCqYghcM=;
        b=BkoiZgA+CdlZtojBbw2xTFjwNbpBNXf/C/5zRxDSKv2VPIyxJm/b1rg/nDMcqRTfgo
         +Jy44TKoCn5gzrXoW9FJJ7s+PDp1v/BPvBDjVXYCUNdgPo6c/2QJgV/GW9FKp7doK1ck
         piV28LSmLGqZOg09CLOA/U+Adcs3HC/7I1qh0fl3QbdmezBwjm30UcLo0w7FxKEvtlTh
         gC5HrNCPtJrbfepe92iuLdviyoxde/p9O8jRGoBgqUhq31j7U8GGwdjKbKeCLl5m51er
         a89OGeMIY08QW0+1PhcMn8qnMCgI3IvAaJhg58FyOWzIGzKqrSZAxgmJ+foTIGySDVZg
         ZQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773330611; x=1773935411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J7J/XuAEJGTEZtvWSSq3yXfnStm9aseiZmgqCqYghcM=;
        b=l+1DnGJxVLbnVjXee515eqJEnzeN+brCVp7PMmJl41m3MZiLtxmKCTFpOLohBbvImo
         IEZNUU6FrD5vfKrpsAxWFUMwIBoDPFYUPlOeXTJMrDz2g+Wwyd7GUbKj1XUvWc2UKXde
         09vVg1BlLFufIpuRfW0pxE4sTIS9kH3a4VFRVCttEySAePvp453C7fT9oVIgQ5ItOmUh
         NRhEvymUKAO5wA4/7UUdngITvw/bI+9K5T9YVMEQExqoShNoqiBVQ0KHCOBTh3BeMMQa
         HbveuNR7WZ04FUvdvT0MdP84q5bg0VVIC6k3FWfSR1Mnyd1J+6/LBVx7Ij2Tn9wNLhSb
         VotA==
X-Forwarded-Encrypted: i=1; AJvYcCXVn8fHOlgek0tY7OyZfiFQy3Ut5fTEherG4hYpneqQEDpvs/o9bml6C16qFxFeDvpYisOf1zzuSlvN86tAHgAt@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9WT5FLpZrLBb+CJ60CclRo1emC26jdqT8YXRv0e9OCwZLNEQH
	3+/5VqY47tuRCgD4ufdtev+e7lcOLW+SYC+WOYtRnm/P40E8NbOd58G1XJSS8kyb7sE=
X-Gm-Gg: ATEYQzzRDTEvhEdseOcZbobDkE0rw3QkFr8Tlyza2leqHe6WqGaOFG0C/TyTmldxekN
	3wWB1jgXBk4fKoUWxSvegVjijkkUinQsHLVhxkm2zdYu8hjZuQd/ehOMkLI4PE7vzGPR21QLeFB
	q2uXBwcMeAAfw0XsSKILXgTABjfb+xnwHYZZLZn/+/jdkirj75GL1QeXR2Vq2Y7Xe84SUaDbOpS
	LZsC6W6D4U4NBvLhmGxXFsTna897ChMW+feTKJIeyJiwJPlMmJWezvZMA72s583gueIBZtD2Khs
	mmOpjd82YC1DyAlYjSPohuCaC+pJkzt2XOc2R8Vn1hCUQ8BSzLlh5NHFEwjgd9b8oqc6y19ggaH
	j+ho4swA3SVkvuIA3d6SXLLvOcoh+PVBepBQmnyeEyy44KkNzsBQKwR3F2OoB5mQeD1Xse+xWCO
	6V3R8R0T7DLJCUQNuRaPN2
X-Received: by 2002:a05:600c:4452:b0:485:40a4:364 with SMTP id 5b1f17b1804b1-4854b145513mr120904965e9.26.1773330611284;
        Thu, 12 Mar 2026 08:50:11 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e912fsm361176715e9.2.2026.03.12.08.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:50:10 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 12 Mar 2026 16:48:58 +0100
Subject: [PATCH v2 4/8] arm64: dts: ti: k3-am62p5-sk: Split r5f memory
 region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-topic-am62a-ioddr-dt-v6-19-v2-4-37cb7ceec658@baylibre.com>
References: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com>
In-Reply-To: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com>
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
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxND9qjCuYpaXHGajomCN3XOFP9ii0gP7hyWXZj+YZba
 ivXGH/pKGVhEONikBVTZOlMDE37L7/zWPKiZZth5rAygQxh4OIUgIksMWT4Z7ZCuP/ymmNx6s4z
 Uw+ULmXXvWVpMr1zV4zKBHWNrxnSDxkZvrqxHl9wZVa/C8M052kTH0Q5Vh48VHVeYFqQ+e9fZUc
 NmAE=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_085013_148168_972F7F4E 
X-CRM114-Status: GOOD (  12.25  )
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


