Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AD6E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 05:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4GVLFVs9w1ID31bls4QxEe595eevO3e2bV1KeBxYl8=; b=sC45OrxvFp9pqUwTKNF7aJhBEp
	WDhrBXlvxfoP+vRfyWaqLa38QfQOxzmyy9/QaRrJ/DARAm3sQEGiMgB/y+gQdGMhBr8jCLaw9qb+F
	AFpiJS7Z65Y/mN2/QVNlt8MpXCxMrJMW9zMiPDM5RvXWpp7V+Oxtvaz8vuzuzXIIzKlAD+EHof/CS
	3qDc3hppZI9Fy7J0jzAVz7iIwk2uF+wgghOxWbDjtOEZ10SeCskF9ZiisXbNSR5JULm1uh2k88l2E
	gisoJvFZfnteIp5YoHUaBq15gt7p9qHQbLr2Q/qVX6HEbJYsYfcr+HwbSb868RZDMT1EP4nMX44NR
	dzpofEmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyGw-00000002mBs-1oyH;
	Fri, 13 Dec 2024 05:31:30 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyDV-00000002lbU-1HUQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 05:27:58 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-728eccf836bso1237445b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 21:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734067676; x=1734672476; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4GVLFVs9w1ID31bls4QxEe595eevO3e2bV1KeBxYl8=;
        b=A8JYViIok4kAiJajUiPzBauN72Xslulqp/hP2cZ7ln8/CTyY6xtOhZqWWUx1Y6cKvE
         cK0mnCUq0WPRGoRHEAcMyXaSLeVxOFCssnzPRxAv/YwqKpBfMXh9BHwiQiBci5ssl8kw
         fG97kWAmLUDgLQp5R8+nonDsHCkpdeRMV+VM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734067676; x=1734672476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4GVLFVs9w1ID31bls4QxEe595eevO3e2bV1KeBxYl8=;
        b=am5lH2zflN2P5WKxOI6gx836EaKiK2OZ8ppeSJZiSq2BUSWtdfasjttgeT0Fd3yZ9l
         4mUKqqfob1Gd9s+w6RFyVVmj+4H2aNmMxy+8tdt0jkg5nnWwmpffsSqWV8KcX7dvn13I
         /1unqdKGfLwcVa2na2BpO0v00eeMYhXFvNVxVW/36Ce0l9Vchrk6qXss7iAHs26Dy9+8
         zgr1IJYrxkIPzrnlMm6Dy42ykLm6HhqpXya05MP9Bwa41MWfz9ooxSEGj8We9cvx+twv
         hC/6+DNBAskaPrqzXhBG+Jdpi674fk+UYAOEUTCQ7D+EaEm+u6A1UXrtaLJIjcnaadRL
         BMcA==
X-Forwarded-Encrypted: i=1; AJvYcCVgJG3jfaCDgGzgt7Q/YaRpaIWajUdAw/DBrhobI35/UhNoFtnVzkBBS7sGtujh5kSg/oW8+w0CeOyKLYciCIWz@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq6Aq+td9+Vx8HrBIOM00aShVxJTPuu7t/K03dCuu8tdGRDGyL
	FlppM8AvW/jbZnYjktDb5E8hdLuB4sF5UWVpPTHpUEmEnWN9OueY0otwkG/iNQ==
X-Gm-Gg: ASbGncsIu61qqq9Q+1nQnDqwx1FvZgsvLxGtlsMsLwx5HnCKglkAklSv4gK6aKZ0yrj
	NwR2ICZm901w2mPbXFq/FbRSwhKZ4DQeJLgRM+shoRI8s5B+l+9F+JNR2Pb9AyI9cmhqL0iSLUT
	RuVJI6+ML+T29/cK7j8kTUMeTLqN7f3EOPFYKV8k5i6xKEZFnWqw1QOMeOl4hsn3pFQyjMBaQxi
	vR2YK1KfLCj3Ye32ZMwWleLeuRqUDyqSUDKAr48w5ibIf+MuZC5Op0NrD6hWdD0Dleg5zWHI/+j
	XfTZS7NRSap9vZnwPBriyIB07P/x+xlax7nMiPQNjGnndlo=
X-Google-Smtp-Source: AGHT+IHal8NKejL0izByzIBf1fuwDy1PG2fbPNERA1Cbl9Yln/09XYoA7/+dew9qh4tY8eROOfTDpA==
X-Received: by 2002:a05:6a00:c96:b0:724:bf30:147d with SMTP id d2e1a72fcca58-7290c17f109mr1865316b3a.11.1734067676481;
        Thu, 12 Dec 2024 21:27:56 -0800 (PST)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7263803a805sm7386830b3a.14.2024.12.12.21.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 21:27:56 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Fri, 13 Dec 2024 05:27:48 +0000
Subject: [PATCH v3 2/2] arm64: dts: mediatek: mt8183: willow: Support
 second source touchscreen
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-touchscreen-v3-2-7c1f670913f9@chromium.org>
References: <20241213-touchscreen-v3-0-7c1f670913f9@chromium.org>
In-Reply-To: <20241213-touchscreen-v3-0-7c1f670913f9@chromium.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_212757_345498_113FFEE8 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

Some willow devices use second source touchscreen.

Fixes: f006bcf1c972 ("arm64: dts: mt8183: Add kukui-jacuzzi-willow board")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi    | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi
index 76d33540166f900c99c419c4f97ca0a56cf658f5..c942e461a177efe1e711a978c3bfb9f852f1b0ee 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi
@@ -6,6 +6,21 @@
 /dts-v1/;
 #include "mt8183-kukui-jacuzzi.dtsi"
 
+&i2c0 {
+	touchscreen@40 {
+		compatible = "hid-over-i2c";
+		reg = <0x40>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+
+		interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
+
+		post-power-on-delay-ms = <70>;
+		hid-descr-addr = <0x0001>;
+	};
+};
+
 &i2c2 {
 	trackpad@2c {
 		compatible = "hid-over-i2c";

-- 
2.47.1.613.gc27f4b7a9f-goog


