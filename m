Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BC0C79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 14:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BM+FXnkXLBUNE7UFVxinUiuh2gclbtUdB/nqDCPUVQM=; b=AEIPoabbFKyb+bQMPkLPeB81vV
	rzz7+8oDFciJJKreIuXAQY7AsxFrbamxGtzhuahmWwxDpG0/16u5T053crvYIE32iz0x9hO/t6e5x
	i7W7P0+2MKgccpH4Ox4gjbW9Vnxlgu5xh55vX3THFXzktVpLcoJ+0e+PzZ7uHI75r38h4ddXo7rZj
	Jn/DLdW9ZMB9BRREyyr9fMpuGSUUts6ync6w9uXZCI3SXUv1fYtfURC7qOWZygridQBYnaTP8tDvG
	k9ED5E3kENK7201ZSmXJ5n8yIJYgfZRUzP4K51rqFk9kkWEp4ZysUy5jrxND03d8mGSGApI72rhO/
	94jjVPZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4J3I-0000000Bv5b-2Vjg;
	Wed, 09 Sep 2026 14:13:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4J3F-0000000Bv3D-1Jf5
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 14:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BM+FXnkXLBUNE7UFVxinUiuh2gclbtUdB/nqDCPUVQM=; b=ez17wmb71IjR2Yk5guw2Fl52+u
	BhNjOGdH3DEmNOjKi0YOSli2vHtH3ZnCFsbyZHYWmvjs93Y96ZE0eH2cIEFNYV0zvND1+Oj4T2qLz
	LoC1SYCyyTB/WX90in/t4Mu4CZP4FjIyyESgaGFlu2i+deoIhDLhccO+lYGpbeTJvRIg6zaEVFWF6
	thPMnmsGbFukMqVBMrc3WWUQN1jcLEpFdUG5DDKFg5ZiSt796kNkhSnHbeG4vc/tOTUzbMZS5Mggl
	y0n07SG+xOidpCkyIwxKfEQl99SMKYbFQ3AgrnvMwunjqOx7R9GCuLUM4f6JYmxkjfFpy/S+nYz8w
	3eHsFedg==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4J3A-00000001HdH-2Tw7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 14:13:24 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so69681055e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 07:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788963199; x=1789567999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BM+FXnkXLBUNE7UFVxinUiuh2gclbtUdB/nqDCPUVQM=;
        b=kXEp7A+wZ+NJpeJgmCeWlOxovpLzmB5PjZa5FHxV67a3+vzAsqEB9l7ykovPqDc8VI
         1GNayxtEfJEM+6DL/KR5AzU77w/jaiz+2yoWYe/exs9WrW554zyXdrdASpIvSYJxlCj5
         fFsw5Z5CrdxisetiMCdt7Tvh8k+u8PaV1RE3Tf3y0toZUMhALU7kXCMRuKqRv7Mal8yg
         r4x1zIPBzI2tZSccsjG5bjtbcAJPbApbXit0fncLjrCIU82Eee4YeMFcPaBIoluzxYEA
         /mzJ7Lpp05ft9T2Xr7lh//Y97gypYfescNNW3zz23UO2yfkCMjspzGYWKEjiqLYu85nJ
         cGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963199; x=1789567999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BM+FXnkXLBUNE7UFVxinUiuh2gclbtUdB/nqDCPUVQM=;
        b=VJZgECYlRRd18jDr0cf/jWhQgcxx8bnluNRpDeAypq5Dl9GEF9r+UD9U6/tonZMvbk
         ZM7UYdwHKR+dJLCHlXDHb7zWW+LFgakgXYm+0h9BQy+7qfpksPo/i3RFShZ3VJXaRp5j
         lYmGEwyvhfVG8Xm97VnarCjBI4yoyng0la+0HLo7mNsloVwhvv3NX4D0NAMg6FPqd6T/
         Kdv1dPqrfPwiOjttiIYIvv2/HKYNGRhhvwFC56gTceDK8VbWxSx/HjTvGhDbSAXCcFkv
         xqAp+orGa2axES/kcB0aodrU95mTjCuhhRfuc1O3HrwrOl5Ml9+dvn0pZEqz029RmX/z
         JI4w==
