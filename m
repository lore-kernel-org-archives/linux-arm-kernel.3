Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8CACDE012
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 07:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9GRuIO419e5m6wb0FB48wW5pogsLj5pIdchxBZ3+u2o=; b=X5ZJIbM0Oa/6+p
	SF6vrhpDf1LSMGKmCFzWcUP55z+q/JP21vvbk3uMm5Vq0nFYrgONsInAzJh+TtkHrVUFNTKzVdcLd
	mEw/4CGWRWziLt2JDlgajO18HkvMtSFbZfzcfeZlUXXw28Wr5AaJAb/8eR3R8WsOq8OMntpTNTtnk
	9fF+JAIqD1jrdEDf00gY89eradnrNQXXou8+dQC0cHIZv3p7TgkwgTNbdWBRx96y/8OHzkSjBvXKv
	p2mEmW4ehAP7Nw9tVnZ7WlG9kXMiAYBsACdVIH2gyqjsHV4C4f8YSYJuW8kRA9uHekpp3kUG/Jc1d
	bfzOdBfpYYcrIRm0umEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd15s-0000000AgIC-0dXX;
	Fri, 26 Jun 2026 07:35:20 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd15k-0000000AgFH-3jay;
	Fri, 26 Jun 2026 07:35:14 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782459308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9GRuIO419e5m6wb0FB48wW5pogsLj5pIdchxBZ3+u2o=;
	b=lSQFQ8wgCFPKuNfr8GpEUoBucUfSL/T+1FCR0GCQ7+5vWG9HWYBmQAt7lncQEMuiuFRYjE
	6A10cSl+vMhG+kDIckX8yJXv/Eo84cTPldCPTtZ9dvpHaPy4AwWApejYTcVFxeMNXQmdCz
	uPIdR6MuIQtFgMqbBocosCjTRJu70HLik90703JcIzH4c6H9rXCGASrd8i8SeX89Eih7HA
	eeVDmPRLP8BLO2p5k+2/Siu6EeCr6YKx6do+zJw5Zv5qBWfIublMC4E5u+XnrGsx0IE6jb
	cdlH/QJlOF36nOa20fVoSjOsRhFVnoNINGcNLmmiebS1RfI7cCrs2D9FQVWWnA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782459308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9GRuIO419e5m6wb0FB48wW5pogsLj5pIdchxBZ3+u2o=;
	b=CGCswwCU2AG0fPG5BVi5e2+QUucOTc/Gzu8p+U4hQeAZAvLwaAgXqOI52kMyDDlXAYqkoP
	5qFQVMtwZL/W4DAw==
Subject: [PATCH 0/4] firmware: raspberrypi: Add support for the tryboot
 mode
Date: Fri, 26 Jun 2026 09:35:03 +0200
Message-Id: <20260626-rpi-tryboot-v1-0-490b1c4c4970@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKgrPmoC/yXMMQ6DMAxA0asgz0QKLgKFqyAGEtzWHRLkBARC3
 L0Bxjf8f0AkYYrQFQcIrRw5+IyqLMB9R/8hxVM2oMZGN/hSMrNKstsQkqrRoDNodYst5GIWevN
 23/rhcVzsj1y6FnCef29/kw1vAAAA
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
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782459308; l=1368;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=c/QrJu/c2JdN8x7ZF3z4GlXwCTUZSadQRyVg7QFrW4I=;
 b=R7tnq4yZgYV09EtDGuFaZnbfnR7oEs4eul28Buu89lakJuHyPhZL+jk+1zQB+h2VbSsokAsXy
 lTaFiQX+YXiBMVAtmbPwoUyFH2aDeOupWjX/Czcba8nnNjYH1+nPhZG
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_003513_098310_529EE864 
X-CRM114-Status: GOOD (  10.22  )
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
Gregor Herburger (4):
      firmware: raspberrypi: reorder rpi_firmware_property_tag enum
      dt-bindings: raspberrypi,bcm2835-firmware: Include 'reboot-mode.yaml'
      firmware: raspberrypi: Add reboot mode support
      arm64: dts: broadcom: bcm2712: Add reboot modes to firmware node

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml      |  5 ++++-
 .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  2 ++
 drivers/firmware/Kconfig                           |  1 +
 drivers/firmware/raspberrypi.c                     | 25 ++++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h         | 22 ++++++++++---------
 5 files changed, 44 insertions(+), 11 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260623-rpi-tryboot-4292c92b0727

Best regards,
--  
Gregor Herburger <gregor.herburger@linutronix.de>


