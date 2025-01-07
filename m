Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27C6E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 13:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BPSDsnf8xMzpznIKoQbetYMFd7ZBSAYbuVYrJIoIquU=; b=RlU2D2N73h3gA322vmFNmJ8yip
	Rxtx/2Pc70nSkIjwGN+fc+B0hEM+H1BWRzoZrJviX5K3Wb1MS/YaaCYiZPovHUx2KJ5p3zdfPI1pK
	EL52sQjLvx2zwsS0w3pYRz9WewAHN3M82kC4jSEPJwa6NdGDCN0RnBADKiFp+vBRjFNEdLOBIRB7j
	ib0HXhxyX0EYu1e/JYr7oAYxE48qystrSnlgj8wLxC4veqwf1nYNlRyEA/jfYAnLA4Lzt6YQBJNq4
	X2Tu7ksYN4CZlJVZ/hDwKwjnih0YpF6E03wKVpTmz3/aaUhkiHhcBYFQjFCCB4E5sBVjg8Lyz5A+g
	dmoL3FGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9Sw-00000004yNQ-1N1o;
	Tue, 07 Jan 2025 13:17:50 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9MW-00000004wkt-2Om2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 13:11:15 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-436246b1f9bso24474775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 05:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736255471; x=1736860271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BPSDsnf8xMzpznIKoQbetYMFd7ZBSAYbuVYrJIoIquU=;
        b=xhzg7BOA1NQ1VjSWHleBpVLC8Cq4C0iYy5R3jXl8NdLpbOJxGdKl7egfhUZZpmAIVM
         9jXjBIjKcI4DfFh6dcsDjwS8FjHLeBVQ3eXdHAopSq5fk1V76qpByYuZuc0sv4osqopa
         vPTz0E76IWS5LkYljn4Rfe0jvBFEiR2lNmbVZLROPMrt6nJdHaJQanLrPOELnMi60ouc
         Vh15oELE5IsANfMCygTAlfvPkRfGQyomjaT/qYjVIZtKCC381dF8hC+snMlpmyCz6vsu
         mQnwoon7ahpu82saWGU5SOVzGJyBqUyCXHL9JjriDws9cbKy0Yl5GTGBxzLOSTpXoAEx
         BX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736255471; x=1736860271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BPSDsnf8xMzpznIKoQbetYMFd7ZBSAYbuVYrJIoIquU=;
        b=Rn6sfDNgXcz3uAFUnSnlmX4E7QhIfLmde4WafOMWqI3wrFcV2k2u8TOdBuPAcyXT2a
         vz/Fo7sUqGn3CK0drpVbly/C2sjyjna6GQ6m9oHve4srDzftWx4xEr81YeIeIinERUH0
         HjDBNDj59ubl+Vfumihhy6vWA1mRhk98rN1qs0L3Qiqq6lN9blrLfc/B2/Izyu9lODTD
         m6MdThMQWCImC9Bao4Z3jBMepSv2JN3pdW1fCfSEWrjn6HrxqqxvD6eUW/VjwztKrI3G
         wJC6YUMWHhYCSen8AodvLD9n8WCf8MEN2+KOtSQz8JXPsE//K+3injai8MwCnDljQgZZ
         0y8g==
X-Forwarded-Encrypted: i=1; AJvYcCXt7ZfCpQoW08nzhBS5GLL4dLRl5Wo4xkL1Upi9ZyFrobTlz3G3AUOGi+qneCWI/joBAds5UiAYZh5HcWQaqRd7@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwkp5jFjafTDNzua3JYm2hTbmqJ9zmJE/fTQgs7hhyw9F73nh2
	CTlA3bqjpQTNop/Xt63QH9IfmStitvc+Qk5vP6P9X7AkpJFrbVDJJs4Lhbza6FU=
X-Gm-Gg: ASbGncuzK71VRjjgwLC7tCKWzzgf6kVVSEyYNBN1CvtFD/6YBNr5ecai8wmRLLnFhQS
	GomZJ7IPp62i0VlgTi8z8YwG+zxoqWfP8DmClM1J2oL+mrwwM+NEJXBdz9wkewtzHE7X5ehPGSR
	9i1/uaZTUM/hWgrjFQPEr3GhYvSApXecyS2CjTVaVDHYjljkUMHBTYEvre6bfuoPelAwCEZy8t3
	8ru8Jwl5tUKbKH3JF1UhXEWMrVIlg94wKlKSZfDP/PizXy9wS6DzzZ6ALLoiNcDEoDR8d8=
