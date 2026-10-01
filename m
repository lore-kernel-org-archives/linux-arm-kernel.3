Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D016CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 19:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v5aSPYVtc+IG0rQBUq4/NWp5pttFH9+1r/H+X6RBrkY=; b=MdAoHa5695WnIrWS69KW9PkRx2
	szIEyOv8avOffrvB4rFhGO2DBPwIiXFC0ANyqC9A8h72+A2ta8yGfRPZGIDHRYaKhhKf03Nas7Jsm
	mCvE/KDT4xK6xuiBOLoY4D1hGb4KbZuScumJuJ9xLkfqfH/f0Bjg30KfJjMw8rPa+o5M0A50XC3G8
	t28ujyWhvuxbLuvPYKN2TQvwpL33D9VYULKtlYU2LvJf9IR4r+32mrFutbFuo//ZTBvI7cgBZWplI
	pinDMmwJjrH1KMfn/gWbmIBOtDaxTT94batto9WN0Y9GI/CyINyG4JiKQsI+s2rxNgTGh3uvv96Ul
	3w/d6I1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCMaf-0000000A5of-3HMl;
	Thu, 01 Oct 2026 19:37:13 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCMac-0000000A5lA-3FcT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 19:37:12 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso47097575e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 12:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790883428; x=1791488228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5aSPYVtc+IG0rQBUq4/NWp5pttFH9+1r/H+X6RBrkY=;
        b=mGw4b9nbQ6ahYdjMbB9zhqq6bDxQVEpPHcgMH5MyBi2V+gJunrVKi1alKuMbuhu+P8
         dJu9qqyPZZ4JxPhRMC+QSKX3IEcvt8GOhH6wUX206BH5sKMpx8ROZfw6PWzIqA/JOuqR
         Qt8puhk9u6JSClAkLdWG3c33a8bglw246n0fxY+Og2ycBWACkzIdT0gvxya4FMSuODB0
         LoC+/z/v1a05GMRivi1i+WEmjVXUNZA0cWs0KXJBkig8YzJyI0RxXop6oOjcKNPp0ql/
         DUUIearXN7mAq7xxu6bSn3S7MSKRimiT1hr+pMMpEsKxC9CTg4p5xg+nW9fmOTRk0HgN
         Tteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790883428; x=1791488228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v5aSPYVtc+IG0rQBUq4/NWp5pttFH9+1r/H+X6RBrkY=;
        b=BVxNuBoxBc9K8E0B5cwF/XanO6iScaxH2UqpKqcmse8CFZGuIb5WyD8+g6Xl1GMhL8
         ZKV+D373hTYVePgZ3TR8MTROk30fOMmz0h5L6q9JCi6dMBo7kdZId3DyfXcXm6MqejTA
         mTAXw1gm40hc/Gqp3+ZZUVtzeT04zr2uDr4wXEds4pyPKD7zjrDarbe6s1eiHrDNKnNy
         PnQEa2N/1JqSVeL03q4sFIejlkmFL/jn/SnWL7x68sgGxilVsDYnyQFNGv599X/ADXcZ
         A8IyzA4UhgWXHo3/PPtvJ/ySSBVQs+crcc1dJscR+miJ44mABLRLo+YCAhZBdxCoTVi1
         mMTg==
X-Forwarded-Encrypted: i=1; AKwUvBwxTDAGDDzhLDNpEBNJuhPZvfOlkNmjnuJKX4GlkZX0gYGTufT7j7ktrWJw2BK5CIajfsQVjGYB4hH4ApBuhMgL@lists.infradead.org
X-Gm-Message-State: AFuF++k+5R/P6vpMuPCnCwIwEr5YHcPPgyk/LMPIb29X9EEQNxsE0I+O
	SgADTzXNmB6rPmp3c/j+imG8JSGC0zPnOJN9wG0E2bl/ZIGVc7XaOP4c
X-Gm-Gg: AYBFou1ZGCW63viVW+v6jzb/xzCTOxFBAz1tYWUcrxs2FCriX/CaTiWtOdTeqGt9JSo
	J0ndfLTNXXzQC40lFPlJI/eTZSK/r/HuxHqSS++gdoyi6tEKh+PpCuGJ4L6vaBCArqXdWXIrC8r
	/9Wh3mw1GL67Ihlo0QhFwK6jxgMUyS16zqnjPPQ2urm+o6pxNo9YTJbbVQasZSPHSDhL9YfwDtr
	qRoIfiXI0j7vkuyF02TjH8hg3u5nNNnQYVnVBdXnbab4VY8OlejTHv57ih5M+TQNhcnCXla2jgW
	ABRGBYEHLRJsGRR+i51Y95b3MhVXdvgXQ4cRtLjfwKoDkhH7wxDuO9VfWtv19bgSMFCNiXlwHuU
	jMm/Am9z+86EDcm/vEAr3ONM0mW66yoU65N+iZNDhvqMpUQGvT9Ycu+WgUXhhRckPUUsbEgvrjS
	sKLnQKSekK7BoPNpmv9nTuFJD9IQE+lK4GGR3/iqgsAzlQlRtvzqQo3bAMjZLn68MCp/2/lzLVO
	0C0C+LBxVsALHqy8YhxdVkzcGQ1h+vxxx1PDvtfBPwoig==
X-Received: by 2002:a05:600c:46ca:b0:49f:fdca:c361 with SMTP id 5b1f17b1804b1-4a0275790b7mr11310385e9.12.1790883427699;
        Thu, 01 Oct 2026 12:37:07 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02770e8f2sm12312315e9.6.2026.10.01.12.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 12:37:07 -0700 (PDT)
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
Subject: [PATCH v9 0/3] Raspberry Pi 5 RTC driver
Date: Thu,  1 Oct 2026 21:37:00 +0200
Message-ID: <20261001193703.734323-1-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_123710_831539_575F8472 
X-CRM114-Status: GOOD (  15.83  )
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
 drivers/firmware/raspberrypi.c                |  23 ++
 drivers/rtc/Kconfig                           |  12 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-raspberrypi.c                 | 278 ++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h    |   2 +
 7 files changed, 323 insertions(+)
 create mode 100644 drivers/rtc/rtc-raspberrypi.c


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.55.0


