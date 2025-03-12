Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C86C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 11:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iBHq9V8lKreFqK9KM1t5HhbZfxxdkE8xQHpVyP8b1xQ=; b=HQfxXnxGYX2OdvX4PhNQyQtuDM
	r9ygjlhIbjt1qRF2JrTFAww5XCfUCnRJbpZxY9I3XQ/rLaqlTiBLCFJDDp4KgUqo/h3szSDrlIyC5
	Mig30tAx5vStEvsEZgjpJH8m55M+8fEZOZvFPX6wk6wm+AJO5172Q7rHJurvjs3BcYx9qmCf9Ua2L
	YOq5Z+xpIfdiscjxpeJIpvP6l1FiCDKWaY4HzaXO4+teeXV0KELjCxn+1rjUYjOVRFkdnjKPoAvO7
	AX9T/U+c6vWXZAPsclaG0y0ix5kV4WAUJVFNf81mt/cxZfNDU/++r5jvSTO1vb0UusEjLAKZ4763a
	Bb9/tA0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJwT-00000008DBq-33eo;
	Wed, 12 Mar 2025 11:08:05 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJZI-000000088ke-0XTE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 10:44:09 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so9565167a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 03:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776247; x=1742381047; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBHq9V8lKreFqK9KM1t5HhbZfxxdkE8xQHpVyP8b1xQ=;
        b=G+5wv9ko0ZExgKUyzKmIuLjTzYQRjEhJZr/spYMXJcmL23nWH25EnFoqHy2efVo7nO
         6rDny5vHydxHWXB4qKAlyv+FV0kpMwXfM3xs8pOCygrFGnVgOqffhkE6GowRKY0OwQYS
         N33qyNkStRfAsLjaY9OHQCy3lxFtTpGyLDyvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776247; x=1742381047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iBHq9V8lKreFqK9KM1t5HhbZfxxdkE8xQHpVyP8b1xQ=;
        b=s6vxb2GDgHX7pTz6paSJZO4MeqlZVOLvxKdrR7B0w9hoaOQIGPSFhTJKMK2SyLZ6Ik
         Zmc4ZcjOmy4LZ/vX77rAGewmCvdDTvAf14SJjciZdMnKF5l7/rpr/ZsWudAp5ufsPgwy
         0bX/c6M3ZcAyXEKF8DmvAbtLtLVIZVD6X7bhXTzYflQANRapcrN39ii64p1fp+wioMgJ
         f+TVTvpFyyJUmqqH6+x6ODF61YVxc6zJmh3Us5oSdq7dY4F95IUI1q+fhe7uHo3ctFAK
         W/zDN9BWi23tkEqAXzmbGa9blXEvH9dNCmxIvUTmcioIZQ9OY04hFt+lp+EspnGuZNVt
         CNOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC0Ji0xeGUogkDaFaCUFdkLrcDQaVb5N/i2iOhpMw4WRcse1UPERo0GAPxUno9FCkHNOowKVwL5X0ZCXmF5Jvb@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0YNhBdn7rrHYAqToUWos8PjvCNNM+7Y9NzeSdpSu812jRiiBI
	5L5aMg5pf5Wsd5W3ef+D1NPO1s9e8upNA7Qicz5PX6HUsMNSAktGtJdKvRcMOQ==
X-Gm-Gg: ASbGncv2sC2HHv55KvPQLiSfx0ZG5oBO/kv7W6DvPHQFVl0p7N6yeFTgM4vMkdR00Zj
	tcdM6Z4gfko9zsWw84/g9DXjM2jN9Zeh/u1kyZczqlx49MJpCo16DWdRC2+KuHPXSV6QPDAqoo+
	3mDFbl1Q0vJ5dmM/Z7enbQocyWQ+rKbgvCkBTJmlMpDjA9s5PQy2MDbzjzzsEnSUejeE2L1awER
	5v7CvEhwBxsFQs879w8bnnrQQ/eiGtF8fGcpozaV3IxVqsdP+G0qNjfCqrZunRXEqAy8rSm8RHw
	ReadDO3BDuSD5YpM2D0d4YrCtz1xP+hvTkOfy/gEaQoMhIpc4lfWhUuuKtNXXf8=
X-Google-Smtp-Source: AGHT+IHgEKYXDVQ8fG2MojJ+3+NZnnUhzA79ZMbcKKeZymlj+PamoGqt91exqHl5LDqK7OCjTlvNwA==
X-Received: by 2002:a17:90b:350d:b0:2ee:c04a:4276 with SMTP id 98e67ed59e1d1-2ff7ce7276dmr28891107a91.5.1741776247611;
        Wed, 12 Mar 2025 03:44:07 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:44:07 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 5/8] arm64: dts: mediatek: mt8186: Merge Voltorb device trees
Date: Wed, 12 Mar 2025 18:43:39 +0800
Message-ID: <20250312104344.3084425-6-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
In-Reply-To: <20250312104344.3084425-1-wenst@chromium.org>
References: <20250312104344.3084425-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_034408_159257_B64B4A50 
X-CRM114-Status: GOOD (  15.58  )
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

There are only two different SKUs of Voltorb, and the only difference
between them is whether a touchscreen is present or not. This can be
detected by a simple I2C transfer to the address, instead of having
separate device trees.

Merge the two device trees together and simplify the compatible string
list. The dtsi is still kept separate since there is an incoming device
that shares the same design, but with slightly difference components.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile               |  3 +--
 .../mediatek/mt8186-corsola-voltorb-sku589824.dts   | 13 -------------
 ...orb-sku589825.dts => mt8186-corsola-voltorb.dts} |  5 ++---
 3 files changed, 3 insertions(+), 18 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
 rename arch/arm64/boot/dts/mediatek/{mt8186-corsola-voltorb-sku589825.dts => mt8186-corsola-voltorb.dts} (76%)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 58484e830063..ff67931e7821 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -73,8 +73,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacool-sku327681.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacool-sku327683.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacruel-sku262144.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacruel-sku262148.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-voltorb-sku589824.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-voltorb-sku589825.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-voltorb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku0.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
deleted file mode 100644
index d16834eec87a..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
+++ /dev/null
@@ -1,13 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2022 Google LLC
- */
-
-/dts-v1/;
-#include "mt8186-corsola-voltorb.dtsi"
-
-/ {
-	model = "Google Voltorb sku589824 board";
-	compatible = "google,voltorb-sku589824", "google,voltorb",
-		     "mediatek,mt8186";
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dts
similarity index 76%
rename from arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dts
rename to arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dts
index 45e57f7706cc..cc805408a8b7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dts
@@ -7,9 +7,8 @@
 #include "mt8186-corsola-voltorb.dtsi"
 
 / {
-	model = "Google Voltorb sku589825 board";
-	compatible = "google,voltorb-sku589825", "google,voltorb",
-		     "mediatek,mt8186";
+	model = "Google Voltorb board";
+	compatible = "google,voltorb", "mediatek,mt8186";
 };
 
 &i2c1 {
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


