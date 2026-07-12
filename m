Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF755C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 02:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GPnxdbYjtS3rIw4TZCTR8RjPhBMqf8pgHE5GaqnnX44=; b=fxfFHWTbSyl7XXU388g6SO9Q0c
	8/fCI48g67NP3YKKBUVHqkccucIbjzDygA4NaUprneExL+u1UvnW05hqOuQBEHVjVzEr5GSnN8TX0
	qHNT7Cz0RGO89z9zk2GvANaMwjHAM6LV+n9QZtQcWLA7PVI5CmAlFgwtnIItm78kz0KqNFRi/IUGS
	ELQEasZshogT6Za10/W8WvqWdnqyrzzmVpBTPf8sjwVdns7PeForMDkkEJYx5RvProKvj+RgPfyEv
	6Q/qPU8q/9A0Pq1l60Pr9sSrA0dx2tQK3fhEDDTJ3IIUqYGok3RVgr9AN25zfzEfWoY65r6/LZbQ2
	q1x2cawA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wijgo-0000000704C-2EoY;
	Sun, 12 Jul 2026 02:13:06 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wijgj-0000000702Z-0diI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 02:13:02 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-381018b9375so2501050a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 19:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783822380; x=1784427180; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPnxdbYjtS3rIw4TZCTR8RjPhBMqf8pgHE5GaqnnX44=;
        b=YVdqvA+xaBT0hd87bp91v+ikmCMNqhtjnbdK6I73GglbEJI2y6/sX9V9FKbZ7PYB2+
         QjBJVJnd0bdTmbyO7xVr1TJkqtOHhhs70EcgewAjbmnHl0IU2VE7TDOtIb8WGB5On7Cy
         dGsBIvL/9qWpWUnfBMB2WCH8nQx8Bpj2U0gPfvPHFXIqauQbU5ft7pJr5yLooFG6Up4C
         18B6FcJi9Z1RsnNX7u5CIsoVammsfwH8kQFLEHEZFA3LdhC47jrJ0Cp/Ukfccui/4M3M
         jlb+zFFCr1BVa5cXt08tZgFYXXZmZGvRQbCAk3/EdGm+app0D24RlJq4cBErshTAGv+s
         gVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783822380; x=1784427180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPnxdbYjtS3rIw4TZCTR8RjPhBMqf8pgHE5GaqnnX44=;
        b=Zwrpfx3FZu9j980VW3GHJ1K+eTw/5TbzMAFAdXnchnSjuV3Uw8h9FVp4R4zr9elw2g
         SGdDYEGd9IHAUWd7Qf4Ly9P35eHNPVvm+RYMsdFiXnD86zeMIyvgfA2aaDonCPhYVv4/
         4IMu5cV8NmcMV2nJyP4rhJcEw1Vcts+mqgok267h7KedUYleSaXH7Km4lvVYz3L/ZFop
         d/PdPnrX4se35QqSiAckJIK5WaUO8mJTIaG29XQv6S/BgRQkrB/d6ZHbTlUNboutHU+0
         fUq+4qob64tZow6+p8WeAkiOH3i1Qc/XUT8R+zTFXPoW0H+sb+Zjyo94aqU/rlFdtu7h
         CMcA==
X-Forwarded-Encrypted: i=1; AHgh+RrcvWMNxYPcg/KDxvFvt4m91f2bHHIcICn63cEq03XDaLLTiV68jVLeJJejmJLlUCDNfc0oqy8lG/Jz3MIZ3iTF@lists.infradead.org
X-Gm-Message-State: AOJu0YxzXMsfIGPMJ12aY4WnQwMMFihhMRyXCm10qNgHq8I0jM7ilCWm
	1FxEi9G8UQKmPo7f1vpGmnmo6pehzq1xQC0G4RMoo3xnwBjdiopsL6z6
X-Gm-Gg: AfdE7cl/qHU05RqbnOYF9P+vfZH8Ow2QuuCyQvaHwcOB5SDFU5f/4EgSM1j0mkrBOiR
	1Q+NytDRB8fSKCK1yx9/qaZOVLHToF+ifwB0w5Fgevy11Ui5tIts6f67m8sSX7g0YA13A01UCWo
	TFA1faJcT8x4ITCXUM7ix1a4k2zrxZ8gGF8OZXm7LKpDbOme6Y+QR3urbrFFV9BgaAJXXUJVb7d
	cIRUH/DxToD1alPmRK4MmBvsuYVh79f76mJRmN5P4S1JuDPZSp9voKoNUzy3bu4fzCzGCdyPz6R
	mRjyLWeqje0PWDCJLu7VwklsZByygcKAfcvfh+ayBKVEo1HklMmfr31rkeUL5uZ69LdeSGsV93x
	pr1ygKkt1q5HtgqOF4SYK45LGyuzdy+LQC0pk2P/kTp+YCKq9+7P7h0pUPx2X3e66sQxj2mhVgR
	jCGonIpRXzlPuz5jy+PyYw9aKxZ/ugvgn23IYqIHA0aQkelZHQ53e4LzrnMI2WMOReFOPSihjSD
	d0=
X-Received: by 2002:a17:90b:28d0:b0:381:a766:efcc with SMTP id 98e67ed59e1d1-38dc75d1e58mr4349557a91.14.1783822380321;
        Sat, 11 Jul 2026 19:13:00 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c63e:9756:a95c:c75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm54796692eec.18.2026.07.11.19.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 19:12:59 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 11 Jul 2026 19:12:42 -0700
Subject: [PATCH v3 01/10] dt-bindings: input: samsung,s3c6410-keypad:
 introduce compact binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-samsung-kp-v3-1-b2fcaba77aff@gmail.com>
References: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
In-Reply-To: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
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
 patches@opensource.cirrus.com, Conor Dooley <conor.dooley@microchip.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-b242f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_191301_198794_5741DF3C 
X-CRM114-Status: GOOD (  12.48  )
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
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