X-Google-Smtp-Source: AGHT+IFcDu8xWuN0TunF1FW8lTPc9ujrnA78CGY24BiMzjjLy9sHjT+/sVzeAlZ8ODcnc2aRlSGLHg==
X-Received: by 2002:a05:600c:5103:b0:431:4983:e8fe with SMTP id 5b1f17b1804b1-43668b93cb8mr217094915e9.9.1736255471085;
        Tue, 07 Jan 2025 05:11:11 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436dd1682e4sm10229135e9.1.2025.01.07.05.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:11:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: interrupt-controller: Correct indentation and style in DTS example
Date: Tue,  7 Jan 2025 14:11:08 +0100
Message-ID: <20250107131108.246898-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_051112_607552_CDA90684 
X-CRM114-Status: GOOD (  11.22  )
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

DTS example in the bindings should be indented with 2- or 4-spaces and
aligned with opening '- |', so correct any differences like 3-spaces or
mixtures 2- and 4-spaces in one binding.

No functional changes here, but saves some comments during reviews of
new patches built on existing code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../aspeed,ast2400-vic.yaml                   | 10 +++----
 .../brcm,bcm7120-l2-intc.yaml                 | 30 +++++++++----------
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.yaml b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.yaml
index 73e8b9a39bd7..86516cd44b9d 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.yaml
@@ -52,11 +52,11 @@ additionalProperties: false
 examples:
   - |
     interrupt-controller@1e6c0080 {
-         compatible = "aspeed,ast2400-vic";
-         reg = <0x1e6c0080 0x80>;
-         interrupt-controller;
-         #interrupt-cells = <1>;
-         valid-sources = <0xffffffff 0x0007ffff>;
+        compatible = "aspeed,ast2400-vic";
+        reg = <0x1e6c0080 0x80>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        valid-sources = <0xffffffff 0x0007ffff>;
     };
 
 ...
diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7120-l2-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7120-l2-intc.yaml
index 786f2426399b..0fcbe304cd05 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7120-l2-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7120-l2-intc.yaml
@@ -130,23 +130,23 @@ required:
 examples:
   - |
     irq0_intc: interrupt-controller@f0406800 {
-      compatible = "brcm,bcm7120-l2-intc";
-      interrupt-parent = <&intc>;
-      #interrupt-cells = <1>;
-      reg = <0xf0406800 0x8>;
-      interrupt-controller;
-      interrupts = <0x0 0x42 0x0>, <0x0 0x40 0x0>;
-      brcm,int-map-mask = <0xeb8>, <0x140>;
-      brcm,int-fwd-mask = <0x7>;
+        compatible = "brcm,bcm7120-l2-intc";
+        interrupt-parent = <&intc>;
+        #interrupt-cells = <1>;
+        reg = <0xf0406800 0x8>;
+        interrupt-controller;
+        interrupts = <0x0 0x42 0x0>, <0x0 0x40 0x0>;
+        brcm,int-map-mask = <0xeb8>, <0x140>;
+        brcm,int-fwd-mask = <0x7>;
     };
 
   - |
     irq1_intc: interrupt-controller@10000020 {
-       compatible = "brcm,bcm3380-l2-intc";
-       reg = <0x10000024 0x4>, <0x1000002c 0x4>,
-             <0x10000020 0x4>, <0x10000028 0x4>;
-       interrupt-controller;
-       #interrupt-cells = <1>;
-       interrupt-parent = <&cpu_intc>;
-       interrupts = <2>;
+        compatible = "brcm,bcm3380-l2-intc";
+        reg = <0x10000024 0x4>, <0x1000002c 0x4>,
+              <0x10000020 0x4>, <0x10000028 0x4>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        interrupt-parent = <&cpu_intc>;
+        interrupts = <2>;
     };
-- 
2.43.0


