Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D3DC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 08:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bDb2QDDbYI7e1da4zOCjqVkWLKFqFwWgy3CDKFih7gw=; b=tJ0fKIZ4rtPS8e8VABS3IRi3RF
	H/NKAO1Pkv/7+eimh1+5eOXAxDMtaecUIqVqUN+Nxfyh9nsSHKCUKq6y/nYmHY462tsDVkbyrkNGe
	VThWTKhcuyDk1NH06rWUAIuOQJW1HiAtNj5Qtf0Q0MNbuQzqNOOVtsMGbCJFQCkJGnTZGfnPRESiv
	ewawXf1kzv3xucWhG9bxf1acvBnPzNb6WIX2Kp4LEWP8r3IR36I5og3Ds4EUFXcYl3RHug85KHuIY
	+tWhbKwy7P2edCkVn/AnRzWVrtwHP/mmhgTokCpj07jGeH6U5eEz9D/iTuysTAdnLLsckmkNKCdyM
	/HG3vIAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYh85-00000001qWI-0TYt;
	Mon, 07 Jul 2025 08:23:13 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgUH-00000001iyp-1Jox
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 07:42:06 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-453398e90e9so17592185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 00:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874124; x=1752478924; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bDb2QDDbYI7e1da4zOCjqVkWLKFqFwWgy3CDKFih7gw=;
        b=YFYjsOjwf7UKX6l+DSEfJu5fGJbvYIXks91+2yK9C7bUYhybQee73GiMOiHtF9l+Sb
         sJMB7ttTAl4ZASmexu/UxzkCtZUPtrwHd5VsZP+oNg1zMox0lZkg9nUyDkYq+PyyL/og
         eC0BX3pgZ1QkcCVdPk5DRrjdHA8YA4m/3X9Gt4zjWEfcdtisbl4oxEPioz6bRQu91WVy
         9UgeefaxQbI1cq2Zc+rGdK4PCe5xWEIofBpy3U2YtQDx4gQGyg2PtlZywyemHmnYc0rj
         w8/0i2/KBBXueasLngy47YlIe7e5f841SbsemZu+HKHXpnU3DDFvbVfZ/cT8+mv65SUX
         30DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874124; x=1752478924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bDb2QDDbYI7e1da4zOCjqVkWLKFqFwWgy3CDKFih7gw=;
        b=HHaGixyl5NOQ+dCL4o3YpPv+sJquNTqlQFrCEZ5AU3U2lioLVkzAeD812eTkda1sNP
         IXyav6y9gkCl3ew84rTFyNFSgAZvHwsRexRJepDOHURzLhZ5NCMFyiU/2gVF0Kna1wBj
         vmgFYhktRR9JZki/wjQ7okL3MYKWa72nJQjsnq3CeYt78IipGmJh5ol34kMxaxHZz84E
         ajJjhNet7QgKWCG37cuQT/roGW0rhhhueA3dJ/3jZ9P71tMKeTt+TmuxU6ucFzvjU4qm
         2tQCVoDxZzjZaeNZP7SMUHbq8pwpr55POgBPVP8FuHdoe6FIil042ehLOgnE1RT4zrbC
         ARHA==
X-Forwarded-Encrypted: i=1; AJvYcCXM3MqEOivnK17MeeBvb9KNhrWQJ96zs7jbtk26/j47eBwQvsfNU9fnJzrfn2o7HM8OgMC6pOw0mA1PGQb9BJDG@lists.infradead.org
X-Gm-Message-State: AOJu0YxApzyvgoiBqBE5UipRkMT7wmiYFi1B9zxs+R1e/UJivNnEWCRZ
	3Qnn930gXZZ7W0Oq7ANIdBQ9eOcAxA7VT+H0zL8uelXpAQ/oNz+AbUCERISPm6LjLpU=
X-Gm-Gg: ASbGncvXpHoyOkFk1d/FqV/6s6k3ISNIiiLWlfdbBEZXKfU5u2++OfgMCYVC7UVyvD6
	PBLdSPc8Qbh0bXv0xmDP0K0J+SRRaWNitUFRA3lbQbmOQaBdRjaqKO7j0er7P5oQPQql5nQTMO/
	KeQmUcrUwMhp6rJVcyFbzmg/KqpjJ95CVikt0FG0anp3GKYriOTkaB5mKB5yAOHJjX3/bp2DBM0
	3MKNznpZ3L1E0EynhA3/i9pGTv7wfJyyDdG4da/avbOtITVy15SrNOhuupmZF5j53Otq2qOTLzB
	b2/j6/pPUuR6rS6eiq9N4yas4a/R4D56aHwhGm2qCuOMKaXIJwNZrXGVdQBliHk=
X-Google-Smtp-Source: AGHT+IEWekPleecTkqzHnxj/5d4ocJg6iJ2GS+S28dD/Gu1BHihs4HNC2F49+o22Hs0t3Y/zfvGdYQ==
X-Received: by 2002:a05:600c:4755:b0:453:6ca:16a6 with SMTP id 5b1f17b1804b1-454b3116236mr125103245e9.10.1751874123696;
        Mon, 07 Jul 2025 00:42:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b10b8c89sm107026185e9.38.2025.07.07.00.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:42:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Lee Jones <lee@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-samsung-soc@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] Immutable branch between GPIO, MFD and ARM-SoC for v6.17-rc1
Date: Mon,  7 Jul 2025 09:41:49 +0200
Message-ID: <20250707074149.11000-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_004205_353024_9AA7F45C 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hi!

Please pull the following cross-tree changes for the next merge window.

Thanks,
Bartosz

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-mmio-remove-bgpio-pdata-for-v6.17-rc1

for you to fetch changes up to 9bad4bec5daddbb296481af759f9d56c849ba96f:

  gpio: mmio: remove struct bgpio_pdata (2025-07-07 09:31:08 +0200)

----------------------------------------------------------------
Immutable branch between GPIO, MFD and ARM-SoC for v6.17-rc1

Remove struct bgpio_pdata after converting its users to generic device
properties.

----------------------------------------------------------------
Bartosz Golaszewski (6):
      gpio: mmio: drop the big-endian platform device variant
      gpio: mmio: get chip label and GPIO base from device properties
      mfd: vexpress-sysreg: set-up software nodes for gpio-mmio
      ARM: omap1: ams-delta: use generic device properties for gpio-mmio
      ARM: s3c: crag6410: use generic device properties for gpio-mmio
      gpio: mmio: remove struct bgpio_pdata

 arch/arm/mach-omap1/board-ams-delta.c | 42 ++++++++++++------------
 arch/arm/mach-s3c/mach-crag6410.c     | 17 ++++++----
 drivers/gpio/gpio-mmio.c              | 61 +++++++++++------------------------
 drivers/mfd/vexpress-sysreg.c         | 46 +++++++++++++++-----------
 include/linux/gpio/driver.h           |  6 ----
 5 files changed, 77 insertions(+), 95 deletions(-)

