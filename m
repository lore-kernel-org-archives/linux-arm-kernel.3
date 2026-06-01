Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B37CD6E62
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 08:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ypjTwr217bx6Ztde7fmIDAdz9Zru4N1aFxfAHxMhjg0=; b=fL8QPikliy2nmL0oqzN7XYxHTM
	CqUkuBRbsvem9Ef2lFW198rTxStWrq6hFFU8b67CECDztEAVX2VoYV2WzQUCAPD/zTPMDFaNn+Gu8
	js5Nw7hM4RYbYuzmYBrJuKInMaQkLL5zsJYTs8QhzF4+syFA9X2v6OAGOnfKJzgE4vFCrZCVuDD9x
	w5L6Hm5V2lCajhEsZKX6lstssdgLJB5K+/UhTCyLK0NIxlQ9HJUiVPcL/ykvNI/QfKGuH9InzqFN5
	A8wh8jXqm8SIYWONm80EJPbohuB2KxdFcNuvkLpgnhhrxr5ANpEQY0MACFQUfqavg6c22yYi0W/4s
	iMpsIefw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyIY-0000000AP9i-0sh4;
	Mon, 01 Jun 2026 08:47:02 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyIW-0000000AP7q-2iKA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 08:47:01 +0000
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49050ff7cbdso88930965e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 01:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780303618; x=1780908418; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ypjTwr217bx6Ztde7fmIDAdz9Zru4N1aFxfAHxMhjg0=;
        b=o2zaPihhlmaYApxTQL3KFaZZYPO+jhAltXGlZ38kMo0W3AvhtB9IoTDOYRu1vgh69T
         NsbHaEcvUTwtge4uMpA+Cjq+3auwQbL5nqUqIQoMhgV6qaKy0sfBxjmOXn7yU9aYO/re
         9E34X+1RMF7zUF3RyjH8znbVxGgptx2w1PoR+gKUFlcWFl1fbeWMWNK4oijU8LAjWssd
         l64imlUiK5Rr0gnvltwG4luxRtDWEhrVqudD2NupLl4rmOL92cW9R/fCeAHDkutTfCIm
         E3HXYc/gmUNdSgOrc2l7eBMW/etoI8ux4zkgiwzyr3N3KQFBGg+Ic9JAc8NCmzjMyUAK
         Vd2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303618; x=1780908418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ypjTwr217bx6Ztde7fmIDAdz9Zru4N1aFxfAHxMhjg0=;
        b=OKJVuOVqoS0b5t8x7W8pFt5R/hy+mgnCz2g9tgUWNaaEZhU3JkXzXUHVyiF11MJtUt
         7R/Q6vzXoAkv0ViU8n94m+Uf+9SgF7zRJc/avknZUgkAlBmVVp2dutP1bqe/Rt5OxSdh
         VyNC7bLc4YUYXBHLs5JwcL4mlIS8uWm7olD6D+iVkFcGF//Ioz+umcqozkl4N5PXEjIi
         /lm5NVTBtBiS/CAFH4elg4Lr4GaAePLPwVYiNSllLldFrszybH3QvVN58ExKqQrrPzOF
         cTrWi36Vgqg3HWR4qiZkVAnS4ngv/8dWwXNVRACCgeYGVzRa65D3kV+b7RIkhtOlPFqh
         IXmA==
X-Forwarded-Encrypted: i=1; AFNElJ87Nlsb6vdUe1cPohlz7C/Fmavh3Ni/Sq3/uckpAlSKfc9a5btsnFWUVoOQUVg3iiZiSygnzXP5VPKtTWFl5Odf@lists.infradead.org
X-Gm-Message-State: AOJu0YwgDjFsyzdmlPsYX6eLZrCiCzhielcn5wHc7G8NlNmwA5UizN+r
	T47JWecKMFbX2iAw5ZUH6XG66sGfvlqFysZZI3A6QqjT0HniO5DCvK8yG1cfLzYDyoY=
