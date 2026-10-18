Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B95ACCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 15:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uLnsA4VhF3nXLzHXAj8TbQUk22UVhlTcKUM9tYUUKXk=; b=Qm6UF/ic25cDy/oqBboOcIk0z7
	45upwPhb5h59SRov2+fJwZ4aNdEjRbIfh1Qua7+IBjnBfW/bivINHDXhFKfBholLHdZl+dnkB+UoB
	DiE2uR1WEDr5ZbeK84CsLm3gLONiusm66VFiP8LvSfOYd5k0bjFBlZh4ugJMwTaHzFGGKCKF5Sb13
	ZYK4FTbM+F/KODcaphyJ20ULV5jyawozhwNDQ67vUbKBGgFnMjko3VTznBBF/T+taQUlvBpUMXS9t
	SDwZZ/TSUYuw1Pl7cesqu5K8w704ev4T67PbNX4+SBjU8x/G9UNoas5xTLlaUw+W3iT15cmalaBwX
	R4SzoYgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xISXX-00000005yhS-0LwP;
	Sun, 18 Oct 2026 15:11:11 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xISXN-00000005ydr-3vpb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 15:11:03 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso664301f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 08:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792336260; x=1792941060; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLnsA4VhF3nXLzHXAj8TbQUk22UVhlTcKUM9tYUUKXk=;
        b=WyFZcn8TJSwjriQ0QmE6wEBMHL7TRs89qSa4Omn3mJ/raZyIqpXJJDgt9lDEEVht6a
         ICL5GZ5dAci7+1KYBumr/uzK5vc90EwiYps9o5aegOVKDBFnlt3z8jvSQObhOfxHxwWO
         zL6j0PWMqQL9NPcyCqxzL5Brj5krdzsTNcdV5KWmu1Ff0Z4KqXTq05soBSpIjmp8bHWl
         pfSnT0mfEnHTW3y4eJJnQZcRDxNFspbhlU6ru6jV8QG/rgsUHQJJvQRsiikDN+napQq0
         KlhHIRcqj79tRUwbnRXUroojB7V9MYh8IFPckJHd1wNZByLVQQzYOQNbatQzoSd/j0YO
         D4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792336260; x=1792941060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uLnsA4VhF3nXLzHXAj8TbQUk22UVhlTcKUM9tYUUKXk=;
        b=pY50MLXSoIFgnqfHt0t9R4KRUosKE12dwyT3vbBzkzRirZpkK+uDN2Jvm4Cbo0OiFI
         8AtTwrsrN+LKV/nr8Jf72oliR+3X7RNgkI1dMczpE+TAvMRUn8QbEKzU2N4k4AbORMG1
         H95caPFtSUI4c+FFXJmbdxS4rQOQSAQVU/uIsFLSaP9nnUpd6Gg8SUeLE89acGy46mx7
         b0LKIbtwFgHBE69DkJzz8vnaEj3U26yDI43fNDCoPBrrxlR5tKUd6i13cHh7YDQrBYPf
         BLXBfXuPVzFKjjjtxX7Ap+lzV4+kDyfSgZ/EI+ujkVdAg8CODUdMhiOirOGDt0TY5YTu
         E7Qw==
X-Forwarded-Encrypted: i=1; AKwUvBwcUYQG/Btp3ekO2L1BIVvq6gJrBd7XDuyY5VL0A945wGqhV51mWyRAGXcnNFM3+I5XnhufGDh2pJw2ditdyq2l@lists.infradead.org
X-Gm-Message-State: AFq9FYL/575U4R1FqzYgY0cK21AecJ+QMLeZT6uB20zefldmzQUwm6Vv
	zmpHsWhwHjN5XWAn5R9g2gMXQkmr4xFNQnYbCHEFy0K8Sj3YGus6Gh3d
X-Gm-Gg: AYBFou0BFRfu1aTr9Isob4WcyPjgRiEexEoaaRuqCZFIB6sUh8CXqdy0nwloXHVe/FK
	DZP127UkslJPgFfqcUPh9wjgv4yp4PbQ4JMx9PR/WfnV5Pz1nBs/ngi+8a867tHinHlvh9V/ayC
	sb+1S0BtTWQfxETVBKSfZo0kPn8DFW2EVRGZp5w5cfRczIsUyrfGkDTT8oPXjLaND7HeLxo46UO
	lZEzyU6HKmIgB66Nq2QSP0leNJ4JT+4Sg9oHUrxFHZvYNVk3YwemPvao2WOsSmQRyg+V5mYZ4nG
	tk0UIMQNi5tNoTzRJfCsucTkOinAh8OvCOqxLvOFcTGvPGR7xD8rYyTY8o7vIgKjwkRnCgDuL4R
	rNli6GuxvXhN63tZXik6rxHRVhb8X3YwV4mRkPdd/B/kmUm810uSkp8HnmOplkRDkFo4nfzBtsP
	bSOp8DxujInmGscUaYxr0hxleRR4ip8mlgYD9tI4NupvPO3rwiryB+IPRmXeYcNypIpvL/h9Kl1
	C+EBa1kdFPqt0NC7eGUxiXd1fOMIFK5oIwauE4TPTqMYg==
X-Received: by 2002:a5d:634e:0:b0:48d:f541:a6e7 with SMTP id ffacd0b85a97d-48e07f99c8fmr6899851f8f.40.1792336260253;
        Sun, 18 Oct 2026 08:11:00 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503a0dsm17743957f8f.47.2026.10.18.08.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 08:10:59 -0700 (PDT)
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
Subject: [PATCH v14 2/3] dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
Date: Sun, 18 Oct 2026 17:10:55 +0200
Message-ID: <20261018151056.1051330-3-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018151056.1051330-1-sander.speetjens@gmail.com>
References: <20261018151056.1051330-1-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_081101_989308_6DA47386 
X-CRM114-Status: GOOD (  11.78  )
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
V13 -> V14: No changes

V13: https://lore.kernel.org/linux-rtc/20261018150028.1047172-1-sander.speetjens@gmail.com

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


