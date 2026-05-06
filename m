Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E7CCD3439
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 19:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jVr4I6OhLAaxawRod3py4pnB+8B+XGHPtuWfZP5G64E=; b=HFSs1k+QeqyDFN
	4MPg5zmBnCud5ifEnTIuHJVQ2sA5Fn5Wupm6H2njnAiPMiYhegX4LcxrxrueHT8uvR19M4H5n17v7
	gKgE7N71road10hU/8jBl6FPuRYLY9Dl3ehzGzrS0xDoVcY8N2knp1ImDkq0N2mioiwXmzE8sCOD7
	LQR5+9lNsF+xoEQH3KatGpaXAKukfv8t3W3OzoBYJJiwXg+T0BNUn5s31tYdQeDjZA6Wfkjtnaoim
	kix7vEvxlquzzNa7c+pnu7DfsteNALCoj5KSNfzEbp39JYVcShOkvBLXXQblxrYq8v6SQWYIg87NJ
	M2Q7yJc8jnOj9/zaNb7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKi0J-00000001swS-20gu;
	Wed, 06 May 2026 19:33:55 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKi0H-00000001svL-3BsK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 19:33:53 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso646665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 12:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778096031; x=1778700831; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jVr4I6OhLAaxawRod3py4pnB+8B+XGHPtuWfZP5G64E=;
        b=s7FxVOoc2oxHNFjE6lMvaj/P5+/sxP60VEkjCHEOW1f8K4/+NSVi1WSzPoOReylABi
         ih8/Iw8BRRssKwI5apE195HtEOgGcSvX1CgO753/CArhrYU8VhMmxabEk8kKJupVm7TM
         WZ3fM350PvfxccP0U1vCaEEgvlHK3mlrjKfZd78O1Xt6VQzk58HQCWY+q87ESsQ80Crx
         NwXnASHNByn9g/erffqFCbc3aCGr8EvGeuiOTIqig6Zxb+6cpbS3BfciwxHmIIpN8D6K
         PhkNueqsJUOkVebylRuUi6kuh8wudjcoW5SvKlxVXkVljgRWrqgDy0Yp+G6xRy9mBTvh
         D9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778096031; x=1778700831;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVr4I6OhLAaxawRod3py4pnB+8B+XGHPtuWfZP5G64E=;
        b=YXPor0xkkNyCryD2OVpoaJ4WxSfC8YdeLsU54Uz22Q41lLbqkK/b4ut7+gbdTfyl/Z
         1K/FHdVbHUAmbgJvA7xQWc3R3fxvhw39vneuiehL4J9ntt7NXJy6lv+6t1yEVF9X7sb2
         q2B43JXOJOQ0PeiTWFymS/VFUyY3sxZv3KIaz39150WN4CatDN2TLyakiVzhk0bMd/qe
         c9/prGwsPSVHqLXrxgjdS9TyeoGmCCw0eH8sf9SCzLA4TUCG3n0GrWkabn0ewOz5BjIN
         EEf8BQF3+DIP5yBC+WvR67/au4VSRqEDxaN5W/RAFZn9O+QbvhuIVnElhtRPeWQBBmB3
         u0uw==
X-Forwarded-Encrypted: i=1; AFNElJ/wjRY3AcU+0uf4lN3rByIcXiRqZjeG7tnam/3oY8+DDEkDNCRtU4B9jD2BZl+uxrgqpUEL19BNG6PpwxeOacjB@lists.infradead.org
X-Gm-Message-State: AOJu0YwpiZJQqSHQoojvkPPVuCkTbPrauk3d7SC4iwhPL6uloPhC2fX7
	nKUxOdFMoQbZwHPwiQnnDc4yF/FR3H95XtR9PKVcbneWnxtObzPpyShm
X-Gm-Gg: AeBDieurSnJ8o9N9k9WlXqUeY8ylyEMpqYZ3D03Plt4rJ0T2YOlh7I5kqTP6NtRVI8K
	jtOtopbU+94GJ3cv+ia7Y4rIpyyTJdErYekTasovjx5nNDYBeQdPuCsZXYyC5hkZyfSHGThYRhU
	OfLp8pZjN0NPgf0shCof65CWizLUGXa01PQXDf3u/LVQRGVXPCgLyv/fkQ99qDhGhit6EVZJ4hl
	KTjpq8u57iuzyDXfaGl6LY59jLZAKFzF4t6EfDH9/KXnNPUaafT1GXQb7woslkrpvRVCy7NM7Xc
	WZVHx2KljV7JIw5k0zRIedld3Yfxszk1KuWaSCn/zfarScSiEs5iF34TIQQ4wxkTnBmZdNyEmCS
	5SSysmt/TbuVk0ni5ZTCvWqfs4XqHD0Ga5t2BMbYwp1MBoumHwuU7dJ7zo31hRu/5NGQoFGlT5F
	WgAnOlDO4VrTubOlhgVzMQBxcOWAEHhqxr9zNDciTUDGeKT9nf0aapIg==
