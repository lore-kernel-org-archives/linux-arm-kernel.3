Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68697C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 11:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayZP9QRUH0BbT4A82JiIxQYd4I9xdr4XTzPAhPcERPQ=; b=i6T6sxIx0Iut3Vak9gNWoKsJpX
	qBe/yLMUlnT/7/9ak7SF1oBA9jv1zfy9w2FpGUTI4gcoHJBAEkCN98jFYCJbBsESKCO/TUnLj5w7b
	P+dpjNh5X2vkaU3Plrlxu9zQo02OX7Tfc1vtn+xzrD65FRbbexSytlYuQlgRvlKxN8ws6Wt+Hry4N
	p4ss0nn1iRXaDs30BI+9nONltCWD7KpX85S0MtTQy/FsI2XRuyTsGAWBrJlio+ZvFFYf+dGYRtiqx
	oNfjVWp5F6Wve0rzyp2LDHxkyK8UP5YFFjMMbMZGvAQBBNi56PXS5SypIVq17zQydqPQWOB9rMwL5
	HfbIPPeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udory-0000000H7zO-1o85;
	Mon, 21 Jul 2025 11:39:46 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udnk2-0000000GxXe-3HCn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 10:27:32 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4blxPZ3zbdz6L5RM;
	Mon, 21 Jul 2025 18:25:54 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id E4CE3140417;
	Mon, 21 Jul 2025 18:27:20 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 21 Jul
 2025 12:27:20 +0200
Date: Mon, 21 Jul 2025 11:27:18 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Marc Zyngier <maz@kernel.org>
CC: jackysliu <1972843537@qq.com>, <tglx@linutronix.de>,
	<herve.codina@bootlin.com>, <antonio.borneo@foss.st.com>,
	<anup@brainfault.org>, <jirislaby@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] irqchip/gic-v3: fix resource leak in
 partition_domain_translate()
Message-ID: <20250721112718.00002e23@huawei.com>
In-Reply-To: <86qzya7xwu.wl-maz@kernel.org>
References: <tencent_72EDAD7F6E52D8FB5933030A569A08AEC406@qq.com>
	<86qzya7xwu.wl-maz@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_032731_117799_C157F742 
X-CRM114-Status: GOOD (  25.83  )
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

On Mon, 21 Jul 2025 09:25:53 +0100
Marc Zyngier <maz@kernel.org> wrote:

> On Mon, 21 Jul 2025 08:28:04 +0100,
> jackysliu <1972843537@qq.com> wrote:
> > 
> > There is a device node reference leak in partition_domain_translate().
> > After the function obtains the device node np via of_find_node_by_phandle,
> > it does not call of_node_put(np) to release the node reference
> > in both the error path and the normal return path.
> > This causes the node reference count to increase each time
> > the function is called, causing a resource leak.
> >
> > This issue was detected by rule based static tools
> > developed by Tencent.
> > 
> > Fixes: 87228532e7e9 ("irqchip: Switch to of_fwnode_handle()")
> > 
> > Signed-off-by: jackysliu <1972843537@qq.com>  
> 
> Drop the spurious blank line.
> 
> > ---
> >  drivers/irqchip/irq-gic-v3.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> > index efc791c43d44..61c1d404b726 100644
> > --- a/drivers/irqchip/irq-gic-v3.c
> > +++ b/drivers/irqchip/irq-gic-v3.c
> > @@ -1821,12 +1821,16 @@ static int partition_domain_translate(struct irq_domain *d,
> >  		return -EINVAL;
> >  
> >  	ret = gic_irq_domain_translate(d, fwspec, &ppi_intid, type);
> > -	if (WARN_ON_ONCE(ret))
> > +	if (WARN_ON_ONCE(ret)) {
> > +		of_node_put(np);
> >  		return 0;
> > +	}
> >  
> >  	ppi_idx = __gic_get_ppi_index(ppi_intid);
> >  	ret = partition_translate_id(gic_data.ppi_descs[ppi_idx],
> >  				     of_fwnode_handle(np));
> > +	of_node_put(np);
> > +
> >  	if (ret < 0)
> >  		return ret;
> >    
> 
> Frankly, this looks awful, and we have much better ways to solve this
> whole class of problems. Why can't the (untested) patch below do the
> right thing, without the ugliness?
> 
> 	M.
> 
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index efc791c43d441..c4839032ce8d0 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -1808,8 +1808,8 @@ static int partition_domain_translate(struct irq_domain *d,
>  				      unsigned long *hwirq,
>  				      unsigned int *type)
>  {
> +	struct device_node *np __free(device_node) = NULL;

Linus has expressed fairly strongly that he really doesn't like separation
of the constructor and destructor.  See guidance in cleanup.h which was
based on that and bunch of other early discussion around this stuff.

Here it's easy to solve though. Just move that declaration down to
give something like:


>  	unsigned long ppi_intid;
> -	struct device_node *np;
>  	unsigned int ppi_idx;
>  	int ret;
>  
	if (!gic_data.ppi_descs)
		return -ENOMEM;

	struct device_node *np __free(device_node) =
		of_find_node_by_phandle(fwspec->param[3]);


	if (WARN_ON(!np))
		return -EINVAL;


