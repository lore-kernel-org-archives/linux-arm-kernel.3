Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DFCC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 18:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMGBxKdxUGyFUvUDQCN+Pu7Job2ef1gvSHKYwiDKEWE=; b=NeWtWSJk7AkZTg8qWfNuQ3Jlco
	GZGEx544hnVMBPwr0vSTxYlfLVUYI6/lhsgQVwXeWQQWc+q2+IbCkT/I6ccXQmuFp39OYWR8YaLDe
	SGgMtOiHbMdjoiJOLmB+hbxrUAUpehljiN7LP/0mLCHhIwsW/Vm+pkjivzbkOlKz9nzNdZtAJQ/Zs
	z+FU0QG0T9k9mCcLFpl+juFDOz4zhPyflLGl6gMt3dImcbhEJFs9a3DdsMQTb2M0inMz+Bp7e+7pa
	yCaQVpmGgNEuORPq1/WpwoaBnim4X0BB4trcH7RiBFF3Antuo+hZV8Ups9vC11EAoC8H4MeMvGpyC
	f5L0s2aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqzHx-0000000H3cd-0XvW;
	Sat, 08 Mar 2025 18:52:45 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz0u-0000000H0Ib-0pUY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 18:35:09 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ac0cc83e9adso801812466b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 10:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458906; x=1742063706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMGBxKdxUGyFUvUDQCN+Pu7Job2ef1gvSHKYwiDKEWE=;
        b=FI1I+Y+jU9SPmAZkrFk8vHhDOG0mB5cuD0Q+pK8y9JLmLSmJl6T7Kb4HK/cTp5L/Vu
         HmB/EAqV+NMGwqoft1LbUhvWehoA4qQhZsP8e7lP4NuCZze8XFQvR4YWeY/NMcRXqosU
         iBtXHompKKGpMyNfPxFuYzn9I51K0wl5LhuuLbH9C6p/RiUNoiwQXqRzXTr7Lw/osleG
         yXVL9n18OTNt6W2E8PxibjZnnSBIDvqIXu5S2uBxfFcsztECOn5O0AA8wet5jtvF818t
         U9PRm1ERejCF3NgM4kfjMHIpoBlk8dewjkvQ19OZj0YI0V/fiZw58es9GNHdHgyUhODg
         5Icw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458906; x=1742063706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lMGBxKdxUGyFUvUDQCN+Pu7Job2ef1gvSHKYwiDKEWE=;
        b=tSRnFZ2M4I8q5vmjLeR9jyWqKCHm1viTCPN0+wYmEK6/eZvtlfceyW1sPCYw6VFOHI
         fqLcF7NKFpzrcaIZ6O6IybxWZ4PDntpcmhKvzJ6VireiQmXTqhQxmDiyh0Gs4u0TnpQy
         aJOqxVX1JT/qhsOAaPL0uTE9/xv6CUXZE8U8r7WQvXvN96+2YdUM4SX9B04BF4isEn2o
         57SGY56FaUxt701fmtwbL4Eg05QVsts1WZhrOOWo3dqYUq35TqTx2r3roMdKAjDxc5lr
         s6rr0UYtIJ5RWu8VEZtFA2623y8A0/dXOdqCEz8DJi43GCx4ugiH2xl8mht0NsOJmzi5
         Yfvw==
X-Forwarded-Encrypted: i=1; AJvYcCW0xbjOh4qicUdSEHOC6tiV3hrccfjh+dINuSpW+sPwDLU0KvakaM7xFn+/Lc0TH3/xebGZDJSl6TdMRxoL9vah@lists.infradead.org
X-Gm-Message-State: AOJu0YyggVZZyiyCeACRdUGHUY9V4ZUlQ6ABKG/IciqCfzqdYatkZaTS
	jxXBxj6P+30X9vdpo1/TBr1Suas//OMMNJMEvUbiuOUBVZsonzMB
