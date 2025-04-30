Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AF8C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 11:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SQrplKuznos3CKU7xsOCXM8cn9nAbF8UQ/A3fpprKKY=; b=4yqaO6nnMLjXnI9Ia/fthsAZZc
	IqV8TU/tEtyNtHcL/KsZ84MGkhhXb/AiKtI/+rWzxO39mwO7YYljTQdsgzdPAG1kzduZPlQYRPFqM
	TSZZMp/P9G8MmUHuKp/4J1epwmeZGupaxMIaxRsxZABowANEkiRhL9MBzlWzCZi2V7dIiqX3NpoJf
	qhFgz1WhvWXJ0yCzS3t+CC3BuS5UCb8UqgTu9feIrEOLjJRo7JROnKZAJ7jfx7B07YTuYt8sq0fzx
	RDPZfYv8G9FI4HWpYfnRve+3gkUBboFWBLKMCsNqUSwmq7NRrsXp/htuuf+QCtE14+iqFnlJPRphT
	rqtvrzMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA5Ne-0000000CeDq-3G4Z;
	Wed, 30 Apr 2025 11:13:34 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4jO-0000000CXSH-2zB7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 10:32:00 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-736bfa487c3so5829780b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 03:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746009117; x=1746613917; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SQrplKuznos3CKU7xsOCXM8cn9nAbF8UQ/A3fpprKKY=;
        b=VaTEP72JKFweVhaQUmgim4tDx0XtHblRYi9kQ2mvgpSUfSdHqDNMPRKRFhzgVp4qge
         BNBBOurVSaeXXg/k6kfAI93kVcX94rgvRgXlk4j3wW8d1oAzRzTujF/Rw3mS+5dAsKVx
         dYDLS4Ihc+Hg3jtw5C2LmJkk1MppW+4rEw3dxrS/dFiDXn3TxpfzEVnL5qnuBbSq56gk
         OwJFFrR1DXiIYI9+kbofwBMMoLoea08HMxPqTaCkKnS9ylLh+wDCQwDmTmwgNafMDcT6
         07J5jxRO8a07chxGmQuxJUu6mrxMNkLvzwfW0GbBLvr/HCpuYRKgviYdvBc+GugXmhSN
         d8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009117; x=1746613917;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQrplKuznos3CKU7xsOCXM8cn9nAbF8UQ/A3fpprKKY=;
        b=VnmHdXuJA+iwCyFsZzbsujch9QYnDmuM4EvHwrn/4tMWrWqWEaqsShBpa0JY8C+qwq
         axcqTnA7b/aSV/wK+YhA49KZ4fwFxTLsyf8PeIg0RnEOTtsBn179ts8hiMcP9AUUoYms
         IZUOfQWq26q68QwW/H/4mr594tntJcdO3E3cevtYJPkoc9XJNRcb8Gs+d6cnol1BpSuv
         S/oxjRP0vHys4SLF30FTPnlfjVsstTqo+G1GuAIj0Zxopd5rIIVvNUDuesX5iLlNrDHR
         Y3mVmuRXZMUwZEu8wyqT/a7PGfMhyVHzevQ7W3rDt42JJPuzqtzOAiTjNYpIPrNa1Lfm
         9Peg==
X-Gm-Message-State: AOJu0Yw1iAifEJUfInKIyYKk1/apbh5CC8FW0e/qfArWOiVyagQRnExY
	npsjd8c6zWWyOyfhptZ9Y/FY1HopZB7hTjg6lO8xyC49IqS6TUcp
X-Gm-Gg: ASbGncs5MAwGCow+B32NJaZQQY1L1GrsIBYGWtDMlafvAzftfmrUjNWEYlGXAFwUQ+f
	RLzciZJHz0MOHVnh7WF2MnO2I9nKHv208ih1Xnm2N82kVNZsloiPfEYGqxNibNc47q3AXjqJtye
	0RH8xLJP+BSQNgoAhhRxsbzAJmNYCHnc+FGuGcU7/Ga060jnEJCTwjTkMwHDYI1cVn+w+thhJ0H
	jZ+Woh8SwN4IBbktsHxnanNnM5GCt8HscYbY9GzX0ykuHjbM5OJmt1OzpuBX0wXU6kJZ1Drum78
	Hu+cdDza2iVSyVoD5wJ9t8lZoXVs48YCvyF/DN/0IjIKcrjywFJ7MEwlRjom0Q4=
