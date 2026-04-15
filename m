Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C170F41989
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 09:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Cc:To:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0S1RULijo9r2XPdAx3EQSidbIHHCDDTFTq0Beh9CygI=; b=yld9RuMrbbEY7x2tnx8RykVj+S
	Q46UtSC+dogtxhtAC19hOBCAbBWEmgi9zXnwyuFPAYJc+We/iyZ8OVz53naulw3uobUealwknhw3a
	HEssnky3RO8REpXEexh8Sb8DJLI0+JG+LU2SvD1WQqqezaIUFaCXT5H363p62tbtBbUmRwxMIT2Gk
	VD2un/CNhU+faNSLeMbAb/SXCDZ+0NWldtTYL7WkWZ/pa5sn2LEVbTHIRPQCgI+n0x6WOOxcuhZY2
	LLeEvpEJiWOzCpqYGkQn6onsHGGXMzka/Col067gOokfWynwFkwKmC4xtN+gX+cl30agDSYFLcicJ
	pXMR2xNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCwyc-00000000w9M-1J2y;
	Wed, 15 Apr 2026 09:56:06 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCwyY-00000000w8j-3lxV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 09:56:04 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wCwyU-0008Gi-E6; Wed, 15 Apr 2026 11:55:58 +0200
Message-ID: <382d28eb-557c-4cae-898c-8ed5c8cd7843@pengutronix.de>
Date: Wed, 15 Apr 2026 11:55:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
To: Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: [BUG] stm32mp135-dk: DT uses PA13 used for LED and button at the same
 time
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_025602_964734_37D20F75 
X-CRM114-Status: GOOD (  10.69  )
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

Hello,

I just noticed that barebox built against the v7.0-rc1 device trees
reports following error:

  ERROR: gpiolib: _gpio_request: gpio-13 (led-red) status -16

This is caused by the combination of following two commits:

57012d79fefd ("ARM: dts: stm32: add UserPA13 button on stm32mp135f-dk")
31f0d9a486a8 ("ARM: dts: stm32: Add red LED for stm32mp135f-dk board")

Both reference the same &gpioa 13. Linux didn't seem to mind, but
barebox fails the LED driver probe, because the GPIO had already been
requested.

Assuming it is correct that they share the same GPIO physically,
does the current DT description make sense though for actual use?

Blinking the LED would register a button press, so it feels that they
should rather be mutually exclusive?

Thanks,
Ahmad

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


