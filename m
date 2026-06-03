Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC83CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KlJLsFGfJfKvxb8nj21NQln9bu8CETkKM8eqefnewUk=; b=LF+yjJrOIoGwWgVwb9dGBdjqv/
	AmIwchFXtxC4exFsCsBIwXXx6vbqXt8ENhRTCK3glN3eJBMheUO61fQTmTSvz+62Ocf7Jv3t584tf
	9bODHAnS0RcAIJkzhRxj66PbuBJNvvWk1v3C73iiN2MzaJP2Rm/Nu3hYy8Wxa7MqZiqGH2vGCLFZb
	zdVZUDETqL0sByneUw5c9YnWoQcwHjrNoIIFnCB5tsjIGPoChRCtSb2sFFEXa+A/aNSozsjH+KlQM
	7aDbywxUXjTZglnOJxi9kSZYWi9o9YKkj7d/TDPOPlWmhirHycshYzuWb/7IBiT8hqEexYNS/jboE
	r0DmXQ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnSZ-0000000FPT1-0uaR;
	Wed, 03 Jun 2026 15:24:47 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnSV-0000000FPR7-3mAa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:24:45 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490ac357c55so36116095e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 08:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780500281; x=1781105081; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlJLsFGfJfKvxb8nj21NQln9bu8CETkKM8eqefnewUk=;
        b=StOjOwsy37XxseO4FSIhsvJMJuebxdIFs9PDIFV1OSlMsVxOTyj+D+b/6lrKhMdE1+
         Q3sjj8sa6Xky43qAxXSxhiwfjUXCcgz7jwIYcp5FMQ+VjYDH5HaP3Q2neI4VMD81ZMQ5
         MGylGtBH978JNtRk16/ue6Xh4QmDeIPKq+h2SG3t8/KGbU/FEErVYz3tqEVk95ppPmKd
         MdaFozAsYwZqz9z3LUElh2louol+VH5ZbHBi2THOqWJY7XcIDbBPaTOByhe+yy0xxbQ6
         uF8a8w1l+mwlbrcLsecMHHDsl4cPqegp6UabMYKHm7xEfCAwD7cl+tsfOYnQ9dDqUjy5
         I+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780500281; x=1781105081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KlJLsFGfJfKvxb8nj21NQln9bu8CETkKM8eqefnewUk=;
        b=DEJKu6Pj6zzCuFbm8RW2pYV9Cv8bTm9FfWJTdy8RaUc9zltu7Idkp2XZd0LUUgIz5h
         1aE9uii+V/STpO7LFZdeig8ezSbJBJISznniE0F4EH9ooAoCfE8qCfNntr8efoKGiocM
         lcJEY1xFkKCs/PFpFO5oA3B3/z5dD46lhx8GL77oJjvDZuWpdkYbjV/IuTck6Yiuf/KT
         e5aK9Kdwn634yrOaJ13BZknjNlGggL4kl2U0C9nkIqyExiD7NuXe6YGkLJh9IBTJjdi3
         Vmyfk8hpvI6+mC0p3M7GT79Y2byQxeRTyzJJcqsJTZ0pyjS/WoG5EENJLs54UlNNeMk3
         BxUg==
X-Forwarded-Encrypted: i=1; AFNElJ8MNBxbRZ8N9dNZGnD8C4zgbRwB1V0Mol9REcDFUhkbhPIw4jAdO7NFIqCLQ/TITLCS7qDCIRKIJgHfs+XtKlKb@lists.infradead.org
X-Gm-Message-State: AOJu0YwSD83IXlT6MdB7ovHJ8d/DTlSl4s+Zz2GtVEwjDbuOUE3uygJu
	XxCtUiDD9MYSDb6TcvxdvJVYci0cuwVo3lcjd3ncKf/chRTsI5zAdZKqGGRFZSYxhz8=
X-Gm-Gg: Acq92OFtLAlEouTxWZzJv61R1EDQwc/kIC5382KfEkJbMe4P+2Qd1SxKKcS8pn5kbeG
	UnynZtsHc27QyP58wHOHN6EbKjDYW9VgRz9SESvaQe85l58ihJxNJsILDp1Xo/0dhfHQl9WUNAU
	dkBXzVdK2ANPGLoXJaxOlw1g9h/xuy9vdLJhRw9kWFXbG9YVqv6o5/F0NULo/FdocucVwllDAtB
	6MQzCR0sdn+F+KAstgWGaPS8ZK9j5nDNGKr1Nz82KfKRk64Nfm/FeIS4rQ50qP5SWqD3YvO1u1K
	F+M8ifGOGMjjKy8saYLLZiW7yDe8tgZHt6iWoG7T5lG24IHsE7WGjhA5GprifLqDv5+Anqe2pGP
	4R4qTWCNpCkIYwBk/1w+amHGLrNyOT0pPWoy0XwLjC9Ll+48XwNIfS2koEgXKOk4TXCTDcSM/bK
	RODmhwinbgkrQCN06UwUcSBRzsyU4LZa0l56T3eYhD1fo=
X-Received: by 2002:a05:600c:810c:b0:490:a646:9d77 with SMTP id 5b1f17b1804b1-490b5e94d2cmr73159965e9.6.1780500281611;
        Wed, 03 Jun 2026 08:24:41 -0700 (PDT)
Received: from localhost ([82.192.120.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm8487897f8f.19.2026.06.03.08.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:24:40 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Date: Wed,  3 Jun 2026 17:27:44 +0200
Message-ID: <350c2fb454951fd2c9d959f1d94802fea8fa8152.1780498640.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1780498640.git.andrea.porta@suse.com>
References: <cover.1780498640.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_082443_958356_051323CB 
X-CRM114-Status: GOOD (  16.15  )
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

From: Naushir Patuck <naush@raspberrypi.com>

Add the devicetree binding documentation for the PWM
controller found in the Raspberry Pi RP1 chipset.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Referring to the first comment from:
https://sashiko.dev/#/patchset/cover.1776932336.git.andrea.porta%40suse.com
regarding the DT-bindings, #pwm-cells is not required here because
that requirement is inherited from the referenced pwm.yaml
---

 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
new file mode 100644
index 0000000000000..6f8461d0454f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/raspberrypi,rp1-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi RP1 PWM controller
+
+maintainers:
+  - Naushir Patuck <naush@raspberrypi.com>
+
+allOf:
+  - $ref: pwm.yaml#
+
+description: |
+  The PWM peripheral is a flexible waveform generator with a
+  variety of operational modes. It has the following features:
+   - four independent output channels
+   - 32-bit counter widths
+   - Seven output generation modes
+   - Optional per-channel output inversion
+   - Optional duty-cycle data FIFO with DMA support
+   - Optional sigma-delta noise shaping engine
+  Serves as a fan speed provider to other nodes for a PWM-connected
+  fan using shared registers (syscon).
+
+properties:
+  compatible:
+    const: raspberrypi,rp1-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwm@98000 {
+      compatible = "raspberrypi,rp1-pwm";
+      reg = <0x98000 0x100>;
+      clocks = <&rp1_clocks 17>;
+      #pwm-cells = <3>;
+    };
-- 
2.35.3


