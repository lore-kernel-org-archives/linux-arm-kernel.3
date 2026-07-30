Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD82C55160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 10:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r3NuArli8YmZC5IlHt4V7im8YxCZ8U4oEjJSqoHJ/Es=; b=GXuztFT9PlRRDw
	DX3XBS3H9IvCEkLUZPShFKi7ljGFcdW+EZM3xYiYR2yAY/opK2jh4N4VK/kJZKiHRw+xZjnuwEhRS
	xyOVIHGXpLJRsy97D7QUUIEh5TA9Mw4Enh9AjwapWiXN8vmev08SGx2HO9LEv/VEVR4oJOJLFUMFv
	yCvzDJCXhlam55JfFONnTUdg+4Y2GZ9t2PT3LJBtFmWB4fu6irvqVKWtWRCnoDahhYuYLqkGDl57r
	GVbajURPUXNi7Jo074yE0OSjzLPAqmSC0HjkMK/XTMVjhudT7DSnHS6Vp9fGmzJBdozmM3rwKxLST
	Wd9kL7nH/vSMH3hY8NcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOUK-0000000AI02-3e1M;
	Thu, 30 Jul 2026 10:59:44 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOUI-0000000AHxO-2Aem;
	Thu, 30 Jul 2026 10:59:44 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785409177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r3NuArli8YmZC5IlHt4V7im8YxCZ8U4oEjJSqoHJ/Es=;
	b=YA7VT7EeUTg2vOlW8X7IrFSn78rdgh1WEyzj6JDLbGpBZLDW0e1UHA2RqYGP6UyvLExCXf
	Dpdla9ZXzDHs/K7OIwC6I9j10QUADxT25krn6q4f4iodxwh08p61tPMThclJGa7uKvxCCb
	nUsKBcXGSAU/9OdoaaLxpyHsyvYWsF1Dr+0YWp0mztxFpNmKVEoHnEAP+oc79rs/gZ38/X
	jrAS6VTcuRJjMhO+OWqa2BpknokiJkybNHEg0qFMg+lBVuOwjDJHiK5buIsYQDi8/JLtaU
	JrKdi+CRG0anmhib2OegsGOh4kMkmfHoYhscilebsnrh5sX8tv22A7/Nnz024g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785409177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r3NuArli8YmZC5IlHt4V7im8YxCZ8U4oEjJSqoHJ/Es=;
	b=nz4OSFrps5L5DKc/EY7yOm2A6/5S49TydVsQCSagMDRaFNEHpTZj+Ff+L4OLMlR1bKY/xc
	AMiKTSMaPj9f1jDg==
Subject: [PATCH RESEND v3 0/4] firmware: raspberrypi: Add support for the
 tryboot mode
Date: Thu, 30 Jul 2026 12:59:29 +0200
Message-Id: <20260730-rpi-tryboot-v3-0-849c001d67f8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785409176; l=1925;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=14lHZ5IUE0OuXdbjmNVpbHbGuq87FsQqQ2MFozbW3Iw=;
 b=PaPjb2p/nq+vZ+6iI/RX1FowZdUJzHdrO225yCv/SGj/ErrizQS2QWU4AN6Dg6utWM/UAPL+h
 +JrDBGgysdmDoajTy1UEOU4REStAUy1UX91smPsvnziJJwjpVp45+XU
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_035942_699839_7AEF4FE7 
X-CRM114-Status: GOOD (  10.56  )
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


