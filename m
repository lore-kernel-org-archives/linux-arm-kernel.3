Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCB0C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tAZT5ncdu+agHg65mBYy9X51LOw7DQ1MSxf8dHyd0VA=; b=xJr9w/HOJQpa5v1PpBJBu7iMG8
	jG2X1uvm0/UhTmHxUmX8+3G8Z0sg9MwBgEOG0UpHP/cD/LudVVy8aneJdko7TncjIX+O61CUqKIra
	MBFtVI9vkf9bKqVPE1BKpCZu+cC/TtUZSCR2uVNYIX9g9qBlQVATbGuIvL0CkcayeVWEarbI0C0+L
	6U3W6fxuG2xbjIh9PibLOVviuxqwkF0d8EMtuQSx/JipY9yCC5TzCd53HY7HHyCED+y/Cw0eZLwTy
	Qg98JV+x99KhenHqNs4fOyFkaf16xTOTS6GF1GGTKgdIvBOQR/3bJn0L1rWbTzT+X76qgp7CLmtP/
	f4Rur1CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VJc-0000000E0ab-3Z9x;
	Fri, 18 Sep 2026 09:55:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VJc-0000000E0ZM-0KCy
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 09:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=tAZT5ncdu+agHg65mBYy9X51LOw7DQ1MSxf8dHyd0VA=; b=DO2Nz4xr48rrYY61S8he/yvL74
	DeqzZh5nn2Ei+L/Ar3tUXd3G2aUElOWdet6mCGmasjrf5pJGpcIL0OZO7ucFMp5uvKuXmyn5Bu6gR
	rcGO28H+G9/XUmHFVZrWcta8S2tn4GpKtDJ6E7TgSApQzQR86aHxQrdnkMTCp+PJNYUJtj0aCs7Bp
	Se3gWR4Dwu3ty/IUJmkzzQi61tZ5jeOFU83PaoA2rvsc4ew7nd59BTjXTlcJ7WkjrlpNYO2/HBKdj
	INSeYk4O2UNQhJCiQG1Z1/PhhiemzaBjchzNDGmd1SOTzFI/yg/e4pHkmV2ko76ha0dFVAjZWzHNb
	L6OliUCA==;
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7VJY-00000009spS-3s27
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:55:30 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-482f63546c5so397757f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 02:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789725326; x=1790330126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAZT5ncdu+agHg65mBYy9X51LOw7DQ1MSxf8dHyd0VA=;
        b=D34tH+3t73L7/JvD3x5qSOM6IeMZlDfzcyhE+W4rvH+3CdAgHFtZFF5AZm8Lr+5y1O
         1ZK+8VxK9laFRcxpbm7j1tgkTkwNAaPEW/ohUfxE1yGBYxdvlB93yRQf1bUSm5Ti18AP
         LKhVka1kZ3oduAcImbLRLlWeRTPpMJFcVKfFZ2L+My8pAKSfq8TKbkK+aGDEOBIMwKyC
         Mj/Ua/IewHp2XAHRAhCf9OgfB2R1qX92iFxrBXPD39kefDQ41sOAxE4LswhGmNIsAEtA
         5Xf9KG9eiLqw8k9z+dw2VeV+Pd5rL6rtfMkH8tP0lREc9XmpvI8UL8Z0qT+PR5HNw30X
         pIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725326; x=1790330126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tAZT5ncdu+agHg65mBYy9X51LOw7DQ1MSxf8dHyd0VA=;
        b=NnSXklb1zKmlXxL3FVtRDFoeoYmE6sNMV2cf5QGDztKzlba/dZZ0/K2XFsGWwfgxwU
         bIb89jK5beATVwCzaVxe9YnDv0rlQEv6fz7iYhpa/t1MDiVwnqPYs9yGwSCmyzp2/WRW
         Y2d/XXZqDQnPNWkP2SsfpxQXqwPVoIZMy5n1fvmNaIazaYrsrHrdO8kRZPmhb9BsoKDC
         uR9CqrgWsYm36QoqD9E60FpB10CD+Y9VBUToncXWSTfOsDjbw4hmd86h+hxVOogTgr4D
         NEH66T/hZTHeQ9k6aPLFVzkDUq3juykxUGPa/25IRfhpJPhkcvVVAZ19F++e+lScsHg9
         hsYg==
