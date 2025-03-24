Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356B8C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 14:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNLgmjKkF9HdKsSTg4UhoAV7KOdbPAwtKyrL4TyYQNU=; b=ZQQ44O3urVBT2LOuFPiZZ47uHt
	OLO0Yk5ycxLUGpnDqZ7BxPzaPavLpv7jIGxC6mFkJ628xz023k+jYuWHZgdexGF5XO7KNq6d/0w/L
	/zfS7XzrBiN2JIFipIY6Nk0637dOBclW0O8swc7IhDwwWGTZZQAzNh6O9pwF1OVoJUP6ClrvZvcXi
	sZaVSWU6WyoaV36CFXWyp/8zLrckcjjB8l2yw8JRL4ZhBpobx0vWOT9mciA4x15J9JVjjkeFZXxA+
	TrRhf8CW4utrZrIU0wEu1pDThTlg55C2nxqzjPo+2Lr1yXnM0qLvAwr5F+vWRsGoQ2G5qvPz4rUa9
	zMwvgMzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twisZ-00000003PCp-17MG;
	Mon, 24 Mar 2025 14:34:15 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twiqr-00000003Ow5-1g5j;
	Mon, 24 Mar 2025 14:32:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1742826729; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UJb3QO0wV1A9dmMtS84pAwAZqrpokweiVYDHHn07fPiTRvYM3g+LA8+RzY+iyS9BhyQCAD8NOnLGn5d90LvyCdsNfVJLSY8WN7cXP5pPHysf5d0GkaukCJCCGXKVvTM3LCruh1HdfMzJqWSTn4bqdNT6e+yhaQ2tJQ5M0P9vz7k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1742826729; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SNLgmjKkF9HdKsSTg4UhoAV7KOdbPAwtKyrL4TyYQNU=; 
	b=I5dKCBthi0uH1GkTYNNdR0Kz1fkio5/RR5VHyZrOobM/fBay0vxFi+DLmqRhPsWluI3ttfk2I+Nda5lLwqALM+z4x/JuO/3G/GgLminwylSDlGyALSw24KjlFAadWlh3CoBhQG/tzFaR4P+XmVLKNdAitZUAke9CPQJvAwxW8GM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742826728;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=SNLgmjKkF9HdKsSTg4UhoAV7KOdbPAwtKyrL4TyYQNU=;
	b=YsxM+OXMxuHWGZRdECmjH4xKssGqHdS9tc5IQ4KDk73mgQgDPXAfY2zX9Va7TORR
	UPZNoH1Wqd5DcP27VZNRbBXCrdBAolZpzZ3l/1GKi2KwiKaLbdnLk7Z3jNrO3yG6XaV
	y103yCcBlFgJJumfr+wsgBVQ/MtX+wI5c+Rgk5eQ=
Received: by mx.zohomail.com with SMTPS id 1742826726754801.1556988716859;
	Mon, 24 Mar 2025 07:32:06 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH] iommu/rockchip: Add flush_iotlb_all ops
Date: Mon, 24 Mar 2025 10:32:04 -0400
Message-ID: <5003710.31r3eYUQgx@trenzalore>
In-Reply-To: <9bd56bd6-ce7d-495f-9bb3-ce7f07975f62@arm.com>
References: <20250318152049.14781-1-detlev.casanova@collabora.com>
 <9bd56bd6-ce7d-495f-9bb3-ce7f07975f62@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_073229_515788_518D43EC 
X-CRM114-Status: GOOD (  35.90  )
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

Hi Robin,
On Tuesday, 18 March 2025 14:40:20 EDT Robin Murphy wrote:
> On 18/03/2025 3:20 pm, Detlev Casanova wrote:
> > From: Jonas Karlman <jonas@kwiboo.se>
> > 
> > On some Rockchip cores (like the vdpu34x video decoder), the IOMMU device
> > is inside the the device that uses it.
> > 
> > The IOMMU device can still be driven by the iommu driver, but when an
> > error occurs in the main device (e.g. a decoding error that resets the
> > decoder), the IOMMU device will also be reseted.
> > In such situation, the IOMMU driver and the hardware are out of sync and
> > IOMMU errors will start popping up.
> > 
> > To avoid that, add a flush_iotlb_all function that will let the main
> > drivers (e.g. rkvdec) tell the IOMMU driver to write all its cached
> > mappings into the IOMMU hardware when such an error occured.
> 
> Eww, this is the exact opposite of what flush_iotlb_all represents, and
> I really don't like the idea of the public IOMMU API being abused for
> inter-driver communication.

I see, so "Synchronously flush all hardware TLBs for this domain" means that it 
is supposed to clear everything that is set in hardware then, right ?

