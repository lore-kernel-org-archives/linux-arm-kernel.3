Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC264C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 13:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O5IhnPgW4pLNq49awgTAAmlkGTKl3vSsqH3Qb0oXmSU=; b=RRmIFiIUF01aq05CfToFLvfmf0
	WcCCi3kS8ALPVWgYdSnb7VTgus+zUB8RHC/W1xjdb+X5NBrgv/gk0AVjJAfb1GTcDfkHv4vUvR2cA
	YuwpaWzgIN0K77Zr3VzV2ld+Fk9WsDJFj2Me8rTeLe6dFG7u5s9dlXK01uTiWoSdugwo4hwwOxcJb
	UViS5aQD30gozAs5jMBWrvobjHT17n9MdwEEWugXVm2xLfGJrBkLoIzSkiFhZkkC/7t/xi4Y6ObbE
	W8PrzKNQP7k+VDAVVR6mKGg3Gbmix0ygxH68W5lq7RM17Hu5PdhXqCGxOhJrZU+YJ8bAMJjoYfW/r
	hHdzLY8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Cdc-0000000BTlq-1eN5;
	Thu, 17 Sep 2026 13:58:56 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7CdU-0000000BThL-0dil
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 13:58:50 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843172bff4so507370f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 06:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789653526; x=1790258326; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O5IhnPgW4pLNq49awgTAAmlkGTKl3vSsqH3Qb0oXmSU=;
        b=YOS5Jg614iLlTgh39p03gy0DlYChA5DAZdOL4jCZNKM6u0kw94teRtBYkD3ZVu6Nwt
         cLuCbIxnEAWuaDr8PMy73MC+KZYGIUKtEkaKd6n+j2W4amqfgeWVTxura/Pl7YsEt0ff
         v4lIJT+TQe5ckkR1RCqdHxXLfyBF2a/sd7wvZWeXGAeHNBjM/WxNmk6z3179CTCm7cO9
         AedikpAZUSCufPx8yQ4SyGerebVsJGtAFKWzqWUKsV7lwSLR71/VihoSeA5Q3WVcNJO1
         5xikFxuq558O9ZtPaYM58IYremJnLtWls0FIUkMwqa4gGP1q9QFzRoNrQYwAILEuLZCm
         Rz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789653526; x=1790258326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O5IhnPgW4pLNq49awgTAAmlkGTKl3vSsqH3Qb0oXmSU=;
        b=Rp5bSYlBBRe24wSEdxFWCmfpEFgWsDSmy9jdErjTlL55LkuC0fWVqha3qtt1apfY02
         UNP9WuwBBcXzQt3Rsuxr1nJWZhp8egmagcqn1eED15thnBEqdLTdeX/BzPZmU8KInqH8
         BsCOun83w3krS+mivMRNdpLIr7NUVh1dIY8eJsfR0z2v2I1CEHVZASjQyvBmV6Nn+3Pr
         JU3vG2TebkZ63I1XTKqtE5Ac9hNHW3yguxnPtszcre1US+i0JRMhIGD8tPEmxSmuNe1d
         +s7i9cRPTDF/xgvtV7oDDD5wmCS6VzxeKr+J/BE8/ghhrPUG/DV3uZAxWEOTN71sQWkU
         4SdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzq8a2CLeHqd/owiz7GpKDrRqmYe92rT9/vGrj8szYvaglJHsgle31fpVChqX2enR/0ZJPuDDpxkNwnTiB8dbok@lists.infradead.org
X-Gm-Message-State: AFuF++klXs1prFKHscoGWWLJb6HFt4NdFpvNMgVKmVgbJisohYzO1E/B
	fWwbLGeydTF09AU0RUCloMudbFAWORPfsiTpmWDUYDmWRo4BeM4PDnwp
X-Gm-Gg: AYBFou2p0A45J2XoeoP4MQ1/Ev1Vzn4rpVJgs2oiyxswTofULtMjRt0uZPzzgxtdil7
	bUugpl8o7m82atzUuSIZUbhTP88MrNvB1EjDV/tsv8GR/9h3v+RgcPAj/T4Pvgwlihpya5xs54l
	7pj/nREJczD3THiVDGShISexTCDxxT7h0JUpH7Pt4rbCoB+sF96guPFKxNWj4yX++7ynklohEwd
	uTRHoag55Tc5mK9oKJ5+RX8DQUG8XWGdKt1pkfPuSanrNPvH/kH2u9fbaUl7KqepzR438oNSohE
	trBKkv+GK1B6OLhM6DHJbbNKbzXyPqEbkE6GFHfusTRbwRp4n7aJOF3sUaWeRGyLBzhXMzZ/7Qb
	wqEn4DYasmMqRR8IMJ+x+Q2lIGAszbpqJEu+s5+ue7uXhWkD3c4q8GRgJLE/O4+eJkpxSX8l/Dr
	yItF+IGd1cFK0Ndz07dUAEzMvL5asoLRHj66JYfZK21dGuDkfxu8w6+OfwL48mH6Gftd7GnAYWJ
	vwZOPT1g6xdWCMBTzytQ3XV9DdKzEjWKA0SfhJwAdB7Jg==
X-Received: by 2002:a05:6000:60e:b0:486:e901:e59 with SMTP id ffacd0b85a97d-4870d05a86emr9440738f8f.31.1789653526020;
        Thu, 17 Sep 2026 06:58:46 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf414c3sm12851706f8f.30.2026.09.17.06.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:58:45 -0700 (PDT)
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
	sander.speetjens@gmail.com
Subject: [PATCH v3 0/2] Raspberry Pi 5 RTC driver
Date: Thu, 17 Sep 2026 15:58:39 +0200
Message-ID: <20260917135841.841680-1-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_065848_241889_2D3B5E5C 
X-CRM114-Status: GOOD (  14.90  )
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

The Raspberry Pi 5 has a battery-backed RTC located on the DA9091 PMIC accessed via the I2C bus[1].
Access to the RTC is provided exclusively through the VideoCore firmware
mailbox interface (not via a direct I2C register interface).

As stated by jamesh on the Rasperry Pi forum [2], "There are no plans to release a public datasheet for the DA9091." So we are stuck with the firmware interface for now. PhilE also states that "The firmware needs full control of the DA9091, sometimes with extremely low latency, otherwise there's a risk the supply could just cut the power."

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
-------
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
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-raspberrypi.c                 | 272 ++++++++++++++++++
 5 files changed, 315 insertions(+)
 create mode 100644 drivers/rtc/rtc-raspberrypi.c


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.55.0


