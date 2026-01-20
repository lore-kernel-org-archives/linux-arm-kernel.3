Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD84BD262AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 23:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bA5CYv52JdI4SDT9X+xVfGK7arRO7qi1Ph+fEJr27s0=; b=4cIexj/g4LgS+ZqSTAus+dcpZc
	SxXTHiliZHtxqxywBlnZVuvV1jdd4yinBkZu1f1pxxPpyYUxHWmCcbbQ65Hti+kL61lMjwYAXZt0Z
	bM0psgpuTc83JpeBiWcd7cl3H9ozzW149V4HRXS9WOsLi73s4DAGveKC0PTcycT5hX92nmqqZ4jF8
	s+F6s6BcufD0Uk85RTrqUotAKwKyI03kuyYIEXfZINnzX4OvZftSxc2aq1K3pPWGYreXpQ/QYLEzD
	yGweSZcP9wgVODLocsZgpOeEgQsvDN2zeW8dGN3C8ggPAItfvOiLC0R3X8eUPzsFPTIWE01jvaJds
	SFXNmmSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viLDR-00000004dK3-0KkT;
	Tue, 20 Jan 2026 23:32:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viLDP-00000004dJp-0luk;
	Tue, 20 Jan 2026 23:32:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4675460007;
	Tue, 20 Jan 2026 23:32:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3086DC16AAE;
	Tue, 20 Jan 2026 23:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768951970;
	bh=TiwAfrS4S4/cPcCNH/Af8lsGdUuDKr5kui6G12uDfZA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aLJ4M/cqdhTjcBanfjqq3P1KjJBRJPGkZF/Qf5m+uQ59i4UZ98ARPxQt2EKx/hiSy
	 HXIgEBLG+nzBIiSgllK62eC+tMJDsNhaTnfvjRqSMZFUDXi4IB9oihhZ2H0blZMT8K
	 BSE8XOcLTuI4FY2WdFp0mu8AULbZG8Ngepr5eUmEsPhJkpkoc3/XxXP4HN5WYLAT7u
	 O3e+EiQ6uXqM7MocFIVZUaESUF3ZhlNkqZfg5Pucut+CSbdSEwVUeFb2PG2Uzh1GCR
	 3QeXZF9r6934oSUWM1ZkhLm6eKoIdq+457HUy55kMOYkVWFe/C6L0zkohLy8Uc3v6O
	 gZ5tl+nifHvIA==
Date: Tue, 20 Jan 2026 15:32:48 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-phy@lists.infradead.org, davem@davemloft.net,
 maxime.chevallier@bootlin.com, alexandre.torgue@foss.st.com,
 mohd.anwar@oss.qualcomm.com, neil.armstrong@linaro.org,
 hkallweit1@gmail.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 edumazet@google.com, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, vkoul@kernel.org, andrew@lunn.ch,
 pabeni@redhat.com, andrew+netdev@lunn.ch,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next,05/14] net: stmmac: add stmmac core serdes support
Message-ID: <20260120153248.0636f1e9@kernel.org>
In-Reply-To: <aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>
References: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
	<20260119192125.1245102-1-kuba@kernel.org>
	<aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 20 Jan 2026 05:04:53 +0000 Russell King (Oracle) wrote:
> By the time phylink_pcs_enable() has been called, the PCS is already
> plumbed in to phylink. It _will_ have phylink_pcs_disable() called on
> it at some point in the future, either by having the PCS displaced
> by another in a subsequent phylink_major_config(), or by a driver
> calling phylink_stop().
> 
> If we clean up here, then we will call dwmac_serdes_power_off() twice.
> 
> Yes, it's not "nice" but that's the way phylink is right now, and
> without reworking phylink to record that pcs_enable() has failed
> to avoid a subsequent pcs_disable(), and to stop the major config
> (which then potentially causes a whole bunch of other issues). I
> don't even want to think about that horrid scenario at the moment.

Would you mind adding a note to this effect to the commit message 
to shut up the bot?

Unless the comment on patch 12 is also incorrect in which case I'll
restore the v1 into patchwork.

