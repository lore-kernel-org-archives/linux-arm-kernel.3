Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F148BC4453D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 09:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvsDY5HKT6nEZUT2FM6RXMH9QdIzz7LzrZlfyQr+KB8=; b=HrTRYHc6MxfKgei+j+E7DGHkZX
	qCuHpiDTzCAQXE1YTxyx12x0x/LRKYyS4lrEcJuV+qDJo82bHptmaawloOIpYo0XVvqnKFwRp+QkW
	qIMEJizxCrN/qV8WWzzbCBChAmefEMXmgAXHXASJJYtGYownK7N8vLrr0RxJDi7i5bHrjwbNdQ9aF
	OOTv4y3ewyZ5WDWnbK2uDEjUk0STjYiVzsy1GnaQ4VwjMOCjXONUg0Fl/B+v5jc+mrqr7oASGVe5e
	u154Sjq8ZrjjTFZlUKSpkJNinJ3Ef2duSOe7ZAyFChu1wKgM2ctz6pxp07S7qHbSpG61VShN0LVu/
	21QDEvuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTgU-0000000BSy9-2A3R;
	Wed, 22 Jul 2026 09:56:14 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTgR-0000000BSwV-3SYw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 09:56:13 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47f7872abb6so1601043f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 02:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784714170; x=1785318970; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tvsDY5HKT6nEZUT2FM6RXMH9QdIzz7LzrZlfyQr+KB8=;
        b=ToAo17RweZJ/nmA4/7jL/rkNY3zuZACttlTsEaUov//ANQ4cqMIDcjWj3kvmWj6wQy
         kkt9qgKzKGicrhSWOdX8+NA9/XgCaafQXnjOwfmgc9V5JD0sRndevjIhRBQvPlOsArT4
         gwfb4/lkfvNiE1YK6Yod7yzujtvVqeItweRWz6CFAD97rYw+0MThgpjkil0ZAZ6LVVwq
         tRzzKE95/drphIe7eOvABYzuAHasjL71RKDVYCFW/cagJ1CYIUAjRz1jcuNS0rR9l+cj
         OUBuUZBuStrlaxtn9QtXDXCPpA60dIIwOUxycHNdcDVwKmhV/fI+W8fE2WsVqziSUTF4
         tc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784714170; x=1785318970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvsDY5HKT6nEZUT2FM6RXMH9QdIzz7LzrZlfyQr+KB8=;
        b=ry92hAdS1CuX6yQYDLmtP+ao2da5++9bJkmeYM1CAlNVw3+y7pDUwFcJOTjwXwa9Ch
         dUzGcPvAKKdwo6WtnWI3amfBqdkqEKXDzVkxznJtm/MJnd75HDbiIUFkXolPJ4t9IkED
         bIyIlU5/zPfjbJcminuTiP+E2Rp8WcAVeDW+H/3sJBp123Ig+Xm2d8GLoObhGsCyMXMF
         sMc6lFZh2dSEtbfMeNMqTb2/nfj8Su0LhI+ukHaa5Unu5CRNBTMslrj+OU+TaBpz2nBi
         WAPQnJHWFXFDyGOjIWB2K8K7NHLfUjnQvJHy68eGOCsNbtK5W7MeulE62qd5h/4WP6Z4
         14Sw==
X-Forwarded-Encrypted: i=1; AHgh+RocD3REwNHhJbVhnHT1WoptKLX8e3FSOOXGJvtEPtEjiovm4E0TEGKsbGWX40UOvzjfUjytu9Ih+YG0DDYz2qn5@lists.infradead.org
X-Gm-Message-State: AOJu0YxvBq0nq3X5j4woiqV6OMKYyN2m4RjZUVBiCfhiDErz01HRPPCH
	SdUfPjZV8gkb/TZHlRRDWvnqvsAsqFG0uFBbD5dEYqtrq+YT4wYDyBR96ZdvhgsBw28=
X-Gm-Gg: AR+sD11e2FCD/523EAy/TC7yqiGUj5yWNWzH179LJDOgRJ4p12MDXtXXz/ggrXyDs5a
	la+jG6JuWyfRflY25dyinebSh/diUYzA/kUhKcj6cyn/bkTy7e34J9DnL88SwTikzdsVDsvO5Cl
	fv7hWlCkZFhwViizFDIvsWQYtmcT3Q/A+KuvLWyjFEL9Nin3IpuVr3h+eeEU1KHiC0asVi/xedu
	Zg6HbF4Fxf5ORjNKlV35/yL3N+0d83q7PQvOvFJkNSsDGWNHmXoVD44SPdEMFmvfRWPDnAoKbau
	UAcA6V4RRSSkGV97oBTETBJwnEnPEl3TUv7yLI5BGApOYTLdODrrVq4rZb6ohRwdmKEGjC0Bkir
	yytOZPcGo3+dGM2omrS4bfxwIEd/dfaC45/igLbT+EFpcAbAAaxF4z86te9KSMEgHKyjQFQYaWk
	GBemRaCGTiRcz3qJQzgEA85/n3XHUQt3FaMQ==
X-Received: by 2002:a5d:59c9:0:b0:47f:74ea:2f82 with SMTP id ffacd0b85a97d-47f74ea320dmr17624942f8f.42.1784714169877;
        Wed, 22 Jul 2026 02:56:09 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:314c:4601:ea7:d5d4:79db:6d52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c532d4sm4414533f8f.22.2026.07.22.02.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:56:09 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 22 Jul 2026 10:55:52 +0100
