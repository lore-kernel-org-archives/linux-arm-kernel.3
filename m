Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3A6F8D778
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 20:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W8nZc0xy0duswt5stMQc278vwujXUsWzZTQDCqL9tXM=; b=UvH7fpf+Pmhxqy
	rA0krn06hSVN9e8TG0K1pauum/Qb2SEtAlGGfYVLEbF9Z9nYUeVGM+G0xImMGuxIhqcvt23Zb23LK
	Rv1H4v0Ql4Z1qg2o1+hRg6Au+UP0DrCz5DCzY/lt7Lz7UQtehZxd2gCpg7ypsR0813IHPk/A1KYuw
	CC5fBuaU7jyHxg9sKZwEXfHD9OMVxW6B6qxkCCLbr18EBEMyXUyrYpySfo+4SXrWljyiYSSdtnPwF
	vwC4hYvLwvTpeAgKqSg0CPMCanvKPUee1YxbSwaTR2cLU/h7S2K4DPt7zx41dGu4CqS2qC78N628e
	x713Xt9mCrza7eyTe8OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDTBV-00000002xu3-0IvS;
	Thu, 16 Apr 2026 20:19:33 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDTBS-00000002xtJ-1Auh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 20:19:31 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-43cfac48bc7so5893681f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 13:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776370768; x=1776975568; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W8nZc0xy0duswt5stMQc278vwujXUsWzZTQDCqL9tXM=;
        b=WjFGLrzxGSuL37JQcpE8iOxLnEuXkfGFCSH+cKNSXxRonyv7phyhfjEf/RxySEhO8r
         b80nqFrc/LEGE17NAanQEjQhwRITPjt2vqWssDP5G3VAAQTzXCnbcAQqBM7wKLUUDLSI
         3VVXZ4+BG2y6EiBEtY4I7FxlsZ7YjLM4Da/j/4qp5bxAMmxuV+kHQFl8U+mAwqThQZHV
         K7bWMAZtcNyepUi4OtFvNsO+ZX98cIi+aDPE4EYTZe/yYBSZYa6qHkX1PA7kbyTeSJgi
         yFhzys0hqN4OBnMVGykvOBxb28DqHH42fpZPeokoPHO0jjmLIkyV2X5Q6iNhG/jL5jlT
         Q2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776370768; x=1776975568;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8nZc0xy0duswt5stMQc278vwujXUsWzZTQDCqL9tXM=;
        b=XG9ya3iqyEnnIiZNe3s4KOOiUpDEkBAhti2SNoPvfJZ587X/dQXrXPDvptoLOrddHi
         2alXrI+1LND/i6NUphyr96Ulqt4uBYsNNGLE/YsPFKozR3BlpYACF3VRJFOGfrpCah6a
         AeYh0hVCbFfpqD3zPjW5g5SWQhbQF+MCkuZXchPQi/tOJCYqbijb+e6eKmFs49fK5wcx
         li1vzs5k6ExAJ7tl9lbGr/wYq6ujuvQOHvsL531jIlSbKz5jS+c+Sa6/9kL0qAEdOieg
         TWs9ilmHtrkjODY+cVcHgTrUCba6+FfXiV7qP+Nt+FxE540OhCYCG6gqx2kcDzbSbZiK
         zq9g==
X-Forwarded-Encrypted: i=1; AFNElJ9K64CbuVaObFGAREK+kq9El+O81hvcfi9ZTmS7fZn0NW2mlJjWlQMvqpiCnJV0WB1jwvHdIsJ34KoWlKuSuxjc@lists.infradead.org
X-Gm-Message-State: AOJu0YyYJnR0Hq7JV2gWUcVKbeWGepyAbrTDnQAVad8TaBCT3RD5bGyE
	/t1hx6cos0K+jk5yh8iCJwZuGBEXhlewLMiIuBG3GidaM7m92JcKydba
X-Gm-Gg: AeBDietF2TXZWfU+s37dFW8ASSR86JmzJNZNxGyi9+69fOqwyyhlC+waedrA7l2wDD1
	1pvoF24uDfO57hjrj8wlu5DP7zuYuoLVKpPscB/vWpszDV1I487ZucI/DHkGztqd2BRpd/Bn5rB
	96vwHGkGv3L6YLjCzH33tuj9uOiWUtbIaI+QKajWRP7cnn+cfaK2aYNiAAIMMlHw6b5hwTEGQTm
	n9tTGg2W+TiDKH86b10ybbOz2ayVv0ZTnZnSTfgUKlWuZ0vkL0yMnPY+tNkfG+iKqhB3FhbB/4j
	wkQnt1QHRrUQqLFLYVZAkexcJw80K2k8+sOP3B0mFXm+cU8hnXQUnsbFRPDpZJvkhmaD5+DW6ug
	2A/VtfuoQ4pRFHHlebLu5Ez5QGrhhPebKYpkIW5s1jGhOFVgHLbrW42UAMl5mIitx8OnrL0QkzS
	J2j4ydlE8SC2CYwaafauOEhbPMXHG8X7rOaL8GMH93iDtVwg==
