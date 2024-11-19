Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AC4D60D0A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 01:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxM76o8BGy53AtlOJoitl7JV8kJz7mesTX75V2BZ4D4=; b=ON+5+6BhMGFWK+kPFNubvsYMeg
	qQm2h7e+VEUcgQ1UJLVkoCQKFY4WFstvCOZ48yt4bXtl2Ax2xdtcneeyhaLv7UOiiv7UgKaFBEqUp
	Zf2G48FH3DLZEOJAfgHSifkPUcRNeCcrqf2ZEqkjCJwYTDBtmT3Ke/a3F3kO+5lNU19nVoW6fQkBv
	2xdKd5QX8vNkoqfErIHLnJkE4K/hxWQhHtLy7X9AxMc76ceIZx7Vnu5EN4jcs/A0noWRgYmnTm/5/
	gDQM+OIgA+K7kU6wIrIz/DeoM6Hml1tWX8Ce3RkJkTlV8F5JbxrxVblDVFdzdFoSqL4ICMCbSLD4b
	bJmqe1PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDDRH-0000000B7eK-0FV4;
	Tue, 19 Nov 2024 01:53:59 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDDPj-0000000B7QP-3xuC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 01:52:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=SxM76o8BGy53AtlOJoitl7JV8kJz7mesTX75V2BZ4D4=; b=qo
	kv2DXPF5NrFtTmXJuEOhpovQLZUIAGFuSld5TeLwIPl4mLkHcAF1mYH216IVlMWFOR4wCy9/us05n
	wPB7GLUOqbaKO12CCPHEKGt2dCOpkA+ildcppazSaUoNRItAVq6uDUkenkPYF6Km+XGmoh7xYVLE4
	Nwvweckmq3fDjYo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tDDPX-00DjZv-5j; Tue, 19 Nov 2024 02:52:11 +0100
Date: Tue, 19 Nov 2024 02:52:11 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Jacky Chou <jacky_chou@aspeedtech.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, hkallweit1@gmail.com,
	linux@armlinux.org.uk, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next 3/3] net: mdio: aspeed: Add dummy read for fire control
Message-ID: <b8986779-27eb-4b60-b180-24d84ca9a501@lunn.ch>
References: <20241118104735.3741749-1-jacky_chou@aspeedtech.com>
 <20241118104735.3741749-4-jacky_chou@aspeedtech.com>
 <0d53f5fbb6b3f1eb01e601255f7e5ee3d1c45f93.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d53f5fbb6b3f1eb01e601255f7e5ee3d1c45f93.camel@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_175223_982614_D4D61F8B 
X-CRM114-Status: GOOD (  21.18  )
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

On Tue, Nov 19, 2024 at 09:35:39AM +1030, Andrew Jeffery wrote:
> Hi Jacky,
> 
> On Mon, 2024-11-18 at 18:47 +0800, Jacky Chou wrote:
> > Add a dummy read to ensure triggering mdio controller before starting
> > polling the status of mdio controller.
> > 
> > Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> > ---
> >  drivers/net/mdio/mdio-aspeed.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/net/mdio/mdio-aspeed.c b/drivers/net/mdio/mdio-
> > aspeed.c
> > index 4d5a115baf85..feae30bc3e78 100644
> > --- a/drivers/net/mdio/mdio-aspeed.c
> > +++ b/drivers/net/mdio/mdio-aspeed.c
> > @@ -62,6 +62,8 @@ static int aspeed_mdio_op(struct mii_bus *bus, u8
> > st, u8 op, u8 phyad, u8 regad,
> >                 | FIELD_PREP(ASPEED_MDIO_DATA_MIIRDATA, data);
> >  
> >         iowrite32(ctrl, ctx->base + ASPEED_MDIO_CTRL);
> > +       /* Add dummy read to ensure triggering mdio controller */
> > +       (void)ioread32(ctx->base + ASPEED_MDIO_CTRL);
> 
> Why do this when the same register is immediately read by
> readl_poll_timeout() below?
> 
> If there is a reason, I'd like some more explanation in the comment
> you've added, discussing the details of the problem it's solving when
> taking into account the readl_poll_timeout() call.

Also, is this a fix? Should it have a Fixes: tag? If so, it should not
be part of this series, assuming the older devices have the same
issue.

	Andrew

