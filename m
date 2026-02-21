Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B07EC61DFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 18:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tuboJBenXywBLFqud7lu9/BOWrHh+KcmgCOX5jvamjk=; b=nAvfgMLTc5XSPshL30Nz6BKKpV
	/QwrEmQWym0pFsoDrrk4qOLbBhgnFICSqbwIV4F95Gyi84VqDwn+zJXIIb+VPQ30lCpoOWI4zGo0B
	oMcj1us8ZFM6xF6Zccr49Wy4Stxz1TC8NqZbz8zmKSPetbU77cgFWNKCGlEz52IAGZR1YMA1U8L+P
	rKVXegQjC6vl1bU3v6cvNueA2KV0z6oypsecvsiJvnjlTx048CytzsSAHhquihMT8fwRNMIks/Ll2
	E1nzApxOIzV/jhzq8ZYhPI4u90baHo8XM9mIyooxmH4C1Gy9Dk+rQCCDvAEZtnEjprBCPZSgzNoa2
	GM6sKmWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtrqQ-0000000GFWL-1ty4;
	Sat, 21 Feb 2026 18:36:46 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtrqN-0000000GFUr-0mSw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 18:36:44 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-38707d4c8b9so39189491fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Feb 2026 10:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771699001; x=1772303801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tuboJBenXywBLFqud7lu9/BOWrHh+KcmgCOX5jvamjk=;
        b=jH+iLAdwE+d4XXiv4mOq81H9PbqaohdD3MZsO1V3Gg/xym6VfcZX/GinmZXVNL9h/O
         WAv4e8+yTOiRLqMgtttwVNOS19d5YqOOeX9MWaUAV5dyieIXWlCRVpcdwk35H5U+HiCI
         ebU6QX39/sBz3SuEoqo4jQ+R94nPRlTevdioNVzUblJlSHEpaw+jKlef09Q1AJv9pgDG
         ncRTftCgcygrWgrR6XZwdMwNzxZRalA/Cvy3VlNhfqIqqdaTqtGuK1ctrY8X0HqSH9zH
         LZ3Vgr0ymxg3e3vc76u9WfpPNaxWC/+b/Ubap8dXlxKt/B+KHdu77eMbLc0oe0FQiBFD
         4KGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771699001; x=1772303801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tuboJBenXywBLFqud7lu9/BOWrHh+KcmgCOX5jvamjk=;
        b=ltCbdDEIJK0DDTu/BglOKzRbC76ouAARzyf1EYFQ0EcdaBH9cXBowru/arpafsaP+p
         VUGN9/stDGFddq8trJX8Q6TC90CbESbEHhEObGbm9Vt2r/vHxt0FgrimGETL4AobBQmH
         5w0vRcKRbtgpqcGvF00F8VereJbU9smrrZ611Iio0n5u7EIpOkJxOctYLc7Jsm11BFns
         FdnIgbrfzWEizpLSpqW+s1FKv3u82byI7pVtKTYGASV+E68GYj2coWIQV34VmnW+KICl
         L7m0v5Sbf6k1Pcw8Kc2EW6czXe/RCpBFrrTFt1gMwo1+96I+SBkUtZjeW9kE25rvH1V7
         4aMw==
X-Forwarded-Encrypted: i=1; AJvYcCVVCTe+eiUBl/wUG7hMY9YhRXfj+FjBVKDBrDJuWgEYaDK8LghPJCaXtdp7UofDjwYJgzyNPTFwdivJivOZqexv@lists.infradead.org
X-Gm-Message-State: AOJu0YwL+spRICccmT2PK/JxpKTsDO+SyXpd+OdxjK9GjLd08QJ0xVb3
	vLAbICJbtFbxnKbMVqpf+YxXOgrPiQgLYcxPPq6Rr7EyMKfowcAoNWo=
