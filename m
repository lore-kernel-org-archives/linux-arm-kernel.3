Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F48C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 11:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w719Adxu/spsT1aehDZuiWXX85fwgBdKYmTk1wyv4mk=; b=xxQ7vC538BS99xfJGRKfnYvw9f
	F0QFVFWP8q9bocqSScU8MqxhrDrOHL+67N8oX4Zshu0laODFu4ortOvZIi+8M82fE+zhHZb61x8st
	GxWn62MC3FG11WzWt/wnsYLQnzH4QnAsEpzQ5yauu5O72pwT7c9efDTHic7TQFUfxHOko6U5vxJ+Z
	C905chdmu/BApVVO5v2GILpXNC7F+TzGNL/PUqk385Sfz/QPrLsKBqrZkq5EeR5ZvenHPsHfW2i5e
	VtK6O3XYja41m/63Jmg4Bh0Crp6YaPFARQ1QSt39sUuKN7kwqfKSnbGJMEMBO+jT7tqOsm7k/wFPn
	7q4QEooA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vissL-00000006yFo-2rjJ;
	Thu, 22 Jan 2026 11:29:21 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vissJ-00000006yEX-0xqc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 11:29:20 +0000
Received: by mail-wr1-x444.google.com with SMTP id ffacd0b85a97d-4357b308f28so109754f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 03:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769081357; x=1769686157; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w719Adxu/spsT1aehDZuiWXX85fwgBdKYmTk1wyv4mk=;
        b=L5m6M5gnZBv3hlwJKl1XZq2VduzXzvPTZudmVO7OqqQj0x2NNvHLyUXJ+zdWC8Husa
         MBIa4GR27S/H+t6fR2Z7YLmj2RZwq8m3aiSjc4XpUPfmcahi4lISyshjMjlIxfRauA4E
         89Z+1BhZPObH1wOCoX8KaL1fXQXvjB+E42F9OAIuQ2QcFkMCL1n/tTbNr3K45bg84Lgg
         Vag124em0G7KbM3itZFjPxpwiPFbNolHUQV8rNhWIihUKWJ2fxp0Ek4LYGjf5x3Hfp1j
         yfyPyETbuhDau+fruLllQ/F8iMA2VOzVEhFoudCIshLfdl2GwSvq7I/qtor9vOL1EEST
         aD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769081357; x=1769686157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w719Adxu/spsT1aehDZuiWXX85fwgBdKYmTk1wyv4mk=;
        b=fGxbjvvZKIIW7IXlLCbVxJlSpAYUyKQ3Yg0q3UbL/LdKWLLGPYcFhU2SaFG1/q08vg
         6MuSq+OisnIP6NdrIuHEprJkrYFWeZlKqLPXAlMfzv/txjM0SrXeG3pbK9LsR6N3ne97
         rUHEeqSR/DGfoiK8ykQ0VJ2mgdDeVUubprLYPbf6zmwYh9HVQRsEFXvqMaS9flJpY3Ax
         1z5XHObR+2hZlTdzlHxDM32qkGhhU377zzWKfCwcpwoPzysxKk0Pw1P3juAJom+5gs8F
         a7GEXQh6WLWxcuV89xI+8IjCgX4YP33MG8xjQZUb2CA1QX5wl69UEuhHkSQn2rN7z8Q8
         lSjg==
X-Forwarded-Encrypted: i=1; AJvYcCXo9vPncmN91Lb/WyurrkRlVyg9jOQZHlI/uqjN4qQxj4WEubpz2roQ4g4BrXFsXMy0ethM0SZ3PBtJk0RM3Hj+@lists.infradead.org
X-Gm-Message-State: AOJu0YwSwrRR9YMzP9o4wRNDNjgRL63dl0erfX/OP0IIinvPEFKpCMfe
	LLQW5+hfH98468xUU5c5EOypE7LtG9KZ44ck5EvUEAJmraAVxq7id9wo
X-Gm-Gg: AZuq6aI6ns13tnTBKdBrUuDaRKOpXWwghPvBbrdM9u+XiKpKVyVyCTyYFgk3RQhbIfx
	Wnie+yG1SMnf5I7j0A/Ml2ratGGSTsF9iTpq5gzd7GQ6AS8yY+mPthzgBQbXAS9m+FMXo7jg18m
	8Umy21wjp8HqEtMDgtIbZ/sQzAq/hzbKJTc3PZh1PUIPZxpX8d9vjHpgjmDKkchJ0BNo36O5alf
	CtA7SoB4G35oEWOxZI73y0IjafT9jpFigZGnqQEAdz1f1RGpQoqvGcf8Qz5P8S1KKfJt1yEDpfQ
	Tr+QEeKIsCzqk43fpnRCCLeKvc89wLAhi7cCmGXr2up47P6Opgm36GTb9PSQxElNteJ5UFHW0hx
	yriKj0UbjdJ/DquA9fDtgNF31qzKTnivUe6qiAM2ox2BDQ9NwjXehgu9UFFTJlNL1nXcz44Nnge
	Z4ARM=
X-Received: by 2002:a5d:5f83:0:b0:429:bde0:1da8 with SMTP id ffacd0b85a97d-43569bdaa4amr18327128f8f.7.1769081356806;
        Thu, 22 Jan 2026 03:29:16 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:7677:83bc:43db:13ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996cf58sm44986696f8f.22.2026.01.22.03.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 03:29:16 -0800 (PST)
