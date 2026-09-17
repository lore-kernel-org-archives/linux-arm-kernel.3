Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807F0C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t4lntru9GYBlyU5HcHrrBAQ9M2TehHHZ4GbaLqq2g98=; b=zHE/rteXxtebi5
	Y10vewP+yhlQ//J1YaTnRgxgO376iFp1XRVl9Illq48Lcpv3wpITJi6GM8l0OQGprLebwQekCQaTq
	WuzIxWNYyAVSpTkrh/nEC3DVJNM6u+Z1NVh2Elqp2a6aevvcv44+MshgGk0plhgW86VBojko6s9bQ
	NxJXHZUzwNMFAR9Cb2Iy8BawW+c7TQtv1AldEaVhKd2md8IIReWcza7UFrEG8njoPvm9P/glur3fA
	KoGeBu5jSsVcHGQPV7x+w08Ts3Jtr1gfjPW2idD/yhPtrnEePBrFHp9hzYsgUCiNhSEVyS1wds6xT
	ikxiwBj/WxVvtlUVRtlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EC6-0000000Bi24-09XA;
	Thu, 17 Sep 2026 15:38:38 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EC3-0000000BhxU-0dgL;
	Thu, 17 Sep 2026 15:38:36 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1789659509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=t4lntru9GYBlyU5HcHrrBAQ9M2TehHHZ4GbaLqq2g98=;
	b=r0OF0eSy/h4tCFYjSCMMNcm3LNwiuIHFpXJJsAZdfg3o66KcKZJQxQo7e7hfSupEh4N9cc
	eqifjgtXxCwh5azk8AxLXzZFtRoO959L095SxFUP5BX0qcC+VYajdPkcCxTxCvgg7QtrEe
	66EQTnFlzAW32ajZMJQBQQ3CpkKsaxZQrK4eAe30HZkw8X5dxA1uFubD9flWMnHQfMvmx0
	8i+FmedFtBuzAIMX1zD6JvZqDydfWpSkVwLu65k1wYwRQz6WOgjV4eyqfru2RW3/MqWtPs
	BfPZTHXhS1/DUPkVCfKzSIBSej9+ey8Uibns3RSXLIMnfPotUkDIKz/qHhBuvg==
Subject: [PATCH 0/3] spi: Better specification for rx-sample-delay-ns and
 core parsing
Date: Thu, 17 Sep 2026 17:37:34 +0200
Message-Id: <20260917-spi-sample-delay-cleanup-v1-0-0e4eddbfb1ce@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTuQRFD0KuJimvzVkRhDpxWl9
 O5GXX6L9xYyjAqjY7fQiKeaPkqD33QUr1IuYE3NFFzYuYPfs1Vlk3vN4IQsb44ZUubK0vvktgI
 XBqGW1xGDvn7r0/lvm/sb4vT90bp+AEvbMX58AAAA
X-Change-ID: 20260917-spi-sample-delay-cleanup-ab1d03ae02fa
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3071;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=MoG2KKKCOb8i6jNykCKvYIGrUNKtrQQ7X8DDkYY4Mgc=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWsNZ+mVGcFsxR+cHB97/C0smMajNNt2w6SF+VE183ICj
 4cJlOh2lLIwiHExyIopskjxW7y2NYv1kT9WHQUzh5UJZAgDF6cATETfnJHhS6JmwCYvxtitIjXO
 B403cYhJrd13g/965e4DAXOW2PY6MDJc27tq98YVBbOLYxatWRNZVbvmw2LGG0tD1u/s4rj5K+s
 0KwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_083835_342887_8BEDFFB5 
X-CRM114-Status: GOOD (  16.11  )
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

"rx-sample-delay-ns" has been a generic SPI peripheral property since it
was moved to spi-peripheral-props.yaml, but the core has never looked at
it, and what it is meant to describe has become blurred along the way.

It was introduced in 2015 for Rockchip, to compensate "boards with
high-capacitance SPI lines". The wording now in the generic schema came
later, from a description of a DesignWare register, and lost its
controller-specific qualifier on the way. It says what the value does to
the controller, but not what a board should measure to arrive at it.

Patch 1 says what the property describes. Patch 2 parses it in the core,
so that a controller driver can act on it without open-coding the
property name, and patch 3 converts spi-dw, its only user that reads it
from the peripheral node as the binding intends.

Deliberately not converted: spi-rockchip and spi-mtk-snfi read
"rx-sample-delay-ns" from the *controller* node rather than the
peripheral node, which contradicts the binding but is what their device
trees rely on. Converting them would break those boards, so they keep
their private parsing. The controller-wide default that spi-dw reads
from its own node is left in place for the same reason - it lives in a
different node, which is not what the core parses when it looks at a
peripheral.

The one behavioural corner is in patch 3 and is called out there: an
explicit "rx-sample-delay-ns = <0>" on a peripheral is now
indistinguishable from an absent property, so it no longer overrides a
non-zero controller-level default. There are two users of the property
in the tree and neither does this.

This is groundwork for letting SPI devices declare their datasheet
clock-to-output-valid time so that controllers can move their sampling
point instead of forcing a lower spi-max-frequency, posted as an RFC at

  https://lore.kernel.org/r/20260303-fsl-qspi-rx-sampling-delay-v1-0-9326bbc492d6@kontron.de

Nothing in that work is needed to read this series, and nothing here
depends on it: the chip side is a separate quantity that composes with
this one, which is why patch 1 spends a paragraph on keeping them apart.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Frieder Schrempf (3):
      dt-bindings: spi: Clarify what rx-sample-delay-ns describes
      spi: Parse the rx-sample-delay-ns peripheral property in the core
      spi: dw: Use the rx-sample-delay-ns value parsed by the core

 .../devicetree/bindings/spi/spi-peripheral-props.yaml       |  8 ++++++++
 drivers/spi/spi-dw-core.c                                   | 13 +++++++------
 drivers/spi/spi.c                                           |  9 +++++++++
 include/linux/spi/spi.h                                     |  9 +++++++++
 4 files changed, 33 insertions(+), 6 deletions(-)
---
base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
change-id: 20260917-spi-sample-delay-cleanup-ab1d03ae02fa

Best regards,
--  
Frieder Schrempf <frieder.schrempf@kontron.de>


