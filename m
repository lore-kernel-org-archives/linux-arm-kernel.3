Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B0CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=68JInAhAW5Is8mwm4BYMUDXa8RJRJvDNCf4zhjotoGo=; b=LtMxqumuI0ub0X
	GACcT1BxiRfdTWpX/ht80P33STjN647ibwzoUOK+SBymjdp/c8yuJoTWHNaL43wXCNDeLgDGCpC/Z
	FanraJAR+18z1MP7RXdt3JWAm6A38A7MwbTcJLXNVjEnIV/KtK1R7ZRH1B0gSGtlvA6eBuoYSVSO0
	m0C4/VaeL6RRI9zbb/GpLT4p2i601khtAoD2GwR1ATLKE/kgSDdoa1P185/0tlSur1AcVTtj2u3Se
	N3B/F5YU75BM9Mm2slettmOG92aqoop3oBoZDvKVospgc+CIj4SRB5ZwCzIDfPZAblQLarD5cBIBV
	HBBZSF89KcNshmLT5TFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmo0-000000018yp-1xqL;
	Thu, 12 Dec 2024 17:16:52 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlu4-00000000wPi-2pIQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 16:19:06 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso5843695e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 08:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734020343; x=1734625143; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=68JInAhAW5Is8mwm4BYMUDXa8RJRJvDNCf4zhjotoGo=;
        b=aJCZEoUx7FEs8vRoIyqHA6XWBOmw0YCHYzG7PUluU+RvfFvCaDaReaAS0mguYuOjsk
         bidWw2lP/SQS9MigzePwCud4UbktxLGbeDCw+eX4zm/698CIOy9bPvVNg/cG6Ye+9Vhy
         /+AhA7m0s9vemrSi1ebvo6BtSFaEhq9enbFo5i/D5zYIr1+e2nlc/LKIxRLDL8WAflFp
         g4+2jGTkxEHNJjtnJvAz7Wuugl1HWlds+JGM6PiCQXB+25A7X6PZdov2MmxT3fu3ybgY
         tD6bjJL4X1hZ1Nw87h6UGmEgB/rVq4262HHpTqOyIUqGuixbXcYwNcmIOSdVgVGuG5Cm
         CzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734020343; x=1734625143;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=68JInAhAW5Is8mwm4BYMUDXa8RJRJvDNCf4zhjotoGo=;
        b=OPnQFby63szTaZGTvqlY8lasWrcEk5jK5bntNQSf/VYpWIsujm/vqUtlUp1hdtqNyj
         Wvqmm06PnVnLcToaAzpwcN0NU5i5XwbcJb8PLdskDUKXAiYpuV427YFO284/udvLYMYP
         Q428Ya1RZUmhZvtncFR8J1kLcCE2n19I3EcpG9kQUd4yI6zzMtZ5/hi6ybJFx8xEB23z
         TQZpOtVQPJ2iDto9NDfqit6ik+voWlg3AUg6EycaBFj9xE5VxOPsjL3TfTgvv/x24fsX
         CrFdCGJVSHOqaZubwSrIpHC7RQng4RWKMi2j+iI+mjLlTmB5Un0I6sbZ57yyvd1Xgbjb
         Z/Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVGK+PmbsZOOeE2pDO8iIedBponqat7T83MuCmeiDEN2j9Ze/1ee+Lbmy2B9ccZNHlRbrrwpE8lo0/Ud2z+5POM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+MeFDhIdUCIe8wF/mb/imUQhP9QoIylcGaLte3BChtV1iox0L
	PLEiPLJgyqBDGKL/h3kndHsreM8GaAZieOxCOpfaDc9aG/reMCxcGuaTKQrmjsM=
