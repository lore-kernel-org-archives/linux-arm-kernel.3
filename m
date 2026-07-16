Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E4BC44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 18:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vgC7U+53BZ865eCLhftXj3EWV4r2LOov0iIrURTfB4=; b=mK8LXOUX3MK79nLwTx3IV7idwA
	1TjBK+Hbwmut9DOjb/ia5OJyEdifPnif9ma0+j/liXlg5YsvZh+ZnDd2FCYObdIrmI4lLT++7yG4u
	MrQGAxZeMv9IvmYaIvP2gGmHaUo6Ucy9nbWzJVTtFJSYQ2/3Fi5V/mW9WspjHWj+C0eMFoXoDaROE
	bRF5JvbOjnlfNQlMdzVqvSTxSVGoTBY3D46F4owGQnMA67OUxTSf5UwUl21RRi2JWfnIVkJ++k0DW
	TTOxZZ7gB1erwCyrQZTBR2l3zB8268UUueZWKZOaKgHVoVvIiKI23LzM/EOjoKLVDcDqdwBSxHlf1
	pPKifWsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkR3M-00000000PvI-228o;
	Thu, 16 Jul 2026 18:43:24 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkR3F-00000000Pr8-19jl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 18:43:18 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-493f75f7172so51396755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 11:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784227395; x=1784832195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3vgC7U+53BZ865eCLhftXj3EWV4r2LOov0iIrURTfB4=;
        b=cX3M636IDa8LmVlBgZTolPTThSvBDlIe7LErxIo0JzaaDHKkb9sE3SxZTU5nNaZsMS
         OwT0BR+PahksufAUr6MW9v58dI01Ht/dlXrDll84MwRrMTLGQhPPe1EOitmCauCXXzba
         yFXDwSeg+F75tL5k8H0BB7YyB/emDa61Gyr3fdiMEr4a4L9+zFFVCxTHmupd7xif5En6
         6NH3v0dPGLaLJgmW2ZRcNxX5uMDEvBaPXspsTwPFHqvym9d0mwVzkySwjXgHWz7G3f8d
         6m/lOn6pujpU38xQYiHN/24xhh6A0SyLdvf/aE61TsoYcfO6AN2qp3xWpUldbeg+S1+d
         DOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784227395; x=1784832195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3vgC7U+53BZ865eCLhftXj3EWV4r2LOov0iIrURTfB4=;
        b=sjI8LxDBkZxuii93ofi1qbU7oXs9SxnMh/VJCUgP3LZN+qbAbsS7pKp6LSPP5+pmZm
         On9RyvscBQUQ+g0q4cni8a0U4D/rb2Vqg2XZqkZjdkemN5ENDcxAoYHfvSsrjuQzrU+8
         falCPqb5QkxxlEt3Cbne2MH1B0DXriVUxyJkQmBgDTjWDjn37bw1lf462kUN41dFMonf
         /bkl1r7ccawzUmIV0OIY+bazWQbX1ec+GY0sdZbcrcvyjbzIJO8/5yZU737tVci5msat
         xEwzhpMKbTRkALYpOx/jctyY6biGabBHPVIWJvkAfl8eSSGBlFlDs6OBdsJZmQnB9jFf
         ow5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrl8WKmJHWdJ3d3c6wwTg/+k+Pr2rPtb7uyM1jFWgfh6LuJQuO3PwLVX9WZDQTNcUlEd4Rti5t/A5CZF3BL3l8E@lists.infradead.org
X-Gm-Message-State: AOJu0YySYQPXHz+40rlX0ORJxg9XsWuavs2wVdwif3GI95YSJoIW1JDB
	7J5ZfFIoSMgxEhDbd/bAas6SP9HG4Qj1opA2yt9fHRQxvBVHwHeOv7H0
