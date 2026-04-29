Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088F8CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 13:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrhzQzY+SFxj7hTi5Z0y+DFAQM4RDCG/dTmsNuzfWXc=; b=xa6dpIx0JN9T6jfQnzLcY3u0ux
	+472MmoUordHRnOp2ZczrqwWvKDUUFULSRJ/3gRawuoYIXS9abWIggB0Y3yIwaDhfjrw23FwFqesa
	upUqNWFdvrpGnzw4BDHpPtUxNXpT7ZNlbXu5Z7X069z9BgoqFI08ofFOVcUzU3RPpQe+Hol2AvddR
	eQRjPw6UedjOlUTchs0LPPBHddN9RJUNlHofY7jhdG9KrYjadcVoLkXTg6yn4DhnYP4Ulox9r2xG5
	va4qLjlCSx2MbfBJVmmRgUR2U6b7/5u3eGhiZK0PXgB6EED0nSIgL6BaSqhJMui6+GDatT2XlSbNJ
	g+6QWHmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4sX-00000003f9R-0A0b;
	Wed, 29 Apr 2026 13:23:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4sV-00000003f8I-19kp
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Apr 2026 13:22:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=vrhzQzY+SFxj7hTi5Z0y+DFAQM4RDCG/dTmsNuzfWXc=; b=fq6JuJZUBcby9Tm6oMI8azahmm
	HcqZ2PGy5vIo1EM3DyckW7fFSgnN5o2k/aV03a2gjH128HkF5rOigkIDM2qpmsDgQ4f7KwqAbyCbM
	5iJJ28duC77ymRgKazSaddL9h/4QM0kTbslrLjOCEmWeQTOepX/RdmunfBRV6pWkox2tMwdi7b/2m
	04/vShp0U2dcf7sF+dkzzM0oAPmN9oFfKoZcDngJKD9h1htUPZd+GZAUq2c4L3AH7pdiuiY9IXifd
	KNFzKB2SUIguPoUZdXaZncyoTIvDjl8dMVo+Bjlpw1riQWXjbnP5J3jMzEix8nW0o3RBPm2jANkJN
	Y6tsCn7A==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4sS-00000005Nw5-0fU0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 13:22:58 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso104210225e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 06:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777468974; x=1778073774; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vrhzQzY+SFxj7hTi5Z0y+DFAQM4RDCG/dTmsNuzfWXc=;
        b=Xeo+qpNfdDbKFY6i+GceHNtVvKE+suBl2K0PfdYduGeqoglIMhrp+8V0Cd9/QXqpuP
         QjV4ZivkN2ndF1ewF7zN0W9hMvifjvqZwyPVgfrRj53S9urUqEesKkC8b7VKhS1ea+dL
         mlRSZ6o07+CRG6eKyhTpXsB2liedq6NsWatYgBqb0URQal8iUgA92aBArZFWgi+JavVC
         Ugr0POujUtD8hz93nu2D09yvlsELn8vg1+CERMshrul7YnAcY1c56kTxr0OOMz73aKQt
         IimjxbCWmzJXc44PQvWIwQkMEX0f7YKWL7+tQSmjleBbNED8K9sNWuVbbpQzo7yQK1Lc
         E6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468974; x=1778073774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vrhzQzY+SFxj7hTi5Z0y+DFAQM4RDCG/dTmsNuzfWXc=;
        b=ji72mqb7MM2BJHOZDr65jzliu1ICZjNAmKaDPwZxAxlo3PT1a3Scgboj8GNwO9+Ycw
         GPBxtJooUlhECvWrpOjwp7HNguET9dKuryzLHpxmGIbD1ZglpDa9jbImBbjaaPcfMti+
         zgNiBi+poVrIgZWYmYxwhcR3VR4fZqrVVLMlnQVCxGwXNy824enXPkMehb0CANkxEwEL
         v5nY/Jbt9XVefKuLgiqOCm+uNwzZax0gWiuK+wqSHMqqk1A+YgyAzqhvfDps3XQlKPH9
         vkSzy9/VwJVTOdbzqZYlrF2yXfIdaXYJEBj2FR+30hmKg//j2gtlZQAybXzhTz628kAe
         6S5g==
