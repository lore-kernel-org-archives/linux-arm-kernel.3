Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDDBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 18:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K6BQVShD3NoC5b7ILwEQ6K46fu5E4ShUBfYTzpiyij8=; b=R2MSHTjrUMLI03
	CgeeE46tpObqJGissfoSQVtSJSYaFgAiwIyleZ6eda3mYfvlzvK7u/vg6OSS0ZIznCxjyQGzRP2T8
	vQpugNsXlf+imh5nbFpTp3fQ9XSu0JcaQ94fe8My6bVyPpLz9VwRo3ga/UXtdvBbCVkboRfY7ESGB
	H+hXoGyK0z9XeBFmm1agnLGLpRf3rzghXnDbyzX4Lj4CmKorKHFxJ7qC0oS13GyZDaAeaNOCbc7zE
	uUhsTjxOijS5Qwxxba+pkjQ+T6ChYOicmsRjsSFBhiiX49MFPatRt/Hogi1imUm5euZROz2dwtCVE
	K+xU5NuAtOOAewvY3xVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhUL-00000005lXh-01GK;
	Fri, 20 Dec 2024 18:12:37 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhTA-00000005lJm-0UA0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 18:11:25 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3862d161947so1149574f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 10:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734718282; x=1735323082; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K6BQVShD3NoC5b7ILwEQ6K46fu5E4ShUBfYTzpiyij8=;
        b=JXrydK/ePm66yN4BFozx//P8h0ygu8nNeX1vCOQ9yU0EWWCQwSyb6h4E8LhzlURoe7
         vbBOEmpgiUxZp9AJPgeZA2s6g2C85nNsbWSLwuxEuJmfkLZ3swD1BPxIAp3SX8TCmTUk
         QXO1yrC+LK3Tgj/TlCBNOxKselbX6Sp6I7Ahk4SMBfe34Vf2fmxxrHj499BkNoKY6Kzl
         qAXu8FqiCWEvx9JOiF3isfNCbkLes0X4FPaPoWTPPIQQSDfRje+SS8k8tbAN0vRLAY0x
         5Z22AYyrzRR7mJvrhan7wo4HaTm7aDnvfYuXinKEAh3JNpeTjaYSmEJcnqDqVfVpS9WR
         0jXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734718282; x=1735323082;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K6BQVShD3NoC5b7ILwEQ6K46fu5E4ShUBfYTzpiyij8=;
        b=ov7jCQW8FMzwY0wYJzTYyJPDtvJuHuItpvrtmLjkevvR5yRRt6+/F3Q50CFzYN+Gdi
         FtWh77U0poaCXy4UQQAtyJqDMwr2oqLw33yK4a+kY6u+4hDXw/X2uuc0tZd2q8tjiR5w
         A8cfr1tCeNRkAI2qcs8+FGN0+ojaxBj7s2Mvp4hYj2zsuLh4JyvWp7xR51vmWeiLR+dA
         PxNCz/uFMkFAp/5SqaJcQoh2FKk40rNWbqI3jxRVEjj5o09Lxm4x/oWatm5bzzIo99Tq
         enODSGdqbndTHbIKh3zlW1y99qzyzJ3CzrOv5KgiyRsBMNiUf//0Rh73ejX/wt+OVZPk
         UBnA==
X-Forwarded-Encrypted: i=1; AJvYcCXsf8WXBMVyW48Jg2iqaP9VCXIwyTmixnaYlGGsqnpQpCe0tZE47CAIKTlavnQ5gNlJ5OBmo/i36B1oiE6R2wYb@lists.infradead.org
X-Gm-Message-State: AOJu0YxilOpxfPNLTLfwWUr1y7KdSCbLA09H7duEDwD4fyB2AeoosyAR
	67zAzPODq4MzuYd13XB1VpO0sPTmxnvWrM3CtgYPLj+kWxqM5x3xEF2W0xHZc30=