X-Gm-Gg: AZuq6aKFme4vm/AWPsdn2rRp8VaW09TJfHlVps1+/3y/We+5DEYn74YMmAG4bVMCizK
	HQvdJFL0gAw/I25SVLvspBkCKgGsmaU2HuWTjnhjmO9Dq503y03joLSdKTtlM+nh1kwn4HiPL/h
	OJ9/SXlBmcsQPtiMdgJIAAjEWPgul4ipya/cP4yNPr2D1ZwcAipeBsjJ9jrwrxgyhO+wTdvFj3m
	v/gR9kPcB0wjdtrMilxIGTAe4V2c1+9MZpt8ZsFg0wWz1gN3XUaOPD3zRQTzm2nSxL+Z2cqpUud
	+PQJS/j+ELK8ZuRrJYNf3Ui+6P2yI94AqqdfBAuvvBTnzaHpvirPwdatT8HcOAf4DWtvQpAW7nQ
	/Oo11HUXTpVoAXKdJjxBmyNZ+ShRDr56i1h0V3Dp3lBVjl07ubeG6SlThUxr2n3p92cKodHXnN2
	KpYSFVn2wS63vHP5qOUEfprShKVZLsyEyyFRdq
X-Received: by 2002:a2e:be94:0:b0:386:eadd:9ddf with SMTP id 38308e7fff4ca-389a5cdd595mr8800811fa.12.1771699000922;
        Sat, 21 Feb 2026 10:36:40 -0800 (PST)
Received: from localhost.localdomain ([178.176.177.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7af19d4sm5006841fa.42.2026.02.21.10.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 10:36:40 -0800 (PST)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v13 1/3] dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM controller
Date: Sat, 21 Feb 2026 21:35:51 +0300
Message-Id: <20260221183609.95403-2-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260221183609.95403-1-privatesub2@gmail.com>
References: <20260221183609.95403-1-privatesub2@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_103643_238615_559BC227 
X-CRM114-Status: GOOD (  16.53  )
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

Allwinner's D1, T113-S3 and R329 SoCs have a new pwm
controller which is different from the previous pwm-sun4i.

The D1 and T113 are identical in terms of peripherals,
they differ only in the architecture of the CPU core, and
even share the majority of their DT. Because of that,
using the same compatible makes sense.
The R329 is a different SoC though, and should have
a different compatible string added, especially as there
is a difference in the number of channels.

D1 and T113s SoCs have one PWM controller with 8 channels.
R329 SoC has two PWM controllers in both power domains, one of
them has 9 channels (CPUX one) and the other has 6 (CPUS one).

Add a device tree binding for them.

Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 .../bindings/pwm/allwinner,sun20i-d1-pwm.yaml | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-d1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-d1-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-d1-pwm.yaml
new file mode 100644
index 000000000000..306e14a9c4d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-d1-pwm.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/allwinner,sun20i-d1-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner D1, T113-S3 and R329 PWM
+
+maintainers:
+  - Aleksandr Shubin <privatesub2@gmail.com>
+  - Brandon Cheo Fusi <fusibrandon13@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: allwinner,sun20i-d1-pwm
+      - items:
+          - const: allwinner,sun50i-r329-pwm
+          - const: allwinner,sun20i-d1-pwm
+
+  reg:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+  clocks:
+    items:
+      - description: Bus clock
+      - description: 24 MHz oscillator
+      - description: APB clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: hosc
+      - const: apb
+
+  resets:
+    maxItems: 1
+
+  allwinner,npwms:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The number of PWM channels configured for this instance
+    minimum: 1
+    maximum: 16
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#pwm-cells"
+  - clocks
+  - clock-names
+  - resets
+  - allwinner,npwms
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun20i-d1-ccu.h>
+    #include <dt-bindings/reset/sun20i-d1-ccu.h>
+
+    pwm: pwm@2000c00 {
+      compatible = "allwinner,sun20i-d1-pwm";
+      reg = <0x02000c00 0x400>;
+      clocks = <&ccu CLK_BUS_PWM>, <&dcxo>, <&ccu CLK_APB0>;
+      clock-names = "bus", "hosc", "apb";
+      resets = <&ccu RST_BUS_PWM>;
+      #pwm-cells = <0x3>;
+      allwinner,npwms = <8>;
+    };
+
+...
-- 
2.25.1


