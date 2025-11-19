Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E578DCF3941
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=plmpXAswm1LBomkuKtBG6pEMvq3kPgWo3F0t41OaVKo=; b=Gn4tm/F3V0BBwn6+7zDUt/qJZ9
	xQ8P1zPw5/u4Uzb7lYEEGppL4L9k5sMpctSq0zc8v3CsBnMDv7sUwPiT/zN8cFzY1ofByv2bwO158
	0noZOS4c33YdZgMoWJMgVeNILhVXo8v9zkQ4M5euYmnS+M3/dWgBiCtYtBk8pL6nhV9CGVPjGSD1k
	roIAVwV5zVexNSH8eMWNjKJui4c52xQK/2gCaNgZFieapv+yaOV+wfPTwipoFC4DXAv/9BRalGDNj
	aJzsvMqSUJ/v87NOiqRvjVlPrmneNzGU6HTXMve+7BrWpOgSM0tX8Czo1M0zdCdIVYYGUN8/aKrtd
	/ZYftbAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkOJ-00000003XTq-02YP;
	Wed, 19 Nov 2025 15:46:43 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNe-00000003WhR-3DhL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:46:04 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42b3377aaf2so3866518f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567160; x=1764171960; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plmpXAswm1LBomkuKtBG6pEMvq3kPgWo3F0t41OaVKo=;
        b=xwchcuV8NAqNFEyZws1LSX+Ei8ov0DyN1FJA6qM7iZpmKg6u6xGm4j7cGnxr059z6Q
         gglFyYg0JtryEdyu8sCJMAft5oiqr56/Dsy1Mrq11XJJ3Zz5+RX0LbJrrdNodqbiT+n6
         tnRfIrdzLXWh+vMhCXLq8rrDHwtlGfuoQFTzaVxL5pwYpZ0QqTfiFStzPSQdBy6N88DH
         1O1hLxq8iGh9HVldk1liUvayyk98U9qn9s6NsFa7qcRD8YKYm1BC1CcjRYcO6Vw7fi1m
         srBAXFcfwsJgjalV+it6K3FZpBPeyrsB+b4v/Cg5XNBaXKXiaVLUx0EG1T7xgoAxgYtj
         9Vkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567161; x=1764171961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=plmpXAswm1LBomkuKtBG6pEMvq3kPgWo3F0t41OaVKo=;
        b=IIEu5PNEmk7KkmrDs2czAwfyej0qO32175zFZWam+3d+Krxwe0IUMiE5v0rIV3MD1a
         0DPRIbSZfmW/EEP19sVG0KQLHKqFRbnu0BhAw2a6lYdKAqTUuC+qhhNF2Ze1gwVk3ocT
         k0NIcvWBYwqdGvVA/+9UbSpG3F+2Ms0HzKtACKrPGhak3bhq+eqRSCJP7D3IlefU8GbT
         5Va8WQVB1N4x+CLfNwdVVz6ZX+HTcAYm6FLoHT4l7WFEsShGsfWqqMrSNXLkHsepTx3o
         q4gZLPi6ZzDqDYWSATfximVgI3oNSDKsCVOOup/Lm37C3foCFebg/dH+Q+t0lV5SsmUu
         U6vw==
X-Forwarded-Encrypted: i=1; AJvYcCXJiyn6BzCihlE8qw3jUTwJ2DdgkNiXulL7OMbmLmfiNswHsqBwp0AhL9vRv4UzJ+PCvwJhLBaaTzZhSwSyDGS/@lists.infradead.org
X-Gm-Message-State: AOJu0YxDE1a+RMpAZH61sVP1YxEO9zQ/+QqI6WFaq/HQyoFbZ0euMkYr
	orDkf0Vh1DIZYSUBh+ftvUHs9dwtypQdZa61lmFYFDFXD5NWbKaDR5znI8KP7hD2rl0=
X-Gm-Gg: ASbGncuh4FoZBKeuQcCEZnX1Urp3LKqBAB3rCHETS6DLe7zmy6swGjXvXUgOG13HkDD
	N+YtUTdx50uoyGVCDmM9uQGmljnYVMlOGH2paB9nfIAQJLY/SoOkHmDmWTxGlAQ4HzLUJFUdOKL
	517SOY7Vpg9PETNnxws+1ljKNMk6bYU6N47JH32b8toWCvg41YNImLEiOj1O+G+8TXWcRJle690
	WPSRIJ+Gykxdk02S1cdRyAMQMqYDeBEo8NWKe2WEVyGgFxg6z1G78ksZpLzue9oyhwPaQ34+ZCm
	Ma5bPqa1NyOvGc+a4k9XaUeAw9KXw9LgRoI0SzdUCG0+CdLqfdqAStnirWW6Dx2wagvO+LNml0I
	5EAldMclF6Fl0D+mV7XtzhvYEFWfF5aaBZ/st1EPuh3VhNa9dTzlQiYGxV2MItWolEWvuquS9na
	Qnci0TLOyEzDmor6oS98JEbXM8pQuPs/NRfZoHul26
X-Google-Smtp-Source: AGHT+IE/UWqNyS6htQwPVCsFX9f3Bqg52uzu0v0K2d2YIVRMOF1vqDQaElTCpee5ClbOZybd51PSbw==
X-Received: by 2002:a5d:5d0e:0:b0:428:5673:11e0 with SMTP id ffacd0b85a97d-42b595a4ffbmr19851079f8f.40.1763567160526;
        Wed, 19 Nov 2025 07:46:00 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:46:00 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 25/26] dt-bindings: reserved-memory: Add Google Kinfo Pixel reserved memory
Date: Wed, 19 Nov 2025 17:44:26 +0200
Message-ID: <20251119154427.1033475-26-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074602_892487_671491C6 
X-CRM114-Status: GOOD (  15.40  )
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

Add documentation for Google Kinfo Pixel reserved memory area.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 .../reserved-memory/google,kinfo.yaml         | 49 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml

diff --git a/Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml b/Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml
new file mode 100644
index 000000000000..12d0b2815c02
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/google,kinfo.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Pixel Kinfo reserved memory
+
+maintainers:
+  - Eugen Hristev <eugen.hristev@linaro.org>
+
+description:
+  This binding describes the Google Pixel Kinfo reserved memory, a region
+  of reserved-memory used to store data for firmware/bootloader on the Pixel
+  platform. The data stored is debugging information on the running kernel.
+
+properties:
+  compatible:
+    items:
+      - const: google,kinfo
+
+  memory-region:
+    maxItems: 1
+    description: Reference to the reserved-memory for the data
+
+required:
+  - compatible
+  - memory-region
+
+additionalProperties: true
+
+examples:
+  - |
+    reserved-memory {
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      kinfo_region: smem@fa00000 {
+          reg = <0xfa00000 0x1000>;
+          no-map;
+      };
+    };
+
+    debug-kinfo {
+        compatible = "google,debug-kinfo";
+
+        memory-region = <&kinfo_region>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 2cb2cc427c90..8034940d0b1e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16164,6 +16164,11 @@ F:	Documentation/dev-tools/meminspect.rst
 F:	include/linux/meminspect.h
 F:	kernel/meminspect/*
 
+MEMINSPECT KINFO DRIVER
+M:	Eugen Hristev <eugen.hristev@linaro.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/misc/google,kinfo.yaml
+
 MEMBLOCK AND MEMORY MANAGEMENT INITIALIZATION
 M:	Mike Rapoport <rppt@kernel.org>
 L:	linux-mm@kvack.org
-- 
2.43.0


