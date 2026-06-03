Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37A1CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d1fMCVLbIKr90LXf3SjcImREe67/kY5zx03n0vnfB2Y=; b=PNHk2TXJIgTpIG0Ctza/7ZIKZM
	m87J96dS/pyaGktUns8CzTa9ThSDxcNc+HZqfXZVkN/vpN3XeMaIJfOn6ceMLdIWg6CRfa0+u0YFu
	MRocAu2g72ZIfBE4BzgoVOUhqfYFPlYnJEDrSeHYPZZIeCkSj+xCMCHFdRzpdsMUvqKtVJ5YFvMlL
	75zbQYU6owc3xz/iOhPNwMJQuO6YNENhQZP13G0ILaOzLmhI2Cxg1+PlWT4NuqaAj5aPFCp6ZJTHF
	Z7hbekVIrTGKbVTWVn4ic0Ugl+e/OJqDB+MAxI29z8TkmGD6KLpNFT6tffLB1irTYFJfQYYPn5/wK
	iTvYyE9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnSb-0000000FPV6-3Nf3;
	Wed, 03 Jun 2026 15:24:49 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnSY-0000000FPSW-1k2o
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 15:24:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=d1fMCVLbIKr90LXf3SjcImREe67/kY5zx03n0vnfB2Y=; b=d2cijKgLGArQEkeAH52EcWvtTl
	F9VAVEdSuewBLNvxLIVD5FRcvvR23RqoSmsNKfsswwJEZ4/duB19bQscsaowWZe7lD51CScQ3L+pb
	7LNwFUdYsQrHFyjiAz2jDxlhaYmdcLb8qNRWulX8OkU32g4w62+IMMMBxbHX6I8eIsuaTvpK98s6q
	/fPW6cRne3sdqmnLmlCs7KI6SKFVWaiBVxBcQAgEu+SboZxDI/qpdP1Ezt5zUoRGOs3aH7QAj44md
	cXnlKB1tezMz7D8Te9Sic5+MDTxswgnGIbw0h/P6vDKscAa6n2yV1xvr8DS64ldp6gkpYfFBg+fI/
	hOJ3eI8Q==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUnSU-0000000CYwD-0xjB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:24:45 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so5017655f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 08:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780500280; x=1781105080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=d1fMCVLbIKr90LXf3SjcImREe67/kY5zx03n0vnfB2Y=;
        b=PXaQS3WHdWS9qeuNS521Tz9+uVE4i0JJiRsKtojy+01hRRnApWRBvncdzg3TOM/KdX
         z33KAA3e9pxWBduHWpfpcdwebwfiRSoy682PltpuL6QUkoOneJJi4qL53j1UMsFtDKfI
         BXP7IHjTOfvnh9quneTKWUMJWRVTNjHiIerHnNV9HconeZydf7YsQhxvpsLc2ojVbKEx
         ZlvHbpzsN6WSOjkcBGNw+xb99pecP3/gEU0P8snW9rSuR64TpVDGOhiBSZHY4BgcusP+
         7jh/TIfExnOtx4RuE9jQ37LMagWUu+1lmEnf6YA1Ieq7q1652gPj2l7AIYKJt6TR575G
         yOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780500280; x=1781105080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d1fMCVLbIKr90LXf3SjcImREe67/kY5zx03n0vnfB2Y=;
        b=N4jPenZU3M9QvJFq1kE/+9ArUR8grYZ8onX0oJbFeEozpKuoG4rzZwzcnS6mpQ6Pv/
         Jc4MPZGCmeh2sg/0J7dZs1Sl1ME7G0YywSz6Fwz5adOZ97S45dzJp8+AXBroBrqrqsK7
         ovzQ9zmTHcV2IlJ8I6ip3iFFR5r5ctmWD1wEb1I8jy71m+4B+cl4VdOh4gEhY9shH1sK
         xCVx5R5IMbVw6feYjGmz0A1X3j/wkpgrrNCI0W2FvCdihQTTbsqgPFfApoamCblK84t9
         yOqaI0bCER4NtjOl/KP/ZUT7GbJbSKIH6UOxHornDJFyIYsn3Ul2gJXOR+kzaR0v2nUr
         OSSQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xqaTXrrFrq9Yy3ji96Qn/xIR8C+rKufjCuEKHiwalN7jCzZI/1J2sY6vrqJyQV2m9YRF+2AQShjFqTKuClFXQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzmPDQ+7B2EaBjHDKPTP46Lc/aIHG58aVQKRs026XKonzQopLu/
	P8AsofeE2pdpTmNTwnlrD7p6zMYL6BIIIplaL54cmV3+iDcR7P3tABhkf4OIBFIMS1c=
