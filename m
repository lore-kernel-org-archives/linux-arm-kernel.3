Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69C5CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 11:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O7clx8dfZg3jZ+tSq2YUEpFAI0n8/M6CLth3qWizbsA=; b=FnJnXXEnWdJg4E
	jsMYT+FRbzon9pYWJ5wF6lWj0Uds2GFL2akZkoK6pw3mvPusoMwH263/rbXbodkCcV0+iSLbfDOG6
	aQ15OJqiJbmuOtekv0zJKX8meOOHDHwFFQ9MJtFsZmEUpCS8AujP0UtfpmhRoOd3k3Jy20tKUvMoN
	hmJWHsCEG3R9vI2Q3ZDX3F/JnoQsUMaI/E/SnATvhb0wKj/BvwGHFyl+Brxk5rhBEI7Yi06zi85UQ
	M2OilKia/v+usumwtlOvr+Rwz7Hfep/1aR22YwmNnMdwU80yiT+8VaM0UFccYZ795QgGmH812GFJ8
	xdzMPEvA8OjR4WtmKv/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8r4-00000008f0L-2NDw;
	Wed, 12 Nov 2025 11:17:38 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8r1-00000008ezn-3EXD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 11:17:37 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2953e415b27so6460725ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 03:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946255; x=1763551055; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O7clx8dfZg3jZ+tSq2YUEpFAI0n8/M6CLth3qWizbsA=;
        b=FSDUnBxnn1n+zBEXGLGRhKH7wLR0iYEhRDSvYSK/Xy6Qe+ijWdU344N/3/p8RkP9pp
         ds8bQ3rtgFYQZ4WYR1YBgJuRocjvdVqCIYD6ivGZj3gwxD8ZZwxkIaOLhw+tFKX95Bq9
         ReYXEnniGPWYk/wXByy/DH7Vt+4D5I4beXw4HcCV9k9rc51XWg5winBlA192Vytjriez
         JvoyJNoV2z+UR2+ie28q8pDS1M8GSvHdRLIGyjz+RJ+nw4/ZjLtQPWslPI6G8HU5d9zb
         Jqp8Uq8mF80X3Z6kh+xiTwFtcFlknzb25NSIRsW+oBKRY+H8arYmWxCDnWjBtdXbWdWM
         pWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946255; x=1763551055;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7clx8dfZg3jZ+tSq2YUEpFAI0n8/M6CLth3qWizbsA=;
        b=FTnEahU7k329vPYq791BXujFe/yRJOB24f+31OBBvEUYIL2FmicxaJiPmWooMK/7e/
         lYthHEMzKo6oChXvs/V5uD3FnUQLD2iKglzAGLy57qxJujS/gqe5bR3ll/pQPP5e4Zc6
         XONQrF6tvdriajAdZUP02nnehSbrFTnDCPYqk1i9BAVee5xAjSHi9dzp9WvuiHFLpYFw
         KGvqhz1qJ+cdIXZu+1JAOccsic607CiqnygftMeH+2T0++sWoIIco9MYXImblZQPLwMr
         HbzrSShZTxal0RM7qgg7llH+ISBogcYhpYrlX2LiuUkQhf6MMAiq7SOH5WEMTISiUcIQ
         BMyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6MAUCBZMn+ftLSn6YlfWvdmcrB9i7NksXSONB1WebbTQDtCaLHsbFW5gjB6pB93H1c7zV2QHRXA4sf9O/wr0/@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy2xaPSjue2Kk97V8xs7XURP49Xm8DeCHwJhDExW91QYmvmzj1
	iCM6oBcCPmWrr2m86XQ3ETocuc9JVJQrsVezSdnGoQq2M7Cig4grI5qo
