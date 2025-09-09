Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F767CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SBuh28KbXIrgcfSkQ8KjquzRGwut7m7Az0UK1qF6ohQ=; b=ITkMbx0b2H2Xw2P4hmtFIncxV6
	7piX4UBhFyeudERj8X40iy5gmZ2W8dP5QPtjSUxaBkiltixpKnTUKJmV6ABg/k2O+FCTK8keI7xH4
	gGcgIERbcdDHu5GX5BNwlptc3S6+0Gw/fR2mCtsechSKe2FLEIjzES0W0XFyVbgMpocgvzCfpDS8+
	kqg3aKwgQi7pwXsnpqpzBp4AJEFXmxhH5tcXpbVrD1uGlXIiI7UxiqGZO02FMBSX0rO9+QQLpexHS
	k/NQp1gm5x6Fy8mqf1ChFJ/wLbULuTlmD44AzJH3ngoIYPpwUPEmVk0Wz4VaL/kE+cudV9oVAXio3
	tvDS8BYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0U2-00000008COl-00Xt;
	Tue, 09 Sep 2025 15:42:14 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvKw-00000006Hel-3rnR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:12:35 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45de56a042dso14510315e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 03:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757412749; x=1758017549; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SBuh28KbXIrgcfSkQ8KjquzRGwut7m7Az0UK1qF6ohQ=;
        b=SmB2qY/n2oDjGHrCx0/EgGcLl0TkHrRMalKpZHPz0IfpOOjn/CRkghBxewKljPI0M0
         iHRtfvfa8N7dTjuaug+KLFn1h3BAFevCGzOZHWZLrlyTFGJgmYlSVDkGtJfm9zOS+hRw
         M+JxFhk9GxF/eKyoCOdszvpU6Z9qlO2SVzC3CNrsjPcESypjVHIJ2cTS4u6dOFU33Ffj
         g+FXWNv/nlKfzCr+BheYyR0nWJh+8BAoHV1ek0ePCEInkAmt5bgt5AXfubcPM5wxIKsX
         wTLBq9xtHdGeD9c7x0kumA4b+w0mnKn2ZMrhbMR0bXXPvrr9qeaXE5KBQ7nATZOFd4/2
         I/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412749; x=1758017549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBuh28KbXIrgcfSkQ8KjquzRGwut7m7Az0UK1qF6ohQ=;
        b=cslk+SFISwPlZveVkkmcbSeTFW5WGpOEJ+entaHSHk5vrQ40+suF+Ltj1+cHiQfxV5
         LcPzjv0howGw+DXtuzbfogXhyURyuu7NHa/vVEEqQDqKVqrqz9yT3nALgO2qx5CQJiZs
         tn8AR/QMqGkbUCcTZ6QjqATVGDL1MlktX6n39fqmVTavvK2VMffYjH3Or0YCsX1k9U6i
         WybN2yk3HARE1yGXdL8wPu5LXcarmthtmoxgk8Rhe1mouEYS7ZadjjZ05L22XVuQG92E
         E2aaZxn83Ag1AkZbWdi+1eX43ubpqGVjpq5x2b8WZZUCPks4SL7QXQmNxe6GQSSKCFC0
         poBg==
X-Forwarded-Encrypted: i=1; AJvYcCXhcm0Wsaravlee9BP/GTL1C6z9OT/q6d38S15hYrnZcIULT7VAIm1kXBEZYG0nlkPQDZfvlWztHz8OylwQOZ7c@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/gim+IQ7laG8/maYYSvrABUYrlIjTxYe1Eg543NNS+gyWbbAc
	BHl0eM2Na6/fwQ+7Z72Mo65gxurlLzDprlTILMOSI/DwmdL9wOm90OLz
X-Gm-Gg: ASbGnct1OwaxwxEyEDemk/xNDvuutTTCOgyTDOcRfzCT5rE25M0BY1U6fWjsu3ejhcf
	qYk1GY6zSec6Ebn1MBwa7vd2vf8+NOROPhg8dCtaF4cOX4MVRVKlAwJ+KwSqc8w5T7uEVRRoh1K
	6LIbLjwbOFf5ydSZgm/F1vysLhmSWnYhOnHsJEHKQASrzj1K1V0kbR3IA+efPiRlcbjB/pU2gPs
	U7BtbCwzrp//XZMqJ/N2AR3x0lIEusQlSE9c8b9J/YKznV4rXAe/gWZaTgotXUP2u1PsnuCphNe
	bI+o4pxzFF8E9JUa+a8JzKWQx7Sx0dWQqUZyD9WmXUbTcMgbk5wf0acjenpHaoJuVtI+GqTo5Q6
	GNp5CrLUiQ7B0J1283l13REdW8Csy8Y4YxXHO+tNoSbeb26u75V9chb6CKB0xgdh7yOOOeOpQCd
	l4x34SOsDc/GK6Ryw=
X-Google-Smtp-Source: AGHT+IGKpZNRoMZ6IP/YPEfGuW0EUWhvKOcP7+Jc1iIS/x57GSvJehzCKAQ3NC+/6rTUpYigpfqyQA==
X-Received: by 2002:a05:600c:1c9d:b0:45b:9912:9f30 with SMTP id 5b1f17b1804b1-45de241c015mr86065355e9.6.1757412748701;
        Tue, 09 Sep 2025 03:12:28 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net. [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45de15de318sm129398365e9.13.2025.09.09.03.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 03:12:28 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:13 +0200
Subject: [PATCH v6 06/20] dt-bindings: memory: introduce DDR4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-b4-ddrperfm-upstream-v6-6-ce082cc801b5@gmail.com>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
In-Reply-To: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
X-Mailer: b4 0.15-dev-dfb17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_031231_077176_830AB09F 
X-CRM114-Status: GOOD (  12.29  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

Introduce JEDEC compliant DDR bindings, that use new memory-props binding.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 .../memory-controllers/ddr/jedec,ddr4.yaml         | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr4.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr4.yaml
new file mode 100644
index 000000000000..bf1dae15b65b
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr4.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,ddr4.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DDR4 SDRAM compliant to JEDEC JESD79-4D
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+allOf:
+  - $ref: jedec,sdram-props.yaml#
+
+properties:
+  compatible:
+    items:
+      - pattern: "^ddr4-[0-9a-f]{4},[a-z]{1,10},[0-9a-f]{2}$"
+      - const: jedec,ddr4
+
+required:
+  - compatible
+  - density
+  - io-width
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ddr {
+        compatible = "ddr4-00ff,azaz,ff", "jedec,ddr4";
+        density = <8192>;
+        io-width = <8>;
+    };

-- 
2.43.0


