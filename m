Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C680FD5F87
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 08:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6A1h+9HC3APqXR8UyMvptWkzVFlPkLKI2m9Sq4M6ItE=; b=4f/F6iXDtgGV++
	FFgpwrJr5lA1SGRE6QTOgz9Tw06xXAzoAXu0HuoOQfcb0bcIBHzjwjtLCRuQqp1FO28LXPo/35RRo
	N5cVgph5TVCFn8dZBLwOhp+EZkPTDiRBf4+rHPFp56lN/nwEhdDqI2FFhjq2eAxt9dL/+C4SyPDBj
	cV49P5xr2ztRsLVGcBkrwb7FHMVCyHXLJZozgKQaRFryBLPt+fzsITgYe9LCAUxijfpvHzha5kAEd
	Xhuo3CwcUD+jNXS0mDUD9VPmg82WCx7Gd6T0Yg4sYMBL7fixk/EN20PB3NULhqm1dCj6irP8wvfgc
	gjWF7ha1kgOpD4NgBoNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANpu-00000008U1S-1Ruf;
	Wed, 08 Apr 2026 08:00:30 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANps-00000008U02-1EhC;
	Wed, 08 Apr 2026 08:00:29 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1775635221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6A1h+9HC3APqXR8UyMvptWkzVFlPkLKI2m9Sq4M6ItE=;
	b=HHD9p4/YljX+Nv72eDIr4whEyLFsGzpAEu7Zno5uvZBpPttPzv6yFMPVMoM8wrO5mun8Ac
	IV2Lw+LWC/ZyQvZAAZrqKkufR78VQ9OuyYYCzLVpIk0heV6EyUWwhGOcku0xaVzhZgmjKD
	JF/qvzEn021yY08ph7hd5V9FSGCdh1VDr4X9tV6ZftfnvUugVHi/e4VOV4WpVk7xd7I8/I
	TU6Axtn/zK/MU9eMdauHe7MoPvHbtRx0nJg/GwX7tWhw0QTXAkgpeET9GgZpzc80rOZahy
	5FwflC6laG9mWJLMncIFQB9QhJLCtxwWNUU78XCDNbkzVGeemZDuYc1sXjLgVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1775635221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6A1h+9HC3APqXR8UyMvptWkzVFlPkLKI2m9Sq4M6ItE=;
	b=YPJui6NTFrG3D7LStPcQ4nxiFkZwUmSdP9gFxVCOGI7YJTBZowqez+Ee9NESpTqgbfp8lN
	DEKm4qpjjfxhSBCQ==
Subject: [PATCH 0/3] nvmem: Add Raspberry Pi OTP nvmem driver
Date: Wed, 08 Apr 2026 10:00:14 +0200
Message-Id: <20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA4L1mkC/yXMTQ5AMBBA4avIrE1S4i+uIha0U8aCZkojEXdXL
 L/Fexd4EiYPbXKBUGDP2xqRpQnoeVgnQjbRkKu8UoVqUBzjtjs0woEE69Jqyoy2tjYQIydk+fy
 GXf/bH+NCen8vcN8PVLHlbnIAAAA=
X-Change-ID: 20260408-rpi-otp-driver-75fce1dcff7d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775635221; l=1157;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=OfYLblYeyNslABR/aS1zAOJHFFxGSxxMkAhGoDl7lmo=;
 b=wYmm7rugDanR1TnYH18EPD02sRhItxIwqClGGnnJmOKGKgJMjVFfKr4xsTryLjRTjha0Rxn+l
 yykyei0JQlLDqmaSgMeTj42Hw7a4Of/PAixxFj8SHRHf+jnnAxQtPQP
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_010028_513455_6CE1EC84 
X-CRM114-Status: UNSURE (   9.33  )
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

Hi,

This series adds support for the Raspberry Pis OTP registers. The
Raspberry Pi has one or more OTP regions. These registers are accessible
through the firmware. Add a driver for it and add the corresponding
devicetree scheme.

I also added the devicetree nodes for the Raspberry Pi as I tested the
series on it.

---
Gregor Herburger (3):
      dt-bindings: nvmem: Add a binding for the RPi Firmware OTP register
      nvmem: Add the Raspberry Pi OTP driver
      arm64: dts: broadcom: bcm2712: Add the otp nodes to firmware

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml      |  18 +++
 .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |   8 ++
 drivers/nvmem/Kconfig                              |  12 ++
 drivers/nvmem/Makefile                             |   1 +
 drivers/nvmem/raspberrypi-otp.c                    | 159 +++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h         |   2 +
 6 files changed, 200 insertions(+)
---
base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
change-id: 20260408-rpi-otp-driver-75fce1dcff7d

Best regards,
--  
Gregor Herburger <gregor.herburger@linutronix.de>


