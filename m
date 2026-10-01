Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899E7CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 19:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGElhAW7KvUaLn/kwKuU16ekRrncolXMHKfCx7Xylfo=; b=yt24rDPrnkrRlDJg9mcgngqbbM
	CCw9gdcGBdw+M86t2tFSlrTjjPymCkOjwAKa/lw5KJpzyXko9B1v21NmNhXrfnwFmwG1CWdLY1Bic
	8zxZXeI25kS+VW51dh2dbtiordKEIQ4Ima6Z79/yIvKPy5PxfeJ5a9Fd3UYsD9/sl6gkZkWyysytm
	Ykk56Az667uDC5yfGDwGb7cn8XKAX0hDo/sqmgZEwxohf8czO2xtJjl+J+nRBV5rHI/skNKvULFl+
	yNRodCKC6EY0mFTpv4ekQn3azwTU6Li2qP+jcFTbeksGvH4DooxcvMgTOkZj9L5GeNNepaRPpY5Es
	Ye17KQvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCMaj-0000000A5qI-0J2i;
	Thu, 01 Oct 2026 19:37:17 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCMac-0000000A5lO-3XkS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 19:37:13 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-4a00d8bec5aso21588495e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 12:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790883429; x=1791488229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGElhAW7KvUaLn/kwKuU16ekRrncolXMHKfCx7Xylfo=;
        b=TXQ4lXHU1i0n7uLu1jhUEfvNN+T8iE1D1/tRc0OH2f/q4Ub7mnuTKRFdJ+Qf+5aoNw
         Tpg9/lFCTOYozNs/U0JilKAin6WG3xfDxtNpaKBeG/CU+dOD7pOfkV4kaVHcRTXQST8q
         8WN14vgO/ICgVWRldheNYOuWjrUZut7oT8J4HdI7O7a1raMPxdPH/xjlcxCOXVfpI85A
         PjAMj9EZS3HxzUOGgvaqcS5HDzarufJPkWBrIoy+hM8DDwgOJeCY4Ix96b2tloFLxBCD
         //e89LeU36WOas+O3b6A5LYERy+tfz+Kpdos6gdmu7Gp7gdmY6xXGRM11a5LL86wUmWi
         Ljyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790883429; x=1791488229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qGElhAW7KvUaLn/kwKuU16ekRrncolXMHKfCx7Xylfo=;
        b=hbAmmgrqfTJUCg3jhNiUGye9ECIGlbZuaFnHlCfOvtf/oWpJE+W6zNLLppL6fFZjDO
         l4B5qSmMnttAVYb2A3u3zomAFqwpA1hBSJhOigcX+L6HnaDYudm6CFwFNnK7NX3FhAXJ
         Lmcv40B0R7XoX02MES7blzmROIhon0Uf3qZD/Bzb75Yx9H70/c9xWMQUgVLMaZFMl3+P
         Ad02a+zw1egBQWJjnyS+l04FjamOHYV6Q/jWxe7Tdizzc49DyLDPLU+laSwcB9uU6ZKb
         pQlq1CuN9ORfzy0CRKWQKSZsXbTSxw6ttzlFBGL3EaqArfALBAC6Fmb3RqT5C927mlj+
         iXVg==
X-Forwarded-Encrypted: i=1; AKwUvBz4TdamHLAxkxdtU5iIqyzgxVbxQxtDfWhEPA5LrJYeh+dvzju36Dy828HaXG7TkR0qs/vUaJSY86HbNwFWkZw6@lists.infradead.org
X-Gm-Message-State: AFuF++ndde+nFSIS/7neNaZz8EZDiuaD9OrT8jFUNkoz0kyLzPgfQ2XG
	jHJ3hgcRliV2pxpSqY8fEwFrWc5/v0W4sVyF9zsx/DCO2GH+TyE8u7xw
X-Gm-Gg: AYBFou1aEh6Sa47fTwr9Jhe/wu6BBoPVOWAJ6GYzzmegQg0Zk3gYS9tWjNOxKTsos4C
	jYJbi43XlLhtBabpwhfh6GqWy1p4/NP66e+4LrHxk66RuhuIHunWfO22HU6iYC0tJclMmAOkmHs
	FCXlTAXkqWvB7BI6ukzxiONTntZxtVSzlzTA9KW0SdHzanVTl0r/VwYUtrs8mSCEBoVyfuK4vAs
	ALq5DFIbYSlFlU77ZHrSapTURsjVo8FE4NsfB3S+gLZ0J7oJaSr2x5XaQ9/DM5vWW8tIGbBAChf
	xKEAh+MsiRTaNmUjPrYPCC+Ey0VmDcZ7pUcedKYgx0cJS8MdNGByhE4NtAy1zq0cUNjKs9xG07u
	J6UOCedTEHcerw5i2n6y7XjVQhCmP+eE/P00lM+dGcRO90NaX9qWAdkWf6/I2vWU3qXyQ6arYAV
	eDDS4/ZESufnsXQFkic4j3mxKdn8gZLDQk50fAoy6mTcwBQ5VI+McG6nB9mP4ieqrespvcZFoiq
	ZaQpakoljM00aFWBh83XLblSR8/H61NO7XSyp+I004z8g==
X-Received: by 2002:a05:600c:1d09:b0:4a0:37d:9e21 with SMTP id 5b1f17b1804b1-4a0276ed19amr10432355e9.29.1790883429210;
        Thu, 01 Oct 2026 12:37:09 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02770e8f2sm12312315e9.6.2026.10.01.12.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 12:37:08 -0700 (PDT)
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
Subject: [PATCH v9 2/3] dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
Date: Thu,  1 Oct 2026 21:37:02 +0200
Message-ID: <20261001193703.734323-3-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001193703.734323-1-sander.speetjens@gmail.com>
References: <20261001193703.734323-1-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_123710_930412_41BDBBED 
X-CRM114-Status: GOOD (  11.15  )
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