Subject: [PATCH v2 1/5] dt-bindings: arm: google: Add dt bindings for
 frankel/blazer/mustang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-contrib-pg-pixel10-initial-dts-v2-1-3abae9717feb@linaro.org>
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
In-Reply-To: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-serial@vger.kernel.org, soc@lists.linux.dev, 
 Douglas Anderson <dianders@chromium.org>, Juan Yescas <jyescas@google.com>, 
 RD Babiera <rdbabiera@google.com>, Brian Norris <briannorris@google.com>, 
 William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3423;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=jU9hEfZSLyLN+jsh1uG4a2eIaQF/rbTm9P6jCmxJNGA=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqYJO12UR3M+7UC8CvEUp8eg465llr3PM/kVBu0
 3IVS0lprJiJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCamCTtQAKCRDO6LjWAjRy
 utBND/9BS9YFGnYwgx5BNfo5rWAgybD6ZbSVdu5hqHcWrvC1RSl8ppFqr6hnSqiLL0WI2ZdVc1b
 3P1k56Svr39AB4rtu8umDsSPeJJzT+9yR3TxpoAJ2fmC0A5oKGEgjcD9HBRTPpThBrxGIC+t/Ka
 l+lA5dDXcKbaAxb6GeYVOHQLQNTIl6j3fbNicDF1OV/hc0Uu/s5+1ZGsxYAXPqOft420r1zhWWw
 x1/reRPoVs8vxK+sY2qVipvx7BAH/cnGpnssel2EM7F4TPSzGPOLvR7Nn2zvTyyNjYPHKZzsIJW
 nY32CZtzwaJiEiduw67DGPuM69PyFFdqnADFWLmWqVInDP3R2MWcsSSq7CjJIKzExHZMtO5l+8Q
 NV2s3EoMnSkMDY6macBGnIxww5H7B7YBabNgM+swWhQ5+xDLMkwGJg6UNafVtfS/cwH4WLIGRG2
 NT56GJ6RchmMz6ZaeBcTNwgTogns+Bona7cNtJNayO98OdGGwigZ/UeFRa6oTd87HK7pmGyHZPh
 uBoO5FacLucnKz5GCp7D7h0yVr+P0Tuau3/eiH+xC5y+1BaLPGn8F7WZf3+vHEW4C2T0keHn0LX
 /GQTku/Sq8FMS1xwSvhXe9K0IcZ39rguhR975Xdha2J4ztncgzuJ0W1Q52wWtwi3nTIHsJFqndW
 8ULK6ahFXPlXK+Q==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_025611_901542_6C28DC93 
X-CRM114-Status: GOOD (  15.92  )
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

Add binding documentation for Tensor G5 SoC (Laguna) which is referred
to in code as "lga" and three of the boards that use the Laguna SoC
Frankel (Pixel 10), Blazer (Pixel 10 Pro) and Mustang (Pixel 10 Pro XL).

Additionally update to use a more efficient and scalable way to express
the various names a SoC is known by.

Co-developed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v2:
 * Update ect rule as per Krysztof suggestion
 * Remove all the pre-production variants (EVT, DVT etc)
 * The equivalent patch in the previous submission is
   https://lore.kernel.org/lkml/05c833f0-15bc-4a86-9ac4-daf835fe4393@kernel.org/
   but this is now almost entirely different diff. I've added the
   co-developed-by tag as I've kept the more efficient way to express
   the names a SoC is known by.
---
 Documentation/devicetree/bindings/arm/google.yaml | 48 ++++++++++++++---------
 1 file changed, 29 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Documentation/devicetree/bindings/arm/google.yaml
index 99961e5282e5..b5977e20f393 100644
--- a/Documentation/devicetree/bindings/arm/google.yaml
+++ b/Documentation/devicetree/bindings/arm/google.yaml
@@ -13,27 +13,16 @@ description: |
   ARM platforms using SoCs designed by Google branded "Tensor" used in Pixel
   devices.
 
-  Currently upstream this is devices using "gs101" SoC which is found in Pixel
-  6, Pixel 6 Pro and Pixel 6a.
-
-  Google have a few different names for the SoC:
-  - Marketing name ("Tensor")
-  - Codename ("Whitechapel")
-  - SoC ID ("gs101")
-  - Die ID ("S5P9845")
-
-  Likewise there are a couple of names for the actual device
-  - Marketing name ("Pixel 6")
-  - Codename ("Oriole")
-
-  Devicetrees should use the lowercased SoC ID and lowercased board codename,
-  e.g. gs101 and gs101-oriole.
+  Currently upstream this is devices using gs101 SoC which is found in Pixel
+  6, Pixel 6 Pro and Pixel 6a and Laguna SoC canonically referred to as lga
+  found in Pixel 10, Pixel 10 Pro and Pixel 10 Pro XL.
 
 properties:
   $nodename:
     const: '/'
   compatible:
     oneOf:
+      # Google Tensor G1 AKA gs101 AKA whitechapel AKA Die ID S5P9845 boards
       - description: Google Pixel 6 or 6 Pro (Oriole or Raven)
         items:
           - enum:
@@ -41,14 +30,35 @@ properties:
               - google,gs101-raven
           - const: google,gs101
 
-  # Bootloader requires empty ect node to be present
+      # Google Tensor G5 AKA lga (laguna) SoC and boards
+      - description:
+          Google Pixel 10, 10 Pro, 10 Pro XL (Frankel, Blazer,
+          Mustang).
+        items:
+          - enum:
+              - google,lga-blazer
+              - google,lga-frankel
+              - google,lga-mustang
+          - const: google,lga
+
   ect:
     type: object
     additionalProperties: false
 
-required:
-  - ect
-
 additionalProperties: true
 
+allOf:
+  # Bootloader requires empty ect node to be present
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101
+    then:
+      required:
+        - ect
+    else:
+      properties:
+        ect: false
+
 ...

-- 
2.55.0.229.g6434b31f56-goog


