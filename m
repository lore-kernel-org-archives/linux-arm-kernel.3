Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417D5C98314
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 13:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmYrjQOzcxucWQmamc/vv/7UXHbT5JB9PXlS09/wJnQ=; b=eIgYFR4H4nMgYB8gP1NQrV3hNX
	zO8QdEQ4LLSwg0I8GR1nqu1TrLqaLj7iwgJiVjTRFSBEumO/iR01VFaLNi/cy/DWSDmbZ95LGLsw8
	7w8U/ZsuehstQoyCx5QOKBcVXousvcWnCdkpIz2WBWSCk9Y2lfEQywmRXi0WWPvtN9P7sGVAPFgnE
	Nxh/J1yoT111smpVr0RJledhNHqMBCtQCp19o1pmIY5+M2RZPD8riW7HubXFAXPPXeZ4HSc1SMPxH
	qh0QT6ZLdiv49l05kWACXPRDiPhxFYODbjmblpRaaULn9er7aI2xYZJlZB3bTI/j0ZrZfPCcRJRq2
	M27iTSzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jP9-0000000B4Uo-1eKO;
	Thu, 24 Sep 2026 13:22:27 +0000
Received: from mail-wr2-x13.google.com ([2a00:1450:4864:30::13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jP5-0000000B4Sh-1t5F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 13:22:25 +0000
Received: by mail-wr2-x13.google.com with SMTP id ffacd0b85a97d-482f6350f89so1446755f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 06:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790256141; x=1790860941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OmYrjQOzcxucWQmamc/vv/7UXHbT5JB9PXlS09/wJnQ=;
        b=XWxSp5Nd5cjbvRDTVHwd4CDWiYSDltUzMavhUTEEG0h9UlmK97EeH9SblV93Km4phC
         MioKOdAb0WCmkOWheXt5mhRnDddAoIhQfX/3Oi4+ax7xM4C6SrqG0SmTlaaz5ndvNU6X
         T4t0Y42dBsHif2+3G5L7To/V2DvbO6SeCjnQf4Uol4pC8mehd6dy82wPy2VA8DMru4FL
         xV/FY7Nk+ysvDA6oeLpNU+z+8X8O7VhKx9x+roGinqqgDvS49UkdzvRXAC4GBVQFilBf
         h/tLHJ0mwJ9HcPmegYQm5JuBt3E1Ij4+inAd4cmUjma52u2VJ2OTL3mmPC2H8XkFynh2
         0p5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256141; x=1790860941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OmYrjQOzcxucWQmamc/vv/7UXHbT5JB9PXlS09/wJnQ=;
        b=HRwFGNcYiLGrapUmHhToW7YzqkvQo/HE3keYkpdt4Qvw0xJkvb7j/FIjoUM7hSsl/k
         F1fEz81GUZE5g0YiqsBpX7klenTGRiH0U6Xsr8Fod/SSIKR8M5k83QK2dxZnaXSiL/q7
         fAyqRDFGu6uKP56nz2QKJ+4xPC8feUEkAPZMuOv/iRGP/QHMybAfQGXKcXdeAIsAkVj8
         xKz0tE9Pj7enLCo/4Bn98b3WatvzfZy9i6twaGjz6l9h+b2kdgEQpt5HLy7nhubbHnGe
         nkmsoA5N3kEVroisByJcd4xqu4r5arS/G+fpvCGjEVIpJ0U1cARNasDQli9WMCPh7eD+
         pvhA==
X-Forwarded-Encrypted: i=1; AKwUvBwE2imXIgzzL36/GdD5fLgBoNZutBggMYYHbW4AVdqw2hskO0nypwxbrj4SVuR0HPpLb+fSC+QVTgimaocJP4pL@lists.infradead.org
X-Gm-Message-State: AFuF++lUfvX8vAegHtowJV9yOW7c8aPzx2ZWW7bcl4zX7x6ddSHNQCE0
	3jruQvz2QofmKT0lCru9M6N4xjqpzYb2tkBIyJBVNvI9fP1FHTatabiP
X-Gm-Gg: AYBFou1uBV2+Gm3A+oWJv1hDbuJsqiTI71aee7qjPqNA5tGyCuzQGLkCbSiM7NsqRoJ
	EouTb3q0GlS4n0nZW+C7gWTKJWtmQa2Yl2gEMJt5ZDqqBZBvHeiCiVRNYQ92FKLa0T68CtAT10Z
	+WjZaBszGXQXiECTbo8w4vlpA2hJhWmRziaFCj3cl8VwXgHycRS/rJylRSyxD6EpcnIOYNBrdSU
	DmJ5ZC/++Hv9WoBuauSsKJK6o1yqyNNN5UQY5diqur+xhmDAl+28iCu56jM1H0FUAZA8Jp8IBo2
	8R3E1CjyAOuu66j9Gz3sNyVpU1PWADC2pGoU5XmGL5GqLJHninYM3YfrnMte0h7psF3c4YrVWkQ
	Cd9W34D6CJ5TqC0yktMY8EmH3IZrvalGgqY6ikhB/F0Z1WZJDMAPjOJFg6hoihaDiRcXOYL74TM
	XuqX9YhS6XGQH2vyNr1bIuWhsjnZa+aQzY7KrSg+HZuxf03+gmMouU+goNeft7+MMpOfa3NYt0f
	QbAoao+mu5yXG01iQs5jZWP7QzgN5iKjw7Rz+VaSsxNpA==
X-Received: by 2002:a05:6000:2501:b0:487:ff2:14f5 with SMTP id ffacd0b85a97d-4887170d387mr5025354f8f.4.1790256140984;
        Thu, 24 Sep 2026 06:22:20 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c267sm14642949f8f.16.2026.09.24.06.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:22:20 -0700 (PDT)
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
	sander.speetjens@gmail.com
Subject: [PATCH v5 1/2] dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
Date: Thu, 24 Sep 2026 15:22:16 +0200
Message-ID: <20260924132217.1281752-2-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924132217.1281752-1-sander.speetjens@gmail.com>
References: <20260924132217.1281752-1-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_062223_504311_84ADF210 
X-CRM114-Status: GOOD (  11.34  )
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

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
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


