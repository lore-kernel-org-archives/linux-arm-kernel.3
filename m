Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97526C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 14:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hVHQpBdFL8A1OMCaWXXGUDiGHIY98dt+fAh5aFuAqk=; b=b0wmJaAVUi9g8saqcgcv6a1epz
	FJcTlCpn0q3N1iuxH8p5/nPWIu7pBp+jqbTLd3i5n0MJmi5BqRBlAjS9C68QGQAnLs92hXIqnt0c9
	fYBGzB2l2LGu3/58/tw18ckWbiLgD/4/xE+/PJduqsjhzAe4px96tkjYJZEzRrzN5RhMjPNGUittJ
	02yNt/ZvA/81+X2syJQ4QU8q/fjhrLtefzrpX5AQEC6ygq7UCMFQ9qugzisNH9QWOzu60EWbk7eZo
	fKgiMHgOmFeyU/j/oTcqplFNCFvdqa+eHo3MCGWu2RasWdpaf+Uf47TMzwHv7+jNw8sCnlI0IUlHt
	/3EDkRLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMwy-00000008flV-0y8T;
	Wed, 12 Mar 2025 14:20:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLfy-00000008Tuc-0YZF
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Mar 2025 12:59:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4hVHQpBdFL8A1OMCaWXXGUDiGHIY98dt+fAh5aFuAqk=; b=WrT8yfUFsIRFCHbtfuOzl7b28K
	wZZXkUsxvnA9v998jckdy3iKsAWddsLQmZAXUpaJagO6eatUzsLmM6CyIkCoxuImOMCnD9gApMCHf
	EDpFhlNRgWm1weXdhPk98iCItdpgTBKtmTAcZKdKoz0/d+pdCU571GymkhbusxlGANHPQyNFPO/E6
	tPEITMwVmEzDyJ+ELwJ95td9UZxlxWB/5YXC8UL3Iy+gRoR6zgdOFkEm5n/recIbF7HoECf6+KSzn
	un9r/UxfRhW1qxBh4hBdDUTEMQrOGokzeRNiyRS+HVBl50VH5xPFAUazq/JQwga4HMeBJLoYaDeYl
	bsS9M+kA==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLfu-00000002NUT-37wN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 12:59:09 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-438d9c391fcso45255e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 05:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741784345; x=1742389145; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4hVHQpBdFL8A1OMCaWXXGUDiGHIY98dt+fAh5aFuAqk=;
        b=MNDWRXOSAuKVxeHLN2anVrolfjLky2klkV+kF0lJ+24sxteHDtdNd+Us9q988C0VAg
         gnudJLDCltJJtOnhhXAOYh5VPazQeEb0Q0IwncKU8Iavk65qx4tE043xQnesmpatcVgn
         p2bMQmLIrDoHcHapYRNcFX+clC3eiK3oiuRidh06kQq9OD/RPswmAT+HL+owPihxlTtC
         /Hn2SjptnFb8CH5m55ZblyHqrKQhmxvTyYxdK985LGtHb9m/8jm61xo6xKNsjM1G+r7k
         kcfQwzJhpiAI54epj14RWModrb7FKqPKkgrqMdESQCmVYxaDcRrWJrSnTEK/qQCeA5ds
         jXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741784345; x=1742389145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hVHQpBdFL8A1OMCaWXXGUDiGHIY98dt+fAh5aFuAqk=;
        b=n6YTWK6HZr+J4SPOU1RTqaKa7pgovu6JQrIg8RQtDeeIngaBwRkDtuTiRyCm0k52eP
         Z7O94CqjqorfXbQbOBRQ7KvcKTOffjUCOeo646Ye/s5NJTpofeZicxvdKAiAez+jciAI
         K9JBy1pnd0UVWhMiWjtPbZyaynsXYdtH+hyg+5E66FV/XwHT7k4rdOXjGwNqGc01EhcS
         RathzVdMVsCVULXGNETTpL4ERW46qPI8Yq2f3+aGS+NAI+7nQOl50PgXLs0Pl5TcrtBd
         pdMWYjAUJrPXbQ/9jKQpOfY1NS09akfToTnLwvwUeC0xGktYSm9EA5kwsHL9JrM78AST
         FxNw==
