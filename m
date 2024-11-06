Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7487D59F7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 23:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oSn03W5A4cHNq1T/X45o+NX2ioV+T/YR260d8sL4aZk=; b=uzSMXmYvmVsX7aIBXB+9rqaGaM
	SCHd8WvV0ngoahht2BR/ulniCE5HaIHvLBBBvy+nnroqMnjcfW8KG5wbDGSGP1VaypLfI5DDeXK8k
	dE8rve42raf6D0yx+qvG773Ddxe98DLYkEzZJoUXwzZia0ymQhOLEphA1SeCoIMljhDxz/6bfVFb8
	ysfKurpxTKPi+v2W8je8MtZwyI9VXq/2XQCnFVDnP0C48iF6XzzdJwh0RU2jk6ouKu2dVmWtqiTI9
	I45rOujQ0SwLIGHiPjP4rS07XxYu8VwCE0FR+w5Znvi9ZMVY6UZeC3By1v6F84fFiVVe23TbzIBBU
	LFONP8Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8p46-0000000505r-14v6;
	Wed, 06 Nov 2024 23:03:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8p1b-00000004znb-0cdk;
	Wed, 06 Nov 2024 23:01:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6530E5C4D92;
	Wed,  6 Nov 2024 23:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85BCCC4CEC6;
	Wed,  6 Nov 2024 23:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730934077;
	bh=lsZM1OifQMR0Ewkk9yEiN0OytYyrRhK0WgUktu0fm2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=poBQhvWMcBUshJScA6qi+VoJHKUku76KrYRKcZmXbwDWEI6cPLvtn2nbafsCAIfWB
	 DuVj3zVc2G7Br0OzO5qRRqv/POtgTSYaYVvdwKPgdzzMHbq+mFw2UOso3RuatdyVtJ
	 shgjV94yLZYvIusjXNG1HhfGJBN9CLyhXQ4gpii59YUJramoLURM7WlsZKO1P0Njd0
	 K/xvVc2jxy1KVe6v7eDzmoYY+/OEglKrrzvDhLE+6sNpykrPv3P+UmuGOmZnLs65U7
	 dyjL1VsLLV0yBAknZRA93bx1ZuBGu5itBLLZ9zfn8lW0tgZ/oHnaKDI4Z9rRbqouyF
	 tdvSbC5m97xuQ==
Date: Thu, 7 Nov 2024 00:01:12 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Jiasheng Jiang <jiashengjiangcool@gmail.com>, 
	rmk@dyn-67.arm.linux.org.uk, max.schwarz@online.de, david.wu@rock-chips.com, heiko@sntech.de, 
	vz@mleia.com, wsa@kernel.org, manabian@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] i2c: rk3x: Add check for clk_enable()
Message-ID: <fj2vssllh7zgl76a4jfakrcngcflwvqxzwwa2dhpkauli2u7wb@pz23fznmy25e>
References: <20241105161820.32512-1-jiashengjiangcool@gmail.com>
 <20241105161820.32512-3-jiashengjiangcool@gmail.com>
 <CAD=FV=VzqKa=fo4KRw4FSpPcH4mVnt8jBMo=FMzsGkdGrXCfxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=VzqKa=fo4KRw4FSpPcH4mVnt8jBMo=FMzsGkdGrXCfxg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_150119_257432_F34F4E51 
X-CRM114-Status: GOOD (  23.73  )
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

Hi Doug,

On Tue, Nov 05, 2024 at 01:29:40PM -0800, Doug Anderson wrote:
> On Tue, Nov 5, 2024 at 8:18 AM Jiasheng Jiang
> > Add check for the return value of clk_enable() in order to catch the
> > potential exception. Moreover, convert the return type of
> > rk3x_i2c_adapt_div() into int and add the check.
> >
> > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> > ---
> > Changelog:
> >
> > v1 -> v2:
> >
> > 1. Remove the Fixes tag.
> > 2. Use dev_err_probe to simplify error handling.
> > ---
> >  drivers/i2c/busses/i2c-rk3x.c | 51 +++++++++++++++++++++++++----------
> >  1 file changed, 37 insertions(+), 14 deletions(-)
> 
> Wow, this is a whole lot of code to add to check for an error that
> can't really happen as far as I'm aware. Turning on a clock is just
> some MMIO writes and can't fail, right? Is this really worth it? Maybe
> just wrap clk_enable() and spam an error to the logs if it fails? If
> we ever see that error we can figure out what's going on and if
> there's a sensible reason it could fail we could add the more complex
> code.

We've had this discussion several times. I'm of the school that
if a function can return an error, that error should be checked.
It's not spam, we do it everywhere.

On the other hand, there is another school, bigger than mine,
that doesn't want such a check.

I decided not to bother. If someone adds the check, I'm going to
accept it. If someone doesn't add the check, I won't bother
asking for it.

Said that, MMIO reads and writes can fail: in other drivers I'm
seeing bogus reads due to some firmware failures during device
reset.

I agree with you with the rest of the comments and thanks for
checking this out.

Andi

