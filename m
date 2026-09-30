Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690FDCA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 09:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oGyaJVivWNa7+BTJdqSgJRNH8LjXxwlOXt4JHsGvrnY=; b=QsUZ7RBxd+ImGiYfMlkU23kor9
	nq85Xx4CDItyibuUjWrytgDJ0jV2AtujOS2+JrQP/dLcZiXQ1j+5oRyKDqd4KVKTNpqwT5JjEXej+
	B1J8dHz2XZKt+t6pa02KGO9sQ7WPDWEdYoAN0kZIGxjTfVYHf8FUas/CsEaVtmnk3EOYdwk+x6UdM
	WpE7CBGZn3xQFTrNaENDLP37WHEtzEjrSI7aEf4qPXLqkjfQLThF7D+kj5bYrUQH9+0rUB4aQ+K8F
	9oCGkayIXat+nMyUkVuAjviWgfhL5/nFpV7gdGtV0CH7+49w6i34uofNndkRL0BlIs732BCwIXrxn
	s1sdR+mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqz8-00000005ccX-00U6;
	Wed, 30 Sep 2026 09:52:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqyz-00000005cZo-3Y0B
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 09:52:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=oGyaJVivWNa7+BTJdqSgJRNH8LjXxwlOXt4JHsGvrnY=; b=TwOkY8kwIwF5ohuSsr2QWSYOPY
	RRewYEDJEkbSJ5lXZpqD0ZgzOHvgXtbLLP9tNwZA5JMa5mB0DV51hIfnm+TidRGUSfD9lu5LZ2Y5Z
	0ONbhXL7G5PSTj/8dBl3tSLsvKe4h4KGTXZYB13GlOPCm7MsntOJzGQldNHFcxOoLiZ2gU84lHkw9
	rIwDzteKhEUHbvaXVlMUXJzGQiLBf8hIVdJdfVVCoCSTwwo1Ybg/GMeVuMHCXZWVV2Af+yjDW1o+R
	K3kyDo66+xhvkycOEh3cZdYpC/cv7mbnMQbUEBAmOL+sT/BUi44kgzPhYZ1QwYDYOEfD+Tx43erS/
	UOd0kTlw==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBqyu-00000003be0-1Qsv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 09:52:12 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e721b5503so47851005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 02:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790761925; x=1791366725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oGyaJVivWNa7+BTJdqSgJRNH8LjXxwlOXt4JHsGvrnY=;
        b=hwflgs4Wr/FZRYvBrYKEKGaNbCdGkGaVccm+N48To6u7m/5anYEwfpvG/Pf9/6Cb3A
         LG77ioGCcfcK1gUJKRemynAWRA2GJShf15S7ys0EFByXEGAYEi2EnKQigZIw/8Oisyl6
         VLK3DJ4iEva+WaQqCs3Lz3k0lA4oNMmP21SjgltsgMM1o66ly9CtntlAp1yBFaqPIyi5
         j6ZRj8bfQHps8pMAC0AEgtKxY9nji7IWMq1ZuZmCkcuHndkfpDj0bshXNEQj5NoieZUl
         erAN7voXEWq7obzpQdRuBeBXlqfTT5Rgit48HwX9duqRb5fxQkZxFF853Kw9ciZEPDTd
         Qcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790761925; x=1791366725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oGyaJVivWNa7+BTJdqSgJRNH8LjXxwlOXt4JHsGvrnY=;
        b=kq3rYkxsM5Pr838+EuuZqkTun17WYm1AOhvdnSA0vlp2O3pBuUBYOlVZvboKtAWxB9
         O30Ec4diZd4xTGsKcqz56GjLTEkNR6adLBdcPGkEa5ckX6Y35pi9531ITljrfu7LxVLS
         34Kn5qR6wCCSi0GHVSyTG0AalNiBpwomm13yv0vk6Zk5Ix3HmKNvcb3WikXmqMl37SXm
         j53J2Bb3sGZJPSjP+mmSIVLvFPqV0YoI+1wzwXku4jO97fLYeeeVgVYEHW/kIee0tT28
         iJCpBrUdHUzoyoApTv9X4HiDG29d2D6WuhaTsXCfwJH3mUCU1aR7QpNytID14vprFctA
         CGsA==
X-Forwarded-Encrypted: i=1; AKwUvBx/k5sUIA2c53Eby4Y/EAK6xOxLygwOIf5L/AC0zCpXeiJCqy9d1GaR73F91wGCgtk+qniRgjze/Ipc5OYC8RKA@lists.infradead.org
X-Gm-Message-State: AFuF++lUE1b3jsjbnTHxpyIqMrF9SdC0+dtlDhGKGFJPzqEfEEY9+jWB
	kb86Lh7YkMWJjj3OhhFXSUIW2pzinXKXoIot9gn66ARJjVP+uyru2Ucv
X-Gm-Gg: AYBFou30m3Uf5EsTbp9fkgT3cH60undQDVpAcjD+HLkEuzKNT5szMopiVPakDUjNV58
	fe27NTLo7lCnGLMwsmd3Uc8LxbYfPYnFf5aW7QRJVRNsxXwzLeSJg+bWhLhnJuNfcyhPnOpXbfw
	uyOor/8aI/3/+rdx0QzFngLGO5s9R0HE6NcSOz3PyRVWBUOG6ZlMqcquHWtHM8qNB2ubCkz36Fa
	ku33ss/iTpG08NfC/gQ6UnaeJUcKHfdnMLifz24YWdXmOMLZEG0PkahAC2zZFtVkiSytb3EaSLk
	LwBDzDAM54cyB6P5OJERA54BtNlkRikHPwo4EbN38IRRvn8cb0MWeSpHkruOvHrXspPXjJhqzFE
	GEoL48M2bGIBddVcFhYjscl8CNnliO+sqoBv38uDttp2OPDxRt91ac5Mi6gUIDDieqFRjSlVPMa
	szG8WaNUso3t7GevFjyRzfhwdR9kZ7k3qC8lBPmrSlbtjuk3sGRo/2SXAInMQZD+UpcuMmRz6uV
	gniVZgPqdAn4XcQstG464m1xc1PJf5z/XC2yQ/oH6FNYFs=
X-Received: by 2002:a05:600c:8b21:b0:4a0:1b8d:3e58 with SMTP id 5b1f17b1804b1-4a01b8d4099mr9189045e9.14.1790761925200;
        Wed, 30 Sep 2026 02:52:05 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015abd9ffsm43859655e9.2.2026.09.30.02.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:52:04 -0700 (PDT)
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
Subject: [PATCH v8 0/2] Raspberry Pi 5 RTC driver
Date: Wed, 30 Sep 2026 11:52:01 +0200
Message-ID: <20260930095203.492949-1-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_105210_111161_FD10B6EB 
X-CRM114-Status: GOOD (  17.04  )
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
 drivers/firmware/raspberrypi.c                |  23 ++
 drivers/rtc/Kconfig                           |  12 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-raspberrypi.c                 | 279 ++++++++++++++++++
 5 files changed, 321 insertions(+)
 create mode 100644 drivers/rtc/rtc-raspberrypi.c


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.55.0