Date: Thu, 22 Jan 2026 13:29:13 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Jakub Kicinski <kuba@kernel.org>, linux-phy@lists.infradead.org,
	davem@davemloft.net, maxime.chevallier@bootlin.com,
	alexandre.torgue@foss.st.com, mohd.anwar@oss.qualcomm.com,
	neil.armstrong@linaro.org, hkallweit1@gmail.com,
	mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
	edumazet@google.com, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, vkoul@kernel.org,
	andrew@lunn.ch, pabeni@redhat.com, andrew+netdev@lunn.ch,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next,05/14] net: stmmac: add stmmac core serdes support
Message-ID: <20260122112913.svzaie4eywk5nc32@skbuf>
References: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
 <20260119192125.1245102-1-kuba@kernel.org>
 <aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>
 <20260120081844.7e6aq2urhxrylywi@skbuf>
 <aW9VHt6meEJFxV0I@shell.armlinux.org.uk>
 <20260120121114.2aedgu42i2wax3yp@skbuf>
 <aXDm0jVOYOZ9l6Wu@shell.armlinux.org.uk>
 <20260121162345.4jpzvwqhfqxd7tl7@skbuf>
 <aXEN6B5_T9uFzVvu@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXEN6B5_T9uFzVvu@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_032919_329291_10D8EA78 
X-CRM114-Status: GOOD (  41.84  )
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

On Wed, Jan 21, 2026 at 05:33:28PM +0000, Russell King (Oracle) wrote:
> On Wed, Jan 21, 2026 at 06:23:45PM +0200, Vladimir Oltean wrote:
> > On Wed, Jan 21, 2026 at 02:46:42PM +0000, Russell King (Oracle) wrote:
> > > On Tue, Jan 20, 2026 at 02:11:14PM +0200, Vladimir Oltean wrote:
> > > > On Tue, Jan 20, 2026 at 10:12:46AM +0000, Russell King (Oracle) wrote:
> > > > > First, I'll say I'm on a very short fuse today; no dinner last night,
> > > > > at the hospital up until 5:30am, and a fucking cold caller rang the door
> > > > > bell at 10am this morning. Just fucking our luck.
> > > > 
> > > > Sorry to hear that.
> > > > 
> > > > > On Tue, Jan 20, 2026 at 10:18:44AM +0200, Vladimir Oltean wrote:
> > > > > > Isn't it sufficient to set pl->pcs to NULL when pcs_enable() fails and
> > > > > > after calling pcs_disable(), though?
> > > > >
> > > > > No. We've already called mac_prepare(), pcs_pre_config(),
> > > > > pcs_post_config() by this time, we're past the point of being able to
> > > > > unwind.
> > > > 
> > > > I'm set out to resolve a much smaller problem.
> > > > 
> > > > Calling it a full "unwind" is perhaps a bit much, because pcs_pre_config()
> > > > and pcs_post_config() don't have unwinding equivalents, unlike how
> > > > pcs_enable() has pcs_disable(). I don't see what API convention would be
> > > > violated if phylink decided to drop a PCS whose enable() returned an error.
> > > 
> > > While pcs_pre_config() and pcs_post_config() do not have unwinding
> > > equivalents (what would they be?) the issue here is that these could
> > > have changed any state that isn't simply undone by calling
> > > pcs_disable().
> > > 
> > > For example, pcs_pre_config() could have reprogrammed signal routing,
> > > clocking, or power supplies to blocks.
> > > 
> > > This already applies to Marvell DSA pcs-639x.c, where the pre/post
> > > config hooks change the power state of the PCS block (for errata
> > > handling), and the only way that gets undone is via a call to
> > > pcs_disable() which explicitly disables IRQs and power for the PCS. Its
> > > pcs_disable() isn't a strict reversal of pcs_enable(), it does more.
> > > 
> > > We already declare the interface to be dead on pcs_post_config()
> > > failure, but we don't do that for pcs_enable() failure.
> > > 
> > > Maybe I need to explicitly state that pcs_disable() does not directly
> > > balance pcs_enable(), but that _and_ the effects of pcs_pre_config()
> > > and pcs_post_config(). However, that itself will add to the problems.
> > > What if pcs_pre_config() and pcs_post_config() succeed but not
> > > pcs_enable()? pcs-639x needs pcs_disable() to be called, but if we
> > > require pcs_disable() to be balanced with a successful call to
> > > pcs_enable(), that messes up that driver, and pretty much makes it
> > > impossible to work around the errata.
> > 
> > What if we reordered phylink_major_config() such that phylink_pcs_enable()
> > comes first, followed by phylink_pcs_pre_config() -> phylink_mac_config() ->
> > phylink_pcs_post_config()? Superficially looking at pcs-639x, I don't
> > think it would break.
> 
> I'm sorry, but I don't have time to continue this discussion today. I
> woke late, we're trying to cram in the meals (in the middle of delayed
> lunch-time dinner right now), work wants a quick call to discuss a
> project that I missed the meeting for yesterday (which I haven't yet
> had time for...)
> 
> Sorry, but while you may wish to get this sorted, for me this is a very
> low priority issue that can be addressed later. Don't think I will have
> time to review anything you send - and that's not a personal attack,
> it's because I'm barely managing to hold everything together at my
> end, and I don't have the time.

Thanks, this was a good talk, I understood a bit more about the
challenges that need to be overcome. I'll do some testing on the
Turris MOX with a 6390 switch. From my side this shouldn't block the
stmmac integrated PCS from being integrated with the SerDes, but I do
agree that leaving a comment explaining the current phylink_pcs calling
convention, as Jakub requested, would be very useful.

