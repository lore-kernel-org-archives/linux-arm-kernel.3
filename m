Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58828CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 14:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FaZa4M6CxbX6pzPM8uUMfQ1ohGFtVIghvpFJuewWws8=; b=autfpnkzQ9gwkW
	Y6H6Q+8tugCVtjv+SOWHK3rspD0P1KpPM2WetYYyM3p31ovybruOVnrJdfyc81K9Me2WUySmcA/9/
	YTc1WJ9/AeIbwR6Rvl/FudVjOwwaZBzlh7nYCqRLy88TTY6iLTzuWjfzDPMs0fgui/2tMIbNgev+U
	3C21MI6vfsa2w7K60dWL5eLaUkeg6FDDXADFG9jHRpUYHo6h8L4cF83CtXlnrlO2JXxud33ou8dCI
	4OGyKSE7/mpHIZTn++N7JA9qX5E1s5l0lbm/kVMsmWCqHwOeYbMGh+mNcJbiYfYt6mN6P4Ue/v1Wj
	fPRSfDVQ/3wtzd2qbuOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoN8f-0000000Aj34-2VIO;
	Tue, 19 Aug 2025 14:16:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKp3-0000000AKkQ-0vrr
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 19 Aug 2025 11:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=FaZa4M6CxbX6pzPM8uUMfQ1ohGFtVIghvpFJuewWws8=; b=Hrv/n+YDz6Adi6kEGYdS4rvMRl
	aOh2PT00WmTahCvUQbDnex7MzbQvaW0sgZjEpXhI5Tv8dvgLZq8c7Gg9ajJMzObWbM01+clnuEDWw
	5yWdeQU0wV3umvdc4jdv1bGANX+7j7ZTna+feQMPk4ElxLHC/VrEg7drcN6Qj050B46cvNTNIVjew
	oCrRhNct7xbJg+sn/kyCenlstLgZMaC2+3pbUvM3oj/20PIn4D7Y260KjalefAvRhBglKEACPesWs
	aV5cRgZIe8dKbr+g4q0dtInxyF+TaTOOKp6ZW1UEtsqVmxV3N0JBp+HCN/1vQHhdmd7rnBOQZkOZs
	HPKgUFpw==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKoz-000000001Ya-3Z4s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 11:48:12 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-76e434a0118so3766162b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 04:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755604087; x=1756208887; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FaZa4M6CxbX6pzPM8uUMfQ1ohGFtVIghvpFJuewWws8=;
        b=lUfsv1GsjwQI4CF8Mf668G6EtZd60cJkEGaqed+lycCmO1YuMD4+fyoMszDwHB9XQV
         2VkXLLY9ZGIGuXecjXKXHrFJckEStQdrsASypPCurwjoTXA+XyRJtDPX4lXNKH7WZyN+
         sBMnSCnsPyeiJIP2dXPFYSzmFNb1wnHFgT13izt965dd9n7y85gqq2h3HBOeF7x1VXZo
         L9vQumOv31DdWHFZ0WQSG4VWFcMmMH6M4mVTIwpp9B4jBL/k99mHvpPhUI2K2bcOBq2z
         5RScMvM4dsvVWXrN3RCS1Bz+07Lx/BuNdJHvGFs27tmW566PuNyej92/rLKlgZbah8VM
         FAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604087; x=1756208887;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FaZa4M6CxbX6pzPM8uUMfQ1ohGFtVIghvpFJuewWws8=;
        b=ROK2EkDvYSmopCxAULZBnhxLAF+bycrusRoObD6iyMIukHNT1QDYZIkF1MFUPga1nt
         TzAHZk0JJ2E8+4PGJlYXenTJ22ivbfcxVc4PT5hUf+Vc1/z61T91rFtlZs4fwEUIEu3C
         E+aimVf5NXgfZ4vylkQ/P+WjTsqZlyKP7I5ynzIvFDrt+jHExQdRfcjJN2baJsog8KEt
         j/jgUDKBnMSSJqmsbv19tLRj9Ix6LxmX9uUx6lanfxZ7z3q/UkMb7VTLZv28gdUC2e43
         gS2+hBedZxOhCgnk36sUp+1RlfisOd7gOAJ0P0CVYb/SR9Z/AYDNOmrq+jfp3mcujQlM
         b/NA==
X-Forwarded-Encrypted: i=1; AJvYcCWFnUaJ4mLUKnlALTqc4IgR5THRa30Kbw9Rhc03MsMjK2HJkNeCNTn9i8xIPdJ/gA2pcZSXtfiBDr8ElNGbWgt/@lists.infradead.org
X-Gm-Message-State: AOJu0YzdY9oLAxR5PVSAKEM/PVHYWB5InZawkD0rMFRz1QbwA0fIHSlm
	7x869iaN+baL3GoyD5H3eJT8ubRAjfNTf+13PNosZiU1TcFDEqjDG1IL
