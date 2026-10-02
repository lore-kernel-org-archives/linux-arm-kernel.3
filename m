Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F0BCA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wh9xWcUPndi1IraSPg61IdZ5HAFfOo8+nBKdXLgcsYk=; b=E05oAqMa8HziZS
	sfaN1N/u4Ow7j/AEaAH5GHynlQ2BLet3WQpsRJ1nm/EEgG6IBgCgoFOctPc9BjJ8gjXOcE/EGqJSC
	fQt3bJ6D7EFxH98B4mTOtcwd9Wtg99t+wL+FC9XR9TZrAwwauducpMxunyOywfzmXyIlfQ4vcQjus
	BU5gxaAkYlyNphxT3SjUp70OzA+qswtl46EQIbaAO26M8dATgfvM6R98+IT2G3bk3yUbPVGw0G081
	Tza3PxSRLhSJDAnqwwStPI+RinrMQSbxptPzNmC4drje17lEG4GFXTMcL4/mMqzR829CDHO5Ey6pu
	jxyocQeQqAc1JzunxZnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZxt-0000000BDhR-35jC;
	Fri, 02 Oct 2026 09:54:05 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZxq-0000000BDYZ-0KCE;
	Fri, 02 Oct 2026 09:54:03 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790934825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wh9xWcUPndi1IraSPg61IdZ5HAFfOo8+nBKdXLgcsYk=;
	b=DxWKWsQ6L1TcEcByD1j6oiyQQPGrGC50fu92G26ti3WDS836Q0VK6eprzZy5Q3uDWtu4rw
	u1xWBizUN2pwpK1IrFuRquvy7sL3BxYvipWRnnAv1K7TvGZvRV7FWO1McfSIpZYarW9GOO
	9oPIj+VCVHABI0Xt5rl0U5nThgMnYrp2b5Mxztjo9hP1jWLfeRjkj4xaJXjA0FKuVj51Bu
	A+90k7MkYfPJUR9B4RIq48EIkyytD5qK1RZv2Gi9EFGHsuxkviQq1r4fGIDAtE7Iuif86u
	WbsyvgQuviSxgsqBmXcxJqGvdpfsPvqfbuS1oOYxWibNEsT2E+ZVr2vhl0ImtA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790934825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wh9xWcUPndi1IraSPg61IdZ5HAFfOo8+nBKdXLgcsYk=;
	b=u1cvQAruZhuRQPiIGv/EM6X43zOPbRL2hkwWQgQseWl0Ol0qPf80PdXDVtlJoCvQ4MOZAa
	MZjw69RgJE/hyEBw==
Subject: [PATCH v5 0/5] firmware: raspberrypi: Add support for the tryboot
 mode
Date: Fri, 02 Oct 2026 11:53:39 +0200
Message-Id: <20261002-rpi-tryboot-v5-0-6294c131e583@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACN/v2oC/23NQW7DIBCF4atErEuFBwKmq96j6sLA0ExVmQiIl
 Sjy3WMcVanVLJ803z9XVjATFva2u7KMExVK4zL2LzvmD8P4hZzCshkI0EKD5PlIvOaLS6lyBRa
 8BScMGLaIY8ZI57X28Xnf5eS+0deWaBcHKjXly/pu6trdb1lvylPHBVdWuM4rr6wR7z80nmpOI
 51fA7JWn+CPl2LrYfFR9wGC18MA5pmXD2+E2XrZfBh6iGgwGP3Mq4e3Qm29Wj1i7/xexvjv/zz
 PNz7g0+l8AQAA
X-Change-ID: 20260623-rpi-tryboot-4292c92b0727
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790934824; l=2259;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=ommQaz+996XWxGAdGpfsl57SPv5twf2rtNuOL2c7ogM=;
 b=b/2QVIcc7mFLdMeZX3+sGemj49mgaowYSfkGK9YQhk178XMi43yy1CH18O8QlkrSa2sfSbAqZ
 PtAy/WVTpIFBWge0EJhKaD9iY1K1hRdpYmjvqcTqOKw5YrjfuO2hZ1y
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_025402_281202_909DC5EB 
X-CRM114-Status: UNSURE (   7.21  )
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

This adds support for the tryboot mode on Raspberry Pis. As there is no
documentation other than the downstream implementation [0] the
implementation is based on this.

Tested on Raspberry Pi 4 and Raspberry Pi 5.

[0] https://github.com/raspberrypi/linux/commit/eb56da0c1925c07e8929ce4c9fe8aeafa7cb8c7b

---
Changes in v5:
- Added patch to add reboot mode to Raspberry Pi 1-4 devicetrees.
- Rebase onto v7.3-rc5
- Link to v4: https://patch.msgid.link/20260904-rpi-tryboot-v4-0-fdee8bc53ff7@linutronix.de

Changes in v4:
- fix use-after-free error by moving devm_add_action_or_reset before devm_add_action_or_reset 
- Rebase onto v7.3-rc1
- Link to v3: https://patch.msgid.link/20260707-rpi-tryboot-v3-0-fda82fe7ed76@linutronix.de

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
Gregor Herburger (5):
      firmware: raspberrypi: reorder rpi_firmware_property_tag enum
      dt-bindings: raspberrypi,bcm2835-firmware: Include 'reboot-mode.yaml'
      firmware: raspberrypi: Add reboot mode support
      arm64: dts: broadcom: bcm2712: Add reboot modes to firmware node
      arm: dts: broadcom: bcm2835: Add reboot modes to firmware node

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml      |  9 +++++
 arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi        |  2 ++
 .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  2 ++
 drivers/firmware/Kconfig                           |  2 ++
 drivers/firmware/raspberrypi.c                     | 40 +++++++++++++++++++---
 include/soc/bcm2835/raspberrypi-firmware.h         | 22 ++++++------
 6 files changed, 62 insertions(+), 15 deletions(-)
---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260623-rpi-tryboot-4292c92b0727

Best regards,
--  
Gregor Herburger <gregor.herburger@linutronix.de>


