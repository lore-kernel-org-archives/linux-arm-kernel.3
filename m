Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC14DC98315
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 14:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YRxCDaMEMjeNgmx5T/EVuTSh67LGdojGLOrhCwhCev0=; b=nPnxsiC1E5kpid08vI/cRhpPHX
	RnkQw1cv6umpD4xj7rTPvkKoo4PvcR7gxaqKSKQPOkExozilPekVioJnw3do2SRPI2T0+nPems4Kp
	ZL7tP99Kc4kRcwilpTzgL70Q+as+xJoOfpjht39ouuMab59W5GeBuVB7whkVFr/IxHNdRvqjGkyj7
	UWkBtDneDnhpVj605aEg4q3PsTLnZpOwR5jkYj1IKNI1eWqMlkJQStTtNThTrPgczXIGNRMxRA/Fq
	rAdK3n7ckrJEQCf5Om5axAthEb/ngkZm87+8PuRANYU37PR/0qTd4/kBLiOXfriaQnhcc57S3PARV
	4iXhTpgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9kLv-0000000BFes-3bEz;
	Thu, 24 Sep 2026 14:23:11 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9kLt-0000000BFe4-1KcP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 14:23:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=YRxCDaMEMjeNgmx5T/EVuTSh67LGdojGLOrhCwhCev0=; b=Dh
	yr7+gSHaRcEawD7cbrPt+q4UONwcYADUgJw5JgqaWvylNf7fjebTq0uJd6Xd1kOR8rR4fr5fHTz/h
	guuO87WuXQ4NjRbeV/YfXysiOAVl499MxPqbJlKGfWhJUGIxu2mFFt5LbUu3EMwTHsjckS6ETztzH
	HgxnZPvLRiN484Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x9kLf-0070ej-GP; Thu, 24 Sep 2026 16:22:55 +0200
Date: Thu, 24 Sep 2026 16:22:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Cc: shengchao.guo@oss.qualcomm.com, bartosz.golaszewski@oss.qualcomm.com,
	mohd.anwar@oss.qualcomm.com, maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, hkallweit1@gmail.com,
	linux@armlinux.org.uk, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] net: stmmac: support low-speed USXGMII validation
Message-ID: <66dbb6d5-5e2d-49fb-a882-acd67eb6fcea@lunn.ch>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923084921.3942100-1-zhangfei.gao@oss.qualcomm.com>
 <20260923084921.3942100-2-zhangfei.gao@oss.qualcomm.com>
 <828e6cff-79d2-4349-805f-cca927f7b908@lunn.ch>
 <CAFkd8htx-MTOMFO1S3uZt_8wyL+qoOhb577O2MMYr6oJ9jc=vg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFkd8htx-MTOMFO1S3uZt_8wyL+qoOhb577O2MMYr6oJ9jc=vg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_072309_355810_DF0EFCA6 
X-CRM114-Status: GOOD (  18.01  )
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

On Thu, Sep 24, 2026 at 06:39:47PM +0800, Zhangfei Gao wrote:
> Hi, Andrew
> 
> On Wed, Sep 23, 2026 at 8:58 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> > > index 091c9b57388fa..58ca296fc4420 100644
> > > --- a/drivers/net/pcs/pcs-xpcs.c
> > > +++ b/drivers/net/pcs/pcs-xpcs.c
> > > @@ -23,6 +23,12 @@ static const int xpcs_usxgmii_features[] = {
> > >       ETHTOOL_LINK_MODE_Pause_BIT,
> > >       ETHTOOL_LINK_MODE_Asym_Pause_BIT,
> > >       ETHTOOL_LINK_MODE_Autoneg_BIT,
> > > +     ETHTOOL_LINK_MODE_10baseT_Full_BIT,
> > > +     ETHTOOL_LINK_MODE_100baseT_Full_BIT,
> > > +     ETHTOOL_LINK_MODE_1000baseT_Full_BIT,
> > > +     ETHTOOL_LINK_MODE_2500baseT_Full_BIT,
> > > +     ETHTOOL_LINK_MODE_5000baseT_Full_BIT,
> > > +     ETHTOOL_LINK_MODE_10000baseT_Full_BIT,
> >
> > What does T in 10000baseT mean?
> >
> > >       ETHTOOL_LINK_MODE_1000baseKX_Full_BIT,
> > >       ETHTOOL_LINK_MODE_10000baseKX4_Full_BIT,
> > >       ETHTOOL_LINK_MODE_10000baseKR_Full_BIT,
> >
> > Compare and contract with KX.
> 
>  T denotes twisted-pair copper media, whereas KX/KR denote backplane
>   Ethernet modes. USXGMII is the host-side interface between the MAC/PCS
>   and the external PHY; it is not itself a media type.
> 
>   The BASE-T modes are needed here because the attached PHY reports its
>   line-side capabilities as BASE-T modes, which must pass XPCS
>   validation.

Now think about why i asked. It probably means something is wrong.
But i will admit, there is a possibility i'm wrong, but you need to
first exclude all other possibilities and give a clear explanation why
i'm wrong.

The question should point you in the correct direction. You should not
do the minimum hack to make it work, you need to spend the time to
understand the architecture and find the correct way to do this.

	   Andrew

