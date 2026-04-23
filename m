Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42370F99344
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 08:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gZ9c/QPUCIYiqT/6G4zjKY9VFibIqgyzyOicvyBMlCE=; b=ZngW5AaQE9vMFFKKZ0YtNl0w2N
	sU3Rb/UxH8kqf3oq6IzyidhBxtJBWAGS0YQZI9eBQeL2gthmQXeD0yIiX1WCKmDDj4LuyylgUQ87h
	HlPCdJjqXRH0kg/hsU6IcGyuJ1/hje0Qa3+JU8zm+QeNI76Qb7JYDoM30zUhd0f7zulFi4eUOS7oP
	oDMhNIV2UG51CPe4kBhuuIit0knuCd5f2B6bwi8tvlUL1RKeg6WhtUB+sbOfPug+FyMIDNIyiuyyi
	/m0oOlcmokXMHgjcWpTG3NcKCTKJu2ok7uL3bXOoVNxQe2PkHYykejVAyL5HKpCKHa9s4g3Ydtol1
	ILs3qXNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFpPG-0000000BFHu-0xpN;
	Thu, 23 Apr 2026 08:27:30 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFpPE-0000000BFH0-2pPn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 08:27:29 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-43d7650202fso4937431f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 01:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776932847; x=1777537647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gZ9c/QPUCIYiqT/6G4zjKY9VFibIqgyzyOicvyBMlCE=;
        b=FiGbnzHfzYN/SFcz1oSsjdenrdCKyh/V0Si6W6pc+qb55Oc6bWNj92mwsAmcXEqXl/
         u8V2Ogw81E002Y8JGs+PqBEN5aQP1uwthgdtgrKWAFjOCcgKNryV1zYA0FB5qH1w65SK
         d+zl9zvAEVZTiJsL75qVU9Nl24+KWJWm0CRwDKbneLdmyoKmtUNTcFmTbGJaBFU36lGS
         H9G8lKxbDBXYdfQdnScgopxVezuuA4g5p/N7ux0NFwjlT+Y0Zx2qWULwv+/cNuXKUCJ6
         okfWy0auBZIX3ZtphYOhG9Ozn12uqAaq9iHbhJJhuyrXIGCK/KgrxuAveVgNFd1DJzKe
         o2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776932847; x=1777537647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZ9c/QPUCIYiqT/6G4zjKY9VFibIqgyzyOicvyBMlCE=;
        b=CA/WDu2RHN97QwQicn+Ho2SwIuVnR73uTbCHDwL4BDnAiuaQJI7b/quNCvfXsE6m+t
         XfAEG0gREYInByqEjsD+IfDCaYgpUQje7Ir5d3f1V2ML4lgAzbmtTYh/XBiu2ogwWr5V
         M4t/jMxrRZVJWfTQ85Yr3GM9XKh/8qdy8RT1G9750lTu2iw3U67Vah2g8jf49umZpjar
         F5IC87deL+MjMF7nH1KSR6aQhQkUbLzmuG3COBlISAsHC8qD14BQvNaeTIftCoaiLtB1
         fZHa78rD7Pi8oGS3UgmW0AcGpjN/AtxbtQOJ0IzjVJVP8t/h2Pcabr4Br1bMJcHgFn9w
         5llQ==
X-Forwarded-Encrypted: i=1; AFNElJ/B9KXoGdcFN8B9YG/tHHlDWt86vkE+KzUntrX6d+bHuTeGywQnD38Y5Mq59sHrUCFBBbHCouYW0dWfW1I2lwC5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw45ICdnLjQvxIdhvZU2KsqLC6lt6RgwfrljApRk336M0An1BqD
	rpMqNYRobjePeq3WZlzmFlh17H49UWExpvfjsVtEi0++a/36M9eGKjYYZGQNwWXRBbU=
X-Gm-Gg: AeBDiesy8RII2Ag6NMNs85BeL3azTFeTKjLmYsSVqpPTumTipXnzPkpiI/WV+UR+7Mf
	sdSunlqTZ5VXjhTVdvfDkvI/iSFFfv8Pcp4HiCK/oQTcD7bQJ/SvUwyLQHfbEyzvMJTcfKrlF2I
	BFNLvm4aMxn+TTDuM8U+WicBrnPIA0c+371J/guBlmmEfX2UBPEYs9vyfW6G8XJg07Ap6d9mazj
	+nhN7yzzpQh0yS5AwJRpY8p1KC2z0+sXPSOpRENOv9+IafV32/wLxFVSyjhDtIWFQrQ6uLPNTid
	NT5/deMst83moXUmWJOXdJomPrD1DdMvZS5bAqdm2//urmsRtwTLGqe2u04V45V8cpYjlwf0hHo
	5tSYYl6YJ+5EmcCURQNZkrRr8HLIx3DGFtqjiE6WHOGi1mh1mOV7h5q8e2E7NcUl03gUyp4qYH/
	Xb0z8ak36uLPYnc5zCeSIP7w2Lh9UgbQdyf3OP/7PgCRAHy2azMPUiP9nnk+wvluvlYwi/Mfu44
	gwIsP2uEr6ALYzBhA==
X-Received: by 2002:a05:6000:4313:b0:441:2ba8:79f with SMTP id ffacd0b85a97d-4412ba807bamr4088356f8f.37.1776932846520;
        Thu, 23 Apr 2026 01:27:26 -0700 (PDT)
Received: from localhost (host-79-33-140-232.retail.telecomitalia.it. [79.33.140.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1176sm52641843f8f.3.2026.04.23.01.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 01:27:26 -0700 (PDT)
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
Subject: [PATCH v3 0/3] Add RP1 PWM controller support
Date: Thu, 23 Apr 2026 10:30:18 +0200
Message-ID: <cover.1776932336.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_012728_727077_C6C921FE 
X-CRM114-Status: GOOD (  20.42  )
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

CHANGES in V3:

- Refactored all the register macros. They now have RP1_PWM_ prefix
  and follow the register name.
- Dropped the tab alignment in front of struct declarations (use a space
  instead).
- Added a check in tohw() to test (and bail out quickly) in case that
  period_length_ns is zero.
- Probing now returns an error if clk_rate > 1 GHz.
- Added a check on minimum period ticks. Return 1 to signal round-up.
- Fixed inverted polarity detection on edge cases.
- Fixed rounding errors (in both tohwi() and fromhw()) in inverted
  polarity calculations.
- Dropped a redundant check on period >= duty.
- Replaced memset by inline struct init.
- Disabling a channel now is faster, skipping the duty/period/polarity
  setup.
- Fixed an error string (s/Fail/Failed)
- Used %pe to signal error string instead of an integer.
- Added several new sections to the Limitations paragraph to better
  explain what will happen on edge cases.
- Maximum period is now U32_MAX-1 to allow 100% duty cycle on all
  selectable periods.
- The hw period register now takes into account for the extra tick at
  the end of the period (subtracted one to wfhw->period_ticks in tohw
  and added 1 in fromhw).
- Added .remove() callback to free resources even if the driver is
  not unbindable/unloadable, to avoid accumulating tech debt.


Naushir Patuck (2):
  dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
  pwm: rp1: Add RP1 PWM controller driver

Stanimir Varbanov (1):
  arm64: dts: broadcom: rpi-5: Add RP1 PWM node

 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  54 +++
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |  12 +
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi  |  10 +
 drivers/pwm/Kconfig                           |   9 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rp1.c                         | 414 ++++++++++++++++++
 6 files changed, 500 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c

-- 
2.35.3