X-Gm-Gg: ASbGncsG9JMm0839iRvL6gxfG77Zd+XxmuTPiCIjUdrd+EzSeK7lnOxpd1ylIz+AXzE
	loWPBqu/KeHZeqQhQeHlkSrS50JWC2wb0U9S8jjeTsc5cbjt6LdyO7ZtVALf2VQtqiM8lzYBO3U
	CgEghhDYIB37t8/Vos4mlG6nch7nWQLP9z7ginb3T7k5lYiL5JxJTt49ymGXNZ3OguRPO160Ait
	qHJXVDXEzT98FrQrx7CvjS+YPe1N+ZdeEK9y0X8U6BHgzjOhFk3pwvN/eWC4Pet9BtXz4kQblGv
	uMXiSSdh9Qay3oJVrCLy6unpiPWJ0zpmVIrQOsRdQYH9+ahf5CuXUt8zi6SfyhPVCT9QRM8897O
	nNMQRlkcW9GtqRa3dXNs80G3TiSXBDPM/sxQfNZ8BZ0pjLshJmF1WF3DDivaPp4cC7/ksKgSRQd
	TV5qT17OZi/wNTLMCYHgz8OGU9Phz4q/w7vJ+M
X-Google-Smtp-Source: AGHT+IHTftf4N5GtR12Y+/exYwqwrBeyGH7smZ0yJma1RxTQV8AhvHtCqyA7wcE9I8tc1xaJxOtv7w==
X-Received: by 2002:a05:6a20:3943:b0:23d:ac50:333e with SMTP id adf61e73a8af0-2430d4d57b3mr3359435637.43.1755604087256;
        Tue, 19 Aug 2025 04:48:07 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d76a430sm10286316a12.43.2025.08.19.04.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:48:06 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH 0/8] mfd: macsmc: add rtc, hwmon and hid subdevices
Date: Tue, 19 Aug 2025 21:47:52 +1000
Message-Id: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGhkpGgC/x3MPQqAMAxA4atIZgtpRSteRRw0jZrBHxoUQXp3i
 +M3vPeCchRW6IoXIt+icuwZtiyA1nFf2EjIBoeuxtY2ZhtJNzJ6TYFvNa3HyhFaH5AgR2fkWZ5
 /2A8pfUSAoVdgAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4439;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=7ZN9mquuvmQGhl/5cAieHoqLnblhiM9pvWAqAoyRNDU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlLUvIqW5TYMuxC+++cFnu1f/ZGP9Mf0p8qr9deu7V4e
 rnMe6abHaUsDGJcDLJiiiwbmoQ8Zhux3ewXqdwLM4eVCWQIAxenAEwkRpaR4UURzySBlincJoWh
 R9jTOSdsW5V8vn/eA7aJYZ0PeO6ohTAy/Pxw89OhxYoaU2boSRx6daOlcFV1cd+FzxpbulfdsZJ
 /zAMA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_124810_143550_521DE2C5 
X-CRM114-Status: GOOD (  17.55  )
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
Hector Martin (2):
      rtc: Add new rtc-macsmc driver for Apple Silicon Macs
      input: macsmc-hid: New driver to handle the Apple Mac SMC buttons/lid

James Calligeros (4):
      dt-bindings: hwmon: add Apple System Management Controller hwmon schema
      hwmon: Add Apple Silicon SMC hwmon driver
      arm64: dts: apple: add common hwmon sensors and fans
      arm64: dts: apple: t8103, t600x, t8112: add common hwmon nodes to devices

Sven Peter (2):
      dt-bindings: rtc: Add Apple SMC RTC
      arm64: dts: apple: t8103,t600x,t8112: Add SMC RTC node

 .../bindings/hwmon/apple,smc-hwmon.yaml  | 148 +++++
 .../bindings/mfd/apple,smc.yaml          |  54 ++
 .../bindings/rtc/apple,smc-rtc.yaml      |  35 +
 MAINTAINERS                              |   5 +
 .../boot/dts/apple/hwmon-common.dtsi     |  46 ++
 .../boot/dts/apple/hwmon-fan-dual.dtsi   |  27 +
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi |  21 +
 .../boot/dts/apple/hwmon-laptop.dtsi     |  43 ++
 .../boot/dts/apple/hwmon-mac-mini.dtsi   |  19 +
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
 drivers/hwmon/macsmc_hwmon.c             | 858 +++++++++++++++++++++++++
 drivers/input/misc/Kconfig               |  11 +
 drivers/input/misc/Makefile              |   1 +
 drivers/input/misc/macsmc-hid.c          | 210 ++++++
 drivers/mfd/macsmc.c                     |   3 +
 drivers/rtc/Kconfig                      |  11 +
 drivers/rtc/Makefile                     |   1 +
 drivers/rtc/rtc-macsmc.c                 | 141 ++++
 36 files changed, 1697 insertions(+)
---
base-commit: 876d6a70b24869f96ebc8672caf86cb4bae72927
change-id: 20250816-macsmc-subdevs-87032c017d0c

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>


