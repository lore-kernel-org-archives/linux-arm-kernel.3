Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5B0D37E59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QKXRvKdq4jsnFcCXQxpneoo9WaNt5xV/3qut8SUlR6c=; b=aOjcTJ0TT6e00H/9+nB8XgCR1N
	btUaoHze362WIs7HkI/+Yl4PMXDW18BN+vVHP1SiyUOzP5A07nl1qOk/A9L+dMSuf2AQGLTVT7ytT
	Vthd98y07ENoMF3z9hxPspv73vuroyUJJpC4v/g0Hyor02+sjkyldQ71EYX2bGxupYDZ5Cr7hCZXt
	MFP4EoUnNagac9VKYmCyLft9mAkSWklUpy+UM17r8CwbXELOlKuL7BDb2Q143rXRpNGAWLknJa4hy
	MVoiuDMq4M8c1EFmilkxm3zg+A/YJI3WjNSxfMb1XaXHvg/dDx0F0uJp/K+Ke9LUIy6siOBNFFJS3
	d3PStOcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Aq-00000009n1k-24KG;
	Wed, 14 Jan 2026 15:52:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Ao-00000009n0x-34uo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 15:52:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CEC926001A;
	Wed, 14 Jan 2026 15:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17042C4CEF7;
	Wed, 14 Jan 2026 15:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768405961;
	bh=OthrFbf3AcnFfU3HddSkXJCX7vPg/N2z4Kz8DN7djFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ffa+VvUfWRpIW6BV4lAmxGSlB/HXb/mpvk/xSuAMsPewI6A6nqLRc9UmqkE2LBW46
	 +E7S2LLSrrvQnvTDVVd/MUVz/UV5KjyB919Uzk6Gf48kjD1X+U1TYQ8p33FIU6RgzO
	 MWOj3fQu8DYTDt2Fj6lMBAZ/aeW2XBFAoiNW3h/AwWan9jTKEyc9feiSiM50/q+Nsy
	 IHt7/jiko8RVlevkOcjzjHYzSnIuAJMleTNBK1AhQN0zN4+a5qkt3NWfGYyZDlFWNU
	 Jtb3XlBbGnq1bfYQg6SPLXpgzcgA4yMRkzOlt11qeIo3nOWL8hoxpq+DuinmNKbHpU
	 MsT/yrKt/7Jbw==
Date: Wed, 14 Jan 2026 16:52:38 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Cc: "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>
Subject: Re: [PATCH V1] i2c: imx: Fix SMBus block read hang on zero length
Message-ID: <aWe7e_guDDAJdCA6@zenone.zhora.eu>
References: <20251229081629.4081452-1-Qing-wu.Li@leica-geosystems.com.cn>
 <aV60-Wm0c_Oo0zWF@zenone.zhora.eu>
 <GV2PR06MB10809C9AF32F95388E8DBF519D785A@GV2PR06MB10809.eurprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GV2PR06MB10809C9AF32F95388E8DBF519D785A@GV2PR06MB10809.eurprd06.prod.outlook.com>
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

Hi,

...

> > > master transmit mode before stopping. This is done by draining the
> > > pending received byte from I2DR, setting I2CR_MTX to enter transmit
> > > mode, waiting briefly for the mode change, and then proceeding with
> > > the normal STOP sequence.
> > >
> > > This change has been tested on i.MX 8M Plus platform.
> > >
> > > Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
> > 
> > Is this a fix?
> 
> Yes, this is a fix. Without this patch, zero-length SMBus block reads cause a system crash 
> and permanent bus lockup on i.MX 8M Plus. The fix ensures proper STOP generation and 
> prevents buffer overruns.

Then, please add the Fixes tag.

> > > ---
> > >  drivers/i2c/busses/i2c-imx.c | 13 ++++++++++++-
> > >  1 file changed, 12 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/i2c/busses/i2c-imx.c
> > > b/drivers/i2c/busses/i2c-imx.c index dcce882f3eba..f40deecf0f66 100644
> > > --- a/drivers/i2c/busses/i2c-imx.c
> > > +++ b/drivers/i2c/busses/i2c-imx.c
> > > @@ -735,6 +735,16 @@ static void i2c_imx_stop(struct imx_i2c_struct
> > *i2c_imx, bool atomic)
> > >               temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> > >               if (!(temp & I2CR_MSTA))
> > >                       i2c_imx->stopped = 1;
> > > +             if ((temp & I2CR_MSTA) && !(temp & I2CR_MTX)) {
> > > +                     (void)imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> > 
> > why do we need a cast here?
> 
> The void cast explicitly marks this as a dummy read. We're reading I2DR solely to drain the
> receive buffer (a required side effect before mode switching), not because we need the value.
> This makes the intent clear to both the compiler and code reviewers.

Please drop it.

> > > +                     temp |= I2CR_MTX;
> > > +                     imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> > > +                     if (atomic)
> > > +                             udelay(25);
> > 
> > where is this 25 coming from?
> 
> It's a conservative value derived from practical testing. at standard mode (100kHz),
> this equals ~2.5 I2C clock periods; at fast mode (400kHz), ~10 periods

Please add a comment.

Andi

