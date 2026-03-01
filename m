Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C49FD0058
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 08:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SejpEdn5w8C9URiM1Is7ely7u34ezEnpcYmkEzh4N/0=; b=VGWNxq0i7vB5sH4HzzaM6ojQ7Y
	5Xngt3dFNcbz2ryMFwRcVS6Mfey51ix/G+Q9yWgPtbbUtBt/jlCcyhnBIsVtVPi18b4NiN3ELYMTy
	KVTW52+vWcUO2/+iu+yj+GSDmM9kh3MkBvjqY33KoM4i40MS9Eu4j04/DIdpVTizzXelRHBEXrs5H
	9boKkYbf6N6qgkckmfFmxspaoVbBby4QqHoMUj+llgCmEZoAdEzLyZSRdM9ZOSCLkFF72RTpP28E1
	dcnghbtDv7AbiF/GL61+47an+kHjjWTWj8e/8ZQfP5NjIRwJlThppdMkhK/O5SRJUUzy6Dlh2aNuF
	CGxaovBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwbor-0000000AwIg-3d9E;
	Sun, 01 Mar 2026 08:06:29 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwbom-0000000AwHi-2rlj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 08:06:29 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c70f91776fcso1330501a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 00:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772352384; x=1772957184; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SejpEdn5w8C9URiM1Is7ely7u34ezEnpcYmkEzh4N/0=;
        b=bSNI3DPrJAsr71yoPaMCXXHCIplM81LgHMEWC3AjKQwuZqJpBgVgwGa7F/4uIHO5j2
         xxo9RiQEznFCjk3sR28jMw9HNWoHYSCA03D7zHJ6bb3JAJfg6H56ja+29Hg+4pEYE63x
         7g4wZV7o7s9qxC02Wrx4JGCFsN7uje8VnsM6BqpU/gUp9AqgWhvX1bFnD5wAeJcbKBMA
         80Qn7d9Zacohd0PGqEdXsRGRAYh6MxVYGXMbQ4s38YU9PPNiZlHr6TjnM/C6mxjW575L
         eBgExwv4en/jwVPT+1mxWdxb3wVbm5C2Q/iq2v9CuwZJCyrE+xmhIrn3GkTfoVadf1HS
         Xa5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772352384; x=1772957184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SejpEdn5w8C9URiM1Is7ely7u34ezEnpcYmkEzh4N/0=;
        b=Wq4+gTFm2ylLKKqOrBiA6FC6a/lwFIMnUbaNVSUIuXZu9LziaKMTBBks9mLQWH6D4i
         EfIoPumg5QoRd2fSeUAiHEx+Olwxy5r02S5oAXg3+ox+u4S/uXxjrejeyQ4iyQcy89EM
         4yKW2S+G6VZj8E/yobeps/B2az+9BObv4+oc7/to721iEIJR5/zcnNbJJ6B4HrBheJGA
         Cadqg7n1VHK3Mlvo2PAhND+0SvhhuL/ksOFIWeKRQ76NT1c0hZzuZvxDdap5AwLeeMXN
         1Ek/9YjFWuJGv1F7B9hxXV1uIJ/U+af9SdRUba6ko2X/njZoR4+4SkBz12vqcKKGtND9
         yPIw==
X-Forwarded-Encrypted: i=1; AJvYcCVTn9GktETjZk9Myn4d2MYJ/UYDFqUMb7xZd+SOHsUFZtqpMOLNakeyeLf3ACWbre/kGIUwEilFNtLkWQeEOy5p@lists.infradead.org
X-Gm-Message-State: AOJu0YzSWUXyvCyL/CQW6aVmX1NnM7kf7ei7CuK9BHC+Y8HwT6b9Kgkj
	TZoTfaIYAh/j0UXP2x3kd++Ny47jD0L2xtVh6kywqzFG55/W8RrS9JVv
