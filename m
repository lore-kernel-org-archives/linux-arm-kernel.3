Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D38CC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 18:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAANU+XIZrUPIW6CAFfax2bnLKgdooprA5iPXyYE/lQ=; b=pU/fH49UNAunDx6osTgY2lZh5L
	XF47x80p8v3CNwU56SzNYAbztL6sTKXvQAJkkgm7v7h+J6Se6wXPFy5Yh/wXMQvZYLfXPvDfh2UFa
	tVVpSsL/ow9QkDh4edmyg+eTqQjy3Znu1nKF5iGAwN4CA0t28yn0cxaVAo0auCJKiKN+NBtnGHVO0
	eU8O4NeFjVsD4vl/w4i9etGWQCq1bx1V89yTWfGR85qwFjFuDrvktQBlHkSIHbbHZlOqfeOSzhPPo
	jPEVNouapWHbE0IKeatkXAmIWps56mRRLWKPQr+BQI1TMm0gtsh+VpQ1vkDjiA5ZLAZq+JA044voH
	9hlkOQFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7f3x-0000000BciJ-3hOX;
	Wed, 23 Apr 2025 18:43:13 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7dm5-0000000BFXZ-0nAO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 17:20:43 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso542685e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 10:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1745428840; x=1746033640; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EAANU+XIZrUPIW6CAFfax2bnLKgdooprA5iPXyYE/lQ=;
        b=EYpkN430n03bS1okQFZ3eykTzDNJIAddx0l/boCMHJwowe0YFlCgoqD4dNjioAWGqa
         BpE2G9Ulbi2OA2Kc1t3yN+XI/CX73A6Yov4C0it2vEpW08DgYV3wnlmMcQqcj30BQCJI
         zIK6ZPcHWMmj2evwWPekwd5jy2rEtHKuxOKCnOcXHtsBD5OMXIoLVtr2ZZZS/l+PAgMu
         8NPUAWtv1pnJ3hPzi4HCNpGmpNAXO+bJLp7+vHtjSNhkYGcTPIEOC4kjXagTqTQgesoJ
         MzPJ1OEkysu+duZnPNhWwalaDxUKHYhBdnOZgURx8XdFaL8vAwQ4mPBJC2JuB8BB9/cl
         MqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428840; x=1746033640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EAANU+XIZrUPIW6CAFfax2bnLKgdooprA5iPXyYE/lQ=;
        b=qeAiPs3bnSQmdtfjC+PBRA8YIyCXPx5RGeW9Y51pI1omtOLuRUNgjahsMxyJ8OrULC
         yQyLpmBajJypbjMk6FXpeZ4pm3GrdvsS5B1cEp4fe7aomoxtyIwtWD/1n3D5eqTl8Cka
         APLzvU14ondOIsgAPlHZwCIcc7U+stsKkDrEN8Km/4ebO7Dmqd4XFUy3aAsgG4GTD/7Z
         QQ9OSyfJPP3asSBSpciB0qtFlSElZkTBCJKvuYc3YwqndH6exFZQBgpB5HuME+0QS4qG
         eymFIQL1/kPEq0aEyNmfNtTA5kjoQJqpLNETZ3AL6j7NNo4xHDq7eZ4tnNPWJedXepzj
         Yq4w==
X-Forwarded-Encrypted: i=1; AJvYcCWurar2Cdi4eTP3DQsHbJvD3KU/DnGq0iQUiIBh/wj0gxNJUINtqSZgvTzpqJhHLnCDw2LBvO78WuFpk3eOGYbc@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2+KugckkNt56/4Yi+EpdIFwRnupJR1/aUpHSsT1nj25k2hI95
	F9eugUIqB4mVX8gBAUtqvrOfpPUnh3pWzmwZOXX6l1dRJqaerDsWE4lqVbzo7cQ=
X-Gm-Gg: ASbGnctnY2gUuXDLwX8QwXU6jtQakSjqFAxcW+KhSjS4BlLR7gmU7vttR/iFGbp+zmL
	zxkxI/hlpIkGfiU/EXQIX2xjbqmndyZGrLH7Wdf2ZaKC+VH/+LWscIndZP7bDNE8b7y5QoYDK62
	buRwP6+/Wceu8Ky/IZQPOmm5Q5e7OABbSmzyofzyW7aDMiKlxGDMqi0NhPhfgYNGKDOcGMkI8ed
	+M1EYug9ylzxvJ2zwxIbOkMru1qeWRmumZ6F5HT5oRvqIUCIW+hZVzJHzo6ebiePububYaK6eDX
	ZTZLIkmgOjRxlQgZV0T4NcDETi6RqrzT
X-Google-Smtp-Source: AGHT+IE6A6rGDK5+UwA4nNVAweDZRFVgbHEtVUgwIxRZIYBtxVB2yx8gDbY5T8+UpwH9WyHnBKi/mQ==
X-Received: by 2002:a05:600c:a363:b0:43d:2230:303b with SMTP id 5b1f17b1804b1-4406ac0a8b4mr165209425e9.20.1745428839881;
        Wed, 23 Apr 2025 10:20:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-44092d18433sm32940945e9.1.2025.04.23.10.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:20:39 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Apr 2025 18:20:20 +0100
Subject: [PATCH v3 3/5] media: dt-bindings: media: Add binding for the
 Raspberry Pi HEVC decoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-media-rpi-hevc-dec-v3-3-8fd3fad1d6fb@raspberrypi.com>
References: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
In-Reply-To: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_102041_275233_06C8451B 
X-CRM114-Status: GOOD (  13.48  )
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

Adds a binding for the HEVC decoder found on the BCM2711 / Raspberry Pi 4,
and BCM2712 / Raspberry Pi 5.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../bindings/media/raspberrypi,hevc-dec.yaml       | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
new file mode 100644
index 000000000000..b86534f2689f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/raspberrypi,hevc-dec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi HEVC Decoder
+
+maintainers:
+  - John Cox <john.cox@raspberrypi.com>
+  - Dom Cobley <dom@raspberrypi.com>
+  - Dave Stevenson <dave.stevenson@raspberrypi.com>
+  - Raspberry Pi internal review list <kernel-list@raspberrypi.com>
+
+description:
+  The Raspberry Pi HEVC decoder is a hardware video decode accelerator block
+  found in the BCM2711 and BCM2712 processors used on Raspberry Pi 4 and 5
+  boards respectively.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - brcm,bcm2711-hevc-dec
+          - brcm,bcm2712-hevc-dec
+      - const: raspberrypi,hevc-dec
+
+  reg:
+    items:
+      - description: The HEVC main register region
+      - description: The Interrupt control register region
+
+  reg-names:
+    items:
+      - const: hevc
+      - const: intc
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The HEVC block clock
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    video-codec@7eb10000 {
+        compatible = "brcm,bcm2711-hevc-dec", "raspberrypi,hevc-dec";
+        reg = <0x7eb00000 0x10000>, /* HEVC */
+              <0x7eb10000 0x1000>;  /* INTC */
+        reg-names = "hevc",
+                    "intc";
+
+        interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&clk 0>;
+    };
+
+...

-- 
2.34.1


