Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306D9C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 21:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zniI+wfyQHBGi/dszKJTZkb9bGfPHkPMGjKY3XSq1Zw=; b=lxOC3462QWr1nvctzi2y/aCtm+
	FjcgBS0ZfM2W4pH9EgHGxz0R/FuG1zz7u7X+CCvK7bgyMx4H8zU4BPVPQxPD3XP68zzO1Tdg6bFBw
	gGFf9KU2TN3oNWtcGWXCwomYAatrLRjsiy5lvfQ4oJA70KnTDk4ayIDAv/hZS/qdZBGrZ4PyxyEGS
	MFxta/0S9Io0B1oF4g2KDL4Y5KUXw7DezvrUhrwtmEIdj2jSiMNOvA17z7lldwrvTNq12rI5G4FRT
	rKZuXLu7vmF0kUuRwZhv6iteaoN6gqfTR5WIVK7LMg3JZFh0uIP0G0frUy1PREACffhOS9n3Bj/vm
	2xZTCc9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEanT-0000000Ak0X-0oax;
	Mon, 12 May 2025 21:34:51 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEahh-0000000Aif3-3I0J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 21:28:54 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ad1a87d93f7so761268766b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 14:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085332; x=1747690132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zniI+wfyQHBGi/dszKJTZkb9bGfPHkPMGjKY3XSq1Zw=;
        b=Ow3qnJH8p1Ck2S05HzsdJ+SdrwrWM4j/9s03s1XkhphOvpsm1DNJHGQTqoIab90NYk
         5pRzfpBWQ8dOQbibhM+Wmifuidr2vkRi5HI/zJb6HD6LeSenqhIl3nukx7ertwCd6CZF
         /awvmYQwL02jz/HYAcRctENBhSzkE6/04tO4C3URnYyPFuUwhGIZGeavso8XvLbv+P/1
         6s2hosSeDf0xLsSlXDz1aFQZvuy5pAGj5xXuCnKE7ery3Bl81MFDvU0mNuTSGUF4INxK
         K7dABBGuXDPnOUvFOVA5K4ZMt1uu1f8tqGt5T9Y+/5XL3G8ijvIlWvxVQBb3qz5rKuhx
         NV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085332; x=1747690132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zniI+wfyQHBGi/dszKJTZkb9bGfPHkPMGjKY3XSq1Zw=;
        b=pMnAPiIh/it+NbINZJn2IiUtJeD8s6zdroBbHynqYdQz9WqBYXzHIod84QUq7D4tFE
         yH1OT+94bTPhh4eXfmNe9jmgBOtoHgBwF7ciuTcwv3LaGcGE3xxjuQH0rXs7Dlh7vIDJ
         tmTKoC4P1jfCpzQSL02v7aHnCskxrHz/slN5rZbLMAo/iXNY+SnnSoBWk9vhCQTKLtCk
         y0r/X0YFKvf0xpDTz0RFCRulTUxDjQ/CjaqwXjsA4QQPQ8xT+qZLi76iP3e/vCsBIte5
         pBeXyp6kUSrafrgEC6n3TLKgfJvhnqJYZwJ+0Idz+7nlsyUmFpUcz25Yrf16F1n1t1W7
         RcDA==
X-Forwarded-Encrypted: i=1; AJvYcCVhvRh2ok2b19GZqNsBrdzaCjmMn40kbs4vG9GXwvfDMwOa8UsDsb3puKcM6mq2qrWxYU+Yq3hYx8rTsn/stk/v@lists.infradead.org
X-Gm-Message-State: AOJu0YzW4QFcWP7BeECMvPUPPNC+iPsQOFN4ogqP3WrkDd1DsMdxvMu5
	Z7RBkpmeaotCXFZCHIKRjmdHu7ipFUnYcxASGodqvrSAvhYFyrw5
X-Gm-Gg: ASbGncv6NQ3Zajy64SfU8gxtZxSuhTk72Ffmd57HDi+9LrL3nJADYP7GZWBd6Oec0H+
	qUlFy5yZCDOvp2rxXiUzx/bNDbcQaQ/K6W5Ctbn3ziA6Ma0HAUWh85N2zS0qHgN33jm9qWz4e5x
	bCsDL2sAZGuYthwzlCBp85YbBn3/oEczGfzYIHlpo2xycptgGM1rWAyWa031U55/8QEBy95HfAw
	p/QAFy4icojfjsMZ5guese/VQCCmGvWpWpVThl0SYrD+qCb1UZ9Pkwho4HQjpKmqQ8ObtFmmv8n
	+iqYWuqIuxtD0Fwl+pnFhsz2KZDhhJ5WFURU2Xm7f5WDllShYTddw+9wNt9S59k=
X-Google-Smtp-Source: AGHT+IGpEtJ466hjYZxHXgDx9Wx4R13JZ1nthYkWedmbOHtDOcknWCFkgjViOloIUCaw6IMyoZqxVg==
X-Received: by 2002:a17:907:3f97:b0:ad2:2a5d:b1a2 with SMTP id a640c23a62f3a-ad22a5db522mr1283450066b.57.1747085331905;
        Mon, 12 May 2025 14:28:51 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:28:51 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Liu Ying <victor.liu@nxp.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 02/19] dt-bindings: media: i2c: max96717: add support for I2C ATR
Date: Tue, 13 May 2025 00:28:11 +0300
Message-ID: <20250512212832.3674722-3-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_142853_822923_112696C3 
X-CRM114-Status: GOOD (  12.25  )
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


