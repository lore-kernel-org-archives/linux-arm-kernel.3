Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C0FCA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 10:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXvq0gg0+t23z7kZpF5ZlYYsh93CZVLrZlTbiFH00UI=; b=vO90WHcK67TwfEHpLecrnhzCrN
	QH1N0HRi2JE0F9C6cees2B2Zw0iOk7h2RFfSHzewqbDmuWXFgraIg854tn4ZYxLCiqNI+0uHQ6LGX
	EHoQSXNLP2d2nEV3om3jSPA6bIGecaGHfymF+sbTVGGSQDs41Q3fkmHpE8HyOor6xZVVT8/HkiyO0
	uG19e5CSFFi8uY4OcBVZ9ifzlV4oLIJhBeobUkXbHHdlYRoLslyGZOVpuN+9Ysc5rj1SJ3U68/Krm
	S7abXfmKQTNz1O6s6hgffLgkmn4GNs1oAMFhWM/K5cyI7BNpI/GFcDI+5PQuKQcft+/yJ9BdT3UlQ
	T//PvH2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaRM-0000000BIXy-2Cjt;
	Fri, 02 Oct 2026 10:24:32 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaRJ-0000000BIVA-2G0U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 10:24:31 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so47191415e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 03:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790936668; x=1791541468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wXvq0gg0+t23z7kZpF5ZlYYsh93CZVLrZlTbiFH00UI=;
        b=ZbrVbGg6bfec3qwmi3rYRO4m+iYlcbKh7vx/jrrqg1W+PCpunJcIAPJCE69Lw+8E8F
         x16g2QQLySsiN7E75NoK2+o+gOpIjCUN7zx/Ck4nbrJ3jCZsBiAkHCz/xlRT0VGwBCvs
         kngfXJyE2z4kz7kWlEOHL4fpdfe3KBI/uWL0DrVo0RI1KP77MCG1LhXONdvWmxH1BnnV
         Yz1uK4x/x0sdju48OoY1ocSyJqa6En6cYtH9XTni42CG+9/jF1YkSHAl5zlBuyRHoo8H
         fIXaqHzgtt1mdKCUiagHv5jBEGwVYTBVbH//RZs62/typjgc+w2XlhFRQUlIbnFi5s7h
         owhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790936668; x=1791541468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wXvq0gg0+t23z7kZpF5ZlYYsh93CZVLrZlTbiFH00UI=;
        b=08WrOcRHyxGVc0Dx/JDljyzETD2KoX3z8KfC+fSAS5rynhO5y7Ru/NIOO2D4P1+81P
         ikjdib/WL1CJW9KuQW/doS38fOtDikirTUktQFxu7h8FfNLbKLZm2RAxg1MhplX2J8Lr
         S8EGLCFaAWxh9eRPHwdqgWr/BNjDLMj7d0TEruiL3odX5jGSINrzGPRvju+IwWrzX1c7
         r4FAGcDcRXJmgn6MfBk++PlQkf/ubNzCTazt4zizQoxSbs5l17nHjizHrpSuu8YvPQLS
         9ax1n0/HveaNODbr9zasrak9Lvi0Zzib6vjYRU/NU9I+2q3nxOJBxAhUf1z69AZfsXh+
         aXPg==
X-Forwarded-Encrypted: i=1; AKwUvBxQ4vqXY30IXMgjxq8Td/NzWStK0++aSaf3hxNh07L5b+21fNQDuBa2HXNY7DoufA1e7pp/OAa3xshXd0RFP7r7@lists.infradead.org
X-Gm-Message-State: AFuF++lP4D0+c9JVndx3uY5UEqC3LsEm+bkQk3mc/lwPdJsBiSMBkann
	G5B/nBr8Y6NwE+Aek7vG+daFG//OfQ050qcKtMWgen13G2R5sR6jNhZh
X-Gm-Gg: AYBFou2KdFBXI62vfDixUQAwCbSMHFBrmdcZrjv9OpvPuegOwWQKC5cIZl2AEdsRYfz
	+Qcj+u6t73aP7XXaDqzXO12o3pQK5ZYRVyLh4S8D82UydueefhZ7dNQ/Vcx0pNe+/qRVztAEmj8
	+kEj4fm5mBzSTzMjULyeVRbQZu+fyfdkIgbHgvH1yx6ku/NVG+4vnjgLCIlnwcaHZ1r8ZY1Fd6q
	/cXlvBGfkWfs6DIpTsLJKhsJH0Yc2zwu+am9X2un+1JjUUm1tYdsOlNd7wMX8QmRRJeIUQji2zY
	lkbS0q5v8K/Q3uIxX6KzoOIl9lpeNpk2w2p6S4xLmYKhld5au+z8odFXiWRA06LmOMSpCp7/m6k
	9g8SdrVQeuRPhtspMCbni+oAjOtACZ3zZ5fmW87YyVsZnl9/FqMQOn1cKulxZUD7zgbIZowoAu4
	8cSwvAnQ4dSml79XHqruN8vUn/FN/plLoP/787rQf1gNV5ZU0+AO1EPhjvksuE96pWntc96l1m/
	ODwDWCj2RKEPT9PXbbvE6YBQxeXAGqjeoSvDoqkHzuFtg==
X-Received: by 2002:a05:600c:1546:b0:4a0:1c43:3c04 with SMTP id 5b1f17b1804b1-4a02756e5edmr41676685e9.13.1790936667497;
        Fri, 02 Oct 2026 03:24:27 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027735be1sm99557875e9.11.2026.10.02.03.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 03:24:27 -0700 (PDT)
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
Subject: [PATCH v10 2/3] dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
Date: Fri,  2 Oct 2026 12:24:18 +0200
Message-ID: <20261002102419.830595-3-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002102419.830595-1-sander.speetjens@gmail.com>
References: <20261002102419.830595-1-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_032429_594982_2B236791 
X-CRM114-Status: GOOD (  12.85  )
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

The property is added to the existing raspberrypi,bcm2835-firmware
binding (rather than creating a new RTC node) because the RTC is
accessed exclusively through the firmware mailbox interface.
We only $ref the individual property from rtc.yaml and do not
reference the full schema, because the firmware node name does not
match the $nodename pattern required by rtc.yaml.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
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
2.55.0


