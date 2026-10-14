Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D92CC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 21:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFNoFpngqoFf9NYyppuLv/yxto7jom22R1QvJtAwSYw=; b=dTtNrVfIUkgvr2bOz0cwFy9nBz
	wkL4Q/UAzPb8QNnP5t3ekt61XWlO8+u3balDlCA3QRh52YpxWM5Ip3QdekWrdHlV8x7SvFvRw3MIt
	iy5b7zCfqCyxz19i1z2xyEmAsgGNv+Ya8qh5UWGsgeYZuaTyTKtQzDnuitfESM3cYfeExxVD9l23A
	tqmr8btni7iDin5LPP5Ez70AhK4GwJwIXszAYGOy54fgZbv7q8E8jBmnz7/Uv3rLgoNEZmZbnFcZ4
	9PMa+JcEicJMFbj3yZhs+UZ2oociGRlZyGSZx4Zz7ocJJuyzp1L4K3BCmQRji+WB+doqQ9jiEwqWp
	l1ADAWvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH6zU-0000000GO4Z-0znN;
	Wed, 14 Oct 2026 21:58:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH6zR-0000000GO4S-0nvZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 21:58:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AE1EC4370B;
	Wed, 14 Oct 2026 21:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E44DF1F000C4;
	Wed, 14 Oct 2026 21:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792015104;
	bh=JFNoFpngqoFf9NYyppuLv/yxto7jom22R1QvJtAwSYw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=gwG6lK1l3w4+r6otOEIhBoeVI/BR1VAS43XaS1Y340hNar+VaxyVThvttryMf8o0e
	 OoU3M7ZhcTV5rZsATNpc4PeBPfNIlr7x3TSzYAfvDWtZ71mkvwxuRneMiR55CytZ9+
	 EeV5bV+r9T0QU1Ubvvo5kqoNefTcfF+sJsY1b2hr31YNnQuIsyqDDRcT5M7IdEjN2q
	 URVFhP+zQDlL4ma9zqoJeNFo6j5VQ8FKF9WO011gMBoo4LoMGt7iP0TP96g2H6zp7t
	 K8JTH9El3wYTlNRkd5o81zobuJEYq8bXOWQbQahiMWOaQ1Lq4bwK38+3khnrQadg/P
	 AgTIpjUjBnEIA==
From: Thomas Gleixner <tglx@kernel.org>
To: Pranjal Shrivastava <praan@google.com>, iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, Robin
 Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa
 Saleh <smostafa@google.com>, Nicolin Chen <nicolinc@nvidia.com>, Daniel
 Mentz <danielmentz@google.com>, Ashish Mhetre <amhetre@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, Radu Rendec <radu@rendec.net>, Bjorn
 Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, rafael@kernel.org, Danilo Krummrich
 <dakr@kernel.org>, driver-core@lists.linux.dev, Pranjal Shrivastava
 <praan@google.com>, sashiko-bot@kernel.org
Subject: Re: [PATCH v11 08/16] genirq/msi: Provide
 msi_device_domain_restore_msi_msgs()
In-Reply-To: <20260929034510.2023173-9-praan@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-9-praan@google.com>
Date: Wed, 14 Oct 2026 23:58:21 +0200
Message-ID: <8733u8eygy.ffs@fw13>
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

On Tue, Sep 29 2026 at 03:45, Pranjal Shrivastava wrote:
> +void msi_device_domain_restore_msi_msgs(struct device *dev, unsigned int domid)
> +{
> +	if (!dev->msi.data)
> +		return;
> +
> +	guard(msi_descs_lock)(dev);
> +	struct irq_domain *domain = msi_get_device_domain(dev, domid);
> +
> +	if (!domain || !irq_domain_is_msi_device(domain))
> +		return;
> +
> +	struct xarray *xa = &dev->msi.data->__domains[domid].store;
> +	struct msi_domain_info *info = domain->host_data;
> +	struct msi_desc *msi_desc;
> +	unsigned long idx;
> +
> +	xa_for_each_range(xa, idx, msi_desc, 0, info->hwsize - 1) {
> +		/* Only handle MSI entries which have an interrupt associated */
> +		if (!msi_desc_match(msi_desc, MSI_DESC_ASSOCIATED))
> +			continue;
> +
> +		scoped_irqdesc_get_and_buslock(msi_desc->irq, 0) {
> +			struct irq_data *data = irq_desc_get_irq_data(scoped_irqdesc);
> +			struct msi_msg msg = msi_desc->msg;
> +
> +			if (data->chip)
> +				irq_chip_write_msi_msg(data, &msg);
> +		}
> +	}

In this case sashiko is wrong:

> [Severity: Critical]
> Will this result in a NULL pointer dereference in hierarchical IRQ domains?
> 
> Since irq_desc_get_irq_data() retrieves the top-level irq_data, data->chip
> points to the top-level irq_chip. In hierarchical IRQ domains, the top-level
> irq_chip typically does not implement the irq_write_msi_msg callback.
> 
> When this top-level irq_data is passed to irq_chip_write_msi_msg(), it will
> dereference a NULL function pointer:

All MSI top level (device) domains implement the irq_write_msi_msg()
callback. That's the whole point of the top level MSI domain as that's
the one which has access to the device and the associated message store.

Thanks,

        tglx