X-Forwarded-Encrypted: i=1; AJvYcCVACaU9ru2l4Y+HdBiiD1shF1d+ymQXi8SydpECT/C+yq0rAAilQog9VnhHUjJqAtJovQSBSABVd/sR5k0hRBva@lists.infradead.org
X-Gm-Message-State: AOJu0YxXL8tu5bjQndbB3qFcyjMBbrzak2Pa4HfLVGDO87zJLw7sAvw8
	0ZFDRp+cqTTxxFiFE39HOTE/ndgWXBCnJ1IrGBLEDDNrr1R44C81dsIPZ7L0/w==
X-Gm-Gg: ASbGncshL44RZlNrSzAp95APO8shXC/nHWxk2oX/RSCLXcTyZ80+KHAxNJXC2O4BoHf
	FZMCQHkNxvK7F12KOwH/Kx1Lfc3LoXW1fyHmCg7tW4D0igS31BpA10haiMAW5KDrwmKhwQR6SKk
	qyDq5Fva99raP+qhm2daimmlGEeIwjAXUxgmOSnyw8JIlW+9rvY93qgfpQWDtHyfkEJKlHlZDWe
	49uMZMcxAgtXm2jnDy+O3Cs+9T8qLagfTCf6sF7BnAKoB3NB6MdjHTzQwgS6ZXLsVFqbIXLwcxq
	/81oCQ84VcxRqb21U7uug4+xIxzXkPPnyEe30snIRW+lwzQkp8z7hVdv7iHrHg0qYVRzsT3gg6B
	0lFAX
X-Google-Smtp-Source: AGHT+IGv3VwL/nDTfZJkT02Z+Ln6cpEc0JtjX8qb40ZbVAGSWsBoi80OOQ8vIb/VOjdd5NkKwgkkDw==
X-Received: by 2002:a05:600c:1c11:b0:439:9434:1b66 with SMTP id 5b1f17b1804b1-43d0a5e3299mr1028055e9.1.1741784344924;
        Wed, 12 Mar 2025 05:59:04 -0700 (PDT)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3947a24449bsm1688998f8f.45.2025.03.12.05.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 05:59:04 -0700 (PDT)
Date: Wed, 12 Mar 2025 12:59:00 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Lu Baolu <baolu.lu@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Hector Martin <marcan@marcan.st>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
	Joerg Roedel <jroedel@suse.de>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	David Rientjes <rientjes@google.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v3 20/23] iommu: Update various drivers to pass in lg2sz
 instead of order to iommu pages
Message-ID: <Z9GFFBvUFg7a9WEg@google.com>
References: <0-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
 <20-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_125906_878201_11B23513 
X-CRM114-Status: GOOD (  34.75  )
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

