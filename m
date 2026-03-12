Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78C41067045
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6FKMrTLP+EgoNwLb1d4K/Z1ONjM0ZaJwdkY97QIcxI=; b=phX6zePcWzRlRRIMUqQRAjqt7T
	uTNulgWpb+WcX6XUfoFdDwWRgfwYo9FgL+XmMaxOLFWds383IHMJK6boKPTudE6KyG/M9pPhlALkV
	Ch+SS9ivOdIbIZBOQoDZ/g35UNm3+jRj85j5P1Au4a9F4NTJeDfuq3A4Sexu/78JQO1Tj/i31VpyY
	lYfQ/OFGczP3sAGOxfrfE7ueavigDSaL8vCp76SPjqbog7qYchRnAgTobdZeuXWgrexAv02s8yYsn
	o5sroF8xEjO5yBcpiqVyjtk9zahyvI3h2uZasPX0mhOJBYxF59oKVpl/sd1FpID8/XDo4rT9KbQ+9
	VENPTB1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iIk-0000000ERYB-1BP1;
	Thu, 12 Mar 2026 15:50:18 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iId-0000000ERTh-3l7h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 15:50:13 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so13138105e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 08:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773330610; x=1773935410; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6FKMrTLP+EgoNwLb1d4K/Z1ONjM0ZaJwdkY97QIcxI=;
        b=c5svIBLXv3g974d+DiMIw/o3Ckr8kiOM/4u30e4leyFofCdu5HDojGF4SuydXGD5ei
         MKVRBmUUvAOVcXRUzT0IX+xuyS//x05n9m0LBw4sIiaWP6xAItsNc7y5BScukCiRBrJC
         cJWSBO6Cw9z0DJvonYtGxpg8Bh75iBhE1/DehhaYJQOofl20bAJpkzWSnFtac4bVY4LV
         oCn9N5JuO1o/tQ2mFnu9mtSsI5+b1VNwRKu/hFeiLPhjLwhfLAyvkE/H0nN+S+/nZiBi
         /vtGPJ5c7JYkOX67+AzQWng3Gjp3TyUdOlaR4rDd3n21dchbhg2TByd6CNrvgbiS2GQJ
         IGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773330610; x=1773935410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d6FKMrTLP+EgoNwLb1d4K/Z1ONjM0ZaJwdkY97QIcxI=;
        b=l/uBRK05JBEiSfX/3Y5oHB7Imb2e/4lij1ms10AiH9sZnqEsthyGM9JbaZpC4ZyW5F
         LW8Ayagg+O7N9lHBdbV3O19Pnj8+fgVZY8/2TZunFPU482WCon+XzzQTBk0+zp1AoOtM
         JvSBTscNwzOBcSEH6ioYq0hftqxiyj0DYs76kShxbR31G0UkboB4OtMff1W2dM2dlHsv
         pVGSdbVo61jXx7+sBEHYIAZ9y39zfDUNmyb7nbgwaT2yHU6a9OB4UQLWrZ9cMkhLzXzn
         gVniO6WLbGUJXXXI+0n3FwkkT1lZ5m8iZOKUm1/+YEzjMtcC8W3VCLx5WbhNVotjxpwy
         R/rA==
X-Forwarded-Encrypted: i=1; AJvYcCX9vDyugVGqvwoRUxclHw+aZ2Pq7MYocy2Xc1ERUPO044v3FnNG+oxEga8isSBvxoRTtyrN6y3GLJBsIUhtnMVi@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/er83HnYc4D/sdNGVjmzaFogMnfT0ylkNZRJyimPf40hUNzHn
	Hsck7MZLy8IXR8zsL6a1kW/y5TjmfHPeEgVk++G61d77YpNdOad/6uVTfFVaT5gXT3z4+NYAYG0
	nyE3D
X-Gm-Gg: ATEYQzzIi99jtnFrT/F0Br69w0PUPvL0MLsONOT0oAmzco2ndrMz2JOJBhf6oHFk639
	uQ897T45jw7S0VPBTALkA/byoxrwyhwEGoBXT4SvD1pIbJhdARu6gtSgAOyjEEcOy7RGk48MxZz
	mrTpzH88xf0Ync5lEYON+RUIaCBCjTlYkSivd5QlMoqA1VOpot8VapKKnCE/fcaLvhcocEUSJWm
	VwIiockuwfmtqsk4vlDj6fXUoMd7skQRJslgFNuAg18QRCrlKJ1ICxzXf2IL9RckEXCA57EFvd3
	5pKUUFkSZ71aLIMCSVV/d4Sz/drttIvywfluyxqC9bQO+Yqz7hAjXx7ZQq4w66FSjFGVoJvfM2n
	Z+V5ev1K3vaJ3A/DEupB858RGoGwwyDoRE4VmGO9fA0S9xa5/5K5t6fBDNjkBqc3nyWDbENaLpd
	cWyue7uysVasi1dT4OrbN8
X-Received: by 2002:a05:600c:8b65:b0:483:6d42:25c6 with SMTP id 5b1f17b1804b1-4854b10f1ffmr118612015e9.23.1773330610261;
        Thu, 12 Mar 2026 08:50:10 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f255sm243387035e9.12.2026.03.12.08.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:50:09 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 12 Mar 2026 16:48:57 +0100
Subject: [PATCH v2 3/8] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-topic-am62a-ioddr-dt-v6-19-v2-3-37cb7ceec658@baylibre.com>
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
 h=from:subject:message-id; bh=8u+OHH2OFtnrDqEIjHNZaX9z21vlFvfBncTMKuwpawg=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxND+o1FzUcigo7+OpmvYqcxAYzR/kPvRz7+D8z9j068
 FqQJ/57RykLgxgXg6yYIktnYmjaf/mdx5IXLdsMM4eVCWQIAxenAExkCS8jw77vIdWHvxouk/9g
 d/ibcr/UIfXw6bL/6xmfl6854S1tdJHhn1lYe4xq+UpF+Q3/YtVyFrn03Gh8UduyOuD33prpncn
 ujAA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_085011_956741_5922CA34 
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


