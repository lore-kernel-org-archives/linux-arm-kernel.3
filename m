Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79473C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ggOQs90efSn462XtyiL/osgnkDwSr26I6y3yG1sBZc=; b=HpIyoaN7flpH3qEabreHB31Yry
	Mj+isHPTQBcfz+3W7htgdP3bDEEWpHp9fR/F6fpyUaHxDKqHoSH+q/AsViin9wFh4QZo6rnrAk+jG
	03TUCviVHoCa1eUz/ipAh9HIpbsu2hLvfyR4gGQDiBqk7RBmP3UO83xCacANpRc8HnXofTVwjRo8I
	87tDDuLpIvGDtNROj6StPd0MEiWhGY9GwdW+my5WIlHYpS4DzTo8gFamCiuPYNIJfR5NWfzgHe1al
	HoPBvf6SJbDqg5GdXGmwq7SFekfFqwyyY4fGALqihZToCuZCuT6DKObxBUR56/TN5wvTe/5k7nvO7
	HrwoJKCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IRL-0000000BoaV-49tX;
	Wed, 09 Sep 2026 13:34:16 +0000
Received: from smtprelay0015.hostedemail.com ([216.40.44.15] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IRJ-0000000BoZY-1nGZ;
	Wed, 09 Sep 2026 13:34:14 +0000
Received: from omf01.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 2B0D1140202;
	Wed,  9 Sep 2026 13:34:10 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf01.hostedemail.com (Postfix) with ESMTPA id 225736000C;
	Wed,  9 Sep 2026 13:34:08 +0000 (UTC)
Date: Wed, 9 Sep 2026 09:35:24 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: paulmck@kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [BUG/PATCH] drivers/usb/mtu3: Work around mtu3_log_ep
 double-indirection issue
Message-ID: <20260909093524.249c2a1a@gandalf.local.home>
In-Reply-To: <aae79c1c-8738-4b97-b1b9-d82d19d82d49@arm.com>
References: <a3ee0655-d818-48e0-84d1-475e6c16c991@paulmck-laptop>
	<d7bb2cf4-11c3-468c-8749-99cc408299c7@arm.com>
	<b6c621eb-6d20-4e00-ac05-af122b630ca5@paulmck-laptop>
	<aae79c1c-8738-4b97-b1b9-d82d19d82d49@arm.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: rnd4j1prtbzncwyiixer7thtxi9wiujf
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 225736000C
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18VMknN6uc21btZSgsWKOeAnPYKLCAHB7U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=5ggOQs90efSn462XtyiL/osgnkDwSr26I6y3yG1sBZc=; b=WqDZFr9uO+FnJAh9UealHRgeOBXoVVGPts3E4Kmc20vBD42tWF8vkeIonqGDVQm2bjGi/ksHra6VtC2xqdX7P1KqQy0CiI5gu9k0xxWqbuKrIwV/PyrC5rYBwlzAndqHQx28uX0T34luf/QBE0cwRBdUBLlrZKdWw4IglJhePvM=
X-HE-Tag: 1788960848-985795
X-HE-Meta: U2FsdGVkX1+Jcl39xj4Cy7PAKTWsN5gXEKO2psDx7x6EuRK+7AcdjaASvffsrCa3fGC2f8QJVigCvVcwZuBxyQBJij821bINXbUYpgu/4DZgryJIYJX58eoi5y+kyanDheWAJvT32HkW2TPqI2uwwzlVZVSbb+qAHf7BRqAuqgHd6vfJYjyh1OW1Z4yN5ofAOg+L2EKa4LCI6/FMQIkZmho+45mPZKDRRcoi596Pl1/hVFWGXgZjoBC6y7fpP8NWE8eZn7cJF1tyRGGzvmIQ4iRrurIsceps9nPbboCATMd8JP5c9bAorHWPNwjtwKeyBCR0q3pOaZrmz/cAZd+eNcraaV1x3dei7sCmEafG7GtCEOzFexrqX19OPksh36p6pRjDLUMnU3/+GVnxAYgHLWefwhzphbdjebWBvsJPNUSL53H9em0ZNw9T94o+c8qi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_063413_537934_2BE4DC4A 
X-CRM114-Status: GOOD (  11.14  )
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

On Wed, 9 Sep 2026 11:31:28 +0100
Vladimir Murzin <vladimir.murzin@arm.com> wrote:

> I've done a little bit massaging and here is what worked for me
> 
> 
> diff --git a/drivers/usb/mtu3/mtu3_trace.h b/drivers/usb/mtu3/mtu3_trace.h
> index 89870175d635..4d4bae25fa1f 100644
> --- a/drivers/usb/mtu3/mtu3_trace.h
> +++ b/drivers/usb/mtu3/mtu3_trace.h
> @@ -224,6 +224,7 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
>                 __field(unsigned int, flags)
>                 __field(unsigned int, direction)
>                 __field(struct mtu3_gpd_ring *, gpd_ring)
> +               __field(dma_addr_t, gpd_ring_dma)
>         ),
>         TP_fast_assign(
>                 __assign_str(name);
> @@ -235,12 +236,13 @@ DECLARE_EVENT_CLASS(mtu3_log_ep,
>                 __entry->flags = mep->flags;
>                 __entry->direction = mep->is_in;
>                 __entry->gpd_ring = &mep->gpd_ring;
> +               __entry->gpd_ring_dma = mep->gpd_ring.dma;
>         ),
>         TP_printk("%s: type %s maxp %d slot %d mult %d burst %d ring %p/%pad flags %c:%c%c%c:%c",
>                 __get_str(name), usb_ep_type_string(__entry->type),
>                 __entry->maxp, __entry->slot,
>                 __entry->mult, __entry->maxburst,
> -               __entry->gpd_ring, &__entry->gpd_ring->dma,
> +               __entry->gpd_ring, &__entry->gpd_ring_dma,
>                 __entry->flags & MTU3_EP_ENABLED ? 'E' : 'e',
>                 __entry->flags & MTU3_EP_STALL ? 'S' : 's',
>                 __entry->flags & MTU3_EP_WEDGE ? 'W' : 'w',

LGTM,

Reviewed-by: Steven Rostedt <rostedt@goodmis.org>

-- Steve