X-Gm-Gg: ATEYQzxRMKY3KZAI+cchJD0jQS7LwRwSwefE9+AfrCcXRkE7wC3bFZQsx41FNejpoaK
	9+GNwZ9Hs/3wM8Pbnl9HBr7DWtCCbmG3q6vRjAfHbqBSbLUMZ/RkQcKySRXAhoTitFNtkSwtnMi
	1Pdykp7B2k+fmKg0N7cH/FMvM3HhUFXSRQvod7HMrr142TNlYxqqfqZKl4JLnG4dePyZEkBt18N
	W5jZ6Mq9lJoN1ZXpKVfmqG8PkGJWkDc/Pch1+Mt/7Y80JP8c/tW530t4SNnrmlubuJ4jYlSXvGw
	Pk0Pb4wdo8cdYP8lBmk+wwaBTsWafLcUUrQzyQXw5On70DrZeAmoEREfKsCbVUb1gdyuczXj5qX
	21mN61rDNQZZBXOdch1lkiBCg4xyxWkVwJOU16AM1oq/4M3ReHFOvWhJ+xx6m1qO2jEmJ64BQzL
	AkECNgOMOaZ0/9YCTWR78T0/7z/ncD9i+WBkeBjy4sdHFE1QX+q1mMzN34TWakQ65AvxJmQJz6d
	A2QSBYPm0jITWdigOB8E4tNuFUNnZPYValhopmkdYWklckpn7zFrvUFmQivdObw9jnyUuipYFQF
X-Received: by 2002:a17:90b:5408:b0:341:134:a962 with SMTP id 98e67ed59e1d1-35965ccab15mr6135772a91.28.1772352383697;
        Sun, 01 Mar 2026 00:06:23 -0800 (PST)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359135ef1d7sm8885384a91.5.2026.03.01.00.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 00:06:23 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 01 Mar 2026 18:05:21 +1000
Subject: [PATCH v3 2/7] ASoC: dt-bindings: update tdm-slot.txt references
 to tdm-slot.yaml
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-tdm-idle-slots-v3-2-c6ac5351489a@gmail.com>
References: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
In-Reply-To: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2590;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=lwN3AXla5E+hMpOvc4cTc/hS2rvMFZBUZ7ENOshqDaA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJmLP6cHMG3JNUtnOnhEU8P3mFxZpKZOq9r+mHi5Zf112
 n8W7lrVMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOrtJQz/LDoPXY//4G2ZqVPwOXFFua35oXjbRTty8nIZnjV5Ltrkw/CbjWWO294
 VAcvlGK7uLd4ovun4uwWP3tfumPhD8feCpi8T2AE=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_000627_843855_1185ADC1 
X-CRM114-Status: GOOD (  10.46  )
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

Ensure that all references to tdm-slot.txt have been updated to
tdm-slot.yaml, and are schema-compliant.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/imx-audio-card.yaml   |  9 +++------
 .../bindings/sound/simple-card.yaml      | 14 ++------------
 2 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
index 3c75c8c78987..5424d4f16f52 100644
--- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
@@ -24,6 +24,7 @@ patternProperties:
       cpu/codec dais.
 
     type: object
+    $ref: tdm-slot.yaml#
 
     properties:
       link-name:
@@ -38,13 +39,9 @@ patternProperties:
             - i2s
             - dsp_b
 
-      dai-tdm-slot-num:
-        description: see tdm-slot.txt.
-        $ref: /schemas/types.yaml#/definitions/uint32
+      dai-tdm-slot-num: true
 
-      dai-tdm-slot-width:
-        description: see tdm-slot.txt.
-        $ref: /schemas/types.yaml#/definitions/uint32
+      dai-tdm-slot-width: true
 
       playback-only:
         description: link is used only for playback
diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index 533d0a1da56e..a14716b2732f 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -27,14 +27,6 @@ definitions:
     description: dai-link uses bit clock inversion
     $ref: /schemas/types.yaml#/definitions/flag
 
-  dai-tdm-slot-num:
-    description: see tdm-slot.txt.
-    $ref: /schemas/types.yaml#/definitions/uint32
-
-  dai-tdm-slot-width:
-    description: see tdm-slot.txt.
-    $ref: /schemas/types.yaml#/definitions/uint32
-
   system-clock-frequency:
     description: |
       If a clock is specified and a multiplication factor is given with
@@ -115,6 +107,8 @@ definitions:
 
   dai:
     type: object
+    $ref: tdm-slot.yaml#
+
     properties:
       sound-dai:
         maxItems: 1
@@ -133,10 +127,6 @@ definitions:
       bitclock-master:
         $ref: /schemas/types.yaml#/definitions/flag
 
-      dai-tdm-slot-num:
-        $ref: "#/definitions/dai-tdm-slot-num"
-      dai-tdm-slot-width:
-        $ref: "#/definitions/dai-tdm-slot-width"
       clocks:
         maxItems: 1
       system-clock-frequency:

-- 
2.53.0