X-Forwarded-Encrypted: i=1; AKwUvBzNR4wB8j/e1URUJktrUsWomJPiXLtiKTAra6ra1EGsi7OtF8jql1Ma5hN3dobXNKiYtuQQBsUIwlI5KQ/sPN3E@lists.infradead.org
X-Gm-Message-State: AFuF++mXpKfaP5w+CrfS3Wu6Ivdrh4x66cltcTIbVHAKffgQdILnf/eZ
	PH0P0TrllYN/XHnG2F/oCQUhRY5Qoe8/6P4F/bZFcTxgo5fZfKakBNpD
X-Gm-Gg: AYBFou2VlhJercTNeTW38Ud53F0kukMmoT4+VnNwkxpadAI65pd+IOgrGhyUKzw+QU/
	WCbnaYV4SA8DRiHTgLtCrK+jZfv+UiZFD1rrzov9YUxgboetXspOhsx4joSYUqkb0RnnJWRABl2
	FhWPRxvHO1BM7LWdHU3U2p1SnQu2k7ewFVYj1mIYH50ZgPIGNCyelHT5cVKrrh6yh4wRuUAa9cm
	jkSdV3GPg+XftT67nxrXQ4xcUc8hFtTub0DSvv5gGNj5qxE/6BOOPnalKYklsXRFKUKi8Oq1sgZ
	Pz7aAqfZeukCYrwd9ahkyIqTCMSS8lI3pi5jgJakKg9Ztwifi8rM3xQNWbYiAJdVnYgfnEGk7Ke
	tH8QMyVrlvf6RQ5b673stNo2DPFAegIIwF75t0klrXJ1re83AKvFR8LpDD4GoZYbEsDdPG3t8QG
	7HWGCOPyyhUoT/ZMscngmLPeo91aIVGmvlBgLowx68EbhZmWeQhxzOmECGPMOLxv/AUZXf5Iw5z
	kBr6vpirIpC77IQU7wRdkjmiKPs5w4Hbo0Yyh5xuyWa4g==
X-Received: by 2002:a05:600c:3f19:b0:49c:fc6c:be13 with SMTP id 5b1f17b1804b1-49cfc6cc0f4mr320969475e9.25.1788963198564;
        Wed, 09 Sep 2026 07:13:18 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c074asm43273521f8f.23.2026.09.09.07.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:13:18 -0700 (PDT)
From: Sander Speetjens <sander.speetjens@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sander.speetjens@gmail.com
Subject: [PATCH 1/3] dt-bindings: rtc: Add Raspberry Pi 5 RTC binding
Date: Wed,  9 Sep 2026 16:12:58 +0200
Message-ID: <20260909141300.1368790-2-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909141300.1368790-1-sander.speetjens@gmail.com>
References: <20260909141300.1368790-1-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_151320_754979_D549908B 
X-CRM114-Status: GOOD (  14.91  )
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

Add device tree bindings for the Raspberry Pi 5 RTC.
Located in a custom DA9091 PMIC and accesed trough the firmware mailbox.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
Assisted-by: Grok
---
 .../bindings/rtc/raspberrypi,rtc-rpi.yaml     | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/raspberrypi,rtc-rpi.yaml

diff --git a/Documentation/devicetree/bindings/rtc/raspberrypi,rtc-rpi.yaml b/Documentation/devicetree/bindings/rtc/raspberrypi,rtc-rpi.yaml
new file mode 100644
index 000000000000..e9bade7f8c91
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/raspberrypi,rtc-rpi.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/raspberrypi,rtc-rpi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi firmware RTC
+
+maintainers:
+  - Jonathan Bell <jonathan@raspberrypi.com>
+
+description: |
+  Raspberry Pi RTC from the DA9091 accessed through the Raspberry Pi firmware
+  property interface.
+
+properties:
+  compatible:
+    const: raspberrypi,rpi-rtc
+
+  firmware:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the Raspberry Pi firmware device.
+
+  trickle-charge-microvolt:
+    description:
+      RTC backup battery trickle-charge voltage. A value of 0 disables
+      trickle charging.
+    anyOf:
+      - const: 0
+      - minimum: 1300000
+        maximum: 4400000
+
+required:
+  - compatible
+  - firmware
+
+additionalProperties: false
+
+examples:
+  - |
+    rtc {
+        compatible = "raspberrypi,rpi-rtc";
+        firmware = <&firmware>;
+        status = "okay";
+        trickle-charge-microvolt = <0>;
+    };
-- 
2.55.0


