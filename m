Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D24CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 09:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f29b9XEMWtl0iCxOQKcT1CpFJ7lPhpDn5J4Ct4nX3F4=; b=1L2rDHs3OxPw6mTcP1T+1nR5P1
	MT9+nD9gW7BOh5m1RQTi3pEUuop36Dvsh+mZ5hj+qBhvb/6MAe/C5Zg/Yl8zqrgc4B8nx/GwfDzqP
	nxse/O44TXf12QiLgsGiTjUkE2sTK2OAMs/nqswnoBgbePbDdwMhiP8stl8Opf7BvbG2/GhAYJFRv
	h+go0mOCP0eW8vzcW8UAjwrdwUwkd7Vz5e5M2SJgWmROgb2W1TNQdIS2Le3a46q8J5XnhQBcLJZjt
	MJcQPSmtBlVWnvXwzfCcgf1FkUf3VmCnIKFeW3YF4xWz7ZF5pznOTCYF+nh9Xpbb1zXXgaby+uUIQ
	XZIl5vwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSmj-00000007slA-1dmf;
	Wed, 08 Jan 2025 09:55:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSaN-00000007qCu-0IvP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 09:42:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 82E695C1ECA;
	Wed,  8 Jan 2025 09:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F55C4CEE0;
	Wed,  8 Jan 2025 09:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736329366;
	bh=rAAJB23TaaJIaXUpZUUa/qWZJRWIZmWNo/u6nwx5HzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OjjUICPLs/LoW1PyprRp1lnp/tZKSOWO4ehhjLcJ+K/CZZY1ysTIi5SPNDhMhnNxu
	 eExZCi6apmXpawI/bBsZRqUc6bV7I+p0ufJhgE640aVZ5ys6wTdrEVpOEUYj4YN+3M
	 R7z1Q3vefFHTWUvnA9uj7fStZOFv2WM5aNyMRik/rsCv7JfP7rLv2g31Uhwcxr+8CU
	 Ip7ZMKPyttguxA2VNfABElNn8UDMxMzydjZjIQVbqvGA97SputE20sNx3AkRqBvbkU
	 zHEUcUkNjXD9MTjgu7CK03zl3rMA8aPVGWwmBfjGFC6hUzWslGg5BpJRGdOU/58lS9
	 X049ltnN3XIvg==
Date: Wed, 8 Jan 2025 09:42:41 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 03/17] net: stmmac: use correct type for
 tx_lpi_timer
Message-ID: <20250108094241.GD2772@kernel.org>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
 <E1tUmAE-007VWv-UW@rmk-PC.armlinux.org.uk>
 <20250107112851.GE33144@kernel.org>
 <Z30WmPpMp_BRgrOI@shell.armlinux.org.uk>
 <20250107144103.GB5872@kernel.org>
 <Z31Hjlp_3jIeSpWH@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z31Hjlp_3jIeSpWH@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_014247_196227_86D19D22 
X-CRM114-Status: GOOD (  41.20  )
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

On Tue, Jan 07, 2025 at 03:26:06PM +0000, Russell King (Oracle) wrote:
> On Tue, Jan 07, 2025 at 02:41:03PM +0000, Simon Horman wrote:
> > On Tue, Jan 07, 2025 at 11:57:12AM +0000, Russell King (Oracle) wrote:
> > > On Tue, Jan 07, 2025 at 11:28:51AM +0000, Simon Horman wrote:
> > > > On Mon, Jan 06, 2025 at 12:24:58PM +0000, Russell King (Oracle) wrote:
> > > > > The ethtool interface uses u32 for tx_lpi_timer, and so does phylib.
> > > > > Use u32 to store this internally within stmmac rather than "int"
> > > > > which could misinterpret large values.
> > > > > 
> > > > > Since eee_timer is used to initialise priv->tx_lpi_timer, this also
> > > > > should be unsigned to avoid a negative number being interpreted as a
> > > > > very large positive number.
> > > > > 
> > > > > Also correct "value" in dwmac4_set_eee_lpi_entry_timer() to use u32
> > > > > rather than int, which is derived from tx_lpi_timer, even though
> > > > > masking with STMMAC_ET_MAX will truncate the sign bits. u32 is the
> > > > > value argument type for writel().
> > > > > 
> > > > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > > 
> > > > ...
> > > > 
> > > > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > > > index 9a9169ca7cd2..b0ef439b715b 100644
> > > > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > > > @@ -111,8 +111,8 @@ static const u32 default_msg_level = (NETIF_MSG_DRV | NETIF_MSG_PROBE |
> > > > >  				      NETIF_MSG_IFDOWN | NETIF_MSG_TIMER);
> > > > >  
> > > > >  #define STMMAC_DEFAULT_LPI_TIMER	1000
> > > > > -static int eee_timer = STMMAC_DEFAULT_LPI_TIMER;
> > > > > -module_param(eee_timer, int, 0644);
> > > > > +static unsigned int eee_timer = STMMAC_DEFAULT_LPI_TIMER;
> > > > > +module_param(eee_timer, uint, 0644);
> > > > >  MODULE_PARM_DESC(eee_timer, "LPI tx expiration time in msec");
> > > > >  #define STMMAC_LPI_T(x) (jiffies + usecs_to_jiffies(x))
> > > > >  
> > > > 
> > > > Hi Russell,
> > > > 
> > > > now that eee_timer is unsigned the following check in stmmac_verify_args()
> > > > can never be true. I guess it should be removed.
> > > > 
> > > >         if (eee_timer < 0)
> > > >                 eee_timer = STMMAC_DEFAULT_LPI_TIMER;
> > > > 
> > > 
> > > Thanks for finding that. The parameter description doesn't seem to
> > > detail whether this is intentional behaviour or not, or whether it is
> > > "because someone used int and we shouldn't have negative values here".
> > > 
> > > I can't see why someone would pass a negative number for eee_timer
> > > given that it already defaults to STMMAC_DEFAULT_LPI_TIMER.
> > > 
> > > So, I'm tempted to remove this.
> > 
> > I'm not sure either. It did cross my mind that the check could be changed,
> > to disallow illegal values (if the range of legal values is not all
> > possible unsigned integer values). But it was just an idea without any
> > inspection of the code or thought about it's practicality. And my first
> > instinct was the same as yours: remove the check.
> 
> My reasoning is as follows:
> 
> In the existing code with the module paramter is a signed int, then it
> take a value up to INT_MAX. Provided sizeof(int) == sizeof(u32), then
> this can be reported through the ethtool API. However, ethtool can set
> the timer to U32_MAX which can exceed INT_MAX in this case. The driver
> doesn't stop this, and uses a software based timer for any delay greater
> than the capabilities of the hardware timer (if any.)
> 
> So, through ethtool one can set the LPI delay to anything between 0 and
> U32_MAX, whereas through the module parameter it's between 0 and
> INT_MAX. values between INT_MIN and -1 inclusive result in the default
> being used.
> 
> It is, of course, absurd to have a negative delay, or even a delay
> anywhere near INT_MAX or U32_MAX.
> 
> I'll separate out the change to eee_timer so if necessary, that can be
> reverted without reverting the entire patch. Oh goodo, an extra patch
> for a patchset which already exceeds netdev's 15 patches...

Thanks Russell, FWIIW this sounds entirely reasonable to me.

