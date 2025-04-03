Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B81C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+M3GihTjnRn1Hrg1CuNjUwnXLbiE9TQN/WleV7zPWg=; b=XmnrRDk2eebHaPFjDp1zLv34Zh
	K5hIBBEk2vSw3vNMD1kTfGkdR7CLlvUgjvkBqFAgXGGuei2B3wLRqaetzAUWLUqltvE5Vdx8iO+xC
	gkiDLfyjWk1Jw1deSALm5EvqkprRJZykOgNdk1wRhS4rJdP/8htv0R83Rq6ybLQe1fE18yVigMshL
	ZL0wLqUd5VAzA8siBdJFclx+4Kp1d+LqWeOQkzNYzejA8EW62vdwCMMnIF6jCbVsyN8rSe69ZLqLu
	abimoeyph52iAex3G/FLBxkGkKElPiCQARnKrvez3v0yFvvBAJc1NO23IMw1vVCEzITwJGLeHwXzn
	qIj3uGaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GUs-00000008Ky4-0fZR;
	Thu, 03 Apr 2025 09:04:26 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GPd-00000008Jer-1Jfr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:03 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e5c9662131so1124768a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670739; x=1744275539; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+M3GihTjnRn1Hrg1CuNjUwnXLbiE9TQN/WleV7zPWg=;
        b=dHEcCNT220sxDiT74k6zysOIrzyEouJSgtQcaMa1jknC3q6Jw/v+AuWQWLNOy8OKWp
         iy/UZwciPC9Uk1p4TUZ2uPPUtdqfFagd1IZ47FL6j2zrmRTnLlkQyh6vjTTCsJEIB2vd
         N+mZC2C0kWKw4a+1Mg7nvQT68USa5m2hMlGrKKFfnjwHprV1FUirnToZOTGgBSk74zNa
         FSkPUJnBGEPcLrtsMr/EiQtGY0tDJXx9Q1BX7I3j1IRoeQl8X4y+nxOvlZXsW5SqGX+T
         1Awfx1E+9Th3SjsoI32oLhM/qwdB8qCZ70rIcLw14lshDzu2nzM5vlRzxW76OBketdOe
         RDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670739; x=1744275539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+M3GihTjnRn1Hrg1CuNjUwnXLbiE9TQN/WleV7zPWg=;
        b=sIlZCdIcFpe5MY0ma5Z66yJCjHxnOyWxf9t32krQ1gMec6SQb7/VyYCHzzhkUUptik
         Vy2ymRDSZ22ew4FuYnpngojFzIIOYuKBuyMiXsg8Nwq/Y01vGytRu4GImXFxEc7H7Jgt
         M2aUatZuFaGvfnkbhcLX0GmAXHb3LJBiyB6PVjMluyD68B6g6iXoluTuuQRemuzU5+BP
         JVTcVNH7qBG2J/Kvrr6fTjv5EzjkgJ9wWtgsyyW/6tzv3jJuqJMiC+sV9b1MRVU1ui1T
         EclGFN7Lgp/O5gVvAQL0743E2ETBDdMqWqdldPCVqfl63v37QIlpIHnmbnPdnP/ItjCD
         ISow==
X-Forwarded-Encrypted: i=1; AJvYcCU42uwGW1z/2SBmm4Jbu8pJRQG/5WMB7arFZixr+nMU/QS2W0FaA3mnchZMUralojRRJkCAtvTCa2+rZKt7Y27p@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8LhtId4pvRnTOzhNqjzt/auCog+vpxu8UVpI05AaMD7B45jaB
	7tAyBFNG/B88U4ejLzgBJmBBSG2gxguub7Rj2etDlcbUGp+57L0VfOsTL4T438Y=