> Please have some kind of proper reset
> notifier mechanism - in fact with runtime PM could you not already
> invoke a suspend/resume cycle via the device links? AFAICS it would also
> work to attach to a different domain then switch back again. Or at worst
> just export a public interface for the other driver to invoke
> rk_iommu_resume() directly.

Thank you for the suggestions. PM runtime is a bit overkill as it can also 
manage power and clocks related to the iommu but also other devices in the 
tree.

I went with an "empty domain" and switching between them works as expected.

> Just don't hide it in something completely
> inappropriate - I mean, consider if someone wants to implement
> IOMMU_CAP_DEFERRED_FLUSH support here in future...

I don't know what that does exactly. As I don't have enough of the picture on 
IOMMU drivers, I'm glad we could find a solution that doesn't change anything 
in the IOMMU tree :)

Regards,
Detlev

> 
> > Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > ---
> > 
> >   drivers/iommu/rockchip-iommu.c | 45 ++++++++++++++++++++++++++++++----
> >   1 file changed, 40 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/iommu/rockchip-iommu.c
> > b/drivers/iommu/rockchip-iommu.c index 323cc665c357..7086716cb8fc 100644
> > --- a/drivers/iommu/rockchip-iommu.c
> > +++ b/drivers/iommu/rockchip-iommu.c
> > @@ -899,6 +899,40 @@ static size_t rk_iommu_unmap(struct iommu_domain
> > *domain, unsigned long _iova,> 
> >   	return unmap_size;
> >   
> >   }
> > 
> > +static void rk_iommu_flush_iotlb_all(struct iommu_domain *domain)
> > +{
> > +	struct rk_iommu_domain *rk_domain = to_rk_domain(domain);
> > +	struct list_head *pos;
> > +	unsigned long flags;
> > +	int i, ret;
> > +
> > +	spin_lock_irqsave(&rk_domain->iommus_lock, flags);
> > +	list_for_each(pos, &rk_domain->iommus) {
> > +		struct rk_iommu *iommu = list_entry(pos, struct 
rk_iommu, node);
> > +
> > +		ret = pm_runtime_get_if_in_use(iommu->dev);
> > +		if (!ret || WARN_ON_ONCE(ret < 0))
> > +			continue;
> > +
> > +		if (WARN_ON(clk_bulk_enable(iommu->num_clocks, iommu-
>clocks)))
> > +			continue;
> > +
> > +		rk_iommu_enable_stall(iommu);
> > +		for (i = 0; i < iommu->num_mmu; i++) {
> > +			rk_iommu_write(iommu->bases[i], 
RK_MMU_DTE_ADDR,
> > +				rk_ops->mk_dtentries(rk_domain-
>dt_dma));
> > +			rk_iommu_base_command(iommu->bases[i], 
RK_MMU_CMD_ZAP_CACHE);
> > +			rk_iommu_write(iommu->bases[i], 
RK_MMU_INT_MASK, RK_MMU_IRQ_MASK);
> > +		}
> > +		rk_iommu_enable_paging(iommu);
> > +		rk_iommu_disable_stall(iommu);
> > +
> > +		clk_bulk_disable(iommu->num_clocks, iommu->clocks);
> > +		pm_runtime_put(iommu->dev);
> > +	}
> > +	spin_unlock_irqrestore(&rk_domain->iommus_lock, flags);
> > +}
> > +
> > 
> >   static struct rk_iommu *rk_iommu_from_dev(struct device *dev)
> >   {
> >   
> >   	struct rk_iommudata *data = dev_iommu_priv_get(dev);
> > 
> > @@ -1172,11 +1206,12 @@ static const struct iommu_ops rk_iommu_ops = {
> > 
> >   	.pgsize_bitmap = RK_IOMMU_PGSIZE_BITMAP,
> >   	.of_xlate = rk_iommu_of_xlate,
> >   	.default_domain_ops = &(const struct iommu_domain_ops) {
> > 
> > -		.attach_dev	= rk_iommu_attach_device,
> > -		.map_pages	= rk_iommu_map,
> > -		.unmap_pages	= rk_iommu_unmap,
> > -		.iova_to_phys	= rk_iommu_iova_to_phys,
> > -		.free		= rk_iommu_domain_free,
> > +		.attach_dev		= rk_iommu_attach_device,
> > +		.map_pages		= rk_iommu_map,
> > +		.unmap_pages		= rk_iommu_unmap,
> > +		.flush_iotlb_all	= rk_iommu_flush_iotlb_all,
> > +		.iova_to_phys		= 
rk_iommu_iova_to_phys,
> > +		.free			= 
rk_iommu_domain_free,
> > 
> >   	}
> >   
> >   };





