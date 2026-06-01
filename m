Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC54CD6E61
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 08:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VnXbjTKMyn86FuU7uk6pAXf7Et8qNHJAEHLholFJyMo=; b=WPtQqa8YhgdnfwTlbR4pPc0M69
	ur21eJK+43L1HVCKCKY0Sd999LsPq0uf1Pn1QbzT9eBhvaBKE6X3Sk8Zngmg2q28DSyfdDGxxMyia
	CSHz/OtPwjuihDtuS5yFEozNteuY0ZEpSvUeaiacFIL/d6uUtJS6xoJTUFbBWMilRXSpUGteC8NnW
	cH8ZEK0Ouzyd7n04uuzCI2Lz0OmuriGtX1AxnjSO7n43zc5ZogDilpJgSUQOG9AuftlwCgiZH/hJk
	H8lZnz1bPOPNy21o3A8YmDfXNc4qJ0UWvvYrahif52UFZZgNYtKZBpHeYQxFEMeNGzCyYDoJ78/iK
	2YTLpU9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyIZ-0000000APAo-1FP3;
	Mon, 01 Jun 2026 08:47:03 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyIX-0000000AP7r-0ayH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 08:47:02 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-490a7629380so11017955e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 01:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780303619; x=1780908419; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VnXbjTKMyn86FuU7uk6pAXf7Et8qNHJAEHLholFJyMo=;
        b=pSbuyHVLQ5i5fn/ZPXc2sPxKB8bfmgmadgZRWGESeJNQtTpEjMW1y3x+pF5ZKyi0D7
         Zno3XL3K2Gu82qzkHTdftIKgpnywJTWG9U3uFhNLpwxUOSN0YNrDHVK7wrJo43SmjOMY
         5XGQ2YnGUdTJuiAvN140svNiQoxQFuAZlOmOfnx0s4+To5JmfgQn/NY8KbtiILCKTr06
         B5P1c60tUvp+pNTMOwZgJjazuUw9XqPM7RYkJFqsFvBDxgJm5HJaYjyg6uCXcGOHElCm
         4Qlh0C14SZvfm1i2hTBRN8hEelN4kEArov6gWRECShgvqaUeiQ5xus7FemsPIOsCvKYK
         TRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303619; x=1780908419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VnXbjTKMyn86FuU7uk6pAXf7Et8qNHJAEHLholFJyMo=;
        b=paZDP2atVbmBL9mKqAQKf7VjTeWvN7BA3uv+7L6RJIkr3Jj3DSL9fUZhrnrQRDbvpS
         gQM0C6dXtjvxn0rrQVYBdhJj23XOk6mW3UadGiGVzV1/vlgkNyDTAkWtDjUUmJK04tC2
         FshvxT9X/+UYpP5Ol+MIdND0K9rsga333CurTzmJYpE4Xh0eS/6xSsHKNHR/lbZqNuTe
         YG5t13TXOJMiKfRb/IoTGhelvWH3ScmC256DhkawhC4RpOUC2eC6s8xrJxCMWWtVyvhx
         vDl2Ucte6s0dPA2StBi6NOxLbLOyhU6K+bi/8tt8RdZdpLBXWyXA6LLkyVk0G1ivTEDq
         PI9w==
X-Forwarded-Encrypted: i=1; AFNElJ9QUuC1Xeuzby4BgHHmhnMsz+lTPQ0YEaMP0U0ssBiPZ4PGw1jmzunOVr3elvUL3+MF7L8ZE4vOtc7QZvgXKPwL@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6mcuXk1XPl908CzZGON+CgwYbEAotmSo8im/Dyz5idG9MtyY8
	LMvArtNlV+DehAdPjB00C6dxcJJgZjeaBI22kSxQlVurw7yJ3OAZZf4uyQrOcD1AcKg=
X-Gm-Gg: Acq92OFq0L6MoK56VmldhlpKK+pKCJYYW1udXCM3LCZTy0f/0VfxH0FlrInYyzinmk6
	hFdy/9IfD32y4+15q/0BHIJaUJmVvildARPAcTjYWgOdk5yu0AiXSbHOE36b05BaAosuce1QHC9
	tnwp2i1YGtYvPMfJks5Is35zA3bsNcSoXezBHshlugkYpjoKXHEk0y9Y8AXevCINigx47wHusT4
	3YUDOVg3YAKSY/MGgCH9BzZ0znwklGrLWYm8j75T6JrCpmXIur03Dy61gZqyMmpXo3WuevrPfgd
	49Z4gvmVSKeawzu43wg7aD7ATWfDAqrrxuHirj4GNZrgwihKI3Kuk973M0O/WwhrEJ2KU0v4fWy
	kGI0k4uqSefRqKk7Kl2PzfbcLT72RwiEQhqbZUvguOplVIyPCFGiGh/gfytdCE60+iUPyTEig2o
	6CLAl110NcCC0+xKe1KDVIqXBg13zEM+bbkrA0GI6dyw==
X-Received: by 2002:a05:600c:1c14:b0:490:a646:9d74 with SMTP id 5b1f17b1804b1-490a6469e64mr161541825e9.4.1780303619566;
        Mon, 01 Jun 2026 01:46:59 -0700 (PDT)
Received: from localhost ([2001:4091:a246:8595:a745:3210:d732:4094])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ae39c281sm15309795e9.14.2026.06.01.01.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:46:59 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Mon, 01 Jun 2026 10:46:15 +0200
Subject: [PATCH v5 4/5] arm64: dts: ti: k3-am62p-ti-ipc-firmware: Split r5f
 memory region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-topic-am62a-ioddr-dt-v6-19-v5-4-3856a023aff2@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2397; i=msp@baylibre.com;
 h=from:subject:message-id; bh=1mkTpVi2VF3boKQNNq2NjAYKBhxn5zW6guol+Mp+hr0=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixZt7ez3qbmc3WXb9zmmHPWiOfjNNvES/1rXY4l9M14u
 +fM/FXvO0pZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAikWyMDBcK7JIfPlMIT3ie
 HrT+7vTUgGM6/gdaU9pfWHr9urJftpeR4WfR1a3nb6Xlt2eXxBcpPThb0l5r/OeNQuiC2k0tdhz
 pjAA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_014701_211772_D89F9978 
X-CRM114-Status: GOOD (  12.12  )
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
 .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      | 38 +++++++++++++++++++---
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index 12902231e58a7a958f335096047b0d2384dee722..437b1df02142c666019ad4ad3558fa066e04781d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -24,9 +24,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
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
+		no-map;
+	};
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
 		no-map;
 	};
 };
@@ -56,8 +80,14 @@ &wkup_r5fss0 {
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
 

-- 
2.53.0


