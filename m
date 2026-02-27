Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FA9FEFB5F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LhDXpHyy2uMROstFg52Lm5HPLU3PUU/ifmv+ZSZXB4=; b=JlXQjrAz7afTrRTZx8wR0+bzOO
	ifwa0X5LGnlA6brrhF07qurcgoYVbJzhTlAJJcnmJrrX9UqA2d+zFynfbs8nla1+8JIeOcKTNP+li
	3Z9/QN0Pz1hh7hddiPO4k1aecYt0kf7GLEr65vTzTV0z12g01+TwM9g5GNmofjnLyyXFh4Qq1R6uW
	ZxGCoAz8hCQYoI76bn084BNwJnTGU/CRj6FvStaKSMBe5OCKinVrZ9RoTxbDNeZiXWPQWazfNoy0A
	OJDdZLh1Ttrmu02btSpk+pnWdWLTF86YufAY3QMbRqMTy+KGfF1Txcx0sYKnDQcify1zfWUh9qt9E
	JdM2yb3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzYI-00000008Z0F-1vub;
	Fri, 27 Feb 2026 15:14:50 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzYG-00000008Yyd-0tFq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:14:49 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c6e734ba92bso1034218a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 07:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772205286; x=1772810086; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+LhDXpHyy2uMROstFg52Lm5HPLU3PUU/ifmv+ZSZXB4=;
        b=HnKsXfpKR3GxE5954NqhsK5DtqJGzjkvX+FVRDNPQz58AmgSO8d378pcIBMFRY50KT
         daadWP/y8fUssvZar5y8QQLo3p1NdGMw1hPT4T9ULpUykG/8l7PZkLU6Kgn72gLH3eYv
         F77TUIF6zueeLM5yOlkRERXmqnVKeYeNd6//tmJcTiFkE7Vyh5lTXe4AxIub4ydY1fHY
         OmoP6MvUvVkHA9tnK01HmAf8JsW541F8/F0BXAjvbHBREVmSL5eCTm42rG+FpMopos3Y
         6EIlLrp78Qc7o6sC1alhwz4ycMfLnVQzO2u5fhkuVfQZxv96iCb5l10F6T6ISLEz9eeL
         AUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772205286; x=1772810086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+LhDXpHyy2uMROstFg52Lm5HPLU3PUU/ifmv+ZSZXB4=;
        b=Y5FQOsuE5qfAv3DgFDKUrIMId7eTVkeO1Ujpo77ilmxoXuzt6Rf1YOyKRg1rfKTZMK
         3n6eubu4GIf3FWDUKGNRgiKq1uFHsv+w/MIFQyzDdShFYbJw8m6X9wKkca6vQZcfbVwS
         9CXTc7mhT/3eniLft72jofM3+esxsqBxnfSB+ujJh8q7Khn61FeEDh8z/Cl6Dd7CIIb4
         yw1IRqQGX7fYvuvvoCwLqeZGwd5eCvqJy3aTirD0689dtDqEqm+gIfz3X4akNMIg8jKI
         I7GM2D1MxG3cKkrAy7Nqwl8a8EDj43TL3ubsK+uW7hAUZ/E7dI6Dk4ckszZ+asYl0WmR
         +OMw==
X-Forwarded-Encrypted: i=1; AJvYcCVY5598jnjm/ltEsjzKLg8rRNQI9kOK/6LrUp7P+D2+MWPuF5qe2bfssBAMnpDHWppQBQ38aLIPHfjQFWGnaS9Y@lists.infradead.org
X-Gm-Message-State: AOJu0YzqE2YpDQ1HYi6ww7jtcGzEL9zaS3i8tKVLXmp+Ks7N/tFl5g2J
	gbICahzvaN4BNkp3OtKFyNoidOGDdwhwTODqpbdQ72uUyETF2VgyDaBH
