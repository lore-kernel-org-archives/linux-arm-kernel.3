Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E45C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpSBX9zUnKOsYMEzJCVdOj7P1czBOXfO4KP+K+06BCw=; b=cX+PQDD5la6ZOh873vwUnR+rLl
	abj5i7I+HuOUaBtYz/xDd9MrPgMoJ2DY70XK7oR/vAd2vvM/Y4k+NKJl0RuQ+UOLLMnLw+w3qgIg2
	3O2RWwsGdq8rmA4ZtBQaEeEntdENI3iHOIKMyUleQOs3l4WwIxokdTOP1iKW2GqoDVoemwF7N3AXL
	M6acNZ/6E0Bbjai1xyb7mVwgO5Z3msJ0YFpBYZ/maavl+/ctA9YzOH5kcWbHBUIo1LaULDuGrqRKQ
	yG2wbLoiMEz8Wqpapg7fkWcis+86KulAdd2FLo3kFaW8OY0ZKRJ3S757FjCPaZZYRuWUEy0ZDDsyh
	iBlM4IKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8eZi-00000002JqX-49qf;
	Mon, 21 Sep 2026 14:00:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8eZg-00000002Jpc-3Wyz;
	Mon, 21 Sep 2026 14:00:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A6651D13;
	Mon, 21 Sep 2026 07:00:48 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A03C33F528;
	Mon, 21 Sep 2026 07:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789999251; bh=196CWRrTsBXNGEh3O1halF0+Yb/A+7t5R7xVTmSSTuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RIH1OhFfFFabunQv0YPirHG+CsJ71/CgYQj6MJ4sSGsVQuJMZyLB4jJmRSzQ1LE2K
	 rDCaxiiaeeqFrS4tkZ+PYRwgV01eC7wlP+F6GgTQZZnRsOz7ERB9k7nxd8o4rA2K2p
	 j0e+0RpvqbHK5mmk+msSNDIq0m0LAKukZXJLpUeI=
Date: Mon, 21 Sep 2026 15:00:45 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Vladimir Murzin <vladimir.murzin@arm.com>, paulmck@kernel.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG/PATCH] drivers/usb/mtu3: Work around mtu3_log_ep
 double-indirection issue
Message-ID: <arE4jcn4dCD9gos_@J2N7QTR9R3.cambridge.arm.com>
References: <a3ee0655-d818-48e0-84d1-475e6c16c991@paulmck-laptop>
 <d7bb2cf4-11c3-468c-8749-99cc408299c7@arm.com>
 <b6c621eb-6d20-4e00-ac05-af122b630ca5@paulmck-laptop>
 <aae79c1c-8738-4b97-b1b9-d82d19d82d49@arm.com>
 <20260909093524.249c2a1a@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909093524.249c2a1a@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_070052_917105_48D41798 
X-CRM114-Status: GOOD (  11.97  )
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

On Wed, Sep 09, 2026 at 09:35:24AM -0400, Steven Rostedt wrote:
> On Wed, 9 Sep 2026 11:31:28 +0100
> Vladimir Murzin <vladimir.murzin@arm.com> wrote:
> 
> > I've done a little bit massaging and here is what worked for me
> > 
> > 
> > diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
> > index 89870175d635..4d4bae25fa1f 100644
> > --- a/drivers/usb/mtu3/mtu3_trace.h
> > +++ b/drivers/usb/mtu3/mtu3_trace.h
> > @@ -224,6 +224,7 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
> >                 __field(unsigned int, flags)
> >                 __field(unsigned int, direction)
> >                 __field(struct mtu3_gpd_ring *, gpd_ring)
> > +               __field(dma_addr_t, gpd_ring_dma)
> >         ),
> >         TP_fast_assign(
> >                 __assign_str(name);
> > @@ -235,12 +236,13 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
> >                 __entry->flags = mep->flags;
> >                 __entry->direction = mep->is_in;
> >                 __entry->gpd_ring = &mep->gpd_ring;
> > +               __entry->gpd_ring_dma = mep->gpd_ring.dma;
> >         ),
> >         TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
> >                 __get_str(name), usb_ep_type_string(__entry->type),
> >                 __entry->maxp, __entry->slot,
> >                 __entry->mult, __entry->maxburst,
> > -               __entry->gpd_ring, &__entry->gpd_ring->dma,
> > +               __entry->gpd_ring, &__entry->gpd_ring_dma,
> >                 __entry->flags & MTU3_EP_ENABLED ? 'E' : 'e',
> >                 __entry->flags & MTU3_EP_STALL ? 'S' : 's',
> >                 __entry->flags & MTU3_EP_WEDGE ? 'W' : 'w',
> 
> LGTM,
> 
> Reviewed-by: Steven Rostedt <rostedt@goodmis.org>

On v7.3-rc4 I still see the splat Paul reported initially, and the above
fixes that, so FWIW:

Tested-by: Mark Rutland <mark.rutland@arm.com>

Steve, I assume you were expecting someone to send the above as a full
patch.

Paul, do you intend to send a v2, or should Vladimir send out his
version as its own patch? I assume you're happy with a Reported-by, if
he does that?

Mark.

