Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387D9C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 13:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZbOHcUrqzD3VKthCx7J3x5Mps25Ab6sTBEfuEjyv3Oc=; b=clFQX2ZLzMY0zK0+ZnGssNr/Iu
	xd5aCWB+6HsNOBsmKq6rHqC70P8N/fsvXLjvIQr+n04mWCR2Rz/lTJr9shLGajKwNnwXYb9SplAD3
	XB3aQpDfwJneTsdO0D9s7aV5JyR6sx48evRYNR9l76rn9B5DZYWHMC2NT7uYgxpJ0MUY8Y3IQ//2e
	6Yh48A4/tCoBjFwgGIe5PtpcHFs5lrk7ch7beo8RCcWZyynMQQacUcygue42eZiB4oBDVwe9AVgl4
	4eQgJrXb6THn9G6IuQvFVsM0KmyJn2B/IRoOQ7cg8cxHCY4pKu2fberHcC+PbpwXBJVB52h8zpHJk
	dIaDRQ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jP9-0000000B4Uf-0k6R;
	Thu, 24 Sep 2026 13:22:27 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jP5-0000000B4Sg-1QwB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 13:22:25 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4858bc96fabso1788556f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 06:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790256141; x=1790860941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZbOHcUrqzD3VKthCx7J3x5Mps25Ab6sTBEfuEjyv3Oc=;
        b=frxJGXMrMFV3Fztn1/qyZy0IBbXhJfsgKiIpauuCbb94AEUKMQCUTusiekPhmv+TU6
         /miofy9smwyxhjc+Hu5BAYZ1JxLRaSWzAKh0q5SNzzmSocNyPWq3oDvNpyziwvk/mvl+
         VBWwIit83Sa2ZhAksnquDrRhpAcmQ+55DTtVlgyoKMoVSjVS6Zk9nijxzfsBt/OlHhHT
         aEQLfxVYVVXuNPs2i7vvgf9h6qSMGG8gMSuloLhKao/mTTE39lSaH/jCelcD7ocNK/ph
         4T3xFMwvDKZYquXHmuCpvcX86CncaoNUMAZtJof5qGDxkVBWgfQ/7swaNvzly4tGfoCh
         IQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256141; x=1790860941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZbOHcUrqzD3VKthCx7J3x5Mps25Ab6sTBEfuEjyv3Oc=;
        b=yfXDgnRaHEiDebuTtFLnq+qnerA0LwGWR3H7+RpDTS7JR9hZYZb+3qlpGt36icUvp+
         nLQBIOdL9xWF3z02BYUWbcinVZvfoxVAAq0yEeh5BWMMHwtMakkdW83RtWkm+UxDPG67
         kEIswZWGBERk+EZqPkr0fr6HchuWMQrMnc0Y4rHJPA2PXSGE2RpeRTPgO0DocBtze5lV
         3OPfxTPXz+p9sDf0WA2TdD9t43Lwz1QxePov2MMqFUfWRKELbMO1qQMEkpN03nvu4YlW
         FsRtur3DW6FUvVaZl157nWM2Kr6JEBG/BEfkSTwIxgq97nMcydnkmNDUshx1x6m7XHC4
         hY7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxrrGqDa7Dv8BvUwKbCookYd3BabxitmGmrOAfH1N289UZfSxbRFPqY7VPWMjOs2m+FuSdz5n7dg6yagRW1V9KD@lists.infradead.org
X-Gm-Message-State: AFuF++nkqpqaO+W0th9IjmC7L7VFDcpXggEhUqcS2hRaK/P7IMImEsZ3
	BpZ4+ydWSY2ovXUBNkwTzYGTXYxg3SgAXqOYcF4P+Sy0tZeSmmCZdTqM
X-Gm-Gg: AYBFou1dFqXdz9yR9J1Tc5HUyHJTqlHnokR68GrzUnQU2TrOCEMqNGGU6rqAE8NQ82B
	MMYf8AFGevW9umWYz2WCLhNpujxXULFEO0HbUsuben89jxey9YRGXmBXYg/vwb1ytQlO+d0cw3+
	Cy6lFW2yFyb/8avR7/7C0A9rzJ9k2LciXQygc6LalpJxf31OuVp9AkwCn1vvt7nrbgpbtZn2U02
	0fjeOKwHlMFnjssKAbH7YDO+D7PLSIcmoYzuHJslHOZFbnEXhhsbva4Kko/AOIXxSOrSQUzIILw
	kBN+lNqdh4Wpwqjx2a7jbp80PvPawgEMN05NhbIMl6IMEacpYkcoOqlUDZA2zyEPql17zMtN9y6
	7m1/XqJjszVqZl4GADC/SCuiYfgP4F5osQohDabZpsskeztB9KU76QyMugVzhPe2Vjp4/uVDpuk
	ACu/KsMu1LHxqoCPT27FV9y3Mj/EMgLrwocVK3besW+oH4C/hRSH1OkBnalBAKSPfT082v1lXxb
	XYa36x+7aGdZDzGxi65wDMP9fPp3gw/FpblZ9G/CDMOtA==
X-Received: by 2002:a05:6000:2007:b0:488:5fa4:e2cb with SMTP id ffacd0b85a97d-48872abc779mr3687759f8f.26.1790256140353;
        Thu, 24 Sep 2026 06:22:20 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c267sm14642949f8f.16.2026.09.24.06.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:22:20 -0700 (PDT)
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
Subject: [PATCH v5 0/2] Raspberry Pi 5 RTC driver
Date: Thu, 24 Sep 2026 15:22:15 +0200
Message-ID: <20260924132217.1281752-1-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_062223_428681_3C685D0A 
X-CRM114-Status: GOOD (  15.33  )
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
 drivers/rtc/rtc-raspberrypi.c                 | 244 ++++++++++++++++++
 5 files changed, 288 insertions(+)
 create mode 100644 drivers/rtc/rtc-raspberrypi.c


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.55.0


