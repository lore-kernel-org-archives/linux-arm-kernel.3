Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C79CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 13:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lqg7EuxMIGmSumS+tdgRe8gbezZdZWcHGXgl7mw39zw=; b=38OypN6GbArvd6Zu091DYr+cN3
	iULFBqCG5S6GW6l6sWG5ke+aTKLoWgsZbWf48C45FNVW/waOLklWvc0iGWyG4f43gE/2lZMk0yW8n
	VLIpv62yBxN90g6Q58DC4MRoNbmO+tCcbZdEYfTQen8zgzctEEdkwGyVJE0RvIN9mv2oYVjb5eskg
	6ALEXdgxRFw2NbEbXMIWDS4eZfIcOenvjW2Xqv5q/qsjMUbZ07iJt03nsaWR53iNiUYymv9wRRXoz
	+9M201m0mh3HM81q2MYGRTfiF/W3JspWEOSpq9ctAXV3bg9HZdyT36Vq8KZTEnBWJNM8QYsdsQsLi
	/MtBqG3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2On-0000000B1PQ-3mqn;
	Fri, 12 Jun 2026 13:58:17 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2Ol-0000000B1O8-1wDg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 13:58:16 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-490b7866869so9892435e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 06:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781272693; x=1781877493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lqg7EuxMIGmSumS+tdgRe8gbezZdZWcHGXgl7mw39zw=;
        b=TOvUfounwARW3sWWb9w4f90ekP1nc8wjDActeKCx0vlqLuidTSSmGfc02eaPP+nTN+
         bN2MGYXjLIDxZrWoC/fG5zGPv8hPZpSo9HEQou1U1SaO9mF3c/AluSU/15muMID/llt5
         OsNjwpXYZGRZwxd9U6NClNhtcj/WkclUJ9o5favwmZDgMkKs/G+2YIzm9FWKDQhIvgUA
         TwdFPH0jYALUIYMEJSlmaqwscWXvvtOqhe0DOZrsZdVeHwJqxDhlIozo065uStDAaqUt
         q32paRcNk4O85h9XM7AuMof3SPC5GFxHXERax5oA4f8HaUz1gDqzBHF2GJvq876Pw9mb
         bvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781272693; x=1781877493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lqg7EuxMIGmSumS+tdgRe8gbezZdZWcHGXgl7mw39zw=;
        b=Xq3guHhhiJENnoK6cA0yxJHAG1B+JYfQTpCv6bqabe0G/lQrzCHnIlCoG4u3uD7VgW
         lsp1RglY+nJQ6g7kiZCCp2VlswLuDFGrS/Hwuwf+4bBOfCksgPr7drerIfiIFDC6U7x+
         QKfjIY/a0Bl39J3EOtuhvMDCTTACmhj0ZSjkM4eKxzEgbT9WWXDVydF1m5SdYfPMumP+
         rWIwabs5zkHUlD1Vce34D1DUIycxrRcqS2J1uKKVBZIDRSvr0nMLwGJ4Hg/SabJTKVGu
         Vs0vI7J9MmiFqX4CMHFpyzzVNgnIJxSMk03yCpDnOmVYd8kgJjJSX7i4SrVtLNL1jI5t
         jc6A==
X-Forwarded-Encrypted: i=1; AFNElJ+o3oQtSV/I4GMjC/blbEuPMqN3eYfxN6eTTjy9iO/V9xUpA2iZTYeSEqHm/Gs9xptLcl6/Fnp9O5FmmwqRT1tu@lists.infradead.org
X-Gm-Message-State: AOJu0YzFrCLNlTg1TtaapVdXmrazWzGVv9EZ8gvCFs7dJ68n04wrvx53
	LPpA2x4tvr0ScGOrVuUy2ctM2z41tzx/uk2SufJdaIMESoOnsu3uL/eLMoWLmR1wIjg=
X-Gm-Gg: Acq92OEDah7l+G/++iTKOMMIY2BHg1fT5Jrx3gAy8sasaMQ4m9n/4KbGtYgFcE7UV19
	aGukJvYEVbKDjFcKrHLL+4eQYYPuzNU7JVvOWmj8xdhbuSQlxOxHYNks0y/jOmiYp+zxWJ1ZmDh
	qx2T0u2wXt7GcqJCPTxIFe02YDgxoHx11cjiFVN+x3s2XfAcA+9Drc6H3QpFBl/D52tQHphD0wv
	CQFrkV8mp+clesCnIj1xn/Rnph2PxLuF/a3X/8uQxrQjjg5o9i+pqJrsFIYhEBM4pXKu5ZTbpuK
	WxUv+MfP/p6qIzCOqs3TP3S7WgsUwRFjVBv/RL1n5JfooesTw4uLtrS6gnB7T++0YW9nYQiXLLo
	eyhggtk5asz4n4v5wf3O5UgsPYI7WW9So9qxcVB+4JSvPx3o8mTaE7Y+kO2d97nib32Drwza5ku
	61Q6EQpsKstR8fKfpuZDLoJvZzZ0V00ZI=
X-Received: by 2002:a7b:cc8e:0:b0:490:b0e1:2161 with SMTP id 5b1f17b1804b1-490ec4c1396mr28431285e9.2.1781272693533;
        Fri, 12 Jun 2026 06:58:13 -0700 (PDT)
Received: from localhost ([195.94.146.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2c7ea21sm157969205e9.1.2026.06.12.06.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:58:13 -0700 (PDT)
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
Subject: [PATCH v5 0/3] Add RP1 PWM controller support
Date: Fri, 12 Jun 2026 16:01:25 +0200
Message-ID: <cover.1780670224.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_065815_513927_3BD33E01 
X-CRM114-Status: GOOD (  17.62  )
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

CHANGES in V5:

- period_tick is now capped to U32_MAX to avoid breaking
  monotonicity
- period_ticks less than 2 are set to 2
- fixed two casts in fromhw() that could led to an incorrect
  truncation/underflow
- when disabling a pwm channel, first set the polarity to
  avoid unintended quiescent level
- in probe function, fixed and error path that could leak
  an invalid pwm_chip struct


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
 drivers/pwm/pwm-rp1.c                         | 424 ++++++++++++++++++
 6 files changed, 509 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c

-- 
2.35.3


