Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4E4C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 22:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98NQySuN2mSdiaqDA1MOqkdPIYgJtZlP7a7zDH1HO5E=; b=nPVB5w78T1AnrFQp8WiFJ+16kK
	ppXJ1x0BVRKD2+B48gXLr3Vkw+iSl7SmBLE3Q8y/Yumc2Iqf2ZtmReRwjn0fVWMaL7QXKHKHaZddr
	XWic8k9PjPe+4S5SNeV/zZZv7JzQ7C/4ux9P0YLsvVc/SpZnylFEV67BANcxelrsReZ/ktpVSnVWI
	vJ63CK18ZwyKMD+g4F1n80qMyTmj4gXzZh8pn3PTIBtoMgZ2DOj7ZHSLIU9Tadf/HmSLbzybdgo+o
	Z6VjvyzzyH4c04che5PW4zuYg9O0ABsXfnA9Zt93Pcqm1igFmI5hf/l7Ej+ZThkKD0n9wddk30T9P
	xlenjWGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzkPj-00000004Z4s-2kiZ;
	Tue, 01 Apr 2025 22:48:59 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzkO0-00000004Ymm-2AjG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 22:47:13 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so1362022f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 15:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743547630; x=1744152430; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98NQySuN2mSdiaqDA1MOqkdPIYgJtZlP7a7zDH1HO5E=;
        b=bTI0sBKl20Lw7jVxTlOpoYnELBz0jePunAxFHmSmBHaKkMrLpTzeQMWVwjDATxvsI2
         585z+A7yIaDQT+kzDkwfgsA7mIsCLkU6fwm8lhhDLTvAPbramyc9gmheXpiWdvzPS9Gj
         uxpDENcib1MA5R46YN7jA0CEPT5HBSj4EjL5AujbaKeKZ9nrHAhDurn0JUsw5FYVGL/G
         Gg6DX7WF5svYm/kPFqZFx5pSmJeG4esdH8Z17lvFA+Hv8mDtUTfPavFwkVCgCTCjKrEB
         UNPJdIhPFrcelMVJZ5kkbYr+yhIM4Wc9ZJyHbob+POIWov6wVVbx+cire3GUPdu78s/L
         MaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743547630; x=1744152430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=98NQySuN2mSdiaqDA1MOqkdPIYgJtZlP7a7zDH1HO5E=;
        b=BGlybGH5inMCyUhUzjghMgUo/h/ijI84oXpa00//qd9Oaq/gTWKampOb874sKWrEbG
         THxyTc7RtsCUAt4MEWF0Xx210wNuoHE3grNS9XQ6+ttaIde70zJjfWjrHb4kJ34Zxo9e
         pMl9Uu8rIPRrqCVSQRM61/NmonBTaKX7HcWG5hHrc6ZMU7mLY9/mnT4bLM+4Vvne20hg
         q86bFqvkpMYjU01wgo1QlFbXiFnZhrFWu3sx351OP+5J0hRFE2WTIs6SeHINKEY7M50i
         KH3OyIpVI5DeKOb1oZJMH/wwrNrQpSl67rPoCxlrI72tF4QA5+v9vE6AqFiSrj2ecjb3
         QU/g==
X-Forwarded-Encrypted: i=1; AJvYcCUpKpzDARCvAlYSwar5mplFP+HxnmwWBW+r+gWkWSYx/ykICVGcMPV+IpUzySHdVebFVxqrkH8Fz5p8eNCXJUaT@lists.infradead.org
X-Gm-Message-State: AOJu0YzxN+iU6xfOOxMMdt+Ne8uN86kRRfdX7CvHyhzEfsGi1UkKBc+T
	Brp5lDtQix/HJJ6bCKS+L25h+MFfF/RTkUVoMjCl8RVfR4VjqjszGGgFYlWiSJU=
X-Gm-Gg: ASbGncuAYvJ17BZ1Kk0KNJGSYDgBEzHOUSJ56AQhrYmT0L3EVJW+JbPK5xAWuNnprZo
	rM2vQUyDJVfpYIfrYgKrAswc6YDu8KZFe6cEXfwsm4itrq0TSoifAeBEQIja76OTM4R2gGKjB13
	UxPai8s/tf9WoxMYiqkDzM8Vv16Rr/LK5RRzPW3vVxd38grtPJBzC5va7gW7+xht4/jxMS/o0Q1
	4AaIw2Xqoms6P78dw6RQF7AS/k45u9KX6zgTO/gaXrZ7KM6OreNl0DWXs/u/0QsV2D3uPFVne3l
	wEZz1CbTG2EVCX7vhzpwuKbLiwNzB8vpDdwLcRIJo42G9N2ZmFOg3QyDzT3N0m8RKUyQtak=
X-Google-Smtp-Source: AGHT+IF2NzzZ6KCw87M2RGUntEuVmQwVlLWQh94Xf93+H3tQqSaCHSKYTBuIHsPytXFa9/kFxPYH9A==
X-Received: by 2002:a05:6000:1789:b0:391:4999:778b with SMTP id ffacd0b85a97d-39c120e1bedmr12286234f8f.28.1743547630343;
        Tue, 01 Apr 2025 15:47:10 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a42a3sm15488862f8f.91.2025.04.01.15.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 15:47:09 -0700 (PDT)
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
Subject: [PATCH v3 1/2] dt-bindings: timer: Add NXP System Timer Module
Date: Wed,  2 Apr 2025 00:46:41 +0200
Message-ID: <20250401224644.3389181-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250401224644.3389181-1-daniel.lezcano@linaro.org>
References: <20250401224644.3389181-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_154712_561387_E8636F66 
X-CRM114-Status: GOOD (  13.47  )
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
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


