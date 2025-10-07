Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2733ECCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 11:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wae5anKN9hvFHOBxJWNDxfF+UZ1MN51bIQyhwDOYr8M=; b=ZOQr02nKjaKx0GTSzx1vIuo9nf
	XUE71EommbWqylkdax7ASGKZNAp8IHtTzIP2apR7JbClSdvjlwbxHdbBn33/XoEFI8Q75qc1ErsCS
	EPDGBw9VMwPHNhuq5Rjw109icObFNK+LrLFx45wbA7ExyGbdxxzsOV6qF81iF65mNTowKVjmYQt5W
	K1nbR3ifgMjyZ0f/uuBXO0w8n5v/GVT/3OO3d3UFf1tS/PhfPx4D8Nrs9WA6cUAW/LHpZLJllRUqJ
	UgvnHcrz+7TjjUi7g8W8kp7HY/uMDVQk4QmQcRVsJXd5h0Gasf9dM0xKaIpTTYDYQMEIBn8wzQmKO
	3AkWQUbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65hB-00000001r9Q-0FxJ;
	Tue, 07 Oct 2025 11:17:29 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65h9-00000001r8J-1VKj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 11:17:28 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-28a5b8b12a1so60954685ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 04:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835847; x=1760440647; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wae5anKN9hvFHOBxJWNDxfF+UZ1MN51bIQyhwDOYr8M=;
        b=f5eTPzEwAHUZYWRuQnYqcEmbr1RZH+UlzlG1m6g5Wamn4rg9BlPAHzvZTCVCv3EwZ9
         pE0Wga7SA0+EH6qfY+Tr9DfQ1J+mZ4RBHMJwJSd6jnG2lylTvLBET//AdvvwKyuGQhgH
         xwhLV5HGVNxEI5D+WgBXrMdJAh/CbMRIf2UZKdrXsIkEp4oBSvPl40cZmCLNoXwF98o9
         UpFyrpjCmlCUr4324UxPLl/zkmSOlt+pr8+UkwlHdwELKQrNebM4eeHFqv/yzeWJ/98m
         R2HUTPVRcIlhU1ia71uJl1cRJiv8MAtaogw+MaLWAzDJxpEvu8jqU1O68KH30nKZ8r2r
         NQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835847; x=1760440647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wae5anKN9hvFHOBxJWNDxfF+UZ1MN51bIQyhwDOYr8M=;
        b=Wub1EXVQIZ+uKOFdvaYmPr5+32KoyGYGu/zkV7UpkbbHNT4z0w3xF0bWG3XDawMDy3
         vOZ8Kg/sPf31YavNjDpg3URma9h+rHbO6AjXGD70cwshpKDKEWR5QIfBoBoLpfMWJXWF
         7G1gL9VJNOG+8eSXHNjt5InIDEvgFaVqDZdRSb0X9sCib7lsoHQj8rPf1n7fmH25k5LD
         w/CfpzFnsoKD2amLdk7u6bdo2Nj9vFcHvFnI7vc36oHlzxr3WHW1tyGoNnRp6MLOTcbX
         CQm8a+mcyyBnmbs1iV+lNaLupQCgZv6KfUfyoTuhJZnNWtSe+VfJzJ2yvYMw/guYYerQ
         WJYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUswSOa2atcKCpQcrRZoDMPhxA5KgNlBf09+sjgEPYMkKG2Dbz9EkDbwuNJvx8+s9PtSGjRaSmoptzokjE+KOeX@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/qNGgU1exte5rie9yYsPJOL80p1HPJf6p//Wvr0N2uZaC2mUP
	Y+bMlmymQ4CStifjz18tFigwApHHJT1DPjDTQndFfcRThzayycyeu+wr
