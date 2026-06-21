Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D664DCD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 15:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmM+1wEfF/WAJ5tf+v/LsFKI13F7EOzAierbj0hp3Hk=; b=UQNL+XQBdt+BRMMOXmrcqFJTD2
	Clcsz4E6LiTxqJOpkll95NovyRzhhUR7aB5U+VudtKwfZXhRAXzzRdAAS+xX7ArcZ54MKgCerHUAc
	0ZINatnN3xjgtG2jnGv/ZJ3j2/DxNUiECy0cSaJrpwnOh8n9r4GNecFgSXgQkT+UmG8GRdxIgRbGJ
	RHQTWBk+oECfZ1Q0e9YDeOz3QrbfTe9x2LWHTqWspzz8/spg6/vDrbF/A/cgkr2tPuqt/LnJp46s/
	9d96TMg+5iOwd0aeuO7O+xgbMbbMtQlGKpcHBXRqFVwJrAQHWu3J3WR5Z5VOiUhdjrJE4coFAgVTY
	qpurdoAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbJvr-000000042A4-1pGI;
	Sun, 21 Jun 2026 15:17:59 +0000
Received: from out-188.mta0.migadu.com ([91.218.175.188])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbJvp-00000004299-0KRw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 15:17:58 +0000
Message-ID: <24e2da5b-82a4-4889-8b62-5f445cec9657@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782055072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bmM+1wEfF/WAJ5tf+v/LsFKI13F7EOzAierbj0hp3Hk=;
	b=BZC7j9DITI1xLCVWoBIvCK5EuEZevgBor8K76v2O1UjAq1aRGu5/KRlSk0OUQ4F12k7kBp
	4AeXJCGXazHmZyZymo2XIMm4OplOMWgA4oRdlY+1FclDVgsX70ATiLMZV26qayMTEsOWn5
	EuNeFfloggg6xmFSCDwhNUjrvSJnfc4=
Date: Sun, 21 Jun 2026 23:17:32 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v1] irqchip/gic-v3-its: Fix OF node reference leak
To: Marc Zyngier <maz@kernel.org>
Cc: Yuho Choi <dbgh9129@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260619185808.1090575-1-dbgh9129@gmail.com>
 <877bnt8u5k.wl-maz@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <877bnt8u5k.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_081757_476538_78102882 
X-CRM114-Status: GOOD (  20.52  )
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

On 6/20/26 4:59 PM, Marc Zyngier wrote:
> On Fri, 19 Jun 2026 19:58:08 +0100,
> Yuho Choi <dbgh9129@gmail.com> wrote:
> >
> > of_get_cpu_node() returns a referenced device node. In
> > its_cpu_init_collection(), the node is only used to get the CPU NUMA
> > node for the Cavium 23144 workaround, but the reference is never
> > dropped.
> >
> > Store the NUMA node locally and call of_node_put() before either
> > continuing with collection setup or returning early for a NUMA mismatch.
> >
> > Fixes: 920181ce8469 ("irqchip/gic-v3-its: Add ability to resend MAPC on resume")

It looks to me that this issue was introduced in fbf8f40e1658
("irqchip/gicv3-its: numa: Enable workaround for Cavium thunderx erratum
23144"). What am I missing?

> > Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> > ---
> >  drivers/irqchip/irq-gic-v3-its.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> > index b57d81ad33a0..f82035eb77e5 100644
> > --- a/drivers/irqchip/irq-gic-v3-its.c
> > +++ b/drivers/irqchip/irq-gic-v3-its.c
> > @@ -3291,10 +3291,14 @@ static void its_cpu_init_collection(struct its_node *its)
> >  	/* avoid cross node collections and its mapping */
> >  	if (its->flags & ITS_FLAGS_WORKAROUND_CAVIUM_23144) {
> >  		struct device_node *cpu_node;
> > +		int cpu_nid;
> >  
> >  		cpu_node = of_get_cpu_node(cpu, NULL);
> > +		cpu_nid = of_node_to_nid(cpu_node);
> > +		of_node_put(cpu_node);
> > +
> >  		if (its->numa_node != NUMA_NO_NODE &&
> > -			its->numa_node != of_node_to_nid(cpu_node))
> > +		    its->numa_node != cpu_nid)
> >  			return;
> >  	}
> >
> 
> Please consider using the cleanup infrastructure instead, something
> like the untested hack below.
> 
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index 291d7668cc8da..947a15bb42012 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -3290,11 +3290,10 @@ static void its_cpu_init_collection(struct its_node *its)
>  
>  	/* avoid cross node collections and its mapping */
>  	if (its->flags & ITS_FLAGS_WORKAROUND_CAVIUM_23144) {
> -		struct device_node *cpu_node;
> +		struct device_node *cpu_node __free(device_node) = of_get_cpu_node(cpu, NULL);
>  
> -		cpu_node = of_get_cpu_node(cpu, NULL);
>  		if (its->numa_node != NUMA_NO_NODE &&
> -			its->numa_node != of_node_to_nid(cpu_node))
> +		    its->numa_node != of_node_to_nid(cpu_node))
>  			return;
>  	}
>  

Reviewed-by: Zenghui Yu <zenghui.yu@linux.dev>

Thanks,
Zenghui

