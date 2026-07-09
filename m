Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D80FC44503
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 04:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awUJTEIa7g3yBed2Klo/gvRsPy9nUmrKXk19wqIJEdQ=; b=Xx9P6OT6C3fgx886bz3zhPYDp4
	q75yoIQdjzOX+lSCbmWmU/xQ3dCaPA+3JV4gRkHaonU5dfeFeKK79HoKIqQBIqBtc8DeC0zYWmYCK
	DPvIpcXJo4HV7h4itDmfBA9mIsc7K0e4rBDOK08SB4m/khKJCN2AIyaztOzxCLaUrQfozRwZOKyqQ
	PxTLjLN4hFhJkC77I+B0FMIcZj+SZIo110YsMzIfscLquJl+5KrJrXV7+yBLt7c56eZZqDLAeYNnF
	OPfcPL+z6rfR7qjM+j5aeNg4LbRW3zZDQd/7wIJlvUeMUs6wE7T7V6YI267nVXTxPc/IUkSEYfGRQ
	aNx01vtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whgl7-000000010YL-0QhL;
	Thu, 09 Jul 2026 04:53:13 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whgl1-000000010Vz-3p1T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 04:53:09 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so15779b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 21:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783572787; x=1784177587; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=awUJTEIa7g3yBed2Klo/gvRsPy9nUmrKXk19wqIJEdQ=;
        b=HSy2tuk+bXsptjhYeGc8bDkyH27e91s/IXX+4qCPk2sy6vheHAsoD4vAsqwX29R47m
         B2B46Jubs0VFz+pnDbH9yL3Wn+DHq0G2P48r61vTmsIaSpzdpQROSVSNmzzvkh4bV2O1
         3youxukxmGgEgwYQiEUDFm00HyFkA++m/WF74fmbh9LblkhUuH54Ys6OoUzZ7oSEOUwa
         2Wk9VeWPaD2HQJ32nr6cT/Zfav3c7VxtytmLWX5uAvsQWaRZXJoqdJBCr06wK36d1ILD
         hmwvf+cbZsbckiPydtPoqoB9IUwxARBgQDMI1JpUErWtxTC+GS3cbnogRjKSrQQf3Fa0
         KLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783572787; x=1784177587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=awUJTEIa7g3yBed2Klo/gvRsPy9nUmrKXk19wqIJEdQ=;
        b=Y5fg4p5JdHR+r1YLS1B7/NYXf6uSsciq2to5/sc/FBTD+B2rGcZi+EptE0ZryWzB1A
         WTe22pE6JrecJWXpk3id7aMbl25cUf/3AUhVHonlR1IwoSjjhXvehRfLy3qBt0eKdQzl
         ZzkElPkh43qnu07MpjUWdhx/fm5/APvdZb6/y8329RD+cY7erhoMec3cLGG6IPPwiPHQ
         gOOkW/9gsjC1dF4DZ2RUTczjNEh9DCji4nTBCZgy0Gpo9tR+Knfph6TWWM8jM1dDPrDC
         pEtv+tboEFBYJdYVIJOk/L0IoYpgfsoSiaRKZEFpWhERIjpxbMF1IT9qyrBFyhF4DRah
         YkaA==
X-Forwarded-Encrypted: i=1; AHgh+RqTToYpwvHx3V1nqsI4p9NUF52jz8ktFpN3V8zkelNQ/NwnvFiz+uk3KRLJQE9b40DlShy5r5e/qQqXqhYSiQL3@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8+pC8NkUNNY7OBePtysnGAWz64Vjodabs+ZEqYK4wF+hCO/xp
	j26hY2nYoNkPaO0F77H5joczhGUl7B3HdXyb0q2J+B93dhq2+lmbdAPr
