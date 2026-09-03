Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742E4C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 14:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yishPGcJ2aBgX8f7/aGf43YSeYKU1vTSOdEz/UOhz0Q=; b=I3bnL6t7mOZ4msgt1jtxrtcy7f
	3rwWjyLQwroxTCT0F7+JENVQ98MAX5CO262QvKJ1pzZnS+KWZI3JPqxbkEd5VxgmoZf87QTrg+q28
	RROt0i3oaEshp3kakkMxJ3dxkFm5afzL+d6ulrGYu59rM17vvRbovH4yblBdReVXyCLz+6VltNOTb
	msAYSWvHA+/N/g8NKsORhdPYCoa2V4U2WGMtXVIEJVtH5Pkf0OHzVnz7bhQ7vD5ehFto0vosQY3/L
	maHL80XOPaaig6Jp949RJsPjpWYQZosAfV3LK8NEyPSQ/JIDi2YEVEM6Vyv6JcOfJAyp6/+4jCVpT
	QSs3jGuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28JY-0000000HV8N-0mYZ;
	Thu, 03 Sep 2026 14:21:16 +0000
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28JU-0000000HV7V-1FPj;
	Thu, 03 Sep 2026 14:21:14 +0000
Received: from omf05.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 0EA638028D;
	Thu,  3 Sep 2026 14:21:08 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf05.hostedemail.com (Postfix) with ESMTPA id 1F52B20010;
	Thu,  3 Sep 2026 14:21:06 +0000 (UTC)
Date: Thu, 3 Sep 2026 10:22:09 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Chunfeng
 Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] USB: mtu3: tracing: fix pointers dereferencing
Message-ID: <20260903102209.7aa79164@gandalf.local.home>
In-Reply-To: <20260804100531.88576-1-m.szyprowski@samsung.com>
References: <CGME20260804100540eucas1p24c59c891e91eeeeea8032d1c80312ea3@eucas1p2.samsung.com>
	<20260804100531.88576-1-m.szyprowski@samsung.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1F52B20010
X-Stat-Signature: bbffphg7oxa6e7rpsgix55ra4nbtu7w1
X-Rspamd-Server: rspamout07
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/iTf2W3ORymql+pkUYrTwc+8yFoyHdvsA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=yishPGcJ2aBgX8f7/aGf43YSeYKU1vTSOdEz/UOhz0Q=; b=OeTVx8p2lxSQogYJ26E1ZhG3n3KKks5OHbZci2y9SKKWyKD0Rrldj5ZjxLjBpvlDgdpkm5WgLfgbRKajQHCn2eD55bDuEuD4vBO8hpYWi3QdZYLkGtNvz509LeLzEkfa+1qCbnN5wnYFCPj56e/Oqa2C65ipdz0ZqHjz3atyD60=
X-HE-Tag: 1788445266-583183
X-HE-Meta: U2FsdGVkX19X7ugC+vbhQ7lmiL4dr1fOYRS9OljPxV5GOhRyMDiZnXFW++NBw5Xkzwgds5f0z5EsyCnNZw8p/UQpt8MK3ohX44nVVlpxESuwo2n6R7Fgm/2eWaSnr5LaeeW5H62kssDdqx/CngttlxmQiA+OszTXiz8C3KLm830NrLGUsrzz6x/lhTlxQelVPtn5U5OM/0SsHPk/JgA93j84x8gXz7D1aHVfOw91L2ostFcRYo3YllfTi9E8odywsm12vTfc5sjM+gXBJ98r4n6PbSsH4uU52wmAIMpo7PcpVh6V1YOjsJ9xHsyola0bEuLv9WGO65W8TKj++sINsyXY6Z3CnGmfY6irKnL0jdnhD1SZD0sSfSX3/ryfM7N9WQenyaqo4uEcsuyuvDlQ2Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_072112_512996_E7442812 
X-CRM114-Status: GOOD (  17.06  )
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

On Tue,  4 Aug 2026 12:05:30 +0200
Marek Szyprowski <m.szyprowski@samsung.com> wrote:

> Commit b5cc230af5e5 ("tracing: Warn when an event dereferences a pointer
> in TP_printk()") added a warning then printing an event dereferences

            s/then/when/

> a pointer, because it might be already freed that time.

                                        freed at that time

> 
> MTU3 driver is one of the drivers triggering this warning. Fix it by
> storing also the DMA address in the event structure to avoid

        s/also//

> dereferencing gpd_ring pointer during event printing.
> 
> Fixes: 83374e035b62 ("usb: mtu3: add tracepoints to help debug")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/usb/mtu3/mtu3_trace.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
> index 89870175d635..b24c6411a8cf 100644
> --- a/drivers/usb/mtu3/mtu3_trace.h
> +++ b/drivers/usb/mtu3/mtu3_trace.h
> @@ -224,6 +224,7 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
>  		__field(unsigned int, flags)
>  		__field(unsigned int, direction)
>  		__field(struct mtu3_gpd_ring *, gpd_ring)
> +		__field(dma_addr_t, gpd_ring_dma)
>  	),
>  	TP_fast_assign(
>  		__assign_str(name);
> @@ -235,12 +236,13 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
>  		__entry->flags = mep->flags;
>  		__entry->direction = mep->is_in;
>  		__entry->gpd_ring = &mep->gpd_ring;
> +		__entry->gpd_ring_dma = __entry->gpd_ring->dma;
>  	),
>  	TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
>  		__get_str(name), usb_ep_type_string(__entry->type),
>  		__entry->maxp, __entry->slot,
>  		__entry->mult, __entry->maxburst,
> -		__entry->gpd_ring, &__entry->gpd_ring->dma,
> +		__entry->gpd_ring, &__entry->gpd_ring_dma,
>  		__entry->flags & MTU3_EP_ENABLED ? 'E' : 'e',
>  		__entry->flags & MTU3_EP_STALL ? 'S' : 's',
>  		__entry->flags & MTU3_EP_WEDGE ? 'W' : 'w',

Reviewed-by: Steven Rostedt <rostedt@goodmis.org>

Thanks for fixing this!

-- Steve

