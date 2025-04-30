Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C635C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 08:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qwk49apGdChV5JZGiqEylFepdwmcqjzUOJTqLuSzy70=; b=0A3ZVYh22N27WqKHGGhhj3uc+F
	bkxC0vrqeRInbZi3DV9ppEJEPNk3D9XQS5Gq6WZf6sj0FmbE3YH8yGLeQIRZobjUG8GCZ20khMESP
	yldPLFGL9GN5Lo0myWuU2Mbc09D5aedQIN+NLMTtvavQlsrGFzYRYR+ELFWWiM3ZGyCrory+NvAr3
	xtzGUX8Ceny8e9OSfSJHv2hy+AYDlgTTl1sfSYaM2FlNSPOzhcwpQNh3J0l1WgsdTzUlc/MLzjOhf
	KW79UwCFO8SWcCwcX0lyAW1Rqtl1zB+t15deC2X1x9fXvxBq7w6EzQVTWLAWTN9LBUrzX0F6zEeFf
	Qsl0T/0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2uV-0000000CAkV-25oJ;
	Wed, 30 Apr 2025 08:35:19 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2NZ-0000000C4vs-3vr0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 08:01:20 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 35DEE1F969;
	Wed, 30 Apr 2025 10:01:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1746000073;
	bh=Qwk49apGdChV5JZGiqEylFepdwmcqjzUOJTqLuSzy70=; h=From:To:Subject;
	b=qza0LVi/m2HVbgsx5wPZ2FtmT7C3PHPi6mEHLul28C5RUkukL9Y99CETWlrSzEmYT
	 /onAc2BzSyL8esA5FVRV2j2LWwUKd2IWD6u7rXhhzNH0VmmOXFQH2tCikLIi1785PS
	 VBS7t4lAzvGefP/J42axieMW7vhXTrosZlnRfiYKxjAriW2SRdQRhVehSmDJH5Yrjn
	 r36yWuEvvaeGKi6TWZs6Fjvddh6La7HD5SL8yBl03FnPLQFfF4uzlku0g2iDcY2em8
	 S+5AafpdlscJJyxwJRDEC/fQosP+ZFDyeFsR1K/9oePSqI8yxays62bWn5m+tugHYZ
	 V/w3WsBIFGUYA==
Date: Wed, 30 Apr 2025 10:01:09 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Jerome Neanne <jneanne@baylibre.com>,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>,
	Mark Brown <broonie@kernel.org>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: tps65219/am62p kernel oops
Message-ID: <20250430080109.GA65078@francesco-nb>
References: <aBDSTxALaOc-PD7X@gaggiata.pivistrello.it>
 <20250429185240.6a7644bf@akair>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429185240.6a7644bf@akair>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_010118_868475_643140B6 
X-CRM114-Status: GOOD (  12.94  )
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

On Tue, Apr 29, 2025 at 06:52:40PM +0200, Andreas Kemnade wrote:
> Am Tue, 29 Apr 2025 15:21:19 +0200
> schrieb Francesco Dolcini <francesco@dolcini.it>:
> 
> > Hello all,
> > while working on adding support in mainline for a new board based on TI
> > AM62P SoC I noticed the following Kernel Oops.
> > 
> > This oops was reproduced running current Linux
> > master, 6.15.0-rc4+, ca91b9500108d4cf083a635c2e11c884d5dd20ea, but I was able
> > to reproduce the same with 6.14.4.
> > 
> 
> [...]
> > [  +0.000022] Call trace:
> > [  +0.000011]  regulator_notifier_call_chain+0x20/0xa4 (P)
> > [  +0.000018]  tps65219_regulator_irq_handler+0x34/0x80
> 
> wild guessing: maybe because irqdata->rdev is not initalized in
> _probe()? At least I do not see where it would be initialized.

your wild guess seems correct, I'll send a proper patch with your
suggested-by after doing a couple of more tests, thanks.

Francesco


