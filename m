Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7D6FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 11:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Izl2nx9ZI1GiQgBb28dSYIy+N6GwTm8NILzzFVKNNVo=; b=UrroBRbkZqsyf2
	n+cW4LbeFlyBmBDt5A8su2WViNh/NjUr21BxpILi2tD4spP6w7KLHTFVeHAaeVOZKiqDZ+XeXmk3k
	4IVz4ywVpd37Pl2GpGHJ8lWz7G/+QAqU9jW/PuwyDGHHXNdUd5Btpn+3VJoKNBdjYyJ4tL/gBoE3X
	Or3LTeCgzN2SlqG79pZrr124kHAvwRfUs6bUqnfuPc39Loue1Z+Z2Aj6NRy+ATmtD9Gy1xggTiX5h
	uCpD4utiDnWJDAxy63GDInD3S8p8uvlrYqA/fCK8iz/k5kxSGICmky+IfptTHSRjFuKvJLrcGvj6e
	yHWNtxrt70KW16KAhwAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGy4X-0000000FVtO-0DQS;
	Sun, 26 Apr 2026 11:54:49 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGy4U-0000000FVt0-2SEn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 11:54:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-488d2079582so108955035e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 04:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777204484; x=1777809284; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Izl2nx9ZI1GiQgBb28dSYIy+N6GwTm8NILzzFVKNNVo=;
        b=IJiVKcEVG1s/yydwoKcgDaqY9rMXMw6m7S/31UVed30WVaymPWM0K3eSokdWgedkbz
         i0xm102QQ3gsvX39fxb25nVhaymckBSbUOXP/FYEAlg2wcb46DjnlLwpXa8D6h9PiJ1O
         2cspk3Vix3sOT6aMWWJpmtxHrrMqlW7b+tAVX3VKjBMXUGVzid0X57SiWoJBMjnPmH+0
         Yl++tminzKy7Q2ZBvt+cpySFT7fiTEP0tQ/hOcXqdWqiFqd5K4YAnpkHOvsPU0WgnevU
         S9SegNKkdeZjmg15TZZy9RLXGYjZ0BWzF2ht6jz48rvnyxe8jDnOFRy8y05feYno3pBq
         kcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777204484; x=1777809284;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Izl2nx9ZI1GiQgBb28dSYIy+N6GwTm8NILzzFVKNNVo=;
        b=U8C6/yWRARdGdXwdMteG7kZjj94A54p3SL3EURt2xUCKNxlsNylieJaebcLDJYNZf9
         fDnpZjWEachiF6PQ5bBGD+Rzh+GOYLC5mvmvxTMTiwrpuIJfrRIHE2RE4CxEQ5VbpEMx
         40omI1VJ6dqaxKqaxmI6pjV6gK9z7pWolfiJ54lhkRkapU/rHC3HrXjCMTY/3thDy4jO
         7263CnNKpdjjphSDkX6O71poNfAfEMzSQOqLuuE5UN4N1aMXnzpFTRG3pyF24YYYmTe5
         3LEFyult1yi2unreWkbENOFPtzACAtaRtISjb+P5xjw0XERv1WgjjSajfiFYvCecKznC
         fv6A==
X-Forwarded-Encrypted: i=1; AFNElJ/23hS3hcE0mbvkXg79Pif5f9b2pv39LPPxc5KqBp6nim5nRWvbUgxNaybZx/flpi8Z56xWUqJ6pZT03lRnZPBh@lists.infradead.org
X-Gm-Message-State: AOJu0YywAi7RBpNKHwnBygqcQZA/EaRwy+eBrinsLGHHVOsxPsIgBXtQ
	NlhQ/evmmLB/NzDeNUC0J1KgRBNih3nuA3lApLXUi13+Y8xkt5lDOHQV
X-Gm-Gg: AeBDieuiay6MUNKIkMIPbWY+O1Y+7HfwfYT6oBJCbVIgJeY6REvZiHXm2tAE0nRz1Si
	9ppnzQlOTPGsJDRet2HS4Q4ncyNqIqmeNgr1XbANMjW+m8jBMlS45TnIjK91WA/24/huwsKQS2K
	6n7RNVVf3QQelg4AxOLwzf8zaewSobSr6ZBxR3fpyAG0D6AyLkrvfLsyJhEo7LKA4AxFRxTvdLA
	dshsP9eJYIadUBhdsNarupFSxJE9BAueB8L0CPjK9rE9Bzy8havFI3DnAEvvkEL+3NEu1Gu8S+3
	3eZ2jjoOOk+d8wssceGqtO06aw/L7/+feKbmGFjgQxtvCLXkVBAis9rz52sFXfhZGpx1/SqWi9F
	UoY2AQQBDZO6wGWPP3Hp0uGHfrwBpcLfS+yh+QW94Nm5aVm6CNOe0mExuwXFRD+izxk+2J+chB6
	mBBFcqFthGAoB4UWhCnVngeV82I1toToN3U4qzgm1A4MWxen3GM8E=
