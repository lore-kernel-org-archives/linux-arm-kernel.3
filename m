Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0644CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 15:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LaMWXGY4wl0wzFsEiSc/F+H9DwdFVduiP9XS0WHG/PE=; b=kIxanQH/yvsuB7GiH9Lh7EdxGo
	XeiJql80m4TMQEg6xP32F+iAtdF9H4QLJ4SD7o4CWP1eWsNBeN80hFIvxlwhxPyagmSg567xFDJRC
	Q3+eKj3Pphg4Fq5tP81K6D9uRUHkg/s//Wd8284NH9FIiyX3mca680oUeGdkZHhJoXIxImJejN5it
	d6KVCD6E4QO2wWiErlsnt3S+svo5r6tDujOvLeadBsQJFO+lGAPjekfUjrfnpQ3Ja4qPXnk5mI806
	BLwuE6hyoruUp4rzSfqD+Ot5Itp9OvqeVzsTE4z9u2B/UuF/mufxi9ocpKgLSgTpmE617I2AGLPMb
	uRFe+fMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xISXP-00000005yfg-35pi;
	Sun, 18 Oct 2026 15:11:05 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xISXM-00000005ydH-2ytG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 15:11:02 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48df8fe8513so973259f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 08:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792336259; x=1792941059; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LaMWXGY4wl0wzFsEiSc/F+H9DwdFVduiP9XS0WHG/PE=;
        b=mXixl3Fu3/rohidMnQ6fgY/i/HSE+aalLHJXHmapT2XSzH4iQCEqGl3lU38MptlB8J
         Ci04nTsz2aK5Sumq+4znpem48b+twCqRs8yoi8toEhaHv7zDmuANeszakKSmLvkv6Ezg
         vSuReWhwonpW1NeDynEPxix4P4Pr7NH25rxN4FFSbK9Hu+iikRSrdv+yi3EJ7iMNAGzN
         liXVXEmdYtDAvap6Txc9vXWa5iSUJY/bDv9mA/kJlrxTtZi05XdMB3OTmAdmTDnbMrhq
         hTXxEickZxL2VJRtFqH+NpO6+GlGd1eu8COnUQCoffSdDhAnH9xldckxQ7i0Ux4ouedX
         r7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792336259; x=1792941059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LaMWXGY4wl0wzFsEiSc/F+H9DwdFVduiP9XS0WHG/PE=;
        b=VCxYwnRWkcnQfwnQiJ1yFCm6ewKoB+VO3ngE9/LPPnJEF2h1LMipw5Rgvn8lmBs6wt
         UGTxmNypQG+h0haS8Q9GXcdjyR+AnT7h/7iHIV7zav7eTKu767XUHFidq54TQIUwLSJ3
         96en2bthyODy/wbxZkRLNkbDbTjXCxoko8CtKNLyM6Tl+8uuqxBig1hItgTe7Y9oBKSi
         Q4PBcOTLiOzsjfFfzmfiudrMOoNKs86607IXPk09clOcZa+Siojrs4yLTgsNqISARGRs
         wTAHbltrVEsUNmFlhPhjY5Nv0aHAsuzDiCclrXvND+YqknfnUCIMMgJaapbP+h+BXRmh
         mPJA==
X-Forwarded-Encrypted: i=1; AKwUvBzNhSeKkXsZ2zRyoZSW6wSQ7D5UungzrVvk1Pok1nMa/8BFLMVR19GDFl3ZgivQYMW1ngnhrpJy/01Zk6X8h+al@lists.infradead.org
X-Gm-Message-State: AFq9FYIO7dFXxvDQ57zUsTmmGaM+Uv2uAqMWbqYC4d4z9ZqElT7nOQnc
	dJ63D9L0bMOPw+XAQhM+d3uqgbhelmXTomgX0tFzomhFGAEUkCqkPnU+
X-Gm-Gg: AYBFou1X1/j3LYssG9Vy3RaasKv/GAG+c1UyqovcL15Wjix922vDyb3Q1hI+YyU+e7X
	/KlH7GdTOzYqx5FOANmojf7w0/TkAAXaSRWoX3HSBqBV+Gh9b06FykMwpKGih0aFiKrsBsjEcuq
	1R6jm6fl80lOK+8D8DsPj/kmLCe+ITe+c5HUi513kopciGyzkoMvxqaZo4AmK6MaSMqvtkdBKpc
	EGtKY53ciM3FG/CGvz8qTPtkO/d/b1pQRskRt4jrk7kQS6FWdn/Qzk8JargoKnFKHIKJaKYWpvw
	9DivHGI5tIkVyK+PLMZyrp7vv6WMNv68Cse/NnlFtQWZJkKk6+axtpWBEFtSb7yqBuNC7D9HTWd
	ZoSlKWEWu87d4tbe1CqE1/M21h9TFuybAZkQsyEm5br498OGhEDCJyMeyo8B6RFKHRRIT+8/TuD
	PEVhQUhG7aXvJuScqY77LcR0IESVnpiBErd+pNpNVanYhIOoeAR4Xe/Y/K53ezaP6XRLFghyaM0
	Gnd0YFpYZkMQnCeVSx0aa/WbztdCJfJssEfrC6AtOZZEg==
X-Received: by 2002:a05:6000:4b1d:b0:48e:eb:56d8 with SMTP id ffacd0b85a97d-48e07bb307emr8915118f8f.12.1792336258666;
        Sun, 18 Oct 2026 08:10:58 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503a0dsm17743957f8f.47.2026.10.18.08.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 08:10:58 -0700 (PDT)
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
Subject: [PATCH v14 0/3] Raspberry Pi 5 RTC driver
Date: Sun, 18 Oct 2026 17:10:53 +0200
Message-ID: <20261018151056.1051330-1-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_081100_770314_B2A514BC 
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


