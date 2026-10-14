Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD60BCC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDxjmt0bS4RhBRZPFlTXI4Mvp3X2uTTGOkn+NXVrE0c=; b=cyRgdN45DTQLq/MUoSLsql1DFj
	0RVitfJnuzERxEzntJAZGYhzOl2zGGFMyN5A7lVZAY6Vyjw8MQiC3DKMQzFK7WJmnoxsXEtrVIJhR
	UMDaieEcCOwWNSyVfyQ7x8UHhHlGmghoVG3ZoIx16qRwnEhwPs+c3JjqdwDUeX9f7Kcnq/0kx2WBk
	FMd8u6wVosFXZ67AEVfYq6vgoxSip0uXJ4Zyd+SHQaYJQ+X8U32JAT03NXKQIMl/UR8k+dZLMLgt7
	w/qcK8qtTHYhJAMaq3OfzjCjxGUFoNM70xcteRLSFyxQw8V8X9eKigxZad79HcdmpSWshF9667Cj9
	yMGajgaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKX-0000000EjPh-01aV;
	Wed, 14 Oct 2026 07:23:17 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKG-0000000EjCi-13Kv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:23:02 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso3663925f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962578; x=1792567378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xDxjmt0bS4RhBRZPFlTXI4Mvp3X2uTTGOkn+NXVrE0c=;
        b=QzQevIRN/92Ld2Is1y0EWf7A+9sT1aIUTPdiIqUARs061qQVU/F0Z2qU7Iy44mIUzA
         e8NDCyh6ohdUDTYiM9QXcvNmej/ysbLJAjrb8xLF0tBaux43zHHwcVTuNuafy7i5K6kt
         KQrSV2OQlhOV1OaXs6PGFY2qh26F+A9rlXCkCj3cBlXAHtlaqh6m6ifvRMl0yC7UXTIH
         D7XHE55chwN8Pjy34J8Y5lDL5vH/UHCw5HVYbWrTUFLTAA7JVWjho+mvzgrQuLsvI5Wg
         8KgvUHQD/CvIFvW10M25N3gVI7iq1B9iBVgpsemPlCyvEJU1x12h1B5145t8k8VTFunh
         UjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962578; x=1792567378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xDxjmt0bS4RhBRZPFlTXI4Mvp3X2uTTGOkn+NXVrE0c=;
        b=m32nIp95tpug5YHLgcOVRSaZflr4JFU/+TEnw6Fy7c+9KCZ2kwtb473z2+LSjKh2zs
         r9GW1stxY4+Rh9KFUBjrZtQXnni1gzMpB9ZoG0NfNEiBH1Y9MwHnW89bUv11u471WCyG
         /ALuC3TtFPHkAPVg/1PGczlOSwpUOPKVX4ITI/N+ZKppiiohjImjAgERZyduTLM10It6
         O4OFrswagXAn+iXycdVwY1sCNctvo5FHyUOD9nxbmg1NrYPUJMSZcJq5Sq4B0+YJ2Qvm
         wdou9OlXEvdpc6dQU36Z/zxMZ4EpTuKlWqvg+rv7h3335U8GhWfzgyg4q0jYd0VjAvQd
         neYQ==
X-Gm-Message-State: AFq9FYLyHiHbdf8gqNaN8GfTHqoPxUbLQx5O7SSdDEv2ngliOxc+h0+6
	pwDgRwnWWdH8xFXeRiboKacgjeQaIV0mt9BaPq36O0FpDSNw/VqWuGZJN7lV+Ew84DBveQ==
X-Gm-Gg: AYBFou3jqtY2Eeueozo9UH3U6FJ/bP4A0K28TN6PejwyM+UYfupdfoXZAXVhGzdCFsv
	trks+zcscZ+OJTvM8GLBOu7MvuGBQb1pPvgA0nyGFLKkLANwFWj1hRY9xdQ5abVxaUZfNMQOiZL
	qqn39JFw86/ATrCAzSTYTVlI+/UrgEItZVDcKbhXE3DV4w0MlDXREvZ/scd+CyB4kj3ugWbxFPe
	TqG4/3kNOTA1P9OVLav/QrqKDpnraoCQgP2gTd+nuGKijig2hogQe/iRnsoul74F91fRY5IzZmg
	K8paniRGWhwVxrnlg+AoRdnjixI5u9mdp4NF0+kgXQCzq0VWQxJq81w78HUJBEVewzE0j5QEjjb
	oiJl1LVSHc+RMdCgggfLN3Hw9MslnHD6Wg2LIU+mCmnUe9Ss6pjMfc77MMRttdrdPv9AjYRCTWF
	kG7UOjieuyKrkv4K9mdBmPt4yF2dS58Dt5/RSFR94NzGlhSxYTX89wS1xGJsdaVgrqWehpPq4Gb
	ys3dFqMiIkFxB+nBWY70DuXUKiQsczu2pewOPocds6uHyNeFRdiTTfrWUfIQh/ENPam/eKDIioz
	CJmOrxoxcpBPGunRsiqtXcXVG8xApIj/zq7LJeJMm9YSs40YYuZu3Z4l9gfcRw==
X-Received: by 2002:a05:6000:29c3:b0:48d:7579:1cdf with SMTP id ffacd0b85a97d-48dba9e633bmr15389523f8f.8.1791962578267;
        Wed, 14 Oct 2026 00:22:58 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:22:56 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/24] dt-bindings: gpio: Add ZTE ZX279128S GPIO controller
Date: Wed, 14 Oct 2026 08:20:47 +0100
Message-ID: <20261014072109.1759502-8-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_002300_394878_CAA0711A 
X-CRM114-Status: GOOD (  12.71  )
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

Describe the register-clock consumer and GPIO banks.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/gpio/zte,zx279128s-gpio.yaml     | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml b/Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml
new file mode 100644
index 0000000000..132c7126fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/zte,zx279128s-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s GPIO controller
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  The ZTE zx279128s has several identical GPIO banks. Each bank has 16
+  lines and is described by its own node.
+
+properties:
+  compatible:
+    const: zte,zx279128s-gpio
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-line-names:
+    maxItems: 16
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx279128s-crm.h>
+
+    gpio@94407000 {
+        compatible = "zte,zx279128s-gpio";
+        reg = <0x94407000 0x40>;
+        clocks = <&lsp0crpm ZX279128S_LSP0_GPIO_PCLK>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
-- 
2.55.0


