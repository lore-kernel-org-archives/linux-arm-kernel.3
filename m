Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D0CC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 13:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1w11rlVw/TNBQvhMqe/HobIw1/0AFB8/Oe+GpWOJoY=; b=jaRVhX4OZrFhKVe2hK2mxNVkQn
	UcWVA93aiwA7tSIfeRidbMoccOdyKDPx25PKUaNiAUa+a/D6Zc6lTVwPLrdXNGwIzYCW++TEhvc/m
	woAEK6NxA4aQjwvpm7BvQaTvEIbo1zOH0OOWIvOPXWC3/QJEN6k4XkABkKQNHkncJJ0uMieQ4PDCG
	ZxFIfg7h6pijZHjCgy776vuOTfv/rBAhg5HDkeu6h9SjM924SGK8Q/q7ItrFoGtweyhXiXeTrs9vq
	aZZ4yH8RnACUSuyhBm6URAGy/N2gpPsfJiYTQgT5wJ+X5l95+WQrtC4Y850/IrRYHugvdTKmkKvd3
	0kVbZXbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9uN-0000000DS9I-0ooX;
	Fri, 28 Mar 2025 13:38:03 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9nV-0000000DQcg-01wN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:30:58 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so324313066b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 06:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168655; x=1743773455; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E1w11rlVw/TNBQvhMqe/HobIw1/0AFB8/Oe+GpWOJoY=;
        b=AwEpgQoWVaCFAsYvPqvFWCqns6rsROsiSXJgDeyfLLxx3DMBpgmqRIx/W44AI/t6gL
         cS77Ji6OqT6BB1xa4wNrBVh0eGF6P0CJTfZ8kFuWmqRdNST8cTBl8LUV/fwea94okhWC
         z/AXisbWrvk+DBw4uCOmjDN9fi39CiA+C9iwmRJOoX1mCEyY91a3A/NNsjiIoJ0jVCYn
         u9xw3XCRQHicBgkovpEs8u2WR4kxYySrIJD3S7IBIS0T8JF0F+zteBPKflBp6bv0IUDR
         gYQIJ0p6rDR6pRBNXNNSgZIlceV+56iNYoHoMqPDjYY/GB6C913JM3h5LZbjmBIbFsYg
         eJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168655; x=1743773455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1w11rlVw/TNBQvhMqe/HobIw1/0AFB8/Oe+GpWOJoY=;
        b=oPOdnIlNTdjQif5Q8HcfrOTl6aSdG9JwvVXJ4D1+IFQSoh8AvS2WY/vFHOYmyaTENk
         lqT/K4M/U6kiM86X8uosH0Hs3Dwz3nmYCQZwtqwy5KtV+ZlKCIl0HoowLnyMhTVUMGwO
         IHp8AanI9HnpZYiryOc4sxFkqfxPWi8bdzikx3X+kvk8BQ5DXcsMdXOCVf5xp9XcT3RA
         qzY1yrQPJkboY/W/DsN/zbU0CHisvDFzjY/I3nzhY4/VTSHb2S7I9yRlAPBiG4pUisTp
         FEudk4QFQIIqjf5v8BYZ/+7EOTakg5U1QQBpKuLtVdMkA0sagjYyKvODy2aey1CulaQy
         Fk0g==
X-Forwarded-Encrypted: i=1; AJvYcCW1uyGyxAh7ji/2RTAzY36+Bo42MPCdlGiQZzgycx9wUz1uRPvwseQTI8Z3cO8x99tE+QqfAD6CTZSLVppr8/wW@lists.infradead.org
X-Gm-Message-State: AOJu0YxtFxYog1H3O+uu/H7+iW0VuOFqTaRo2s8Puou6GORum9mAhkAx
	nSQOdnkJXamhjgAjVujiMGeZkkpUtNmEqgRRep0OCnK1PYoYxQW6RsAF3IveKwc=
X-Gm-Gg: ASbGncuhZuDFTKinJTLVESlMHToVuK3/em3T8kYwrIlsllbqBbesdzVsCHN3OtTtX8n
	27JXLRm0c+TzD8eo6Cff3+85r/IgddJ5bI7hq4UKlZL+6ZO5avocuFNZ9P3izicP6V+ix7Ui+5O
	Y9fLwoYoI8XdpUfwtHu8DgGwh0y55tpzg2a3W43RF1bq/4xp+8kpX6dzY8mQ/w+GE/BClC7uE/2
	k/oj/VmVNEXC0CXZ4MND7QdJsPFxCX9vLPwRhKMfk8j0R5rcfiJI6CK5pPACeKhKWvfVDmS4HPH
	TU92jh64LnLZXsyCr79eHERX93y3B88m3CFoZBQ+MEHFo/sGIje+OGa7XDa2T0FUUQhJkwtPRsQ
	6Y8JaAItetWhFGkrtTZmbpy5U1eyL
X-Google-Smtp-Source: AGHT+IEq06ryYPSRFnijp9zBT7TVwvuxmad5wvipQF5Or+uJmUZMEkHYbtpAEod3NTnJDeU/8eOeEA==
X-Received: by 2002:a17:907:7b99:b0:ac2:7ec8:c31d with SMTP id a640c23a62f3a-ac6faea0f0amr608739366b.17.1743168654961;
        Fri, 28 Mar 2025 06:30:54 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:54 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:49 +0000
Subject: [PATCH v2 03/32] dt-bindings: firmware: google,gs101-acpm-ipc: add
 PMIC child node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-3-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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
X-CRM114-CacheID: sfid-20250328_063057_065280_02FF416B 
X-CRM114-Status: GOOD (  10.12  )
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
 .../bindings/firmware/google,gs101-acpm-ipc.yaml        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 2cdad1bbae73bb1795eccf47e1a58e270acd022c..5524f2af5bda2d29b5113f8fe14ece7f02366a60 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -27,6 +27,16 @@ properties:
   mboxes:
     maxItems: 1
 
+  pmic:
+    description: Child node describing the main PMIC.
+    type: object
+    $ref: /schemas/mfd/samsung,s2mps11.yaml
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: samsung,s2mpg10-pmic
+
   shmem:
     description:
       List of phandle pointing to the shared memory (SHM) area. The memory
@@ -43,8 +53,15 @@ additionalProperties: false
 
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
+        };
     };

-- 
2.49.0.472.ge94155a9ec-goog


