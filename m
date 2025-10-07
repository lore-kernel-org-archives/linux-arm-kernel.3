Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECA7CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 11:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eNPG8g2C/MjBcgwcjFgR+4meO7GrmvtOu/w3NJ8raMs=; b=j4zbtUUsbAO3jt
	Hx2oEn3iqxpj/uyEq8Dl184aK3p71np0YrMwjLGL2/+NT3WpbtQyd2yToRXsYzIk2ngJozqYbhp7E
	fpdulGxy7+z4f7tSDMXg1eybUUoXpWv41eirCe4xEHBLGsilfB9jZYJtvz9gyIUi3DLsbJ6+q0Mgb
	Pezty0o2i1nlqX5h30LkjmWutuzZDcNnRx47gE1OPh+mSFry62v/moIlheKzsydp0zFnBhUqzRcUj
	kXS8B3pwnoDXqRpk7y1WP7bY6p5H9w6y3zZ39XhGIzNxefXLDHHGaeAMCK/3CgK21J3eRaWAKoPrf
	xQ19TU19ibjX9lpqB/FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65h4-00000001r4q-0y9q;
	Tue, 07 Oct 2025 11:17:22 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65h2-00000001r4N-0p4S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 11:17:21 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2897522a1dfso60570725ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 04:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835839; x=1760440639; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eNPG8g2C/MjBcgwcjFgR+4meO7GrmvtOu/w3NJ8raMs=;
        b=BLUo6/Mj2ZHwmBXpQ/gaYIjXrgGY4OstZ/mvPUeeDOTMC5n8YmjEviLL7TXQoyooD1
         Jv0fMyirGTqKO3mmsZYHm1xo/a+ykeABPCK20Encw9LKK0P1C0/bIS8vZLHDcLahxRYZ
         r4H8A685BIqf133IumFdH6NBxIB66D1akOmqlbglMN1XONJm76auDnqAUxEvOwMdhwTO
         sTAW0X9FTfhnTjj6UtTiUfRYWVIuVojWplsCvD15avqZNfhup2kkDLXXm0NT1ZUj389a
         +VC/QjjtBv98y996rVO59h8gfh81od7/5VW8RsryAPNGcC2RDXzO2+TMICYwlIscDnHe
         D8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835839; x=1760440639;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eNPG8g2C/MjBcgwcjFgR+4meO7GrmvtOu/w3NJ8raMs=;
        b=BOB5a58vFioSkmO4qGUcv+wN0mugBN3TtTOcPkFATlrEmY5I1oXvlfHcosSse8/99d
         6zNSw8YiaAyg8101NaW+ljSLslshOckCsMVQd8JXK6Aoe9GCo4vEaZtkKPS9MPrf9+52
         oEF63o7u/FcRs1WbNH/2XfRMbLz4fz1Lyg8gUftMg2jzzuy6BtdAxo7/JQTUxGnyHTkd
         G2iLsDZuMm6aVCinCkiHBrd6JHlUQU+6LIaWWJvjGOJo3t3X0eK4zns/mIkB6JbQrSXi
         XU1rOjb+QbyWCtrb/tDy6dot1kpxZ/wbKyOS0xE7OUgH+941GQgcBDLN3VZpGlocG6TE
         AOlw==
X-Forwarded-Encrypted: i=1; AJvYcCXqFz2g+3yvvp0RJjkf6VmydqB/380rYMBOrnH54kP/eRjnwKiVdujFkXOsretKCq0bUl4iOooe4OAUtHp40OL+@lists.infradead.org
X-Gm-Message-State: AOJu0YwnhqVRMvz/VItzc+U/ztGprxzwM3C5E25xVONWSW3KxBLp+De7
	BinDmm1l/oa9iNq1ZUf32WAd+jQLVN/Qjm4twBJNXe/oJVVhQH2wZDHV