X-Received: by 2002:a05:6000:2082:b0:441:1c18:f779 with SMTP id ffacd0b85a97d-4515da967c3mr7862014f8f.37.1778096030578;
        Wed, 06 May 2026 12:33:50 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960022sm14895673f8f.26.2026.05.06.12.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 12:33:50 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH v8 0/6] Add support for ZTE zx297520v3
Date: Wed, 06 May 2026 22:33:17 +0300
Message-Id: <20260506-send-v8-0-f1bdf3243b34@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAH6X+2kC/13N3wqDIBTH8VcZXs9xMjXd1d5j7MI/pxJWjRyyE
 b37LBpEl7+Dn68TiTgGjOR6msiIKcQw9Hmo84m41vQN0uDzJgyYBF5IGrH3VDhQCFqgcJrkp68
 R6/BZM/dH3m2I72H8rtXEl+shkDgFioX2wKzmHN2t6Ux4XtzQkSWQxA6xYkMiI+MQSoWyFIU4I
 rlH/59kRp5rrE3FrAV9RNUe6Q1VGVleMgTwzFu1R/M8/wCHsxKANwEAAA==
X-Change-ID: 20260416-send-5c08e095e5c9
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5625;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=IumsBJY/68uD1DAyl0ojHH88Rxzv5otuXToNllxUdWQ=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp+5eNh+r2QhpsPjvjGcW3ZFofw8SmJJc0RnLO0
 8iTYeCI5UqJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCafuXjRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiL1FxAAkay5ZSjMustiVPUMIApO6OgwvH1NoWW
 QPvBPHmRP6vzAA6W999MCJCYzQ2URjWzh5h7X9N+Sx9Su8HLaT4KG8fW+nv6tIe2GcxLZU1nD41
 Hqx/OVDlngrjysPGGrvIxm0XVlyhuLDQ2/Ok/tp3lQKiIGw5g7jvkTEvBtW/0U01M7CiVPqoaIq
 SooldcoB9PK8N5qHCXR4IdwBXKNPjrr4cl94v2bvCpU8HVuKvqKdVdQxI4GN/23WvxfiENnRfan
 3LBqmmmsg/KahQ2cg1se3xbzgl+EoXuyWZz7tl3TliN0izyKIswFKWQM8JUPtWLXNollNwpQgCu
 xQUyxZG65npDsJNxptZwI7t/NGj9FzJ7t7Q6aAfMAFwQ7ecwmit2iGcDoy7TWVTwUhMYO1ekbwX
 jE6XRm1l/H+l7U/lvFvLhCY2SpN3PaH4WV6q94wwwicR2QXdW3RK0wa867YgWaU+G1oz451JLYb
 KzQlek6SgX7M8fmLyPw4KwzGLAhQANwcx1nthCjWcaAyKmWFIcMEYfSvkkJZ/IFSSP2VVRQPtx7
 N0dBBAtlg1wfvu6JHnvvqeokstmjapHhr53kdUnT97vejsmqB3lZODQCK71zYWyctJ987USHglV
 UUDbeTXf1uVR2/WTGsiKZB4Y1Pjp2Wq35Oh0GNpYYi/7JkI7aMjE=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_123353_845879_908CCB19 
X-CRM114-Status: GOOD (  27.27  )
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

Hi,

This is a follow-up on my RFC patches from January [0] for ZTE's 
zx297520v3 chipset. This chipset is popular in cheap LTE-to-wifi routers
sold in developing countries. My goal is to run OpenWRT on them. I made 
more progress in more work on this SoC and it is time to get serious 
about code review and upstreaming.

Since my version in January I managed to get more hardware running: SPI, 
I2C, PMIC with real time clock and voltage regulators, Watchdog. LTE is 
not working yet, but I am able to start the coprocessor that handles it 
and talk to it via mailbox + shared memory. Wifi is working on a few 
more devices. Since WiFi, USB and Ethernet are working, the devices can 
have actual use with OpenWRT even without LTE.

Another hacker created a free software program to talk to the USB loader 
[1] and boot U-Boot and Linux without modifying the on disk files. At 
the moment it needs a proprietary blob, so my documentation is 
emphasising booting with the on-device U-Boot.

