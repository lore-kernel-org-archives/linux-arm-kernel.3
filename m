Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF264E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fzut7xbqOYPi19sCzyZBocxByvsBqwohQ5FyR54rsTQ=; b=PNmyyg+hpaRDq/An3ylQgSu5Y0
	coRLF11xZ6P91yNVDwIXqb8SUb8Sl3MWnIeUfss09ASc4df+m0zlqlPPV7ZV6+NweNODplWtzHiOf
	nSCuSt7nGVEQXFyhrv0opVmOrLhav+ysM26TuBnTePloxRxqD77ZrKaoPwhWHgOu9SzUXAFZ8elMR
	wSH/WzIRtao6c72IMkBfCnXyrg6TGZDYmtIM/Tk5xS+v4DhLMj0fbIzctlgypQ+uyuBMsPSw++KMu
	GhI0Bu0+L9JsZ81OxzgcmYJHDzDs4mRO2dNGXczLCa8OaDPLG7zdT28NFaWVQpJHJCiGpwwLb/0KK
	EGWwKD/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmug-00000001AZC-29B3;
	Thu, 12 Dec 2024 17:23:46 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlu8-00000000wS1-3a91
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 16:19:10 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43624b2d453so10244925e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 08:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734020347; x=1734625147; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fzut7xbqOYPi19sCzyZBocxByvsBqwohQ5FyR54rsTQ=;
        b=sMf1ivK90E+awbkRdmBGDz5iBXEJPYbB3unOxWb1rBbpCOgoeNpVucPfOIUq6+J1TQ
         exIfWd3ii/graCwUAMRJ46RaMRkiFdOa6aVtLNq5VXCVazaDh2B4Umq2wKkGKWbB+U3X
         fXfqaOYm8VCp4R/ZdUGbBDOXL1EjmYYZl716jK9pDg8bYIjgYSGt6+b6aVypNSlmVtD1
         xWdD4r41kLnBEfzIlM/DQlWoJxiNWfTb7ljKyQrzOLCkw9asLpfOQ3i/sdAfhT9677Pk
         tC3AqxHp4RA+pBu0gyealsdOXLv4MGk4mTFkV+/hQ58PzJ9dawzIfEIRN9mDmRB65LCo
         Mm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734020347; x=1734625147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fzut7xbqOYPi19sCzyZBocxByvsBqwohQ5FyR54rsTQ=;
        b=lbp0QlF6o/gdWxRIJFZ5WczdB7JqV8GjcYtYkd/r/k+K/ZfxpAkcpNvXkUUVlvpafZ
         f3aX/iJPxNnlS2T73SN/HEox6x8MrW/vZgg3Dz7fApMqMQamfoawtac0ejoxjiaHtJwN
         8RRXyUAeXCSrz2jEqaQjF1J0cm5lxZTT821CIZziHjq80x+phOGZdZI/zZ8PNXT/MPi/
         0zRfiESVpFLv7VmACd3llC4YVaqMDtKOXJ3QG6KVcxyLTpIm6WEe6ZxOLD9EyT2BW8lh
         yie1071CdDH0GQ8gMZDlzNwS+7kWrWwT9zcJKjtW0HCfcOB6Tm+yTgnjUZj8FqdwoW+O
         tIyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuIVJUaq8jvK4YWjumarJKBh4rjAv6daxNiljuNf20LbuPuwLqGbl355Btzjbhx4iLdQNRsEApGs8scb62Vx3T@lists.infradead.org
X-Gm-Message-State: AOJu0YxHJTM+aOK6EmBX34QFMWQQx/cFrikIwV2dcydQPSjjD6lgLWba
	3X8B5xVeOftlSkcsYlAxvTgdEDyGx6CNnPK/rPume0TNKz4/ZbmGUJ0KdPqUtvk=
X-Gm-Gg: ASbGncvR/ysotIcuOdQdd2we4Bg5kQpfovxQrXyL34WXPQZ53a4LP444rG98mDlIfln
	H6cuLskoqIdQE2+tCA/LlgKIx5hPVn5n6loYn6kT/Ckgs9hrGVb5aXYJckBUUyANQujffAL/7l/
	9oTzg/HscMq4YtIukmqf1pdpGQRIb/2OjWeElXJkJcWru0mLMvv/jTH/MUBzJeQNHQOj9dYB6Xk
	Lvb5XMS0Z4r5NX6wu+oHgCxiaV0OXpfSIQieAlOQFDipc6K
X-Google-Smtp-Source: AGHT+IHoZqbjRY4dxkOhKOSnSfMy3sMqazkkzCHwzeDCSj2+qMUGuSSsMXf/szART5dZ1m3BKwwUjQ==
X-Received: by 2002:a05:600c:468c:b0:436:18d0:aa6e with SMTP id 5b1f17b1804b1-4361c396ad1mr69550575e9.5.1734020346842;
        Thu, 12 Dec 2024 08:19:06 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4361e322328sm44336105e9.0.2024.12.12.08.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:19:06 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 16:18:53 +0000
Subject: [PATCH v2 3/7] dt-bindings: gpio: brcmstb: permit gpio-line-names
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v2-3-35986e04d0f4@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241212_081908_920569_2B23DA87 
X-CRM114-Status: GOOD (  11.61  )
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

gpio-line-names is a generic property that can be supported by any
GPIO controller, so permit it through the binding.

It is permitted to have a variable number of GPIOs per node based
on brcm,gpio-bank-widths, so define an arbitrary maximum number of
items based on current users.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
index f096f286da19..fbd69b4cecc7 100644
--- a/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
@@ -64,6 +64,10 @@ properties:
 
   gpio-ranges: true
 
+  gpio-line-names:
+    minItems: 1
+    maxItems: 128
+
   wakeup-source:
     type: boolean
     description: >

-- 
2.34.1


