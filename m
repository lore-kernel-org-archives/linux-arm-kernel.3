Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2130CC79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 07:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1mnRUam902TG8+jJPr9DI2ATj88hClkYZ0Txk+HpE6U=; b=L9L9VIaja11gCL
	kuUpDHC/ENFBtCmYtbG4XCuo/xd3MRjmnFo6e1mCUWsmHLPIxSlpx7/6Iat4Qp74J2iTQJw8BwxdJ
	b/zi0zszH071L82Hmrn41YGw0Zo6NTMXXDFjluYW+eVsx1ytVsO3G0F6pnNiSeDPs10zq0DjtV4JT
	ZpDpkucCRaj/Xgr2xpNyoXtbnyu9YhAbMWamqqDCaZNQl9bKc7QjUHDSsiYAhHYDJtVJy83Yx/vUO
	fhjxSBxgw2kwRxKXSkuhSNz9OZ1c4TbxTFxMQYWdkfn/iwETZlek2VfZI9qcUbpmrdBiNTSJ6krem
	GRjQKGa1j9jchO/82w9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Odb-00000001Gdz-3eZn;
	Fri, 04 Sep 2026 07:47:03 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2OdT-00000001GXI-3cte;
	Fri, 04 Sep 2026 07:46:58 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788508013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1mnRUam902TG8+jJPr9DI2ATj88hClkYZ0Txk+HpE6U=;
	b=giVOnXWZxiO5DHF73h4PzYJe538ZCmKe1wB27ixUTbFktMDtJ9VEynjwGyPPP/Cav85Fog
	B2n13/ISwdc7Vf2YxeWZ4e3Sl5b44yt2W7EZypeX7q02UD2khecS8X1ruqBw0OI1gRlmWF
	05i8Ykp+2A3b3s6g335Ku9Gi9eaxK8rPyCKOKpFtQieN/B03m/S2RhXL93VfuIQg1jQd6s
	R9sJViRV1w0NzH58soky3xmeUvlk2U7xsNEV+vChOMlufprSd+7Sb9bctr83A1bE5d44QM
	HuViap9c2Na4eRimwKEnXZUAxTNcOo1hd+lYHoEh3dkhYN9s9R2l+qo/Lbhixg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788508013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1mnRUam902TG8+jJPr9DI2ATj88hClkYZ0Txk+HpE6U=;
	b=/nnKPpb82xAr3FbYAKDXdDp4UOYKSsXJOV7YpGXXKHYGHx8gEveNNSW5IxytgxmtZj8AR5
	M7CwtUGwcFcqJ7Cg==
Subject: [PATCH v4 0/4] firmware: raspberrypi: Add support for the tryboot
 mode
Date: Fri, 04 Sep 2026 09:46:48 +0200
Message-Id: <20260904-rpi-tryboot-v4-0-fdee8bc53ff7@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGh3mmoC/23NQQ6CMBCF4auQrq0pQ9OCK+9hXEA7yBhDSVuJx
 nB3KcYoxuVL5vvnwQJ6wsB22YN5HCmQ6+chNxkzXd2fkJOdNwMBSigouB+IR39vnItcQgWmgkZ
 o0GwWg8eWbkvtcHztcG3OaGJKpIuOQnT+vrwb83T3LqtVecy54LISTW6kkZUW+wv11+hdT7etR
 ZbqI3z5Qqw9zL5VpQVrVF2D/ueLj9dCr32RvK1LaFGj1erXT9P0BP501bE8AQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788508013; l=2102;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=injOFXYCg99MpqtN/NqbI9Hc4Oaro/Dhz9C/CiXUlqo=;
 b=E1Yz8QJbd0SFChekiBWnZdNW4TSfqmfyaIE96cf3vKQiuJeQqIfUXPltTxM9WrpYM17C1t9c/
 yMRISESo3hRAtt/B++nNss8U+IjZVuuSYg6QEAnKQCbFM+hhSA5/Idr
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_004656_086546_0DFCC075 
X-CRM114-Status: GOOD (  10.52  )
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
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260623-rpi-tryboot-4292c92b0727

Best regards,
--  
Gregor Herburger <gregor.herburger@linutronix.de>


