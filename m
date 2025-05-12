Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D97CC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 21:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=USSVmmnFJdOcJq4DaZtsKaThQaquXKB2SbmZfhpsh4g=; b=3Cj5IMDP2yqiPmCflxIBJzTS8x
	n0njshW8knzC4PdDj63bc7gvrmZsspKLu1gJLwyT30+boUbC9BcO6Nq8xpnsEYGwo62bMtk+uVV6L
	VRppSWqm03Az5LSRobXGYroT+pEgVHpsOVmQM3JdlMzv8G+MNe1sgix+zfJf7rNYheI3G0O3e0MaX
	Rt/8JnX7mpxEOfnotHPaRK/2c514gQKlE37ZR1iCBfR6W4AgXLCfygBHU9NugNODfy324s+jIAGf2
	tdDAkFND2l/NPOXgNo22fgXMQNtHkf2Wz1Ft4SHLTsgFpjC8Cw8SDxOdvK4Qi2teXNXcYwa8TA8SZ
	24YF7thQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEapT-0000000AkLh-43Cw;
	Mon, 12 May 2025 21:36:55 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEahk-0000000Aig1-4AcT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 21:28:58 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ad2414a412dso353577566b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 14:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085335; x=1747690135; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USSVmmnFJdOcJq4DaZtsKaThQaquXKB2SbmZfhpsh4g=;
        b=F5s/lUWBMHTxBUh1SzdEIZLFOE4/lfp6W5YLf3NbaZvqu9I/6ZwEAqKIaXHg32ydrV
         4U2MnWPpwmmF7F+79voUFjigi3o0S4/2u9tpfmuPLtQkuIdB3WVQ07H0f0DSYaQjPp9j
         kASXdKX3jf52u2uPnV8iLCMtSMD+01QR8oUOZvdmU2AkDyrOSDhUQAfvSrQ8JVwIRpNU
         Aax7EE5fkxDhplQSxqNVTMTLfgN2GQtJ9ZOgWw5pkHpuAeIxxqLGvgj0UYy63bQtXIK9
         /DKAWyVLm7lgzEhSDzgp5Lv8Lis4qx6waK06W/irLWeZsp4/wvyOqe9vI/pYezBTL0jm
         cWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085335; x=1747690135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USSVmmnFJdOcJq4DaZtsKaThQaquXKB2SbmZfhpsh4g=;
        b=Uyez6qPnJcYE+uNjLJznhBATScKaAcgCllc+BFsPtVpsYZx7FAh26mtzBsDZD2jde+
         Ebxr6dgPmnRM0IVv1ctJctlJ3aFd0olpCNOia2pIbnS3bptemjOpnyQy27MKSmxJYNp8
         4jxd0AgC2tTwVuRe9bVSPME9jLXjyNY3FMpWUmqSCqUEUCi+AqqsA5fheAso7MWdvY/q
         330qZ0NfEt/ZE+JHcUXhezKrbmcqi98SvaXSCZ8XTVEKDKmO5mJfs7JnvGE9JxPJAAGY
         9sYpofnWAF3Qffy76402VTPfICcGa1FoRuwvm9xZguG13OoFzsjwR5feYGqmkJk8LK96
         8lZA==
X-Forwarded-Encrypted: i=1; AJvYcCVVGvwEOT1AYpa9alhRSUOc4teNc4/2JemYkHwgzLMI7anQhvUTs+ud3fps6lJBBhlfKUUfyRmX9rSc50GI8G11@lists.infradead.org
X-Gm-Message-State: AOJu0YwH9gG55X7J+mG+BkFJ6CgZTs736J4osrgpwzbiZRpDvT03GMJ0
	27l5Vw5f/TB6rFFXCKBtgoPZmBdn1Yy1uCeED0qwyuqP9QgEh7xp
X-Gm-Gg: ASbGncuzhUA11m82lCUML47VGnKtdfyEHBkR7YRpS58otYedNtMwT3aym9T2/OH9jUL
	uLpqSbDgKyd0HALVLdmGIUiB5nwkJ3FqxxgBWX3+C9LS+l13x/uwr3k6q7/fL/CPkuvtvEE0ina
	sNZCvRmbZMXdyQWQafdgJlWVtlcflWXr4YldpHTpoTIxY59pPTFAMEw4qbqh8eHY+FA+6o8aWG1
	qM/ZYIPDEq8Wlqk3khCXF9oCPi/GawEEFWWp/60ifxXzVhskFGwwn8t6ftShVIskf+ChfrtfNs1
	f8Kv5Fa1XYzsONUieJHdYSWQ++Sl6sS6dFygIF2FEbe2YSs0qzS8VeYEd1wEdKZdUXu1V1dBsA=
	=
