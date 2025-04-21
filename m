Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C393BC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 10:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5gUKhgL8xbYN2S+4GVogDZp2nilBSVWla8H/MwRjdFI=; b=3lxGz2upOW92fcFmNPtvId4gSi
	i0TPeIRhM5t1C6XAaskjQSkdGWQtglUr8yrsfO95uxMAxXFYOBRMDxED17k0Cyu/7t7TVmFfYSs/G
	iIP+PoPW4FpORg8s4ozIMno6KNiGY+/x6oPI7wXsqaFsGjwVXCpy2uPFbI6oK/7rNyNQVSpcm/vPt
	0naXhrc5RD8IKpxM1WweUPhODO+XHP3R5EpCspEQ9Gk2eOqAzSS8nSJN54ACtKoqrW2ZZ7aNmDNYw
	kzbi2FMxMtne4sbdclsHpGcXlgIO9ytf89KsFAu5fzFpPH0q03cLSZFPLyoSAK8J+qUVlDAF2K2eB
	pfISV6sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6oCu-000000044iS-1hNU;
	Mon, 21 Apr 2025 10:16:56 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6o9F-0000000444z-1gH6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 10:13:10 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-224191d92e4so37706465ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 03:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230389; x=1745835189; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gUKhgL8xbYN2S+4GVogDZp2nilBSVWla8H/MwRjdFI=;
        b=ldT5hUIVm75qCG5dY4e4pkD1Qxua440yuQYo0rpW5ODgh6oLL9hJztW51DBq5gzyyH
         VQAvsiGFycYUwhBo02zRQCTpvTncE64mEg8RH8Mi5fWKIB2kd/d1KXerklNc7uLLWXeR
         UWukFQq92/sgU0BQ2uioDESmXc+YdANUTkdeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230389; x=1745835189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5gUKhgL8xbYN2S+4GVogDZp2nilBSVWla8H/MwRjdFI=;
        b=TDNuWWS3qtUWQtArgeBoNsbjhK0Q64W830mrcpaUp7OWGtnW5qFvBDf51CKgEv8roQ
         Txrc6QjRljMsux4aYc6mP3lkt42UsCPOXs0izQPD6U30ZXPkNya+E2phK9CadvZwXpQH
         Jz6nsE4hwsVmVBtjKjiV/YVQWETRWcDAq7kKl6Fw+qUZ9H9WUfTKCWLzW1utTRGh6dJs
         bvpKsYhvPvK4Pr8iaLGW9WkA5O9jKBSwiEpWNQQXWHIL0IywAx1JprcuyX6j9dkcw0OY
         XErhg219lF00OnjPri44ySASJyP1iua3Ll09ehyFJIapAtNXV+W+KKQ87a98VbK224Jv
         jugA==
X-Forwarded-Encrypted: i=1; AJvYcCX027AKd8gye1/G+f3DQz8L24l6vm+NVVveNnBP03UwQYQvhZF5pehbGoL/JIbmzf+et/xqKpW9iYvx/86qBzqO@lists.infradead.org
X-Gm-Message-State: AOJu0YwlWfG4YFbuA9ydPlPZ2cV9GfyPiVLYoe3j1zjfA+aU3WQyjKFz
	l1T+I0XTL/dRzxh88w5Jy0ax5c9XpB8lXulGjLzX/dMfLWQ8/gIK+BCsyEIscg==
X-Gm-Gg: ASbGncskeFHeY3nHb2uWaUXO98dO8z1L0vVH3fgmeMflCwn0ER2Fej4/6gx2p+gPhyR
	ywlZeVPXALSeLMxu7EiZzIh+l4GLWM47Pkhc4KT6ABVqS+7XL6NNUzHs88yrrIX1/VHS0IZRPAW
	DuTy9hEZCfAIs8mk08sOnLloD2AgwxaMZ4hrAK3P8O+c5+hQ4kzrRS4dIJrQ+CMnU4iFAYC2o4o
	FMr2qYpOuSsbPoizXeYw70MTsdgf4YeS2zv9MtLMFG2BohNMsNe1FfcpTpxjp5/Ep/4oyqs25Re
	KUkutctUQuj762cEHqV4JNDU+n2RQTKgxlyB9/+dDcNj7rDEPWfxgukWMNI=
X-Google-Smtp-Source: AGHT+IEkr0EFkCj5J6CNLSHPTa49yKoitttF/R1BiDswDnBiG+hklRUae4FmkHmy3Ilt86P50nrk5g==
X-Received: by 2002:a17:902:f78c:b0:215:9bc2:42ec with SMTP id d9443c01a7336-22c5361fcedmr148300365ad.47.1745230388644;
        Mon, 21 Apr 2025 03:13:08 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:08 -0700 (PDT)
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
Subject: [PATCH v2 1/8] dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
Date: Mon, 21 Apr 2025 18:12:39 +0800
Message-ID: <20250421101248.426929-2-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250421101248.426929-1-wenst@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_031309_443258_2CB4128F 
X-CRM114-Status: GOOD (  14.86  )
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

The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
longer boot-up time. Power sequence timing wise it is compatible with
the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
enumeration, both shorter than what the eKTH6A12NAY requires.
Enumeration and subsequent operation follows the I2C HID standard.

Add a compatible string for it with the ekth6a12nay one as a fallback.
No enum was used as it is rare to actually add new entries. These
chips are commonly completely backward compatible, and unless the
power sequencing delays change, there is no real effort being made to
keep track of new parts, which come out constantly.

Also drop the constraints on the I2C address since it's not really
part of the binding.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Reworded commit message
- Dropped the enum for the new compatible string entry
- Dropped constraint on I2C address completely
---
 .../devicetree/bindings/input/elan,ekth6915.yaml     | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
index cb3e1801b0d3..0840e4ab28b7 100644
--- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
+++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
@@ -4,14 +4,14 @@
 $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Elan eKTH6915 touchscreen controller
+title: Elan I2C-HID touchscreen controllers
 
 maintainers:
   - Douglas Anderson <dianders@chromium.org>
 
 description:
-  Supports the Elan eKTH6915 touchscreen controller.
-  This touchscreen controller uses the i2c-hid protocol with a reset GPIO.
+  Supports the Elan eKTH6915 and other I2C-HID touchscreen controllers.
+  These touchscreen controller use the i2c-hid protocol with a reset GPIO.
 
 allOf:
   - $ref: /schemas/input/touchscreen/touchscreen.yaml#
@@ -23,12 +23,14 @@ properties:
           - enum:
               - elan,ekth5015m
           - const: elan,ekth6915
+      - items:
+          - const: elan,ekth8d18
+          - const: elan,ekth6a12nay
       - enum:
           - elan,ekth6915
           - elan,ekth6a12nay
 
-  reg:
-    const: 0x10
+  reg: true
 
   interrupts:
     maxItems: 1
-- 
2.49.0.805.g082f7c87e0-goog


