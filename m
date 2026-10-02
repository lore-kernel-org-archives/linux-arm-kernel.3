Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861E2CA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 10:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yi+ts+54+GxWxgSe/WCnTwbV91QjI4mJzfhTrvNy+Cg=; b=fvqTF5FD7gg+5JsAHMroQvpkVN
	EnWnjwHjW84n20OHhqnOLD90HNpzcimRYzKqXy1Z7BPWHgbRtO3eYoUau5VEODWQRhMm+EwhNLq78
	qdNHgvdX2c4bWY4/SIAKROker3Kk2vwyXCvztN8GcMCzkE3L6Zs/SMIJcBJDJz/hsdptF0J/Y4mYh
	0brsOjBOsu0j3sIXSEmAUu1rdyh+NPEz+Wuh8AsCLbMIC198aM3UEBM2tPTVjbSQBnkCwdN7PT7n8
	S7jsltYtgqxQKU6y2/1W1aiE25A9QIsq2G+M0fzrHMJK85364pIBndDT1zSJqtq8TsnI7VwXsg2JV
	sVbBm5Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaRM-0000000BIY9-2kSt;
	Fri, 02 Oct 2026 10:24:32 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaRI-0000000BIUy-22SD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 10:24:31 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ffed768deso22254745e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 03:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790936666; x=1791541466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yi+ts+54+GxWxgSe/WCnTwbV91QjI4mJzfhTrvNy+Cg=;
        b=pMjEtg4QCv23odAInWWkr51qZmGY8GQcMKe4//l2wSn4PDQxSd4DUhMoEo4gOeZTKv
         4c6qt6yDN95Z10Ylc5mnGYFOVXr9A1jkaptpXtTiC5YrWabtQTneX4peYda89ZQWuhFd
         pxS7gnOrx2u88egds6wSlzsUop6Kq9/NXAr6a2P0fUMVQ3vst04ovQtwiIoz9ueRW6Z4
         zDX3mrpbIULgbkxh3EV+CJEmoqYni1ehyLD7G8+XSKDyvBAHsiTigifmbLUF0rgyr6pP
         FFWiO3N6GhTAI0JNb21iCKaK57SDmu6iDzrLsULMwpyljxeh3WLobUj6dqGq4VUlhWEj
         631g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790936666; x=1791541466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yi+ts+54+GxWxgSe/WCnTwbV91QjI4mJzfhTrvNy+Cg=;
        b=juX+VTFWVCdUJE8KMwUEk3a7wpUKW5CcT9kHK27zsbUWSnE/6J8ztNGoZMVs8LSudD
         h8swnK7Cu9c9Pc7AmNXSkMWf1lKdGLcZdKVr2t0krRg5xwSj1q1Pk1Fup+pGUnyqovqq
         xeg6SsToTHaPEH4tPqJe3ezXMMIuJ/sZkYjgnFjYvxzVJ0zeCKecDBmZvAg2Iw2NWqcG
         hXPacbOEKcQbFqiY632lG1LZvVyDFjWSjfQntIfFBdxvLEH4pBYHBrt89OFHEZohur/U
         Me8jjZXFzGI5cLn/quyrSE4W4Zcf2r1KVBTJ5QFWZyINsW+ZUeHbJcanEHkKfo823oyC
         2BtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAHCwYXKRDbA/0zX6Xje10/CPJi/YFaBqgCCfIgYMwfqBh1/ul812n89FwX0nG3JLc7H4G9Ye2JY4O5Y0uRGsk@lists.infradead.org
X-Gm-Message-State: AFuF++lxUClHmPGhl+8VaM5vxgUpvAJYjV2n9FWfvaaMyLAo6kZh6e29
	GHDgyqVh7VtM5v5JebBkMUjruQrJD4Ob9gsycwa/NIL4Bspck6LXjpOL
X-Gm-Gg: AYBFou3O8y4PK9VeBwGE68wQJHzofnrSw0B2BWLwQtCmXd7D3me4TaVTvhLEj0cMof2
	tplE30bEXezOrBRHd/Deby80Gv4FzrkYNQvNifyerZRB7WEFKYPtYkar7ULgnzkfILmJp2iYk7w
	tNuvpEMBKqSu9x39EeK9GDD+ft3n0hdvaSqJMV3mvv84+xZHzgzLKPQW6RBAFM16NMdf20rG+iW
	Zf5FO7Lu5lsXuaKyuM5omHZYC8UudvULgtUh3jg7n2hSzQdBAH31q/oNOq2qwYKWIIh02/QcoYe
	2liXuHHqUI3blt4ZIBAqEIuNYdyqiMXllybi4mXx62ZzjsBOlSjyaptQ40m77ofaVivg98Orgzn
	akstFlydAyOZsno+C5OaZpkih7CwtGKBpwSrwC+QfkDq9p3tQMkTJwz2yYEi8wkBBhJy+aI4mWE
	mM50Oyji2ZC+mA1nbGmj1Zhc1ytoULMwa4JmEW7m36yK5L3PBzgdCw92ApLD/e1062Yghw3BBJV
	nxnKzs5GpkO5FrChT/Anz8oOK2MqxsOEMul1IReO5/fUQ==
X-Received: by 2002:a05:600c:c102:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-4a027534963mr34224645e9.4.1790936666286;
        Fri, 02 Oct 2026 03:24:26 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027735be1sm99557875e9.11.2026.10.02.03.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 03:24:26 -0700 (PDT)
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
Subject: [PATCH v10 0/3] Raspberry Pi 5 RTC driver
Date: Fri,  2 Oct 2026 12:24:16 +0200
Message-ID: <20261002102419.830595-1-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_032429_174930_712784DA 
X-CRM114-Status: GOOD (  15.86  )
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
 drivers/rtc/rtc-raspberrypi.c                 | 276 ++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h    |   2 +
 7 files changed, 322 insertions(+)
 create mode 100644 drivers/rtc/rtc-raspberrypi.c


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.55.0


