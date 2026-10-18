Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE4DCCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 15:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LaMWXGY4wl0wzFsEiSc/F+H9DwdFVduiP9XS0WHG/PE=; b=xdGYAYo/H9K8/ZKHs7zRSsLGJR
	gIW9Y9Z5txC+7V8g5sixe0VPxl/ucWnc1lT81asJWcJfBE8q7Ly8icYWFVlOLNFgHGoa89rJ30iG3
	Pu/UtIqpa8h8SwH6m+CBKVRLCj0IOgFmUTRqClWM8xIhiy6bgLQjTQ0495fQW2OUbl/dgIdvAxmwf
	VXXWbWSKWdSQSlVaRrIvSfPTURBjqZLNUW6A1+pA+pw0JZiCdwoBzOTfC4jSiPaAJ53hARYlkIp7a
	GiB1DeObiq9rEwfoCjbrDhoKneS4CelEZThFTS/EryP+Usr14rghouN6/takzT+fhgp8JF7yoQczn
	hf/I0U1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xISNJ-00000005y05-3whU;
	Sun, 18 Oct 2026 15:00:37 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xISNE-00000005xxg-2Gxp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 15:00:34 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so2074885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 08:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792335631; x=1792940431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LaMWXGY4wl0wzFsEiSc/F+H9DwdFVduiP9XS0WHG/PE=;
        b=dDWYm7j4X6C+Fzt23LpUqGgyWb68tojs7zgC/vZK/oYpRiu78hJtxYo8EBKyYvpcu5
         G/rKu468zmfKXAUVmBUyGRsx4+ApH7YJ7flYDHCOrvLNUTCloUe7bBIIfOqmfNSrSX+b
         vphzrKhGp/3P2jqTSlnKqN5n4sqhzH9leYN7/VgdQOphJO3eXmVNlz7/j5bLK6qZgfHw
         MM5dCsru5Q2TET69IEIgVNwoORoJX3F0+Yxx72EN+fhT4kR5GbFEW6tZDU273jNYsBAS
         x94D1c48OX7t+sb6Zkbhlx1LWO6uFIxWU68tvVg6Jrp7fXD/pl6BhrrCNcBVPNtDLJ7G
         gUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792335631; x=1792940431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LaMWXGY4wl0wzFsEiSc/F+H9DwdFVduiP9XS0WHG/PE=;
        b=QtjVJVZbo0awnaKxSAst1DJq7e6uJ9RX+Jc1NXXonQSNBLWrYW/IFhd823P3xDv80y
         AbApVma8kXpIv6gRgsD5Qn3NEdFbICwemlKfhx0lQf5WekoiHNfqXSMQDj8qofRfo1BP
         YYskBUUUEH0xxoDorN7hXDqEZ1KL0A8OwE0U3mPjG7qqnQdcJEGoQSE8QI0L/1Ayj2iA
         NFV+2VnjkkNneBIrgb/CmLYtJxKeR31aDl8BjuiWyTXoVDaQAGs4b7NOfgA1QuCIhtvg
         7g5fyXXQp6pVQgc4LgZvJxGyHk3hFYYYkKHbs2fIVJ5nV18yYegZ+IkTE9tGaR/hsh40
         jskw==
X-Forwarded-Encrypted: i=1; AKwUvBzC3MnEbV3qb/Tt8+Rnn322pcS7TEa94Uq88N4ymNx05S14DqxZGr+T7t4tVk5E+SraUDDeSsOK9FwBGh+kHQAh@lists.infradead.org
X-Gm-Message-State: AFq9FYJ1KBk0pXVBs/cMCCUN7C76amZSoyNN1ErRXQlZHfidJ0NAsXqR
	qDRkSsEfylT+uqfOsLGYX1wvz+GOz6936FAPUy1C95VZiheKo6Cr2zx3
X-Gm-Gg: AYBFou2uomS6GGQ7mvs7piOaBw59BtaUCXtFnYqx3iwVMgmXUeUCVt40SLfsWa69Fo4
	S3lbmolMyo2c4O7kbXny+8AkGzVOBNw78dygv/VhYZzljGfxFR5/L3aAiHFWpmFBRJuVuZEnVMz
	ljS+oMm6dOwO72MWKX+MqnJEtZKCm6tvvVr7I5t3lUeY9TFCwke7SkOS5k3N8kSgtJdNizHAbl2
	FiDDtp6g9EIZctvlpf7x9Ltm+8nQ6vznI04yruxqaL3b7MkVQUdksIp4kCF0yl6pJgHhkNmuID5
	rhMAAnbMYQBrW+DVGyaCKL+Mu15o3sLXhsQtHarqJgToNiwYbHqGwBOzW6OtvatbGK/9KCb5dOq
	Cm5lghwX83WD9kr6OSZlhcauxBnMQebXTaUHPvx8043fhVCERskYfnB5vp6Qb6bRr2f+bQ+8QDr
	n0glTP4avXlAGUyN+gvs64HiOTCxGV/e8SiIpGJ78jgZ/o1Ug5rq79qnrqbHTDxnVamHkVQHBB5
	kgRcR6gQXuZYKX8IhphGzfb5kvvm51JNrv0lJOAeyOeRA==
X-Received: by 2002:a05:600c:c170:b0:4a0:1efa:c74a with SMTP id 5b1f17b1804b1-4a1d76060a7mr97201485e9.20.1792335630619;
        Sun, 18 Oct 2026 08:00:30 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ad6245sm212868925e9.3.2026.10.18.08.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 08:00:30 -0700 (PDT)
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
Subject: [PATCH v13 0/3] Raspberry Pi 5 RTC driver
Date: Sun, 18 Oct 2026 17:00:25 +0200
Message-ID: <20261018150028.1047172-1-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_080032_617532_6502AA1E 
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


