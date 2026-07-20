Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D61C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 09:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3u1CwozotVn5LDWLD1V9wVLi4fj6wktLd2vv686ZRBI=; b=AlvMWtiS0zBc8yDdXb9Q84Y1sx
	Xhl/Mt3m1CE4IgOmaUk98IPzEtiqUTFGRG266ETuYYrhW3JvP9hqM/EMOUJROWKE+8gO+/YLj6ExO
	uKctUXVhN+pDLILoBNnncIzS0s402fWXDpbOJ//k1X0eCSuc0pTNg5nm8TZRDkamn6cqg7moWJKQq
	N3GF51xjU5aq0IJs9YSoy1tAEh2seEq2OgcWj4qSH9sW8vbhmg2a9r/nJaNp5w3lijgbNOpBx6vJc
	8vUU8plXINYCMgYMBZgfPpYguJP8w1GTTMS29PtQdwcS5fn2bdPpjnnCZkG3JqWoc7f4fRM5+mJ4A
	ScNwYDVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkUS-00000006LhX-1lkf;
	Mon, 20 Jul 2026 09:40:48 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkUP-00000006LfI-2NOk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 09:40:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-493f75f7172so77544805e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 02:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784540443; x=1785145243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3u1CwozotVn5LDWLD1V9wVLi4fj6wktLd2vv686ZRBI=;
        b=CtIt35zKYHdHND5iPf5TvOwUnmKfAmsID6DFrwWPnKTyqiNMZUvyPk1qgCOdVlMudp
         KzPORmmLix8+198sCLMc07Gfid+95hCnZpizz8Dh6gKn7MKr3tWLd+jGMxvVP4nS8dl2
         4e/ZxiThav+8LxfHka4FZFoVwrYcdysyhr4kwjpc1SYbFLZGodHUB9jo5xPKBC+HF1TF
         zVRaTMuiUMHQ1G0nmt7LGRXihHk59GkR5eb5dWnvfXcgRrwcnaM7qLYnZMsb6k/3+NIG
         TG9XmpJFhH22th1AHVrZzmHQovId39YD81CKZYdxh22Z2ppyI7Qge5enAJ+AqN+9cHuA
         CaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784540443; x=1785145243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3u1CwozotVn5LDWLD1V9wVLi4fj6wktLd2vv686ZRBI=;
        b=aiISNvoMeGboJC1Hr2L0N9pHeDoPgSFWXNLhKEDur6XsdweynF/zNSfJnCkQvvtsSm
         8zjZdjXDLG2mNxfybJ53VNSr+PBf7glPci6Jlxq1jXP10HhlHq6IQc9bLnr+2YDNGQz8
         M3XuEPHrfzqmkrsTa8+tS8v9t6d4EPToalc6KLPZZJ8FeMxoujRXBxhd+N8ApEvewbxW
         34uMpw03r0xdKPm2yAKUZDxPTK6K2TQVSc7XCLssEI7VRHTNTM+sN9nrRNS5oSBoWy7D
         eakuRyGBU4ZL2HqsTMCmZCEo3usDpEgQp57iMnB8LQsVIZXQ9h3ukfVc2dc94hCGAvHY
         wsnQ==
X-Forwarded-Encrypted: i=1; AHgh+RqCxJJbOi9LXkE2egxrJmr1KvZZUHNzMyw53rny6UqPJTfeTaQYFgNsg3hb/6qEFsLHfR29qeXHux2yaybamKuO@lists.infradead.org
X-Gm-Message-State: AOJu0YwHfQdUzfmaBYwNzTqINnKhnWE758F92ooVmBB2VxX+xcfNHuIY
	72GvCnHsmfhKzjtFonk96RrsrFn8t1Zz2Tdd1JbOkfusOz4Zm0K6MmzPToBFq18iafQ=
X-Gm-Gg: AfdE7cmCDm5LgGKqykzaB39WPj4Exc5+By+r4McZManHoJr0ry21Reyq3koWK+30xgi
	6sIWEMj6GbaLvBPgDywUKRZL9KkgdptkVnWoo+ifEmmfCoiF0kGA1p+OW/x6RSZN4riZ3AAPFeg
	PHBNM8y4WEaNTINOmcjpjH90MipmWp/q5xifMTOYAsyVq+I4sk7jInGG94iHm62WFKWmzhy/Xz1
	E0svMDqVpAJ+7GpYTvPaSdws+15fOA/otIoi5IBNkFYidy5Iq/je+9cjggOZDF9xJZakhC7EI9J
	a/I3XN8sch8sNZadkfmLXmasAtq8YWEZ9PYSoQmSNAzDR41PuuHgmTy6Q7UxJjg9xIAGWLdo2pM
	ppucUlAA+mr98bAS5zcuTc64JN0Ee2HlcCPdudDGmxURMgBMsJfwZJI+Zt3hpWZjJJk5iJEWlMW
	8ZMP2zElxVrR4=
X-Received: by 2002:a05:600c:4585:b0:492:437a:a653 with SMTP id 5b1f17b1804b1-4954a50b811mr138696825e9.26.1784540443117;
        Mon, 20 Jul 2026 02:40:43 -0700 (PDT)
Received: from localhost ([195.94.145.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563969482sm15082875e9.3.2026.07.20.02.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 02:40:42 -0700 (PDT)
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
	mbrugger@suse.com,
	Sean Young <sean@mess.org>,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v7 0/3] Add RP1 PWM controller support
Date: Mon, 20 Jul 2026 11:44:04 +0200
Message-ID: <cover.1784539788.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_024045_642655_1BAA6AEE 
X-CRM114-Status: GOOD (  16.90  )
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

CHANGES in V7:

- _tohw(): use *wfhw = (typeof(*wfhw)){...} to initialize the
  structure in the disable case 
- _tohw(): fixed the offset_ticks calculation
- _fromhw(): fixed a rounding error in the duty_offset_ns calculation
- _write_waveform(): dropped the goto in favor of return in diasble
  channel exit path
- _read_waveform(): use *wfhw = (typeof(*wfhw)){...} to initialize
  the structure in the disable case
- dropped rp1_pwm_remove() since this driver depends on syscon
  and cannot be removed/unbound (added a comment to explain that)

Naushir Patuck (2):
  dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
  pwm: rp1: Add RP1 PWM controller driver

Stanimir Varbanov (1):
  arm64: dts: broadcom: rpi-5: Add RP1 PWM node

 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  66 +++
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |  12 +
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi  |   9 +
 drivers/pwm/Kconfig                           |   9 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rp1.c                         | 428 ++++++++++++++++++
 6 files changed, 525 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c

-- 
2.35.3


