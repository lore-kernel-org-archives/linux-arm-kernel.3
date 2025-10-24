Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D421CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 12:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fHLFk8P7vx3fkmMAD0Z+yzWnvmAZmlIEgYDTY3u8mmw=; b=BAd1WkCdxhUqXVd2N16LF+tHnv
	iLtGwQYQ6vABvRXRXg5MWiivTp/EvfMaRc86figd57osh0rYrGSVGZxzFhgQ7UamNoGbYsoa6KqIS
	A5P/ejycezXt9/HYiH7zwEiJVvES0XPk5mYuGs4dJ/e3EZFBHU/QlUqFC3N0D3NDlcUV1C+fha2ba
	tScHFY6Mkv9LqbEtODQnjO/leKCP2tufoK+Rre6sbQMFIzmpkh+dyv4q1UFT/JpDhza82D6SyNci0
	j4TNYKzqcOoe2ISSe7Ugj7cdQm2kz5RJ1qBPGo6ruawgC4gqHzTR2mPRBGm6rgyr31C2aMehj2h/H
	DwsmTFZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCHAJ-00000009P03-3Xw5;
	Fri, 24 Oct 2025 12:45:08 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCHAH-00000009OzR-1Tyz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 12:45:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fHLFk8P7vx3fkmMAD0Z+yzWnvmAZmlIEgYDTY3u8mmw=; b=Jn76CtehcFg/oN1IzztvatWZPh
	P3S/YEByWcAAh/kueIpYfffc4kv18iK0tvFMSMR3cqsG9kyuzexr4uLiZutXMgdnfoerSNGgaGVxX
	LrrhOKq2YL8yiEXiNPPa0rbqISLOWlLHK0U75KAZAK/zgzZV9r3qjNf8dDKjrweDgAOoRg+3PNuJ2
	oatiT/E08t+H7dr/kSj1YQVNrQEx58OI7/N+489J+E8T68qu7UFYZbGUt8ElKzN1mp3gnQ1st9GYI
	mB1VaitqQl16cESVOfv2gHEiljpFmMC0rGGhb5KBcwb+Z7ZazicRoeJiwDfFprulozfvGohwxuPZv
	3GI2wXBA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53056)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vCHA7-000000007Yw-2tBo;
	Fri, 24 Oct 2025 13:44:55 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vCHA5-000000002iF-1zR7;
	Fri, 24 Oct 2025 13:44:53 +0100
Date: Fri, 24 Oct 2025 13:44:53 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: Add a devlink attribute to
 control timestamping mode
Message-ID: <aPt0xYNh9qzmesWM@shell.armlinux.org.uk>
References: <20251024070720.71174-1-maxime.chevallier@bootlin.com>
 <20251024070720.71174-3-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024070720.71174-3-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_054505_390737_FE852712 
X-CRM114-Status: GOOD (  19.79  )
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

On Fri, Oct 24, 2025 at 09:07:18AM +0200, Maxime Chevallier wrote:
> The DWMAC1000 supports 2 timestamping configurations to configure how
> frequency adjustments are made to the ptp_clock, as well as the reported
> timestamp values.
> 
> There was a previous attempt at upstreaming support for configuring this
> mode by Olivier Dautricourt and Julien Beraud a few years back [1]
> 
> In a nutshell, the timestamping can be either set in fine mode or in
> coarse mode.
> 
> In fine mode, which is the default, we use the overflow of an accumulator to
> trigger frequency adjustments, but by doing so we lose precision on the
> timetamps that are produced by the timestamping unit. The main drawback
> is that the sub-second increment value, used to generate timestamps, can't be
> set to lower than (2 / ptp_clock_freq).
> 
> The "fine" qualification comes from the frequent frequency adjustments we are
> able to do, which is perfect for a PTP follower usecase.
> 
> In Coarse mode, we don't do frequency adjustments based on an
> accumulator overflow. We can therefore have very fine subsecond
> increment values, allowing for better timestamping precision. However
> this mode works best when the ptp clock frequency is adjusted based on
> an external signal, such as a PPS input produced by a GPS clock. This
> mode is therefore perfect for a Grand-master usecase.
> 
> Introduce a driver-specific devlink parameter "ts_coarse" to enable or
> disable coarse mode, keeping the "fine" mode as a default.
> 
> This can then be changed with:
> 
>   devlink dev param set <dev> name ts_coarse value true cmode runtime
> 
> The associated documentation is also added.
> 
> [1] : https://lore.kernel.org/netdev/20200514102808.31163-1-olivier.dautricourt@orolia.com/
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

