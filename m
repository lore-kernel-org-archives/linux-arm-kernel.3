Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2E8C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 17:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mkx2G8tVXZT5TMOyj6mqwZ1d2EOEfZ7XnWbPQ3SK7sc=; b=a2Qi16bhxHajMQ/1l72mK9ISC+
	QQvlXGmKkX6AxXnbSqrgUOR0nXl8UcbPe86g/IetWeelTFutHNaPZIwng1eSl50fcAgDaFyQ8MI0v
	taL1LJ/zrGa5jMGGpOryWo54e8ITRRdmTgi8OPCnjsoIuOf5K1odNY6LBtey6FJmRLNtBfy+BL66M
	vlqeUDsj3zW8Mm5WXB1JOQufCDy/9FI0mwK5rCouOCtha8Yv/25LniNcT0cjA8kML2Gi9mZOgOWmr
	6YRJEZXma2yZ5WL0FiUsx2ksdHYzSC2EROerxoL9SrpnoAAj8bojvSZ1d+qidnfy5o7M/w1inpvWQ
	SIQqpcyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cMR-0000000FAzv-0b4h;
	Fri, 18 Sep 2026 17:26:55 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cMN-0000000FAy9-13H4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 17:26:53 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254fa4c24cso163798666b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 10:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789752410; x=1790357210; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mkx2G8tVXZT5TMOyj6mqwZ1d2EOEfZ7XnWbPQ3SK7sc=;
        b=ujfJIXKpLHqHJ4EcaugXDtvMZlZDOh909rts7UTeccORgtWIyAx3rBzP/8PuvxxtC9
         5UT0nSwOtVDZagfaVV1/5htYNUmthE3g7r7QFV90Z0Wso8/K7At8z+bDzHCc9TzSaqh4
         NbkQWroDqBLtpfMi+V6WF+vXi8x7D4sEgbbnudFHDdtJ3s+yk5hKax2rSb3H/FmwU9ZJ
         JQIwBm6IzTnSLoqDuQt5P4dUoV+r6OXbbnE3QG6AED1BPNfUn6p2klMkgArih+Fij52T
         xA1Bqaam+Gi8WuEwB5zw+AvIxyFCxZC0t2pTJjE3JkFCbluJCzyntmJTmv0h2bMEfLlP
         rtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789752410; x=1790357210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mkx2G8tVXZT5TMOyj6mqwZ1d2EOEfZ7XnWbPQ3SK7sc=;
        b=TqQyRuIhIwDlqEeNtnIQMt63Gg2v0Yj12n7+L7RHAiVsx2X8ZQese5j23xWzPqY2iq
         4LyhgQfyQpxVhnXhjFhJ67XIdL5NVsaqRlxi7iXEMHWkvc/fW1OnZ9KsTdPeumZ9dq5y
         np61JCoZE7OJRFsMpqNKFQAHEOj58DCugCApCZMv+IScGVHoL42HI1xRhqs2LJ1zZuPt
         FCcoo4iEn5io3NQ5hqU/4ZabTlbR9XDiDZTpRiSTRNl1AGat1DhdGWHnZm0gfOsBvgRi
         9OLnyLq6CoXLbO3eQ4gtnjo2GD4nFYTZDGzAdnizphnuRUYqkXzzv3JM/180L1ySBHcE
         FkpA==
X-Forwarded-Encrypted: i=1; AKwUvByxWAzpsFn+fBVf82X7SJfdBqgf/S4DUj7NF9JLiKWIYJZtO64hRtG4UTU+c8//HEsp7GJnnjbnW2mAolr3nmtp@lists.infradead.org
X-Gm-Message-State: AFuF++lDoMUqvXkx2Ht2+lpny2aZFQaC8StwsBNvLtPg0CMQZYdChkWF
	2GEOOtBYGk1L9knU+0tMtzSVaLMuA1AyYo5DdRoCYG2EbFA1Iq9DxepPfnK24a4/PR4=
