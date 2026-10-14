Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7234CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 08:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O4uyorJjU4yw9ZxRXCkaVYEh792OjjBS20MYURFIG1U=; b=zuiQsCTIfuFHGAUF7C7UKqJyvq
	QXLha+jNPnR6rwdh3lB+ZsmtyF1VVuF52vzxfpgAhUum7xCb4RerNokxhTMNfm9f84Xs2nePTw1tE
	vVRaraX+mSGn7ewPJy0e7P5D6Pf9+H7azJDG4prGesII9yu9hGYPTww7YcndPbdkCO78awzl5Oq+8
	IGQzXgKWLKWzDFwD+s9Mh7ocrTxl4VLE5SfkL9EpO5h8XEk/pAPgTp4g0s4mSsSon0X41EnqJCL42
	Ui6HDWy4Nwaco1qgpt00VC9GZmQbxTygXbqcWiXkiYeO7tiQ3otlkjRw3lqO1AsTVug1Bfl7souOe
	IdgxBlAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuNo-0000000EtYD-1KRD;
	Wed, 14 Oct 2026 08:30:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuNj-0000000EtVD-0pDv
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 08:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=O4uyorJjU4yw9ZxRXCkaVYEh792OjjBS20MYURFIG1U=; b=psdm90UW8TZaSL/co7JOjQvR21
	N9wtdQ/Ne85GNUYo8JL2xU1lBpeq+ldXp80IHvokMbsAloutBMmZL1FfwIaQkmB2CGEH8Fyw5F8jD
	uySX6zphv3PLFPhvrIgdCykPm3fnM4pDiIXkwEHlsGi0UlS2QmPZgI999mGPL5mTWeehhngZugYNb
	be9Wejiv6yMvyiPgzmyOPXPSXsNp9ogNJUphn91GVZbf9g7kuqL3YcZzWodwDwl+4SY3dOW9vOZJP
	stnrJqPbvQgtqC9LsjpnGfTy38SnzRjiyZooJSMg2uTqUlkEFuHdb4UguOVoU9H+7PBvjemOiQQg8
	0JDNzVTA==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGuNf-0000000GVKJ-3rm7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 08:30:37 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so23220155e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 01:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791966634; x=1792571434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O4uyorJjU4yw9ZxRXCkaVYEh792OjjBS20MYURFIG1U=;
        b=O2aOCbrzn5lCNlQU5i52jLj1W8wJgIWPxPA3LBbLqLqABu63IQwcQ1Gxig8hpQI72W
         lwpce524vwMyyFuV/XZxwbPYlvDjcABa92OxHbeQ/jt+mf7Oo9fGKH+IPy4yJSZpEcRe
         N2q822ErZyEsbK0/rnPnmFMGBwYH5kchqIqkk6bT94+o7tblag7LvirRJpi4B0wnYvgm
         yFUlF6jhMO/U9VQkBgR6Qx2MtgGpXSpHsZics9lmsIo9adG006wB7mKV/Vl0l47a3LC+
         q8SfOv0G8970BLtR73tBLaKkwi1M4wijVKIWxRfMEnRwjCsxKerxLx9XJm0muvLR6I2s
         lJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966634; x=1792571434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O4uyorJjU4yw9ZxRXCkaVYEh792OjjBS20MYURFIG1U=;
        b=RBWrzF72UWbpGA9yD4R6zK+pb8lg9xDsKze6bnDjtNTFkXDOUi22Y4meSxgh3qRAjL
         BSlrFZWdWKhTi0OU9MkMUeQ6VFneEM5QPj5SRdH1NQfR4J3/E7HElinatXNbIFYI+FyJ
         B5jRQFYDkC4AqPkdLnmOvFoHwfqpB1DK9pVOl2YdtHnAEGIUqC33gRjeguZuvVuQWUZK
         ch7jhoJdz8Yc75vzn/w7GtBfBFsVpxgowNyIdzaRydGD1wQnaFXtYbjgZ2+gtZdGUlxi
         cHZSTWZ5hEmAKetDMlu/M9epq9OhaHj92hS3HVfB1FWwkv8ObFzsY0M6Y2+YvNRjg5bf
         xkjg==
