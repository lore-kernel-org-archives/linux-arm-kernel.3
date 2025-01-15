Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBA8C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 16:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mvgaOsWInJVnUwy76tgQ13g6HWxVD9Bi2miL5uycY0=; b=CCOc173/HI+pv0ZLbJW5PZ+bxl
	cEb5jJYBjljExxRnsKeRQs+xsnil/eDHq+msGsxfozQ5SB1xUWZDhMh4Md2lJxQyxP7sDNoCPH7nt
	1YgVwDuo7gGAmK9xbfGI1UqBIBh9rpnHiuRawsJNr066nebbml+FYoNBOAhKCbkIvoUh5TO+3i69L
	e+NmqvMBH7uQLYaAxZ3rR11REG3yiOj+dhvWVQXH+4qcCqOInadBqP6xwvecbmPncfW4VvgYyWc4+
	Xg3mtZRirVvjVyeG3t+j1pr8FODGiT4SE4rfeLmMLzPvVDgXkMselNeRMMu31h3loPoyiyKdLavcX
	9CyEe31A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY62t-0000000CP31-1Saw;
	Wed, 15 Jan 2025 16:15:07 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY5z7-0000000CO9J-1yp6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 16:11:14 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5d88c355e0dso12174750a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 08:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736957472; x=1737562272; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mvgaOsWInJVnUwy76tgQ13g6HWxVD9Bi2miL5uycY0=;
        b=az+Y8XdbZu3XXT+sKVf9BVH8I1O8S4bgJUJ3tu6wIyKAfCJn/9mQHuVxGFChy8wwbK
         N4qGtcJ1xZp/Q+hNtm/WOaDgnT9MCQmgCZ0Z4NgdDb0flG92eh6JznZ4CrN8sCH4cjKw
         QRjRCNbPNbratbwMJEQItRW08mmZJhu7d5EjQyogLY5b1lzybfUnpioX0uVC9xno8dp4
         j6fIBQ+0B1ZNNKQfuhCZrNXdGQk/i56/vJEHBIEqKydY5KC0xm7L9UzjnH7RYTfa2W62
         k5tq1j06n9BO/m2xyD7sWfFbFjT8j5GFn8/rmIchAt1H/oXjfa84gnCBt/4gZM7y5yM+
         +GOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736957472; x=1737562272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mvgaOsWInJVnUwy76tgQ13g6HWxVD9Bi2miL5uycY0=;
        b=pVdg5OExycErin3dXElS7F3ScEZvi94q4y4pLinZW40Nf96vO9ffgS3p8vCMsIR/ds
         PBrgMZ/b4pdej06VBOjPz2B4gxmpraoCTC41Oo4kmFxNXhpl1UWxQhqWFZs2RzaxcxdN
         73ofnzzvsv26Pcu5aY0C0Bonbw/UDrIWEFI2ncPZwGGhUhvoCgoO4buHAQVpPl0CH0nO
         F/PP9kD0WTHU+9ItBX4w62GKWDHjHSXPhywoDAWZ7Hb96TJ6DjXXjwUV5sqrO3MOSfsT
         6Q8g2qOFSocooLeOSXcFAcKcv1+92TG8pz0oYoIEFn59ylCqzIWQ/K/JwL6Itgqk46sY
         RSzg==
X-Forwarded-Encrypted: i=1; AJvYcCXosRvDqx6OI2R53wqnNDegw7m4ZZQ4yuP4rWiA6fU5VmhGnhO05WtysO6BT7MAEDkT2LrMuy/ITKR1McqZJq3E@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3dWriDkKXetZ0xrWQIhVh/2r3z3/Gsn9boXLIMBxozCRFPyWg
	AjWCVZatMkSvw/AR9raL+UnxxRdJ6kyKYQKnBFgvixw6iWOivurN7G7Gj1sq8aE=
X-Gm-Gg: ASbGncvRSiCS9vnBnQJDEzr1QIl0p0MhIgwd6hSk9P7emKeAYy3gQ8M8X5GUPo1eU25
	5xUkx2e5hh5Xa/15nZW2tVwnQqAdV+0x9o7XsyRA6d30k4f4XKlTRh4aG+bRDIcyvlHOdiRdCs2
	uYgDusR3NyjKAlBqsoj60Q/cJRFnYqjFAVUt9A04FyaMpGv3kxHPfGNz6CaMcjhS66QNP7XD1hb
	XwtFhEDHCov1zM6u7TjP9apRy9TizzXXtrvtgSeneztult9tVS1wDMLIx90m3k01XQKxvk9ZDp4
	PoEe0VqXDOb9Pm4GSuDEpIjlMnxVzIEIxHi9liRc
X-Google-Smtp-Source: AGHT+IHgfs3nHvUsKFbEdimSg9mYcz0DubOQSD9PHYFogk2sgQni7lRdfrILTgiNEdYBT68xnxgvQQ==
X-Received: by 2002:a05:6402:84f:b0:5d0:d330:c965 with SMTP id 4fb4d7f45d1cf-5d972d28da9mr27957675a12.0.1736957471733;
        Wed, 15 Jan 2025 08:11:11 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9904a55f9sm7416232a12.81.2025.01.15.08.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 08:11:11 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 15 Jan 2025 16:11:10 +0000
Subject: [PATCH v3 2/4] arm64: dts: exynos: gs101-oriole: configure
 simple-framebuffer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250115-gs101-simplefb-v3-2-52eca3a582b7@linaro.org>
References: <20250115-gs101-simplefb-v3-0-52eca3a582b7@linaro.org>
In-Reply-To: <20250115-gs101-simplefb-v3-0-52eca3a582b7@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_081113_509972_E3D341E0 
X-CRM114-Status: GOOD (  12.20  )
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

The bootloader configures the display hardware for a framebuffer at the
given address, let's add a simple-framebuffer node here until we get a
proper DRM driver.

This has several benefits since it's an OLED display:
* energy consumption goes down significantly, as it changes from white
  (as left by bootloader) to black (linux console), and we generally
  don't run out of battery anymore when plugged into a USB port
* less of a burn-in effect I assume
* phone stays cooler due to reduced energy consumption by display

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v3:
- replace property 'reg' with 'memory-region' and related properties to
  reduce churn in preparation for Pixel 6Pro support
- drop tags due to that
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index e58881c61d53..d3dd411c9bd0 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -26,6 +26,16 @@ chosen {
 		/* Bootloader expects bootargs specified otherwise it crashes */
 		bootargs = "";
 		stdout-path = &serial_0;
+
+		/* Use display framebuffer as setup by bootloader */
+		framebuffer0: framebuffer-0 {
+			compatible = "simple-framebuffer";
+			memory-region = <&cont_splash_mem>;
+			width = <1080>;
+			height = <2400>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+		};
 	};
 
 	gpio-keys {
@@ -69,6 +79,13 @@ ufs_0_fixed_vcc_reg: regulator-1 {
 		regulator-boot-on;
 		enable-active-high;
 	};
+
+	reserved-memory {
+		cont_splash_mem: splash@fac00000 {
+			reg = <0x0 0xfac00000 (1080 * 2400 * 4)>;
+			no-map;
+		};
+	};
 };
 
 &ext_24_5m {

-- 
2.48.0.rc2.279.g1de40edade-goog


