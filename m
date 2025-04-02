Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C657C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 09:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTLGRPRVP9appWyjcEsZ15YsaJR4D+bZAUtq/Giu/1o=; b=sI1td9McnGIymyz9M2cpPRezcA
	xxu5pzLt45LBpp0bWYJ2knNbc5vgENpR3ZG0v318Yf+CAHxgrzcHa0eVtZsYoDucM33QXNTqYGZuT
	beBiaKweYyA8BkNhCXAM13fO9EXyGAyoZcLYHsjGX40wpJZWr7NGyCa/+Z9vtnKr0jJEEfnKnuOc+
	S598gIn4ji/Pd/h1cHkGrST0j/swUsaWg8uoQpEV6Hyj3rLbULPjAJB0ETUF1VsgihQ77o+oxmiRk
	9cSKmGfJ2G6YSQG752h4GW8Gi/GL0ZTeTiWpzk851onL/LzYKvM5tLaLb73ULa0l3m6fHVehzZUUk
	cjpkHDbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzuAA-00000005eJr-26l5;
	Wed, 02 Apr 2025 09:13:34 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzu4D-00000005dBz-1MbG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 09:07:26 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3913b539aabso3761230f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 02:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743584843; x=1744189643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTLGRPRVP9appWyjcEsZ15YsaJR4D+bZAUtq/Giu/1o=;
        b=Y+LvS9MAcvFL0hSY2z/zXBouqLOfzOnIeVcLrGioerFMiopzchuLHMqzvhtP9Zht4L
         D1yaOfIhVU4OtWwAit9qdaUKOijDF1SSKXgEsfeUnKrijW9P7jZQpw5zuTDX7K3XHU3k
         Ulr9V53IwWIfuFamYIAyH/w9Dg9Xcy4uoz8YklATSO1UWQZ29EIe2fcdBeYhhoTQs99W
         zoI6bA3pCEvFLb/9JcaXn31/30iYKgcDUqsbO+mWqDltS4IeEOT5yaKuiPddHJ5dkWEC
         CnFmEvzZHf7LeK/gl53hxL4HuWsDSvZw8b/lFqofb9euQya/mGoWkPWL6JKV/cLy5/nQ
         2yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743584843; x=1744189643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HTLGRPRVP9appWyjcEsZ15YsaJR4D+bZAUtq/Giu/1o=;
        b=D7evtHtKTepwTrF0Hdwdb/iylwcbm/EmuQmQpTuOaFhWCMuohRT+WAkPDhjfnc3LNc
         GiLNA7U91FMQQ4lHDPYg47jJ5LcLrxPzi3U5z6vWcrU7u3lZ6gZU9y+v9LWkEHU065s9
         bw0/r5sTzqMfR6SIYX8i9si6vyLebDk25i0oTYkVGrNZVV4O+8483T9S77vJPyVfBFl5
         CGTco0xCzjreY1I1cyUPgjgxcsDIroGSil0RqbJXyXR2dAQF000re5gzzbOLA4Fuvnf4
         uPoc95HxFARQHj4108v2tHmI/QoPfpEm0l76v72A1hez38O/+IjCAhF9/ctZKK4lffCH
         alfQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6tWX1ZYvNXfqRW6dTXl2x34lRdDGeUIVS9wNoyajOFsfCRMtHDYCqNka1MMrABatsjFR/qdHhN1uVGtECFdc+@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd+tGnI40/NW2ph2rezM02VC8pi60PK34U5t2c2qMBhKJ8PH2S
	eZcCm76CKEcFhWDl/fRN8oGQsxL0sVTQsxD3m8gr3pYrk0mkewifzIaBXT975nk=
X-Gm-Gg: ASbGncvHZvsAo0sINK5c7mz4D8+1Q46+nhwpqYoc6vN/GncQ/VpIXzJVTdy8YwSmpEn
	OMC+MXZzTmSZFN6nzjRtrjFjidRa4zkvGJGaUVUxmWJKFr5lt+5mBX1j2r4yNgfFBJgPYWyWDxx
	XCeC+ZgIj0ZJz1bT5jqwaqXJ2au8/VUuh9I5bhoNCA78wQwoQB5Lx+mvuhj82anfQ+AME3Hg4bJ
	1cWzx8n+q4KD3S6nGmPTN0/M41sZJWBGVRXjSZS9pTCQCNiJy20c/5iqdDgPrukiqu0n/H9IO6W
	7J9qu2KXizorvtQoUIqpDbcuH+lSJ3jwJXdzksiMQpmwifAdqPxGHB2rlgmW+/uuyT8ZpKc=
X-Google-Smtp-Source: AGHT+IFXYHGa8W8Eb2/WxNCzxc6TLLaTe+TRSHhXLAgPcpaVC5069NaUIx4xaropFVDDg7FvEL4HbQ==
X-Received: by 2002:a05:6000:184e:b0:39c:12ce:91f with SMTP id ffacd0b85a97d-39c12ce0e13mr12634441f8f.30.1743584843459;
        Wed, 02 Apr 2025 02:07:23 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b65b4fcsm16680724f8f.11.2025.04.02.02.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 02:07:23 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
	thomas.fossati@linaro.org,
	Larisa.Grigore@nxp.com,
	ghennadi.procopciuc@nxp.com,
	krzysztof.kozlowski@linaro.org,
	S32@nxp.com,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE)
Subject: [PATCH v4 1/2] dt-bindings: timer: Add NXP System Timer Module
Date: Wed,  2 Apr 2025 11:07:11 +0200
Message-ID: <20250402090714.3548055-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402090714.3548055-1-daniel.lezcano@linaro.org>
References: <20250402090714.3548055-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_020725_368457_E93FCD8A 
X-CRM114-Status: GOOD (  13.17  )
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

Add the System Timer Module description found on the NXP s32 platform
and the compatible for the s32g2 variant.

Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 .../bindings/timer/nxp,s32g2-stm.yaml         | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml

diff --git a/Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml b/Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml
new file mode 100644
index 000000000000..2016f346b2ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/nxp,s32g2-stm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP System Timer Module (STM)
+
+maintainers:
+  - Daniel Lezcano <daniel.lezcano@kernel.org>
+
+description:
+  The System Timer Module supports commonly required system and application
+  software timing functions. STM includes a 32-bit count-up timer and four
+  32-bit compare channels with a separate interrupt source for each channel.
+  The timer is driven by the STM module clock divided by an 8-bit prescale
+  value.
+
+properties:
+  compatible:
+    oneOf:
+      - const: nxp,s32g2-stm
+      - items:
+          - const: nxp,s32g3-stm
+          - const: nxp,s32g2-stm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    timer@4011c000 {
+        compatible = "nxp,s32g2-stm";
+        reg = <0x4011c000 0x3000>;
+        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks 0x3b>;
+    };
-- 
2.43.0