X-Gm-Gg: ATEYQzxx5iJaEhyE+Qfy4mtBPZ5A4wrCtELHJToWl/aVXPV0HEe/a2rzQLulDkdg2Ji
	eoGV/z17lN9xTdl8pB28VbXdPvFhsi2Xl5OsUWGgKEP0l++gwY5TnL4EGWnPUUXdMlQxXel6Jzs
	y0rP5Q31pJpiEPvT6wxMBplZWE2F5Vjz5FERGk+z7ESUkd5U78ucJ7948LoETeHsdnLnsl8aUn2
	IB7Sc3dI5uXCgU+S1plzja1WRCk+AJorqyyb+yev4kXVJ064G6fbOUx3/JVGT1jXfwuYRHPRs8S
	NAywknp+eCajYzCuFd1imVgc0qaSJAASayy/FxuYBuqXdMkHV6+TwGN6JhAYl0Tz2ITLylKJcyh
	eatlFabqXHMJbukzusN15pp6W6iOvucogsD40ZOBDT/pqMPn1JEYW377t0B88FAFsaFSyC+B1sz
	tnhDiePxTGM9ZqEpVWNaJm8jzvvx25gxzSwWmCbFV5s9ZwLate
X-Received: by 2002:a17:90b:1f8f:b0:34a:8c77:d37b with SMTP id 98e67ed59e1d1-35965c93d92mr3468301a91.16.1772205286322;
        Fri, 27 Feb 2026 07:14:46 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([122.168.69.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3593dcc9c37sm5485848a91.8.2026.02.27.07.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:14:45 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Fri, 27 Feb 2026 15:14:31 +0000
Subject: [PATCH v4 1/5] dt-bindings: arm: microchip,sama7g5-chipid :
 convert to DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-arm-microchip-v4-1-7e2ae1c5b5d6@gmail.com>
References: <20260227-arm-microchip-v4-0-7e2ae1c5b5d6@gmail.com>
In-Reply-To: <20260227-arm-microchip-v4-0-7e2ae1c5b5d6@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Akhila YS <akhilayalmati@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_071448_261934_C707970B 
X-CRM114-Status: GOOD (  14.08  )
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

Convert Atmel system registers binding to YAML format.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
 .../devicetree/bindings/arm/atmel-sysregs.txt      |  5 ---
 .../bindings/arm/microchip,sama7g5-chipid.yaml     | 41 ++++++++++++++++++++++
 2 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
index 5ce54f9befe6..4ee18112586d 100644
--- a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
+++ b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
@@ -1,10 +1,5 @@
 Atmel system registers
 
-Chipid required properties:
-- compatible: Should be "atmel,sama5d2-chipid" or "microchip,sama7g5-chipid"
-			"microchip,sama7d65-chipid"
-- reg : Should contain registers location and length
-
 PIT Timer required properties:
 - compatible: Should be "atmel,at91sam9260-pit"
 - reg: Should contain registers location and length
diff --git a/Documentation/devicetree/bindings/arm/microchip,sama7g5-chipid.yaml b/Documentation/devicetree/bindings/arm/microchip,sama7g5-chipid.yaml
new file mode 100644
index 000000000000..4fdb068be929
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/microchip,sama7g5-chipid.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/microchip,sama7g5-chipid.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel/Microchip RAMC SDRAM/DDR Controller
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Claudiu Beznea <claudiu.beznea@tuxon.dev>
+
+description:
+  This binding describes the Atmel/Microchip Chip ID register block used
+  for SoC identification and revision information. It requires compatible
+  strings matching specific SoC families and a reg property defining the
+  register address and size.
+
+properties:
+  compatible:
+    enum:
+      - atmel,sama5d2-chipid
+      - microchip,sama7g5-chipid
+      - microchip,sama7d65-chipid
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    chipid@fc069000 {
+        compatible = "atmel,sama5d2-chipid";
+        reg = <0xfc069000 0x8>;
+    };
+...

-- 
2.43.0


