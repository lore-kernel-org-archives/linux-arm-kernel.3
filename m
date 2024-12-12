Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0563DE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Fv3fbXAGrIYdfjN2UmggTGBbw/plczA+5BniWAkzYYI=; b=T9mVOkSCxZDX5p
	ahBsxHZ/Bxu+kgbh8/9vV5DjaguFU/f9zG5nAB81zgb8Fdl8BBIfSSMbHbK1zBtwq55qUiKkcrSOo
	iTIe5VaaOsZYQHyYem1jGSI9EIr6UOQAxVgjUfbS7SmURk52ITjhq20yq3RBKwG2Vxl0f/ooZ7x4v
	tlZ8wystXVTrcNI0lN8Xn1B8Fqo63Qq5YUht7qlI8Bkr4Y7u6DB8sHzq8LfPTuQbpbojXFE/VcVUB
	d1KEAOJ1GOgm+CTRnwFIRmkzCXzqV2VvMJiZuHN120dhAW7eWOUbs1kpNsmE8tN7HM0hhz6/o8WKT
	wMXpWBOEM3bjVCEcf0lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLoq9-00000001dbW-44we;
	Thu, 12 Dec 2024 19:27:14 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLo3G-00000001Rvx-0MBs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:36:43 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4361d5dcf5bso10070645e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734028600; x=1734633400; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fv3fbXAGrIYdfjN2UmggTGBbw/plczA+5BniWAkzYYI=;
        b=YjC3v+7/mdy32kzaFisMgMeyTPd0gfGdVmDrTdJnmBEjFZuk8mBRipBloAlknwthFS
         D4R8TCh+a/7Yjs1RYYplmx1Dgmtuh1jdHttQXckPXZEiW1p1xnldn9MgwnETOd5cFIia
         aqM3XTyto2z1EQq0M4CXdCmZGN0QrK3kJYD3MzgEemimDm6kyEd31MlmaHUVpBMJTD+3
         oWKz0c/S0xPbNT6TFvMVWI+CY2Wk3mSwJjNQl1JYbLTJaJPuEmGCT1Ps2bQit6ehHy2P
         8pd3rzc8vBW6BvSTsjHPY+2t8xRtFnoRsmiF3B/s/F+6KuNjYPGJgt5LBOEb1zecL0rX
         HtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734028600; x=1734633400;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fv3fbXAGrIYdfjN2UmggTGBbw/plczA+5BniWAkzYYI=;
        b=EiARxoQohGvpGwJJUe64VZ7p5tsff9unumzB/rUr2Kivuk7LcKd6KkSHth3FwxZ+uq
         WXNEOVzH5apkmLELDGSZwFndHP2DO1ZnJGCGx/cz3AZgXsVCVa2YMM1+aDw/+YNIEOS0
         wwCkiH82sfaMD5GZXHCiiV3Q356KWWMj6knU4XlvMgGmC0/25JOoWu7P0EC08JcO1yIX
         oNqZADeiwBiYZg45dLRDhH2Btsmo5KP83qKR08I/iR017vQbwOmi8Cyu0nhAjNOV4gF7
         SovtNoVitEtiaylZAN6nn1/djwaZkGves8CyPdPHCqazfx5vjI7JAhBU0yjC4Mm7KkJl
         D8NA==
X-Forwarded-Encrypted: i=1; AJvYcCWs20CMmzl9Bnm4ZK1sbp4gXqSbHJ+bYyKu+3eGnzcV1MudEb+NAH4dXGAp2YhHisZRaQ+0RJ2qCUZ/HGo6zhGW@lists.infradead.org
X-Gm-Message-State: AOJu0YzxTqvEJ8SvuK3YMsuzmqsPxeXK+Aedm+UHoPhB61eEGvS+Gzht
	7GPjOSs0syvNuLJ/UXq958s+A86lTRVucxA8FEboPSrn3rHeZaxtJV/thJLRxAM=
X-Gm-Gg: ASbGncthicxzpJ8jLJOMm9RRfz7ScwVj8Kvzx7V4fXZ+Id30+OoT324wWxv6LF1X7k7
	fHAOLpwZRx2vCpRU9ZfJM6Z+8P3/GIrzuotx+5xiQc1bp9qHzotN/+nSY5B6qy8w25H2xRYm5Bf
	IiWbbTE0Uk7z8Cmfs5AkNYoZIIhqMxbrZz3D03RQ9W4OACtn2e0sosXbzuGTUo5rGABFhNYSyvY
	SC1DnrDiDUlPF63ffkSCf3ehPCw1eY0uWW7wElphKAoJSHo
X-Google-Smtp-Source: AGHT+IGhmyt8mpOnXb+dJ711Uf3mlUnOYDVx9MCQVeQjzLSO7tEtY0jrOPhc109rLLEz5hKiOUUacw==
X-Received: by 2002:a05:600c:4e49:b0:434:edcf:7474 with SMTP id 5b1f17b1804b1-43622883cd8mr39949565e9.33.1734028600168;
        Thu, 12 Dec 2024 10:36:40 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436257178e3sm24651995e9.41.2024.12.12.10.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 10:36:38 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 0/7] drm/vc4: Fixup DT and DT binding issues from recent
 patchset
Date: Thu, 12 Dec 2024 18:36:27 +0000
Message-Id: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACstW2cC/23NPQ6DMAwF4KugzHWVmBQCU+9RdQjBKRn4UYKiI
 sTdG+hSiS6Wnq33eWWBvKPA6mxlnqILbhxSyC8ZM50eXgSuTZkhRykEKmhnaEyPpUCw7k0BtG0
 4Kc21LAuWapOn45Baj2fKnQvz6JfjQxT79oulccaiAA5Wm6I0Bm2l9N3rMDXk/TK5qxl7tpMRf
 xjxj8HE5LdKFcRly608M9u2fQDf01M7/QAAAA==
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
X-CRM114-CacheID: sfid-20241212_103642_303036_B6442136 
X-CRM114-Status: GOOD (  17.96  )
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