X-Gm-Gg: ASbGncutxxu05Y+7kJYoKpMOKT6+/KH3SU9R4rwLv8bkrX2+IVbGinAHK4rUzh5+OrB
	0ZnnAKjBznqFOXz3f4FoTIj792kMFE/KharkkQDcfQsWmehZ8enWPySgxitVDN6oS6D0lcxZ5CQ
	p4HSQiCGV460AP0puKaJ8I4cXYbTzJ5y/aQXZ/c4SH8EHqxUK6CQ4LVEBFXc129jT+EvjdRH4/e
	PBU4aX8SGYXONxQWZdby09ob0veJUmuL5sn9iPz8stEHVYi
X-Google-Smtp-Source: AGHT+IGbM/Tx3G6ve1QyNsrVLV/jOarA/uAXeuaovxRW6LqTq8ldWR2fwVR13hiCBtPxlntlYTq/qw==
X-Received: by 2002:a05:6000:4023:b0:385:f220:f788 with SMTP id ffacd0b85a97d-38a223fd77bmr3911254f8f.48.1734718282035;
        Fri, 20 Dec 2024 10:11:22 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4366127c488sm51460075e9.27.2024.12.20.10.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 10:11:20 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v5 0/3] drm/vc4: Fixup DT and DT binding issues from recent
 patchset
Date: Fri, 20 Dec 2024 18:11:10 +0000
Message-Id: <20241220-dt-bcm2712-fixes-v5-0-cbbf13d2e97a@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD+zZWcC/4XQQavCMAwH8K8iPVtp02zrPL3vIR66LNUedKOV8
 kT23V/0XQQHXgL/hPwCeajCOXFR+81DZa6ppOkqodluFJ3D9cQ6jZIVGEBrwevxpge6QGdBx/T
 LRYc4GPbBBOxaJWtz5tdAtg5HyedUblO+vy5U++z+Y1I+sWq10TFQ2xFB7H34yaHMA+d8n9OOp
 ot6khXeGLvGgDCu6X3LBkcTcZ1x3xgnDGLoonO9cc6uM/jOrHyoojANEnk/tATQfzLLsvwBjLr
 YbosBAAA=
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
 linux-gpio@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_101124_148278_419F7B33 
X-CRM114-Status: GOOD (  19.45  )
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
Changes in v5:
- Removed all changes to HDMI bindings for earlier hardware revisions.
- Updated commit text to make it explicit that clock and interrupt names
  are required by the driver for 2712.
- Added clock-names and interrupt-names: false for 2711 and 2835 (the
  existing variants).
- Updated commit text to state clock and interrupt names are required
  by the driver for 2712.
- Link to v4: https://lore.kernel.org/r/20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com

Changes in v4:
- 1/7 Removed the duplication
- 2/7 Added "minItems: 2" and added to the commit text that the clock
  and interrupt names are required for bcm2712
- 3/7 Already applied by Bartosz, and 5-7/7 applied by Florian
- 4/7 added Krzysztof Acked-by
- Link to v3: https://lore.kernel.org/r/20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com

Thanks Krzysztof for your comments. Terms such as "widest constraints"
may be obvious to those regularly doing dtschemas, but not to me who
does them once in a blue-moon.

Changes in v3:
- Fixed up indentation on 1/7. (I fixed it once, but obviously reworked
  things and lost it).
- Link to v2: https://lore.kernel.org/r/20241212-dt-bcm2712-fixes-v2-0-35986e04d0f4@raspberrypi.com

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
Dave Stevenson (3):
      dt-bindings: display: bcm2711-hdmi: Add interrupt details for BCM2712
      dt-bindings: display: Fix brcm,bcm2835-hvs bindings for BCM2712
      dt-bindings: interrupt-controller: brcm,bcm2836-l1-intc: Drop interrupt-controller requirement

 .../bindings/display/brcm,bcm2711-hdmi.yaml        | 76 +++++++++++++++----
 .../bindings/display/brcm,bcm2835-hvs.yaml         | 88 ++++++++++++++++++----
 .../interrupt-controller/brcm,bcm2836-l1-intc.yaml |  2 -
 3 files changed, 136 insertions(+), 30 deletions(-)
---
base-commit: 29978a81e62128d2cee56f066ec92de584f4ab5f
change-id: 20241128-dt-bcm2712-fixes-afb0e8a0a476

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