X-Google-Smtp-Source: AGHT+IGZYGO25xeU+0WuvzEPqbhgDfa90J56T8yELtvmAfLXs700qoIgre4bbS1rcOkKIGUXxI87lA==
X-Received: by 2002:a17:907:c316:b0:ad2:52c3:2088 with SMTP id a640c23a62f3a-ad252c322f8mr489370366b.25.1747085335042;
        Mon, 12 May 2025 14:28:55 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:28:54 -0700 (PDT)
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
Subject: [PATCH v3 03/19] dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
Date: Tue, 13 May 2025 00:28:12 +0300
Message-ID: <20250512212832.3674722-4-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_142857_034874_F240DE91 
X-CRM114-Status: GOOD (  13.67  )
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

MAX96717 is capable of configuring various pin properties.

Add pinctrl/pinconf properties to support this usecase.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 110 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 167c3dd50683..5998e2518be9 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -121,6 +121,116 @@ required:
   - reg
   - ports
 
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    properties:
+      function:
+        enum: [gpio, rclkout]
+
+      pins: true
+      drive-open-drain: true
+      drive-push-pull: true
+      bias-disable: true
+      output-disable: true
+      output-enable: true
+      output-low: true
+      output-high: true
+      input-enable: true
+
+      slew-rate:
+        description: |
+          Slew rate.
+          0 - Fastest
+          1 - Fast
+          2 - Slow
+          3 - Slowest
+        maximum: 3
+
+      bias-pull-up:
+        oneOf:
+          - type: boolean
+            description: Enable regular 40kOhm pull-up
+          - enum: [ 40000, 1000000 ]
+            description: Enable either the 40kOhm or the 1MOhm pull-up
+
+      bias-pull-down:
+        oneOf:
+          - type: boolean
+            description: Enable regular 40kOhm pull-down
+          - enum: [ 40000, 1000000 ]
+            description: Enable either the 40kOhm or the 1MOhm pull-down
+
+      maxim,jitter-compensation:
+        type: boolean
+        description: Enables jitter compensation.
+
+      maxim,gmsl-tx:
+        type: boolean
+        description: Enable transmitting pin value to GMSL link.
+
+      maxim,gmsl-rx:
+        type: boolean
+        description: Enable receiving pin value from GMSL link.
+
+      maxim,gmsl-tx-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Identifier used while transmitting value to GMSL link.
+          Default value matches the pin number.
+        minimum: 0
+        maximum: 31
+
+      maxim,gmsl-rx-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Identifier used while receiving value from GMSL link.
+          Default value matches the pin number.
+        minimum: 0
+        maximum: 31
+
+      maxim,rclkout-clock:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Clock value.
+          0 - XTAL / 1 = 25MHz
+          1 - XTAL / 2 = 12.5MHz
+          2 - XTAL / 4 = 6.25MHz
+          3 - Reference PLL output
+        minimum: 0
+        maximum: 3
+
+    required:
+      - pins
+      - function
+
+    allOf:
+      - $ref: /schemas/pinctrl/pincfg-node.yaml#
+      - $ref: /schemas/pinctrl/pinmux-node.yaml#
+
+      - if:
+          properties:
+            function:
+              const: gpio
+        then:
+          properties:
+            pins:
+              items:
+                enum: [mfp0, mfp1, mfp2, mfp3, mfp4, mfp5, mfp6, mfp7,
+                       mfp8, mfp9, mfp10]
+
+      - if:
+          properties:
+            function:
+              const: rclkout
+        then:
+          properties:
+            pins:
+              items:
+                enum: [mfp0, mfp1, mfp2, mfp3, mfp4, mfp7, mfp8]
+
 additionalProperties: false
 
 allOf:
diff --git a/MAINTAINERS b/MAINTAINERS
index 8f463ebca056..f8ffb7cff9c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14201,6 +14201,7 @@ M:	Julien Massot <julien.massot@collabora.com>
 M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
 F:	drivers/media/i2c/max96717.c
 
-- 
2.49.0