X-Gm-Gg: ASbGncsXA7eSkUo7LxGuEMSMazLsPQh+uWjvHPTVXkO3I5gO7ck2Eyu+C0bSaJ9o6W7
	0alY7oGydCYoiu6OgUOGlDRUDtfEN6sUMR/gUnd9tunkh9Fs2Tc2U3gFGPPBhVPgvDw48R6FWaG
	QSNwJre3uRWUE6jHJAo2Vrv42SEbYG2h4dFxYwmKr712tubIoCi51WM3DXrCyIhY2mWYMJ2/iKj
	l3pyhLg3WzPCEOu9HlYXA2mu3ln9d5Sm95wgG9Le+Xq67/wuPBsIyzt7rz1R3thJgIMgqnZnjpM
	Wx1UsMqwEQuG3hwUBT4G7l9DUt/tYdClHArebmFGxUU7X2oarcwccx6gkjqFgYsNyODN6LuqdWD
	n5upb73EoUuWRtns8nPSzLDn5660uVB5qSy7S9bo=
X-Google-Smtp-Source: AGHT+IEO1QurBQVznveFvWun3Jg1GT4794QiV4XVF3U5z9BB/kH5NvSDatCmfwTx4VFKQZlezuZZbw==
X-Received: by 2002:a05:6402:3513:b0:5e5:e396:3f9a with SMTP id 4fb4d7f45d1cf-5edfdf1ce8emr15075770a12.31.1743670739159;
        Thu, 03 Apr 2025 01:58:59 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:58:58 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:58:53 +0100
Subject: [PATCH v3 01/32] dt-bindings: mfd: samsung,s2mps11: add s2mpg10
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-1-b542b3505e68@linaro.org>
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
X-CRM114-CacheID: sfid-20250403_015901_369826_B951410E 
X-CRM114-Status: GOOD (  13.20  )
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

The Samsung S2MPG10 PMIC is similar to the existing PMICs supported by
this binding.

It is a Power Management IC for mobile applications with buck
converters, various LDOs, power meters, RTC, clock outputs, and
additional GPIOs interfaces.

Unlike other Samsung PMICs, communication is not via I2C, but via the
Samsung ACPM firmware, it therefore doesn't need a 'reg' property but
needs to be a child of the ACPM firmware node instead.

S2MPG10 can also act as a system power controller allowing
implementation of a true cold-reset of the system.

Support for the other components like regulators and power meters will
be added in subsequent future patches.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3:
* keep 'regulators' subnode required even for s2mpg10 (Krzysztof)

v2:
* drop ACPM phandle 'exynos,acpm-ipc', and expect this to be a child
  node of ACPM directly instead
* allow, but still don't enforce, regulators subnode, to ease adding it
  in the future
* deny 'reg' property, it's incorrect to optionally have it for S2MPG10
* enforce 'interrupts' or 'interrupts-extended' property. S2MPG10 can
  not work without. Note this is done as-is using the oneOf, because
  dtschema's fixups.py doesn't handle this nesting itself
---
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   | 26 +++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
index ac5d0c149796b6a4034b5d4245bfa8be0433cfab..d6b9e29147965b6d8eef786b0fb5b5f198ab69ab 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
@@ -20,6 +20,7 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,s2mpg10-pmic
       - samsung,s2mps11-pmic
       - samsung,s2mps13-pmic
       - samsung,s2mps14-pmic
@@ -58,16 +59,39 @@ properties:
       reset (setting buck voltages to default values).
     type: boolean
 
+  system-power-controller: true
+
   wakeup-source: true
 
 required:
   - compatible
-  - reg
   - regulators
 
 additionalProperties: false
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s2mpg10-pmic
+    then:
+      properties:
+        reg: false
+        samsung,s2mps11-acokb-ground: false
+        samsung,s2mps11-wrstbi-ground: false
+
+      oneOf:
+        - required: [interrupts]
+        - required: [interrupts-extended]
+
+    else:
+      properties:
+        system-power-controller: false
+
+      required:
+        - reg
+
   - if:
       properties:
         compatible:

-- 
2.49.0.472.ge94155a9ec-goog


