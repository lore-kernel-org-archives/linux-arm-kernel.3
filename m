Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F24BCCF2D3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 14:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LaMWXGY4wl0wzFsEiSc/F+H9DwdFVduiP9XS0WHG/PE=; b=d/RXHyhNQEUbJXeCMEqn4Jah4W
	Y5jffZbmhMYFVKSn5s6+ZtqvoIcrhWMfV0zKm2C0o9dhMC+86p2l0nB1PVO+L9Dv6sf2rQ/dokigD
	IUBruTzxn5TYT3RNXWP9kDWZo1FO7Pu+3zqP2l39sjLFhznz9OS4f9FZr2yrMjvcyHysrYTlOEcbH
	9JRhT9IOWeSITm6wkB5UHRn3qxmB5ItondCx7F5F1AewtWegrq+parL6hTM9gyTSsKyCEZNjX9vYg
	YZoidnr+nr4ZzoBGNgw229Vqn8EuWV1eN2EnovkCw5usNKtducM0SKB7HS5d0xkFXlM3dEFQdjQnq
	+oiV++dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIS1T-00000005wsh-3pJd;
	Sun, 18 Oct 2026 14:38:03 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIS1J-00000005wof-3uNp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 14:37:56 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48bbb06e746so536034f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 07:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792334271; x=1792939071; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LaMWXGY4wl0wzFsEiSc/F+H9DwdFVduiP9XS0WHG/PE=;
        b=eCp0FjWE7m8lPaWCk1R/dSuLKVSoQZ5PjBM3WOQR8PvNuXyAqvJYhyiZ2xhun+nvtc
         +HVti1z27haCdTX7fdP8ZamLIyTgY+yioikSKCjk2r0jd4IoJPJkvQ1efi7u4d30TQYi
         jJ/wrAe0KB/7SmKkvK81L5JSHrEhi8FPNXWDK1klTo224yo4REB7lSbc9MW0y2JDRDhV
         lsvxxu3tIh/7xfh2em2PZnCYaiklo0cvtYeHjzYY92xbZ7YZkTw4/eA73hjMWpFK0LvY
         tOtloUhg8FRVtFSxeBvuOBbJeiqZq0tVQqQeQ+9BlWggLLoxTOzQgzw/CWxri0YTgIOT
         UdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792334271; x=1792939071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LaMWXGY4wl0wzFsEiSc/F+H9DwdFVduiP9XS0WHG/PE=;
        b=NDYjIQ55l6DpGYLvptLRQ4+n1jylhbbYCd15IwfuTvCdFnSAS0are/aOw5fO/I7w+K
         aNu8E0PDQZrv8Q9m9NZmmLZMcCyXSvHWivLwLgS4oR/+FpPrSmAKBvncTloBXZXaf5MA
         q9SymibnI6rvxUB3kdYbR36bNR7JZhxIa/HlqRJpD9/1hfB3C8CodQ6wOsmIVr/UPtzC
         yq/ZIxoPMH7DXm5nwbqq1lcETvB1LM2cg3yRYUuy0zl9RJQZFZ1DMwcQG9qgdkP1Fstg
         O/8dS3kf6jAgJeAMIKx7P1pIvQ9ca+jCeG+qyxcjplQlGHtUP4dJaU7P3NgLAmii6f1X
         VosQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4YOw7cf7koo41Gby7JXJmII0eQaaO2JqlRxmp3gxifq06D83yZO0E2d+bENwi84OHc6IUfOwviczUD94IXTas@lists.infradead.org
X-Gm-Message-State: AFq9FYJAdDaDmO6fGnFr/QVc6gaws/Yxw8xpU1bizpRfufcdqO8hsm0T
	M7XYJSBmsX8yWoHpaXkEbnAUt4gh7NBdt7OaeLooX4DW2H0hNYBVv05M
X-Gm-Gg: AYBFou3djw52gVXUbnUOuGrJCCnTz+5bmFWjgmIV4gEzkaFhZ6/LL6vPtBA4jdljb38
	z11WTaLfKltfTx2lvhGzybpeC8qp0IvU1c+LlSg/SkhgN4KcuceTWcYbTM4KTVFwA9aUJybOkVV
	6xtbWgjDovXEtp7JDLSxKmVJizef6HAO1oRx4fGC3sUtNflVTJnGI7WIE7wAHrQ6s0+sBlAryqe
	A8x87+kiHK7StBXr+ixBnBvsUMNJhe/rFExHy7SDFJk6rReqA5M2BixnqlWUp/d5l3Og+6PtZXD
	6zOFJQ8TJZB8ScG/AgqlIZzmahVTjCcYnnoeX9hpxqh+YbrYXBTp/W2YY7mifeAormCPQHPKsg5
	rheKMQSHNQPmq/pYStrOpKDICdzswQ0N0cpWVB2KmKcLr+mCKtKVNyAaxjEUWVKOa4sN0zvOhRW
	0Li3kK5eXByr2dUt+2r+hjus27HYhUUmD1BV4AT1meqRhBzBimd7j4qhZ6Ls58Jsc9736DC3g5G
	CkXbYHABcETTAv0HnHL8QLPle9dldTrZkx/YPsmW1LlLA==
X-Received: by 2002:a05:600c:314f:b0:4a1:e6c5:e44c with SMTP id 5b1f17b1804b1-4a1e6c5e47amr12571315e9.10.1792334270968;
        Sun, 18 Oct 2026 07:37:50 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510d60sm16559652f8f.58.2026.10.18.07.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:37:50 -0700 (PDT)
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
Subject: [PATCH v12 0/3] Raspberry Pi 5 RTC driver
Date: Sun, 18 Oct 2026 16:37:09 +0200
Message-ID: <20261018143712.1040152-1-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_073753_989266_A131A44D 
X-CRM114-Status: GOOD (  15.72  )
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

Sander Speetjens (3):
  dt-bindings: rtc: Add missing type to trickle-voltage-millivolt
  dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
  rtc: Add Raspberry Pi 5 RTC driver

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml |   6 +
 .../devicetree/bindings/rtc/rtc.yaml          |   1 +
 drivers/firmware/raspberrypi.c                |  24 ++
 drivers/rtc/Kconfig                           |  12 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-raspberrypi.c                 | 278 ++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h    |   2 +
 7 files changed, 324 insertions(+)
 create mode 100644 drivers/rtc/rtc-raspberrypi.c


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.56.0


