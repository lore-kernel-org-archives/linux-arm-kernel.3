Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBA6FC9ED3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 09:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OPJqfUemt+ZKLj6gPNDYrb4MQbmVYu6fyinUsFcbIMs=; b=3X2Db8XgP/C8Q/2ZSlr1rPkMg2
	9f5OY28AQCcBvrzSpjGTuetgmObb8XTtP/TEQBaTvgW/MZ4w8xvwBWMgQ2VUgZScazkDO1JGs4KiY
	jDf9+RhsaWDbL7I357Tv7Sbuu+bcw0lRQsdH2HagmdlO8ZB+2HQpRFvS1JFgQrpSobhhD86bXrLbL
	ViHelJh4hmTEdi1G521aLcRrKWGR0CBCgE4Vh0r1pRtVFqOTxMcFDS2yWs5Zop39Lp8kBe9B51nL2
	6QCETrfYwzvNrFUmxhV5Hc0FeWI1b3dKVs66csfhNSpwFy16ONml6EU7szOJuiGkmaDDUmigPaXkK
	GEAmMiLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vynm9-000000052Jb-3vtz;
	Sat, 07 Mar 2026 09:16:46 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vynm4-000000052H1-2XJD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 09:16:41 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-359866a1d02so5812015a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 01:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772875000; x=1773479800; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OPJqfUemt+ZKLj6gPNDYrb4MQbmVYu6fyinUsFcbIMs=;
        b=SPP1nMwJ6mbPOgfy6aghj6DPIcrRWBLycqOIC5mZDEfwcfcV9SDqpPvwtCHtItEXuh
         kIyzCi8dP8eem9ofdLUYXX9Dcxlz0vW5BNk5HqjKAKhF6ZcPfLmw8NtnpVN4+V39v80l
         YwuhCcLX4jkC+XJqR48LDXyU/R4obvJJbJQ5vc8IGNFZ3+ZYzwvspB7ajTfYqjFNia6R
         OW0Y4Y12v5NIUjQ8kp6WA8JYlgWvXm5sf6hP1lu5AZPmw+f6yJb58SPkgYkeqnIfYytC
         pLpEmttS35gd6P7qZ+kPe7qyiqua3taC9XlwpQmePlY58qAccxPNvcZPuPmbDpKb9JGI
         nvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772875000; x=1773479800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OPJqfUemt+ZKLj6gPNDYrb4MQbmVYu6fyinUsFcbIMs=;
        b=KqR0HsHnOPzo1GroOSJCyvLJl2xy/XcaHLbp7OYs0qeEGODVvJ8tkh3cDleWEe4AOw
         L0oLOpaGJtjOypy5reY67OYbO+LN4R+qf9j0fjNHIjg08+dPx06QoccAZs5l+V2LTh9k
         VSoUU4ByLZKk+0lngJdVNGbFmuhO8KU4aq1erPu2OhsYbsEw6kuMoI7xGTNSWxSbNx/J
         N5UjoBu00goWUCIrLuTf4rViohWDdihBD76SOYG87N85DBDtoyJ8n/O2wsfsReEGbc+1
         Lcaz2FNCggpPd+lFc9Mh4D38mY6XNps1EAcrOx05aXbR33djEvTjzeyBykX9CAs0lNOE
         TICg==
X-Forwarded-Encrypted: i=1; AJvYcCWIXgXFGXssv/+2IbqemezhtOKWNS8khjwPGHt7Wr/2D7pvW8rA05PBpI3ms1fq0ArGvFHBLKJqJbqzpMFT1AZw@lists.infradead.org
X-Gm-Message-State: AOJu0YwjaADrKHyBDjl9/LgcxkI6i7wZ9sGYrgjUWrkZqg/9cMf0+7pe
	yQrxkwuMlHPim2KDdms919PLLFzd0gjcUu3e+KXoaQYMWDmQ7EBv5S6F
X-Gm-Gg: ATEYQzxmR4SL8LnIrQq3rR+Y0UUqVe93jB2nWpKaTCLY0lpFWZ6AZfPheCMHZftN4/R
	UR5D5MbS02ADtuaRs5kOLEoD3gAqMuVq19/KwthCy9zv4dExQxK1yPQCrBCK+beo7umA955fKFr
	yOjh1wi6ahpCWXYylkxsE9OgzCn0E0AwwNwfUb7so8NOYGyzcR9Cn+NmPzSt62H9qMPStkEyYAB
	tS1yr0pksT/YZ9Sh9wnTsP8CD5TJJgkS0JE2mXx0uaX2GNYtp4sJVDVIg3E5IVxzs9qD2tbslt4
	kLC+WWkc84Q+Ch7gxcY6LHYF1nWB9RecGKt8uBsMHM8CsaGWJcSozxb43qly57ftnq5gxEvjWs0
	Toh6VINdZ9axAQak/OjFuFfJoWxxpJwQT9dWn563dgvGlQEkXI88pe7tjozh2nL3yglTUD6pLj2
	utVgVIs5pZKIvoKDsO9ruizlJI7NLg9+ms3qo0sy7v8JM=
X-Received: by 2002:a17:902:e5ca:b0:2ae:50ec:fa35 with SMTP id d9443c01a7336-2ae823a90f0mr55806145ad.24.1772874999680;
        Sat, 07 Mar 2026 01:16:39 -0800 (PST)
Received: from Black-Pearl.localdomain ([27.7.215.222])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2ae83f74e4fsm45569385ad.58.2026.03.07.01.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 01:16:39 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Sat, 07 Mar 2026 09:16:20 +0000
Subject: [PATCH v3 3/5] dt-bindings: usb: generic-ehci: fix schema
 structure and add at91sam9g45 constraints
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-atmel-usb-v3-3-3dc48fe772be@gmail.com>
References: <20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com>
In-Reply-To: <20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_011640_657109_5755E61C 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

Add clock and phy constraints for atmel,at91sam9g45-ehci and reorganize
the allOf section to fix dtbs_check warnings.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../devicetree/bindings/usb/generic-ehci.yaml      | 46 ++++++++++++++++------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 601f097c09a6..55a5aa7d7a54 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -9,19 +9,6 @@ title: USB EHCI Controller
 maintainers:
   - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 
-allOf:
-  - $ref: usb-hcd.yaml
-  - if:
-      properties:
-        compatible:
-          not:
-            contains:
-              const: ibm,usb-ehci-440epx
-    then:
-      properties:
-        reg:
-          maxItems: 1
-
 properties:
   compatible:
     oneOf:
@@ -167,6 +154,39 @@ required:
   - reg
   - interrupts
 
+allOf:
+  - $ref: usb-hcd.yaml
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: ibm,usb-ehci-440epx
+    then:
+      properties:
+        reg:
+          maxItems: 1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: atmel,at91sam9g45-ehci
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: usb_clk
+            - const: ehci_clk
+
+        phy_type:
+          enum:
+            - utmi
+            - hsic
+
+      required:
+        - clocks
+        - clock-names
+
 unevaluatedProperties: false
 
 examples:

-- 
2.53.0


