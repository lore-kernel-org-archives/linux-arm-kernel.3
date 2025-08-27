Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3928ACA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5WsykdY4oidUQ2ahSl97Uv13s0w5qEG0f4eM1c++CGE=; b=XECNHYvH1uOpNp
	cBo8/xIDlTO7zdz1Kv3XiYgCMP53nnwe1Ov9KMdH4Qwd0VNDUX3u4VkLeaIibLi63oQh3QOlElIFC
	fBgwiQwymHD5EY1g3mzsC8P0Lai7IlG48totGnZlFQUCXP1ayO4YooE8+OcWM9P5UutzPyLcic+fd
	X+qk4O3et38xLdZ/v0f7pP0vsvnoB2s5eJNVR6Qvu+MhZQiKj8bILbBq6iKdhjlT5zzUxdqMhoUI5
	9gawp4qyXBfqlRtYNoEBdcW8lXs8uZLz7TdPFy5o8UjzAOsIzeH9aLw6c/pcE1Bp4K6kMUthuBJjc
	64sfJyuLYhPRoLSzw6Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIOR-0000000Fxzt-3fGf;
	Wed, 27 Aug 2025 15:48:59 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEEu-0000000FFOU-1Hz3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 11:22:53 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2449978aceaso48985325ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 04:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293771; x=1756898571; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5WsykdY4oidUQ2ahSl97Uv13s0w5qEG0f4eM1c++CGE=;
        b=DEHh4JZfh4+ub7UMsLkWlvZshoK7/Sjna4+YjQnI+TrJPty/Kgg2qX5/l4IxCGMjG+
         a/69FiRAjX/qOxtUWAUL9iuYFwvRrco8L9xfRPrfr740TJst62vcKipGW2wciPCjDHMp
         FpXo9Yy8Ft00RvEH/jnICe8iIVCzQFjND9P0gisVTCOKUCOtJHuzj3uu6W6kiKyhgwpf
         2QL02QlGUMXP0RLyBTWkwH9UykxKJa4LwZg7QR0GKJTvK0B0+v+Y0o5xpjzre43eW9Cw
         CibTaNhh3/yCsebSDyKt4dVF5OmthJPyGYzQ3rVqM6YAEc67619MSM/oEKwLx2xo9TaB
         LxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293771; x=1756898571;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5WsykdY4oidUQ2ahSl97Uv13s0w5qEG0f4eM1c++CGE=;
        b=wsHJJ4hROveWwGyLOGLzFFaPrI14s45sO0NGvMFBbbAZ6YxTRh6LAy7CJFJAVJB2n6
         cd77dB/HqS5C3zUfQzxrzn42i8BI88JKKRxgJyYWa/AuA9xfHM97bAcBa6w+PZaj1I83
         jKKbktsKjFltHO6IhOvy5zJgpHMbwaxX9BjxbgJD0lrZEzmDCPN0W1DWy9GjUzJTvcKB
         GqzbXCqG8Vd2xajpkZ3fhlfWBwLZCEznKmWw6hBZf9wTSYbaxZ200N7k9DLPFV8+OB3G
         msh4HLu7yVvjKjLQrRm4+TAKJX6AEPY173TPpWlhXN65z7fFzRKF3jsbQ47pz1xIjYvJ
         aw/w==
X-Forwarded-Encrypted: i=1; AJvYcCVUFkhHaU2vUGCacR07Ns264zgnnoI6nUIiDMeHLpHU5H5y7tWNiehsESmBQhaN+7cAMRwN6IC7w9z6F7VOgQKx@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh2YzEHh3XZV9usJk+yI4nBepkXCy35qa9CvIrcEEDZ1EL7V8Z
	JDXYQshgpi/NFVfyc9ep3UuYeLnMfdfT6uim3JOinepsQh1mvMGoh46/pHjuGAT1