X-Gm-Gg: AYBFou1VtEq9gzaajUMp1+DkqrSYrfw8X0667mNJVatpko6bPh2sgPg1OvjstC4xtyb
	xpaeRpfbXHCWt1sRiSyRKqXkSBNrfAodoxmaNmBoPB00TdKxBB2+f26taTHJpz8IVJwmpgt9JRf
	I2sM4IIq0U2gUoC52He81lUkAbSUnKX1HWDW97CU1qlP1iN0pvxfKDdOyte8HudwiZcz9Wv7akK
	+fCwjbxSSbAL1iv3dCzjx8DJbfksVsgAyUx+8q2mdk5GmT6IZFKyj0895HgDQoc8KAEXan5kqmf
	GiPBrqz96zhhafIxHsvYvhHDVyfVCuAOj07l4p1QHbvqiKgnJiN3GI5w6GMSKYdPOdTzeP0TanX
	ACTWtDRw8kOwtkszxMzBXMJo5q28Me36JqOm1XUKapL3M2hKZedXT0zGXfZrEmhHyYTtHxAGE2M
	v+PXExA0V/5ZCD47PROh4pi4SEtsga34Y68weu02fYnyA4WvUxWS1RHJV5ZxVwdRDmaN/yWYeE1
	dznxUbuIDbQtyDcssdAHYHKSUq+GRi7Wcy4xrPPWOo628tnFy4puXAUjFub2bOVnw==
X-Received: by 2002:a17:907:972a:b0:c29:59ea:5bf9 with SMTP id a640c23a62f3a-c2a1584d0c3mr348855166b.14.1789752409709;
        Fri, 18 Sep 2026 10:26:49 -0700 (PDT)
Received: from petegriffin.c.googlers.com (116.118.90.34.bc.googleusercontent.com. [34.90.118.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a35701d8bsm902966b.27.2026.09.18.10.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:26:49 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 18 Sep 2026 17:26:34 +0000
Subject: [PATCH v3 1/4] dt-bindings: arm: google: Add dt bindings for
 frankel/blazer/mustang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-contrib-pg-pixel10-initial-dts-v3-1-c94e51140509@linaro.org>
References: <20260918-contrib-pg-pixel10-initial-dts-v3-0-c94e51140509@linaro.org>
In-Reply-To: <20260918-contrib-pg-pixel10-initial-dts-v3-0-c94e51140509@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 soc@lists.linux.dev, Douglas Anderson <dianders@chromium.org>, 
 Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
 Brian Norris <briannorris@google.com>, 
 William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-serial@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Brian Norris <briannorris@chromium.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3553;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=qo8jkdcJFEHFTzGipPaUfZqW7W+79EGKtSF4WXhEUus=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqrXRXzv2ubpfgFzjRAOY1RgWBr71XsDwLoS9hx
 9EJkqiEJ9SJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaq10VwAKCRDO6LjWAjRy
 uoxOEACNW73L3XepiEmszEXR+097pW2CyPuEVZUfEl1WFOxXsh2s9eREfKoQrvGdelmSZRGPO3f
 Fw3a8grTgAuHA5Ffm1J2bFTpozcO6nolBLfQAQbxkO81z1ho4nXHIRPKjfts5/Ll7vfwo8735tp
 S120by72b/v10A+hPdPTqSKYaCTfq8xmE7XRjAYB6syuE97GssBdyNv5RaUeCxqYksWWQhLzeSd
 kCzW2mRtVsMHcVe0Pyytdf1k+LQrWMf9TDqZF8lm5kPe02eEv7ASqxzLDbaAoRblPuQ00Y0fU16
 kEXEZFKABxaOFoR6j+FypBuZ787lHgw5mD/a3SNUK6ItYyE6ZaRmqQ+EBsrfmLDgdVoKQDQidE8
 QWRUAbY5zT2IQq0irMXNN8yggaBfvOaMnCHrA4IpaT4GvY/SqtM1KAZ8Xbf+Rd3X9xxja6k0Lz7
 zcv/99P/DEnP56aFQaWi04uhwMn9P8mjUDBAwxxd8X9EALxvRJRHPlz0F3iPL0Wrbfh9eg9e9Ef
 UTsZYYLhBP3tWluUYOMMaZ8N9lNEk1mWUVQK/WTQTt6C6uc1W5hGg1NP5KnP4YIR0wEVidgSyg8
 MX3/R6blspUuCSfbbFv9F27lXKp18SH1J4zmtN9ZLwuThYmtPNXDm0a/on/Rvp9maHZ3UGsdoHE
 vSaPuqr1RVm7YMQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_102651_320006_A5D30E57 
X-CRM114-Status: GOOD (  15.97  )
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Brian Norris <briannorris@chromium.org>
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
index 99961e5282e56..b5977e20f3937 100644
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
2.55.0.1082.g2b9226bbc0-goog


