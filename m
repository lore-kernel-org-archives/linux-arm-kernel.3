Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CECECA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 08:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFNVuEQ/EQx3uyZQsi7HoiI6kBWQboC2hCL0w1PP23M=; b=azM55YO3nTrkOyQ+XMP+Kl0hao
	vKLa6iC/FO8mBDoVJgnf7TsmFosk9wSH/t9FyZroKhs9jc8hswNFW006jTCaT8WGNXbf9PPSm3J3Z
	7dvV7JNbktZhE6K/32kF+Siml+jzWijfYTvZzL/rNIpz3yPVvO2XoTBtAatnZKb6+6asrHupFQpAx
	7/rvZA5uLTH1OxKIv4qYTFCB3E44oQflpCFQZgiHLL4scVZuNkkogtBpNO8wc2RsCDpFL9T1N1nSW
	bWrJ2C78sAjznH5h/0CW6PTQsWrq9ANCBJh7azKCwdBQK7xSmBUX7UI51u4a+AnNxeKGUBHn3OPOX
	LCg9b/pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBprd-00000005SRB-11Ox;
	Wed, 30 Sep 2026 08:40:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBprc-00000005SQs-2dAH
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 08:40:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zFNVuEQ/EQx3uyZQsi7HoiI6kBWQboC2hCL0w1PP23M=; b=gNzmJhrCnfy7S5BP7UMra46JVQ
	IcGQ39tc5BfMNI3rZrgSrz+YbxC46b5nkGMxzlAELIF1ShfTXVP8lYstEaNKA76NUvcuhFo8Pa0L1
	bQ4o3l0SZTUuMN8hTJQ/QKfFTB+oUP2nQJ9BPi41MEab441pVO446FT5UhaM9W6Y7d+pYkc/8kUfg
	gKE8a+2Sr1ho3LpN5weMPYlTj4tw9Aq/iUcAG57pzCiK1P46WYn5r5J/ys3RZcw/WbQhPI9/lZ9xi
	hZfsB/HsZVWdnOPztZUEoIFMV9fHCzWpSJ3Kr7yaD3U0zo2auhrQQnSdbMwvhln2/Yvn9QPezeSj2
	syWt/oKw==;
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBprA-00000003XIK-44vs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 08:40:22 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48afd5b1678so352858f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 01:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790757592; x=1791362392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zFNVuEQ/EQx3uyZQsi7HoiI6kBWQboC2hCL0w1PP23M=;
        b=WapzbXnPRNYDTEdTGr1lADlfOB9sfB7bpqcW60JpNzW5AJAOxEPIw48/H/gprcPH+l
         m6JleDuL1MY1jc03m//UmkQehpLTs8dOSbZCCOksLfIZYtIf0lB4YgyQc42AkL56c4Dr
         5cF9rWF8RPiTOepwz2XtZwBDzdbFKSvXciudQbl5DFW+J3wfXxGQ19ArIf64nRJtRON1
         04KC626td3OLny2TY9y3xgpy9y0ZdU2Xu2I6HHNIO1VDjY08bIMPGtMiPWvNmLt49U3g
         hhgkmz0MGyqmd5w2J35Zurx5jWMgY/G155ywk3mGPtOub0fQFWSWF9+u8x/+U0+ZbEXH
         7Mwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790757592; x=1791362392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zFNVuEQ/EQx3uyZQsi7HoiI6kBWQboC2hCL0w1PP23M=;
        b=b16H91X161vtMgHQPRVPOA8dM2a2RsKO4CBa19au+M3FMZef1Za7kVZDRde+VtTU7M
         Kl5JxfbJ6oZ8mEOC52RwHKQhbSqxR+sRs3Po5sH2WzTIc69UOqnXynheM4t/EedKdF6J
         kemFLxq0tvwMSFUVXmNrybRmvjjvlyt2blssLQmvboY5uk4ZJsSjWIDGFrztp9hsv3IX
         qe/69el6p/g7cTKOn6s8OXV07hBXLpc4Cy/YNcNfN2gksp7Qn76+a7rApR0AdfkatYWj
         dgcjl2WK1PpZUnyDHQ+3bROpkYUn/gGS8eJ3jcTRkPpHtnqoWAI158KjK/n5a+RWt7/a
         axXQ==
X-Forwarded-Encrypted: i=1; AKwUvByChGVDYKwBcwxlJLj0yE/jFSq7BlTx97phB6BPv7SU33OZ56AxB0qngRDywgskTSTrlFP6qZOtJN1Ix5uHj6rr@lists.infradead.org
X-Gm-Message-State: AFuF++m973jPI9JTkXsu+GBN0i89PKUq18v/Jl3rZfn+GLJtJmQMykVU
	u+1IeTVF3R7gyRd3BqIuJ/BzfgjhGp+Y/BTTWf8AvdnAUjguzKKduhhc
X-Gm-Gg: AYBFou2PP5u+2O9jkSZyQGhBj09Bgf1JUaDojFOo/KVO2HLmwktsQHen3W/20ebnL89
	NTJuejNhGZ3HUD/Kf/I+RRisSKcjlWRvpIRHTYKnS3kGfSngnHoBN2PiH5a2SqkZ7lsk9znOpkD
	6S79V5QSnL2qm3E0gu+tcOUk81J/VZto5PrZoDzjATH2MO+sXm2MX+C8+yPzOBZE7BxA/Qz+4wP
	8wFedVznvEknrnB4JMlaMvdwvbcnGVprBRazjbTp0JpgLs2+jISK3vZmSWWeRCSZAhrgLOOlsod
	zfFvtZfoO00f1YFsVPJ+YifY1pmaBRwtlVM82ud2Kyyc8scY/btzzrYfyCntGwFKzX3we6ZcE+3
	QQVhkWTmgNrYPDBBXKl4p6mkppwvTw75dwgV4RrF8qjliTz3fYfiRkAUlHEb3oaARQBr7wUd1BH
	YzanugCpjLdCV+KGfKmoqBbMhiJqDbSi8HxzFImnzxv13GQC1F49F+4gXVDObBNzpopOzITGqQb
	RO6D9WGefvTFC/7wctXOgtYWpUTLJ3Smnz7WhKfardt4Q==
X-Received: by 2002:a05:600c:5391:b0:4a0:1559:bafd with SMTP id 5b1f17b1804b1-4a01aff068emr9727185e9.8.1790757592383;
        Wed, 30 Sep 2026 01:39:52 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029bfd2bsm1757325f8f.11.2026.09.30.01.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:39:52 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 1/2] dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
Date: Wed, 30 Sep 2026 10:39:21 +0200
Message-ID: <20260930083922.484885-2-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930083922.484885-1-sander.speetjens@gmail.com>
References: <20260930083922.484885-1-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_094020_963900_C9021616 
X-CRM114-Status: GOOD (  13.05  )
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
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
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


