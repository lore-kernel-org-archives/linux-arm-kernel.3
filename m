Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C23FCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 00:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7waYNZVKmyie4QyAlCDozACqSO94wVCOTNBrkTDXkco=; b=zJD+uKxbZY5F4d
	U3V5Cl5waTihQsojlqpgSJZnWR4LCQwdSHBj3F9inzE1JudlnIz/yDiPv9r+RN6bqpwS/CnvVA4Vf
	kPlz8OjruGP8IS7JXZJYl6o1Bl3eUArrQDcAwcsik9Pd8Pm9zfu5Bpafin69/PbGs1RkC/KYDfow8
	TjoAyCQ/TIMGKQ+htHS2w8HALY/VXsfelypueKEpIKnprk+/AgZAM74LXR4K/88K+LJrKROF3zi11
	aeZL4Jo2x/iC8zrES7Ny4FHnpwRrPyKhbsNvsZBhys6caz6TMXlIPrngTpZgAmKOy5Hk/wPJNSmxX
	gFs05jX+uWC9hZTLguzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCS5b-0000000AiPt-2DTx;
	Sat, 25 Oct 2025 00:24:59 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCS5X-0000000AiOo-3ljz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 00:24:57 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-27eec33b737so37914545ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 17:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351895; x=1761956695; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7waYNZVKmyie4QyAlCDozACqSO94wVCOTNBrkTDXkco=;
        b=DiY0s2kg4gixVe2laxbX3cG4WHy1r5l2SJ0Tul1vXDPvPrZ/GfkVONi+Rz5I60kbFs
         qL5rnOostVSqt2OTpOG6BxWXjVYMAZwlBfNB90FD1HdwRGhx7qZK4EcYxC6WX7lRCKFg
         sKKRYAOwx2hhA/zLU6N/67tCMFPEAweEym/EVPcgDXF5Yf9qAPAUfAC4C/wVDnu1fRn/
         SbHVaKaJt/IB5JH5SnJDuRVXlapo3iKjK+sORKYQwA5WKhA21w4goXiurCyeSghHe8tS
         kUdv0DtSq0stEoO7QkayylySNoFSe6ljyZJUenlYvFF9fg32Cl3dWyopchpVjavfIq/T
         KwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351895; x=1761956695;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7waYNZVKmyie4QyAlCDozACqSO94wVCOTNBrkTDXkco=;
        b=mgdaXnKGgw+wuusZ3pb1xDaYbAgeCoWGkBa7vjVhRgZfbyB4WvSPbpNZ4s+EUiXzhI
         Jc7uXLGVqH5+de/jNm65o+gDVdHOVEkd99XHucxqHHPHyw6AJKQ2u+9pS8No8Z/Z1BNn
         zrxS3dN6ofk4xYkUSxMs6ONs1bwTnCNsNSyQEqinCJhmFfwCcsVtvnWrCfXqgm8JPoID
         y8907rZw/I+1wftPtwwjMT19tMgJvw1G8fTDDAVBBEB6TwdASBU8V8aRdMe/QvmifhXf
         go6ktXAnDT+px2hgx+20ZGJxPbQNZUZeMunYf/JG+fGZr1TgPqpjQF/WHXD/IBHKnW2q
         hxaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3AcPr1zOrbAowoe7FxOcEZOuNeWAaPWKsKsmxnnJxlKm3lSJLDjtA03cB7RacZPcmjFpnaKioPLKgdXmsn3iA@lists.infradead.org
X-Gm-Message-State: AOJu0YwKg15x+Ywqs8d9X/YpFsQ5IjipqiU5bI+ahuT8Tx0dQQhpODlF
	sKSdI8jO+XgAAn3Wtm8fefG1JprKRBuQu0qez0XDWHPHUmsOLp7zjikh
X-Gm-Gg: ASbGncsxb/2RsY/Prt8aWh7QF9loRsP17cTD0C2MYBY03uvjtKKswGCgySi9gt4ym7r
	XY8SeDplwQ+UtS/ch6GSvRKi4/QYQ2T++JnzV1kZmJpAgphzvCOWPixzp5dh1KSHVkMWfhE6qwj
	K/sGq6DMSWDwiEhtLgpgaAw4ij/weJ6j6hM0pzxEgGUEVPBiJBNtG3/H0xlm4ICp/vjTOqnHmdV
	GfHWce91hsMdAfzYEe17PkBiRfRGm22eYpxralCGlIcoONm3auKzikjjboI8hY/8s5JqP++NIxN
	xfwcwkOzQvgoO+XUog5xop/22igXmMoNIu/5buFmodCwQz0Lpqaj+G9jUFnSQAJ5LwY5pwzzFWS
	03cgUYCahqMVLW2wzGqpIb6jklzFy3qlekXIAGwqDU7eLf5hFU+xCP537ckejSeyWJpXdPMECi3
	zrMZgB5M4w5SRg0R5h2HQP2VUynTFx/lBH9VEBpUgP0pzs7aSeZi/8uV6Z+lNTGAEeEc2Jq6ow+
	N3ANvbGxwNYZHkxl6btjmXa+oNyD3bzFC/GLybhPauD3SJangSqN/LpabKTUzyD
