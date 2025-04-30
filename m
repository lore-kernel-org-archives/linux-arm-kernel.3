Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176F9C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 10:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5DaHQT4Qjk3BDVTDz4Bb4NNHE0GPIz71ATKW0qH/aBY=; b=P16RcP23v345nlp18KsvIOu1ut
	uZkmxQMbYuczNpJc0GDCTPntIuNcWpAEP0lQu0mdgHh8eG051FVVbRb6Nb8uaKLoe4THQJqahVN9Z
	ncNdto7s25GNU1JMGDjJkL3Iy02Q3JKunLe+qfBI9Y74jFxGrwgBbtRMSrwS3k6thKWM1SM4JXHvu
	CQydiJhF+J70x8/QSZL1xysOf3+4dFcplYafoEtrJtjbqkaeKxTboN/SI1cQFYI/EkPENXo729HmU
	gZhfNtG1FcJVWhBpF0vmkY0ipywBjyDgFp1x+/S3KRrLIKqph5Mt+7JhK+g0Cw/amlzPDtS9LSzWf
	D71rDXBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4tF-0000000CZOH-31Uz;
	Wed, 30 Apr 2025 10:42:09 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4ZR-0000000CVk7-1n6D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 10:21:42 +0000
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id C89AF1F997;
	Wed, 30 Apr 2025 12:21:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1746008499;
	bh=5DaHQT4Qjk3BDVTDz4Bb4NNHE0GPIz71ATKW0qH/aBY=;
	h=Received:From:To:Subject;
	b=JxzaPl7RKrpB0llXa5Yy3AtfyvduS+RlpsdYVdEWBPaBh0HNBWiJnSy5NtGqxZ9HL
	 bFsNPtQpXkF5MDO5s0KH/lzNrwDYkuZ/7PRcseFY70IpgkTZr39v3gfIyfRUQkCBUf
	 9d2OQXqD+hhgnwjGhc4WkwwStEiPFgHIGpTebx5zth0sxGIndJ5EbSnpIhtnbPWDqm
	 MEjRFdey2H0RqWncNAWqBTObiLYL33ZmZu0rz3RIOXvgLm8owaKW5RZW37kdnpGAaN
	 x6a7MXociRmsTFUN45QNkwkwOXmfsBazfWyth1e7/6FNideUAw1mmxLy9ioXj+wy8h
	 zSDmnxBXkpYJQ==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id 7AAF67F84D; Wed, 30 Apr 2025 12:21:39 +0200 (CEST)
Date: Wed, 30 Apr 2025 12:21:39 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Andreas Kemnade <andreas@kemnade.info>,
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
Message-ID: <aBH5s7p2RxLGjTQD@gaggiata.pivistrello.it>
References: <aBDSTxALaOc-PD7X@gaggiata.pivistrello.it>
 <20250429185240.6a7644bf@akair>
 <20250430080109.GA65078@francesco-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430080109.GA65078@francesco-nb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_032141_624856_15724351 
X-CRM114-Status: GOOD (  21.16  )
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

On Wed, Apr 30, 2025 at 10:01:14AM +0200, Francesco Dolcini wrote:
> On Tue, Apr 29, 2025 at 06:52:40PM +0200, Andreas Kemnade wrote:
> > Am Tue, 29 Apr 2025 15:21:19 +0200
> > schrieb Francesco Dolcini <francesco@dolcini.it>:
> > 
> > > Hello all,
> > > while working on adding support in mainline for a new board based on TI
> > > AM62P SoC I noticed the following Kernel Oops.
> > > 
> > > This oops was reproduced running current Linux
> > > master, 6.15.0-rc4+, ca91b9500108d4cf083a635c2e11c884d5dd20ea, but I was able
> > > to reproduce the same with 6.14.4.
> > > 
> > 
> > [...]
> > > [  +0.000022] Call trace:
> > > [  +0.000011]  regulator_notifier_call_chain+0x20/0xa4 (P)
> > > [  +0.000018]  tps65219_regulator_irq_handler+0x34/0x80
> > 
> > wild guessing: maybe because irqdata->rdev is not initalized in
> > _probe()? At least I do not see where it would be initialized.
> 
> your wild guess seems correct, I'll send a proper patch with your
> suggested-by after doing a couple of more tests, thanks.

so, the bug is clear, however the fix is not an obvious one liner as I was
wishing.

we would need to add a link from each of the interrupts to the specific
regulator. as of now such a connection is not existing in the code.

I would not have the time to fix the code in the next few days, if someone is
able to pick this up before, just let me know ...

Francesco



