Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD878CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 11:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LgbjWrvK8elb98wH0NVYO1wkwh6HfRo9teorVSr5yAE=; b=TrmjdJ4JAB4QkcWzG5hLGMXLtb
	8Fqas+zLw98QRSpNjP66eDZ8IqSMx6E9npwtq3cfcXaa6UwrMorPN2k6IAVkqvtq64wmNXusZ1WBm
	QQ9dcwo7qEBhOOOMwf6mVTd9sDYKEsKVNuQKUq962aWFZ81XZIhhHYBvz3z9pr9YgCuVuJoSbIvd4
	PiL4XmxhRUg7FPjQ3VZV4XHy527hayimcXOJz5iw0iYurILHXeQG/MsRVZtG66sn4d7rgW3ud/QpR
	1KkCVeEi/7o89SWd3frswhtBmIEqNoNLM67b0imzEQbIKB19Dfe/YjKV3sVcDFVS0A3jX6ab+b8px
	R75PITAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8rB-00000008f2n-1hD0;
	Wed, 12 Nov 2025 11:17:45 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8r9-00000008f24-0cCR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 11:17:44 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-29555415c5fso7527865ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 03:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946262; x=1763551062; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LgbjWrvK8elb98wH0NVYO1wkwh6HfRo9teorVSr5yAE=;
        b=Mpx/FGzCkCMbfvngzfbVlU0u/gpCbk7l6eoJ/10N5jmfykobw7PNCYsQvF510dxRu0
         JEfPxGoP/HYfSZZ0PxF8hBxfzkRzCC7QuolTVt6Xqef9CTvfalo8vraiyOA4YdJzy4ZM
         gIE+DCHZxkiVo0+79MOzAR7yOcPAxh+TjxVAnNMU30XshBOJ8i4/5EINLE3k5Y00jsfX
         z3KMjpBJsRfEj7VxMPSHi3vsMGYR7ffm6LQsqdNNsVxlZLIaDcNfuygFSj0xut0pkXBV
         340RAtvbPGIrrthtYblzVx6dPUaHK+jDvvUZ99EA2Ise8enWfZOk9Vv4/GWXwfzcPu9U
         oAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946262; x=1763551062;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LgbjWrvK8elb98wH0NVYO1wkwh6HfRo9teorVSr5yAE=;
        b=IIjVJ33P4gmKmXPdtT8euMy/jJEI6TSREucdFtDsLP53LQVIXJjJhFQ6jkQXBTPylT
         dlpZo55uVYr2qvewBcxRTS55ntex/MN4l2ZyUWptdZRSPQtT6IoZ1lukeo1kRDe4uc6a
         b9y6xVEs/A6poSPpvw2Jzml3BsNWPLKzNIXB6z/fSLn0X7TsNofYLt0R9KVZACYySN6N
         7lg4Nf5jT+fB5NAfaVebHmx81J6XT28jdfnOxgW+FEKOvxTZdEC5+jMd4CYdjnewj8rG
         FDsdDysk5Wa7LCJL94P9hia+qCFS7ytHPxjB2jnRfKDAKLCMocuMxH4jkVGx+5XHiAGs
         sxdg==
X-Forwarded-Encrypted: i=1; AJvYcCWdmhlMB/4qin2iuhlN5mwMh3ewcAHC8HCuU6DaFlPsiHbbv8DYuu1A1yPfH5cdE2VB/CrJRqTbdAEL5zfpveoP@lists.infradead.org
X-Gm-Message-State: AOJu0YxDg3221MJpD3wtlsppjYCmrsGKXn89xbaZnICsqAvyaXLH7HaJ
	02CTfJQRt8TMl+gnqmCVXqqnivcNl1e6xUUw7ZdErN6a96DYPI0nmGyn
X-Gm-Gg: ASbGnctLjUC1VN/YtYm7SH0lSjlhrSvGh0n2eAqSDzAl0eqSydXVEl6cRTeVPATBUn4
	30sA8OkzvDaxoqBrPPb7wnt3Uq3Mj8G83GrUmaK3OGuSlKGMGepFxQ1EPHu4VBSEky/3Nr96CF8
	Fyw3+4j1I8ste5RbXrvdWrO7cxibnoQ3SjeXkiIt123Bk0DDeaSIUk2f/04J2Y27T40k3fB8rsa
	TQ5hCMh5q3kgadD5w9AreYgqFnB/MEHm+z4ttwGMy3ETBY/jLQb7DEM5wdKaGBV9WZQvzZtDxAi
	MwKtBcvfgiz5/S6SaFPqF+9KRiM0DICeY6OOBZJUpStRPaNAO94u20IrMA5MrPE7fG4Bm+ZVbCN
	K99xGCdXI28p07psL+t7jIf6Uez/r2PGivYY6gJPhWy2SwSsmcY1CJ6uDqF4g7/Y/kdm0NOa1K8
	uRXSv+G55SnksEjlTLLFS35Is6oIW4ePwK8Xs7KUJl/pWqHOU6AeHJetLiKetHQagLp5Pp1fWkl
	q94r7sZXaViP2ddKrrWeLbftYa9cHBBICLrUFx2AaYrNVB63jjwLy0=
X-Google-Smtp-Source: AGHT+IHzzKGS6ukPiu3qZhs2xy9KjVsM2L0MFpMuDNYIYeYdSYNgHuNotiH+CMNMtQb/4PcLQUYTDA==
X-Received: by 2002:a17:902:dac3:b0:262:9c4:5470 with SMTP id d9443c01a7336-2984edc800amr35769115ad.28.1762946262292;
        Wed, 12 Nov 2025 03:17:42 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca0f28sm27386695ad.60.2025.11.12.03.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:17:42 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 12 Nov 2025 21:16:47 +1000
Subject: [PATCH v5 01/11] dt-bindings: rtc: Add Apple SMC RTC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-macsmc-subdevs-v5-1-728e4b91fe81@gmail.com>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
In-Reply-To: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
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
 bh=5rnjjuFINxFZvoBYoUd9LjmfgXR+dmJkDEVsibGRKy8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJkiOUce1qazTeLmfLnTij+44+21Ts/axefvRd7jOmBRU
 6pv9ja2YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 hjrGOkYMXJwCMNUs3IwMU197tywX5rA+6qDHltJfezFg8be1XbntnS9kApWe7Ds4keF/nM3UDPv
 tslv37N+8xk+vWWvFol0ZHk2ZujrVi9y4D0xiBgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_031743_221881_4248A335 
X-CRM114-Status: GOOD (  14.22  )
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
index f0c8b85baa6b..51942a9a9b43 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2439,6 +2439,7 @@ F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+F:	Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml

-- 
2.51.2


