Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6022D7497B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 07:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5E41YcKQMsnvd5Y3pXv00rVYjTkf8zP3kA/zd8g2Nw=; b=zHTZNhGhFhEVla6aixtk0upQlK
	Wob0RVmVr/9a8G4t4gMp/z/aEWlJ8NiAKJXWzV6XjRF4a6cqxv8k7RN+ycK8Ojq7cfjzfoRnMBrV6
	4mcZe1PWc43RFGZou2XDBYBGTyGeopYf/2Dun3NvldCA1471BPT4NwH92LSx58Q+6NeW3ehkdf72j
	TZZUFuMNfvkJojdXpJ9BnaKR+AgNWdWk6pwHrbK6O29Yx2EktZdQPmzBJL4S6h4etsSErCevDBCaN
	mQdmDhLi7CN4iEft24TivuGOkSy0oz7VVYh0OyK5k6ihT7wcgsRySbdRJhx3kXdpyPRH+BC7T4/98
	IJGuQgdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t62pL-0000000H505-2o3q;
	Wed, 30 Oct 2024 07:09:11 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t62ix-0000000H48t-1YyT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 07:02:36 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7ede82dbb63so2147810a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 00:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730271755; x=1730876555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5E41YcKQMsnvd5Y3pXv00rVYjTkf8zP3kA/zd8g2Nw=;
        b=iXVTVtzd3yfrfL7+O3OeUjwTAn6xYUhlAXJzMy6EnRjM1gojqp0j5xfmlI4Gl4THy4
         HZIBvons3ox2A5eBT9arapw05LyybDGXOexc72cenwrCmqlz7enbhs5575qbKVZpVwqY
         8onxZ0zQXQ6Av1i3SBHRwazf54dUJJOmk8p1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730271755; x=1730876555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p5E41YcKQMsnvd5Y3pXv00rVYjTkf8zP3kA/zd8g2Nw=;
        b=tPp+aPveI7gHxhqvKADjNl+GmDd6yIi7tDN6xx2TPWSpHCnPnSnoqUQ5BtWsBzSe1x
         Wg+tl9rB4/IhzDq7QyZlCr636AsPv1qX+uMS0jzCwTA5a7iSwgRfVgPwUlsB+nHfSU/g
         B6l54nKUrRyBE6b74qIjEYK02kTFXb2gCe/8gPjuYNE3BVTTnysAr7JX1y1/v4u+QmPV
         dc9t7J4mPDpeHUyCRkDZ7H/q5wSJMeLBNi6NnXHovL33ZZ0cYdoBKSPx6+xDfX5wZ2x3
         Q7ogURP91W4sifpjYT8mZfLi3FUSeVvVzc8GWQZTb+imc3IrqwqS7MHI1+wkawXQiYiL
         YQkA==
X-Forwarded-Encrypted: i=1; AJvYcCVw7NWn8n1GapKqFb8u8MDgPcUR1R4JoNQQtzr0Kbt2Y/TGtUX8XePXEzdHSDN0jKJEfxn9ZNacjhvq3gi4/eMr@lists.infradead.org
X-Gm-Message-State: AOJu0YxVCtNw/fJv2G9TvB+lIUpZgCa0lyILfAmUpaPQnFqzziiv+vIE
	Z3RAI7YXg9m9i98L1vpEDJ0ODAjbzDqDqK4FQsF1FMV7Z/5r8toHh4oBEp7bF0I9AJGyZ9qX6RQ
	=
X-Google-Smtp-Source: AGHT+IFrSYRhWTI2J+yd+pm72XTyFxdk2kxo61HvPYmkLDKpokBYjWWPyujJdt4yASL5lBgrzTxGwA==
X-Received: by 2002:a05:6a21:7890:b0:1d9:c5e6:51af with SMTP id adf61e73a8af0-1d9c5e654aemr11950511637.3.1730271754788;
        Wed, 30 Oct 2024 00:02:34 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d1f3:aa64:657f:d8a8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057931a94sm8635848b3a.68.2024.10.30.00.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 00:02:34 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: mediatek: mt8183-kukui-jacuzzi: Add supplies for fixed regulators
Date: Wed, 30 Oct 2024 15:02:22 +0800
Message-ID: <20241030070224.1006331-4-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241030070224.1006331-1-wenst@chromium.org>
References: <20241030070224.1006331-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_000235_447649_A67B04BB 
X-CRM114-Status: GOOD (  11.86  )
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

When the fixed regulators for the LCD panel and DP bridge were added,
their supplies were not modeled in. These, except for the 1.0V supply,
are just load switches, and need and have a supply.

Add the supplies for each of the fixed regulators.

Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
index f540dcac74ea..80888bd4ad82 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
@@ -20,6 +20,7 @@ pp1000_mipibrdg: pp1000-mipibrdg {
 		regulator-boot-on;
 
 		gpio = <&pio 54 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&pp1800_alw>;
 	};
 
 	pp1800_mipibrdg: pp1800-mipibrdg {
@@ -32,6 +33,7 @@ pp1800_mipibrdg: pp1800-mipibrdg {
 		regulator-boot-on;
 
 		gpio = <&pio 36 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&pp1800_alw>;
 	};
 
 	pp3300_panel: pp3300-panel {
@@ -44,6 +46,7 @@ pp3300_panel: pp3300-panel {
 		regulator-boot-on;
 
 		gpio = <&pio 35 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&pp3300_alw>;
 	};
 
 	pp3300_mipibrdg: pp3300-mipibrdg {
@@ -56,6 +59,7 @@ pp3300_mipibrdg: pp3300-mipibrdg {
 		regulator-boot-on;
 
 		gpio = <&pio 37 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&pp3300_alw>;
 	};
 
 	volume_buttons: volume-buttons {
-- 
2.47.0.163.g1226f6d8fa-goog


