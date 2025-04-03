Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C610C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TTxYh5RL8tOeSvhD/5hLspaDOdxe6ZuNdEjOA1UzBwY=; b=LRHBmZxoZhRIUJkIXxhkwGZWws
	yKdpuYwSGsFO6EYEyxoOAT+458Eb9jQ0KOQlz95HwGBW58E9rz/hyhO4l6sm/rRT2jApKUvzCjwhm
	nUb7QL96xSm4PXYaelcYB/CGfzhTeW8lBk8nvQ+/Cb27KPuRov4kmrJYoP47b9SgQ4YdjMd8r8Lzt
	bYC3qJqLhQ18kQi4y1aTYuSShYm3W3zrgkrESWBICidr4NEz2VMEhF1qyU+eXgHeQCL10938Ljae/
	5RJj54NLjw3+7BOU52c3cmxzV/VMN/Gnum9cF2PROHLtfC3KcG0u1EVwLoLy5FQzatOBwISjTAww2
	ggCm5z/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GWa-00000008LMT-3xbz;
	Thu, 03 Apr 2025 09:06:12 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GPe-00000008JfV-25dc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:03 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so1319043a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670741; x=1744275541; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TTxYh5RL8tOeSvhD/5hLspaDOdxe6ZuNdEjOA1UzBwY=;
        b=MPQBOxbnwR/niNT1mpIR0pALfOXs8212DoxYzdk1zof4aDtR15U7PCkuLsDmyemiCI
         tGYKJ2gQtiEdmM+2tXe9t/CtBJmI9JERnZCEjTmQgaNybQHXPjEyPruUgpK/a8Bx4qdf
         KN7XOXC+lroZllIfvEa168oq0zhwATyFkZOCChJM9y9u4pzXon8DSoymZHEmy0FXMwQI
         jOLbnjFeg/M9w/6aLJ+eE5K4PzkCdvcGkdw9mp3dh+lVN8/psAssoLZOqousbfIKMAjO
         z2MLXGe+B7qva6kZdeMN1gm6XTX+cEbCA24qhJg5t30qkBBKeYYk/C8f9dlR3PbrOyZ7
         FESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670741; x=1744275541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TTxYh5RL8tOeSvhD/5hLspaDOdxe6ZuNdEjOA1UzBwY=;
        b=rQvnRnmcVj+oUcwSWBYrghQYLa4ykI0PBW2PE/9L8327Ydc3n/p41rlxf2tPhb3gF6
         DimNVu4Foel1QDXG/CVLptbUGhCpR7YCkz6dIYpIzr/1KfDc/tdUa0/J99qOunAqyWaC
         8QNpqU9CTvzDiCRy9Kaw4wliqOu0nKJ5dXm6NAGNDnnqhqhymOv0plANML3ymmRamRyp
         hcHbdHJordlRkP391Ft31WgX611NTLE1hB06RAxdSxz3GXZHtyZSWxZL53G+q1oB9bba
         3U/IzaBVJDw1sPn9BF4Fl0HN2TzB6x1ElAYRHroDzHURhUZHb056ibs1TMIXvalQE5ws
         PAaw==
X-Forwarded-Encrypted: i=1; AJvYcCVg9KzxtTPLlZRplEyfvHHXc2lslvNAyTy3rEFvWofX9xa5oR6Gj99Yj6unmAfy4aoTzbxcuokO8dlAcC/XZ+x1@lists.infradead.org
X-Gm-Message-State: AOJu0YxHISXfuvlEgoLUT7Gr3CDByKEFydWDLNn/QCh/mowlJEyRdYx0
	KqEKH0B9ADTTCkma3x4XVaOVdf9UbkBinJ6uSPyKWPREer3bOubzURF9xQHwZW4=
X-Gm-Gg: ASbGnctiZxMZQrZ/jS11hte+MqTbtkY0l52xCAGihuXshr+U7qz2EC5r68UKylf8fuk
	eGJ8Q+Lsa45YeY5kKUsWfftXB81Z5UvSkzRaaUAVU23YjdtWEaXspWh78kSjtNJ3fGsyEJxWY6b
	ZrXlOO95XFwt/ukbaGgky6CQPYOn0c9TUcD9xzju0c3M5WHu+hkWo9D8cYdOsUydfmZP8EZzkgg
	grvoiz7J1DFbO70SBYTVXdMHsGOyXJtbpuwqIHqRmyi4zSfEZ1YtjkPbIzMxCD5BRD1okIiU3RQ
	05ACXh9n85Phc3zThHEEro9AZN16UAR5U7n1Ea8rPTqnF8YblwyMLliWQaAeXJqP3SwnHqY35sE
	kFcVoyIg/A4WKpa6GhPvXUoyMKaMc
X-Google-Smtp-Source: AGHT+IGqS+cHosPp545QR90MaWlJ7FylDhKCGqpl/xjJ8Dzzg8KkweIQ6IAoK4HbqAdErYyQhuV36w==
X-Received: by 2002:a05:6402:3229:b0:5ee:486:ea34 with SMTP id 4fb4d7f45d1cf-5ee0486ebc0mr15642777a12.34.1743670740725;
        Thu, 03 Apr 2025 01:59:00 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:00 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:58:55 +0100
Subject: [PATCH v3 03/32] dt-bindings: firmware: google,gs101-acpm-ipc: add
 PMIC child node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-3-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_015902_535135_096C958A 
X-CRM114-Status: GOOD (  11.42  )
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

The PMIC is supposed to be a child of ACPM, add it here to describe the
connection.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3:
- drop '$ref' and 'unevaluatedProperties' from pmic subnode, use
  'additionalProperties' instead (Krzysztof)
- add some regulators to examples since s2mpg10 requires them as of v3
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 2cdad1bbae73bb1795eccf47e1a58e270acd022c..9785aac3b5f34955bbfe2718eec48581d050954f 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -27,6 +27,15 @@ properties:
   mboxes:
     maxItems: 1
 
+  pmic:
+    description: Child node describing the main PMIC.
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: samsung,s2mpg10-pmic
+
   shmem:
     description:
       List of phandle pointing to the shared memory (SHM) area. The memory
@@ -43,8 +52,34 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
     power-management {
         compatible = "google,gs101-acpm-ipc";
         mboxes = <&ap2apm_mailbox>;
         shmem = <&apm_sram>;
+
+        pmic {
+            compatible = "samsung,s2mpg10-pmic";
+            interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
+
+            regulators {
+                LDO1 {
+                    regulator-name = "vdd_ldo1";
+                    regulator-min-microvolt = <700000>;
+                    regulator-max-microvolt = <1300000>;
+                    regulator-always-on;
+                };
+
+                // ...
+
+                BUCK1 {
+                    regulator-name = "vdd_mif";
+                    regulator-min-microvolt = <450000>;
+                    regulator-max-microvolt = <1300000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+            };
+        };
     };

-- 
2.49.0.472.ge94155a9ec-goog


