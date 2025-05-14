Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD95C3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 09:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/m+AYqPg8A8mlOIVXAz+KE+GHEig3We9H42iLfgbKU=; b=e73aHT+uxvIzclkBNQbIshECxf
	XPjQRe/uOE+F0DH7FxIeonHEGK/k8BDNycOpGfyRRJ9eLXGPf6cDnelewmA1Q9I4x8nsypaR2b0ea
	gzzrzoFlxPSZpOt7/0VEj54PruXea9sz9OGOrf2yWioooa2Dwd/cLL0+CZYYodVnHuA5NJbaAAicB
	2rm7t7GmzGJg5ejQ70G4biMSkehUbhlie5uccQM9P63UBeL3ix2toezugtaw5mV0YEvLbtG4GXuTY
	LhIVQsi8JtkpBYl57rqKy0kiMG55k9WlNZiSRp9yzg2ZxAtndVe4Blu5/XilQB4zBJnmOhQmoZ048
	lrOj0dOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF89I-0000000Ecji-3rjD;
	Wed, 14 May 2025 09:11:36 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7QT-0000000EUdX-0aYQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 08:25:18 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43ede096d73so44979375e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 01:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211116; x=1747815916; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/m+AYqPg8A8mlOIVXAz+KE+GHEig3We9H42iLfgbKU=;
        b=gVk/GKSoEshdKoy+iMB02s27ej7LbLxRa0CGhQi9GU+mGpxO7Y6IwWKKk/+HxOCJYG
         +JOIisNnpT0EyoFNf7Z/abujCE6JG+Avx/GSl+VAMTIeFwxTckqQFh0fNXFPr/wPEzZw
         tm1pAsWs/mmRorReX25mpNTRt9GUfDJNbzixs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211116; x=1747815916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/m+AYqPg8A8mlOIVXAz+KE+GHEig3We9H42iLfgbKU=;
        b=fykx69JtOAyqXdNez9wRwXx5PPee0qVxc0TU1Veggk3yQQ5k8au1lb5cwc6QDDeGgX
         pYDrPcP/K4ZKQAnXrd4Rbgdj+pmKyVNJw2yTkGP4uydV7FuAq2tUBk8s5fGx+4z6GzP/
         iK3g8fpGK58nsqL8JYgwpmRTiO/D0Bc877p8NvhPCzW3vRJaRwc06fn+nh5K3xqOZWOn
         EKfdLLg0LLDnHRIoarydbn66Edz7Pdc7kWskjufP6RzTcL/Rxevk3E6U0S3Zo/vJVR80
         DR+lIHRLxAQZnJ9M+PqB4GyPnDsnerBFKzStvRKrmXDj1Zsn3FlD+bKMnieEzN3AbHvA
         pZPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhGgnX15iE2O5HBp4NhsLuknteP9OkouiRtimuF3LeJ18HIIhQPdsQG914KrYEBwgRrLKZGVPktgPibJGJmBqQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyoDZtcPE2ovxjnvlRX4aZLvc1q7thL6McHPEqmCm9qs+PhaTXM
	psK1KZXSVwX6s+M+lOyINUqDBkNAPgLYhTa4RNK278d1cFp7SVb/qEbkmljn+mc=
X-Gm-Gg: ASbGnctNFjNwMsPLtKPITh0Xoz5gH2yDhCSM2wN5He0Bf4+8OhH3dKEmJJiErEk7oq+
	Ej1PykCwxIqhJXlqwPuk6ux15LDFIblzOBXev26LqNQfbcBakX7S7I+s9uZrbkaCDyBnoSEyzC9
	eeOXh0v57ghVSyDm/w3B27sGHZce5JOJxotIOSdkNpYLW8UDicQCw8u4neOzeB4qOjvojasTCIC
	8KwYIgsT5wDiBsRxcN/hBwEMSo0gdwryBBV5aMUVlWfoCwxsExWWLtvgegZv53sVV2zOaxhbRbP
	LexD8P9oNEZ2T9n9tWPdv/RH3r9onI4TNrbraMEquRGrquhwnS2Uxf6CxsxpciuOFpusYW1//+g
	Rls0fg0lfDgI3/P7EwGDg7JYxdFJWfuEZNhaAQi9EGXY=
X-Google-Smtp-Source: AGHT+IFtHHcd+lejXopr8LfFGaQVmOfL/UNHCcWzihISzr8hDJtjbOrZphMkMM72/aDayUzTnZnf0A==
X-Received: by 2002:a05:600c:609a:b0:43c:fc04:6d48 with SMTP id 5b1f17b1804b1-442f1dd31f4mr24755195e9.0.1747211115603;
        Wed, 14 May 2025 01:25:15 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
	Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/9] arm64: dts: imx8mn-bsh-smm-s2-common: Keep wifi enable during suspend
Date: Wed, 14 May 2025 10:24:57 +0200
Message-ID: <20250514082507.1983849-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_012517_179463_BB5739B0 
X-CRM114-Status: GOOD (  10.86  )
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

From: Michael Trimarchi <michael@amarulasolutions.com>

Allow the wifi to be enabled during suspend. Use case is needed in most
of the devices deployed in the field

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index 0d343ffdb7f9..a983072fb835 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -277,6 +277,8 @@ &usdhc2 {
 	mmc-pwrseq = <&usdhc2_pwrseq>;
 	bus-width = <4>;
 	non-removable;
+	keep-power-in-suspend;
+
 	status = "okay";
 
 	brcmf: bcrmf@1 {
-- 
2.43.0