X-Gm-Gg: ASbGncu4E3T7ggIBNFl2q0vR36QtOz6KYxc4turEG7YwmA9u2t1rAhiOC4XWjTZkcpE
	hH6KHnjkc8o6RgJqzaktIFrzpSlPSs6Yya/z1hK+lgoJflncpOyyuncvOZB0ZWJcp3GYJRU43B3
	orpm4G4fJc+lcqdalmh/aPoqcjKjJBll16EhMJdEBT8mlwhXndifdEUNN3JY/v9r2wxuaCOF6yE
	O9C03DU9Izyj/ASO4UKaho7/v76KsOerf45IKvHpH4WmTJy
X-Google-Smtp-Source: AGHT+IHBf/CkYwwV5YCDCoDlBGs3t7DJrHBFw8STBH4yNhFZK8NKI7+uk6ZO9cjpKuabgBSSS8Q7eQ==
X-Received: by 2002:a05:600c:3acf:b0:434:a802:e99a with SMTP id 5b1f17b1804b1-4361c346253mr66269165e9.4.1734020343031;
        Thu, 12 Dec 2024 08:19:03 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4361e322328sm44336105e9.0.2024.12.12.08.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:19:02 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 0/7] drm/vc4: Fixup DT and DT binding issues from recent
 patchset
Date: Thu, 12 Dec 2024 16:18:50 +0000
Message-Id: <20241212-dt-bcm2712-fixes-v2-0-35986e04d0f4@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOoMW2cC/2WNzQqDMBCEX0X23C3JImp76nsUD2vc1Bz8YSOhI
 r57U3vsZeCbYWZ2iKJBItyLHVRSiGGeMtClADfw9BIMfWYgQ6W11GC/YudGqi2hD2+JyL4z0rD
 hsq4g1xaVM8itZ5t5CHGddTsfkv26v7Es/2PJokHPrqqdI39r+KEcl05UtyVc3TxCexzHBw0Ef
 TW2AAAA
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
X-CRM114-CacheID: sfid-20241212_081904_904848_ED064890 
X-CRM114-Status: GOOD (  17.20  )
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
Thanks to Stefan and Krzysztof for their reviews.
Hopefully I've addressed all points raised in the correct manner.

Changes in v2:
- Commits have now be merged from drm-misc-next to linux-next, so all
  commit hashes are valid on linux-next.
- 1/7 Removed references to "previous commit". Fixed up indentation.
  Added maxItems
- 2/7 Defined widest constraints
- 3/7 Added maxItems and removed reference to Linux
- 4/7 Described the errors. Split into two for fix of node name vs addr
  being wrong.
- Added new patch removing "required" for interrupt-controller and
  interrupt-cells for bcm2836-l1-intc
- 5/7 (now 7/7) Removed the intc node for 2712 - it's irrelevant on 64bit systems
- 6/7 dropped as updating the binding is the correct answer
- 7/7 dropped. simple-bus claims ranges is required, but adding it
  creates other errors. I'm unclear as to the right solution.

- Link to v1: https://lore.kernel.org/r/20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com

---
Dave Stevenson (7):
      dt-bindings: display: bcm2711-hdmi: Add interrupt details for BCM2712
      dt-bindings: display: Fix BCM2835 HVS bindings for BCM2712
      dt-bindings: gpio: brcmstb: permit gpio-line-names property
      dt-bindings: interrupt-controller: brcm,bcm2836-l1-intc: Drop interrupt-controller requirement
      arm64: dts: broadcom: Rename bcm2712 interrupt controllers
      arm64: dts: broadcom: Correct hdmi device node names
      arm64: dts: broadcom: Remove intc controller on BCM2712.

 .../bindings/display/brcm,bcm2711-hdmi.yaml        | 107 ++++++++++++++++++---
 .../bindings/display/brcm,bcm2835-hvs.yaml         |  83 +++++++++++++---
 .../bindings/gpio/brcm,brcmstb-gpio.yaml           |   4 +
 .../interrupt-controller/brcm,bcm2836-l1-intc.yaml |   2 -
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |  13 +--
 5 files changed, 170 insertions(+), 39 deletions(-)
---
base-commit: 3a6b7ba51f16c093420959ab2bd3476d180547fa
change-id: 20241128-dt-bcm2712-fixes-afb0e8a0a476

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


