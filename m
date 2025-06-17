Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED617C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 08:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J2ul8xxfJRC/IslU3NO7LvIavTukETIYjBPpB2s1Bks=; b=R1rTXouWskP15+ws9LF+fPyNCI
	qoeIakmYfW6hcsdfsV1pagtQNsnv2XSYhSk3CG4CbWaQgwUtP/yu6wSLEIDG99gwhcIfgPTLo8UqM
	T34EF93jPuxlOSmtxsIuqaFI+CFcMTZAje4TV3RIxZfxZbMjPUvGH6HmL8buj0N9IvQPfQDNmovpk
	S7vRXpL0VPHJ5xxYQQHL63bdFRqd+NliUg84U2WwVkg2Ba8UMqtSS120z3cU95uxcWGU23LXTQsJ4
	7vFMdMfJyWEBk6RJUBuIW6bCmeT6+II8bJfuV8/dZj/S+KVk8mA4IcwuQ6CTbCNMhDSjUtWFOIqEP
	LqUmEq7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRsn-00000006csH-3QRG;
	Tue, 17 Jun 2025 08:41:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRYc-00000006a3L-0FFr
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Jun 2025 08:20:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=J2ul8xxfJRC/IslU3NO7LvIavTukETIYjBPpB2s1Bks=; b=D9qc/VQKWsKDxhgwgjrk2zcghr
	aYVdUwJH9QMpBztsATkCl5UEN5iC7bwImIaJz15pmg0UNEarK4DiWEtDimpJ3HStxxEm2vmJrLnoC
	TSxOCreWmHA3pdc6GNBOmb5gFCSCY93dfvO5W8HxLdg9i06rxCLoK4F+geslsmAqT4LYwddKz6s2I
	oFxEIUwXS/S/x91CT527yGNJDUQDEiudhULIkA7D1mji9wW6NXitII4CBPo8Ujrqm0AZL1dFHuB4S
	LRrcSYVLODfbznWID0FvRRPQh79Hi39MFGvDcfq/nM8gALm2nO8paWp546wblkWijb7BH23vA2UOY
	pI99aKVA==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRYQ-00000003k8P-1k1B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 08:20:36 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-235f9e87f78so56496805ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 01:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750148421; x=1750753221; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2ul8xxfJRC/IslU3NO7LvIavTukETIYjBPpB2s1Bks=;
        b=QnJng0Mzw/DudtQd7s4jD1z9E/7wtmF1GpusuqOgRhn9P8qloKKREPjomthC+tW3jf
         GrBJzJRhgHTbuneIS4EWA1h2rafOoHznEkkLfiQX+ruKOTZd43RlVUJ/KlG2EWE1G8KL
         2quMRXI7GCpB5dRT3nW+dInp+761sNi5jAi4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148421; x=1750753221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2ul8xxfJRC/IslU3NO7LvIavTukETIYjBPpB2s1Bks=;
        b=C2G1ZvsQt+Dszl/qKUTXYJVQjaGaydy6mOEdnFRVKIeooBpzRAb1NpAN6M11uY40dz
         pD8iNmvOgIbYJnPfS7rZ2aHxXObeWcKWAdQR1St75VcJXxr+rAQsAtyEGQQNtP5fq29c
         c9aLPgFOO7BgoOyIdcdOUd4gJ8LIu+xq3YE3YWrCGO1eioOK6bRzIhu+ziSXEN5qBaRa
         bNM/hUPng4waIRXbI4CEQDMkowkvIphS4Qmqvg39383UsvpcX8Vq1JWHE/Bb4IwIG9mZ
         vh53U32gfq+9JqBz8wSubfDnenC+Z6gDF8A6Y+JkwZbtFx+1Gk2i9FhIt2ov8Jq3g9kv
         LVQA==
X-Forwarded-Encrypted: i=1; AJvYcCX/mRvlLVfk/arRFlVnFXlke7Eui7E4sip9Utd385EeFB/BS8r3wXZKQVazQqHN6K5MFp+9hQSsmk0vqSSD8UXk@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+coyl5lzug95GJ71dA/+9IOp8PCGgiWPWslktObPulKpLavo6
	5U5hdB1bOLuVDqkyw9pp9yMOt5ChGZOx7Dvga+fZBxRW9sTEXRAJpokH3ia0L3SpLw==
X-Gm-Gg: ASbGncumswVGGIxYbFmBajtgBsn8encR23643qkGpfO6ek/zS59rWNLNpAI/hmz/TkE
	zSd5udMYFaWDmh9Y9dhB5DXKyNJXFQwYK3l3op/Qwd4qmm31UQhaV2zTD5lh2Abuxjx3blxGnL/
	8yPE3CBIVgvr3l0ExgUn65KXAgOxQEYyK0hRkyHBia3m/SxfOvaYtTa0hayYs5btuM6T94k2yG5
	8FUzFz08cjWxvXlXpbjmgcJ1s9g3++wpbdeHlSzowRigg/FB+MQom8hjiZgjXXiYvoQ/9+/xlJq
	sRcQxlBMamTdxy/AG6k7UHlkg9LJePtMU7cGPyA+ysBhOoZqH54umowKgzSsQvvf6omSXWD/xjh
	d8yUp
X-Google-Smtp-Source: AGHT+IEY70uZwkZ9fnRIDDmKpg9uBUC73hKP0ryT3ds2gfv9hOkjBFwKd6TZX/WRDjwEzvut9oH02w==
X-Received: by 2002:a17:902:da85:b0:235:ec11:f0ee with SMTP id d9443c01a7336-2366affb250mr198366645ad.14.1750148421026;
        Tue, 17 Jun 2025 01:20:21 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:24a1:2596:1651:13d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781f7sm74598885ad.110.2025.06.17.01.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:20:20 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v3 5/6] arm64: dts: mediatek: mt8186: Merge Voltorb device trees
Date: Tue, 17 Jun 2025 16:20:02 +0800
Message-ID: <20250617082004.1653492-6-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
In-Reply-To: <20250617082004.1653492-1-wenst@chromium.org>
References: <20250617082004.1653492-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_092027_013064_7A996AAF 
X-CRM114-Status: GOOD (  15.12  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile               |  3 +--
 .../mediatek/mt8186-corsola-voltorb-sku589824.dts   | 13 -------------
 ...orb-sku589825.dts => mt8186-corsola-voltorb.dts} |  5 ++---
 3 files changed, 3 insertions(+), 18 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
 rename arch/arm64/boot/dts/mediatek/{mt8186-corsola-voltorb-sku589825.dts => mt8186-corsola-voltorb.dts} (76%)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index f68865d06edd..a8b8796276aa 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -76,8 +76,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacool-sku327681.dtb
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
2.50.0.rc2.692.g299adb8693-goog