X-Forwarded-Encrypted: i=1; AFNElJ/xJwm6nelzo37PvdVv3C64fJnciZ0xjOM3YKCX64z3eztlrXiyN5JWLIYoGLOURSpKOlZIuFfDGNOHOSjWep+P@lists.infradead.org
X-Gm-Message-State: AOJu0YwpuPZW+32Yz9S3q62SCm+opLDk77pBPC8P2aEh8ft4TGGdwB2H
	5DOhsFX6YalfxffsnjVxFl/DF4M1fyr0x1SZhBv2mdpcQgTkr1K9s7K3+hf4sQgNqHw=
X-Gm-Gg: AeBDiesLTB83+hILh5Io0jFSLBtJmqx5oKMPc1jJAeZ0vYj0WSiU+lwN7c1sEI+HLMV
	C6+BuUGUAAQKWo3nTCexg+BM4zVSRpH9iOTi/4m9jUiBTAb/8ixdMGOH4XBMKCHCW6ux4sBjCUo
	v4mlfecJGgEA04tDWFgVlPr5GThqLtcF+1MbWmrTFqD9remfuApSXRwZmMHl+gC89oNDa7bs2Lb
	UsbxiscePpVw3f4zMCtgPkp5T70IOqONJbNqa4MhPt4R6kz3GnbWPMOnzeiFybNY8mRkx8Y3JvF
	L1mmGND+ZNnEJje+kEk96Bts8gwb2THpFCrkjJpahkFFMNTS8he247Xy+g5sH3BxiiFZdIAIhkL
	t0ItoSjzTyrK4Y8iYXlAWeHW7pOlpdq9qVGGc3Rzo3d42mjF+q0i3QS4s2oTTCzVpkMXw6g2eJi
	mGAuGgiaMHEEVWo8jIwojdCiGq8WCOKKjEWCrFxf9rkg==
X-Received: by 2002:a05:600c:609a:b0:48a:54a6:b29f with SMTP id 5b1f17b1804b1-48a77b1da9dmr117530135e9.17.1777468974486;
        Wed, 29 Apr 2026 06:22:54 -0700 (PDT)
Received: from localhost ([2001:4090:a246:83ca:1917:a47e:1872:2063])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b72176fesm5619258f8f.17.2026.04.29.06.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:22:54 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 29 Apr 2026 15:22:09 +0200
Subject: [PATCH v4 2/4] arm64: dts: ti: k3-am62p5-sk: Split r5f memory
 region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-topic-am62a-ioddr-dt-v6-19-v4-2-fc27d6ac753c@baylibre.com>
References: <20260429-topic-am62a-ioddr-dt-v6-19-v4-0-fc27d6ac753c@baylibre.com>
In-Reply-To: <20260429-topic-am62a-ioddr-dt-v6-19-v4-0-fc27d6ac753c@baylibre.com>
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
 h=from:subject:message-id; bh=NwbSyCiqLGeKdK60gi64/kirGNSyXATr0VwfsBib500=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxPbMIsItsZVnyaFb/TiMfrZO/B/U6/O9SX3rbavuO4n
 t+Omj33OkpZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAife6MDNtz53g/8lr6/NHO
 e9t+GH5NdhO5d2fe4tD8ms8/rMI4Fp9gZLjU/mf70c9XOZiXJXZ+tApXMrfvk6mWNL+uUho1yU6
 +mBsA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_142256_470497_EC8DB926 
X-CRM114-Status: GOOD (  12.15  )
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
index b770ed82be9d8f5827c49ed871351a6423db8026..e67489a178f2a2caedf1306e1c1c9dd6a95745e6 100644
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
 
@@ -844,3 +868,15 @@ &mcu_uart0 {
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


