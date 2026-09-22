Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8911EC982DF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 03:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EeGfs7dlNwJSpSR2y2pu7Meyw4f/IE6ZSxzgz1gB6h4=; b=02lQzjnEI+B6/Mdu714WhKVE4H
	ypD+J4YfJuoj0qQGCLGUxN7PgZNzNP5D63rDVpM1FjSHZmLDQiLkBrNP+tZsZvcvLrp15jt2UauFY
	8dXt4gquBYVDIBn3ylMVINOQypKY16sUK4Q94LvQ9FqScBDLHs0pVSPLFzVg3nHgnxI3/Gcar+dki
	t1dnxbK3QpkW4rQhi5KW8B1wMrjA6VlTlWTOG8BWb5LDOho7gqBkKULyzUSDJa6xn9gR+NziA2kcP
	M98rQbBPtlIQSP3+tZzez59L8I3rh/JEbhFIKYA8IZk/cwwq8J2GZwYYo6dcPVVUeSlzUr5T2piv0
	HaBgotBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rTo-000000046fb-41bP;
	Tue, 22 Sep 2026 03:47:40 +0000
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rTj-000000046e2-3t2H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 03:47:37 +0000
Received: by mail-yx2-x11.google.com with SMTP id 956f58d0204a3-66e4ab20f4bso3815390d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 20:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790048854; x=1790653654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EeGfs7dlNwJSpSR2y2pu7Meyw4f/IE6ZSxzgz1gB6h4=;
        b=UDFKoRcBRhPvzP80ZBz2EsRP9cmp6D8rIPmR7wOK1i4Gkc6DJfNFOqVX7Sd3jKXbwk
         La7USgaCU9V1n19FsFN7HN7vur9F5GoYN1ahxrW6ooZGn7Lm0Uw3RKvs5RZlb9ksKs9p
         KV+hJjkoagnRZLMc7dEofLyjAQOBKTAniNom2oz+f3oCJTBcCiRmwLlIeg+YtlClGVM+
         +jyocGa6H+kYKwFaAr8fSMd0aGx+5CgXQ5YgQkSJfqu1MmIwR5v4ECaRy2wRY158Tx+d
         hFK4Gz4zodO5NgQxpwRXaRRZEFZqX3aDcCV9zUZASeNHPmGFpqpsMrV/iDwuwkHOcKdu
         BpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790048854; x=1790653654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EeGfs7dlNwJSpSR2y2pu7Meyw4f/IE6ZSxzgz1gB6h4=;
        b=mW5vihTvOGKSV2H+ytEKtSbhA0EhzDBopzEoUdi2D5zWH6W/9psy1GVv6euxTmWOW2
         aOH1Js4+1P9PH6jpNP56znSLfWV0W/GTFoA2SimyisS+fzZa9xwMQQs7pkGtiWFFzmnx
         TsGzSv7mALrRpni6P2Cj/Auctdd4CGjZCEw9n6zCTc3u6KCQkEEcPWXIB1mkl3MYyW+c
         rHqUeCzPT3aKXdUeqKzoTl1Rk3+jqPAXEPj/r/68kI0jpX0hj3tW+iQA65utmf9saVoE
         4i+bzR6TKZkfWDwoW0Yyy1apcy5l9KIuV4YHLJ73LSm005//uZyzq1CDCwiSu4DmS1mH
         4hrw==
X-Forwarded-Encrypted: i=1; AKwUvBy5FFbmKI6NLI+yK8I8uhA6EmmQcBTucogGzK/DbIppfPT2hTOgBNo50BPYulHzI6R9NTCqA92Zzl2RJ1J8p1Sd@lists.infradead.org
X-Gm-Message-State: AFuF++mPmEsT2qIlpIlI36JOgMkn4jOT8XNAB/K7cJDZX2pMazjgaJ/O
	/zaTUysLjZgPsPPa8IXOP2U4lyjXNZB2y8NZc88lmCAp0Mev34D3QgMMA3BHUL7c
