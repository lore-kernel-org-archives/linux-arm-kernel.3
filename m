Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C4ACA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tScKS+WzB6dufhL5mNK+c/AStzi+5Gn3nlm3LBGIbwI=; b=tEZEJ9AH1v1T1aCicVc9oVrdZt
	AFMzF9HdiEHWNZ2jTKT3zcewztxYJw/Ulr+usN5PdliyNehfcbbnH54FOokZIW/76JMJt4mexCkzK
	jnbg1KkLIbrRYBEmPXtsyY8y2m3mljjivtes1CZDyxz/YxCM8EyC2+jADsIIKY5iZpqJXkbF+0axI
	3DjuhzjygfgNGeujXtR9mGVFur4J7itq6oJHNaRISbeOmB7Zml20azLzA4QQ2fdYLT4X1o2/Sa7J0
	pktiKK+pZucud8jTISYTgoPfB5Qr2YwvApkVRo4/bY5b1bXQqhRl56yrEh/7yrn2wAYE634Hb9Au7
	GqoB8Iqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIOS-0000000Fy0J-2SCS;
	Wed, 27 Aug 2025 15:49:00 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEF1-0000000FFPn-1xRx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 11:23:00 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-24633f57e0bso36582175ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 04:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293778; x=1756898578; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tScKS+WzB6dufhL5mNK+c/AStzi+5Gn3nlm3LBGIbwI=;
        b=cRp2g724ROmxT84v1jl14b9M4l7tFDw4L64o+4mUluNT2FxnneUWdClQQf41xGQd7N
         kvrFSS2t37maJ5rgsrqq2+1XEa3znIX4Gm5F7v1vm16TndIgsisZVP7lXX1YHZChbzpv
         6p0ycjqm+WgRcPxg4/e5KCL+ovPiYT3q7IcYpfxUdf0GL0bpdeYtfjYeoWtt3+df59HO
         9TthW5t1NBaIRYcaaNM5/Hupt5f0MWEf9Ug/86RRORADZOiRzocPhcH46cAEQUigqEL2
         sF4ecm97utcbH7I+akClq5LVFcuLcwhPeeZcyFgk5viVkU8VImdhtuuOSN+nvHh2NJmA
         GWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293778; x=1756898578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tScKS+WzB6dufhL5mNK+c/AStzi+5Gn3nlm3LBGIbwI=;
        b=dtVPq+p3iD3a5XBhcquf0n4XNrkH9kjtFXhIe66fZ47mGvByC36KAM2iOkQpRYSUXr
         xTt7ibeWFxDHl/Ig8btON36qhpTUIUocnylo21E6kL37/HwZtOUu4pbrM0UCcAIu1XDM
         TiIzUeb5kaI+Vkrf8BbOjSpPnYC35Q4D/WjX11+rrVWHxTisQFVeoGliy1ZjUcwLmM+i
         oFPa6IRjCNTMBDfizGOwgzaS926oo/MfZ95yoh4HRuDh8K7DrHt7lKTl3e9weJ4CHS+1
         zbmaBDcw/xkqGUNP4auJcP/CsreMqTRpMUmoa4fLM1xmHU4Bixe7WZWrDTZayI0z6j0D
         hEtw==
X-Forwarded-Encrypted: i=1; AJvYcCXmErGotaJPZg4vpNOR1Sgl1qwKlwxD0NvHfJKB1HpWP/Oqm5s57Rs5mGt0dpNCvsmVAfMGsoPOFhq3pMxRYc7X@lists.infradead.org
X-Gm-Message-State: AOJu0YzoU/7TfNZdgUvdBlRlBVl6FfQ2pC66wOHY92fevBPRqxV8qVCC
	rSTg22o6wPrJShMw0P1TXssT+y4PtJPZpZNGj/fnyn/nCtx6fSnBg1jX
X-Gm-Gg: ASbGncuvkIhlfkZfGQ2hT3EkDCzmkdPdVc7EKK5Z75Avz8r610gcwkeu+/3ruguzWkZ
	lSqZZ8KLeuCJBVXwQ6PQQYGA6vERqNaVdYZyBdMn88PJfA9yQ0F3BfWaUtC28lNiuAXAaxPVfB3
	CXhXv6Lw0Rcl3nwoGiIBpWDLem0u/q93k1ceaG5vPxEl7GKtrsY4hq0gebjHos1jb1L1T/LSHSS
	boaPG883PqmJlQQ4dI0PVWwX9ULzEV/THDYs6VTDUYio6nL1097maXektxhk5Tq5g7hsaqRC+Jw
	YVFucGnIklXowgNUoBT8CdNi1XA36xH4lliNqPIFE6RDtcQQfwM3zh2MQtElc+5C3o33X23DOAB
	clGLRWZ17s3mCY5vQQsJ+XxH67Ct2npaV7Uae+oc+oAUkcAHB/qJ9kZe3v4YSUAZ5NRVs8lcvtZ
	bYdDY0sWI+iuHDF4nA
X-Google-Smtp-Source: AGHT+IEHQ8zv3Iwk3K5n+Debu6cIiDOuY8nhm+ii5lcJ3ZyQ2oPc2V5kSWO6f+JtCHeV333/NyZa4Q==
X-Received: by 2002:a17:902:d603:b0:246:a42b:a31d with SMTP id d9443c01a7336-246a42ba453mr172730475ad.44.1756293778541;
        Wed, 27 Aug 2025 04:22:58 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm1819708a91.16.2025.08.27.04.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:22:58 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 27 Aug 2025 21:22:35 +1000
Subject: [PATCH v2 01/11] dt-bindings: rtc: Add Apple SMC RTC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-macsmc-subdevs-v2-1-ce5e99d54c28@gmail.com>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
In-Reply-To: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>, 
 Mark Kettenis <kettenis@openbsd.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3520;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=QnTrhwUPyGjBEFWqrKCYz13PtbjM0UoOPM4Jc23FSf0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBnrXjUla00QuHr05soLs1Lerqr6uSjCZgdr0LsnPitOs
 Rm8fr9EpKOUhUGMi0FWTJFlQ5OQx2wjtpv9IpV7YeawMoEMYeDiFICJrFjFyLA7dNKavG3hfy8K
 1/jqHtylvSDV8LBG+peNm92rq4VWb7/PyPDT4NCpQ2YVrF+W8EzKfXL+yNML10+VcnG+/Fr57xs
 D50x+AA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_042259_516368_1C8F30F4 
X-CRM114-Status: GOOD (  14.10  )
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
index 8a10e270d421ecd703848f64af597de351fcfd74..38f077867bdeedba8a486a63e366e9c943a75681 100644
--- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
+++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
@@ -41,6 +41,9 @@ properties:
   reboot:
     $ref: /schemas/power/reset/apple,smc-reboot.yaml
 
+  rtc:
+    $ref: /schemas/rtc/apple,smc-rtc.yaml
+
 additionalProperties: false
 
 required:
@@ -75,5 +78,11 @@ examples:
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
index 0000000000000000000000000000000000000000..607b610665a28b3ea2e86bd90cb5f3f28ebac726
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
index fe168477caa45799dfe07de2f54de6d6a1ce0615..aaef8634985b35f54de1123ebb4176602066d177 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2397,6 +2397,7 @@ F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+F:	Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml

-- 
2.51.0


