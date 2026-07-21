Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6B5C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 06:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQu/v9VbPVOFvypxy+vSIVqVZUuLUc8YlsM7QgQ5RmA=; b=l+na/q0swOQlbUMoH3A152rr96
	4QW5TeMcHWbvrdMvT6d1AifdWULpZG3O6Kiii/PzofzkppmgC92/WVFgnWT2b7HndZQ7vdIBplL0z
	U/N1gCURA++Y5V9Ky02tQHevNDJAQn44jnzJEfhAuf9lw15bfyGu3nOsAnA+vREvQf6Re7/49EzxE
	GmnH+XDphPp9WAig0vzXjM7mG6rN5eyBxVguuplbgWCtQZfPSzo8vb2jSLfRY/wFbswVeMne2IEex
	6FrmnNw9luEs1KIlBVoVTP46bqk9eqHVDSv39AeFqSn6KbDM8GNHIC/SZhT84x3oRZ4klAV8ML8OE
	LWRo4ySw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm3sy-00000008Vkc-1XdF;
	Tue, 21 Jul 2026 06:23:24 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm3sw-00000008VjV-1U9A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 06:23:23 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-84830c774a0so5744412b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 23:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784615001; x=1785219801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQu/v9VbPVOFvypxy+vSIVqVZUuLUc8YlsM7QgQ5RmA=;
        b=oQsIzjfsWVzrsAeFiWvpUy3wR5tYbHVCVnuCa7i9S7oNYdpuBy27ehSODVABsj8hu+
         t+kU1+r7F2dPiq59PFPq3s3BHOUt98DZyrjkQEIGSOZ5pKQcPE3aCf4uzX/KZ1Gcwj5+
         hRRNpjn5HCJqwOWr2teeIxC+eDzoVeFnoEJDYHBOISXXqt/lGMn9zOkaTOf2C0R1HiSI
         Kh/YsksoLXZZINNUNPu64SW5erJRRLm2Bpr5sRRWSuReXuow8zxouu4a8wmnt07h9w6F
         MHgKEPq5J1EQmHD/V7Qurh8K8+EKkINmJMPE5nd6oXyBOkvERu1eraaQiLP0Dbhj10L9
         m4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784615001; x=1785219801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQu/v9VbPVOFvypxy+vSIVqVZUuLUc8YlsM7QgQ5RmA=;
        b=Bp2T8k8LtriusIsi84r9bkbZyacBC72Y6n5WS3vO/fw1++dwXrKwsIBprM5tzvOxND
         m4BmMuEoGgRuJTWYO7xpX0CTuvixrpqG8xfcHl/bH0zGFZknlDHfYh38Ka9GILXj54mi
         O58qOGpgnWNKGQ6QV/AvvYV9014iixMnhfHgGnnNHbuhSjFgbODLufYOvi/SQCSXwo9G
         8bqlgIxT7qAJRTM8y8sidMsoZNA3zhAvVPPRdo+NjqlC4o8PHFyvDK1NQB/8RAlAR0pt
         c67WLiFCLQyc9/1Fa4HZD7C87ao+gfJFXi318Za9QtIfX3WzhWx4qpK3vZl0bphKaQ6o
         VHHw==
X-Gm-Message-State: AOJu0YyNzZiy9aNKeBqIrrkRjR0I4USwb8YIKT6xbrhfVVseonbQNiKC
	PRZpNAYhV8CgEOZ/BXhwnC5ShWb1p9w6fYfldJFWead5pTUw/4iRlmlZ
X-Gm-Gg: AR+sD13M/JNZIweOHWutMagpEjpW/UBYq+zBED4EPK7yx4bjEeiVm09+uV0Ah0iJGOw
	CZ2bMyu9EEs+fN9np/75oWkw/uqXvswOBShoTnUNUIS8WdR2eX/CJsiIk9X3YODh2K0e3H8Q6vV
	r6CPqw1FnGCMUJ1WzVxPGazEPodd9wkfPn25zfVqVWTEhuraRdmUm+Uh+GxgF3tUHRK5hJ6qv/5
	NYY0Q8VVnjWyt58Yt0eNmYwSUzelxfEcNA5zZJEq2cc4BYs+3U1/4ExjF0Bl5rdxRiamfhWo8fW
	5apT9IDoQle2Hml9maVeSKpiOPY09zH9Q9sqeL6/9CtqEDSHp8UOv3F1Ik3NWOo9XXg5gc0rJ0H
	nvcuPyvpAZSp0w9887Ex+OjfDJ7icGSbIImUU27XrcQ/J3fc2NihcCeAAFkTEwrf4UVZ+0RIZqw
	mMYvrEcvvhzrFAv35bFltSVAGXZuqxW9vG7ecG74ZKXfowVwbiaD2qOgZCi1BRypM7
X-Received: by 2002:aa7:8890:0:b0:848:68cb:5c74 with SMTP id d2e1a72fcca58-84c294970c0mr16543173b3a.60.1784615001381;
        Mon, 20 Jul 2026 23:23:21 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c4b640050sm4020710b3a.45.2026.07.20.23.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:23:20 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/2] dt-bindings: pwm: Add Nuvoton MA35D1 PWM controller
Date: Tue, 21 Jul 2026 14:23:07 +0800
Message-Id: <20260721062308.536947-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260721062308.536947-1-cwweng.linux@gmail.com>
References: <20260721062308.536947-1-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_232322_401383_BE8E67B7 
X-CRM114-Status: GOOD (  13.89  )
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

Add device tree binding for the Nuvoton MA35D1 PWM controller.

The MA35D1 PWM controller provides 6 PWM channels and uses one register
region and one functional clock. The binding uses the standard PWM binding
with three PWM cells.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 .../bindings/pwm/nuvoton,ma35d1-pwm.yaml      | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml b/Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml
new file mode 100644
index 000000000000..47a59bdd14d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/nuvoton,ma35d1-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 PWM controller
+
+maintainers:
+  - Chi-Wen Weng <cwweng@nuvoton.com>
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,ma35d1-pwm
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
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+
+    pwm@40580000 {
+      compatible = "nuvoton,ma35d1-pwm";
+      reg = <0x40580000 0x400>;
+      clocks = <&clk EPWM0_GATE>;
+      #pwm-cells = <3>;
+    };
-- 
2.25.1


