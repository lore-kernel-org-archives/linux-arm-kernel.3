Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53413FEFB5A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DE5SdSXqoRzT/zzVjsASLBPwA7BQiH/VpGj5zl1TCDo=; b=jsVC/yoOdv3+k22vLqSd9bSNTP
	6K5xzk+OTg30/3EBXc9uCbMVz0TP0q7x1LetnIfhKx/SnP3bJ16l/Uum4Ztqsqriy5QCImDYgOj3E
	etquzZ6D9D2NSvl/DSYSvTsZS6tKJcD+lg4SYm2zP1Ev60GHeSgfoBZo2pcLicOHBZG2Ik9TMLpkv
	Ag5PU2q0MZ67B4Y9ZU2SUS3KItOzxVibqnEbvXNLwiivuLMawVHvORWlya2q8yNxoQRVcLTBF5J4F
	KptGgSJsv4Bwi+S1wcXQ137D2x55Kfs4iUKmOEUrFovhB8DulMCK9+siNfoA0r9pJ4MrWhXeRx3J8
	PF0UsnCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzYV-00000008Z8C-18OU;
	Fri, 27 Feb 2026 15:15:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzYO-00000008Z2g-3xjE
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Feb 2026 15:14:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=DE5SdSXqoRzT/zzVjsASLBPwA7BQiH/VpGj5zl1TCDo=; b=o2lXxoFeJRVDbbPdHeNe9hvJQE
	H7uSK3OUizIYIdoiUHRBwcXCFBTNqsTjW87YCyhKm1dqtFBRC8yxcToAxu1hjs+0QahLB7ngjCTmU
	WrFsLIBzFXarv9i2Wtccss3QSvPWjE8MyP6XEusGTV2iMtZvmgLT/wqmWhxXWJ0l7RN5LlafKW0bq
	QydMH3n4zDKst/zOO4oTCfeTIT0FaIdhRKgL6F5iR6bB8DvOSp5CEZuMITlhDzGQMoC6C1k5d3zM6
	wBUX2uwNxYF9a4DezJBfq/wPQ2LCNK6tYK3eH6f90rsfmgfO7ZKPMTGzi8T/EUsdPC8PGz1dBh1wq
	E4pc3g9w==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzYL-0000000DKJT-2tAL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:14:55 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-82748257f5fso825327b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 07:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772205291; x=1772810091; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DE5SdSXqoRzT/zzVjsASLBPwA7BQiH/VpGj5zl1TCDo=;
        b=S371qtyFWPxqcEZmP1VfQ3Q+H56kkqlHPwtojTqQOj+wZluGU8SjQ/NFURgfJ+bPL5
         LeMu56DOLCb+B1BvYy8Ia1m4IZTuJ39JN4GFrPNi670ci+jYaIZ6cnlo6TITtGjwBCuc
         3nsKvDsAlRP1cKlBEjJEolzQ+y4dLZv9XvAWzxW1E85wGZt5tY4R/EnhBX/Ji0Q9wgBv
         lPv1cWCRSYuMbEcqLHmV7OuCXccYTwpAKq7TmidBSaP4uPsD72fDnaOQc/G52BzUTGQq
         gqEl/UBK4oztJH0X1V1i4GmCdZqZ4tU7api4wtJc8pTBMjKExa+sLU5pU5mV34UeyZ3t
         pyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772205291; x=1772810091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DE5SdSXqoRzT/zzVjsASLBPwA7BQiH/VpGj5zl1TCDo=;
        b=PEd/kADCZ+eeY2ZpmbvEvV1LRFenR/3HovLSNm1f30i6Bin2YmxiXbtMQgV6ndxhgY
         6HiEK0EFsLPk0C4U4qTFqNNGqeoH7bXUsLrIpOkRL+xJhG/8d/K7M0m/7KEz3OJc4pi0
         K7zAwLIH6ybOAHBc9W/h5/aJUBDmgkuG2JCH0EoD1GavvhA10NECsauhAgRgLr56aP27
         1WbVWcnTu6GRAWsSG2bLuYmjUtMwaP2Mb/CjlHof9gadgdPxWL29quS8cASQ5PL5wpca
         TKrXZNZ+LfbNOZAmAOsU1U2TKLkMJ8Szpitp0I2+X7QdPL6SpiknjNdGzbXyeuNGgSzL
         6hzg==
