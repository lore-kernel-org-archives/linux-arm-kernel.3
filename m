Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3BDC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 12:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3WCJyWHDo+iDYPmzNhUzFQSCU4PUPzZ8RBmSh5HlJo=; b=AvtzDrE/v328cPs5FpyPVJ+fH0
	DSPD1yKQMpjjgE92fshXqXJ+ocD3vXUOKuRUcslKRH4XTAjD7uu8012WvirV/OrMTQyJunEV7xGmj
	KekpfhG6EnVysA9cCts5YExgDZSvRS5q6eO+GKO1uzdc9zGPfpFmzRIWUCFfdavJY0tuedG5wrBBU
	lYjz+muwf3hBaHuiRhrRFLoVxfW/IReEbW7QzlyyV5IJw/pkmfXWMZsdOjQEmlbKpwEUV9KUvWrI9
	FIVzeDxkpmEXCYYg5HXimjDp5CVPsXJAhXAUwNSYD6nEjAfV+z4WRpnDYQSGoL9xvYaj+T/Q8kyIr
	9gThVFqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiY5c-0000000AyAn-02BC;
	Thu, 13 Feb 2025 12:13:08 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiY4A-0000000AxzT-2ymk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 12:11:39 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739448697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/3WCJyWHDo+iDYPmzNhUzFQSCU4PUPzZ8RBmSh5HlJo=;
	b=rmp5Exz8cDlyq2mtNnojNZqj7ZYko62PkYV3fFrSxq1Pna8q2IvK8E+v+gOW6NPZe3H/fm
	v/gtkPMIycGTOD7g5TCR12qEEc2t80l1kfok3Rr5lARpVi1Qol6Y/Sd07nLa3zrHO6P1uD
	O50ktZZ45CICbk5q7TDmQxGrtDowNsPOJGJn6yqOoBZIyKLUQ1hKtFRi6eLnOvEEHjww2q
	SwW7fGiysuI7EIJ/+QezmN6TjL+mWqU/MiABFTbAn3252BVLG630/SZ+iFVnkC6NPoWd6Z
	Q287nrW++IPa7QsqN/YAg8D4x2PbuybqPVxZJiezEtw2anHAwj18WosJkR1zeg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739448697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/3WCJyWHDo+iDYPmzNhUzFQSCU4PUPzZ8RBmSh5HlJo=;
	b=Y0Z7BaOIti331G1gEPWryQVQcDyrmBsKbcJIPPOQl1tBPL9Xa9fzRGB6QnuJbUWt05xtY/
	rPv67jYIe0eMiYCg==
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com,
 kevin.tian@intel.com, maz@kernel.org
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 shuah@kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 eric.auger@redhat.com, baolu.lu@linux.intel.com, yi.l.liu@intel.com,
 yury.norov@gmail.com, jacob.pan@linux.microsoft.com,
 patches@lists.linux.dev
Subject: Re: [PATCH v1 02/13] genirq/msi: Rename iommu_dma_compose_msi_msg()
 to msi_msg_set_addr()
In-Reply-To: <0cfaefcc104e29aeb031f316537249d8d53ef7fa.1739005085.git.nicolinc@nvidia.com>
References: <cover.1739005085.git.nicolinc@nvidia.com>
 <0cfaefcc104e29aeb031f316537249d8d53ef7fa.1739005085.git.nicolinc@nvidia.com>
Date: Thu, 13 Feb 2025 13:11:37 +0100
Message-ID: <87v7tejb7q.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_041138_892012_5D106063 
X-CRM114-Status: GOOD (  16.50  )
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

On Sat, Feb 08 2025 at 01:02, Nicolin Chen wrote:

> From: Jason Gunthorpe <jgg@nvidia.com>
>
> The new function is used to take in a u64 MSI address and store it in the

Which new function? The subject claims this is a rename. That's
confusing at best.

> msi_msg. If the iommu has provided an alternative address then that is
> replaced instead.
>
> All callers have a tidy u64 already so this also consolidates the repeated
> low/high code into a small helper.

Now I'm really confused. Something like:

    genirq/msi: Refactor iommu_dma_compose_msi_msg()

    The call sites of iommu_dma_compose_msi_msg() have the following
    pattern:

      1) Set the MSI message address to the non-translated address

      2) Invoke iommu_dma_compose_msi_msg() to apply IOVA translation if
         available.

    Rework and rename iommu_dma_compose_msi_msg() to handles both
    address set up variants in one consolidated helper.

Or something to that effect.

> -/**
> - * iommu_dma_compose_msi_msg() - Apply translation to an MSI message
> - * @desc: MSI descriptor prepared by iommu_dma_prepare_msi()
> - * @msg: MSI message containing target physical address
> - */

Please keep and rework the documentation comment.

> -static inline void iommu_dma_compose_msi_msg(struct msi_desc *desc,
> -					     struct msi_msg *msg)
> +static inline void msi_msg_set_addr(struct msi_desc *desc, struct msi_msg *msg,
> +				    u64 msi_addr)

No line break required. You have 100 characters available.

>  {
>  #ifdef CONFIG_IRQ_MSI_IOMMU
>  	if (desc->iommu_msi_page_shift) {
> @@ -314,11 +309,14 @@ static inline void iommu_dma_compose_msi_msg(struct msi_desc *desc,
>  			       << desc->iommu_msi_page_shift;
>  
>  		msg->address_hi = upper_32_bits(msi_iova);
> -		msg->address_lo = lower_32_bits(msi_iova) |
> -				  (msg->address_lo &
> -				   ((1 << desc->iommu_msi_page_shift) - 1));
> +		msg->address_lo =
> +			lower_32_bits(msi_iova) |
> +			(msi_addr & ((1 << desc->iommu_msi_page_shift) - 1));

Please avoid unrelated random formatting changes. Especially in this
case this is even more non-sensical as you introduced the original
formatting in the previous patch. So fix it up there and make it:

		msg->address_lo = lower_32_bits(msi_iova) |
				  (msg->address_lo & ((1 << desc->iommu_msi_page_shift) - 1));

which is way more readable than this displaced variant above.

> +		return;
>  
> -	iommu_dma_compose_msi_msg(irq_data_get_msi_desc(d), msg);
> +	msg->data = its_get_event_id(d);
> +	msi_msg_set_addr(irq_data_get_msi_desc(d), msg,
> +			 its_dev->its->get_msi_base(its_dev));

No line break required here and at the other places.

Thanks,

        tglx

