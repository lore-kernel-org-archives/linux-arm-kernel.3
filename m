Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9FB103E19A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6FKMrTLP+EgoNwLb1d4K/Z1ONjM0ZaJwdkY97QIcxI=; b=bczlmfXS3hFbi72DRQI/PzFa4b
	aq1AP0tbb78xmcKqOg6p8v8wFdY5gwSI76zsZej5GDryVYUdu6dpym4wnsCkhIA9rJfKnxQGcKS53
	XB77lBjSUu3ml5sw4FsPjgUOxcYzZfMTy0NPaUEqkWKkCftLqPag3xLj1N2IvfNHy6xSDweX2/2r3
	TgNVIDPqucC8Sipv5kQakge0InpDdTBppGX/DaOs7ojjo6FzTCxTl/bElVIDPPa32Ktauo40/BI51
	NafG8hBr12whqcL9KbOPp6qOPd+P2PFu6txRLig4tkQNhoSM52MB8pf6xhG26ZL7+F+ihOi3luqGW
	ecCWLBrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sbM-00000008fPD-2JEj;
	Wed, 18 Mar 2026 15:14:28 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sbE-00000008fIu-0qmC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:14:21 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-485410a0a8aso63152765e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773846858; x=1774451658; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6FKMrTLP+EgoNwLb1d4K/Z1ONjM0ZaJwdkY97QIcxI=;
        b=cd0GFomi1fYSGuz7StWKwjUm0ZOjXCFfGSDO1lbKqKpwWcHYniNN2o5gUlo9JVu2ZH
         xCXRZ/n3gfG09kFGTIh06fSqUYKkAVBc21X7Z5EysHSktFCaDz6RFrsTjtghqCJdMl1m
         7vLYraL8tQer2Yqh/13/TODYu+RGKQb4Ee4QwnFUeKC6bu+QQ7WEtw+dVA5B6HuadkMf
         SWBcJy+ZOapZJTxkz9t7rBYef+8xg2UhzKXAtf/Vr1dIWIA77XZ35Vs1vvsBYCtpUbpO
         2+TqYovpLuvmcYJ0Tn67f07ZyxQQO6uOYX4tvvPAbxD6YkkTjgFki3yF6efTXO4DbZuu
         0NWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846858; x=1774451658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d6FKMrTLP+EgoNwLb1d4K/Z1ONjM0ZaJwdkY97QIcxI=;
        b=KnBByV7WMP2Hfhsg4i8uR8CVMpaRL6s1y5H7JZ5ha36qCq0TQ1OC4pHslPgdD2AVHv
         TF2l6p0gMOJHJkdU6Wg16PqKLrmcRiDeL+kwreCvq6Hqy5CMsO469aRwiuXmvhAO7Q0b
         qevAMMT1/00bD4hzqflFKhRIh0LIaj7JiMLsh0dRO3U8reZ4J6YD6BoUDmBuAvcM858J
         aWS/xHoZKW7gQAagILsb+fdsbAccbrhbcJQIYGljVFOxJxD7XG04wKUQbjV+VtRrloSm
         Bbyy3q4EfzWLDNakJzq1TOUXHGkYRouBwcTyfOUf7qBpx7MjS8dF9LpNn3vJSuKw4jcr
         oP9w==
X-Forwarded-Encrypted: i=1; AJvYcCXw4b8PgwhKw3QFlaF1gueobNDiDIucquoHO97nhOl33ckyXUtXTlPCfyrw1lJlougyMbexDdrT/hrueBB1GtcF@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3w1vwmNu+HLEtGCmrl2Flxy0xClyEcbZgQ/s/Z9BsOiUFC/nb
	9bcXeyGX0i2n9BnIMDZwjXQkRD36RTKEV6ahCCuZATbRKD1eV5N3V6rPINKIhd7S/ok=
X-Gm-Gg: ATEYQzyEYaeAxxPKKQo1/spezKQTlxnmGHz/Yhp+LTC6HKBPSNvpDMaXE9lve2jOty/
	IJMb6R7QtFvgZc9F2mmwjkEmIQ1guF4pHHIlI82h7WWtCt1zp6YCWb2O8F0DKjjz+ZWoYBDkuay
	Xp4OJaIHIfvfjbg6xi5LKdqPFsPvnJzrrTnNnjVwBQs/5v3b8FTQW0qmT6IAfaXts/SBAR2cyuq
	Soc/q2HrkEdWLl3QJzvFRaJcgQoF1xuWLQtb3WcgYv7yQshT1I2KQylvMM0xoqNmpcbvtIrEbos
	8wEG8mfip0Z9uOxC/fVj9j4FJ2Kb3tYZNZhHMJaQl6dvxL+Ff3lCUVs1P85662RpfIhbEGYUpCX
	3nBUMduVrmV6OmVz+BBU/spBa2c54gO3hMjkZQRrF1wi39xKzpRS68d88+vQZ5m6ysNloSqoLjP
	pI0aVcUMWzzWDH6Azh/kEQxKK43e+fioA=
X-Received: by 2002:a05:600c:1f10:b0:485:34b3:858a with SMTP id 5b1f17b1804b1-486f4429d04mr58038485e9.11.1773846858250;
        Wed, 18 Mar 2026 08:14:18 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4bbe471sm22788945e9.27.2026.03.18.08.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:14:17 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 18 Mar 2026 16:13:10 +0100
Subject: [PATCH v3 4/7] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-topic-am62a-ioddr-dt-v6-19-v3-4-c41473cb23c3@baylibre.com>
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
 h=from:subject:message-id; bh=8u+OHH2OFtnrDqEIjHNZaX9z21vlFvfBncTMKuwpawg=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxdB1Vz/n1aOGmeiVvd0XeuFj/O1kyweeiZ7nNz+sbfB
 TmnGdxZOkpZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAiBX8ZGV5YbV5Z9Xf1fp/F
 i9IDzHYWB2kqen23CD0yV0phy1X2cBZGhn7fzJgl53sdSsTNtFov/RIT+KEj/tTXYoeyu0DYK34
 xZgA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_081420_270182_DBC1EC2D 
X-CRM114-Status: GOOD (  12.41  )
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
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 40 +++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index e99bdbc2e0cbdf858f1631096f9c2a086191bab3..c381cc33064ec427751a9ac5bcdff745a9559a89 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -59,9 +59,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
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
 
@@ -922,3 +946,15 @@ &mcu_uart0 {
 };
 
 #include "k3-am62a-ti-ipc-firmware.dtsi"
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


