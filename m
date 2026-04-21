Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58217F94CAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 20:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nVlIjHK8beTpkqGMwU9MBSNVUOjmph10Qmo15WK1r6o=; b=ep9QZTxAUJUxy6
	fb2vIcWRDqFiO8tx5m5YlmIbboQOipuY4nFvJtQm/IujvNp//s91z1yxq0CCO5LZtlLe9KAnGxM4s
	U6jMZODUAgM8gk1Jl+O8uXMH51V9jryCu9p5WMjz3LEl4S9prQV1fMH2/pbGBcmIsv4dlJQUa6zNx
	zW20sMiUjqK2XxnwwBI5YLEPt7G5Mxa89rMI6O7A7pE5vkWS9IyoBX+/+QZ0asY5Xk2UxFg/mcI1u
	8JI0WIpFKn3/o1EKC98c1P60jGn3/XMnmflW7ob7HAX3cwCOA4msNp2PFIYSZRi7PNzbmwipwd5Li
	kNNhZIAXMKJzBc+bFJvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFHda-000000097kM-2PMA;
	Tue, 21 Apr 2026 20:24:02 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFHdX-000000097jv-3DXn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 20:24:01 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so11158695e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 13:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776803038; x=1777407838; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nVlIjHK8beTpkqGMwU9MBSNVUOjmph10Qmo15WK1r6o=;
        b=dwWuGP9hdcGGktgziY+zCW6Z5a6qMIDG2OgzwhThivMkBVbJXBJNIDf+EHWqrn7ULN
         zpYkisPs1zeJLhaVdyLizQTtKvLgT/NP1ZX6we/R3zhdocPynA2Xa3ph4kqTs2tHN2So
         xFbgrUnxOmmlXnNCh+mMcPBG9XbBeIegboaIi5r0ZG2Suta7jXlMAIxGaFvaCHpQIeL9
         8BvKieAR73yJ/oA8e3brVqLDivjb35s9uTHFMyxQ9/eWWyKQQjHlrWW4nkyB5YxkzkeI
         rEAL/FY6etTp9yD1+OtOMSeG1E6qGzUvilMaa4//JBC5Bs6+NjSbg5F5KE0uGJQD53aV
         uheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776803038; x=1777407838;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVlIjHK8beTpkqGMwU9MBSNVUOjmph10Qmo15WK1r6o=;
        b=oFHyCFVYWFgkzvifR7/ABQZhG7c0WVfWkleEohtSnGnSAUoVSk8JOrI4y54XB1jjej
         wFXw97X8AE7ndFoJ9/rCSUmEwzB5ELUK+F38zo/T5hesNQFIxL8gobWAvmGuioVl2KqV
         AwZBG8WE0liSu8Nq9U0VtArCpPGXakqy03osaeZd2LO5xt0Bg+7wkIWXf5IO0yY/g+oK
         RXq/6V1fXolWJcxkThg6WFgu61g7E154kVKG62zfAt28tTd5UkzNrNx5IU+y0XvCVs7g
         mKaKQgI3NbJ+LcyQ74uzHWTqXRfWiGja+QGs/q/9rF+q6Zq4MKc0Rpk8bnuNAf/++Q1g
         RReA==
X-Forwarded-Encrypted: i=1; AFNElJ+XgmocJGBywSMXfliSTVVc31YykwvdBcEW+J49ih2+0zuSsbwuCvV9pjC2o5a5GTPWOJ5W5ry6+WK/bwmMB/vG@lists.infradead.org
X-Gm-Message-State: AOJu0YwQlINv0809buwnjKyugwUBvJAjVrfvsv8q5ZsswJzXaEh911lP
	ypQVwZedf4DPICLKHMDrbjsems5kZ7hJR+e6YlwhuDpccRCscllQUiea
X-Gm-Gg: AeBDieuvJ0HdZkUNOtBQzN4BhYbqBX2w5eNtevlYRuhlwMdOiAHKAJRMWiWtI5Gg8t5
	GUph45SxxaL8wjTjZvrPPI3rqEuQUnhvq3WFnGy2j73m+667SQ3Ev57fmhmjd7IFp1LQI3ef9OS
	VxmQun8U8sLXRa3opbJyo3HPfb1zfT/yydZkok5SfMTTFEyjPItQQ8lfNIQ/kyg+aRa04F/dv+l
	PrHJ83cu85WTnhXjHn2DZZ7/t2A59zF6Dfr3WZde772iqB0Ow9yEpj5ApHl3pRXwF3OGYb5K0lq
	epffUhTYNUO/T0DigruHWt2NZwb7J3V6IgeOG7PAl2wXuhXG3u/Qk03XLWwWrzmpVS4IgpZZil3
	DraKY0D/QJ1OSUuspxpDqIn9xSO6uBtRb/h1+9niDeVszWRsMSViDX93FZY4aIqhCeZ5zLVlb6l
	LiAhlHb6U99h3mgVVZxH8mze+Emv2yZ6ZjLE4lN8b4iP0xYulON3FnfeQ=