X-Google-Smtp-Source: AGHT+IG8oGxBZCHK7kqo4q+7nyIf3av5yZr0y5kmaXr9sDJtxDyllc6PpENotDwXnMi5ChfG0lIiwg==
X-Received: by 2002:a17:902:e843:b0:264:ee2:c40f with SMTP id d9443c01a7336-290cb46c41cmr333345805ad.52.1761351894738;
        Fri, 24 Oct 2025 17:24:54 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:24:54 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v4 00/11] mfd: macsmc: add rtc, hwmon and hid subdevices
Date: Sat, 25 Oct 2025 10:24:31 +1000
Message-Id: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL8Y/GgC/2XM0QqCMBTG8VeJXbc425zTrnqP6ELPjjpIDVejE
 N+9KRSil98Hv//IPA2OPDsfRjZQcN71XRzJ8cCwKbqauLNxMwlSQyZS3hboW+T+VVoKnmcGlEQ
 QxgKyiB4DVe69BK+3uBvnn/3wWfpBzO8vlW9TQXDg2tgqRUW6Evmlbgt3P2HfsjkV5IpLs+Myc
 iRNeW51gjLbcvXnAmDPVeTWWFVW1hQEcs2nafoC3zuNRCoBAAA=
X-Change-ID: 20250816-macsmc-subdevs-87032c017d0c
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 Mark Kettenis <kettenis@openbsd.org>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7029;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=NEwP5oOU+xmnrc/qXQvktbP4weR9cV3E4YrWW5t1/y0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM6+NW/U/xjeuFezwPXetcrQbzdNpr85Z3RXXNTDQ
 eWbcp9kx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 DXWMdYwYuDgFYKqvcDL84bp1cj7LobIHoszM/3TLRFmLdQT1nV9Ze58J2CKyQsD4PcP/zEM3tCd
 bFrI83/Kjv4tn5Sq3wwcqfu+u8E+RLNz8QOAPLwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_172455_974087_ADE1F985 
X-CRM114-Status: GOOD (  21.96  )
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

Hi all,

This series adds support for the remaining SMC subdevices. These are the
RTC, hwmon, and HID devices. They are being submitted together as the RTC
and hwmon drivers both require changes to the SMC DT schema.

The RTC driver is responsible for getting and setting the system clock,
and requires an NVMEM cell. This series replaces Sven's original RTC driver
submission [1].

The hwmon function is an interesting one. While each Apple Silicon device
exposes pretty similar sets of sensors, these all seem to be paired to
different SMC keys in the firmware interface. This is true even when the
sensors are on the SoC. For example, an M1 MacBook Pro will use different
keys to access the LITTLE core temperature sensors to an M1 Mac mini. This
necessitates describing which keys correspond to which sensors for each
device individually, and populating the hwmon structs at runtime. We do
this with a node in the device tree. This series includes only the keys
for sensors which we know to be common to all devices. The SMC is also
responsible for monitoring and controlling fan speeds on systems with fans,
which we expose via the hwmon driver.

The SMC also handles the hardware power button and lid switch. Power
button presses and lid opening/closing are emitted as HID events, so we
add an input subdevice to handle them.

Since there are no real dependencies between the components of this series,
it should be fine for each subsystem to take the relevant patches through
their trees. The mfd one-liners should be taken in order to avoid trivial
conflicts.

Regards,

James

[1] https://lore.kernel.org/asahi/CAEg-Je84XxLWH7vznQmPRfjf6GxWOu75ZetwN7AdseAwfMLLrQ@mail.gmail.com/T/#t

---
Changes in v4:
- Added Rob's R-b to hwmon Devicetree schema
- Added missing include to hwmon driver
- Dropped superfluous dev_info() from hwmon probe
- Added Guenter's A-b to hwmon driver
- Renamed INPUT_MACSMC_INPUT to INPUT_MACSMC
- Dropped leftover mention of HID in input driver
- Reinstated input driver MODULE_ALIAS
- Trigger a hard wakeup on power button/lid switch when coming out of
  s2idle
- Suppress KEY_POWER event on wakeup to prevent an immediate shutdown
  when waking up
- Squashed hwmon Devicetree commits into one
- Link to v3: https://lore.kernel.org/r/20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com

Changes in v3:
- Renamed macsmc-hid to macsmc-input
- Switched to pm_wakeup_event in macsmc-input
- macsmc-input now configures its capabilities before registering the device
- Renamed macsmc_hwmon to macsmc-hwmon
- Dropped module aliases in macsmc-input and macsmc_hwmon
- Introduced new SMC FourCC macro to silence GCC errors
- Condensed hwmon binding using $defs
- Made label property optional for hwmon sensors
- Fixed incorrect hwmon is_visible implementation
- Dropped 64-bit math from SMC float ops
- Fixed incorrect use of error numbers in hwmon driver
- Replaced a number of non-fatal dev_errs with dev_dbgs in hwmon driver
- Added hwmon driver documentation
- Added hwmon subdevice directly to the DT SMC node
- Included "common" hwmon sensors in SoC .dtsi files
- Fixed typo in hwmon-common.dtsi
- Added Neal's R-b to series
- Added required nodes to t602x Devicetrees
- Link to v2: https://lore.kernel.org/r/20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com

