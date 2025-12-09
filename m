Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C02D1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 13:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGP3vRW458Tun3BIx7ZKXNmg/pc9nBdtcAuL0AiV1Js=; b=tf0rIb7YrTrLIhcZurxrBidvZ7
	5ByL5ykiBzpBVcBNsqt/DTpPhVRnIS5zErCVuAF0wixPMxkU9CuB52DqoSA5gKIhd/j4NJp7zs7oH
	bFYLBL3qM6+wfDL2PtIofJ8s2yqOHkhNx5s+klPvaR1xwdiX/M8ejK+7BDpyKEB/iEYg53QhJMieA
	dwKbSupbFuCkVZOTe/zfLN70S4oO2uaBACocpZCuHOx/uiTQrNI3uLINeT4yac+Y0gqnVvViyxS6T
	7mIEtXtQz2hj9plki3yYAmr40CQwhW3YS+dwKV4rBqidZp4qKiviLHkXHCjjKfGkZIBsTT901tEAs
	fUiP6LBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSy0Q-0000000EKh8-2dBd;
	Tue, 09 Dec 2025 13:43:54 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSy0N-0000000EKgd-0YyA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 13:43:52 +0000
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 896E61F94A;
	Tue,  9 Dec 2025 14:43:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1765287828;
	bh=iGP3vRW458Tun3BIx7ZKXNmg/pc9nBdtcAuL0AiV1Js=; h=From:To:Subject;
	b=x25Co79y0V4nkDEm80d7UshOyL9gUGfzKDO4k2AD1reXu+aWq0A+VxSNlTzqdKO+E
	 6G5vtl/zb5YdEBqqQ+4YXvQAgeCSLtJyrYyapAgG1TGBa2xz/EYMtG3gOlvDn5PZkB
	 pwz4W2QrhmD246xCfImsgsP8VSkaOvaL+nrMj58Jx5Zjv3P+Eh8wgWC7SsPJG3IzP4
	 ZuH2lkCadcfyrbE3vgloQsN4ZgxdSYynTX94gEFBTelFQ8xFer4FquqgPWZLIa4Ul5
	 ZlcPDocvLcWMhNz8e248ggKHjIXsoPgTpKN1Fmkk2vfuOjuwvJ6YZy5E7H6YL8V0lF
	 dH84ZLXn92CPQ==
Date: Tue, 9 Dec 2025 14:43:43 +0100
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
Message-ID: <20251209134343.GA238880@francesco-nb>
References: <aBDSTxALaOc-PD7X@gaggiata.pivistrello.it>
 <20250429185240.6a7644bf@akair>
 <20250430080109.GA65078@francesco-nb>
 <aBH5s7p2RxLGjTQD@gaggiata.pivistrello.it>
 <23eeda43-a938-4c15-aee3-b1b9df217ff8@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23eeda43-a938-4c15-aee3-b1b9df217ff8@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_054351_768543_29037A7E 
X-CRM114-Status: GOOD (  24.80  )
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

On Thu, May 01, 2025 at 10:32:12AM -0500, Shree Ramamoorthy wrote:
> On 4/30/25 5:21 AM, Francesco Dolcini wrote:
> > On Wed, Apr 30, 2025 at 10:01:14AM +0200, Francesco Dolcini wrote:
> > > On Tue, Apr 29, 2025 at 06:52:40PM +0200, Andreas Kemnade wrote:
> > > > Am Tue, 29 Apr 2025 15:21:19 +0200
> > > > schrieb Francesco Dolcini <francesco@dolcini.it>:
> > > > 
> > > > > Hello all,
> > > > > while working on adding support in mainline for a new board based on TI
> > > > > AM62P SoC I noticed the following Kernel Oops.
> > > > > 
> > > > > This oops was reproduced running current Linux
> > > > > master, 6.15.0-rc4+, ca91b9500108d4cf083a635c2e11c884d5dd20ea, but I was able
> > > > > to reproduce the same with 6.14.4.
> > > > > 
> > > > [...]
> > > > > [  +0.000022] Call trace:
> > > > > [  +0.000011]  regulator_notifier_call_chain+0x20/0xa4 (P)
> > > > > [  +0.000018]  tps65219_regulator_irq_handler+0x34/0x80
> > > > wild guessing: maybe because irqdata->rdev is not initalized in
> > > > _probe()? At least I do not see where it would be initialized.
> > > your wild guess seems correct, I'll send a proper patch with your
> > > suggested-by after doing a couple of more tests, thanks.
> > so, the bug is clear, however the fix is not an obvious one liner as I was
> > wishing.
> > 
> > we would need to add a link from each of the interrupts to the specific
> > regulator. as of now such a connection is not existing in the code.
> I'll try out implementing and testing the solution, but will get to it early next week. Will email with any updates!

What's the status on this? Were you able to do any progress or work on
it?

Thanks
Francesco


