Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241DDC624D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 14:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r3NuArli8YmZC5IlHt4V7im8YxCZ8U4oEjJSqoHJ/Es=; b=JeBi8M44FGiyCw
	goeM1Nd/wqD1wgw/bCMI4SjdpAZH4mQJsPajXyLKPusdZtJ2P9R+9NhqHnuIjLiQqBbXzwpbnbY64
	EpubPskmPSWxIOmgb+MNPJzOxYsdraLhClvvGWTpqWPwv+6njxtadUIV8LMq6iHnl/hIVAeZ2C3Qq
	cqgwec2r1I6MtPO6+i5fZoNtd+zK/DhbE6ZpYXMJ0V9COWBBvCd/fQyaLlu391OtsjZ6d5pr/J6ft
	JSQcvl+VoZh2vbB3iNIeQmtRVOvrA0WUn681j+C40kRSbTxHPulRuisJy3m7h/LEA3QTHKZKhPVVz
	SkA6iKXfeamQrYh1f1ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28k7-0000000HYJ7-1xGI;
	Thu, 03 Sep 2026 14:48:43 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28k3-0000000HYG5-1OMv;
	Thu, 03 Sep 2026 14:48:40 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788446914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r3NuArli8YmZC5IlHt4V7im8YxCZ8U4oEjJSqoHJ/Es=;
	b=mA07u7Op0A8cujKltEAeKdK0q2Py9oeCNIm6CqwGlzSDDtejNp3t2HvzMkvoShCQMKJ7oX
	ag4ksjj+9nF6DCdbcfuNVsMi0Q5tXgiXCR1ekCTPv9RY46pW5QTAEa9i7lTNT1nVI74DYX
	EvBnhxGRPAD/4ppTjPwsxYNR0lrLT0eUVLRTOHU3aW0Zm6CNyV9S4MfWvofQP5vHqYzntk
	ImJidLhn9s3FFsdz+vn1U+LYqqe3S4FgWI+xiRK6VlfqRamF9Kc6+WcfBiJgJGHUUgx/7r
	EmT19LVFBfVpwuCvOfJTw2TmJ8IVav6ZtOZp0Uarm7wBUCZtOiKgj8bh1BLhzg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788446914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r3NuArli8YmZC5IlHt4V7im8YxCZ8U4oEjJSqoHJ/Es=;
	b=f0BWuNmUtGu/YroonxfBBWE1FiYBQQt3KWD/0CPLzZX+ebL7tP0YIfdw7DiaZKesZwZZWD
	5VKss09Hrlo7QpAg==
Subject: [PATCH RESEND v3 0/4] firmware: raspberrypi: Add support for the
 tryboot mode
Date: Thu, 03 Sep 2026 16:48:24 +0200
Message-Id: <20260903-rpi-tryboot-v3-0-ce94c347e932@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Eric Anholt <eric@anholt.net>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788446914; l=1925;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=14lHZ5IUE0OuXdbjmNVpbHbGuq87FsQqQ2MFozbW3Iw=;
 b=dDcRSE52L1L67dM9M+0Nj8EM/SKASdJ34aZkUnY/lx8lMYkKMcnpci7z3QfNd9GFrm5UYeqvm
 /nco4GU/OWjBVXmfds2u3YQX9eWPKbwGfTuxwsQd09LGSEHIGIA/QOI
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_074839_520317_EC3B69A3 
X-CRM114-Status: GOOD (  10.75  )
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

This adds support for the tryboot mode on Raspberry Pis. As there is no
documentation other than the downstream implementation [0] the
implementation is based on this.

I tested this on Raspberry Pi 5 and therefore I only added the
properties to this devicetree. But afaik this should work on all
Raspberry Pis. I will add it to the correspondings dts if I get some
hardware to test it.

[0] https://github.com/raspberrypi/linux/commit/eb56da0c1925c07e8929ce4c9fe8aeafa7cb8c7b

---
Changes in v3:
- fix use-after-free error by using devm_add_action_or_reset
- ensure endianness of magic byte
- refactor reboot mode registration into separate function
- Link to v2: https://patch.msgid.link/20260630-rpi-tryboot-v2-0-f68d2dc6aa27@linutronix.de

Changes in v2:
- Remove unnecessary reboot_mode_unregister().
- dt-binding: restrict to mode-{normal,tryboot} and only allow 32bit value.
- Link to v1: https://patch.msgid.link/20260626-rpi-tryboot-v1-0-490b1c4c4970@linutronix.de

---
Gregor Herburger (4):
      firmware: raspberrypi: reorder rpi_firmware_property_tag enum
      dt-bindings: raspberrypi,bcm2835-firmware: Include 'reboot-mode.yaml'
      firmware: raspberrypi: Add reboot mode support
      arm64: dts: broadcom: bcm2712: Add reboot modes to firmware node

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml      |  9 +++++
 .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  2 ++
 drivers/firmware/Kconfig                           |  2 ++
 drivers/firmware/raspberrypi.c                     | 40 +++++++++++++++++++---
 include/soc/bcm2835/raspberrypi-firmware.h         | 22 ++++++------
 5 files changed, 60 insertions(+), 15 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260623-rpi-tryboot-4292c92b0727

Best regards,
--
Gregor Herburger <gregor.herburger@linutronix.de>
-- 
Gregor Herburger <gregor.herburger@linutronix.de>


