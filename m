Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA795CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 08:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cQrhVOMwNqoVIytixPfhP0MphHNQ9fMhJFoWlxHFbYI=; b=qupveBZqovjkPAWp7rHzJFYbFS
	ZxwsgykqgRl6R+TQtoCpOWYasIF68v47jP4NlPbtomPFsvuV97We9c7fl0T2tmELwHMYK6Zn+ksUf
	RY2ztYz2ArFmkcUJxVvXJmhKPoMkVPShR+1m5QTo1SYUnZqcpijAS2IMq2h6ewKn+TCQ/k/rSVEG3
	XfNpW7MPjgcryOynNt8wqABAGFPVovMu4eTYZ+UkYkb5hacHhVWQ6ed/xm7f/+ge3bnZaqAbPL62M
	Wu2vdkJ0kZB9A8V2ETDKNR6KTBvtNSsuHlc1YLZ1HfHlIe8tqKQGAFR6hrlMaIR02A1UrAYeG0JVJ
	uYhUGGxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuNu-0000000Etcf-23BW;
	Wed, 14 Oct 2026 08:30:50 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuNf-0000000EtTP-06ec
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 08:30:43 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso6340625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 01:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791966632; x=1792571432; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cQrhVOMwNqoVIytixPfhP0MphHNQ9fMhJFoWlxHFbYI=;
        b=VYyELp0oYB8VcSFqhYogvNWA0oev/dTpmr/5w9isP7W/LLERty6I9K9ZaI15rwrPgM
         epE6zQwvCUOTpt1lqzpUxj6tT4A2+Xs0O6YKYTPdmduRSjcdFvqM9C7sRgO9WeCcbxJW
         PRZU1kkfJMTicH+E/ci69VdjyT8k1gtEE2Rr8fu17bid+9d926l2O6lJUKfL/Q4cFSHT
         nlFKC7+uOlgVBh0+lUI+13unjlXSGv59//yCStBtgcWmH4GTtVgbhQ+5GmJSGkBm3h9c
         bQE4m8IuHgLWSBKxl9x4JYpTbVHa8wDhM+klX4NduM1TZxQkqkDvX6CqF6eXoTNFrYVj
         MT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966632; x=1792571432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cQrhVOMwNqoVIytixPfhP0MphHNQ9fMhJFoWlxHFbYI=;
        b=BtLG9WNvMEbiCGhcgOHK8iR4XRbp4ck4kGxK1+ACSr35RO4k736KdrxcpFP+LSZjcA
         VoN2vxwVBnYOWwK0KDvdouvahcZwYI5blwCjhJsLGCptgoMzK8JQLJ5gYPFQG2aSaQsM
         aLLjIssNt7I8kwGAsSUq/FpHfL/oWuJz47EWFCMJrAWkqmsjK2ogGwYxceZTxvgKAyhI
         b6n9cWKoIjf6K67F/NK0732wl553Kh3dz9rEITts+hv4eyAejs5mmThSjlxS15SWCDAo
         /MNcA6UrAlKSHol41/4UeO2EOQa4+yB+AuZ2bZ1gKBag08TdjBDxIrd0H8RES1FKb3IF
         iGiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxU1b2CveRlfpQcoHBAN4035qH0f6CfJm50vTsSG+opUsHeWrSz5EYNFGPrQGGy3HjqpRblUnV7qAbCqEA5m8//@lists.infradead.org
X-Gm-Message-State: AFq9FYLcHAwoDu3vGydDhd1bQamAk/tr/sYtfzadw/+jj2wsNPEniAfq
	Xvwkf2ut8DzbAkDHYq1+2otwq1aDi3a3ETHI4+W+t5fzpaYy4WP3RQ8S
X-Gm-Gg: AYBFou1HAqc/AB3RTAc9bSD6sSFEPAPG5LgegSQ/eSeyipUbDaaSJr5BfPj6iYzmIKQ
	031KuSb1a45kMFAvVAIxi0l6SyzzOr55BAbZpZl1y5OOwKqEvfCDpQEMZ3ZcIqKgIyKAAbbxFss
	OSlLAqMEido3fn0ZD8x2qfy3WLC8FMpTJOkaN84pBrMxQztZpLar0Cer8sfyhIv7ekO/h9aKpZk
	dY308vwBMHIoYuP85iX3CTeF7qxGxqYl1lghHqyste2VzwFWEuxTI16DP6EArhZmdPcxxfnaC8J
	Vdm9zd7FsKWkRs77XhnhHdpjbf9hiVDiN1n7XwEkYxHMozFH2iM1Pv9YKMmtBUWExIjj/bgYKtR
	ovfClvYzxZcNyX9wJQZzJWS84wlcBWTynR4yeyySP6sHqnClbNReSCDuiBREVGSuefiMAFiC24n
	lCX06itDlb9cHpJT++sCxxLLPmDLOn9rlY1BUt6UCE4B28OH2YOQcUJ2CHpjXC3kBuWRKOmX9nN
	gI23G6ASPAPl3ooaB+W2r98f99Y/MWPFmjx7WbwDB+gEc0kUlIrep7Z
X-Received: by 2002:a05:600c:5251:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4a18e4d5a01mr295506985e9.32.1791966631257;
        Wed, 14 Oct 2026 01:30:31 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c198134sm431809745e9.15.2026.10.14.01.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:30:26 -0700 (PDT)
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
Subject: [PATCH v11 0/3] Raspberry Pi 5 RTC driver
Date: Wed, 14 Oct 2026 10:30:13 +0200
Message-ID: <20261014083016.332338-1-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_013035_085653_0204E1C6 
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
 drivers/firmware/raspberrypi.c                |  25 ++
 drivers/rtc/Kconfig                           |  12 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-raspberrypi.c                 | 275 ++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h    |   2 +
 7 files changed, 322 insertions(+)
 create mode 100644 drivers/rtc/rtc-raspberrypi.c


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.56.0