X-Gm-Gg: Acq92OHB+KTv6evd+9A0+x+/d+M+4ZNl9ROORJ/l7MYL0bdV3CJY7fYUbuYfQvSRryM
	R1T1YLKaMcOj0pET/Q9yx0x+Lpmy+ws4w73Cw25kWz4Gag+G2PMVq1aGZrztnUMyh6v0I4364Xj
	BckfLlecicOnoUHKPwiMSxkKIngY2dPXgNjEAAXlP70rNt8w7yjc4A0ECyUS9OpUkiAIKxu/atZ
	xqjpFpIVQ0e46xaznF0SqUn3gkG40qnVwP7ckHwgGoOKtCJ49v/0mehPP2QJbcUjpJfCF6szeBP
	lM284bayHWUCGPu17sHxxztPAWGW96AO+D41Pf2QE59cWR3meGcvXLo11ag/M4feYd8E4uyVqSc
	JlQJD2f2ce7kpRa73VRaldaoEmoQwL42V6rMasTMfCZ4jgz5DVmJZ59wSZyoLVKobkzWZ/VBicD
	R/ND+J/r31e2yr4xWyf5t1tzxjl0UfwKx31hzBrEA+n2s=
X-Received: by 2002:a5d:5710:0:b0:453:e3a1:6580 with SMTP id ffacd0b85a97d-46021844ce7mr4341301f8f.25.1780500280187;
        Wed, 03 Jun 2026 08:24:40 -0700 (PDT)
Received: from localhost ([82.192.120.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm9185525f8f.20.2026.06.03.08.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:24:39 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com
Subject: [PATCH v4 0/3] Add RP1 PWM controller support
Date: Wed,  3 Jun 2026 17:27:43 +0200
Message-ID: <cover.1780498640.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_162442_309710_13126DD3 
X-CRM114-Status: GOOD (  18.33  )
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

This patchset adds support for the PWM controller found on the
Raspberry Pi RP1 southbridge. This is necessary to operate the
cooling fan connected to one of the PWM channels.

The tachometer pin for the fan speed is managed by the firmware 
running on the RP1's M-core. It uses the PHASE2 register
to report the RPM, which is then exported by this driver via
syscon registers. A subsequent patch will add a new device
and driver to read the RPM and export this value via hwmon.
 
Subsequent patches will also add the CPU thermal zone, which
acts as a consumer of the PWM device.

Best regards,
Andrea

CHANGES in V4:

- s/rp1_pwm/rp1_pwm1/ in the DTS, so adding rp1_pwm0 in the
  future will be unambiguous
- the driver can now be compiled as module. Since it cannot
  be unloaded (due to syscon registration), substitute
  builtin_platform_driver for module_platform_driver.
- preserved the polarity bit when setting up the channel on
  rp1_pwm_request()
- rp1_pwm_round_waveform_tohw(): capped duty_ticks to be no
  more than period_ticks, and adjusted offset_ticks
  accordingly (best effort)
- the syscon registration is moved at the end of the probe
  function, to avoid leaking if the probing bail out
  prematurely
- fixed the erroneous casting about pwm_chip/rp1_pwm struct
  in suspend/resume functions.

Naushir Patuck (2):
  dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
  pwm: rp1: Add RP1 PWM controller driver

Stanimir Varbanov (1):
  arm64: dts: broadcom: rpi-5: Add RP1 PWM node

 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  54 +++
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |  12 +
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi  |   9 +
 drivers/pwm/Kconfig                           |   9 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rp1.c                         | 422 ++++++++++++++++++
 6 files changed, 507 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c

-- 
2.35.3


