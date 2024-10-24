Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30AAD2C56C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 10:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+pg5NSQICuLjHCR9yIb5y3edaodg5RWPG8HA8VIwE0g=; b=hVvyQAPBkn95d/jpWEMF2W/cni
	/kV8ZDZR0xHrCmaq8Fe7vK6MCDSSLWYqWQp499sSJsfH7dyFTCHcXnegdItzuOmREYEYOCQgxF8vS
	wsFfo1D+PM/VzGKnzIpDpX0RvDyHZT1W5CqJ7AMpA+gUwTNQ2NRwyAouTwINwYLzNtdsoqHwq0SWx
	WItl5i89Z2n+vypy02JQZ+Zus9t4oVfdy8Nm7iYzTpj29DDAwLiSIt1jM7pHTKagVN9fSq52se14f
	BUTQdViFRREyeaq/bjKr0f7pqe8PPS2jcDf1nhb07Rw70e+DsOhw+q/q1fOkW0FrusdI0PDcEp/jY
	947xM1eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vUX-000000008XY-3Tzp;
	Thu, 24 Oct 2024 10:54:57 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vJY-000000006dO-38JW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 10:43:38 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2e2a999b287so630022a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 03:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729766616; x=1730371416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pg5NSQICuLjHCR9yIb5y3edaodg5RWPG8HA8VIwE0g=;
        b=Zc/r2oS581PIcUOioi4xiVAi0NgEd+ii27GG79Lb8dsi6tftlGq+WpP2Hf39oFziVL
         PDeI5r0hwZzuXpNj+RHOOHi9tjsB5iVKmRg3N0BaYd2Fw/1b9g1q8OMx2kgY+KrgoL1d
         xGU/1QPziRfax8jOv+iibHe8/2/T+/SKJS4AxN8m0TzRdWakintfnEaUCjskXLF7h6MD
         Pwpd+Cg8JI0CChUaFiCZAikkTaGTUj6mJ55wjThHKszXhwDJiz04RGKg0TJn4tzyodv3
         MQUxRTmxTn5GgSL1PVaNhNFoRTXrUGe5n6hspV3blH6z9ElBRSQfYgwhnG81OtdnmuRN
         EvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729766616; x=1730371416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+pg5NSQICuLjHCR9yIb5y3edaodg5RWPG8HA8VIwE0g=;
        b=K6QXh3nchT2ZMLsyUdRmVZ5bcLIPIZFmJIxNBskgu2NLd0muKAfWuRRm1c6PwWKNNJ
         iCgliqdAWf+pso+9MTOyFbbGS4UeSWVU3V81vSpJrEnjJJsXhZSEGLB6Nn2/1wvC5bKm
         Rg3/l1DErklATkqMshxP36yskUI8vBUJtMMkDyBdmfRXTQhHr2B7jfPIn0Jh52KYP/rr
         AJjOO2r8fZmR3OciWQ6nyhAoyQaat+cf0m7X5PgrXJftnvWbgGn1xiI+ddTFP8MfzBvI
         dlc2/z+pd/+LhtfiwX6SQARqtl3jxHUrZaBRCeSpmRUdVHXLt7abRwD3SbjALugwbYwF
         tE2A==
X-Gm-Message-State: AOJu0YzoLkl7/skSPPaE2gqu/oEurY++rX1R/gjPRjNxJ7ys2wGfwpMm
	9EDAovNhk8/r8EevC2Y0G6Ff7ZVvKI0Nnug0t2dIBb95VDuX2B1k
X-Google-Smtp-Source: AGHT+IE8Gk3nyttwsDNzbFU+YscAkTIYYy1GnBhvG0f3QZlmzMJX3CkmbBkWS6hSdlauRmdzT2zaOQ==
X-Received: by 2002:a17:90a:ca08:b0:2e2:8995:dd1b with SMTP id 98e67ed59e1d1-2e76b5b67aamr6153379a91.3.1729766615373;
        Thu, 24 Oct 2024 03:43:35 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e48ed34sm1252785a91.9.2024.10.24.03.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 03:43:35 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	cwweng@nuvoton.com,
	Chi-Wen Weng <cwweng.linux@gmail.com>
Subject: [PATCH RESEND v2 1/2] dt-bindings: pwm: nuvoton: Add MA35D1 pwm
Date: Thu, 24 Oct 2024 18:43:08 +0800
Message-Id: <20241024104309.169510-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241024104309.169510-1-cwweng.linux@gmail.com>
References: <20241024104309.169510-1-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_034336_807008_B4CEC347 
X-CRM114-Status: GOOD (  12.18  )
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

Add dt-bindings for Nuvoton MA35D1 SoC PWM controller.

Signed-off-by: Chi-Wen Weng <cwweng.linux@gmail.com>
---
 .../bindings/pwm/nuvoton,ma35d1-pwm.yaml      | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml b/Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml
new file mode 100644
index 000000000000..ed32fc573a24
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
+    const: 2
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
+      #pwm-cells = <2>;
+    };
-- 
2.25.1