X-Gm-Gg: ASbGncvEdMB+utJJ0DZQyPSwR8L3zOkds+GCJyy5QOk6GrIr2b2bfaKY0GRtUVbtoaE
	w1fOZF7ibDS2OQNVKB6YVK1xZBGBELUuYgDuqVKn/uVI+nM/e0u9PfDW/3CEiYn7fDtdE6EK6Lb
	lCQmWZRmUYafP7it7tAxZH8MBvALnm7uYtLKJgyovRzNNl9L+X8lCcGzFH00fOYLTVXoOudFres
	VUgtryOtUwWryLkq4s1CkkLwALuP5MPmPBZO302ngTf4ZbDO8OOjX3+uidlx/2CkrggzMKW1FG3
	1LCNZJcuNQ981sH+hvrc1SE/WrfX9Hcm+WEaues6u0C2qtk0HKZEPex0YR8jQWbtehpuYuHXFaJ
	jPOgrcs+Hy3gy9l4Xhd85iLQxyTnYWoM424YI9efG3ss0i7tKKzunH4gb3B6VOpSlLmUx3M3cL1
	W5SR+xcqe1AYp/9v3L
X-Google-Smtp-Source: AGHT+IElvLvJjhBIATwNxcehv3S3PxbMPKCGvTN/sn1Ljet+JleEGuW/z9D2QKJBapZe81dScV+ejg==
X-Received: by 2002:a17:903:380b:b0:240:6ae4:3695 with SMTP id d9443c01a7336-2462ee0cf11mr236066195ad.4.1756293771130;
        Wed, 27 Aug 2025 04:22:51 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm1819708a91.16.2025.08.27.04.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:22:50 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v2 00/11] mfd: macsmc: add rtc, hwmon and hid subdevices
Date: Wed, 27 Aug 2025 21:22:34 +1000
Message-Id: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHvqrmgC/13MywrCMBCF4VcpszaSpPTmyveQLupk2g6YVjIal
 JJ3NxbcuPwPnG8DocAkcCo2CBRZeF1y2EMBOA/LRIpdbrDaVro1tfIDikclz6ujKKptdGlRm8Z
 phHy6Bxr5tYOXPvfM8ljDe/ej+a4/qvunolFaVY0bayypGk13nvzAtyOuHvqU0gdx1TXurAAAA
 A==
X-Change-ID: 20250816-macsmc-subdevs-87032c017d0c
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>, 
 Mark Kettenis <kettenis@openbsd.org>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5218;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=BRAiQU0QVsPGvQQPoR9GAHwaWmPsrjb1BHI7yNFZ8XM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBnrXtXPmfh44oNsI75FYa69a2LmLVpXs22bxyzjG1XfX
 vBIevP6dJSyMIhxMciKKbJsaBLymG3EdrNfpHIvzBxWJpAhDFycAjARz0eMDH9D9etqFb/Pq/9+
 9NDe/Y7aZluOHnPIYq75E8T69+PBij2MDFukv3kcfiUwLW+ZnY/gx7Ctp0O5mFr+Zn3w470/Rbn
 mDisA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_042252_355605_30B5C233 
X-CRM114-Status: GOOD (  18.50  )
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
add a HID subdevice to handle them.

Note that this series is based on a branch with three additional commits
applied to add the parent SMC nodes to the relevant Devicetrees. This
was done to silence build errors. The series applies cleanly to 6.17-rc1.

Regards,

James

[1] https://lore.kernel.org/asahi/CAEg-Je84XxLWH7vznQmPRfjf6GxWOu75ZetwN7AdseAwfMLLrQ@mail.gmail.com/T/#t

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
Changes in v2:
- Added Rob's R-b tag to RTC DT binding
- Removed redundant nesting from hwmon DT binding
- Dedpulicated property definitions in hwmon DT schema
- Made label a required property for hwmon DT nodes
- Clarified semantics in hwmon DT schema definitions
- Split mfd tree changes into separate commits
- Fixed numerous style errors in hwmon driver
- Addressed Guenter's initial feedback on the hwmon driver
- Modified hwmon driver to reflect DT schema changes
- Added compatible property to hwmon node
- Link to v1: https://lore.kernel.org/r/20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com