This patchset here is mostly unmodified from the version I sent in 
January. It is the bare minimum to get an interactive shell working on 
the UART. Future patches can be found on my git repository [2] for those 
curious to peek ahead. The first 30 patches are in reasonable shape, but 
the further you go the more cleanup is necessary. I expect all of the 
patches go require a few rounds of feedback though.

My plan for upstreaming is largly this:

1) This bare minimum boot patchset
2) Add clock and pinctrl drivers
3) Add standard hardware to the device tree
4) Add zx29 specific drivers one by one: Watchdog, spi, i2c, DMA, PMIC, 
battery
5) SDIO backend for rtl8xxxu
6) rproc, mailbox and rpmsg

I am willing to maintain support for the SoC within reason. My patches 
add myself as maintainer. This is a hobby project for me though, keep 
that in mind if you want to ship a commercial product with these SoCs 
and upstreaming Linux.

Cheers,
Stefan

0: https://lists.infradead.org/pipermail/linux-arm-kernel/2026-January/1099306.html
1: https://github.com/zx297520v3-mainline/zx297520v3-loader
2: https://gitlab.com/stefandoesinger/zx297520-kernel/

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
Changes in v8: A number of Sashiko suggestions:
Add new documentation files to the documentation index
Add new documentation directory to MAINTAINERS
Remove a redundant "if ARCH_ZTE"
Set ARM_PSCI_FW because ARM_GIC_V3 needs it
Use the correct UART01x_FR_BUSY flag in lldebug asm
Remove an accidentally duplicated label from the DTSI file, properly use 
"arm,pl011", "arm,primecell" for all UARTs
Remove BINFMT_FLAT from defconfig. I have no idea how that got enabled.

Point to a sane (but not yet upstream) U-Boot that sets up the GIC 
correctly for this board. Improve the provided example GIC setup code to 
detect this for reusing one binary for both boot chains.

Changes in v7:
Fix line order in mach-zte/Kconfig
Use "zx297520v3 SoC" as the option name for CONFIG_SOC_ZX297520V3

Changes in v6:
Squashed DT commits into one
Removed for-now unused board DT bindings
Add "zte" to DT patch subject
Regenerate the defconfig with make savedefconfig
- Link to v5: https://lore.kernel.org/r/20260421-send-v5-0-ace038e63515@gmail.com

v5:
Spelling fixes
Renamed dlink-dwr-932m.dts to zx297520v3-dlink-dwr932m.dts
DT binding indentation fixes
Use a manufacturer 0x8b for the UART, fix patch prefix
Declare all UARTs, remove uart aliases for now
Consistent license declarations. I made every new file except the DT 
binding GPL-2.0-only but I don't particularly mind GPL-2.0-or-later 
either.
- Link to v4: https://lore.kernel.org/r/20260416-send-v4-0-e19d02b944ec@gmail.com

v4: rename zx29.yaml to zte.yaml and add board enums
v3: Remove [RFC] tag, add defconfig
v2: checkpatch.pl fixes

---
Stefan Dösinger (6):
      dt-bindings: arm: zte: Add D-Link DWR932M board based on zx297520v3 SoC
      ARM: zte: Add zx297520v3 platform support
      ARM: zte: Add support for zx29 low level debug
      amba/serial: amba-pl011: Bring back zx29 UART support
      ARM: dts: zte: Add D-Link DWR-932M support
      ARM: zte: defconfig: Add a zx29 defconfig file

 Documentation/arch/arm/index.rst                   |   2 +
 Documentation/arch/arm/zte/index.rst               |  10 ++
 Documentation/arch/arm/zte/zx297520v3.rst          | 167 +++++++++++++++++++++
 Documentation/devicetree/bindings/arm/zte.yaml     |  26 ++++
 MAINTAINERS                                        |   8 +
 arch/arm/Kconfig                                   |   2 +
 arch/arm/Kconfig.debug                             |  12 ++
 arch/arm/Makefile                                  |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/zte/Makefile                     |   3 +
 arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts |  22 +++
 arch/arm/boot/dts/zte/zx297520v3.dtsi              | 103 +++++++++++++
 arch/arm/configs/zx29_defconfig                    |  53 +++++++
 arch/arm/include/debug/pl01x.S                     |   9 ++
 arch/arm/mach-zte/Kconfig                          |  29 ++++
 arch/arm/mach-zte/Makefile                         |   2 +
 arch/arm/mach-zte/zx297520v3.c                     |  16 ++
 drivers/tty/serial/amba-pl011.c                    |  42 ++++++
 18 files changed, 508 insertions(+)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260416-send-5c08e095e5c9

Best regards,
-- 
Stefan Dösinger <stefandoesinger@gmail.com>