X-Forwarded-Encrypted: i=1; AKwUvBzRAXnt8a9xVlQexzArxe31uKKA+BM5mYkLUVV+Pra8iC0aFgP7uukzyWenKWqbUfzdu6IFbQWUjCJh9IQS9n+E@lists.infradead.org
X-Gm-Message-State: AFq9FYKL0Rqj3jGjmnpzup6k95FrDbIkJZn4kWfLC/9Ui0YJ3Tt0f4VA
	48nRll/LEhnGgMakLnPwajs0KZ6c8E4GeGEAmnUVPj0n3IQVwsvmzvuBgvqvh+SFC4U=
X-Gm-Gg: AYBFou3yptwA+KDX8k9fNzTlE80KLKC73Pg32a0cw4sv5sQWYM4ZZxwEsNrikTGkmYZ
	juCdWeT7HZ3oMmv8SwtSNl135G5PkKGGXAb+XpsaMC+A8OyKmwNghULzIeJKEjswGWhIz6ioHjx
	HuBWmQhrscrJ+pUq48DK0J2qmKaCrsLJ619nNlAMl0yEmGHHPjc+kK/SmHlfgFO0Ncb1o02LnkP
	LEDqjvMofDyORGsyVBRIwc7Fbw8GoNAunht1jbyTz6StXl49kj0RuY8hYC5UrrHmS6yhjZF41Q/
	9RplRT1qkd42RibpF8ko3EZ2BER81CfQPzrf0MbpnVu04lneIjs3owh0oivWdAISgf485nW+61F
	H4szx2uBRNvopJswqVLpB2hn/Ai943de0DgbMSleTrigzPAcCUePx1NEoLjLJgtE/RyxZmBAUyh
	Ehj9zrOMBp4MFkQLsoOP0TTYs4n4lrSDINpR6sXCoPtcgP8Fvj+p5goZV7Fr5cmDOWM8km8Aa6n
	6tBoPjO2inR0DAD2//AYBQP31MUT7WbVolVkWLI6ArfcQ==
X-Received: by 2002:a05:600c:1e0f:b0:4a0:1f51:ba2d with SMTP id 5b1f17b1804b1-4a18e4adcbamr292830765e9.22.1791966634221;
        Wed, 14 Oct 2026 01:30:34 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c198134sm431809745e9.15.2026.10.14.01.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:30:33 -0700 (PDT)
From: Sander Speetjens <sander.speetjens@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sander.speetjens@gmail.com,
	pbrobinson@gmail.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v11 2/3] dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
Date: Wed, 14 Oct 2026 10:30:15 +0200
Message-ID: <20261014083016.332338-3-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014083016.332338-1-sander.speetjens@gmail.com>
References: <20261014083016.332338-1-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_093036_146279_C2C6F653 
X-CRM114-Status: GOOD (  11.71  )
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

The Raspberry Pi 5 has a built-in RTC that can be battery-backed
via the VBAT pin. When a rechargeable coin cell is used, the
hardware requires a trickle-charge voltage to keep the battery
topped up.

Expose the trickle-voltage-millivolt DT property so the driver can
program the correct charge voltage for board specific configurations with
the attached battery.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
V10 -> V11: No changes

V9 -> V10: No changes

V8 -> V9: No changes

V7 -> V8: No changes

V6 -> V7: No changes

V5 -> V6: No changes

V4 -> V5: As discussed with Conor Dooley, the reff to uint32 is removed
and a PR is made on dt-schema adding millivolt to property-units.yaml

V3 -> V4: Add a reff to uint32

V2 -> V3: Fixed the firmware property naming

V1 -> V2: As discussed with Krzysztof Kozlowski, this property is folded into
the existing raspberrypi,bcm2835-firmware properties.

 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 983ea80eaec9..dc71fd57834e 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -133,6 +133,11 @@ properties:
     required:
       - compatible
 
+  trickle-voltage-millivolt:
+    $ref: /schemas/rtc/rtc.yaml#/properties/trickle-voltage-millivolt
+    minimum: 1300
+    maximum: 5000
+
 required:
   - compatible
   - mboxes
@@ -144,6 +149,7 @@ examples:
     firmware {
         compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
         mboxes = <&mailbox>;
+        trickle-voltage-millivolt = <3300>;
 
         firmware_clocks: clocks {
             compatible = "raspberrypi,firmware-clocks";
-- 
2.56.0