---
Hector Martin (2):
      rtc: Add new rtc-macsmc driver for Apple Silicon Macs
      input: macsmc-hid: New driver to handle the Apple Mac SMC buttons/lid

James Calligeros (7):
      dt-bindings: hwmon: Add Apple System Management Controller hwmon schema
      mfd: macsmc: Wire up Apple SMC RTC subdevice
      hwmon: Add Apple Silicon SMC hwmon driver
      mfd: macsmc: Wire up Apple SMC hwmon subdevice
      mfd: macsmc: Wire up Apple SMC HID subdevice
      arm64: dts: apple: Add common hwmon sensors and fans
      arm64: dts: apple: t8103, t600x, t8112: Add common hwmon nodes to devices

Sven Peter (2):
      dt-bindings: rtc: Add Apple SMC RTC
      arm64: dts: apple: t8103,t600x,t8112: Add SMC RTC node

 .../bindings/hwmon/apple,smc-hwmon.yaml  | 132 ++++
 .../bindings/mfd/apple,smc.yaml          |  45 ++
 .../bindings/rtc/apple,smc-rtc.yaml      |  35 +
 MAINTAINERS                              |   5 +
 .../boot/dts/apple/hwmon-common.dtsi     |  37 ++
 .../boot/dts/apple/hwmon-fan-dual.dtsi   |  24 +
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi |  19 +
 .../boot/dts/apple/hwmon-laptop.dtsi     |  35 +
 .../boot/dts/apple/hwmon-mac-mini.dtsi   |  17 +
 .../arm64/boot/dts/apple/t6001-j375c.dts |   2 +
 .../arm64/boot/dts/apple/t6002-j375d.dts |   2 +
 .../arm64/boot/dts/apple/t600x-die0.dtsi |   6 +
 .../boot/dts/apple/t600x-j314-j316.dtsi  |   4 +
 .../arm64/boot/dts/apple/t600x-j375.dtsi |   2 +
 arch/arm64/boot/dts/apple/t8103-j274.dts |   2 +
 arch/arm64/boot/dts/apple/t8103-j293.dts |   3 +
 arch/arm64/boot/dts/apple/t8103-j313.dts |   2 +
 arch/arm64/boot/dts/apple/t8103-j456.dts |   2 +
 arch/arm64/boot/dts/apple/t8103-j457.dts |   2 +
 .../arm64/boot/dts/apple/t8103-jxxx.dtsi |   2 +
 arch/arm64/boot/dts/apple/t8103.dtsi     |   6 +
 arch/arm64/boot/dts/apple/t8112-j413.dts |   2 +
 arch/arm64/boot/dts/apple/t8112-j473.dts |   2 +
 arch/arm64/boot/dts/apple/t8112-j493.dts |   3 +
 .../arm64/boot/dts/apple/t8112-jxxx.dtsi |   2 +
 arch/arm64/boot/dts/apple/t8112.dtsi     |   6 +
 drivers/hwmon/Kconfig                    |  12 +
 drivers/hwmon/Makefile                   |   1 +
 drivers/hwmon/macsmc_hwmon.c             | 848 +++++++++++++++++++++++++
 drivers/input/misc/Kconfig               |  11 +
 drivers/input/misc/Makefile              |   1 +
 drivers/input/misc/macsmc-hid.c          | 209 ++++++
 drivers/mfd/macsmc.c                     |   3 +
 drivers/rtc/Kconfig                      |  11 +
 drivers/rtc/Makefile                     |   1 +
 drivers/rtc/rtc-macsmc.c                 | 141 ++++
 36 files changed, 1637 insertions(+)
---
base-commit: 876d6a70b24869f96ebc8672caf86cb4bae72927
change-id: 20250816-macsmc-subdevs-87032c017d0c

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>