On Tue, Feb 25, 2025 at 03:39:37PM -0400, Jason Gunthorpe wrote:
> Convert most of the places calling get_order() as an argument to the
> iommu-pages allocator into order_base_2() or the _sz flavour
> instead. These places already have an exact size, there is no particular
> reason to use order here.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/amd/init.c        | 29 +++++++++++++++--------------
>  drivers/iommu/intel/dmar.c      |  6 +++---
>  drivers/iommu/io-pgtable-arm.c  |  3 +--
>  drivers/iommu/io-pgtable-dart.c | 12 +++---------
>  drivers/iommu/sun50i-iommu.c    |  4 ++--
>  5 files changed, 24 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
> index e3f4283ebbc201..a5720df7b22397 100644
> --- a/drivers/iommu/amd/init.c
> +++ b/drivers/iommu/amd/init.c
> @@ -635,8 +635,8 @@ static int __init find_last_devid_acpi(struct acpi_table_header *table, u16 pci_
>  /* Allocate per PCI segment device table */
>  static inline int __init alloc_dev_table(struct amd_iommu_pci_seg *pci_seg)
>  {
> -	pci_seg->dev_table = iommu_alloc_pages(GFP_KERNEL | GFP_DMA32,
> -					       get_order(pci_seg->dev_table_size));
> +	pci_seg->dev_table = iommu_alloc_pages_sz(GFP_KERNEL | GFP_DMA32,
> +						  pci_seg->dev_table_size);
>  	if (!pci_seg->dev_table)
>  		return -ENOMEM;
>  
> @@ -716,8 +716,7 @@ static void __init free_alias_table(struct amd_iommu_pci_seg *pci_seg)
>   */
>  static int __init alloc_command_buffer(struct amd_iommu *iommu)
>  {
> -	iommu->cmd_buf = iommu_alloc_pages(GFP_KERNEL,
> -					   get_order(CMD_BUFFER_SIZE));
> +	iommu->cmd_buf = iommu_alloc_pages_sz(GFP_KERNEL, CMD_BUFFER_SIZE);
>  
>  	return iommu->cmd_buf ? 0 : -ENOMEM;
>  }
> @@ -820,14 +819,16 @@ static void __init free_command_buffer(struct amd_iommu *iommu)
>  void *__init iommu_alloc_4k_pages(struct amd_iommu *iommu, gfp_t gfp,
>  				  size_t size)
>  {
> -	int order = get_order(size);
> -	void *buf = iommu_alloc_pages(gfp, order);
> +	void *buf;
>  
> -	if (buf &&
> -	    check_feature(FEATURE_SNP) &&
> -	    set_memory_4k((unsigned long)buf, (1 << order))) {
> +	size = PAGE_ALIGN(size);
> +	buf = iommu_alloc_pages_sz(gfp, size);
> +	if (!buf)
> +		return NULL;
> +	if (check_feature(FEATURE_SNP) &&
> +	    set_memory_4k((unsigned long)buf, size / PAGE_SIZE)) {
>  		iommu_free_pages(buf);
> -		buf = NULL;
> +		return NULL;
>  	}
>  
>  	return buf;
> @@ -922,11 +923,11 @@ static int iommu_init_ga_log(struct amd_iommu *iommu)
>  	if (!AMD_IOMMU_GUEST_IR_VAPIC(amd_iommu_guest_ir))
>  		return 0;
>  
> -	iommu->ga_log = iommu_alloc_pages(GFP_KERNEL, get_order(GA_LOG_SIZE));
> +	iommu->ga_log = iommu_alloc_pages_sz(GFP_KERNEL, GA_LOG_SIZE);
>  	if (!iommu->ga_log)
>  		goto err_out;
>  
> -	iommu->ga_log_tail = iommu_alloc_pages(GFP_KERNEL, get_order(8));
> +	iommu->ga_log_tail = iommu_alloc_pages_sz(GFP_KERNEL, 8);
>  	if (!iommu->ga_log_tail)
>  		goto err_out;
>  
> @@ -1021,8 +1022,8 @@ static bool __copy_device_table(struct amd_iommu *iommu)
>  	if (!old_devtb)
>  		return false;
>  
> -	pci_seg->old_dev_tbl_cpy = iommu_alloc_pages(GFP_KERNEL | GFP_DMA32,
> -						     get_order(pci_seg->dev_table_size));
> +	pci_seg->old_dev_tbl_cpy = iommu_alloc_pages_sz(
> +		GFP_KERNEL | GFP_DMA32, pci_seg->dev_table_size);
>  	if (pci_seg->old_dev_tbl_cpy == NULL) {
>  		pr_err("Failed to allocate memory for copying old device table!\n");
>  		memunmap(old_devtb);
> diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
> index c812c83d77da10..4c7ce92acf6976 100644
> --- a/drivers/iommu/intel/dmar.c
> +++ b/drivers/iommu/intel/dmar.c
> @@ -1681,7 +1681,6 @@ int dmar_enable_qi(struct intel_iommu *iommu)
>  {
>  	struct q_inval *qi;
>  	void *desc;
> -	int order;
>  
>  	if (!ecap_qis(iommu->ecap))
>  		return -ENOENT;
> @@ -1702,8 +1701,9 @@ int dmar_enable_qi(struct intel_iommu *iommu)
>  	 * Need two pages to accommodate 256 descriptors of 256 bits each
>  	 * if the remapping hardware supports scalable mode translation.
>  	 */
> -	order = ecap_smts(iommu->ecap) ? 1 : 0;
> -	desc = iommu_alloc_pages_node(iommu->node, GFP_ATOMIC, order);
> +	desc = iommu_alloc_pages_node_sz(iommu->node, GFP_ATOMIC,
> +					 ecap_smts(iommu->ecap) ? SZ_8K :
> +								  SZ_4K);
>  	if (!desc) {
>  		kfree(qi);
>  		iommu->qi = NULL;
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 08d0f62abe8a09..d13149ec5be77e 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -263,14 +263,13 @@ static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
>  				    void *cookie)
>  {
>  	struct device *dev = cfg->iommu_dev;
> -	int order = get_order(size);
>  	dma_addr_t dma;
>  	void *pages;
>  
>  	if (cfg->alloc)
>  		pages = cfg->alloc(cookie, size, gfp);
>  	else
> -		pages = iommu_alloc_pages_node(dev_to_node(dev), gfp, order);
> +		pages = iommu_alloc_pages_node_sz(dev_to_node(dev), gfp, size);

Although, the current implementation of iommu_alloc_pages_node_sz() would round
the size to order, but this is not correct according to the API definition
"The returned allocation is round_up_pow_two(size) big, and is physically aligned
to its size."

SMMUv3 has special alignment with small number of entries at the start level,
according the manual:
	A 64-byte minimum alignment on starting-level translation table addresses
	is imposed when TG0 selects 64KB granules and the effective IPS value
	indicates 52-bit output. In this case bits [5:0] are treated as zero.

And according to the Arm Arm (ex D24.2.195 in Version L)
	- Bits A[(x-1):0] of the stage 1 translation table base address are zero.
	... The smallest permitted value of x is 5.
Which 32 bytes

For a case as (which is valid in Linux)
- S1 with IAS 40-bits and 4K, start level has 2 entries (16 bytes) but alignment
  must be at least 32 bytes.

- Similarly with 16K and 48 bits.

I'd say we can align the size or use min with 64 bytes before calling the
function would be enough (or change the API to state that allocations
are rounded to order)

Thanks,
Mostafa

>  
>  	if (!pages)
>  		return NULL;
> diff --git a/drivers/iommu/io-pgtable-dart.c b/drivers/iommu/io-pgtable-dart.c
> index ebf330e67bfa30..a0988669bb951a 100644
> --- a/drivers/iommu/io-pgtable-dart.c
> +++ b/drivers/iommu/io-pgtable-dart.c
> @@ -107,13 +107,6 @@ static phys_addr_t iopte_to_paddr(dart_iopte pte,
>  	return paddr;
>  }
>  
> -static void *__dart_alloc_pages(size_t size, gfp_t gfp)
> -{
> -	int order = get_order(size);
> -
> -	return iommu_alloc_pages(gfp, order);
> -}
> -
>  static int dart_init_pte(struct dart_io_pgtable *data,
>  			     unsigned long iova, phys_addr_t paddr,
>  			     dart_iopte prot, int num_entries,
> @@ -255,7 +248,7 @@ static int dart_map_pages(struct io_pgtable_ops *ops, unsigned long iova,
>  
>  	/* no L2 table present */
>  	if (!pte) {
> -		cptep = __dart_alloc_pages(tblsz, gfp);
> +		cptep = iommu_alloc_pages_sz(gfp, tblsz);
>  		if (!cptep)
>  			return -ENOMEM;
>  
> @@ -412,7 +405,8 @@ apple_dart_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
>  	cfg->apple_dart_cfg.n_ttbrs = 1 << data->tbl_bits;
>  
>  	for (i = 0; i < cfg->apple_dart_cfg.n_ttbrs; ++i) {
> -		data->pgd[i] = __dart_alloc_pages(DART_GRANULE(data), GFP_KERNEL);
> +		data->pgd[i] =
> +			iommu_alloc_pages_sz(GFP_KERNEL, DART_GRANULE(data));
>  		if (!data->pgd[i])
>  			goto out_free_data;
>  		cfg->apple_dart_cfg.ttbr[i] = virt_to_phys(data->pgd[i]);
> diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
> index 6385560dbc3fb0..76c9620af4bba8 100644
> --- a/drivers/iommu/sun50i-iommu.c
> +++ b/drivers/iommu/sun50i-iommu.c
> @@ -690,8 +690,8 @@ sun50i_iommu_domain_alloc_paging(struct device *dev)
>  	if (!sun50i_domain)
>  		return NULL;
>  
> -	sun50i_domain->dt = iommu_alloc_pages(GFP_KERNEL | GFP_DMA32,
> -					      get_order(DT_SIZE));
> +	sun50i_domain->dt =
> +		iommu_alloc_pages_sz(GFP_KERNEL | GFP_DMA32, DT_SIZE);
>  	if (!sun50i_domain->dt)
>  		goto err_free_domain;
>  
> -- 
> 2.43.0
> 

