Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F1BCD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 12:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FDGBJbL2NvS6X0WDh9bIw2fs6RpUDabbpuEEljscOpo=; b=36Dj1j1eJU1xOp
	plxgETQXh+mntlu1+tWs32HdiJewSM+2HqFi6lvSdUKFOvjE2E8sLmk7OubvICkuL1C30eLBAlcN9
	O+Ik7SN0XDzNFmN1vT7l47EPxo+XsW1OiBZXcWKjX4n+hw2oy20UdUQRqSAgyxcKL74/XeMWIAt00
	2kZqcNJ0YLzZao/h5gOREGU5w/XCDSo9pfYko0rtpkEvP2MTvXr1oRqK8yUOqj46xRSQTLfJDGUPy
	17y2FCIWYq4Weos9wVooyY1oU2P0bFG3R6zCIY083bIJrX+4MtENdIKTMWCQXh4Reu+X+OqWnW1y5
	Y6mDidLKkFUFx1KasDLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbMj-00000000knc-1LWj;
	Wed, 06 May 2026 12:28:37 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbMg-00000000kkb-0Rdr;
	Wed, 06 May 2026 12:28:34 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778070510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FDGBJbL2NvS6X0WDh9bIw2fs6RpUDabbpuEEljscOpo=;
	b=ZNgkf5CogPCNx8svAZzreW9bk3lgPrlUAWBzYpDfZmBFVxhzUHfdW9tX/Hy3gbeVNtlq2S
	t6Bi4HvY7v66txyGAlacry5iPq3Yv2Nv/okRCRiqY6jykZgRZ1oA3yQc0b+yL4GElGrrkc
	T+sCPFpqboTMSXhMRlpbzdmDt3CN8v8Dkm+ZDPKML9pYd9rxGdXXCPWq1lpSlDqFK8MWTK
	q2PmBZoFULkcjm/T0SdSvMsbXpo/VneMq9itZ1VIiUYcajSE/o2m+l6RF8KgevvqXOSD/r
	ucuk+0eXvFmsuHLyQBfXCXQHwf1S94AAWluJOWQ+YR+GatwilExhFSXlw864RQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778070510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FDGBJbL2NvS6X0WDh9bIw2fs6RpUDabbpuEEljscOpo=;
	b=vU5OMg5UjghUYmPTJ4HdtVqlPCgZHd+oFcmoBgobGRGqL4JV9MU/nh3hVrneXPp/PSqXgv
	nIjQ7PSeRTuk95BQ==
Subject: [PATCH v3 0/4] nvmem: Add Raspberry Pi OTP nvmem driver
Date: Wed, 06 May 2026 14:28:14 +0200
Message-Id: <20260506-rpi-otp-driver-v3-0-294602663695@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN4z+2kC/3XNQQ6CMBQE0KuYrq1pi1B05T2MC2l/5RtDyW9pM
 IS7S3FhonE5ycybiQUghMCOm4kRJAzouyUU2w0z7bW7AUe7ZKaEqsRe1Jx65D723BImIK5LZ0B
 a45y2bBn1BA7HFTxf3jkMzR1MzEputBiip+f6mGTu/cWT5IKDUFbaBioh6tMDuyGS73DcWWD5I
 KkPUYryh1CZOEhdgdGqLvQ3Mc/zCx9Rr8kFAQAA
X-Change-ID: 20260408-rpi-otp-driver-75fce1dcff7d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778070510; l=1864;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=h2DdwHnpSm9GT23TX10C4j5YVLHusim3g88AnD+8Q4U=;
 b=0iTh8vD+bgUXNiojQXakvPeAxiKwpUiQffjzRL/horECxeARB97nOoGjwOOPlOMEpfILf77gi
 +UM0N5E+yLJCl9YCH1zYWXfNzKZQ9QeY0gopBspOc5u3HtpkfeuyC7T
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_052834_290518_CB43925D 
X-CRM114-Status: GOOD (  11.34  )
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
through the firmware. Add a driver for it and add updates the devicetree
for the Raspberry Pi 5.

---
Changes in v3:
- dts: add "raspberrypi,bcm2835-firmware" as fallback and fix dt-bindings
- Fix Kconfig depends
- Changed firmware data fields to __le32
- Add MODULE_ALIAS
- Link to v2: https://patch.msgid.link/20260505-rpi-otp-driver-v2-0-e9176ec72837@linutronix.de

Changes in v2:
- register nvmem driver from firmware driver and drop firmware sub nodes
- Use struct_size and __counted_by for dynamic array
- Drop unneeded comment in Kconfig
- Use NVMEM_DEVID_NONE
- Use kzalloc
- Update module description
- Link to v1: https://patch.msgid.link/20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de

---
Gregor Herburger (4):
      dt-bindings: raspberrypi,bcm2835-firmware: Add bcm2712-firmware compatible
      nvmem: Add the Raspberry Pi OTP driver
      firmware: raspberrypi: register nvmem driver
      arm64: dts: broadcom: bcm2712: add raspberrypi,bcm2712-firmware compatible

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml      |  13 ++-
 .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |   4 +-
 drivers/firmware/raspberrypi.c                     |  59 +++++++++-
 drivers/nvmem/Kconfig                              |  10 ++
 drivers/nvmem/Makefile                             |   1 +
 drivers/nvmem/raspberrypi-otp.c                    | 120 +++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h         |  14 +++
 7 files changed, 216 insertions(+), 5 deletions(-)
---
base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
change-id: 20260408-rpi-otp-driver-75fce1dcff7d

Best regards,
--  
Gregor Herburger <gregor.herburger@linutronix.de>


