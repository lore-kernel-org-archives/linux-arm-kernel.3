Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD601D78326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 14:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iOx9NaY1qX5HDoI2TYyztMEaA2o1c52TzC8u++gvhCQ=; b=BUVa7vLphk/8nNsOdNNNjpSXEC
	BHzR/XqF5XQbrmk5+uK4sUWnNfsOJemxisfZKNlRAh6BrHl0yAUl1NJCOrmyEedsM1hIZIniIt4qk
	XNHUYkJakZuPfxhSmFsFN8eTtRW7Bv3t9PIFrqPjXWYGldUBLQYSmktD00y8mHJ15zp/czjW0Q24/
	GRata45UvdI5ymqkYWQnZdroN17HDmlZhDrzGmvpx4vI/LQn2kfCiLrG0bwoPpnwW3u1v2nnb685S
	YMshmRzuyc2jWC7ofvutCnOjfruEPtGV/6IdZzbWa3WlEnndx0HZQCGOAlPCOfYbo46dluLZ/0Uwa
	nk+3ZlhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7WI-00000006TEt-3rxA;
	Mon, 02 Dec 2024 14:35:26 +0000
Received: from mail-wr1-f45.google.com ([209.85.221.45])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7TG-00000006Rkv-1NsS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 14:32:20 +0000
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385e25c5d75so1558222f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 06:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1733149936; x=1733754736; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iOx9NaY1qX5HDoI2TYyztMEaA2o1c52TzC8u++gvhCQ=;
        b=PIUy7MXC9tCJbqSpeWxh+Tt900cKMCgvjEn2RXoNWqHOV/9aNJB7937ncUWzhJMVGU
         4RKr8qD++KLsQGSuUgZD7Fkh6ESRSwz6+5xtzdmOOYRrF1zgqsBmYzK31IZ8mKpdg5IY
         hicxi3XDcAKHrwBfwEtyhxqNmiZD+HwYuC0w3OQYC/dAm9djgmcRfbickqcpWZPf27lY
         b2SYyKwPWw4Nc/Jn+ZrI2MCQ2+Ms8B5gkTkmXuIpwaQLfrshiDTtNaFYWfcEaR2RLbd2
         EBDziJ4IW+8WIssqIf7bGIQQRrl6xelX+bwNLfLrUombpx4vkzKIRShYOk1n1n8z+v+X
         UQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733149936; x=1733754736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iOx9NaY1qX5HDoI2TYyztMEaA2o1c52TzC8u++gvhCQ=;
        b=D9UNpNFCuTdPj0aitZl/jvER8PChX2xc6BXer0cRxDoz1yO5n661Os4mmw2II9/0Rc
         a1JkR8hdW7JLNmdPe8iFcyjaRvTV9wHe5tWRoqb49CHgDZYCL+JwAaoxRpmI1qw31Yuv
         NqPlY28cWRaDSfr2pnqnbQWFI6K9zFT9XEvoHTkzCvnxXfjP6uyCtLXz3e+IVeo34JlO
         inJw6Q4ItrXVJ4uMbzWZoURf1f6+rvfQjh7+CrFRY//dBN475RKXp1dqnheqxnAw3MP/
         ftdZ4bSk6GAb7pqqNn4ilwFey6usFcJEBy1f2WlbpSUrASspGrFugEfQBzNxcM6jQzrH
         mVQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYaoM3eUsCK+5Yi2NXifdJZ0j0j1Ur3eeLHbdhQ5Cq4ir5JGIVY+WNZktB/E3gB02Htg2z/cBsZCHY1WXBOZBG@lists.infradead.org
X-Gm-Message-State: AOJu0Ywor9dX7uAQknQUNBnm6zsLMOFkVUO/Jq4BFa49ftd0W+RDJWhZ
	bKe6rAvEuNmJLRknKXOy5XOam0KJa51QWyeXD/lOjWJcv4CqBX0o86N+tdW2peOPRL3D0o/h3md
	P
X-Gm-Gg: ASbGncuahtcFsSuq43WUlsQxcBiTO6uAXnNfGQpa83SqG5nGQJfb3/UrxDRCDoeFR9V
	MPXjFOI7lGQv/Sc2NGufQRBZ5/0GOFmu9TDqYfbipQ8fT/nhedImKuhJtp+Iwgq1tTJP8qh4I5O
	kjR0ILZIxmQSInx521S9M90esOO1DC/mKDZKAZZdrNcFf2yekIYG7/5Y+SFV3hIYP5RH58UKFRi
	HSFmLOG9gbbdyI2hupgmNmjPNSQc+RAQUXJaLjP2Q==
X-Google-Smtp-Source: AGHT+IGWILDCH0oN5IIP6AmBZHCVw8v8xYQoGIqxbhQefLB2luB62aEimC6i2AGfGXR0N+C6cAzdpg==
X-Received: by 2002:a5d:6c6d:0:b0:385:e8aa:2a4e with SMTP id ffacd0b85a97d-385e8aa2c01mr5694103f8f.31.1733149936076;
        Mon, 02 Dec 2024 06:32:16 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-434aa74f1e6sm188429555e9.9.2024.12.02.06.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:32:15 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 02 Dec 2024 14:31:54 +0000
Subject: [PATCH 1/7] dtbindings: display: bcm2711-hdmi: Correct bindings
 for 2712
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-dt-bcm2712-fixes-v1-1-fac67cc2f98a@raspberrypi.com>
References: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
In-Reply-To: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
 linux-gpio@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_063218_387789_CB485C70 
X-CRM114-Status: GOOD (  10.49  )
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

The previous patch just adding the compatible missed out that the
number of interrupts changed

Fixes: 62948c62abca ("dt-bindings: display: Add BCM2712 HDMI bindings")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../bindings/display/brcm,bcm2711-hdmi.yaml        | 44 +++++++++++++++-------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
index 6d11f5955b51..6af342c9b6b8 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
@@ -56,22 +56,38 @@ properties:
       - const: cec
 
   interrupts:
-    items:
-      - description: CEC TX interrupt
-      - description: CEC RX interrupt
-      - description: CEC stuck at low interrupt
-      - description: Wake-up interrupt
-      - description: Hotplug connected interrupt
-      - description: Hotplug removed interrupt
+    oneOf:
+      - items:
+        - description: CEC TX interrupt
+        - description: CEC RX interrupt
+        - description: CEC stuck at low interrupt
+        - description: Wake-up interrupt
+        - description: Hotplug connected interrupt
+        - description: Hotplug removed interrupt
+
+      - items:
+        - description: CEC TX interrupt
+        - description: CEC RX interrupt
+        - description: CEC stuck at low interrupt
+        - description: Hotplug connected interrupt
+        - description: Hotplug removed interrupt
 
   interrupt-names:
-    items:
-      - const: cec-tx
-      - const: cec-rx
-      - const: cec-low
-      - const: wakeup
-      - const: hpd-connected
-      - const: hpd-removed
+    oneOf:
+      - items:
+        - const: cec-tx
+        - const: cec-rx
+        - const: cec-low
+        - const: wakeup
+        - const: hpd-connected
+        - const: hpd-removed
+
+      - items:
+        - const: cec-tx
+        - const: cec-rx
+        - const: cec-low
+        - const: hpd-connected
+        - const: hpd-removed
 
   ddc:
     $ref: /schemas/types.yaml#/definitions/phandle

-- 
2.34.1


