Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5845AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 14:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZDXweG3kfjLb98/KJdEpbSiDTI7ao8N9Ii+NpOdwthU=; b=v7fmCROv2LR5hH
	DDa0ycou4yuxQ4m4vunUSLQjBKhgpL6iDcbA6aLCWRH0sjJWJHpGWJLBFoVJUkqjxCUWfam84QbWW
	RAlR6+xXpFVAXEsVgeZEylS+Cb37AGVzSf9qebwKZOPFc8d2JM5KQM2wzs+U77YMmejpNeVlsgE3J
	5WgsIODX04wBTUjhEVezo+64pZxHb3KHNuj8s4nddeFfsPi3q/T7RpFICc0nZVd/7Wr31ffNbhWuC
	c51EdBdqoA/YGt7xNeEu6lmumAhoCxUFaIdwaAsqUIct99aago7q9YQni4zxqE6i5YvtYx5OkmsJd
	58smgpsTAZD1SstnYF6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvN6-0000000GuUT-3ebz;
	Wed, 18 Dec 2024 14:49:56 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvLz-0000000GuBQ-3eqt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 14:48:49 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so20285675e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 06:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734533326; x=1735138126; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDXweG3kfjLb98/KJdEpbSiDTI7ao8N9Ii+NpOdwthU=;
        b=PO0MoHiSsLO3AoI4eTL2sPeBfT/yP3ItiEGaeB4bOQ3oUi6nAkYj/R3cVYjJGn4aII
         O++NDbxxnb/cMoMQqlnsuSo6UxXN5k+7g5GIcwzixjvPqcqvs+AB97as1ZNaSmI57R7C
         10/1mmtIoTWAjt/BVQTPI4GVCkIbwAHhicRVxGPOVkosigM0SsGIm2Fnl7RsEwip57/9
         glgw6LdFqmuThNAjA37WuuWw7I1wTSF9jH7+Y6xIZX5+v8GBRBtFFB0WfMTjiHjzY+i7
         q4l3t4rtdWBVeePfV1s6i3Umpik5Zqf34TZ+7X0iTzdbwit/SxrR0gs0dUlVV+KanYny
         HaqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734533326; x=1735138126;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZDXweG3kfjLb98/KJdEpbSiDTI7ao8N9Ii+NpOdwthU=;
        b=XTdmNG4QqUSPyLTnkbyTbqGf6NRX90s+0w/i7SO0sj5EDOvtGC11HmeDDDCro4zRz6
         e4ZFMfa219NG/sqOuIQtb/ubI5MUSKjlxW8/wnfMrjG0l8cqvzWkB9RHgCNqjhs/TAEg
         1PK2ug4AAVJjXCk0EC1VTEf7vYyp3wlxC2JiYcelR3p3+kMNTp1PWMAJJD8eyCYwaFEa
         BFUM47Yxpe0n4yNMDzEmB55axA/9Fx+Z5CV2j/wvoJvmqNLXaQCFC8hGFZMDWl++4M3S
         OvkXSwCnNRFYo0b6GGq3o01EJvdO0fj0FxdLyvxhJ7Vlhrd6RTVlyNPOQ2W0WzGX6tB+
         OxvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2YCh4bdV6DOU9zBwcUvIj5Wz63I8ghQZeD2KC931HLkMfDGawmW2j8BGMNtNxb6MIpN6fv+bwMiIWGHSX2/A8@lists.infradead.org
X-Gm-Message-State: AOJu0YysxsnuYuhFJmJveGQcyvGE9N0wlPJh9M970LGi64GRUHj1/L61
	B39ibEUdEgygj+V37cdMcuRL9NBKz8udZuIxl6IVL3BwDjSqR1WtS2jOz3BKsxU=
X-Gm-Gg: ASbGncvpovVcLX8vKpCQ4wgUhZNJjG6BoUvgTSdWy109xOS27nE5oTkkFyhqxuhdVkH
	WnQ8nLOWS+Ia9PYZl5zeGfGFH43FniwcvSZVXtzxPj/qbEzloC1OLuHkMrM8vH5Zqy3r/WcQ1aF
	4+gTei+BnKHMVFSqBbb2g0GJpo5nUP8aoOspk+jqVs5I8jwOntzz9uS5rmlxwKadVuDQ1oxiJDw
	AboVQSI8hGNjw4cEYxn/l41rhKaSdMwWjCE9H1c+40zctne
X-Google-Smtp-Source: AGHT+IFfdDvNqrmdKCha+Q3H8l6Dk2KAYhMhcpN6o1VocErcndhaGCI/5Ui3FTDsVOBZ1XMcpPOdcQ==
X-Received: by 2002:a05:600c:1c1c:b0:434:edcf:7461 with SMTP id 5b1f17b1804b1-4365540c077mr31551435e9.30.1734533325609;
        Wed, 18 Dec 2024 06:48:45 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-388c80613a9sm14165163f8f.101.2024.12.18.06.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 06:48:45 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v4 0/3] drm/vc4: Fixup DT and DT binding issues from recent
 patchset
Date: Wed, 18 Dec 2024 14:48:31 +0000
Message-Id: <20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMDgYmcC/4XNTQqDMBAF4KtI1k3JX03sqvcoXcQ4qVlYJZFQE
 e/e0W4KCt0MvBneNzNJEAMkci1mEiGHFPoXBnUqiGvt6wk0NJiJYEJxLgxtRlq7TmguqA9vSNT
 6moGxzCpdEqwNEbYDtu4PzG1IYx+n7UPm6/aL4dhjmVNGvXWldk74ythbtGmoIcZpCGfXd2Qls
 /hh+BEjkJGXypTAVMO8OmbkP0Yio5TVXsqKScn3zLIsH/vnawREAQAA
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
X-CRM114-CacheID: sfid-20241218_064847_903197_BE4F53E5 
X-CRM114-Status: GOOD (  19.30  )
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
      dt-bindings: display: Fix BCM2835 HVS bindings for BCM2712
      dt-bindings: interrupt-controller: brcm,bcm2836-l1-intc: Drop interrupt-controller requirement

 .../bindings/display/brcm,bcm2711-hdmi.yaml        | 81 +++++++++++++++++----
 .../bindings/display/brcm,bcm2835-hvs.yaml         | 84 ++++++++++++++++++----
 .../interrupt-controller/brcm,bcm2836-l1-intc.yaml |  2 -
 3 files changed, 137 insertions(+), 30 deletions(-)
---
base-commit: 29978a81e62128d2cee56f066ec92de584f4ab5f
change-id: 20241128-dt-bcm2712-fixes-afb0e8a0a476

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


