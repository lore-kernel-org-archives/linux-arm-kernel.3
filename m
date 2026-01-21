Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7A4D46943
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 14:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iStF1+0UpaSNBxFtH2LAPTY4dVGLGH3AvGpTjjJnIHU=; b=g5NN1d+Ka4MgIg8U1N7+u47fLA
	0aOWXLaaFZw4X5sxCLinjpWKJAfjaDisbw7s+pGYhhA2POZ/5m/bBF/9v3u7i05GFFbSN+gqnXcMH
	0zWP2ETOxO5eJi7iWlrak0nnT8qYDUwmveaNv291iLWK9xSQ0GoBI54i5wkzWp4lv6Ws9qfTig1+k
	uybrbKeOmlRSfmSvB5eejCAMYb46vvgUwR9SAKu9LMnWvgpOYBxy8TXGd+vlH8dqAQYIN9L0mwh7m
	VAiH99xN0b+O/wsIHVDMfWyUDtHFF2G+sjjjjI31Sfc9DblS4AFYUQ5UOJo0Ba553a35B6YWHiy68
	r/iMAgGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viZU5-00000005dCz-3wcK;
	Wed, 21 Jan 2026 14:47:01 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viZTz-00000005d5O-0gWn;
	Wed, 21 Jan 2026 14:46:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iStF1+0UpaSNBxFtH2LAPTY4dVGLGH3AvGpTjjJnIHU=; b=e9bH30XyD6pkMJHTgoZwJ7SBsQ
	0CLCJyQaHxcYuc61vX87CjlwIjH755e5RfCQJ0Wfv4lNRlzSX2yX9k/kwo8QWMtpWhfVnPgANvDB9
	kl123aZe/rSEj8KpIBeh0lPIAMVOWTc19dGF+NdztKgvvnA+5BX7opil0piY56CwJO20tSmz1Xlko
	pzBMbMVUUyaGXSsIrFSc5JdeRIYiwiAV1GpaVlXdZ0VTRxn+jcebBR5roWfde62EU7wcfzvg9tR3Q
	9GmdzF0i47FizmPYPrE1/KUuNR/fwPn0E/d24rqa7i7R6bhkesWWIr0GN+RCRzFGiFUEkdThXAtTj
	trX0GOiA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36082)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1viZTt-000000007c8-10Ub;
	Wed, 21 Jan 2026 14:46:49 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1viZTm-0000000005o-2xDz;
	Wed, 21 Jan 2026 14:46:42 +0000
Date: Wed, 21 Jan 2026 14:46:42 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
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
Message-ID: <aXDm0jVOYOZ9l6Wu@shell.armlinux.org.uk>
References: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
 <20260119192125.1245102-1-kuba@kernel.org>
 <aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>
 <20260120081844.7e6aq2urhxrylywi@skbuf>
 <aW9VHt6meEJFxV0I@shell.armlinux.org.uk>
 <20260120121114.2aedgu42i2wax3yp@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120121114.2aedgu42i2wax3yp@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_064655_203989_C122F262 
X-CRM114-Status: GOOD (  23.07  )
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

On Tue, Jan 20, 2026 at 02:11:14PM +0200, Vladimir Oltean wrote:
> On Tue, Jan 20, 2026 at 10:12:46AM +0000, Russell King (Oracle) wrote:
> > First, I'll say I'm on a very short fuse today; no dinner last night,
> > at the hospital up until 5:30am, and a fucking cold caller rang the door
> > bell at 10am this morning. Just fucking our luck.
> 
> Sorry to hear that.
> 
> > On Tue, Jan 20, 2026 at 10:18:44AM +0200, Vladimir Oltean wrote:
> > > Isn't it sufficient to set pl->pcs to NULL when pcs_enable() fails and
> > > after calling pcs_disable(), though?
> >
> > No. We've already called mac_prepare(), pcs_pre_config(),
> > pcs_post_config() by this time, we're past the point of being able to
> > unwind.
> 
> I'm set out to resolve a much smaller problem.
> 
> Calling it a full "unwind" is perhaps a bit much, because pcs_pre_config()
> and pcs_post_config() don't have unwinding equivalents, unlike how
> pcs_enable() has pcs_disable(). I don't see what API convention would be
> violated if phylink decided to drop a PCS whose enable() returned an error.

While pcs_pre_config() and pcs_post_config() do not have unwinding
equivalents (what would they be?) the issue here is that these could
have changed any state that isn't simply undone by calling
pcs_disable().

For example, pcs_pre_config() could have reprogrammed signal routing,
clocking, or power supplies to blocks.

This already applies to Marvell DSA pcs-639x.c, where the pre/post
config hooks change the power state of the PCS block (for errata
handling), and the only way that gets undone is via a call to
pcs_disable() which explicitly disables IRQs and power for the PCS. Its
pcs_disable() isn't a strict reversal of pcs_enable(), it does more.

We already declare the interface to be dead on pcs_post_config()
failure, but we don't do that for pcs_enable() failure.

Maybe I need to explicitly state that pcs_disable() does not directly
balance pcs_enable(), but that _and_ the effects of pcs_pre_config()
and pcs_post_config(). However, that itself will add to the problems.
What if pcs_pre_config() and pcs_post_config() succeed but not
pcs_enable()? pcs-639x needs pcs_disable() to be called, but if we
require pcs_disable() to be balanced with a successful call to
pcs_enable(), that messes up that driver, and pretty much makes it
impossible to work around the errata.

If you feel strongly about this, then the only thing I can think of
doing is to move this SerDes support out of stmmac and into phylink
(which is a point I already raised in the cover message) so that
its failure can be dealt with at the higher level, where we can
ensure that phy_power_off() is balaced with phy_power_on(). However,
that means pushing even more of the stmmac specific "we need the
clocks running to access registers XYZ or reset" weirdness into
phylink.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

