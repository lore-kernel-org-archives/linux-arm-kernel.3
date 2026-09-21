Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2E9C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 16:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KwVSnrq/0OzzhhquleWQYxz0k/Km6R1PQFNFBtSLym0=; b=oE+x4HRdBSFWmP5+/rfImrLwJh
	zT1ihf+S0NcEwaCcXBt4g7TBNV3maKuBOCEpRWLpPmGAYSMaJ6fisWrW/ezh+0JAko1x8nfbWNyhQ
	TgjOPETnIlFlksySuSkQRWrAFN2tEKZ+9AORrnvj3qoq6a9YLMkS7/nzSJA257Gof1WXpornlPy2x
	35LNvXZBS4TMZLzS3YO2jzsKiyNsiMaldqQvrm8zoQLxjL7cST1e7sIOQ96zxIn4suDMTaLHVTi2J
	MHLdWwyDJuWwSPVl9DzhZ/WvEYNbAA2Tn6Az+7AYX4t6OXd1W43lGY4yf26fL1Qlnce1KeJ06RUGn
	85ILjsMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gfN-00000002nX7-2iP3;
	Mon, 21 Sep 2026 16:14:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gfL-00000002nWb-3UWV;
	Mon, 21 Sep 2026 16:14:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F4C540D87;
	Mon, 21 Sep 2026 16:14:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510A71F000FF;
	Mon, 21 Sep 2026 16:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790007291;
	bh=KwVSnrq/0OzzhhquleWQYxz0k/Km6R1PQFNFBtSLym0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=EMpZMiQeitfuWmbUNAH3sknwQ5FqmGj1a/BYuC1ImAHhQwo3Mx+7Z0H+q3mNl5V6N
	 ftBNUhl1hBqxqhmvHUpvZ/UBaEM6qkFwiOfPusvtkUIt9DYjPDQKnnEDhuixMtvVp4
	 Ge8fPRm9ib9NsT5FB45B+oyRw3sVsN+N7g432LezpUaYZEkGKA5lzLFRA0r5+dxr+G
	 zPWCW7oWGFSvirRzoQYTqUIjbjhSGn0cxlpXYyz4ICkjewpnazPrdjLvCxbcji2uJW
	 M6IWwD6ypQVm00g7O60kdpFsfcllqxVM++C+f+Z5uoyqaU81iCAD0ESiSGkV0Yxbvz
	 qHO2m0tloeNew==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 24D1DCE086B; Mon, 21 Sep 2026 09:14:51 -0700 (PDT)
Date: Mon, 21 Sep 2026 09:14:51 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG/PATCH] drivers/usb/mtu3: Work around mtu3_log_ep
 double-indirection issue
Message-ID: <297673dd-6bcc-471a-9db0-980da3242339@paulmck-laptop>
References: <a3ee0655-d818-48e0-84d1-475e6c16c991@paulmck-laptop>
 <d7bb2cf4-11c3-468c-8749-99cc408299c7@arm.com>
 <b6c621eb-6d20-4e00-ac05-af122b630ca5@paulmck-laptop>
 <aae79c1c-8738-4b97-b1b9-d82d19d82d49@arm.com>
 <20260909093524.249c2a1a@gandalf.local.home>
 <arE4jcn4dCD9gos_@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arE4jcn4dCD9gos_@J2N7QTR9R3.cambridge.arm.com>
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

On Mon, Sep 21, 2026 at 03:00:45PM +0100, Mark Rutland wrote:
> On Wed, Sep 09, 2026 at 09:35:24AM -0400, Steven Rostedt wrote:
> > On Wed, 9 Sep 2026 11:31:28 +0100
> > Vladimir Murzin <vladimir.murzin@arm.com> wrote:
> > 
> > > I've done a little bit massaging and here is what worked for me
> > > 
> > > 
> > > diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
> > > index 89870175d635..4d4bae25fa1f 100644
> > > --- a/drivers/usb/mtu3/mtu3_trace.h
> > > +++ b/drivers/usb/mtu3/mtu3_trace.h
> > > @@ -224,6 +224,7 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
> > >                 __field(unsigned int, flags)
> > >                 __field(unsigned int, direction)
> > >                 __field(struct mtu3_gpd_ring *, gpd_ring)
> > > +               __field(dma_addr_t, gpd_ring_dma)
> > >         ),
> > >         TP_fast_assign(
> > >                 __assign_str(name);
> > > @@ -235,12 +236,13 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
> > >                 __entry->flags = mep->flags;
> > >                 __entry->direction = mep->is_in;
> > >                 __entry->gpd_ring = &mep->gpd_ring;
> > > +               __entry->gpd_ring_dma = mep->gpd_ring.dma;
> > >         ),
> > >         TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
> > >                 __get_str(name), usb_ep_type_string(__entry->type),
> > >                 __entry->maxp, __entry->slot,
> > >                 __entry->mult, __entry->maxburst,
> > > -               __entry->gpd_ring, &__entry->gpd_ring->dma,
> > > +               __entry->gpd_ring, &__entry->gpd_ring_dma,
> > >                 __entry->flags & MTU3_EP_ENABLED ? 'E' : 'e',
> > >                 __entry->flags & MTU3_EP_STALL ? 'S' : 's',
> > >                 __entry->flags & MTU3_EP_WEDGE ? 'W' : 'w',
> > 
> > LGTM,
> > 
> > Reviewed-by: Steven Rostedt <rostedt@goodmis.org>
> 
> On v7.3-rc4 I still see the splat Paul reported initially, and the above
> fixes that, so FWIW:
> 
> Tested-by: Mark Rutland <mark.rutland@arm.com>
> 
> Steve, I assume you were expecting someone to send the above as a full
> patch.
> 
> Paul, do you intend to send a v2, or should Vladimir send out his
> version as its own patch? I assume you're happy with a Reported-by, if
> he does that?

I figure that Vladimir's patch supersedes my hack, and so I would be
quite happy with Vladimir sending a formal patch with my Reported-by.

							Thanx, Paul

