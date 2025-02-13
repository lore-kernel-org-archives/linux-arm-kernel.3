Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053C0C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 20:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVY3r1RNzm3lnez0t18kEbUj6IdxjFad9QEqEvSyVcs=; b=vaj00EqSxKJ8iLaTXqUbaksrrg
	aUyoKpf4sUl9U2YAQ/iGTh/bjTilQC+uDFVVCSoD3BZPDT+mpUMIO8KYT8Wn5FImVi0/JXrvBnx3e
	4GFNGdjYbTsfA+npgwDNW+YMw6W/F+oKKzMnMc/PlWh9HFoNZZZ0v/qCyKPyfBg1aYekS1xYNfLoY
	G+qHWrpVxFvZFobS1/lyqu2mPDTypwHBabQkvyAxpY20XIroLTamLK+vLQ3SS2nwZFqAF+PHeW8Bu
	Sjm9TU/6m0oZW9ctMgKbTnY8fBN0xlXxBRbqqjcQIRjFe2dS7UPHh6L1392R0NkBvLzRO5RNgoJU3
	JTIFc9Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tifqq-0000000CXrC-1COh;
	Thu, 13 Feb 2025 20:30:24 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tifpO-0000000CXaa-1gFt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 20:28:55 +0000
Received: from DESKTOP-0403QTC. (unknown [20.236.11.102])
	by linux.microsoft.com (Postfix) with ESMTPSA id 8833A203F3CB;
	Thu, 13 Feb 2025 12:28:51 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8833A203F3CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1739478532;
	bh=FVY3r1RNzm3lnez0t18kEbUj6IdxjFad9QEqEvSyVcs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Reply-To:From;
	b=UTxDWhaLmrK+RIBYhfmZlfU+SvrmBBqYQNZoGWEz2tjVzT4yQC7trxO676DR7FvAV
	 1rlxBHV4FCCXWF8M730p8ExNvyaZGgFvqEd6wk9uuSze7bu1RwEhRWtPmYAAvWnkqh
	 oXCBNq0UUKRMd8x9wwBieI4m3gmNo9QULiyx5tt4=
Date: Thu, 13 Feb 2025 12:28:49 -0800
From: Jacob Pan <jacob.pan@linux.microsoft.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: <jgg@nvidia.com>, <kevin.tian@intel.com>, <tglx@linutronix.de>,
 <maz@kernel.org>, <joro@8bytes.org>, <will@kernel.org>,
 <robin.murphy@arm.com>, <shuah@kernel.org>, <iommu@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kselftest@vger.kernel.org>, <eric.auger@redhat.com>,
 <baolu.lu@linux.intel.com>, <yi.l.liu@intel.com>, <yury.norov@gmail.com>,
 <patches@lists.linux.dev>, jacob.pan@linux.microsoft.com
Subject: Re: [PATCH v1 01/13] genirq/msi: Store the IOMMU IOVA directly in
 msi_desc instead of iommu_cookie
Message-ID: <20250213122849.34f5d1cb@DESKTOP-0403QTC.>
In-Reply-To: <a580069c5e494ffffa668218b6fe3a207b01efec.1739005085.git.nicolinc@nvidia.com>
References: <cover.1739005085.git.nicolinc@nvidia.com>
	<a580069c5e494ffffa668218b6fe3a207b01efec.1739005085.git.nicolinc@nvidia.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_122854_472203_A161546B 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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
Reply-To: jacob.pan@linux.microsoft.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Nicolin,

On Sat, 8 Feb 2025 01:02:34 -0800
Nicolin Chen <nicolinc@nvidia.com> wrote:

> -static inline void msi_desc_set_iommu_cookie(struct msi_desc *desc,
> -					     const void
> *iommu_cookie) +/**
> + * iommu_dma_compose_msi_msg() - Apply translation to an MSI message
> + * @desc: MSI descriptor prepared by iommu_dma_prepare_msi()
> + * @msg: MSI message containing target physical address
> + */
Is it IOVA not PA?

> +static inline void iommu_dma_compose_msi_msg(struct msi_desc *desc,
> +					     struct msi_msg *msg)
>  {
> -}
> +#ifdef CONFIG_IRQ_MSI_IOMMU
> +	if (desc->iommu_msi_page_shift) {
> +		u64 msi_iova = desc->iommu_msi_iova
> +			       << desc->iommu_msi_page_shift;
> +
> +		msg->address_hi = upper_32_bits(msi_iova);
> +		msg->address_lo = lower_32_bits(msi_iova) |
> +				  (msg->address_lo &
> +				   ((1 <<
> desc->iommu_msi_page_shift) - 1));
> +	}
>  #endif
> +}

