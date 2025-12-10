Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31FED3B9A9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 08:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tY5uwzl+AxVEKvLx/HBwHjEU47qpsVqEgTLjK9+nBsk=; b=lbWwJnZ9J/8xLpdL5Qrqz4yvyf
	FBa4sqYA9skxfnBEnMALqnHjh2mIKMrQRuFXW0t9LjFSijzLsq5GP2vyaNJcQP5HIq3U8WlUKQ2p8
	rnpFRjhrJnhpl5XCVEhXhnJphIt/p/nVCAbxUeJTmLSmMMafOc6OwxKmYW3eEahyhG2W1qIiqqPcY
	rjhYMJ0ykrnigDWQ4l4anv/SWsqUzji5HsO/OvvV+UwWi5kpN4Isgtrihcpi2yeTxnP7Pb8Ts1MJj
	0kz6nlype2sx4WhX147gtnAo4lcr56ya68rJZCpogQS9mZd3yhkjJEafx/Gzuv3Wo991jHpjC2tI9
	KRCndbrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTFHD-0000000FERn-2LdF;
	Wed, 10 Dec 2025 08:10:23 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTFHA-0000000FERP-18mI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 08:10:21 +0000
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id C0AD91FE25;
	Wed, 10 Dec 2025 09:10:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1765354218;
	bh=tY5uwzl+AxVEKvLx/HBwHjEU47qpsVqEgTLjK9+nBsk=; h=From:To:Subject;
	b=LqOcVPDD1BUINRwxzSNmeAKRcdt38XJGj8Cq//KKBbigw1oMJQFvWfx3U0hQ02qOw
	 VNNvKoX4iTISpYoOJkOwbs/aAHvYK5gYyPQ/RwfuOlCqCnRdm5JSxJyR6YaeHL9Iuk
	 KP6nQjYlEfNkH53FkIzWM6z+4mxGpzDQ/oZ3WmkMmSc6qleI2tda2NgRw8LTkotpeB
	 +sGx+qzuz/eAzQYcdnpWuLNaIsfPUa+OcZArv5hl2EFCdzKfNpDtwX1acOcDFNRaMJ
	 NeN6pcRlVAZWjKpiMLWzEmJzoze5Ks8v7L0tzkWHm6augF8Gy+esBdenjb9lqTjdrw
	 koaBgOmBgE51w==
Date: Wed, 10 Dec 2025 09:10:14 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Andreas Kemnade <andreas@kemnade.info>,
	Jerome Neanne <jneanne@baylibre.com>,
	Mark Brown <broonie@kernel.org>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: tps65219/am62p kernel oops
Message-ID: <20251210080955.GA14989@francesco-nb>
References: <aBDSTxALaOc-PD7X@gaggiata.pivistrello.it>
 <20250429185240.6a7644bf@akair>
 <20250430080109.GA65078@francesco-nb>
 <aBH5s7p2RxLGjTQD@gaggiata.pivistrello.it>
 <23eeda43-a938-4c15-aee3-b1b9df217ff8@ti.com>
 <20251209134343.GA238880@francesco-nb>
 <d6de7066-a802-41fc-bb10-2f5d248743db@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6de7066-a802-41fc-bb10-2f5d248743db@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_001020_478743_B34CE6EC 
X-CRM114-Status: GOOD (  29.89  )
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

Hello Shree,

On Tue, Dec 09, 2025 at 12:16:05PM -0600, Shree Ramamoorthy wrote:
> On 12/9/25 7:43 AM, Francesco Dolcini wrote:
> > On Thu, May 01, 2025 at 10:32:12AM -0500, Shree Ramamoorthy wrote:
> > > On 4/30/25 5:21 AM, Francesco Dolcini wrote:
> > > > On Wed, Apr 30, 2025 at 10:01:14AM +0200, Francesco Dolcini wrote:
> > > > > On Tue, Apr 29, 2025 at 06:52:40PM +0200, Andreas Kemnade wrote:
> > > > > > Am Tue, 29 Apr 2025 15:21:19 +0200
> > > > > > schrieb Francesco Dolcini <francesco@dolcini.it>:
> > > > > > > This oops was reproduced running current Linux
> > > > > > > master, 6.15.0-rc4+, ca91b9500108d4cf083a635c2e11c884d5dd20ea, but I was able
> > > > > > > to reproduce the same with 6.14.4.
> > > > > > > 
> > > > > > [...]
> > > > > > > [  +0.000022] Call trace:
> > > > > > > [  +0.000011]  regulator_notifier_call_chain+0x20/0xa4 (P)
> > > > > > > [  +0.000018]  tps65219_regulator_irq_handler+0x34/0x80
> > > > > > wild guessing: maybe because irqdata->rdev is not initalized in
> > > > > > _probe()? At least I do not see where it would be initialized.
> > > > > your wild guess seems correct, I'll send a proper patch with your
> > > > > suggested-by after doing a couple of more tests, thanks.
> > > > so, the bug is clear, however the fix is not an obvious one liner as I was
> > > > wishing.
> > > > 
> > > > we would need to add a link from each of the interrupts to the specific
> > > > regulator. as of now such a connection is not existing in the code.
> > > I'll try out implementing and testing the solution, but will get
> > > to it early next week. Will email with any updates!
> > What's the status on this? Were you able to do any progress or work on
> > it?
> 
> Thanks for following up on this, the task got lost on my end. My
> apologies!  The original line deleted `irq_data[i].rdev = rdev;` was
> never replaced.  The correct code should be re-implementing a version
> of the tps65219_get_rdev_by_name() function that was removed in commit
> 64a6b57 & add in irq_data.rdev = rdev;` where the other irq_data
> fields are being assigned within _probe.
> 
> Is there anything missing with this solution?

I am not really familiar with the code, I just looked at it once when
I did hit this bug. I would say to just send such a patch.

Francesco