X-Received: by 2002:a05:6000:22c3:b0:43d:3004:5fef with SMTP id ffacd0b85a97d-43fe0ea3667mr1302338f8f.7.1776370767968;
        Thu, 16 Apr 2026 13:19:27 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead35c026sm16180624f8f.15.2026.04.16.13.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 13:19:27 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: [PATCH v4 0/8] Add support for ZTE zx297520v3
Date: Thu, 16 Apr 2026 23:19:08 +0300
Message-Id: <20260416-send-v4-0-e19d02b944ec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADxE4WkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDIzMDE0Mz3eLUvBRd02QDi1QDS9NU02RLJaDSgqLUtMwKsDHRsbW1APKUMK5
 WAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4069;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=7HAu9409XS2mSrrSyv0Alnlrsv+y0tOov9p9fjQcR0g=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp4URKrT6XMtZiyJrbaPR7qc/RFSCsMcn+h+B6/
 JgQ1+HrddiJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaeFEShsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIu1BAAjlaJHP867qOApRxS4iItx61iEqXtDj6
 UDOM4lTZjUjVTnDxtQvhePQRk58NIRDpDCFcoGau64b1+E0H6+Rtt4V409u5suYtD3PFmK8LDHJ
 6jPtYooFJ+VIcqfylazdeVELYKHYapukRAmsft7FykhxLSoOAf7hzebqqC4ZBjhM6C3wvat8V68
 +bn4GJT11BYeFkZKfYaosuZ5W5ScLD8AiCJqNyEsrNfOXU2gm6nCT8hJoHhFd7xxJZtKBNySssv
 8r+7LC/jCTasqR/8uuA2s8uSly1LKJhJvqTIt2MGpFj+5rXyU9QYOa8ZeYewGje43HUSB31gcgm
 blVjAWzBLyurMsqIcQnEW8cQN0Gsls78sYyv9LFyreYHGd3HYNxFeA1KeEBvl08Az4VYvHxY6lX
 CXI0r/CsjWykTCKYoELJBaTCb7kvKbOMKeqBKEyyGsd/hUYy55oIfl8rkWhN6dhSws++b3S3qSj
 av75J8cYPxxxw0m3gMB1I1niwcjFvIJoc2kQiSVDZ8icrQTebOc2rZuAeMHH9ffQTuR2ojSwRuE
 dk5CZhW6WR5quSpi+M3RpJnzTKqWt4xlBpP+0o3On+XwtqfykvyE1dnWVBSr6rNNijmTSXE0JO4
 jrRfmJBlifeFvGqUnmxqQYMq/fsfymG5KG8qh3jOLOpLC/b+acD8=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_131930_365450_908AAB73 
X-CRM114-Status: GOOD (  22.41  )
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

v4: rename zx29.yaml to zte.yaml and add board enums
v3: Remove [RFC] tag, add defconfig
v2: checkpatch.pl fixes

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
Stefan Dösinger (8):
      ARM: zte: Add zx297520v3 platform support
      dt-bindings: arm: Add zx297520v3 board binding
      ARM: dts: Add D-Link DWR-932M support
      ARM: zte: Add support for zx29 low level debug
      ARM: dts: Add an armv7 timer for zx297520v3
      ARM: zte: Bring back zx29 UART support
      ARM: dts: Declare UART1 on zx297520v3 boards
      ARM: defconfig: Add a zx29 defconfig file

 Documentation/arch/arm/zte/zx297520v3.rst      | 158 +++++++++++++++++++++++++
 Documentation/devicetree/bindings/arm/zte.yaml |  25 ++++
 MAINTAINERS                                    |   6 +
 arch/arm/Kconfig                               |   2 +
 arch/arm/Kconfig.debug                         |  12 ++
 arch/arm/Makefile                              |   1 +
 arch/arm/boot/dts/Makefile                     |   1 +
 arch/arm/boot/dts/zte/Makefile                 |   3 +
 arch/arm/boot/dts/zte/dlink-dwr-932m.dts       |  21 ++++
 arch/arm/boot/dts/zte/zx297520v3.dtsi          |  83 +++++++++++++
 arch/arm/configs/zx29_defconfig                |  90 ++++++++++++++
 arch/arm/include/debug/pl01x.S                 |   7 ++
 arch/arm/mach-zte/Kconfig                      |  24 ++++
 arch/arm/mach-zte/Makefile                     |   2 +
 arch/arm/mach-zte/zx297520v3.c                 |  19 +++
 drivers/tty/serial/amba-pl011.c                |  37 ++++++
 include/linux/amba/bus.h                       |   6 +
 17 files changed, 497 insertions(+)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260416-send-5c08e095e5c9

Best regards,
-- 
Stefan Dösinger <stefandoesinger@gmail.com>