X-Forwarded-Encrypted: i=1; AKwUvByLLDbXzx0Eid0OozniPGhrNq0N5ec9KKmXCJJPDPQxii9Yqn2R4U8Nq+XrWlBZr4BXjpjFnC+WveSDXJ9//yjS@lists.infradead.org
X-Gm-Message-State: AFuF++kyT5fhEx7BFmQWHoXcxR6UmXDnAiCUfgDEj1+tCTpS2OuKVyij
	X6JhCO5VAPQtUGC12RFKHpg61t2DXwWNAPcTv4Id7of3psM4UJHnIrmtaO/vNxpe8Vc=
X-Gm-Gg: AYBFou3w/oaSZslsWja9QRGlGS7quDnBWwpF3ym/1L2auUuVESJrRlRXagqJtmVx3nt
	sDU45bsWNDaPek29fMyCOYm0/V9DKeu5S6BZcZppCneu61hmQYhAOFBL64sVC0ZNhmA/P8LR/2V
	9KmBbotKruvpDP9Jmd5fP1mU6ZL2RoFAMnbMpVfTB6QyHpvpoxxeb+ezC+2EN+kyFORoWzOWfNp
	nGM/+RELvisSteQ90pu9wBFvrlwvgZNxxUYPBFv0ogOGHj18b+rhCS4J3Dc0shHDSvxOjzsSweN
	MzdwNlDnjySdcRY9BosJuyd5f98JokzdCxWbjvqI7GTEIZ+eAAh87l4l6l9q89aoP3GidiT1x6+
	r767KMTB6oKshquOZbRKe1jyFD6ljmEH1OWMsEuSCXbQevWG+oqWrFJiKFr2qTG1f5aJZRE2vDX
	Lkxu9JXmRD1tfJaVmVZLy3MPTcpQufXpfK6y/mhrz0S+3K6E8bwk8AMfbSI0afFMqEb+I10b1Bp
	LpRvRqM
X-Received: by 2002:a05:6000:186f:b0:487:36a:c870 with SMTP id ffacd0b85a97d-4871e2123damr2944568f8f.11.1789725326057;
        Fri, 18 Sep 2026 02:55:26 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872008118dsm3345138f8f.30.2026.09.18.02.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:55:25 -0700 (PDT)
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
	Julian Braha <julianbraha@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v9 0/3] Add RP1 PWM controller support
Date: Fri, 18 Sep 2026 11:58:59 +0200
Message-ID: <cover.1789724999.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_105529_104233_729AF1F1 
X-CRM114-Status: GOOD (  18.74  )
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
a function. A subsequent patch will add a new device and driver
to read the RPM and export this value via hwmon.
 
Subsequent patches will also add the CPU thermal zone, which
acts as a consumer of the PWM device.

Best regards,
Andrea


CHANGES in V9:

All changes are in response of Sashiko's review (where applicable),
see:
https://lore.kernel.org/all/20260908132302.358D91F00ADB@smtp.kernel.org/#t

- linux/bitfield.h is now explicitly included to avoid compile
  time issue related to header refactory
- synchronized the exported function to read the tachometer with
  respect to both the system PM ops and the driver unbind/unload
- reworked the error path of all functions using regmap_read. As
  a consequence, rp1_pwm_apply_config() now returns and int for
  the error.
- made u32 cast explicit for the divisor of DIV_ROUND_UP_ULL
- moved teh struct initializer in rp1_pwm_read_waveform() to the
  top of the function to avoid overwriting part of the resulting
  data.
- dropped suppress_bind_attrs flag and replaced builtin_platform_driver()
  with module_platform_driver((), since the driver can now be
  unbound/unloaded.

Link to V8:
https://lore.kernel.org/all/cover.1788872294.git.andrea.porta@suse.com/


Naushir Patuck (2):
  dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
  pwm: rp1: Add RP1 PWM controller driver

Stanimir Varbanov (1):
  arm64: dts: broadcom: rpi-5: Add RP1 PWM node

 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  66 +++
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |  12 +
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi  |   9 +
 drivers/pwm/Kconfig                           |   8 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rp1.c                         | 499 ++++++++++++++++++
 include/soc/bcm2835/raspberrypi-pwm-rp1.h     |  10 +
 7 files changed, 605 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c
 create mode 100644 include/soc/bcm2835/raspberrypi-pwm-rp1.h

-- 
2.35.3


