Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75B5C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 10:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZK4rBTVhiBqQApt0cL1lNv3FadsT8p0opBD4ApBw6s=; b=p975MPMX3D5FmqctGRls59bZ1z
	2NIpRXXbOXhz0KbQy2DyRhA4HF690pGv/OVolhfVB25gOZwGbSWij6s/BmQnlN+t8smepD908m8sO
	WmEWcKZJNz8qrvMYIKazK7KB6feGPLuNJhfJn3mVK/qf5AaOQUhU8qU08lWlaeGjTjBJCNwRoN8v6
	gUWYuhDLY8KuvxzFwXboh5tp25Af72+Ij36wzNbPbQXSBL2HI0Adirgz+MlqnUM4ovlTLGMTYgQIE
	Tn3tXdktnGykIiFuT9pmLpq4INrHAXqnTNDGXq+HE2p1FDi/wG85Q8cqVQ4KeNPmvHc2g5+3UfW75
	snHoSYiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRppK-00000009jsP-00EA;
	Wed, 18 Jun 2025 10:15:30 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpZw-00000009gKG-0gli
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 09:59:37 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6071ac9dc3eso11691118a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 02:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240775; x=1750845575; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZK4rBTVhiBqQApt0cL1lNv3FadsT8p0opBD4ApBw6s=;
        b=DaQntVxMSgeSiiQWPaH3d3rYVFlzx+MRF5XidbCKyn73TgnX4ReqbJsU8Jpp/hHehC
         jN0yabItoOM05CJgior/TaBpwrqIUz8UNNvATVdSdQW5XdoKmaoq8qF3slxtbNL4DlP6
         krOmeviUuB/lW5+gzIEI/iztNpWqIucCwEzDfZDFFmYE7eScpq8z7mgEwO0SrcXKsFA3
         5S1CfunTepvXIlzs+JUNyynL84TrPUyb85VZ3mhL8PQbV0hNgxFw+ceh01LlelUb9iie
         +PUvCVSpG1XznXL4XTu/Rvh3Gpd/uN5XGQfCca/3DUf/4d6fWsJzJ1l97ZjxhsFhanZa
         2FWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240775; x=1750845575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZK4rBTVhiBqQApt0cL1lNv3FadsT8p0opBD4ApBw6s=;
        b=c6cW7ooMJgs2U6DxmsTTG7/CckCPElumen24pXVevB2VZ09vNnKtw+7u6YmWoWmd8w
         KVzf6jmg5fOz9IWqiq2IYSK+MhxzJLsn3T6kQ5viVsKpoAiK6q41YaeLYbkbrgysd05b
         jq27FseZREPueKs0xmzdKCWWXghoUbNcSiFunT3VuIRakKwzIMhIyNu54TsPy9OzMehb
         m5KstoMt2TP8RdzInCOig23RMIOTZCv4zLdx6nB7Wc6w+x6HB4EJpuLods/BPFhqFHbH
         2ZW1NjySyJsDuTFBeu2qV96/3cZX9QH/PdxBqMs0qWG4WDGC595AI/BsEfXUKFIVVe3j
         ZjKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpfvdImvcyNs8kmmfE0S/8YPtUt1Dzev3/u81ECFb+oxbBY9MVtuemafXaWruQuEnbfifdDVbzk07g7eESTTkx@lists.infradead.org
X-Gm-Message-State: AOJu0YxOP0WDp4F4iFsOv1HMK1AWtXXiennqwCx2KJ4AzwV/mXuyQkev
	pFT84MtubQqYktC/W030nq1655E7Q9GH+bL1GwvCvzrCQoUD2O6LHG9H
X-Gm-Gg: ASbGncvyLTwICEqR4g5VbJhdqC3XjISg48FekryR76mIAV7ideoulcFjQnQWRwl0AYo
	0vgFceNVVefgH6LOsNUOY6MqId2JKr3YvVU8qEYEvFZsNpHSbde6QAmZWo3BPY6QxaxIB+s/CLs
	EUKyemIUbXFo+b6wzMTILNFAyEiLnUD5vAUBazuIrTv2VQBV5kublg8bSZ8TaqWQxQrrewLXliL
	y/aN7Q+9/f8BtFAL/yqLVUrP2WMLVSjQ9vxEUUhvc9c1naEYUWC6x6g61J3DMOKJH1NqKK/a8np
	md5I+XzQsbRfVsaPHkPr7TNVQsWS+HMP4ru+WUoCTv2rk2E3BfgzQw1CyYvmKqSwOyXsDUrM2bx
	E2lcCsggEsg==
X-Google-Smtp-Source: AGHT+IF0O7yEFrSOOVfL1bKSJ2JPMdbGKHpONY0dvJ6BBwm5Ud3g1NaD5PYEDD7Z6R13gCb1KZocCQ==
X-Received: by 2002:a05:6402:278c:b0:608:6734:7744 with SMTP id 4fb4d7f45d1cf-608d083806cmr16928493a12.7.1750240774425;
        Wed, 18 Jun 2025 02:59:34 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:34 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org (open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)),
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 03/19] dt-bindings: media: i2c: max96717: add support for I2C ATR
Date: Wed, 18 Jun 2025 12:58:39 +0300
Message-ID: <20250618095858.2145209-4-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_025936_224925_BF6C3579 
X-CRM114-Status: GOOD (  10.90  )
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

MAX96717 is capable of address translation for the connected I2C slaves.

Add support for I2C ATR while keeping I2C gate for compatibility to
support this usecase.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 15ab37702a92..167c3dd50683 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -92,6 +92,30 @@ properties:
       incoming GMSL2 link. Therefore, it supports an i2c-gate
       subnode to configure a sensor.
 
+  i2c-alias-pool:
+    maxItems: 2
+
+  i2c-atr:
+    type: object
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^i2c@[01]$':
+        $ref: /schemas/i2c/i2c-controller.yaml#
+        unevaluatedProperties: false
+        properties:
+          reg:
+            items:
+              minimum: 0
+              maximum: 1
+
 required:
   - compatible
   - reg
@@ -99,6 +123,21 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
+  - anyOf:
+      - oneOf:
+          - required: [i2c-atr]
+          - required: [i2c-gate]
+
+      - not:
+          required: [i2c-atr, i2c-gate]
+
+dependentRequired:
+  i2c-atr: [i2c-alias-pool]
+  i2c-alias-pool: [i2c-atr]
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.49.0