X-Gm-Gg: Acq92OFeMnDB+EMSL/KrTn+GoSabcP/k9MtIHbtm+oOKrWG6jtt55MPzTrjwd2uQ9el
	UNQnvChNNqMcqGQ0Ns40XH8vNK36NEpwhu4B0o9vnVxeByoU/soWBOyQOx5VN5qcNuY8XIe6IAR
	Y29eid9h59vytFRHqXyz2HXE8ge1DoAYdBno74hHeJSdtLfkPTmrNGZv9WHl+48PVYYov4Q5SZK
	UzecNcYBZ0KvHWfrNKbNnnwwUz2V/Xjrvws/U172BMda89XC/hIWAv80agC7o4Zfqyjyvu6ybvC
	Q3lgUOq1tRuHGDZZRiuZQFPJbTxI0wfFpa0XgbcTQ/9cqitixoHGNZN2WQL4QEghyhbb9AfqODb
	JEwltRldKbMMIGhxPcBfMwDtKF+iGkfBajMBnRpval9IUnOEMOkY7xayf/TvaLUGcJuPiexQg1p
	YR52mm/gYkpPqBP/aKElRXixezNX6aboN6/R/2R95mQQ==
X-Received: by 2002:a05:600c:c108:b0:48f:d612:3c4a with SMTP id 5b1f17b1804b1-490a2923a71mr137138235e9.1.1780303618389;
        Mon, 01 Jun 2026 01:46:58 -0700 (PDT)
Received: from localhost ([2001:4091:a246:8595:a745:3210:d732:4094])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490af364371sm31585e9.19.2026.06.01.01.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:46:58 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Mon, 01 Jun 2026 10:46:14 +0200
Subject: [PATCH v5 3/5] arm64: dts: ti: k3-am62a-ti-ipc-firmware: Split r5f
 memory region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-topic-am62a-ioddr-dt-v6-19-v5-3-3856a023aff2@baylibre.com>
References: <20260601-topic-am62a-ioddr-dt-v6-19-v5-0-3856a023aff2@baylibre.com>
In-Reply-To: <20260601-topic-am62a-ioddr-dt-v6-19-v5-0-3856a023aff2@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2464; i=msp@baylibre.com;
 h=from:subject:message-id; bh=30BdNR/xbGVIKnyF1/2jhh2h1Klijxil3BTcH8aa/ZM=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixZtxcKbnPUu6RO/tr92is42TRCSpJZyWEBj0hHegVrY
 7p89OOOUhYGMS4GWTFFls7E0LT/8juPJS9athlmDisTyBAGLk4BmMhZI4b/cZxbdGrnu562efzi
 SalCAefr9QqbtGIlW4oXBVYf1DnowPDfcdEhrrb/17tXc8dN9Vti7K2Zunlz5OnmLxv/9Pusv/m
 cFQA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_014700_703408_A69A2FB3 
X-CRM114-Status: GOOD (  12.16  )
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
 .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi      | 38 +++++++++++++++++++---
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
index dceaee6ac57b01a280e891f70587a679f5b732a6..24c4e2ec091c3f66e51b4af1b10bea0d0ae26ceb 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
@@ -36,12 +36,36 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 		no-map;
 	};
 
-	wkup_r5fss0_core0_memory_region: memory@9c900000 {
+	wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 		compatible = "shared-dma-pool";
-		reg = <0x00 0x9c900000 0x00 0xf00000>;
+		reg = <0x00 0x9c900000 0x00 0x100000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca00000 0x00 0x8000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca08000 0x00 0x1000>;
 		no-map;
 		bootph-pre-ram;
 	};
+
+	wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca09000 0x00 0x97000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_dm_region: memory@9caa0000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9caa0000 0x00 0xd60000>;
+		no-map;
+	};
 };
 
 &mailbox0_cluster0 {
@@ -78,8 +102,14 @@ &wkup_r5fss0 {
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
 	bootph-pre-ram;
 	status = "okay";
 };

-- 
2.53.0