X-Received: by 2002:a05:600c:1f83:b0:488:8840:e5ae with SMTP id 5b1f17b1804b1-488fb787afemr547647045e9.24.1777204483792;
        Sun, 26 Apr 2026 04:54:43 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891df9e50asm424018575e9.0.2026.04.26.04.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:54:43 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH v6 0/6] Add support for ZTE zx297520v3
Date: Sun, 26 Apr 2026 14:54:13 +0300
Message-Id: <20260426-send-v6-0-d49efa72bb09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOX87WkC/12MQQ6CMBBFr0Jmbc20tA115T2MC2xHmETAtKbRE
 O5uIS6Iy/fz35shUWRKcKpmiJQ58TQWsIcKfN+OHQkOhUGhsqilFYnGIIzHhtAZMt5BuT4j3fm
 9ZS7Xwj2n1xQ/WzXrdf0LZC1QkHQB1c1pTf7cDS0/jn4aYA1ks5OU/EmmSK0nrBuytZFmLy3L8
 gX2YWVzzQAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4719;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=177MnobEW4AW8zxVOoT5YiyKBdemluGYegbd8Mp3tz8=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp7fz+zJK87ZzFTWeE6ZPEmJKpc5rt9HdkrkwJn
 cKb/Epf+nWJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCae38/hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiI6HQ//V2CFvqcKUo8t2sbKt1+Udb0dTFGutWw
 6qPFskqk9n9FU5I46MswNt0vr/xH5AzLBcs0aY9ECAf7La1JBKkrMmi1byZfW0uIP+6EJSVNIik
 PvOE8inm72tdmMbIUvIgVNBgbzRKmiLOQnd6owWDm9EeCcDI1BoBYl4Nxg/RWXcxLtZn099Ffle
 Yj1Obf8hPu25jrcIyN2IqvtAZ9YDIP/WpO3WPE9YqZvpCyrUwdyE4ebrdreAStgLVqE/SnNbKp8
 iBGLGoywv18GWY1dSmW/ElT1DvISt3XKa2cYap67qYC5UCak0AXL+++0bk5ci1LD9tFjVPE4JvW
 +sRQfQZ2MJFy8/3X4611CtOWNyIIBdN6PJUclj/Vr7Q4CqMrMO/3JHmx7YoecdhiuAug0inyum9
 iG13sUBMbQ5OyxLeElvUOTGuZpKQeBUIbSulpMzP+t9pvY2la2PbM8e5Zed82ea0vkITq19ymHg
 M7sAulSk+4OiEDyhq0LrW2iHLmdnttFKXGGk+TA/IgBTLXwoHmm8svZrRdiphyMfs+i7dy7Zy01
 hhRM+j2dT0qWnPYDdzVcFZF7x0vEhkC0h05wt9PRwltat7Q+zhfI8J8/ZUq6xyWvt9GNqVSlv+L
 YeQoRyHXOWIllF3vBTgU1J7Pns/Gnn83bQCO/PmkJHb9wvVvgtGg=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_045446_668461_76439A27 
X-CRM114-Status: GOOD (  23.49  )
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
Patch changelog:

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

 Documentation/arch/arm/zte/zx297520v3.rst          | 158 +++++++++++++++++++++
 Documentation/devicetree/bindings/arm/zte.yaml     |  26 ++++
 MAINTAINERS                                        |   7 +
 arch/arm/Kconfig                                   |   2 +
 arch/arm/Kconfig.debug                             |  12 ++
 arch/arm/Makefile                                  |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/zte/Makefile                     |   3 +
 arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts |  22 +++
 arch/arm/boot/dts/zte/zx297520v3.dtsi              | 103 ++++++++++++++
 arch/arm/configs/zx29_defconfig                    |  54 +++++++
 arch/arm/include/debug/pl01x.S                     |   7 +
 arch/arm/mach-zte/Kconfig                          |  26 ++++
 arch/arm/mach-zte/Makefile                         |   2 +
 arch/arm/mach-zte/zx297520v3.c                     |  19 +++
 drivers/tty/serial/amba-pl011.c                    |  42 ++++++
 16 files changed, 485 insertions(+)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260416-send-5c08e095e5c9

Best regards,
-- 
Stefan Dösinger <stefandoesinger@gmail.com>


