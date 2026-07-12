Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D96C44506
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 02:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=akuiiPDroRfJeMxQ3ozyBHs44kZ19VHRGG2J2TIkiPU=; b=MSpSYOmxi6K8LK
	jLePHAM8BFMaHjGwYVrELVcj5RgSj2uhtkJ9Wd4BEUu/huTuQYLWAr6pdbm8+MjyvVO6jIK2mJ0HR
	f3btdRhkJvjOargmNjT3fFOAPjzyBs7N+ICI14vYNBtxVTDuleTuaEkcz35p8hYwTEZnIfp8Su1LA
	ipWfAy95JF+1z/xrbuq41SdPEEAdMp/c5JX/txKg/S82pVDjASe1TvX4TnCHVrZ3RRKDmhnXgqqFx
	75BCT+w1NT6iMKVY2Ao+KMw6cE7DRgpUMmn+r3rif2TqqqUnD9SGU7tNP7ak4bWcfcsvfqzMZnK8d
	yFFhUe+D1+FgEkG+7P1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wijgk-0000000702o-1qVK;
	Sun, 12 Jul 2026 02:13:02 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wijgh-0000000702C-0luy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 02:13:00 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2cc6dd436c6so24452285ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 19:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783822378; x=1784427178; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=akuiiPDroRfJeMxQ3ozyBHs44kZ19VHRGG2J2TIkiPU=;
        b=XngHtDKXpCKXzM1Z4eNd4Roln0SU2Gt1QaTRjI8n1NExslSHwME0vhpVUTnYuKSLkM
         Yb0TystLKiPmesZJZRqGf8Pa5mWmGb3m0t/L8vNS0KMeaeQc39rMqcEQwNFdZt2jHhly
         mXJNgQgRu/ZwZpto/EMFZGhRBp9x6+odqv3Gx1W1HE6T3jxn4BxE7PxJQTDIyDlXAc/i
         TsKDrVAoWiws5G/64Fn8xKrW8m4bXdGZwF7As3dtiJH7BESlZnl7E7aoMuYe1OyE/+K/
         GJOSNCmOuD3VydQKpXOjYSWt4JCR3BNXKkNlk7ZcOTN4/jA2w6Evgozz39Qzc2AfctEd
         g42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783822378; x=1784427178;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=akuiiPDroRfJeMxQ3ozyBHs44kZ19VHRGG2J2TIkiPU=;
        b=Mrbgwh4oM0tGdhKlCnzEOeQG2iDEbx3C8i7vsSWHTw/26BBxcSGG4Gkn2kymL6OZE5
         9+FtUM/XwNjH1POPK7co2reWdGW++dqRwxKqiSNk6GjGzJHH4DT+MkiKL7CIucxFTB7f
         +XZwPhPyHXOhmwc92DavdXuxM86nYfmozmUB/mGDcNeCt0g35m4Ow0OnZp77gWAlRPLK
         zKKk3MRJimhvQv+03USg9ul9dbrCsoZ01K7bmuVwl/Tn8Xy3OmcoluWznWxp+SE3Ba2M
         YMBzJ9LeGNwDUktlsk83FGAIqjJqQEkvoN3o7k9Do/9fVSfwDYAurncmQKAeESgLoRX7
         33oA==
X-Forwarded-Encrypted: i=1; AHgh+RojP3LbyQk/h9fO3be1MrLWantcECG0oE/8e7jtjbKweyDJ2JpetuQb6jrueaXkDlUdWL9bTpXnQZy0GAK5y6mV@lists.infradead.org
X-Gm-Message-State: AOJu0YzZHLuUq9roAsB+WfAk/wVnlKRGk40mZpPIOM49d7hBhqa5Czc+
	YiPWS2hr3fvPR/TAMh/IU7yJrt1wGckWqzO12P4gw6S4Uq2DKOBPe4BN
X-Gm-Gg: AfdE7clt0iFTmX2P8969wpMNCeaSzEmgx/scs9eo/6i+Y9Va7nY6tiOzBpKUoBrzG7e
	mR8AdapJYlfqE2/cLC6m9itGELtYfzWGTZAtgwm2nONff/pb1vfJDWMtnKj6SFRP7IIdQ3euMFN
	vXUeOocYuKC92Wo/KssQ04eHeGLPeUPKpM5pUeqhf/zstXz/0EIMW8CmammVkhxQ8b4SYU6g2WJ
	FFVt0JVwx2hKAGcg+YFwQPi6XQzOX7Rs9B8GYPJUgx5vEiozmMrHBm/FwWFHLE9ji5Nmnr1xzvs
	BhAejItqxPhDrW7B5U+UFjSZ6OvbQpae36vSrHgYE7aV8n2muf7HwgiKV75nA+KGkdlD3OGGHgY
	TYtpeQTh1l7r315UN8sv3O5TrIN3g6bU9v2kINe4tfNnXlhEOWM8EftjW4Lxp+REnh4P2quB1R0
	iymQhnFalyT4BlxjUgUTmD9R0zwQsqsMW4Lbg8VeOAwVLxOv1aUdgoq9T8vDUdtOaZ5+7QuXM6g
	os=
X-Received: by 2002:a05:6a21:7701:b0:3c0:9c1a:8951 with SMTP id adf61e73a8af0-3c110b34ff1mr4611577637.73.1783822378295;
        Sat, 11 Jul 2026 19:12:58 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c63e:9756:a95c:c75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm54796692eec.18.2026.07.11.19.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 19:12:57 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v3 00/10] Remove support for platform data from samsung
 keypad