X-Gm-Gg: ASbGncuSz+ut8ltA+RP4hX6WZZJYAlCTun518nN8vh/ct0ECIf8HCi75Zenvp68NvF6
	/TuOcHrXPY3ta3Ndb0u3zH5nS/N7JeERRHphHamcWZtf8FtJxadXYVrZzsY9lRMthL+OKLw0zXi
	bOQ83Ve6R+3NZWBaqXDeXJcoR8lK3BbfCalDBVyjRh72fMXmJbIrrqu12ieIPVnPRyCE1tTciTj
	VqC2x3add+uhhgNpUnUgQ92hK0nbO2HcR5GEotJ0giJmnPhj6tqoJTnVZG2bNCWDborJ7x40k74
	OJ5RMxV+T4StsifpNGhtKeqeOhPB3m3orytlIctkhF31vG0io5tf+CBm/dznk3wTip+jVZm1PiI
	mQjFOQpB7Pe6RmfmsGltNy08SfmN/4iZepatyhD/7GcZGWgn9KQAVP3/hhbgvk6hjGIILXZ+2ND
	UOiu+Lnjm8coeUXgU+zfEVzs9xKQgwXV/SGuks3M2jyW7J/5+LfGQvhn1qYhKWbwN68212iLLnI
	2DKxbMTIdbWeg+jVwHzD7aEJDeVNIDN1QS+dO1aDKV7uOY+lRwTagA=
X-Google-Smtp-Source: AGHT+IHVEaLkAKMKOQnX2Yk+k2Hy7v2hitB1DZg/c1k61ch6ePvOS7vJ2UEiP4g6NHx8/2s4uaVz5g==
X-Received: by 2002:a17:902:f684:b0:26a:8171:dafa with SMTP id d9443c01a7336-2984ed49524mr36554305ad.21.1762946254443;
        Wed, 12 Nov 2025 03:17:34 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca0f28sm27386695ad.60.2025.11.12.03.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:17:34 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v5 00/11] mfd: macsmc: add rtc, hwmon and hid subdevices
Date: Wed, 12 Nov 2025 21:16:46 +1000
Message-Id: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ5sFGkC/2XMQWrDMBCF4asEraswGlmRlVXuUbqQZ8aJoI6D1
 YqW4LtXCTQYe/kefP9dZZmSZHXc3dUkJeU0XutwbztFl3g9i05ct0JAB6056CFSHkjn746lZN1
 6sEhgPAOpim6T9OnnGXz/qPuS8tc4/T77xTze/1RYp4rRoJ3n/kBWXG/C6TzE9LmncVCPVMEFR
 7/hWDmJkxDYNYTtmtsXNwBbbitnz7br2UcBXPNmwdFteFO59Q07CtJFkCWf5/kPEEC78mkBAAA
 =
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7401;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=P0402Uz3TGlHgNTrUFPCtCcxzRvCHZS96bV6+P1WJZE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJkiOcvqqhaZzQtebHiWL3KbwN0ohsKQ0AcxbxY2tMbfr
 G75FXGoYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 hjrGOkYMXJwCMNV2Vxn+qWvvmalsuUr7mbkmTxgj94QZj97MYlyuOX3zCsdqccceB4b/hVsc/76
 5fDv6W223y9wp7bkbgv4utvZdu7Thxdsr29omcwMA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_031735_826447_89C4B7A1 
X-CRM114-Status: GOOD (  23.62  )
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
conflicts. Per [2], the hwmon driver should be merged along with the preceding
mfd patch adding the __SMC_KEY macro to avoid build errors.

Regards,

James

[1] https://lore.kernel.org/asahi/CAEg-Je84XxLWH7vznQmPRfjf6GxWOu75ZetwN7AdseAwfMLLrQ@mail.gmail.com/T/#t
[2] https://lore.kernel.org/asahi/20251106140050.GQ8064@google.com/

---
Changes in v5:
- Drop inadvertent mfd core includes in rtc and input drivers
- Link to v4: https://lore.kernel.org/r/20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com

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
 drivers/input/misc/macsmc-input.c        | 207 ++++++
 drivers/mfd/macsmc.c                     |   3 +
 drivers/rtc/Kconfig                      |  11 +
 drivers/rtc/Makefile                     |   1 +
 drivers/rtc/rtc-macsmc.c                 | 140 ++++
 include/linux/mfd/macsmc.h               |   1 +
 37 files changed, 1671 insertions(+)
---
base-commit: 24172e0d79900908cf5ebf366600616d29c9b417
change-id: 20250816-macsmc-subdevs-87032c017d0c

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>


