Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA493D78321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 14:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=66NaRjYo+TdRIjIUtk+A/zrTfjyMbW0NLvNCk3ACUHQ=; b=SonrfWsc2HcE99
	oq+dLDgSk9OK917aybirNX88T7U78Osw7+JPkKJ0PT5XNWQAqM4x5aF3R8kt3eXMlW/rdUj6rP3pZ
	ZiaDHPDH7Dz2TvCsEc+4jE3EHtH+bj4JEm16skEKo4y3hnepaCWO3dCubnduxemu2Lf1/6/sbGST2
	wUy+gdO3kF2t0IOEsxGcSxnhDVy//XZb/anEJwmCBFe1iw7EwzL72+wxcOqQwzYglrF/vzi62rg/y
	+57Q+x76f9jFUlSVafoO0HXgbg9qVh+DfGIWRJU+CLxr86Ny/0lN3Qiwi2OLenxfh8GnP5sd1Wt9B
	W2KrPLYGi4nGRYLxJzdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7VL-00000006T3C-1OO4;
	Mon, 02 Dec 2024 14:34:27 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7TF-00000006RjN-2mlT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 14:32:20 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-434a8640763so36643415e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 06:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1733149935; x=1733754735; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=66NaRjYo+TdRIjIUtk+A/zrTfjyMbW0NLvNCk3ACUHQ=;
        b=DHLsglR/0um9AjS8tI2kPJa7WvqCyAJh0sT+rfSHmSi/iAza82CtvguDSptjJ8pTXC
         YdXTaBkU2KQMX2sIbFcKuTwXgZCLHluxFk4lj3CrccneGzxObtCNRZeJBMSQy9rYEUPh
         XVDIy64tu8CdWi/gWDeGOpZA3xzoG+KGCTiyyXIBKN2vDlgvENr2FpCKoe9GGOxr2bDM
         5AxpwITjj5o9YkvCEqfBRWFCMB73QJDebDSqCQ6fSi3Xu0KncjZ0fOIQv5glOZ1Qkp4d
         DDRZ9BQHkwGtkmuIUDhzxOPQ92LZXhUpuxoepvJhrknGhspP+wxhWPqSTl+UY/3vOxZf
         Nvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733149935; x=1733754735;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66NaRjYo+TdRIjIUtk+A/zrTfjyMbW0NLvNCk3ACUHQ=;
        b=rpqFbtWE3qHI5OrOxDmZ5tIIIppejsyIZAUkTvnPxUh414VXDG0IAPLU6ZZ2uh+gfc
         rDWDQ9AYF2QE3lW25upIp22PC1Hhyb4vJ9+UQDZnL9S0tcTMEXwqK+qm8QEgXjtcyJ09
         zba/rAwNHPbUc1YHaV86W6CnsBixQqrIfqyer9BcrzU6keOd7k5iIUi8NsKguMJikG3E
         sJR3TnJhQ4WcF6mBim64q0ttsfHjp7a3M28VBcKE0jfN8sdzehQJWOCwAW5+A6VACAt7
         pE1htcX9vaK7FpyGhMkgjjeSVu7PtDjp9ZqlmNyj6G8bwPwTRUqWX55F3qQeqJxPeDAR
         W3Dw==
X-Forwarded-Encrypted: i=1; AJvYcCXPmjzxK7zg07INxy05fsmm3IyN/Y2RKd6z5YYUAPBkWW6lVDkpmtKl+Ht4vbphwLZDuTIshMX9FfBhuZ/7S21I@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7MeK7czsn88PHd+siQSWskvEE2/xHHw5b5Q75BYcScl9qA/YX
	2K4HFgIdccfJevmX0TFgaVzwyMxypgtscR9K+yXI41NJYkw9ihMIB8nrFOFm9bc=
