Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2553E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMHTsU0ZjvRQjwquvG/Hg5h2182Nwlr0NKl2ofXPRL8=; b=tLAsgz+zyIkirdR3FB3uJva5K0
	+VGp3F2C1GrlmDMWhm/SmVwltuKrJj5MQvZfkx00MLPHDWZNVmEbk3vghfUb9vdjUuGQUTWueuiYb
	BIpmaRTK3HrXR4dtEEk6AOuW3yRe87neRomzNZsv50Lp1GQ0Cx96LXQAvTG1zJkaderXp5HS1qgOY
	IdXqjHG34pMjzypqTe1BIZQgWe2M3AWlZ4XfgLRG9f12f8NSJhkJcHyjUBDsxNYAUfHxeUMKZ4Azx
	FBWNu93JIB9QHObQZu548pD7mVXlYvzhmh4V0B1QoL68g3ftuMrPkMJ4joFA5XBOR1OI07OP38HEZ
	G7xKyPnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmvj-00000001Anv-0WJM;
	Thu, 12 Dec 2024 17:24:51 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlu9-00000000wSm-1Y0e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 16:19:10 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso7703385e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 08:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734020348; x=1734625148; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fMHTsU0ZjvRQjwquvG/Hg5h2182Nwlr0NKl2ofXPRL8=;
        b=eE3k9yFAMtWpD/m82J2NP9afXbeVBDAHezUATekV51KwugqGHzHelvFxQPCfZR0eSI
         RNn4lagjCA0dsYXFDdQaa+Q3DSL0Ic1iFa5VQ+tVcPyEtAoOdG26GuDrTBcMvyITEx/c
         WPANWqGVx4MZbYgS3jF3qlWBRHdP80g+k4dIipQsEJh2pItRG3m6A+cOhwNWs1m8vuca
         5Kbc4zpeX7VGeSFzmVFXXUF0mfI4cdCBA5cAN4ixA49rbo1x2xrRFzPvqLZECqhe2opI
         acp0heUNjxGs4FW1WhG+5KPq3/20J1McChqlicA20KeK/n2kVEiftlWhnKUxKs5qGR9t
         PUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734020348; x=1734625148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMHTsU0ZjvRQjwquvG/Hg5h2182Nwlr0NKl2ofXPRL8=;
        b=ORA1K+19qgjtqrqcZwulrbnQSfBNTG914ANFO7SzkkHj5SwBJc39/P7d59e3FnsJ+I
         zg0U8BAbJw8mYejoyTc4XWWvZNv4SH/RPw47krLJ+egaoD03rawEgHQ92yFO6s3KYpoo
         wgg1LVG+tW2gXnrfpSnNyXC9Gmk8s8AzMoqp+s0pm1h1j4qx4hz0aj4tx5uCbzj05nVt
         zXppSzH91jYXoEfBxqWt/nwFzQFuw6LH92dWnRHha2qGldgDccAgjs6QPkv2UUo8HFKJ
         jAI3KMtoNoRnrDOn5Xu46y53x+PJ0LOxzJ9ma/MYqQGvWk0aOqegqwBqgF3s2jhPYpC/
         Ckcw==
X-Forwarded-Encrypted: i=1; AJvYcCUMurVs9Lh+ocUsOKctfV+3hbW7CImUjvjhszzvk6Ofqm47lbHebDAQ9n2uT34Q/SYqT8QHIYrh1XdeakJSan2C@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd+bqZQG71bbgydCR8zIMvepQ2g/h9mJD4lEVjW4CZXmHKeybu
	MdGZ6hh4z/Hs4qC8l20SKy7ZpLexdbLtQZJ+tbmetFQdf/Zg2T7rS+tImF9HBGs=
X-Gm-Gg: ASbGncvsQoUNHmYcDl9tHG7tskBnz2He1OSzMg9YdFxkBvljVy0VRmA73f4YuHMwSAQ
	PfHuU2YFrJivig5RuYpxJqY7k0occuJloxd5J3uTNEnkDJ9jDQOWjUJ5oaHKNsHph4SjV7uRsuV
	DubRfPKc4w0yEdCy3Z4Na4KxhVL1E+TNDG///qW/PqRUsZmieF+VaoIJ1ER/DVUIMsMvURwI5hO
	UFrKhDS9D3HmVs7oddTo82gcbM6OHBY2O8i/rLYdY0nGO7b
X-Google-Smtp-Source: AGHT+IEW963IsJu+5kmA4Oes4+Y3LvbmvGkTXDKtXSMQMJQRuXOcNzh2GjScR8bf2D3ZBqv1bcGbwg==
X-Received: by 2002:a05:600c:1c82:b0:434:a815:2b57 with SMTP id 5b1f17b1804b1-4362286399fmr31867605e9.20.1734020348074;
        Thu, 12 Dec 2024 08:19:08 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4361e322328sm44336105e9.0.2024.12.12.08.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:19:07 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 16:18:54 +0000
Subject: [PATCH v2 4/7] dt-bindings: interrupt-controller:
 brcm,bcm2836-l1-intc: Drop interrupt-controller requirement
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v2-4-35986e04d0f4@raspberrypi.com>
References: <20241212-dt-bcm2712-fixes-v2-0-35986e04d0f4@raspberrypi.com>
In-Reply-To: <20241212-dt-bcm2712-fixes-v2-0-35986e04d0f4@raspberrypi.com>
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
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
 linux-gpio@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_081909_413436_5A3BD484 
X-CRM114-Status: GOOD (  12.12  )
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

Since commit 88bbe85dcd37 ("irqchip: bcm2836: Move SMP startup code to
arch/arm (v2)") the bcm2836-l1-intc block on bcm2711 is only used as a
base address for the smp_boot_secondary hook on 32 bit kernels. It is
not used as an interrupt controller.

Drop the binding requirement for interrupt-controller and interrupt-cells
to satisfy validation on this platform.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.yaml  | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.yaml
index 5fda626c80ce..2ff390c1705b 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.yaml
@@ -34,8 +34,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupt-controller
-  - '#interrupt-cells'
 
 additionalProperties: false
 

-- 
2.34.1


