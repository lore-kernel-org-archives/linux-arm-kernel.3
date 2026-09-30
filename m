Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22108CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 08:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IGBjcoy4aeNTw10s5CjkbJAmRuqjAutFBgcl06eNiGA=; b=dYNjV0iOBf19dl/f27ThqTc0w5
	B/FvHNLXsmghxio+h6VQxhrLy0+ktXcQVezpuuPqr105zxXaG0vYY0hE0NPyPzWintyrxhhuBVPK2
	RYnYcw9o3o74wp9QhK/5s1Rdp0J8FXX1VHUHTo4LZPv9AEKnwrncFKC/Q4n+VWXUohiUOhrBbOLQm
	ZYlVhd0zQkfj7Asnu3uKkWmS5Dt9cNZcwWW9ck5K6Qx7boP8YqdCOHGKeJAGpW8po12370H1Ne4Mv
	/5boGounERrQNC54k3ZtgLnUoFNAxNni8xzjI2qJmuEQ38RAmdWAg/3tb0DmDl7Y5ZBs2iCXNb1ir
	bdxkWTIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpr3-00000005SDe-2A8W;
	Wed, 30 Sep 2026 08:39:57 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpqz-00000005SBu-2Geo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 08:39:55 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-488811c9ebaso2521397f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 01:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790757592; x=1791362392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IGBjcoy4aeNTw10s5CjkbJAmRuqjAutFBgcl06eNiGA=;
        b=pabT+ylbV5TIDeLftxMXcU+wFeGQyAwBEDkhr6o/SVKlL2nFxGIdfbcFNFBAqjSY85
         6kI8aTbfKvaPJFXK4n3v0+Pb4zMV/E+SXzuwutKVhea32LDLNq6bGqVZggItKDozQJ8P
         7uNLwRglhHsT69IxPJWnS2msMv3IJmqB6h/0j86Q/V8yEJTgrEUiA27Za7EAhXY/Pv00
         vsx3LbPTDrDVRA7ap8N3WkT6uv1Cy/om0GG0jc5UseyA9+mLcY/eD1uKii2nEkSo+YQM
         sxfqdw49rd0isuDrvhDgsBqpqS8+LpJ376BnjlPW6igkX6KOpaQO3UDiqpClMDbFgMvN
         fjww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790757592; x=1791362392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGBjcoy4aeNTw10s5CjkbJAmRuqjAutFBgcl06eNiGA=;
        b=E74bRODK+vKt175z6Av8/+IEvRGDbnpnA02EWO5Ai4CCmYvga6fMlXMdPuMhILmgxS
         Q3ADx7Y76jK3yxcL07iZe4AbIoUj/Tmy0iTh0LA0e5sRvtLTvEU6lALjxrpUCqFexXoi
         68Fzb92ejiIMTrDrx0iebMvlco1tvU6kOncDrbFeTwNOHPdQ1nAgxm304EqcSqhJHnDM
         n/Xr7LVfeqV+KqfQxAUQIcqi6com9vj8ZzHJ1RYcDFz4ijM4uNppaN3Hb7+MRR/Y4IzL
         SRAl4LTrEan1dGGyBtk48299Znu6ScZp7jmgqqr/YLmUv2CpkeFft1ElNZhaZJ9Mjw5T
         54nw==
X-Forwarded-Encrypted: i=1; AKwUvBzb6ZqbSn1KYcfO2yge1RZEGHhcZhHLWexWvLZguy2N3Myez9JI6gJvVEaKDMBYZie6TS08HeYKmi6sX4ob+dt5@lists.infradead.org
X-Gm-Message-State: AFq9FYIJPryCuRQ504rFIe/EAMlWBq8XX1qAGw7WSjKW/HFE6apSObZZ
	XOjWLbslqoaBqF8XFvXe1qfgFueUdx06m8R4dcUzeMmFDNlZi2INe1oH