X-Gm-Gg: ASbGnctnI12dA5JHcMdO1qTj+HaeXzpP1Bhkeu+mbB1tNL4xZxDW0QlllsUfFL1vn4F
	CufwmkeTHYFOShdwSIC+hrkL7tcFNTautkDRjpTTkNrdAEa3gWtkGgQs4DR1vFswe26hgxzVPeQ
	Ud0tUFlGCHFwA8qzonVkMotHyQPhSiVTbYrpZI/fwf7Ac+nO/tH2VsrilkXn+py2avtefJKPTTN
	C1UcoiKuwftayP3Strd/Du4wcE85VZ5W6OX4/2ez7iTxzYX/QvhE4EKn1pg7SsjV3DwVhdtQ5Ox
	XXKY6oPNcj5DvB90QIAsv8lQ1V5Xk5boxv1cgSqhuT0l37aRxwlQSqUB1fjBePpF13AdNHuJZ35
	xAv68Cotq6+0Z+3uslzp4JU7Q4p6SOHci/+RkEmEBFVkvGTbuLVG6FqKRGPGmMW8csWeKvIHjV3
	llkH6/hJn51DuQzOckybl3Y6oUAKgQUtKslDbR1Iqg9r8Oy2Fyf9JC
X-Google-Smtp-Source: AGHT+IG1/90ALl9Mh5f9pXLacMmG46KttwU7NHyQlkZh6ZDWb9gcUbDfJoG6/1tlU82jvfGzXcd/lA==
X-Received: by 2002:a17:903:2409:b0:27e:e96a:4c3 with SMTP id d9443c01a7336-28e9a54423bmr206081935ad.14.1759835846628;
        Tue, 07 Oct 2025 04:17:26 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:17:26 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:42 +1000
Subject: [PATCH v3 01/13] dt-bindings: rtc: Add Apple SMC RTC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-1-d7d3bfd7ae02@gmail.com>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
In-Reply-To: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 Mark Kettenis <kettenis@openbsd.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3352;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=mFOSrinm6mR52T1DXQZDpIdEAeTd/TshZKSbr4XqCgw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm1xdA/gnmZ+44Kh2IUJTdH+HyTemF9jmuURksUgv
 miFAfe/jlIWBjEuBlkxRZYNTUIes43YbvaLVO6FmcPKBDKEgYtTACbiv5zhD8+iukt/cr9KVxVI
 f541I+h7vctLgXnBV0/e/eRWMmvKiUuMDF/LG37N9Xz0pudB47fOyN/J/A5Fzhu93opzNfzgT09
 1ZgcA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_041727_406757_E52AA9E3 
X-CRM114-Status: GOOD (  14.65  )
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

From: Sven Peter <sven@kernel.org>

Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
but most of the PMU functionality is abstracted out by the SMC.
An additional RTC offset stored inside NVMEM is required to compute
the current date/time.

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/mfd/apple,smc.yaml          |  9 +++++++
 .../bindings/rtc/apple,smc-rtc.yaml      | 35 +++++++++++++++++++++++++
 MAINTAINERS                              |  1 +
 3 files changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
index 5429538f7e2e..0410e712c900 100644
--- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
+++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
@@ -46,6 +46,9 @@ properties:
   reboot:
     $ref: /schemas/power/reset/apple,smc-reboot.yaml
 
+  rtc:
+    $ref: /schemas/rtc/apple,smc-rtc.yaml
+
 additionalProperties: false
 
 required:
@@ -80,5 +83,11 @@ examples:
           nvmem-cell-names = "shutdown_flag", "boot_stage",
                              "boot_error_count", "panic_count";
         };
+
+        rtc {
+          compatible = "apple,smc-rtc";
+          nvmem-cells = <&rtc_offset>;
+          nvmem-cell-names = "rtc_offset";
+       };
       };
     };
diff --git a/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml b/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
new file mode 100644
index 000000000000..607b610665a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/apple,smc-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SMC RTC
+
+description:
+  Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
+  but most of the PMU functionality is abstracted out by the SMC.
+  An additional RTC offset stored inside NVMEM is required to compute
+  the current date/time.
+
+maintainers:
+  - Sven Peter <sven@kernel.org>
+
+properties:
+  compatible:
+    const: apple,smc-rtc
+
+  nvmem-cells:
+    items:
+      - description: 48bit RTC offset, specified in 32768 (2^15) Hz clock ticks
+
+  nvmem-cell-names:
+    items:
+      - const: rtc_offset
+
+required:
+  - compatible
+  - nvmem-cells
+  - nvmem-cell-names
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index b45db73e55df..745d85b66365 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2435,6 +2435,7 @@ F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+F:	Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml

-- 
2.51.0