X-Forwarded-Encrypted: i=1; AJvYcCXr0BhVotTtNkcUomFlEhwo+MSzLN4Fg8gAdopweQeENUPWhOnng6arpGJCAgGPFNGexGeeACH844jFi0Wmxlm9@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3Hvv1SBArrHYENmZhjQN0TZ02TSmM8djONbtpQW0uxlcDjFa8
	qr+uBibqQwDvnqHWBc9UaAbxBNTa2RX7Fxb+3FQlrGdlIlD800OWiQWJ
X-Gm-Gg: ATEYQzwIsxZQPJyKHLzH+b7CZoeNd/fBx2ez9o7AZR/d4q0uoU/YNU+/GouC58YAg+R
	s8o3IqYCFCymagNfUY0JtP1MbjxnuGoJjMK9VM8boEhAAh2vJFHsOsgJ7mZAq3rIIrO127ZMgb0
	QzvveBRhoGTS6K2MA1SJlSGviahfwatfVSn55oJxJfcKDaZ4KHg/4RsGEMfYufOf8LdmM11hTSd
	chqLx4mGP6QH35RQOKRnMY0sSMwcOYxGxwtx6ENC6QdqHnngJLt1/sq1GqzKs2QKTYxOkouHesq
	pd1JeRcJ67TM6e4mbTt73sFIbMgHAD1oie9f94MPice/h1+bDSmw1kUDaZ01JgAbyR/i/WGP5xy
	/7IPCVPNN9uG2ZIzd7y4rdD0ti1LDYLi9Q7RQyNzMYil4HelSRkxlfygplMp5ajpIR6LZzs4ED8
	qezd4uD38VTfsCqdhHazUjR3Kc4MM8WIAZZG3EStGUEDY/kG3o
X-Received: by 2002:a17:90b:544b:b0:352:ece8:1f6c with SMTP id 98e67ed59e1d1-3593862e0f3mr5550934a91.8.1772205291129;
        Fri, 27 Feb 2026 07:14:51 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([122.168.69.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3593dcc9c37sm5485848a91.8.2026.02.27.07.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:14:50 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Fri, 27 Feb 2026 15:14:32 +0000
Subject: [PATCH v4 2/5] dt-bindings: arm: atmel,at91sam9260-pit: convert to
 DT schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-arm-microchip-v4-2-7e2ae1c5b5d6@gmail.com>
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
X-CRM114-CacheID: sfid-20260227_151453_906275_AE3FDEFD 
X-CRM114-Status: GOOD (  15.23  )
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

Convert Atmel Periodic interval timer (PIT) binding to YAML format.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
 .../bindings/arm/atmel,at91sam9260-pit.yaml        | 49 ++++++++++++++++++++++
 .../devicetree/bindings/arm/atmel-sysregs.txt      |  6 ---
 2 files changed, 49 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/atmel,at91sam9260-pit.yaml b/Documentation/devicetree/bindings/arm/atmel,at91sam9260-pit.yaml
new file mode 100644
index 000000000000..d1bdc4a4f9e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/atmel,at91sam9260-pit.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/atmel,at91sam9260-pit.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel AT91SAM9260 Periodic Interval Timer (PIT)
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Claudiu Beznea <claudiu.beznea@tuxon.dev>
+
+description:
+  The Periodic Interval Timer (PIT) is part of the System Controller of
+  various Microchip 32-bit ARM-based SoCs (formerly Atmel AT91 series).
+  It is a simple down-counter timer used mainly as the kernel tick source.
+  The PIT is clocked from the slow clock and shares a single IRQ line with
+  other System Controller peripherals.
+
+properties:
+  compatible:
+    const: atmel,at91sam9260-pit
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    timer@fffffd30 {
+        compatible = "atmel,at91sam9260-pit";
+        reg = <0xfffffd30 0x10>;
+        interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk32k>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
index 4ee18112586d..70059f66f2b4 100644
--- a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
+++ b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
@@ -1,11 +1,5 @@
 Atmel system registers
 
-PIT Timer required properties:
-- compatible: Should be "atmel,at91sam9260-pit"
-- reg: Should contain registers location and length
-- interrupts: Should contain interrupt for the PIT which is the IRQ line
-  shared across all System Controller members.
-
 PIT64B Timer required properties:
 - compatible: Should be "microchip,sam9x60-pit64b" or
 			"microchip,sam9x7-pit64b", "microchip,sam9x60-pit64b"

-- 
2.43.0


