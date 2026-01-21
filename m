Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97E7C44506
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 17:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZwVQ7DVnwRsf/W7oc0aqwTt7dOJIeDibahFoGDhgMVo=; b=bZGrW1pBlclSyBgVWvM+U+YZm3
	NL42etkeYCKXu4Fpkd5q1dl8Ywfw4wcGFoRCs1bPLLRe2MgccEMtqIog9+f3/aWJOZEEHws+ir19L
	yVpLe+41zlVyVtG/6mP9t5AA58sGp8B2iZxAQMD5A0Bgj6KwLk5aSkCNBBkAbjRVdM/uezwddcAgp
	mIho5TKnd2wY+XTnyFYz6DEi1ycg1tnOPmLz4ohrnu1ZB0IywoysNrP6lo9s062r5muOccNaaRWq+
	DqcqM1ZHV37ydGYHa6K+1w/yIlHpT09ipaTwFtYOHClv6nN3zJTzDGAS91czt40c0HmP3LzBs5QlK
	5d+/1Idg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vic5M-00000005s4Z-0HDm;
	Wed, 21 Jan 2026 17:33:40 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vic5J-00000005s41-2cgg;
	Wed, 21 Jan 2026 17:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZwVQ7DVnwRsf/W7oc0aqwTt7dOJIeDibahFoGDhgMVo=; b=RGQRrLafnzAKAK9bhLuJbuYq9m
	cw3YwU4Mmw1YcwJGdmmV+AKinp/sIzQLOusOyBiHud9uW0hCPFU6pAOzdGvp1BVxiYu/1xJMH7YdE
	S8PvtpPsGXrcBdF0rlGWVEGhe9m5ZuuMRGLK4rsc5sPx293nNUjtUbL1xrS4Mriibo39YoAh/wqib
	smF510gFCIRAzz4sGVGA2CvR6zMmrUxzvFcHqjqh1Z5ZtHoZdlhdnJdEM9HW1e++AIWMtv4JRf12s
	nPb3esoJDFqohvi7oFuZ3NH2gCyFtR711mxtWFOA88fY8/wLU9ip+P5piOsKU1S/VFHHvuvMDoI2p
	rTa3Rd9A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40482)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vic5E-000000007oR-1qPB;
	Wed, 21 Jan 2026 17:33:32 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vic5A-000000000Bp-1guX;
	Wed, 21 Jan 2026 17:33:28 +0000
Date: Wed, 21 Jan 2026 17:33:28 +0000
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
Message-ID: <aXEN6B5_T9uFzVvu@shell.armlinux.org.uk>
References: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
 <20260119192125.1245102-1-kuba@kernel.org>
 <aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>
 <20260120081844.7e6aq2urhxrylywi@skbuf>
 <aW9VHt6meEJFxV0I@shell.armlinux.org.uk>
 <20260120121114.2aedgu42i2wax3yp@skbuf>
 <aXDm0jVOYOZ9l6Wu@shell.armlinux.org.uk>
 <20260121162345.4jpzvwqhfqxd7tl7@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121162345.4jpzvwqhfqxd7tl7@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_093337_667141_63B7C612 
X-CRM114-Status: GOOD (  34.15  )
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

On Wed, Jan 21, 2026 at 06:23:45PM +0200, Vladimir Oltean wrote:
> On Wed, Jan 21, 2026 at 02:46:42PM +0000, Russell King (Oracle) wrote:
> > On Tue, Jan 20, 2026 at 02:11:14PM +0200, Vladimir Oltean wrote:
> > > On Tue, Jan 20, 2026 at 10:12:46AM +0000, Russell King (Oracle) wrote:
> > > > First, I'll say I'm on a very short fuse today; no dinner last night,
> > > > at the hospital up until 5:30am, and a fucking cold caller rang the door
> > > > bell at 10am this morning. Just fucking our luck.
> > > 
> > > Sorry to hear that.
> > > 
> > > > On Tue, Jan 20, 2026 at 10:18:44AM +0200, Vladimir Oltean wrote:
> > > > > Isn't it sufficient to set pl->pcs to NULL when pcs_enable() fails and
> > > > > after calling pcs_disable(), though?
> > > >
> > > > No. We've already called mac_prepare(), pcs_pre_config(),
> > > > pcs_post_config() by this time, we're past the point of being able to
> > > > unwind.
> > > 
> > > I'm set out to resolve a much smaller problem.
> > > 
> > > Calling it a full "unwind" is perhaps a bit much, because pcs_pre_config()
> > > and pcs_post_config() don't have unwinding equivalents, unlike how
> > > pcs_enable() has pcs_disable(). I don't see what API convention would be
> > > violated if phylink decided to drop a PCS whose enable() returned an error.
> > 
> > While pcs_pre_config() and pcs_post_config() do not have unwinding
> > equivalents (what would they be?) the issue here is that these could
> > have changed any state that isn't simply undone by calling
> > pcs_disable().
> > 
> > For example, pcs_pre_config() could have reprogrammed signal routing,
> > clocking, or power supplies to blocks.
> > 
> > This already applies to Marvell DSA pcs-639x.c, where the pre/post
> > config hooks change the power state of the PCS block (for errata
> > handling), and the only way that gets undone is via a call to
> > pcs_disable() which explicitly disables IRQs and power for the PCS. Its
> > pcs_disable() isn't a strict reversal of pcs_enable(), it does more.
> > 
> > We already declare the interface to be dead on pcs_post_config()
> > failure, but we don't do that for pcs_enable() failure.
> > 
> > Maybe I need to explicitly state that pcs_disable() does not directly
> > balance pcs_enable(), but that _and_ the effects of pcs_pre_config()
> > and pcs_post_config(). However, that itself will add to the problems.
> > What if pcs_pre_config() and pcs_post_config() succeed but not
> > pcs_enable()? pcs-639x needs pcs_disable() to be called, but if we
> > require pcs_disable() to be balanced with a successful call to
> > pcs_enable(), that messes up that driver, and pretty much makes it
> > impossible to work around the errata.
> 
> What if we reordered phylink_major_config() such that phylink_pcs_enable()
> comes first, followed by phylink_pcs_pre_config() -> phylink_mac_config() ->
> phylink_pcs_post_config()? Superficially looking at pcs-639x, I don't
> think it would break.

I'm sorry, but I don't have time to continue this discussion today. I
woke late, we're trying to cram in the meals (in the middle of delayed
lunch-time dinner right now), work wants a quick call to discuss a
project that I missed the meeting for yesterday (which I haven't yet
had time for...)

Sorry, but while you may wish to get this sorted, for me this is a very
low priority issue that can be addressed later. Don't think I will have
time to review anything you send - and that's not a personal attack,
it's because I'm barely managing to hold everything together at my
end, and I don't have the time.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

