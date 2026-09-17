Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B3CC982D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 12:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zh8dnCzgurcfuVXhK01muyhzuo7mZiFtdSNhXSbz6gU=; b=MDxL7S4m7HGuhIwX/OUYX4949l
	vowrnq5LbYmHgEyjaaSkntF8IpB+VZpXI/aCArV85pwU3sN1DloHDe4CEBtDUWEgWeS5Q8vOzyKpY
	wZEBmOaRu70tINhNtyodwj1xKbRQQEKuBdBG+UKNi8rUNv37C/dUq7Gaw25hKnPMIoTVitEjJnDpO
	eLxonkn7uqIhBHu3acGch1gwZARItA+je23lecNlP2s+e1g4eFRmT6DTS7XbksSQ2ky558gCLQMss
	kgVV0v3f0iFcz7NCOkimpnD+z/KNrGwXU1Q2uUcTmVJlE/JLzboM6sxESDSEMRVy+2GDwXE61UPe3
	p9MygLwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BB3-0000000BHfT-0MJz;
	Thu, 17 Sep 2026 12:25:21 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BAz-0000000BHdT-0Va9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 12:25:18 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so394952f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 05:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789647915; x=1790252715; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zh8dnCzgurcfuVXhK01muyhzuo7mZiFtdSNhXSbz6gU=;
        b=ZfAhARGWxf+ArAfjKVYPxZjf2BjpJo4dUJlEqKV3gfgypUws8mef6mXa+5ZqUQ50hT
         5uDusIZCAyfiH9YaamFJitb6jJNX3TOvpxJJuuMKAX8ZxhKToIpT5LUaAntd/MwWcWOh
         Wx9f2mzmS/b5wYmZa37+JSC64SRlnFVGcO3uCCmHi+0atn9d5dcHvy1y6DSwQOXm8ydM
         DOPmkxVjoPh7U0H+UNsuJontqlqu1gCKTbDGDbXVISQtO3z61yzMM7wNypMk5FM3cvG4
         7leAV5z7JujhecgNdJHZMqj3rxJpUEcfqMqKcbbMW8AptmjGsOVrWnShVETIfULb8c5Q
         vx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647915; x=1790252715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zh8dnCzgurcfuVXhK01muyhzuo7mZiFtdSNhXSbz6gU=;
        b=FN6y8tAhZM6EfQAMe+JzAFxVdLo4GihBgrYGAS6jrdlA/4n3zls7IXsRmmynZToKD5
         v60VOOVeeu6bD7mk+jBouqajXq5GmIrumgVMlXyJyKni4UCw19/5CfrIh4xq0dG7m/Ep
         snnZf5TIjabF78FR4X2gcNhG7+JrvUe8TzhrBoRavvZi3Np0WdnCv9x7d2cHOr2JjhRF
         VkIB6eQvYCnvPknHHk8i3VhUw2qFZDCQHVWM1DLCsk7jkr2VBTPVF8Re2ElJmnzkLNaP
         CI0+GxNjGL72P2rgomLf35w82DnmXlHGmDOfXNPng0P+MVWbnK9aIfEDr8XD4a0E89g+
         zHJw==
X-Forwarded-Encrypted: i=1; AKwUvBwugnETRBnP5B7nQdfxdsxZ0xO8gdx/TZPidOSZPvU31xuDv6uethggZtVkdEG4Pf/9xuCS5nDWn1JSb9KZ4syA@lists.infradead.org
X-Gm-Message-State: AFuF++kPNM50tMi0L4wzvnOBU1SMULa+UKgV4RgNU/NeUlERLfebeaK2
	TI9/qSOx/X1G35yObfdvUEzksY6RlWWJ9v2tBSDPc1hKSxDfkzBZQWrO
X-Gm-Gg: AYBFou0kM6TnNc1OohVFvP4/rKCwW0k6A7mRsT8emG8VXdevip4W48dMJMbOuTY9VLn
	qiNmhfU8pBseJDGk61WPTVz+3/HdNZG6eH8nnIM2wfmdL13B+CZaRAKQiXe1LIVEbZluoV9iFlj
	A91/ijOPGBUtXEkXyon62EczvEu+OqKZ5L+YHUm5vD/CXr6HRw5u/8KqX9j3A5UWnHW7whFHjtF
	Tqb6/1ZtVadKHmhCbbgAt4Al0TXMfRxzHhPvayYsKtihA4wGdyqbBWFZnqAme0AGT/KM8X4RQJC
	Fu3TyowiD+gOd7xYhf8IOPdaoLWG+eJuBs7BUg72ilRXzsDtYEb+b6FujS8CqrXMjHaRtW0QvF0
	NKZtEGSBAEQ0Wb5t6+9IZpJe8XhcnAF8XCBeX7e7Rd1/lSiGcFX2lsEJiuKCoENeKq2MG38su7f
	E1Af8SnRMxXowdaZTxZQrP+/mmLSIHMFUEtQjxKKMUU4u3pLof/Y2ak6QwddDEdxH/ZiiCdq9IZ
	mN2FMoP7X2Uq38l3cQb72IWv4AT7+4e+x7eN5j13dCgSA==
X-Received: by 2002:a05:6000:40e1:b0:45e:e1a4:c4c3 with SMTP id ffacd0b85a97d-4870cef0c80mr7996798f8f.15.1789647914967;
        Thu, 17 Sep 2026 05:25:14 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27ce2sm15276567f8f.20.2026.09.17.05.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:25:14 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
Date: Thu, 17 Sep 2026 14:21:43 +0200
Message-ID: <20260917122144.703221-2-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917122144.703221-1-sander.speetjens@gmail.com>
References: <20260917122144.703221-1-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_052517_172569_945DB4CB 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

Add charging-voltage-millivolt property for the Raspberry Pi 5 RTC.

V1 -> V2: As discussed with Krzysztof Kozlowski, this property is folded into
the existing raspberrypi,bcm2835-firmware properties.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml     | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 983ea80eaec9..1a0432510bee 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -133,6 +133,11 @@ properties:
     required:
       - compatible
 
+  charging-voltage-millivolt:
+    $ref: /schemas/rtc/rtc.yaml#/properties/charging-voltage-millivolt
+    minimum: 1300
+    maximum: 5000
+
 required:
   - compatible
   - mboxes
@@ -171,5 +176,7 @@ examples:
             touchscreen-size-x = <800>;
             touchscreen-size-y = <480>;
         };
+
+        trickle-charge-millivolt = <3300>;
     };
 ...
-- 
2.55.0