X-Google-Smtp-Source: AGHT+IHZe0TXYslujCTYOtGtFjRpT6Y7Y076cq9NiJJvVsBDGspddr6Y2NW78t4g4qygnKEUxRNGQw==
X-Received: by 2002:a05:6a21:318b:b0:1f5:7280:1cf2 with SMTP id adf61e73a8af0-20aa2be02c6mr3127615637.12.1746009117455;
        Wed, 30 Apr 2025 03:31:57 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f7fb7e54sm10432071a12.30.2025.04.30.03.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:31:57 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 30 Apr 2025 14:31:36 +0400
Subject: [PATCH v2] dt-bindings: i2c: i2c-wmt: Convert to YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-vt8500-i2c-binding-v2-1-0cf22d0c2d42@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAf8EWgC/x3MQQqAIBBA0avErBsYNNG6SrTImmw2FhoRSHdPW
 r7F/wUyJ+EMQ1Mg8S1Zjlih2gaWfY6BUdZqUKQMdZrwvpwhQlELeomrxIDG6956Y0k7CzU8E2/
 y/NNxet8PM1//82QAAAA=
X-Change-ID: 20250430-vt8500-i2c-binding-5b397b570387
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746009111; l=3387;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=qxwCK+TKSFOdpqEKu97fiXM9g32n+PW28mqYHuBGsDs=;
 b=pMd9cRXEoGac6qEgsXthAvZ3Q+fu2//TgoRrNM2QN0jMYGlCBojb9PBLN0Fq/sqk95OLemU0U
 433B6Ghn4mEDtMrlVS0MABfIWYxWTQgeejr5T3U5ZvZsvcEDrC9NFQD
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_033158_754021_BC25339A 
X-CRM114-Status: GOOD (  15.55  )
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

Rewrite the textual description for the WonderMedia I2C controller
as YAML schema, and switch the filename to follow the compatible
string.

The controller only supports two bus speeds (100kHz and 400kHz)
so restrict clock-frequency values accordingly.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Changes in v2:
- Added Krzysztof's review tag (thanks Krzysztof)
- Dropped the update to MAINTAINERS for now to reduce merge conflicts
  across different trees
- Split out the i2c binding separately from the big series affecting
  multiple subsystems unnecessarily (thanks Rob)
- Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-1-f9af689cdfc2@gmail.com/
---
 Documentation/devicetree/bindings/i2c/i2c-wmt.txt  | 24 -----------
 .../devicetree/bindings/i2c/wm,wm8505-i2c.yaml     | 47 ++++++++++++++++++++++
 2 files changed, 47 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-wmt.txt b/Documentation/devicetree/bindings/i2c/i2c-wmt.txt
deleted file mode 100644
index 94a425eaa6c78bc9e3136ae7055b51635baf16ca..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-wmt.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-* Wondermedia I2C Controller
-
-Required properties :
-
- - compatible : should be "wm,wm8505-i2c"
- - reg : Offset and length of the register set for the device
- - interrupts : <IRQ> where IRQ is the interrupt number
- - clocks : phandle to the I2C clock source
-
-Optional properties :
-
- - clock-frequency : desired I2C bus clock frequency in Hz.
-	Valid values are 100000 and 400000.
-	Default to 100000 if not specified, or invalid value.
-
-Example :
-
-	i2c_0: i2c@d8280000 {
-		compatible = "wm,wm8505-i2c";
-		reg = <0xd8280000 0x1000>;
-		interrupts = <19>;
-		clocks = <&clki2c0>;
-		clock-frequency = <400000>;
-	};
diff --git a/Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml b/Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e498ce47b885203fcfe233b946f987abdac6784a
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/wm,wm8505-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I2C Controller on WonderMedia WM8505 and related SoCs
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: wm,wm8505-i2c
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
+  clock-frequency:
+    enum: [100000, 400000]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c_0: i2c@d8280000 {
+        compatible = "wm,wm8505-i2c";
+        reg = <0xd8280000 0x1000>;
+        interrupts = <19>;
+        clocks = <&clki2c0>;
+        clock-frequency = <400000>;
+    };

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250430-vt8500-i2c-binding-5b397b570387

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