X-Gm-Gg: ASbGncunUEbd2xsTUE7rThMw6baj3vedIBt0ZvsH9zLJ9e6TiymCT+F+YH2xKHI8LxH
	ynSwX967ShCXmNjkHKo2BGyOwa87UHcIOEi4pkT+neXpYotbkV94zLkyghDK6G3yFWOH//cL83P
	vAFRpLFxRqWCnFOWfm1/fQwU65HTLse1rFrPnv9qIGXgsS5p6O7Moc6TNVUYxOPCfcigSSciMyO
	ZJUZrhVIPOSnSu+R2Z7n8aU1M87JVyZ3e3DVRmh054F8aWAL/AUc5OUqZfoD8iR/ltDMlc51ATM
	6ZHPRk6tAf9qGYjaRDr/AtV5o3HWjFcKmdd061t4cxF3Fc4MZdlRSM2slg==
X-Google-Smtp-Source: AGHT+IG1X/LQ5evGM3eWPzIxwvwVI1mcEKQY/cg9Y9a4wUk6EK21LKlTc+rG43P9ZfCGFMaDANzX1g==
X-Received: by 2002:a17:906:99cd:b0:abf:4a62:6e5b with SMTP id a640c23a62f3a-ac26c9d4953mr449641866b.5.1741458906347;
        Sat, 08 Mar 2025 10:35:06 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:05 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH 10/24] dt-bindings: media: i2c: max96714: make ports conditional on compatible
Date: Sat,  8 Mar 2025 20:33:39 +0200
Message-ID: <20250308183410.3013996-11-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_103508_242592_BE645C19 
X-CRM114-Status: GOOD (  12.86  )
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

Devices to be added in following patches have more input/output ports.

Make this property conditional on the compatible strings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96714.yaml    | 90 ++++++++++---------
 1 file changed, 46 insertions(+), 44 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index d0a2aaf7df9c..f0ae069c93b5 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -41,56 +41,12 @@ properties:
     description:
       Specifier for the GPIO connected to the PWDNB pin.
 
-  ports:
-    $ref: /schemas/graph.yaml#/properties/ports
-
-    properties:
-      port@0:
-        $ref: /schemas/graph.yaml#/properties/port
-        unevaluatedProperties: false
-        description: GMSL Input
-        properties:
-          endpoint:
-            $ref: /schemas/media/video-interfaces.yaml#
-            unevaluatedProperties: false
-            description:
-              Endpoint for GMSL2-Link port.
-
-      port@1:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
-        description: CSI-2 Output port
-
-        properties:
-          endpoint:
-            $ref: /schemas/media/video-interfaces.yaml#
-            unevaluatedProperties: false
-
-            properties:
-              data-lanes:
-                minItems: 1
-                maxItems: 4
-
-              lane-polarities:
-                minItems: 1
-                maxItems: 5
-
-              link-frequencies:
-                maxItems: 1
-
-            required:
-              - data-lanes
-
-    required:
-      - port@1
-
   port0-poc-supply:
     description: Regulator providing Power over Coax for the GMSL port
 
 required:
   - compatible
   - reg
-  - ports
 
 additionalProperties: false
 allOf:
@@ -102,11 +58,57 @@ allOf:
               - maxim,max96714
               - maxim,max96714f
     then:
+      required:
+        - ports
+
       properties:
         i2c-gate:
           $ref: /schemas/i2c/i2c-gate.yaml
           unevaluatedProperties: false
 
+        ports:
+          $ref: /schemas/graph.yaml#/properties/ports
+
+          properties:
+            port@0:
+              $ref: /schemas/graph.yaml#/properties/port
+              unevaluatedProperties: false
+              description: GMSL Input
+              properties:
+                endpoint:
+                  $ref: /schemas/media/video-interfaces.yaml#
+                  unevaluatedProperties: false
+                  description:
+                    Endpoint for GMSL2-Link port.
+
+            port@1:
+              $ref: /schemas/graph.yaml#/$defs/port-base
+              unevaluatedProperties: false
+              description: CSI-2 Output port
+
+              properties:
+                endpoint:
+                  $ref: /schemas/media/video-interfaces.yaml#
+                  unevaluatedProperties: false
+
+                  properties:
+                    data-lanes:
+                      minItems: 1
+                      maxItems: 4
+
+                    lane-polarities:
+                      minItems: 1
+                      maxItems: 5
+
+                    link-frequencies:
+                      maxItems: 1
+
+                  required:
+                    - data-lanes
+
+          required:
+            - port@1
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.48.1


