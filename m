Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA41E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zONt937jdbrvPGPeo1b2Ss99phDOIRVX2Gs8afrVmFw=; b=soqrB6lUmKaqNAtQy5zSTZ4J5I
	bNXetaS7/YZiMu+oLknp5wsqnLdeDr46ZnHVARYJycEfzLIlGkZoe8S0cpmMMrSpAKEyAsMaPBJa5
	iKGeQvJdMJ0oCJz3+ePDBAzIEvZY0Fl/MwuDFVAFWL53lO8BybHwpY2G4syvXWuRV5gyZb96B5Bel
	880KpJJ2/xHmHl3rXv5IuueZPTAA84wCc9rNOG/9KGNmUFakZAD80mNI5SgGknD8lfCGuanUAUXYl
	jnrsng+rFf3NtXapMj6OPkSh5ZnX2CZpoIckk7fuV+qJHFA9y9AZXuGjzRTeVWVCTqqedAI1dMl/z
	5Vbu+Xwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAqu-00000005Hhg-3rrM;
	Tue, 07 Jan 2025 14:46:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAlY-00000005G90-2Cw9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:41:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CF2C75C630D;
	Tue,  7 Jan 2025 14:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08487C4CED6;
	Tue,  7 Jan 2025 14:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736260867;
	bh=Fm54NFKxpCer1yj0tlCPm8daKKZ3zQKs8KdgFK7i0r0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sCc0pZLn5PRwtj2bDqvy9l0P08SW3iNYULWsw9OD4KMgEwI7FImqoRhAsK61anQtY
	 bsnW1U7j/UYZQr6m5feLqcycuFT+1lO28KfR5d7ABZ58afQbFF3fzxnSNcsjW9uY62
	 C2LgXTKRRObyPWgald3Ce2Mu6IRDZK9vqX/WNUg8WU8sK7XYFwAtyXpk/pkkO/N42M
	 uEK1SIeDIsKrJgyxpcV8D//caXY2pz1bCc7pJgjxI7Rsopo55xMME/Gn6/lnef2uIO
	 Mx6+t3jO6PrQ6AH/AtWgu2bZbVp7lpFb6vbJzEsC6rWTRlhTkvSqp/0I6/+ir1MouF
	 m2H2PsWVOXVEw==
Date: Tue, 7 Jan 2025 14:41:03 +0000
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
Message-ID: <20250107144103.GB5872@kernel.org>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
 <E1tUmAE-007VWv-UW@rmk-PC.armlinux.org.uk>
 <20250107112851.GE33144@kernel.org>
 <Z30WmPpMp_BRgrOI@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z30WmPpMp_BRgrOI@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_064108_654655_A3CD0E07 
X-CRM114-Status: GOOD (  29.20  )
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

On Tue, Jan 07, 2025 at 11:57:12AM +0000, Russell King (Oracle) wrote:
> On Tue, Jan 07, 2025 at 11:28:51AM +0000, Simon Horman wrote:
> > On Mon, Jan 06, 2025 at 12:24:58PM +0000, Russell King (Oracle) wrote:
> > > The ethtool interface uses u32 for tx_lpi_timer, and so does phylib.
> > > Use u32 to store this internally within stmmac rather than "int"
> > > which could misinterpret large values.
> > > 
> > > Since eee_timer is used to initialise priv->tx_lpi_timer, this also
> > > should be unsigned to avoid a negative number being interpreted as a
> > > very large positive number.
> > > 
> > > Also correct "value" in dwmac4_set_eee_lpi_entry_timer() to use u32
> > > rather than int, which is derived from tx_lpi_timer, even though
> > > masking with STMMAC_ET_MAX will truncate the sign bits. u32 is the
> > > value argument type for writel().
> > > 
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > 
> > ...
> > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > index 9a9169ca7cd2..b0ef439b715b 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > @@ -111,8 +111,8 @@ static const u32 default_msg_level = (NETIF_MSG_DRV | NETIF_MSG_PROBE |
> > >  				      NETIF_MSG_IFDOWN | NETIF_MSG_TIMER);
> > >  
> > >  #define STMMAC_DEFAULT_LPI_TIMER	1000
> > > -static int eee_timer = STMMAC_DEFAULT_LPI_TIMER;
> > > -module_param(eee_timer, int, 0644);
> > > +static unsigned int eee_timer = STMMAC_DEFAULT_LPI_TIMER;
> > > +module_param(eee_timer, uint, 0644);
> > >  MODULE_PARM_DESC(eee_timer, "LPI tx expiration time in msec");
> > >  #define STMMAC_LPI_T(x) (jiffies + usecs_to_jiffies(x))
> > >  
> > 
> > Hi Russell,
> > 
> > now that eee_timer is unsigned the following check in stmmac_verify_args()
> > can never be true. I guess it should be removed.
> > 
> >         if (eee_timer < 0)
> >                 eee_timer = STMMAC_DEFAULT_LPI_TIMER;
> > 
> 
> Thanks for finding that. The parameter description doesn't seem to
> detail whether this is intentional behaviour or not, or whether it is
> "because someone used int and we shouldn't have negative values here".
> 
> I can't see why someone would pass a negative number for eee_timer
> given that it already defaults to STMMAC_DEFAULT_LPI_TIMER.
> 
> So, I'm tempted to remove this.

I'm not sure either. It did cross my mind that the check could be changed,
to disallow illegal values (if the range of legal values is not all
possible unsigned integer values). But it was just an idea without any
inspection of the code or thought about it's practicality. And my first
instinct was the same as yours: remove the check.

