Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCF5C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 20:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6pnDx8fNJobN9rbe3wNwxHqZd8eR6bqb/8fO1Oo1YFE=; b=xpGusmGlaTFuP7oH50YQk+PLSc
	zCaz3gOqeUd670Ve5YPhtJOWFTBSyi5e9Z2KHL9+pb+ZuFAhuwxgTBsP4rqYf9wbBFDusgjIJJvPy
	TeJJbnN9km5DHPwxK/DOwSLFeFI1Mz36fkGIXABTvo/RgoRMN/929KdsQBJo1Lic2jJwpXVhlfa8f
	Pyb0yBN8V/A4VIvHzIwzBxjFfG4WO0zDIX6QAiUvwJlMNySAqGaPpDoKSn7DJYLRY+CX2jpUWOeqh
	9ixrmrEz4MisBepJD3QiCShxmhtLSiddll5fV0PvQbs97ISJuXYgtpQdgcTWr2vNg14/6jPRTZftI
	LxCjKYrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2E6G-00000000YSg-2jOT;
	Thu, 03 Sep 2026 20:31:56 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2E6D-00000000YRt-2ak0;
	Thu, 03 Sep 2026 20:31:55 +0000
Date: Thu, 3 Sep 2026 22:31:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788467509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6pnDx8fNJobN9rbe3wNwxHqZd8eR6bqb/8fO1Oo1YFE=;
	b=N8QAsxcWwwdlcbXC/1gZYHLdz20tGbSKaPShPKii8yExQeiJbkjDjign6PQZaIuZqhLBpd
	tj46UtpqaA6LZZkvyRuIAnz3/9STTfU4hlsVQcSv6Cbvhu+AplU2IzSycqQ8ctF0NxJVLZ
	FFsYcw3gq/zyH4nA5ChVxCy+sEUrzXh78CM+hT4yLhRi5oB44BVGk7G9WNEJj/AnjlcRsW
	7XAtQDDVTC4Xl3+vy4wuvZvApizApuHmRyttbFd6nO42jbwnj9MzVunGbDjTT7zm0Nn8uR
	MAEZeAQn2a0iRzek6mgEz9b7+J/gZvfbDF51yuqeoJDHC371ft1Jcbtka9Nxng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788467509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6pnDx8fNJobN9rbe3wNwxHqZd8eR6bqb/8fO1Oo1YFE=;
	b=QknhE9zhIuoEYMZn/xI0i+3CR53zw1LZpaisgIVS4XOEU011yFIRRgVTc3vL22wfINo1mE
	4W0YI2+fPhMRo8DA==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v3 3/4] firmware: raspberrypi: Add reboot mode
 support
Message-ID: <a35cclkfw7w5b5dqgitnewfrw56ouwymkra3jmxbbtynrojghc@bzkz4xnrztur>
References: <20260903-rpi-tryboot-v3-0-ce94c347e932@linutronix.de>
 <20260903-rpi-tryboot-v3-3-ce94c347e932@linutronix.de>
 <f85ebc81-c9e8-4014-bfed-66f9570eb1d2@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f85ebc81-c9e8-4014-bfed-66f9570eb1d2@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_133153_803922_37B0123C 
X-CRM114-Status: GOOD (  23.86  )
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

On Thu, Sep 03, 2026 at 08:08:22PM +0200, Stefan Wahren wrote:
> Hi Gregor,
> 
> Am 03.09.26 um 16:48 schrieb Gregor Herburger:
> > The Raspberry Pi firmware has a tryboot mode where it tries to boot from
> > another partition. This can be used to create a A/B update scheme.
> > 
> > To enable this on the next boot, the RPI_FIRMWARE_SET_REBOOT_FLAGS
> > message must be sent to the firmware. Add support for this by
> > registering a reboot mode driver.
> > 
> > Furthermore, safely registering the reboot mode requires adjusting the
> > teardown sequence. Replace the manually called rpi_firmware_put() with a
> > devres-managed called (devm_add_action_or_reset). Without this, the
> > cleanup function of devm_reboot_mode_register() would trigger a
> > use-after-free error by attempting to access the firmware context after
> > it had already been freed by rpi_firmware_remove().
> > 
> > Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> > ---
> >   drivers/firmware/Kconfig                   |  2 ++
> >   drivers/firmware/raspberrypi.c             | 40 ++++++++++++++++++++++++++----
> >   include/soc/bcm2835/raspberrypi-firmware.h |  2 ++
> >   3 files changed, 39 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> > index bbd2155d84838..34605bf7c9734 100644
> > --- a/drivers/firmware/Kconfig
> > +++ b/drivers/firmware/Kconfig
> > @@ -115,6 +115,8 @@ config ISCSI_IBFT
> >   config RASPBERRYPI_FIRMWARE
> >   	tristate "Raspberry Pi Firmware Driver"
> >   	depends on BCM2835_MBOX
> > +	select POWER_RESET
> > +	select REBOOT_MODE
> >   	help
> >   	  This option enables support for communicating with the firmware on the
> >   	  Raspberry Pi.
> > 
> this part doesn't apply anymore. Did you rebased against 7.3-rc1 ?
I have not rebased. I just sent the series out again to get some feedback. I
will rebase it and send it again. Sashiko found an issue anyways.

> 
> Best regards

Best regards
-- 
Gregor Herburger
Linutronix GmbH | Bahnhofstrasse 3 | D-88690 Uhldingen-Mühlhofen
Phone: +49 7556 25 999 35; Fax.: +49 7556 25 999 99

Hinweise zum Datenschutz finden Sie hier (Informations on data privacy 
can be found here): https://linutronix.de/legal/data-protection.php

Linutronix GmbH | Firmensitz (Registered Office): Uhldingen-Mühlhofen | 
Registergericht (Registration Court): Amtsgericht Freiburg i.Br., HRB700 
806 | Geschäftsführer (Managing Directors): Dr. Wilfried Wessner, 
Katharina Kopp, Alexander Gieringer