X-Gm-Gg: AYBFou3sU9FhJExRH6IhA/MZNWAuvtxEwdrWeJPcisAVpwp15nuVzdAsxw895WKpAlX
	fg0arewMS1XYzzcL9u4YfpPRCCeOJOWWHff9gXQ0W0BVRXXfyD+3YSRlQmrQfBdSPhLU42YbggH
	XtYD33303ogB/UzSF81t7TWelFgD9n/+y/hJizyNdNQRArItGe5dLxoDoDKrOmVFiz4sKgofiUn
	1ckG8sHxqk2N/Kplc634CyfM3emCrJ4YGylqOYb3VvFzv/DkGDlkXL0pZXGeyCsnv+pdvAkgY8F
	Mj1aIajm96qJnY1q4sbUdOtrlmUHANiB3ii3L2gHISDAdopgt6YOOFp4izXoPGiq/R/11nnGcFu
	fbBuR9WQ+CySouFGRzFP2HzPy12ePGA2/SkRg3K9erU+8RlIaQe3nY1diqHTbPohMGwHeX1HkDK
	N8OuEdnk8x1A866OySl4/9npaxPqWX+DoOx0zavX+LbScKgU3HlEkahOg71bqtX3vT9k4p/rm4p
	0aMRKrWFBWyo7B00Xif26/PXQmFWstw7tGIAbNtybMPKv8sLKQs6KkY
X-Received: by 2002:a05:6000:2301:b0:488:89ed:4430 with SMTP id ffacd0b85a97d-48b02522f7bmr1523610f8f.33.1790757591711;
        Wed, 30 Sep 2026 01:39:51 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029bfd2bsm1757325f8f.11.2026.09.30.01.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:39:50 -0700 (PDT)
From: Sander Speetjens <sander.speetjens@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sander.speetjens@gmail.com,
	pbrobinson@gmail.com
Subject: [PATCH v7 0/2] Raspberry Pi 5 RTC driver
Date: Wed, 30 Sep 2026 10:39:20 +0200
Message-ID: <20260930083922.484885-1-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_013953_594297_33D15D61 
X-CRM114-Status: GOOD (  15.28  )
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

The Raspberry Pi 5 has a battery-backed RTC located
on the DA9091 PMIC accessed via the I2C bus[1].
Access to the RTC is provided exclusively through the VideoCore firmware
mailbox interface (not via a direct I2C register interface).

As stated by jamesh on the Rasperry Pi forum [2],
"There are no plans to release a public datasheet for the DA9091."
So we are stuck with the firmware interface for now.
PhilE also states that "The firmware needs full control of the DA9091,
sometimes with extremely low latency,
otherwise there's a risk the supply could just cut the power."

This series adds:
  - a DT property for the charging voltage of the RTC battery
  - the RTC driver that talks to the firmware

The driver and binding are based on (and largely taken from) the
downstream Raspberry Pi kernel. The main changes for upstream are
the addition of a dt binding property for setting the charging voltage and
binding the driver from the raspberrypi-firmware driver instead of from
the DT.

The driver supports time read/write, alarm, and optional trickle
charging voltage configuration via the device-tree.

Testing
- Hardware: Raspberry Pi 5 Model B revC
- Kernel: v7.2
- dt_binding_check: passed
- Basic RTC operations (read/write time, alarm) verified

[1] https://www.raspberrypi.com/news/introducing-raspberry-pi-5/
[2] https://forums.raspberrypi.com/viewtopic.php?t=359073

Sander Speetjens (2):
  dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
  rtc: Add Raspberry Pi 5 RTC driver

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml |   6 +
 drivers/firmware/raspberrypi.c                |  25 ++
 drivers/rtc/Kconfig                           |  12 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-raspberrypi.c                 | 279 ++++++++++++++++++
 5 files changed, 323 insertions(+)
 create mode 100644 drivers/rtc/rtc-raspberrypi.c


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.55.0


