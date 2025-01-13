Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECDCC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 22:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wHgNI30FIRLmiB1sqGDtaulbGiT7oavU3GyKrdsMwjo=; b=N4hQoy1TlU55e5
	mw8mxE7MoAQHBKOrRVcYzzESA6X8374nIw6Tlq/tyvcSUj+mp27peG2H1IziqWqLGF+vNl16KSXdH
	ZeE/i5F8tan4n3vxQWL0KTxAMhvWpkXCimiMagP3UoShU7qZkKxOo+T6NkvvcPKMF0EtWhgujZ8V3
	L0RUI4I3HXWcW3aHf8rArV2qpQhasZRpPHNjdMnEJF6fjvL85bsZd4uO3f9LVjQKkTLbdrTgn1A8L
	1FzvJRzgn84KyEkL5+bSa72wa7eBmiO9Rqr5sYTWARVMGaLn4CyVxmwoWay7lT2Ph5RxhKLQKelUB
	7m73zG8dtiaXGiRDwfmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSou-00000006nvg-0UZr;
	Mon, 13 Jan 2025 22:22:04 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSmZ-00000006nY0-00Jc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 22:19:40 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSmF-0005yi-7t; Mon, 13 Jan 2025 23:19:19 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSmD-000KYe-27;
	Mon, 13 Jan 2025 23:19:18 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSmE-008p8i-2b;
	Mon, 13 Jan 2025 23:19:18 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH 0/4] gpio: mxc: silence warning about GPIO base being
 statically allocated
Date: Mon, 13 Jan 2025 23:19:08 +0100
Message-Id: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFyRhWcC/x3MQQqAIBBA0avErBvQMrKuEi2sJptFKgoVhHdPW
 r7F/y8kikwJxuqFSBcn9q5A1hWsh3GWkLdiaETTCSlbXBTy+aAN7HExifA20bGzqPbBkB607jc
 BJQ+Rdn7+9TTn/AFVrBsJagAAAA==
X-Change-ID: 20250113-b4-imx-gpio-base-warning-4f9ae89887d0
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Whitcroft <apw@canonical.com>, 
 Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Haibo Chen <haibo.chen@nxp.com>, 
 Catalin Popescu <catalin.popescu@leica-geosystems.com>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_141939_042400_DC468F0C 
X-CRM114-Status: GOOD (  11.54  )
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

The i.MX GPIO driver has had deterministic numbering for the GPIOs
for more than 12 years.

Reverting this to dynamically numbered will break existing setups in the
worst manner possible: The build will succeed, the kernel will not print
warnings, but users will find their devices essentially toggling GPIOs
at random with the potential of permanent damage. We thus want to keep
the numbering as-is until the SysFS API is removed and script fail
instead of toggling GPIOs dependent on probe order.

Yet, the warning:

  gpio gpiochip0: Static allocation of GPIO base is deprecated,
  use dynamic allocation.

is annoying and prompts people to set the base to -1 from time to time.

Let's workaround this by adding an opt-out for existing drivers and have
i.MX make use of it.

---
Ahmad Fatoum (4):
      gpiolib: add opt-out for existing drivers with static GPIO base
      checkpatch: warn about use of legacy_static_base
      gpio: mxc: remove dead code after switch to DT-only
      gpio: mxc: silence warning about GPIO base being statically allocated

 drivers/gpio/gpio-mxc.c     | 23 +++++++++++++++++++++--
 drivers/gpio/gpiolib.c      |  2 +-
 include/linux/gpio/driver.h |  5 +++++
 scripts/checkpatch.pl       | 11 +++++++++--
 4 files changed, 36 insertions(+), 5 deletions(-)
---
base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc
change-id: 20250113-b4-imx-gpio-base-warning-4f9ae89887d0

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>


