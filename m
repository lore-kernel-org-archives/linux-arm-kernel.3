Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77434C44524
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 06:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RjXGzvZcsEIuIReWqV3AthYPTgXMH2ZnkuQulSBosYI=; b=N9PMuWOcj1dYnhNGiLUJbVW7rx
	4/KC8bw3Nb4ES3Z9zuzTHYW+wCNlV1sK59FdCtVlAV2Ab04SNBrI8Se4LsuoUKgNslRwcL/u/n59n
	+I57j7f/Jm/pzxM9XKutveC/FOW31Pc8hQDFjKGfngkxFo3aMU2qRF2Yyq2uObiOWDAAH9+Rfnaj6
	wadMfiZzZehcIhV7544+qmSiHPqTZcZ19ty91eq6z+O2epRdAP7kiIDEOCXuT55NCvXQbulc8ojJx
	Jdpf+BXBoX1QuAUB4AtTc5iZ03tDCIwP/SM7jLbv945geWdIT2O5vurX3Rdkfh0L0Dg+EwmIwixog
	DPKynuIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmmba-0000000DWM6-1iIB;
	Thu, 23 Jul 2026 06:08:26 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmmbY-0000000DWLU-0BQq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 06:08:25 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cace91f112so3389145ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 23:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784786902; x=1785391702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RjXGzvZcsEIuIReWqV3AthYPTgXMH2ZnkuQulSBosYI=;
        b=awZx0hDNtUUJQMlX3Zsq4GYDOOuEE3Y88GFIjlp6F/i5qIu0RkGUiApwtCgpcynAoM
         dNfWlA+9Ipuc37IGpGDK+VvRTGSFcjYVDA98sGI8pwRxtijrGG+SHEgujYKvFiKyC3Hi
         FA3W5S+DCmqmAuP6VAhR/2+Zrfkb4WugSgXFIAVnzmBInfkBVfH6QFXLJDARJoSkne3u
         sVhA7CfnofDLK3JXci15sDJr0voxoNSu5fMc6HlujYQXsCnLQqq2azEc8FlyFXqyPgFh
         bsMZxDKn5UAfDPz+k+PidhsY90qnqQ+xfPINK5gZ4P91aZJKe+B+6zRGmcXkNmJCZzSg
         jyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784786902; x=1785391702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RjXGzvZcsEIuIReWqV3AthYPTgXMH2ZnkuQulSBosYI=;
        b=bHuPXrLe+nn8NgIH+rTV6CUajlZaZAHAsxBuNVDaWySQMasZWArRJO4EkJve4gQHhj
         4xFr/GgVJUqXkgkrQ6cqBCr2bPi0Id8WBijtXDqKfSE00qzh7nVs7vasqo/LHHKRyQG5
         gzG248HXa1DZH25pgJNOObfWQLaZECU7sdgH+QQbqDcsfhjMjsCF3khU1YvCAVvCzeKk
         zC5uTRVwHLU4jQ8vp8OmJbVLjLZAXmfKfuD8TchKbzY2oZVg6s1jfh9BICaAeUMwZDhL
         moBHp5FXo/64HEdbE7bT7Sra5AZFyw+5IuWzLNz3qZHaZPxvJdTKv0p18Vd/9XEInBLU
         kjKw==
X-Forwarded-Encrypted: i=1; AHgh+RqgSrIt5Dc5l/nUuo//1FLbvK1nxg9VgAGUB5COx9ARIHfj8sFVysEljLs6XgYssH57VvamraZN850XIfuaEwDL@lists.infradead.org
X-Gm-Message-State: AOJu0YyopgGu+94ctRikOszh1+uYSePOsPKEH1sHeaya5/xp5k1NIUDu
	p6CzFm+u/j1aRRPetn26vSczMlAnC6R1NsH6eBYrw1/b8kkLgo83H+mV
X-Gm-Gg: AR+sD10hdwavua0yW+dNQriQr3gIiYx6nf4pqJ77rcETInaXExEyl9FAB+/PxFj4xfi
	dz4WYPIQzgVfSk0sxJlcd7SLo2ydajhqExuFhN+uqyejmnnZrkJMT/uuVhFCqRfSaFG+52mW7Ti
	Nmm6YVWiM/PBl5M+fq0dHkfo1cJWhwGlDM+xuMb1q6XuxvHNeam+cUKrvAbZA5ge1eO0/M2J4dz
	Z7+5WtXdoRAOiEpUMfhwX/XLyflAkZHdag9rrbWEnDzkGwgJ0OFJMvl7c0FaD+LP10rdyWbUSqN
	iUO6eZZvAB+0nm+1KfyhQS9Ps0FAg8REq9VzjEBLii9+iJqMBvgRVzm9T+4YLmYYnbR4fh81jim
	vml2KlOhmzzjzaZJKNEmqYJ+yhL6mG8GP807Yo7yBW5JFeu/SUuukXdrv/O9H9nbnO0PTbHcaAM
	7cfNBpdoV16anvOj+ssLDO3coHVD5EF6DcZjAB9YIttKeFiqqQnx4VDjLdEkkc
X-Received: by 2002:a17:902:c402:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2cfa6b740b7mr21724555ad.13.1784786902450;
        Wed, 22 Jul 2026 23:08:22 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f390dd2sm26071285ad.79.2026.07.22.23.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 23:08:22 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH 0/3] watchdog: ma35d1: Add support for MA35D1 Watchdog
Date: Thu, 23 Jul 2026 14:07:51 +0800
Message-Id: <20260723060755.1596858-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_230824_113188_027AC193 
X-CRM114-Status: GOOD (  13.67  )
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

This patch series introduces watchdog timer support for the Nuvoton MA35D1
SoC platform.

The MA35D1 watchdog timer hardware provides a programmable countdown timer
capable of triggering a system reset upon timeout expiration or generating
an interrupt to wake up the system from low-power states.

Key features supported in this driver:
 - Standard watchdog operations (start, stop, ping, set_timeout).
 - Boot status detection to identify watchdog reset events (WDIOF_CARDRESET).
 - Power management support including suspend/resume and wakeup functionality.

Series breakdown:
 - Patch 1: Add DT binding documentation for Nuvoton MA35D1 watchdog.
 - Patch 2: Add the watchdog driver implementation for MA35D1.
 - Patch 3: Add the watchdog node in the MA35D1 SoC DeviceTree file.

Testing:
 - Tested on the Nuvoton MA35D1 development board using standard watchdog
   test utilities (e.g., watchdog-test from tools/testing/selftests/watchdog).


Zi-Yu Chen (3):
  dt-bindings: watchdog: Add MA35D1 Watchdog binding
  watchdog: Add Nuvoton MA35D1 watchdog driver support
  arm64: dts: nuvoton: Add WDT node for MA35D1 SoC

 .../bindings/watchdog/nuvoton,ma35d1-wdt.yaml |  55 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |   7 +
 drivers/watchdog/Kconfig                      |  11 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/ma35d1_wdt.c                 | 357 ++++++++++++++++++
 5 files changed, 431 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/nuvoton,ma35d1-wdt.yaml
 create mode 100644 drivers/watchdog/ma35d1_wdt.c

-- 
2.34.1


