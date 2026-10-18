Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A5DCCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 14:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iL6GDYV/Gzptn6Y+1zackEOFhZyQVLBTkqU0BFO4s1I=; b=oMZ7pLVF/rzz9TfqPjwluZxcNb
	9XvXHak0VHt0zGEJ5owWQWBSLno5I9Fi/oRj77wum+3a+7ZFia87OejYvLWsjNfwndy4l6BSOuyCy
	1TbftX3oaTd3q0t/hDjyRJZyv9x1KK7aO3ClY5hnax5DnHpwZLfmNxWt/Ef4H7d1Yx4ZDgGhQvNsz
	s9lmR89w5nZ8IaiCHk7m/PeOv3gfh2w5I7T4LZd/OPnpA3QfEhT6rDc8dv7DOQXXSkFq1sXNQF6PP
	ZnYCmKF4imo9+d34ad+rxe7wE4fV1vN5Jkb8+1lXiudEhANghtgCDzl3aTkjxssCU/3npnsjtQeGX
	ICbGyjPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIS1U-00000005wtO-2oKB;
	Sun, 18 Oct 2026 14:38:04 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIS1K-00000005woh-2plj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 14:37:57 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48afbd2c386so554658f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 07:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792334273; x=1792939073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iL6GDYV/Gzptn6Y+1zackEOFhZyQVLBTkqU0BFO4s1I=;
        b=JYJ+lEu8XGbnhiwxOX4n+IT/ZI+gan7fLFNKXKayGdXN2v2ISPx0eXxSOX2PFTynI+
         +3uLELB8Uil7Gf4XbHXERo0nBjCki8EAwp9XdfBvhyA1SNWKEf30eRkQegO5mXizFBUF
         tLG8LESXRiDMulAf1OB+gKFS7eRfR0Ld9nSM/HWZX9mKWTgNOSqJhqOmKPgwTaJuEU4p
         qOi4AOPbhPcaD2WNdSyiVdjQNeAgP5o5iR+rBucf8pnwIJvwf/0m3zZW9nGyUXKzg0yj
         FhjpszD1cX4WinFmT9inVSyfgrSJy64D3G9eWyvEoVCQ+DYNv3S6Aa2U4qvxfU56jJ9S
         2SCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792334273; x=1792939073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iL6GDYV/Gzptn6Y+1zackEOFhZyQVLBTkqU0BFO4s1I=;
        b=WTKxHiioMEO3yeMB3Lh5akSZpwx9ZKep1DC2MrpFCOuiXEf02h3AKHmDijRk/xijME
         ecOElPTRaSIJiXzbCeO50ouKPNNVB23z5zzAMb+JXy7Zoxn9tjPJj8f27JkqvTOMOB5+
         Va/LnH8HzkTQc3oqGPoFwMmzdvreO09LOOJrU7L/3o/Qxq6WHhN1fH7yzt8lV3EPqxfW
         uFzdVw9luLDT9/Wmiwk15QJFs6BHTrkmsb3RdmjslymcXxNePkpyn1Ns3YIOQ1yT8Yk+
         1PG256leCrGWoAZRVVewE8zMnpUSrEjH+HY0kj/eALDog/HoIIe1rdGxOJXolcPXK5Sz
         AVLw==
X-Forwarded-Encrypted: i=1; AKwUvBzQFucfoeIGdn4NKUR0w+33X3v5ym5YHGp9PDT+BLivi5uvC2hn3clscODWwn1Rst3sHAMIOxgRCM0FBT4bH57I@lists.infradead.org
X-Gm-Message-State: AFq9FYI6bilLxGbXHRx5o4Os0Ji2ob097kPTGeX+yZCD+B9tujUi0IgT
	afd27bCXO1GfVtJlDbVzm5XYVpOPI023nYI2hsX8Bsrka9UsahmfKjcS
X-Gm-Gg: AYBFou0VmVjnMQDEwNpXbZIY6JMNlIThTlJjk3DDJ1IzG0vJ75qX3DYOcuKDUP8IkRY
	ojkrf2TYk3N1yboemgRaoZJ5221NxK3a0179RLLEgCxMtKC1GhmbSWmUslN/+hSuGnE061ePMQf
	Q2kPp+HNgWRjfiNgm7pS+tqlpjIzJucw3XwOjMMUajEdNMKl+8SXnGWA+Bg62frm+cN7/CKh2dY
	UAHNfYFaKiRS9f+P3jnN7s6j10shH7FV7yAMbQGDQZ3EgeoU4Zve5PHoA7tF9Hs3k3Ov3MBLHX2
	RYBwtvBYOJ+tz0u2jwZ8DilkWbcrSZeFnMhLNCc1H3bdyYCIIIbgKhfqB5APiv9SUrkjdpwf4w1
	se1UsXeGPb/78Yu/ujIF3dBaNA0zGe6+2PjKfjTblwiEev2RHjJo/UMLv8GPVrB5KU7oZBjwFdF
	NvGed9TD6YTGe5Pa5oKb8g38TYVN7Ik1EaMDBBhjQoghk6rzvkV1PCdFf6hTVENsjznlcuuZqfD
	K1yqHTwBd7NSx91QROx6DSEXsEQkkD1qNUnWGdN73oLCQ==
X-Received: by 2002:a05:6000:605:b0:488:89c7:31aa with SMTP id ffacd0b85a97d-48e07fa5687mr11225648f8f.39.1792334272541;
        Sun, 18 Oct 2026 07:37:52 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510d60sm16559652f8f.58.2026.10.18.07.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:37:52 -0700 (PDT)
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
Subject: [PATCH v12 2/3] dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
Date: Sun, 18 Oct 2026 16:37:11 +0200
Message-ID: <20261018143712.1040152-3-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018143712.1040152-1-sander.speetjens@gmail.com>
References: <20261018143712.1040152-1-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_073754_768958_F6C8BE20 
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
V11 -> V12: No changes

V11: https://lore.kernel.org/linux-rtc/20261014083016.332338-1-sander.speetjens@gmail.com

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