Date: Sat, 11 Jul 2026 19:12:41 -0700
Message-Id: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABn4UmoC/1XOQQ6DIBCF4as0rDsGEVG76j0aFwijEosYsKbGe
 PeiK7v8M5kvbyMBvcFAHreNeFxMMG6Mkd1vRPVy7BCMjk0YZZyWaQVB2vAZOxgmUIha85a1BaM
 kPkweW/M9sVcdu/XOwtx7lH8E5XmZZglLcy44gxS0NbNfk9l5N/RueXZWmneinD3Q3oR4WM+BC
 zvoAxK0oOV1y8KAQqYEaq6qJmvERan3ff8BOv6NlukAAAA=
X-Change-ID: 20240819-samsung-kp-ceedd4f2f720
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 patches@opensource.cirrus.com, Conor Dooley <conor.dooley@microchip.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-b242f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_191259_232946_1F620F66 
X-CRM114-Status: GOOD (  21.56  )
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

This series converts the Samsung keypad driver and the Cragganmore 6410
board to generic device properties, allowing the removal of legacy platform
data and GPIO lookup tables.

We rework the Samsung keypad driver to stop using platform data, utilizing
a new compact matrix keypad binding. To support this on the Cragganmore
board, we add infrastructure to associate software nodes with Samsung
gpio_chips, and add software node propagation support to the wm831x MFD
core to route DVS GPIO to the PMIC regulator.

Finally, we convert all peripherals on the Cragganmore board (including
keypad, GPIO keys, PMIC, WM1250, SPI0, basic-mmio-gpio, and LEDs) to
software properties. This allows us to eliminate all legacy GPIO lookup
tables and fixes incorrect GPIO chip names from previous conversions.

Mark, it would be great if you could give this a spin on Cragganmore.

The majority of changes are in arch/board code, with a couple of input
matches and one for MFD. If everyone agrees maybe we can merge it all
through the soc tree?

Thanks!

Changes in v3:
- Fixed legacy property handling regression in the keypad driver by
  separating compact and verbose binding paths
- Removed redundant registration of crag6410_mmgpio_node from
  mach-crag6410.c
- Removed dead S3C64XX_SETUP_KEYPAD Kconfig symbol definition and
  selection
- Fixed missing newline in pr_err() message in mach-crag6410.c
- Redesigned PMIC DVS support to keep regulator driver changes minimal
  (untouched) and only use software nodes for GPIO routing via MFD core
- Link to v2: https://patch.msgid.link/20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com

Changes in v2:
- Patches 1-8 of v1 were merged into mainline, dropping them from this
  series
- Rebased remaining patches (9-14 of v1) onto latest next
- Resolved conflicts in mach-crag6410.c
- Removed redundant "out of memory" error messages from the keypad
  driver
- Added an infrastructure patch to register and attach software nodes
  for Samsung gpio_chips
- Converted basic-mmio-gpio and LEDs on Cragganmore 6410 to software
  properties in a new separate patch
- Addressed DT bindings feedback on the compact binding patch
- Fixed proximity switch event type for GPIO keys
- Added support for software nodes in wm831x regulator driver
- Converted PMIC DVS on Cragganmore 6410 to software properties using
  the new driver support
- Removed legacy DVS platform data fields and cleaned up driver
  fallback.

---
Dmitry Torokhov (10):
      dt-bindings: input: samsung,s3c6410-keypad: introduce compact binding
      Input: samsung-keypad - handle compact binding
      ARM: s3c: register and attach software nodes for Samsung gpio_chips
      ARM: s3c: crag6410: switch keypad device to software properties
      Input: samsung-keypad - remove support for platform data
      ARM: s3c: crag6410: use software nodes/properties to set up GPIO keys
      mfd: wm831x: support software nodes for DCDC regulators
      ARM: s3c: crag6410: convert PMIC DVS GPIO to software properties
      ARM: s3c: crag6410: convert basic-mmio-gpio and LEDs to software properties
      ARM: s3c: crag6410: convert remaining GPIO lookup tables to property entries

 .../bindings/input/samsung,s3c6410-keypad.yaml     |  53 ++-
 arch/arm/mach-s3c/Kconfig                          |   5 -
 arch/arm/mach-s3c/Kconfig.s3c64xx                  |   7 -
 arch/arm/mach-s3c/Makefile.s3c64xx                 |   1 -
 arch/arm/mach-s3c/devs.c                           |  62 ----
 arch/arm/mach-s3c/devs.h                           |   2 -
 arch/arm/mach-s3c/gpio-core.h                      |   3 +
 arch/arm/mach-s3c/gpio-samsung-s3c64xx.h           |   5 +
 arch/arm/mach-s3c/gpio-samsung.c                   |  72 +++-
 arch/arm/mach-s3c/keypad.h                         |  27 --
 arch/arm/mach-s3c/mach-crag6410.c                  | 369 +++++++++++++--------
 arch/arm/mach-s3c/setup-keypad-s3c64xx.c           |  20 --
 drivers/input/keyboard/samsung-keypad.c            | 200 +++++------
 drivers/mfd/wm831x-core.c                          |  47 ++-
 include/linux/input/samsung-keypad.h               |  39 ---
 include/linux/mfd/wm831x/pdata.h                   |   2 +
 16 files changed, 472 insertions(+), 442 deletions(-)
---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20240819-samsung-kp-ceedd4f2f720

Thanks.

-- 
Dmitry