X-Gm-Gg: AYBFou05lwhiydqF5vBY2kqp6Jq4lLty9MVlh5H+mPihCLiAh5sv20RKQ/C+zdaGHTl
	zeVH0HDztcxJl0N7PJ76eB2pqlshtG7wR2QG+ZytIWLaA35ldEV2v/RjG7VtyE2DadV43BsDqO6
	S4xALw9yyM1Yjidkj/nKp3bm1LylQ4T7AGpHXpnnp0CR4wkzqaBaN6AJ2rHwFzt0xQ4LT0hFDQn
	cMdemHpSuNOJDN88dBgf10vGlrvSkGTnu3eJ8c3YC6I+T1NVPHfXPaZL9uNSHDBL4kNNzF6wNMc
	NNEO6QUO77XDSjQoAk3gNxzG6Ky5bCSppww5WPJ471xpCeTTFqG6xXh6t2tiiqSgkq/LK+9VqqQ
	n/iNgwGRZ+vf3fTp8rnX0mJCJp+EVftep1HWmrsixIBWg/oMNqB5JTQa+k2UfJYmA95O4AxENTt
	nPnvPOhSWZhYZY7VUCQ+QUkrZETd0030J0SW1kLLYsGkZbpGDUkGhv/ll4kuCwI++CGA==
X-Received: by 2002:a05:690e:4148:b0:672:99e0:ebdd with SMTP id 956f58d0204a3-67299e0ef69mr2889187d50.117.1790048853652;
        Mon, 21 Sep 2026 20:47:33 -0700 (PDT)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a2bd79e82bsm1822337b3.5.2026.09.21.20.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:47:33 -0700 (PDT)
From: Tim Michals <tcmichals@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Tim Michals <tcmichals@gmail.com>,
	Jassi Brar <jaswinder.singh@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/7] dt-bindings: mailbox: add Allwinner sun55i msgbox schema
Date: Mon, 21 Sep 2026 22:47:05 -0500
Message-ID: <20260922034711.190253-2-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922034711.190253-1-tcmichals@gmail.com>
References: <20260922034711.190253-1-tcmichals@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_204735_986106_E442AF7E 
X-CRM114-Status: GOOD (  14.57  )
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

Add Device Tree binding schema for the Allwinner 4-port hardware
Message Box controller found on sun55i (A523, A527, T527) and
sun60i (A733) SoCs.

The message box connects the ARM Cortex-A55 host cluster to the
HiFi4 Audio DSP, Power Management Unit (CPUS), and XuanTie RISC-V
co-processor across 12 logical channels with 8-entry hardware FIFOs.

Cc: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
 .../mailbox/allwinner,sun55i-a523-msgbox.yaml | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml b/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml
new file mode 100644
index 000000000000..4b73543c7902
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/allwinner,sun55i-a523-msgbox.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/allwinner,sun55i-a523-msgbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner sun55i 4-Port Message Box
+
+maintainers:
+  - Tim Michals <tcmichals@gmail.com>
+  - Samuel Holland <samuel@sholland.org>
+
+description: |
+  The hardware message box on sun55i (A523, A527, T527) and sun60i (A733)
+  SoCs is a 4-port multi-processor mailbox controller connecting the ARM
+  Cortex-A55 host cluster, HiFi4 Audio DSP, Power Management Unit (CPUS),
+  and XuanTie RISC-V co-processor.
+
+  It features independent 256-byte register banks for each processor port,
+  12 logical channels on the host (4 per remote processor), and 8-entry
+  hardware FIFOs with level interrupts.
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun55i-a523-msgbox
+      - allwinner,sun55i-t527-msgbox
+      - allwinner,sun60i-a733-msgbox
+
+  reg:
+    minItems: 4
+    maxItems: 4
+    description: |
+      Register banks for each of the four processor ports. Each port has
+      an independent 256-byte register bank.
+
+  reg-names:
+    items:
+      - const: arm
+      - const: dsp
+      - const: cpus
+      - const: rv
+
+  clocks:
+    maxItems: 1
+    description: bus clock
+
+  resets:
+    maxItems: 1
+    description: bus reset
+
+  interrupts:
+    minItems: 1
+    maxItems: 4
+    description: |
+      One interrupt per processor port. The host port interrupt is required;
+      remote port interrupts are optional.
+
+  '#mbox-cells':
+    const: 1
+    description: "channel number (0-11: 0-3 CPUS, 4-7 DSP, 8-11 RISC-V)"
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - resets
+  - interrupts
+  - '#mbox-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mailbox@3003000 {
+        compatible = "allwinner,sun55i-a523-msgbox";
+        reg = <0x03003000 0x1000>,
+              <0x07094000 0x1000>,
+              <0x07120000 0x1000>,
+              <0x07136000 0x1000>;
+        reg-names = "arm", "dsp", "cpus", "rv";
+        clocks = <&ccu 120>;
+        resets = <&ccu 45>;
+        interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+        #mbox-cells = <1>;
+    };
+
-- 
2.53.0