X-Received: by 2002:a05:600c:8587:b0:488:a797:f0ac with SMTP id 5b1f17b1804b1-488fb7880bdmr194237985e9.28.1776803037405;
        Tue, 21 Apr 2026 13:23:57 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f82bbsm655989805e9.3.2026.04.21.13.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:23:55 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH v5 0/8] Add support for ZTE zx297520v3
Date: Tue, 21 Apr 2026 23:23:08 +0300
Message-Id: <20260421-send-v5-0-ace038e63515@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKzc52kC/13MQQrCMBCF4auUWRuZhqQYV95DuqjJ2A7YRDISl
 JK7G7t0+T8e3wZCmUng3G2QqbBwii3soQO/THEmxaE1aNQDmn5QQjEo6/FE6CxZ76Bdn5nu/N6
 Z69h6YXml/NnVYn7rH1CMQkW9C6hvzhjyl3md+HH0aYWx1voF2KRO85gAAAA=
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
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4666;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=o9gYTJKBqIyVOmX80U3TwTTah7IWirGi76Bxb25Nizs=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp59zX/bLsmFSSyvgUtedC0P3fDHA0k5szw2Ags
 j+PbWDI3vSJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaefc1xsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKs0w/+JNWC7OaWAdBhMhILzJxa5nrCYgMP1K1
 snJ5xSPPon5do+hhsRwQAXhiKQ201BcXztab9EPAdr3nhzlpIHgQkxljqXZ4sCMgq9rrrVm9G5b
 rgg+hfMV+8UMm0WvqAzWhj0028YC1Ir/Z+tc+l7vpzh3vDpfHPtMuCxxxsElifzwtV4qKLM/xmQ
 eJ8oOUvqwZvFUWPfwS/cCHxhHVISfToavxDtOeCUbyfUhgZALm7Wz+Y4HUFFOCzmiJVJP+StYLl
 ls/ujX2/jR719obDgBqIZ96APs0lA4sGYNcP26AL+YdfmAzfu53ihoBYIRWU1Do8n1CZCpqSefa
 mtWpLDOb4PA6lKSvBOmpySDmFflc1FN2qbNfCXJy/9k01EgFlCDTHyNfyg5FFJIiD18m5gWrkwb
 CFS3ro3m1C4bguclOqsghxLyJcNytfo6FYVtsQ0Bl4EaRwaSI19fgdvlYwqQB23tKrC7gaZLaEV
 msHoNP0miqQr+++XoKSg/v1/12Ul71kmjxTcIRoLmh3BePq6WJve/9LoKidWTj9JPPBtHYy6E13
 cwLv+D7pDEQEDFDQiI3aI/bEuhGKv8rZJXnewg+bW/aZ4BzVmFbkPYtX6ZiocsdzUHwiK8+zz95
 dn3D88vZU+j0Jld4xpGQ+fpXNjv/0DdsmodvoziwUgQ7zdl0v61I=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_132359_868687_B126DBC8 
X-CRM114-Status: GOOD (  24.30  )
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

Patch changelog:

v5:
Spelling fixes
Renamed dlink-dwr-932m.dts to zx297520v3-dlink-dwr932m.dts
DT binding indentation fixes
Use a manufacturer 0x8b for the UART, fix patch prefix
Declare all UARTs, remove uart aliases for now
Consistent license declarations. I made every new file except the DT 
binding GPL-2.0-only but I don't particularly mind GPL-2.0-or-later 
either.

v4: rename zx29.yaml to zte.yaml and add board enums
v3: Remove [RFC] tag, add defconfig
v2: checkpatch.pl fixes

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
Changes in v5:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v4: https://lore.kernel.org/r/20260416-send-v4-0-e19d02b944ec@gmail.com

---
Stefan Dösinger (8):
      ARM: zte: Add zx297520v3 platform support
      dt-bindings: arm: Add zx297520v3 board binding
      ARM: dts: Add D-Link DWR-932M support
      ARM: zte: Add support for zx29 low level debug
      ARM: dts: Add an armv7 timer for zx297520v3
      amba/serial: amba-pl011: Bring back zx29 UART support
      ARM: dts: Declare UARTs on zx297520v3 boards
      ARM: defconfig: Add a zx29 defconfig file

 Documentation/arch/arm/zte/zx297520v3.rst          | 158 +++++++++++++++++++++
 Documentation/devicetree/bindings/arm/zte.yaml     |  25 ++++
 MAINTAINERS                                        |   6 +
 arch/arm/Kconfig                                   |   2 +
 arch/arm/Kconfig.debug                             |  12 ++
 arch/arm/Makefile                                  |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/zte/Makefile                     |   3 +
 arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts |  22 +++
 arch/arm/boot/dts/zte/zx297520v3.dtsi              | 103 ++++++++++++++
 arch/arm/configs/zx29_defconfig                    |  89 ++++++++++++
 arch/arm/include/debug/pl01x.S                     |   7 +
 arch/arm/mach-zte/Kconfig                          |  26 ++++
 arch/arm/mach-zte/Makefile                         |   2 +
 arch/arm/mach-zte/zx297520v3.c                     |  19 +++
 drivers/tty/serial/amba-pl011.c                    |  42 ++++++
 16 files changed, 518 insertions(+)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260416-send-5c08e095e5c9

Best regards,
-- 
Stefan Dösinger <stefandoesinger@gmail.com>


