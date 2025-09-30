Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AB7CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 08:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V33lrbDBdpgDfc9x4hYQa/F6X3VcQqYOJF639C+QnLE=; b=PvNcI4zSuHP3L4t0A18OSBPytt
	nIamwtC2Cn+inZL4tD9LJTufufVq4DeejM/mB1MTaoJxXmqOadIrb2yIY4JMRjTHlsxPm5/ieaGRR
	DBTOaKbR186EcyGJno014OH/1LQoFOg9IbhLTdqKyECnLlhYzcOTTnRf0Uj2VHcLnIdEjrJNsaFPi
	+h/ewV76r8fQf2RMVhYW0J2tjL/CrcNMHuOVaMJtjiR4DvcHJltQQca0sa65DPNDgtmuKOPptN/g2
	uBg2stOS6EBfon8LTxem5z118sAMe0SFZ4tVmZL+S2+2gq/PTauHU3ddfJOJUbG8C8ZSuDsf2/R1S
	GYV7Drmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3W0j-00000004gpU-0w08;
	Tue, 30 Sep 2025 08:47:01 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3W0d-00000004glZ-02ck
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 08:46:56 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-46e2c3b6d4cso41740775e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 01:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759222013; x=1759826813; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V33lrbDBdpgDfc9x4hYQa/F6X3VcQqYOJF639C+QnLE=;
        b=OOYwhUeG6IdquJhOKb1fQI28kVgeHZ8aJGXKJMRz7QO82tB7TjVaels/FeqGLxvpQN
         VXRd8qicpU1L+qlFQzuUS5Crxq7BaAwyexyf0XX4PGQ2RKK3dxC6dY+ijfq12I+yvzUp
         AvAAuw+BLRP+RN1y6LsTtOijBPnTM47lfMuA7zkDK26YUFUyYrpHTV8mf70tWhAu3pfQ
         C7PUu9+xKWcMmkbrH0YsYXh1XNZHfK/5ChwX3ANixR6uhC8R/B7aZQ/9V6DmngSuE9Qh
         +f8pUYeNY6jnq22AZnO+4kWtMDTBih4aEuYhPbXzcI6gAwYMCp+1kSRnflwvTodUedud
         q73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759222013; x=1759826813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V33lrbDBdpgDfc9x4hYQa/F6X3VcQqYOJF639C+QnLE=;
        b=dDUbl+MoVygvHsluWXaO9miemnnnqeB91Yi9tP8tP2aXkePxl5mFZScYh6iyknm/G8
         FoVR6cmnT25q1U7u71DXKmicQiOJIMjKiUoAJUb53uxeWF4gakvp04Z1+Y+nfJzNO76Z
         qeDvaz+5tcrGGCvl4QfCQCfzm7mpghM6uXBXJeeoXmkqjTjrhGiyl9gKBNVgQnwhtFI/
         jYYXmte5LGfKJUswjfmxcDa3qw6V0LY9ajUjDG45IKtQjzOh3t5N8TfyAoPyxNJLfODP
         15xFe25mMlOBXFwvkMGB+X+gQJ5U5txEDuGlngUmR0NYrFbQ64f6y39/6UxoWkOkJUx6
         oqtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXY/2hDRuYYWJBMa7jdyzlPLePghSzblG5kOpqSadvUIDMkG1zk2Yyj8k20tp+lJgshJoOG/hkfY2+tdlSpgNjg@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2TMe0/Rov8pTl8nC/AGVVOlJX/ydvzKwWg7fSW3eFC1l4oVmr
	KpEk/OjxmvzN1k44uv/plhpTCefwvBe9mGTTG349Sm3s5sjfCjsikhXL
X-Gm-Gg: ASbGncu5IlAWewLmPPd/X5CVSBipsRPDHENJ0pao8bWb7pTlimTh93dU/wCDRbHog9O
	eFJUXGitG2vthrRVMTdNz62+h0KO+dVyRBgLRimjOpXvrrmWCVxQtpfC9G0DR2t5hcBAMJWSa/L
	HHyOFlo7ex0gZhYx8XCgajhuiqRrK5mgiKZRWC0czJl5qNhe/PbLbsuMo3dQc/Qo7m6srxM7W7N
	gOQrdG2r8qlnLxqzQkD4KURzuvVyBJPxLujdA8Id/8AM9CPHuFdi3X2vAxFqi2uyx+/DgMjWBXy
	H9gGJ9QZoNlGWU4KhRcq+9yMloGrzxvjAImc1G9UtgVLqlpHJtqIXkOYki/7qv8PdNQlMM6XBI9
	ULC0jQyn4Jt2uyYTA+3wnYKm9B/0t/nYMWbHJlI7/NBXCqlpPUEbpry3bldkjYhfj6G9rUOuFdH
	dm0TilOcEfz4gy1sIxfZdQLlMrUr94O0tMb70wg7pX
X-Google-Smtp-Source: AGHT+IE6t7X9LCnai11B2rSAFpAnlmP2yS3ko2WKL5rG+zgL8fO97OZwBT8DQj4yAE2uWbubKrm0RA==
X-Received: by 2002:a05:600c:a0d:b0:46e:45f7:34f3 with SMTP id 5b1f17b1804b1-46e45f736d6mr114824825e9.8.1759222012854;
        Tue, 30 Sep 2025 01:46:52 -0700 (PDT)
Received: from localhost (2a02-8440-7149-a758-f461-9bc4-1c75-ebc1.rev.sfr.net. [2a02:8440:7149:a758:f461:9bc4:1c75:ebc1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e56f3dcacsm48573735e9.2.2025.09.30.01.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 01:46:52 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 30 Sep 2025 10:46:45 +0200
Subject: [PATCH v8 2/7] dt-bindings: memory: introduce DDR4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-b4-ddr-bindings-v8-2-fe4d8c015a50@gmail.com>
References: <20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com>
In-Reply-To: <20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_014655_118338_A30E123D 
X-CRM114-Status: GOOD (  11.67  )
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
index 000000000000..a2eb6f63c0ce
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
+      - pattern: "^ddr4-[0-9a-f]{4},[a-z]{1,20},[0-9a-f]{2}$"
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


