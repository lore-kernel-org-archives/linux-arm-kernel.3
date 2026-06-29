Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316DEC43638
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 14:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ETX6BMPlU/JAn2hXCjPUlk/g2+/b3iLqO7zgGhw/nm4=; b=TKrrPZ99+UO9yc5xZ+ESCiRCRv
	KAPiVe9zFWORr+GAzXkIpOhX2AY7GSduesnETl8aPTqjUJQsfHj499ML5cGhxubw7ItyyH7pMBwO/
	Hz6zgMNQqavyrG/rnX6jS3ripsJJpj65zmRlbxiBcRaojRo+kq2+ffwz1OwlmI+zvL1VmQdQY6efm
	VYjYNaS7wzmbUnyG04y4Xm/xaIIqxQEAsO8EKkhAdCMUlJGk2iNDooiK2ZdUmydKW4aLbOiByQETa
	BO4wa9sFeuiEUXRcwvun4Xn1P/oDzyf/8pFBUvqpqvS7xvuKi+VA0BiuVG6KaVi13+h4tz2wtrd5V
	HTbavd1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCY1-0000000Ep9t-2Axo;
	Mon, 29 Jun 2026 14:01:17 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCXz-0000000Ep9N-3RaX;
	Mon, 29 Jun 2026 14:01:17 +0000
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gpnxf56FLz1r5hc;
	Mon, 29 Jun 2026 16:01:10 +0200 (CEST)
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gpnxc5SYXz1r5hL;
	Mon, 29 Jun 2026 16:01:08 +0200 (CEST)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.87])
	by mail.m-online.net (Postfix) with ESMTP id 4gpnxb4V3wz1qqlS;
	Mon, 29 Jun 2026 16:01:07 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.6.182])
 by localhost (dynscan3.mail.m-online.net [192.168.6.87]) (amavis, port 10024)
 with ESMTP id 0SnzNWDJyvXI; Mon, 29 Jun 2026 16:01:01 +0200 (CEST)
X-Auth-Info: MEDGnkGkok4HHiiAHx6Yp9YpyEe4vG/D2GYhM3WXSTA4/H/l6K4jcFYiosjPmxQG
Received: from hawking (unknown [80.255.5.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 29 Jun 2026 16:01:01 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-gpio@vger.kernel.org,  Arnd Bergmann <arnd@arndb.de>,  Bartosz
 Golaszewski <brgl@kernel.org>,  Andrew Lunn <andrew@lunn.ch>,  Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>,  Gregory Clement
 <gregory.clement@bootlin.com>,  Frank Li <Frank.Li@nxp.com>,  Robert
 Jarzmik <robert.jarzmik@free.fr>,  Krzysztof Kozlowski <krzk@kernel.org>,
  Greg Ungerer <gerg@linux-m68k.org>,  Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>,  Hauke Mehrtens <hauke@hauke-m.de>,
  =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,  Yoshinori Sato
 <ysato@users.sourceforge.jp>,
  John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,  Linus Walleij
 <linusw@kernel.org>,  Dmitry Torokhov <dmitry.torokhov@gmail.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Dominik
 Brodowski <linux@dominikbrodowski.net>,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org,
  patches@opensource.cirrus.com,  linux-m68k@lists.linux-m68k.org,
  linux-mips@vger.kernel.org,  linux-sh@vger.kernel.org,
  linux-input@vger.kernel.org,  linux-media@vger.kernel.org,
  netdev@vger.kernel.org,  linux-sunxi@lists.linux.dev,
  linux-phy@lists.infradead.org,  linux-rockchip@lists.infradead.org,
  linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/13] treewide: replace linux/gpio.h
In-Reply-To: <20260629132633.1300009-1-arnd@kernel.org> (Arnd Bergmann's
	message of "Mon, 29 Jun 2026 15:26:20 +0200")
References: <20260629132633.1300009-1-arnd@kernel.org>
Date: Mon, 29 Jun 2026 16:01:00 +0200
Message-ID: <mvmik71win7.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_070116_034756_BB2FE347 
X-CRM114-Status: GOOD (  10.46  )
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

On Jun 29 2026, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The linux/gpio.h header used to be the global definition for the gpio
> interfaces, with 1100 users back in linux-3.17. In linux-7.2, only about
> 130 of those remain, so this series cleans out the rest.
>
> In each subsystem, we can replace the header either with
> linux/gpio/consumer.h for users of the modern gpio descriptor interface,

A few of them already used <linux/gpio/consumer.h>, and is duplicated
now.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