X-Gm-Gg: AfdE7ck+eTJjoZgKop/Lgb0EJEc/lZ3ssrey4oaf7h5pOZDQWdWlp5CyHugjQGhidNv
	omx5s0GAFvIcYcx9m0DyuKfHqdbrdGCZm72uv68ia5lnZLMSvBcvgfjWO0zI5A2h1w53KisNmcu
	3K5mtOT4hiOitLIqycg8Bp/g/9FqlFeoIAz7cyWCdi0xnLdENgoxOe28Y5vE/VFubXKtZMDazSu
	1o7UqIDM/2CffXv62YcwPDnl2k7l6z29SO9CLs9ux2I90F9VMu0MbpzsQBkfhLaBRuwWx7T0eRg
	/kJz6ToFqrpC4jtkpsn+E+RiCipRZ+yJmiFCMz1f1SbNby9OUfQlUgcp4/R1+l6vFPA/FDKSFLA
	tCMQzULUsirSgibU8wxtkGFzG8ziQr8upHRmwwV2dZOh1YoUjhFLreucbW1Pl9trzgn9xI7qG/5
	Z8qrQa
X-Received: by 2002:a05:600c:828a:b0:493:b84f:9c28 with SMTP id 5b1f17b1804b1-4953c1452admr92988135e9.4.1784227395299;
        Thu, 16 Jul 2026 11:43:15 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:b22c:3845:cef5:c42f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e7d799sm72404615e9.3.2026.07.16.11.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:43:14 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 1/3] arm64: dts: ti: k3-am62p-verdin: Add NAU8822 Bridge Tied Load
Date: Thu, 16 Jul 2026 19:43:00 +0100
Message-ID: <20260716184300.85413-6-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716184300.85413-5-ivitro@gmail.com>
References: <20260716184300.85413-5-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_114317_331156_54121BFF 
X-CRM114-Status: GOOD (  13.89  )
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

From: Vitor Soares <vitor.soares@toradex.com>

Add a device tree overlay enabling Bridge Tied Load (BTL) mode on the
Nuvoton NAU8822 audio codec present on the Verdin Development Board.
In BTL mode, the two loudspeaker outputs are bridged to deliver higher
output power on the X28 speaker connector.

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile                    |  4 ++++
 .../dts/ti/k3-am62p5-verdin-dev-nau8822-btl.dtso   | 14 ++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-dev-nau8822-btl.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 371f9a043fe5..f2db3c878993 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -78,6 +78,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62l3-evm.dtb
 # Boards with AM62Px SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-var-som-symphony.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-ivy.dtb
@@ -274,6 +275,8 @@ k3-am62p5-sk-csi2-ov5640-dtbs := k3-am62p5-sk.dtb \
 	k3-am62x-sk-csi2-ov5640.dtbo
 k3-am62p5-sk-csi2-tevi-ov5640-dtbs := k3-am62p5-sk.dtb \
 	k3-am62x-sk-csi2-tevi-ov5640.dtbo
+k3-am62p5-verdin-wifi-dev-nau8822-btl-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
+	k3-am62p5-verdin-dev-nau8822-btl.dtbo
 k3-am642-evm-icssg0-dtbs := \
 	k3-am642-evm.dtb k3-am642-evm-icssg0.dtbo
 k3-am642-evm-icssg1-dualemac-dtbs := \
@@ -372,6 +375,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am62p5-sk-csi2-imx219.dtb \
 	k3-am62p5-sk-csi2-ov5640.dtb \
 	k3-am62p5-sk-csi2-tevi-ov5640.dtb \
+	k3-am62p5-verdin-wifi-dev-nau8822-btl.dtb \
 	k3-am642-evm-icssg0.dtb \
 	k3-am642-evm-icssg1-dualemac.dtb \
 	k3-am642-evm-icssg1-dualemac-mii.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-verdin-dev-nau8822-btl.dtso b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-dev-nau8822-btl.dtso
new file mode 100644
index 000000000000..e4b662519a6b
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-dev-nau8822-btl.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Enable Bridge Tied Load (BTL) speaker mode on the Verdin Development Board,
+ * combining the two loudspeaker outputs for higher output power.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&nau8822_1a {
+	nuvoton,spk-btl;
+};
-- 
2.54.0


