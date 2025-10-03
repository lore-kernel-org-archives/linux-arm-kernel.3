Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FF2CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 12:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WaXfwSB/FRGqmKy0Vb2zzmiYO4dF/Wx+pD0HOeUkg6Y=; b=lSJjKW7bS1ZQkSG6z8IQLndujc
	ADCJjHJlYAzfqRQDeR266yophqCGVUNLWFAfZsGoTHcbzrLVE3yug0vE3KxF46rh67bbVh4FF9ZH9
	J0ugWorRdeokIdrBPg+ouYurkyj5zy9RPzsyinf7/oN8w0MyvUhIq19rD2kLjkspFeiyFXfqBVhWS
	p+xkczArytKy9KXK5IFhLPn6y5DX4M/XjF4nPt3EtLzgE/rLZXd8y4IAUdbOBEJGAc0tHE1d5Yu2N
	hHVWeVALGHmJCtgIVp4qOyhYPDvgl2PNclImmWDa/BmLjotxDmGlwcqElKT5PzbICfvJ4MWAW1XZe
	S5xfFWyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4fFZ-0000000CIin-4Bw8;
	Fri, 03 Oct 2025 12:51:06 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4fFW-0000000CIhT-1PRr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 12:51:03 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-46e47cca387so23630535e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 05:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759495860; x=1760100660; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WaXfwSB/FRGqmKy0Vb2zzmiYO4dF/Wx+pD0HOeUkg6Y=;
        b=LMDgJBARyZqmmeMMugpMoAi7lwC7Glttz483r7ptFQCs+Td/wIUh8lCdeYewpKbxI0
         s3R2zTQyyu8+w9t2+l247XTtYsWv5FFK1H/IvXGdR1YKmUUDpqGUEcOnbZN1xuEnyWxg
         zmV3nKkDe5Rwp+WAwQwSiBe/kZ+P6C10P/+6ysusMhGAvepdj9NrsEsXEQTU7r2HzoRb
         JZ6he9yTQaTqYfrc9aALSB5sU9i7MwVSIYWbgC7tVNjEQ0VHNeu3eSzVKvFh4zcw3v1r
         W5YT0/K5QDwupXdaCQz0SkRc1aiuQ3BK1oM46Q+eK4gq0YzCJ+Ejj+iiy1Fo4suDQ9f6
         aIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759495860; x=1760100660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WaXfwSB/FRGqmKy0Vb2zzmiYO4dF/Wx+pD0HOeUkg6Y=;
        b=mcg3/t304mdqb/u96B0CFi+VkfDBtNUBt5Ah1yWiPBoikrbiKxXVQJcvlYfUixf4+6
         Yjy8k/qtJn7ZF+fVD+FbJCXYdOGnbGhbQ04XhUN/yeL8w8bX5dHt/6/n/GlK+n7+Vg8d
         grsMZLVhnE69Vpqb0OrQEjIn0/DbCQO5qNA03B1YBnDnWq7A7AN52wXi5RVDYoAZ9VGk
         PzkxuSM74gJ63q1OgQQ4b0Xaf4tDrH8RBUtEjAlbnqotN27QP/w40gYk/GvHnv03TfiH
         YtCZYyzTBJaL49oBdjFgCo1gS7Yb7gklx7LVEztMOhbfu5irciM7H/bc7Y38iJBWD9Cn
         0mag==
X-Forwarded-Encrypted: i=1; AJvYcCWLEx8LnWuCv9EJfZDFrHTbgRT3nGa8m0zrHRvmBz42WAkYmPUigRkTn97ylQYzIZySag5+BB/mPJxs3E+BICkR@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/oA2Fn7xRcgFd9ft/vSZeQTcd5NSh3RpitKDGBsk11RE6vc5r
	J8aL1t1ekNbVsb06Q6ZWdkRUdDew2UBp8uJROg3lkFB3K0ysbR10f27Z