Changes in v2:
- Added Rob's R-b tag to RTC DT binding
- Removed redundant nesting from hwmon DT binding
- Dedpulicated property definitions in hwmon DT schema
- Made label a required property for hwmon DT nodes
- Clarified semantics in hwmon DT schema definitions
- Split mfd tree changes into separate commits
- Fixed numerous style errors in hwmon driver
- Removed log messages sysfs read/write functions in hwmon driver
- Removed ignored errors from hwmon driver
- Removed uses of dev_err for non-errors in hwmon driver
- Made it more obvious that a number of hwmon fan properties are optional
- Modified hwmon driver to reflect DT schema changes
- Added compatible property to hwmon node
- Link to v1: https://lore.kernel.org/r/20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com

---
Hector Martin (2):
      rtc: Add new rtc-macsmc driver for Apple Silicon Macs
      input: macsmc-input: New driver to handle the Apple Mac SMC buttons/lid

James Calligeros (7):
      dt-bindings: hwmon: Add Apple System Management Controller hwmon schema
      mfd: macsmc: Wire up Apple SMC RTC subdevice
      mfd: macsmc: Add new __SMC_KEY macro
      hwmon: Add Apple Silicon SMC hwmon driver
      mfd: macsmc: Wire up Apple SMC hwmon subdevice
      mfd: macsmc: Wire up Apple SMC input subdevice
      arm64: dts: apple: t8103, t8112, t60xx: Add hwmon SMC subdevice

Sven Peter (2):
      dt-bindings: rtc: Add Apple SMC RTC
      arm64: dts: apple: t8103,t60xx,t8112: Add SMC RTC node

 .../bindings/hwmon/apple,smc-hwmon.yaml  |  86 +++
 .../bindings/mfd/apple,smc.yaml          |  45 ++
 .../bindings/rtc/apple,smc-rtc.yaml      |  35 +
 Documentation/hwmon/macsmc-hwmon.rst     |  71 +++
 MAINTAINERS                              |   6 +
 .../boot/dts/apple/hwmon-common.dtsi     |  33 +
 .../boot/dts/apple/hwmon-fan-dual.dtsi   |  22 +
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi |  17 +
 .../boot/dts/apple/hwmon-laptop.dtsi     |  33 +
 .../boot/dts/apple/hwmon-mac-mini.dtsi   |  15 +
 .../arm64/boot/dts/apple/t6001-j375c.dts |   2 +
 arch/arm64/boot/dts/apple/t6001.dtsi     |   2 +
 .../arm64/boot/dts/apple/t6002-j375d.dts |   2 +
 .../arm64/boot/dts/apple/t600x-die0.dtsi |  10 +
 .../boot/dts/apple/t600x-j314-j316.dtsi  |   3 +
 .../arm64/boot/dts/apple/t602x-die0.dtsi |  10 +
 arch/arm64/boot/dts/apple/t8103-j274.dts |   2 +
 arch/arm64/boot/dts/apple/t8103-j293.dts |   3 +
 arch/arm64/boot/dts/apple/t8103-j313.dts |   2 +
 arch/arm64/boot/dts/apple/t8103-j456.dts |   2 +
 arch/arm64/boot/dts/apple/t8103-j457.dts |   2 +
 arch/arm64/boot/dts/apple/t8103.dtsi     |  11 +
 arch/arm64/boot/dts/apple/t8112-j413.dts |   2 +
 arch/arm64/boot/dts/apple/t8112-j473.dts |   2 +
 arch/arm64/boot/dts/apple/t8112-j493.dts |   3 +
 arch/arm64/boot/dts/apple/t8112.dtsi     |  11 +
 drivers/hwmon/Kconfig                    |  12 +
 drivers/hwmon/Makefile                   |   1 +
 drivers/hwmon/macsmc-hwmon.c             | 851 +++++++++++++++++++++++++
 drivers/input/misc/Kconfig               |  11 +
 drivers/input/misc/Makefile              |   1 +
 drivers/input/misc/macsmc-input.c        | 208 ++++++
 drivers/mfd/macsmc.c                     |   3 +
 drivers/rtc/Kconfig                      |  11 +
 drivers/rtc/Makefile                     |   1 +
 drivers/rtc/rtc-macsmc.c                 | 141 ++++
 include/linux/mfd/macsmc.h               |   1 +
 37 files changed, 1673 insertions(+)
---
base-commit: c746c3b5169831d7fb032a1051d8b45592ae8d78
change-id: 20250816-macsmc-subdevs-87032c017d0c

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>


