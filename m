Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BF0C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 13:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Cc:To:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cX1OfDtIXLtuDVp/SPdSy2fMX25aYejIexNtxmaQdYw=; b=ag23tc1Hn+7KWD/ZKvUuMMfqVZ
	kGa0U/mmgmFRJJD1Es4lNor84lt4JyWu3/F5yYZZDCeS00oIznyMSpoZSvFtW9YqUqKXz4pnHVTjk
	g1GkJrrEBRLt6RWS7t78vUFbxAldamq8jb7vKKCue/nQjH1L50VoqQPgzw0HmKHzmXj/xNPNRm4PO
	sdYgcsLxRL4Afp5VsLuASplDJTbm6NoxqxufhuCXpzs/tyx5ejia+389NLG86laHuPdEBcfV0qaQa
	1bS7ff81S83xhznEDlaFW5KL+7a3/JIiHmb0XL5Ed42/b4gLHIxgVjx5k5IA393zecaIW6fHdz+dd
	tOi5evsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCevn-0000000FabP-3yDy;
	Wed, 07 May 2025 13:35:27 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeZB-0000000FWjF-1v8w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 13:12:06 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCeZ5-0007je-Jh; Wed, 07 May 2025 15:11:59 +0200
Message-ID: <1d00c056-3d61-4c22-bedd-3bae0bf1ddc4@pengutronix.de>
Date: Wed, 7 May 2025 15:11:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
To: linux-gpio@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Subject: AT91 GPIO driver reading back struct gpio_chip::base
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_061205_500141_E8F5C9B6 
X-CRM114-Status: GOOD (  13.73  )
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

just stumbled upon this comment in drivers/gpio/gpiolib.c:

  /*
   * TODO: it should not be necessary to reflect the
   * assigned base outside of the GPIO subsystem. Go over
   * drivers and see if anyone makes use of this, else
   * drop this and assign a poison instead.
   */
  gc->base = base;

and thought to mention that there are drivers that indeed rely on the
base, e.g. drivers/pinctrl/pinctrl-at91.c uses struct gpio_chip::base
to find out which bit to set in a register:

  dev_dbg(npct->dev, "enable pin %u as GPIO\n", offset);

  mask = 1 << (offset - chip->base);

This needs to be fixed of course, but I don't have time for that right
now. Thus settling instead for writing this heads up. Maybe someone is
motivated to fix this and then do the equivalent of

https://lore.kernel.org/all/20250507-b4-imx-gpio-base-warning-v2-1-d43d09e2c6bf@pengutronix.de/

for AT91 as well, given that the driver is DT-only. :-)

Cheers,
Ahmad

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