X-Gm-Gg: ASbGncuLiLGptkIkpIj2POsNcaELmWLfrHKYP+7oTK1tuOxryTKdN/v1y6QJ+CyE7h7
	qXkMtX4GPMyjHRpgWDGhBcCCH5C0r6FjbeDExJEHUsF3UDw9mKzZcNLN2rHbrMikRsYGiTJO6w4
	Odt4cPVaBr/jro345Lk2hkOUF5LDTLxFRMlj4SOqoKGgJr3qxyRT1ABLXtCBvL/54e0cBDpxdzu
	CiOeh3DA3vGhiju5wWsQQStM4gnxt1Hyrlsfhh+mITEhbs2TvKn1Bjf8AQu3+PVtjirMnyCBjdJ
	jalxzXaGSvXQVC4eWsu7RLzMplTxD9i7qABxM6F4ob/b0E3QjnBYZq/9M/fuwU7G90vYJLNwq2C
	xluTeLzWPOLkPGBu7l6wBYbzx6CwP7q0NCH4ItfN3bepC4zPfFjl8I6Lc3J1sdByFYxntyz5THq
	o9SNCe
X-Google-Smtp-Source: AGHT+IFK24Hmy9qDQXQFVbal729f+4HuhDIUzQDqGeKXa8THbxiFFtjcu/scKAzTeHzoz76wi6we2g==
X-Received: by 2002:a05:600d:4392:b0:46e:74bb:6bc with SMTP id 5b1f17b1804b1-46e74bb07ecmr9696025e9.5.1759495860204;
        Fri, 03 Oct 2025 05:51:00 -0700 (PDT)
Received: from localhost.localdomain ([37.159.33.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5c40983asm80598605e9.3.2025.10.03.05.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 05:50:59 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 1/3] arm64: dts: ti: var-som-am62p: Refactor IPC configuration into common dtsi
Date: Fri,  3 Oct 2025 14:50:27 +0200
Message-ID: <20251003125031.30539-2-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251003125031.30539-1-stefano.radaelli21@gmail.com>
References: <20251003125031.30539-1-stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_055102_390698_1166DB37 
X-CRM114-Status: GOOD (  12.35  )
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

Update the VAR-SOM-AM62P dtsi to align with the refactor introduced by
k3-am62p-ti-ipc-firmware.dtsi common file, allowing to remove the IPC
nodes from the board file including the new common dtsi.

No functional changes intended.

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 52 +------------------
 1 file changed, 2 insertions(+), 50 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index edaa4f99295d..b93372f22732 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -63,18 +63,6 @@ rtos_ipc_memory_region: rtos-ipc-memory@9b500000 {
 			no-map;
 		};
 
-		mcu_r5fss0_core0_dma_memory_region: mcu-r5fss-dma-memory-region@9b800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9b800000 0x00 0x00100000>;
-			no-map;
-		};
-
-		mcu_r5fss0_core0_memory_region: mcu-r5fss-memory-region@9b900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9b900000 0x00 0x00f00000>;
-			no-map;
-		};
-
 		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9c800000 0x00 0x00100000>;
@@ -320,44 +308,6 @@ &usbss1 {
 	ti,vbus-divider;
 };
 
-&mailbox0_cluster0 {
-	status = "okay";
-
-	mbox_r5_0: mbox-r5-0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-};
-
-&mailbox0_cluster1 {
-	status = "okay";
-
-	mbox_mcu_r5_0: mbox-mcu-r5-0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-};
-
-&mcu_r5fss0 {
-	status = "okay";
-};
-
-&mcu_r5fss0_core0 {
-	mboxes = <&mailbox0_cluster1 &mbox_mcu_r5_0>;
-	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
-			<&mcu_r5fss0_core0_memory_region>;
-};
-
-&wkup_r5fss0 {
-	status = "okay";
-};
-
-&wkup_r5fss0_core0 {
-	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
-	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
-			<&wkup_r5fss0_core0_memory_region>;
-};
-
 /* mcu_gpio0 and mcu_gpio_intr are reserved for mcu firmware usage */
 &mcu_gpio0 {
 	status = "reserved";
@@ -385,3 +335,5 @@ &main_uart1 {
 	/* Main UART1 is used by TIFS firmware */
 	status = "reserved";
 };
+
+#include "k3-am62p-ti-ipc-firmware.dtsi"
-- 
2.47.3


