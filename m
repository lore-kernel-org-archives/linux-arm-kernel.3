Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52321C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 15:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWWl36l+kSSIfXjjs43bn9G6WA3Ypw8Y0smzTmvKDFk=; b=S4SmWT+4RbkWw9YlOH6F8Lw2dq
	gAjK8OSPl8POfWr8TAWHYat47D2gX7T8GE+po0RJkS2R9Gx9oY3A3vSWkHX4k96Q2U2AF54uKTjbe
	UpMGuzjxae3a0x+RkZB2pJg5z2XWBLUW6lM7+BAZO4sysEFiK92kWuhWxp/EGlUxtPPX78MsogNQ6
	M90zgaQ5XLmUzXpFYvHZEC5rLofIKQyA/YOn5IYFkVQ4XCXxjzuuAgUZZK+NPE1oHNGkxEwwYHYlQ
	Gp6Fw3ckd17qR/YDEaGsnp3cHX9DDyxZQmjqk75Loat0EtcV8r92bIuf/3D0F3c+6yooTKc84N8r3
	7oITFhIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4K0Z-0000000C6h1-1c3f;
	Wed, 09 Sep 2026 15:14:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4K0X-0000000C6g5-1Xmg;
	Wed, 09 Sep 2026 15:14:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C8FC9601EF;
	Wed,  9 Sep 2026 15:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1311F00A3A;
	Wed,  9 Sep 2026 15:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788966880;
	bh=SWWl36l+kSSIfXjjs43bn9G6WA3Ypw8Y0smzTmvKDFk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=fvP3xlxOqrifu76NmZO+YiYlUB2RhQulCVFW4MwwwwErLJsE20TGGcMoSMbDRT4et
	 hfsOTdOwuCswBL9oBjrqq5eTZwmtrWp1IwbKLxz/zeu48S6zSBwyVfFJd6H/SZfhoY
	 SdwAeLboV3BtSWW8L+xSH6SvdXBGeFIBAhyqTRNVDEwd1tj2QBC2tgLEveywRhxunQ
	 c6wSgnawqWxr0A1QOofuXLNbBRw6g+f/xbGyOc/OlKceDnw5nDxyJSEgmMPlyMta2T
	 Hyb5vfiER9UdQrZDRMeojskYlF0SVYQRAC7zuaEUQMegi86Pn7l/aArvLIr88/3c3i
	 hSD3V62ornSOw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 4ED71CE0850; Wed,  9 Sep 2026 08:14:40 -0700 (PDT)
Date: Wed, 9 Sep 2026 08:14:40 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG/PATCH] drivers/usb/mtu3: Work around mtu3_log_ep
 double-indirection issue
Message-ID: <0e929dba-7ff9-4d3e-800e-4a77dbd84c8b@paulmck-laptop>
References: <a3ee0655-d818-48e0-84d1-475e6c16c991@paulmck-laptop>
 <d7bb2cf4-11c3-468c-8749-99cc408299c7@arm.com>
 <b6c621eb-6d20-4e00-ac05-af122b630ca5@paulmck-laptop>
 <20260909093417.4880999e@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909093417.4880999e@gandalf.local.home>
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
Reply-To: paulmck@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Sep 09, 2026 at 09:34:17AM -0400, Steven Rostedt wrote:
> On Tue, 8 Sep 2026 11:08:33 -0700
> "Paul E. McKenney" <paulmck@kernel.org> wrote:
> 
> > > > Apparently, the code should instead create another entry in
> > > > TP_STRUCT__entry(), and do the double-indirection TP_fast_assign() instead
> > > > of TP_printk().  But simply removing the offending double indirection
> > > > in TP_printk() gets this splat out of the way of other debugging.  
> > > 
> > > Indeed, splat has gone after applying the patch.
> > > 
> > > Thanks
> > > Vladimir  
> > 
> > Does this less hacky patch do the trick?
> 
> Nope!
> 
> 
> > diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
> > index 89870175d63561..6477ad3ddc66f6 100644
> > --- a/drivers/usb/mtu3/mtu3_trace.h
> > +++ b/drivers/usb/mtu3/mtu3_trace.h
> > @@ -224,6 +224,7 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
> >  		__field(unsigned int, flags)
> >  		__field(unsigned int, direction)
> >  		__field(struct mtu3_gpd_ring *, gpd_ring)
> > +		__field(dma_addr_t *, gpd_ring_dma)
> >  	),
> >  	TP_fast_assign(
> >  		__assign_str(name);
> > @@ -235,12 +236,13 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
> >  		__entry->flags = mep->flags;
> >  		__entry->direction = mep->is_in;
> >  		__entry->gpd_ring = &mep->gpd_ring;
> > +		__entry->gpd_ring_dma = &mep->gpd_ring->dma;
> 
> You are still saving the address of some memory into the ring buffer.
> 
> 
> >  	),
> >  	TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
>                                                                         ^^^^
> 
> That %pad dereferences the pointer passed to it.
> 
> >  		__get_str(name), usb_ep_type_string(__entry->type),
> >  		__entry->maxp, __entry->slot,
> >  		__entry->mult, __entry->maxburst,
> > -		__entry->gpd_ring, &__entry->gpd_ring->dma,
> > +		__entry->gpd_ring, __entry->gpd_ring_dma,
> 
> That will read the address saved in the ring buffer and dereference it.
> 
> Remember, the above TP_fast_assign() logic gets executed when the
> tracepoint is triggered. The TP_printk() is executed when the user reads
> the trace buffer. That could be seconds, minutes, hours, days, even months
> later!
> 
> You can't trust that the memory you are dereferencing will not be freed
> when the user reads the trace.
> 
> The original patch is not hacky. It is actually the correct way of handling
> this.

Very well, "git revert" followed by "git cherry-pick" of the original.
Or someone can feel free to pull in the original from earlier in this
thread.

Either way, thank you!

							Thanx, Paul

> -- Steve
> 
> 
> >  		__entry->flags & MTU3_EP_ENABLED ? 'E' : 'e',
> >  		__entry->flags & MTU3_EP_STALL ? 'S' : 's',
> >  		__entry->flags & MTU3_EP_WEDGE ? 'W' : 'w',
> 

