Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFA8C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lat+kLIoSC3PF+K12F2gYq7T2bw5eZWy3BBymoZ7v6Q=; b=zNzgHUdKxvNck4Fgi++mNulyNB
	xPNF54R7wbScu72YWUHRKUuwM0EXRlOt9JYSYcbteAUlFrmLdc9GZ1N+KW4R2sWoWHKF82XNugoY0
	Efy9usu9nSAtOJWgbZRcMB7VDRgjRQZvenkPxys8xVOuS7n6rrlkZRR5FnpUbTgZlhVbsn5hGZWpq
	G4ftJ2gtI/wF29tWLlBjQzXivVmZP7N6iitFJZ/1oxR0IRRTxw7DFa5Wa5FwnVqnJ12bAtiQ/sF7F
	bFO7G3UZPouEHT+h2oVi4l0/aax028KNMw3QbqIfn8Tabl285BBuKDEHUHRSO2pCV7lyHYtAunGRL
	qKbCdBkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IQK-0000000BoQj-2hAd;
	Wed, 09 Sep 2026 13:33:12 +0000
Received: from smtprelay0015.hostedemail.com ([216.40.44.15] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IQH-0000000BoQ6-1fcV;
	Wed, 09 Sep 2026 13:33:10 +0000
Received: from omf15.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 3A8951401D7;
	Wed,  9 Sep 2026 13:33:03 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf15.hostedemail.com (Postfix) with ESMTPA id 416CB17;
	Wed,  9 Sep 2026 13:33:01 +0000 (UTC)
Date: Wed, 9 Sep 2026 09:34:17 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [BUG/PATCH] drivers/usb/mtu3: Work around mtu3_log_ep
 double-indirection issue
Message-ID: <20260909093417.4880999e@gandalf.local.home>
In-Reply-To: <b6c621eb-6d20-4e00-ac05-af122b630ca5@paulmck-laptop>
References: <a3ee0655-d818-48e0-84d1-475e6c16c991@paulmck-laptop>
	<d7bb2cf4-11c3-468c-8749-99cc408299c7@arm.com>
	<b6c621eb-6d20-4e00-ac05-af122b630ca5@paulmck-laptop>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 416CB17
X-Stat-Signature: ucw1wfijz1nyu7w3kdiubbb4pkxth68c
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19a3meWRnz42A6ERwxaHbVQ+a4s7tr1NQo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=Lat+kLIoSC3PF+K12F2gYq7T2bw5eZWy3BBymoZ7v6Q=; b=nBKNU3ziaeHVl/53ridU2Pt8tb3C707obqZqeVDCZdZVt4k+nPpWiyTlLgR30ehkcZIz6S56b8RI1xscglemO2dgZC/ggqZguNYfWI/G6bNLUguluXR7YvxiRWisrWpcajkn0d/pVTspeVoQKdk2ti7I73DsZ6DqqvAqRdB99Ug=
X-HE-Tag: 1788960781-683136
X-HE-Meta: U2FsdGVkX1/qTTl/bHqRqkmbLb44FYq4tDTYnMJRiEpawvBcvaU2GcA2veKGHVK5HEpsXJZqeqcdk+SUQILB1mOsh1rhfokpE3FKPLzeQnStq8L0mo9f1zsaSYexb2G21IFz76PBv2sYJmFxqhQERtK1cgaMrNE6qpCpqq1NbhdgL7Oqy7tAf5VVEtFrsNA3DAbeRN3QRI8cxSZtEXM9LwqJbaEpeqFBqzaTri8hdrjogpT1YYVKYI7MjFVbZSKwusoSxit4iqhNpW2Z6C+wx9UR6CS2owmnUCZdV3q+fCpR8F9/VasHLTO5j6uKcKN3HcKCboP1+Ft/AQILDBZzX3I65JZfU3e5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_063309_613328_A9D058F0 
X-CRM114-Status: GOOD (  19.48  )
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

On Tue, 8 Sep 2026 11:08:33 -0700
"Paul E. McKenney" <paulmck@kernel.org> wrote:

> > > Apparently, the code should instead create another entry in
> > > TP_STRUCT__entry(), and do the double-indirection TP_fast_assign() instead
> > > of TP_printk().  But simply removing the offending double indirection
> > > in TP_printk() gets this splat out of the way of other debugging.  
> > 
> > Indeed, splat has gone after applying the patch.
> > 
> > Thanks
> > Vladimir  
> 
> Does this less hacky patch do the trick?

Nope!


> diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
> index 89870175d63561..6477ad3ddc66f6 100644
> --- a/drivers/usb/mtu3/mtu3_trace.h
> +++ b/drivers/usb/mtu3/mtu3_trace.h
> @@ -224,6 +224,7 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
>  		__field(unsigned int, flags)
>  		__field(unsigned int, direction)
>  		__field(struct mtu3_gpd_ring *, gpd_ring)
> +		__field(dma_addr_t *, gpd_ring_dma)
>  	),
>  	TP_fast_assign(
>  		__assign_str(name);
> @@ -235,12 +236,13 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
>  		__entry->flags = mep->flags;
>  		__entry->direction = mep->is_in;
>  		__entry->gpd_ring = &mep->gpd_ring;
> +		__entry->gpd_ring_dma = &mep->gpd_ring->dma;

You are still saving the address of some memory into the ring buffer.


>  	),
>  	TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
                                                                        ^^^^

That %pad dereferences the pointer passed to it.

>  		__get_str(name), usb_ep_type_string(__entry->type),
>  		__entry->maxp, __entry->slot,
>  		__entry->mult, __entry->maxburst,
> -		__entry->gpd_ring, &__entry->gpd_ring->dma,
> +		__entry->gpd_ring, __entry->gpd_ring_dma,

That will read the address saved in the ring buffer and dereference it.

Remember, the above TP_fast_assign() logic gets executed when the
tracepoint is triggered. The TP_printk() is executed when the user reads
the trace buffer. That could be seconds, minutes, hours, days, even months
later!

You can't trust that the memory you are dereferencing will not be freed
when the user reads the trace.

The original patch is not hacky. It is actually the correct way of handling
this.

-- Steve


>  		__entry->flags & MTU3_EP_ENABLED ? 'E' : 'e',
>  		__entry->flags & MTU3_EP_STALL ? 'S' : 's',
>  		__entry->flags & MTU3_EP_WEDGE ? 'W' : 'w',


