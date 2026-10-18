Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED4ECCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 22:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8W0ukGwqq5l3dY+cMADZeErTiTu6wpC8dq2ZxvP/NA=; b=n18sDAmgzJ4pYDRfPxfmRKBxpc
	NlgrOl/Vf922viDV4SzHLmXG0jjOfJ5lpU/SSdXxN7K57jJlTj/S0VX27MFbXsAoRtPju2DFijmx0
	2d1xztKkB5LOLo1ZRGU//TZj3gLfcFPWTY0A/s0AgZFW36c0yNWhKjoegOvoDt6o7u8Gxg3L15VIc
	8jFZauczhJLFf6ZP0OyEX8p84O8KlWgStWScVz9E4hYWnU0bgg736poxzezVEmzQKLZUWOvLI2vOM
	1YU70MIhgpyacTIxmsL1P6oCZ2no32tvxTrPcwHeltzW1E3lTqEket52ACZ147rtldGn4lMdG68c9
	1Oo72M4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIZqC-00000006HLq-46wf;
	Sun, 18 Oct 2026 22:58:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIZqA-00000006HLk-1ILs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 22:58:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B778240519;
	Sun, 18 Oct 2026 22:58:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048401F000C4;
	Sun, 18 Oct 2026 22:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792364333;
	bh=P8W0ukGwqq5l3dY+cMADZeErTiTu6wpC8dq2ZxvP/NA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=LXdjsm7+lHxbrr87PP5kQaTrDmKmX1ws1/Q4HbrIT9PS/NqIi83s6mnyBTkecH7j0
	 Bz1vo1uv/jdSVIH4KaKTACMcx2gZuOK9bhzqDd+l1n4kxKK/rpBNO/OVHSLh/E5NeG
	 hc+/Mbn4O5MFP9AL5et8Rc/HAX4v/uz+lw20HlruiBx1zlqows0A37MTx1cZz8Dky0
	 m8HKZ9XbdkTogmfWiz5dHxACz/+h5C3OUzp77f7K/9/aN9dc2jg1OdYU7c+C1z98Bg
	 WJDAUV1mc1ythXS2YbkCvm3b/iFPReWXSbpLRv2fTNO1eX21oJC9FNdSOMl5Kua+dN
	 d5aCiO53RTP/A==
Date: Sun, 18 Oct 2026 23:58:45 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>, Conall
 O'Griofa <conall.ogriofa@amd.com>, <linux-iio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <git@amd.com>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: Re: [PATCH v4 06/15] iio: adc: xilinx-xadc: Use
 guard()/scoped_guard() for spinlock locking
Message-ID: <20261018235845.59228f7d@jic23-hlaptop>
In-Reply-To: <20261005151317.00001df3@gmail.com>
References: <20261005094205.1045874-1-dileepkumar.nagavarapu@amd.com>
	<20261005094205.1045874-7-dileepkumar.nagavarapu@amd.com>
	<20261005151317.00001df3@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
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

On Mon, 5 Oct 2026 15:13:17 +0200
Joshua Crofts <joshua.crofts1@gmail.com> wrote:

> On Mon, 5 Oct 2026 15:11:56 +0530
> Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com> wrote:
> 
> > Use guard() and scoped_guard() helpers for spinlock handling
> > instead of spin_lock/spin_unlock sequences.
> > 
> > This removes the need for explicit spin_unlock()
> > 
> > No functional change intended.
> > 
> > Co-developed-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> > Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> > Signed-off-by: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
> > ---  
> 
> ...
> 
> > @@ -677,15 +670,15 @@ static int xadc_trigger_set_state(struct iio_trigger *trigger, bool state)
> >  		xadc->trigger = NULL;
> >  	}
> >  
> > -	spin_lock_irqsave(&xadc->lock, flags);
> > -	xadc_read_reg(xadc, XADC_AXI_REG_IPIER, &val);
> > -	xadc_write_reg(xadc, XADC_AXI_REG_IPISR, XADC_AXI_INT_EOS);
> > -	if (state)
> > -		val |= XADC_AXI_INT_EOS;
> > -	else
> > -		val &= ~XADC_AXI_INT_EOS;
> > -	xadc_write_reg(xadc, XADC_AXI_REG_IPIER, val);
> > -	spin_unlock_irqrestore(&xadc->lock, flags);
> > +	scoped_guard(spinlock_irqsave, &xadc->lock) {
> > +		xadc_read_reg(xadc, XADC_AXI_REG_IPIER, &val);
> > +		xadc_write_reg(xadc, XADC_AXI_REG_IPISR, XADC_AXI_INT_EOS);
> > +		if (state)
> > +			val |= XADC_AXI_INT_EOS;
> > +		else
> > +			val &= ~XADC_AXI_INT_EOS;
> > +		xadc_write_reg(xadc, XADC_AXI_REG_IPIER, val);
> > +	}
> >  
> >  err_out:
> >  	mutex_unlock(&xadc->mutex);  
> 
> Since you've moved the spinlocks to use guard, what about replacing
> mutex_lock/unlock as well?

Absolutely on this. See cleanup.h guidance: mixing goto and anything
from there in a function is not a good idea.

> 
> Otherwise this seems fine.
> 