X-Gm-Gg: ASbGnctNZCwvgwX3O7PSMQV39ImYTQR5a0sQD7qTQXQ352WIxAIHqspQIQqztnfuqyk
	SxDjRdCwP64pZ8Af1WdYtATtpFT9R/jbeXXhR/Ajz7jIR4W55dWRgKdm/ZbXhr89PXP8Nb0H7S9
	wpw6yf30qUORHMQT0aO9rsCLSR5uf4w4XvVnEC2k35lQSycL/HnfvB3w96Gp7Zgfcew2CUuzBEt
	Hy8HrI44oNr3q76XKNYKf5Hzt+5M44KKjHGR3mryA==
X-Google-Smtp-Source: AGHT+IFjvnTvxoYoYzXeiS+rT48r6tDHyIvnEQ/xQrP8Q+YrgHiGsItI6q35+4octUNLW9uQ5Wq4wQ==
X-Received: by 2002:a05:600c:1e09:b0:434:a8d8:760e with SMTP id 5b1f17b1804b1-434a9dc6774mr200107125e9.19.1733149935182;
        Mon, 02 Dec 2024 06:32:15 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-434aa74f1e6sm188429555e9.9.2024.12.02.06.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:32:14 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 0/7] drm/vc4: Fixup DT and DT binding issues from recent
 patchset
Date: Mon, 02 Dec 2024 14:31:53 +0000
Message-Id: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANnETWcC/x3LQQqAIBBA0avErBvQQVK6SrTQmmoWWWhEEN49a
 fn4/BcyJ+EMffNC4luyHLFCtw1Mm48ro8zVQIqM1uRwvjBMO1lNuMjDGf0SFDuvvLEd1O1M/Id
 6DWMpHxlHVi9iAAAA
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
X-CRM114-CacheID: sfid-20241202_063217_978664_A1E659FA 
X-CRM114-Status: GOOD (  13.13  )
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

I missed the DT errors from the recent patchset[1] (DT patches
in linux-next via Florian, DRM bindings patches on dri-misc-next)
as Rob's bot report got spam filtered, so this is a fixup set.

Largely it was changes to number of interrupts or clocks in the
bindings, so those are now covered.

I've fixed up the missing "interrupt-controller" flags for 2711
and 2712 whilst here.

I can't get my head around what is meant to happen with ranges:
"soc@107c000000: firmware: 'ranges' is a required property"
The meaning seems obvious.

However if I add it then I get:
"firmware: '#address-cells', '#size-cells', 'dma-ranges', 'ranges' do
not match any of the regexes: 'pinctrl-[0-9]+'
from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#

There's obviously some other flag I need to set in the bindings,
but I can't work it out. We have similar errors for all the Pi
platforms for one or more nodes.
Please advise and I'll happily fix them all.

Thanks
  Dave

[1] https://lore.kernel.org/linux-arm-kernel/20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com/

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Dave Stevenson (7):
      dtbindings: display: bcm2711-hdmi: Correct bindings for 2712
      dtbindings: display: Fix BCM2835 HVS bindings for BCM2712
      dt-bindings: gpio: brcmstb: add gpio-line-name
      arm64: dts: broadcom: Fix device tree warnings for BCM2712 display pipeline
      arm64: dts: broadcom: Add interrupt-controller flag for intc on BCM2712
      arm: dts: broadcom: Add interrupt-controller flag for intc on BCM2711
      arm64: dts: broadcom: Fix device tree errors on BCM2712.

 .../bindings/display/brcm,bcm2711-hdmi.yaml        | 44 +++++++++----
 .../bindings/display/brcm,bcm2835-hvs.yaml         | 77 +++++++++++++++++-----
 .../bindings/gpio/brcm,brcmstb-gpio.yaml           |  2 +
 arch/arm/boot/dts/broadcom/bcm2711.dtsi            |  2 +
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts   |  9 +--
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          | 10 +--
 6 files changed, 106 insertions(+), 38 deletions(-)
---
base-commit: 8c3f4a248f35817d2f604c0e3df1bccf27590228
change-id: 20241128-dt-bcm2712-fixes-afb0e8a0a476

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


