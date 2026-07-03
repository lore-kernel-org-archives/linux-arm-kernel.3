Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46F0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 17:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q/1K0BV/G7Gec3azOultr+oMUL4gfypJwfwS0OJxpVY=; b=o/qiygYWWVuB+5y7PaN0otoDqI
	91BMDOprJxCyDlvcTnNS93sU2623rs0z8z0zvfrwDrWdtdtKWgMeb/Fe62yMEykx0NIK5OJLE/90b
	uYrvt5MnNwqmhYfNx8kQNLhjb3sIIU2LVMCUkt6nLT+e1cg7yt43BIA6+rdLz5wFq7XJocB00otFJ
	VmPslv3+xUdkN3xpTF5rHv2j37Ps3N49AuhIaotIBVj3+x3ZejgqyazM4mIsFoKtOdTyRw7ZO/6NB
	BUUMnScWLCtvA100dwkyIuiBlheH2WkfHdV/oBYHpKQfTMBy51ejYggaelBXQzk2G9/YPep09Nh8h
	lpNKSxSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfhHF-00000007aA9-39hp;
	Fri, 03 Jul 2026 17:02:09 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfhHD-00000007a8s-1mJL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 17:02:08 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-493c1950518so9825305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 10:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783098125; x=1783702925; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=q/1K0BV/G7Gec3azOultr+oMUL4gfypJwfwS0OJxpVY=;
        b=GXnD4dlYgVZQ8Qn6NE7nb7TGtOh99eMnlejqLJ2yKbwAXjyIGF2JRflvEw2FHJ5qKA
         /oRrLui6Kqd5uqfxYw/IVyvTH0tq5yDAES6mmtXoxafxdc0ZoOMWrqdUMF6r12byUbWo
         gJnmfnq/TAB+FJT/wP0isS6MISq1pfoqdZoPzgdDtzSfKqjuQDUcBxlI+DqAzb45XYyJ
         GvAL8Ko5lGzsBO9ecRERxsVFM2hp4IZfWJ2FWwtdF0pOOGBWqsRFWjqs1lvzObRzmSSt
         PEh0khpL9dbQWApPZCcKAz2VIOk/iAvVaGT513fzk2mKE3Ay8EpeyA3pB00AcAF5xBDH
         ELsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783098125; x=1783702925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/1K0BV/G7Gec3azOultr+oMUL4gfypJwfwS0OJxpVY=;
        b=DitDBTNfQwz5gUIBlTjmdJxbsTpwaR3RlBs5NElCNrNgHLFxDJ/FdmPG8Tmy5+2dia
         HxJV6xUAwVFJeOfkERqUtB5CUKS92bmvhW7TY0YN1/3yZPpuomCVWO4nznWKj+5cWaNm
         knX2XrN9t4AOqg0G3dKD0NCEfZcpoUlayIyhSqjK7VaTueLCcjJs3hs/i8wWSuXaQCaR
         cCDwgT9vTG7yuScNB2mHjC30vE8QIZ5R6vRZOEX/o9fI5PxFBv9mlnqhQ/wl0xJiJdsd
         KGxe+LOpdDfIvH8algnMDcGaNHp3DopiUlQAkkkA/I+U4gTbrFWuzXnA18+VFz/mL/0X
         ZotQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Y8LCJ7T9dsP690zmYQiO81wo07UGp46MinZV/B/SiUYdNhv9ikLXSLlhNKTE03usQLnJ9voRmZ1b53FBgjzp+@lists.infradead.org
X-Gm-Message-State: AOJu0YwtlDXH4s55kVgoCswe0oKAxpLng88YBY5RD0v434u0dUf9oG7r
	fnZCh7R0xf007LiCw0r14QMo1pkMkBSyYNTGpXT41z+6HTDvxCgSzrCSgA//i/uWsfPhqJSb85s
	t6pyO7Xc=
X-Gm-Gg: AfdE7cmjsbQelQiGyk3HZBE9JXtGBIeH6Fg0wLisSdFk+BM5sM3oIWlyFdrJ7ubtUZ5
	w8vOSekovz9Cn09UvhddZEva8YaVm8QiQBTF69hGOhH6cWYsKbpWyCD1vrwxx4FxABjEznv4/x1
	YRUGLtmp4hnfNMSmPgU3lS0Ilx2BFbDyyUcLq7BuTLODMfcN0A86VjOYp1PxWsAX5Mg8Uli5Ar5
	nwUoDZw8WStJbjjqmxoFQuHdXpEfJSn0fYbTyPVM6x5+tlqOLQczHAZKPjN4aIsQRaJffte52xH
	FNd8yJNDgx/5dZsvKjgqjLo//rEW1HV99k7ZIu/AV02S0O0kZyuW7ESBQA3GDfRRY6aJTyd9NqE
	xn2RGR9ntEAmRWyCckiw35/NMpUjn4ycyI8us1PJ7lAl/rW1np/0oA7VU1dElVoKzmZOhxYjU8R
	w6ku+6ztkv2Ms=
X-Received: by 2002:a05:600c:6287:b0:490:af63:2cb1 with SMTP id 5b1f17b1804b1-493d128b6e3mr24185e9.7.1783098125539;
        Fri, 03 Jul 2026 10:02:05 -0700 (PDT)
Received: from localhost ([195.94.145.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63172fesm252158015e9.0.2026.07.03.10.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 10:02:05 -0700 (PDT)
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
Subject: [PATCH v6 0/3] Add RP1 PWM controller support
Date: Fri,  3 Jul 2026 19:05:23 +0200
Message-ID: <cover.1783097764.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_100207_503207_3A289B2F 
X-CRM114-Status: GOOD (  18.96  )
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

CHANGES in V6:

- dt-bindings: added Andrea and Stanimir as maintiners, Naushir if
  you want to be dropped from the maintainer list, please just give
  me a shout
- dt-bindings: added dmas properties in case the driver will support
  that in the future
- _tohw(): fetch the actual polarity in the disable case to avoid
  potential glitch due to garbage data in the passed-in param
- _tohw(): fixed a compilation error on 32 bit target due to missing
  64 bit divider helper function
- _fromhw(): division by clk_rate explicitly cast to 32 bit for the
  divisor
- _fromhw(): fixed an unsigned underflow in ticks calculation
- set the atomic flag to allow calling from atomic context


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
 drivers/pwm/pwm-rp1.c                         | 435 ++++++++++++++++++
 6 files changed, 532 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c

-- 
2.35.3


