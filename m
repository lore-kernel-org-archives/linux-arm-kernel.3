Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63545C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 08:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ShsBHu3y3fePWA2u7sofKwbce4P7U45++sbZsX5t9Os=; b=gd17mtLZ+xivFHHGbqgim4a0Lj
	lpFcdpTF2yxMXuxjXADBTwMS/+ASAYXxhXEvSBV2w09+iVfpkei0xEX3RZr1My8n9rWvaHjoh6+XG
	zoBBNNb4XBmnxRAMYa4LViMLmOga6RKZM56i8zfG404/HcEGBOR+sOKR2Fvi1nNP1qcytpBtutchr
	0tsxRvg0hOifzH5/p0m5sne7XdadR/5ZKa+rMEpCkLu0ewtpsMozv+1lRJ0bRVPgD5TFrB2yiFQB4
	DJK+AIRd0gKDjJ+e8nAJn7+SaPzUrzGm6+cUYjK8m2m7jAQZdDzpdrruwNcZVMqsnkKUdiXabgbU8
	QeH4nqSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwxxu-0000000B8Ua-2IHu;
	Thu, 20 Aug 2026 08:17:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwxxs-0000000B8UQ-2utW;
	Thu, 20 Aug 2026 08:17:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EE814040C;
	Thu, 20 Aug 2026 08:17:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B3DE1F000E9;
	Thu, 20 Aug 2026 08:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787213851;
	bh=ShsBHu3y3fePWA2u7sofKwbce4P7U45++sbZsX5t9Os=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=DphvUniHM+kBXocq1JZUcDlHXY71gHyjzznfhDx0zOCa4QXggscVofPdWRp0t0yvd
	 dcl7zNH3MizS1zeblwsCa3JB8QYGIiiwQHJIBYg1b8J3W8cdH3G/2BNsOQZ6m4KJBX
	 zzVB3Mk9/wozGsxH3HmW5f/NyGaGiYl7QtDGH3DY8fV3jFIBmBx3qcMhoFGXWbww7P
	 QKRKgeEuVX8zHm5/YM3GMYFL9QZKJL2QVe3wrlqJKvy4yXioQoorq+N8pOr3x7iwIS
	 TWsrwZT7HEqilA8hN0Ph2ywY/P9RbpQYrDTa1sciMtmODaiD+fkj6LvuaCiMwhn5Qk
	 nNUan1jnAwVTA==
From: Thomas Gleixner <tglx@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Mark-PK Tsai
 <mark-pk.tsai@mediatek.com>
Cc: Daniel Palmer <daniel@thingy.jp>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] irqchip/mst-intc: reject ranges beyond saved state
 capacity
In-Reply-To: <20260722041443.10020-1-pengpeng@iscas.ac.cn>
References: <20260722041443.10020-1-pengpeng@iscas.ac.cn>
Date: Thu, 20 Aug 2026 10:17:28 +0200
Message-ID: <87qzjti4tj.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, Jul 22 2026 at 12:14, Pengpeng Hou wrote:
> The inclusive Device Tree IRQ range determines nr_irqs. Suspend and
> resume then use nr_irqs to walk the fixed saved_status array, which has
> MST_INTC_MAX_IRQS entries. A descending range underflows the unsigned
> subtraction, while a range wider than 64 entries exceeds that array.

TBH, this is confusing at best. The problem is not the suspend/resume
implication. The problem is that there is no validation of start/end to
begin with. Whether that causes an out of bounds access somewhere down
the road is immaterial. 

> Reject both forms before deriving nr_irqs.

Both forms of what?

Something like this:

  The interrupt range for the driver is retrieved from the device tree,
  but lacks any form of validation.

  As a consequence a malformed device tree can result in out of bound
  accesses when the range exceeds MST_INTC_MAX_IRQS.

  Add the missing sanity checks.

> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Lacks a "Fixes:" tag.

> ---
>  drivers/irqchip/irq-mst-intc.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/irqchip/irq-mst-intc.c b/drivers/irqchip/irq-mst-intc.c
> index b5335f6fd6d6..1475335d668d 100644
> --- a/drivers/irqchip/irq-mst-intc.c
> +++ b/drivers/irqchip/irq-mst-intc.c
> @@ -263,6 +263,10 @@ static int __init mst_intc_of_init(struct device_node *dn,
>  	    of_property_read_u32_index(dn, "mstar,irqs-map-range", 1, &irq_end))
>  		return -EINVAL;
>  
> +	if (irq_end < irq_start ||
> +	    irq_end - irq_start >= MST_INTC_MAX_IRQS)

No line break required.

> +		return -EINVAL;
> +
>  	cd = kzalloc_obj(*cd);
>  	if (!cd)
>  		return -ENOMEM;