X-Gm-Gg: ASbGncsBS0cptKiJFtfHFDvAQRMxWyoDByRNvIMA8H2GSfsgLiKPLC4DAxiGxjYpIYk
	uuBV6U7jJkds6Y/GRqaiL1GS57ebWMwfQOUFKY+5T32STV5jDo2wYAMs3eJ2bFBSHhQ+ea5qqDn
	l/qRYth2pSGvYrpbsfwkV9AP5vmfxLn8vQFZg+crWe5MLBPOKAtf0zT2HeJUzve3+vT+1ovH4LW
	RegHq3Sgp9twS9WXAmhgiYTif7+L6hW2RDOWZdYiTwtOaLfK4iUrIUX/nVr61Q+UdJW8sc3WQCp
	jDIHmhXzQN4gGEADAOuB+RoS6Xv0EIh8uAIjbsQO3vBjSayZQr9XLlN91DbSTo4rDk2bbl2xnqC
	LCjUVZbiavUwGvPKRkSsuJpchPhX3rOiklPaCs0nVmPEVyFokc78Qa8XEvCcjFxjYrHzwlhLLjx
	Pr9M9R8I5K9GQBK/RgHIKDKW+DEON1ySm3UJKbqKXWRw==
X-Google-Smtp-Source: AGHT+IG/GlDlGMJXanFehOuQmiIBcouCj1tMidnpz7d4eBVLB7xu7Pq5DBctdYYycE/b48lWbFXOyw==
X-Received: by 2002:a17:903:1a4c:b0:278:9051:8ea9 with SMTP id d9443c01a7336-28e9a61a8f3mr184307865ad.40.1759835838888;
        Tue, 07 Oct 2025 04:17:18 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:17:18 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v3 00/13] mfd: macsmc: add rtc, hwmon and hid subdevices
Date: Tue, 07 Oct 2025 21:16:41 +1000
Message-Id: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJn25GgC/2XM0QqCMBTG8VeRXbfYZnOuq94jurCzow6axk6NQ
 nz3phBIXX4f/H8TI4weiR2LiUVMnvw45FHuCgZ9M3TIvcubKaG0qGXFQwMUgNPz6jARr40oFQh
 pnACWo3vE1r9W8HzJu/f0GON79ZNc3i9lf6kkueDauLaCEnUr7akLjb/tYQxsoZLa5Mr85Srng
 BqtdfoAqt7m8zx/AJTAT/XrAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6425;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=/PRiiqiF96PuWnwl9YA7Ti6MlqcyY9JOkSncfrz0x/4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm35ovnV2Nm5cIfwTpOjJgdy6x+4ih/Z4q784hrnD
 8fr+pIdHaUsDGJcDLJiiiwbmoQ8Zhux3ewXqdwLM4eVCWQIAxenAEzkxFKGv6IrDrZfkpTacISn
 deeNX1IahfWH9OaFvRNbep3hjkHdWwNGhoWNim96Xwb3XLneYhIfI94ulang8sMuTJQ1ZO1+/re
 LmQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_041720_245769_13D7B3EB 
X-CRM114-Status: GOOD (  21.07  )
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

This series originally cherry-picked three Devicetree commits to build
cleanly, however these have now been merged and were dropped.

Regards,

James

[1] https://lore.kernel.org/asahi/CAEg-Je84XxLWH7vznQmPRfjf6GxWOu75ZetwN7AdseAwfMLLrQ@mail.gmail.com/T/#t

---
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

James Calligeros (9):
      dt-bindings: hwmon: Add Apple System Management Controller hwmon schema
      mfd: macsmc: Wire up Apple SMC RTC subdevice
      mfd: macsmc: add new __SMC_KEY macro
      hwmon: Add Apple Silicon SMC hwmon driver
      mfd: macsmc: Wire up Apple SMC hwmon subdevice
      mfd: macsmc: Wire up Apple SMC input subdevice
      arm64: dts: apple: t8103, t8112, t60xx: add hwmon SMC subdevice
      arm64: dts: apple: Add common hwmon sensors and fans
      arm64: dts: apple: t8103, t60xx, t8112: Add common hwmon nodes to devices

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
 drivers/hwmon/macsmc-hwmon.c             | 850 +++++++++++++++++++++++++
 drivers/input/misc/Kconfig               |  11 +
 drivers/input/misc/Makefile              |   1 +
 drivers/input/misc/macsmc-input.c        | 208 ++++++
 drivers/mfd/macsmc.c                     |   3 +
 drivers/rtc/Kconfig                      |  11 +
 drivers/rtc/Makefile                     |   1 +
 drivers/rtc/rtc-macsmc.c                 | 141 ++++
 include/linux/mfd/macsmc.h               |   1 +
 37 files changed, 1672 insertions(+)
---
base-commit: c746c3b5169831d7fb032a1051d8b45592ae8d78
change-id: 20250816-macsmc-subdevs-87032c017d0c

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>