X-Gm-Gg: AfdE7cmB6FppKGXF/JvxyQFByox/Z+b5kH8sk0onGOVfz0amWZLJsyN3Sop/LbfaHdk
	YSnimSN/IyZuBPcq3gTx1p4eu3KwJFXWmHkCI6gzQMpit9tmanf5APy76p5IQL3hb5ph8Zbx+3I
	6cffB3VYILTO1UesNK+74IPiuhBBrTJnViRbcH/TXvPO+0OuGGtl/2WWIgOHyLYDrsRuDwouY+W
	+fMiN2WKBtdpUBbZofle2v80Enb37hDYaJFwe0pPW8qooluEmgMi+7yLnGAfULTt9lt2kGTWP1a
	WHiomohtepG8qQYjMdgoFaZbGl1xNgghGMwsJAV1w5e0LIajykqJ6R3kAcwowIRR0cooAHa4DnX
	Mb4tNHR87yAyZv0RA+OpH/JLcwLq3VIqO/pBghWCshNavLjmGCwQ2NmGb17ys3R7k8JgvzWeYzd
	0SfjEh+f0kcTuVwJerAqt4gfeOxUl9MG+ap2mcuNCVWYbEsmb6HSUj1cwZL69hdQ4Ead3Db4+ON
	eev
X-Received: by 2002:a05:6300:2213:b0:3c0:b766:750c with SMTP id adf61e73a8af0-3c0bcc1a69bmr6988432637.58.1783572786880;
        Wed, 08 Jul 2026 21:53:06 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:e229:88c8:fd09:9a39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm26559252c88.0.2026.07.08.21.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:53:06 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 08 Jul 2026 21:52:59 -0700
Subject: [PATCH v2 01/11] dt-bindings: input: samsung,s3c6410-keypad:
 introduce compact binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-samsung-kp-v2-1-3c6ed4c9b3b6@gmail.com>
References: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
In-Reply-To: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 patches@opensource.cirrus.com
X-Mailer: b4 0.16-dev-b242f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_215307_956741_552E00EA 
X-CRM114-Status: GOOD (  12.36  )
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

The binding with a sub-node per each key is very verbose and is hard to
use with static device properties. Allow standard matrix keymap binding
in addition to the verbose one.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 .../bindings/input/samsung,s3c6410-keypad.yaml     | 53 ++++++++++++++++++++--
 1 file changed, 50 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml b/Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml
index a53569aa0ee7..2498c62444a1 100644
--- a/Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml
@@ -37,6 +37,10 @@ properties:
 
   wakeup-source: true
 
+  keypad,num-columns: true
+  keypad,num-rows: true
+  linux,keymap: true
+
   linux,input-no-autorepeat:
     type: boolean
     description:
@@ -81,12 +85,33 @@ patternProperties:
       - keypad,row
       - linux,code
 
+dependencies:
+  linux,keymap: [ "keypad,num-columns", "keypad,num-rows" ]
+
 required:
   - compatible
   - reg
   - interrupts
-  - samsung,keypad-num-columns
-  - samsung,keypad-num-rows
+
+allOf:
+  - $ref: input.yaml#
+  - $ref: matrix-keymap.yaml#
+  - if:
+      required:
+        - linux,keymap
+    then:
+      properties:
+        samsung,keypad-num-columns: false
+        samsung,keypad-num-rows: false
+      patternProperties:
+        '^key-[0-9a-z]+$': false
+    else:
+      properties:
+        keypad,num-columns: false
+        keypad,num-rows: false
+      required:
+        - samsung,keypad-num-columns
+        - samsung,keypad-num-rows
 
 additionalProperties: false
 
@@ -94,8 +119,9 @@ examples:
   - |
     #include <dt-bindings/clock/exynos4.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/input/input.h>
 
-    keypad@100a0000 {
+    keypad1@100a0000 {
         compatible = "samsung,s5pv210-keypad";
         reg = <0x100a0000 0x100>;
         interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
@@ -119,3 +145,24 @@ examples:
             linux,code = <3>;
         };
     };
+  - |
+    #include <dt-bindings/clock/exynos4.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/input/input.h>
+
+    keypad2@100a0000 {
+        compatible = "samsung,s5pv210-keypad";
+        reg = <0x100a0000 0x100>;
+        interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clock CLK_KEYIF>;
+        clock-names = "keypad";
+
+        keypad,num-rows = <2>;
+        keypad,num-columns = <8>;
+        linux,keymap = <
+          MATRIX_KEY(0, 3, 2)
+          MATRIX_KEY(0, 4, 3)
+        >;
+        linux,input-no-autorepeat;
+        wakeup-source;
+    };

-- 
2.55.0.795.g602f6c329a-goog


