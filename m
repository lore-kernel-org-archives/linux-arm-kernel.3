Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5E7C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 19:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k8xIqxOa0Y2SU3wgjx14WiXI07z60EtLxeh3n9UetUk=; b=epmiXjrnkXh11xpCiqp7MlEIwK
	ni1mYsd5d26uEmRsRu0u6LxekO1tqpPgaYfTVG5jZojjv25czkIp+Tj69qIBNmJeGNekdGwxS8Sgj
	X0/rP28MBQ+lcI0mS3O0c0AL/RDYQ4JLP9cRwWZlbnAGe2SCHmhuRg+B/N1ofgCjlfLckdQmmUqRy
	C32tWPTK83WLjQ53SGwU3ls09QqWpRwb22vbOi7II4z8ordRJTziriByMk67iAU/91sLFGg2NYjP8
	iWto/oIIO/oZFQhBrhbXGmaGN/YXSK316oykCvlFi/cZifYif4h7FKNT3cLk7kVKVKGqSJoGOwCe6
	ralbcImw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLXr-0000000HA4l-1HTU;
	Fri, 24 Jul 2026 19:26:55 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLXo-0000000HA3p-1OLe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 19:26:53 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4954d5d814fso11485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 12:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784921210; x=1785526010; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k8xIqxOa0Y2SU3wgjx14WiXI07z60EtLxeh3n9UetUk=;
        b=bxN3WfwOkSq1wrKirgd5Ekw0xXkibaNHJaD8uQL+b7nKc54PK38cbkaIvu7/4jS2RV
         MCA5dKOh/RHG2iQsB/VOUGBxOlMmHwn6nW1sD4T7cOpFhmHFWIGhOgyQ2DNrdYmP61Dm
         6Jm5jGOSFWV/zgjwBz3+K+fJfG9idwoRq2ReiHSFpVCy+jr4I/yJ8USJAc8zQA1d4dZI
         B0vtWuUfX8zgqB1V5I67oqlKz4WVyUzlfcfKUsx0LGjHRZIDNX9DuKnmHwatj5x0quac
         O4BHBdJevtKg3LlT0akrFeaHYiV1uo7ScHdnBtIczVwjzRTcv1MM8uWE9rB6h64baksl
         TWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784921210; x=1785526010;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k8xIqxOa0Y2SU3wgjx14WiXI07z60EtLxeh3n9UetUk=;
        b=KE5Ym5oLb5pu9IO5wsZyTmBBaxmX9dviYbjbGHm5rcknCmCdLRuxj9y4TAyzaJa0DE
         WmT2xx/g7LqPjlSo6Vs8exKCWHtuqB3wD3Fw8cySL/0zAjMDJrEJm2Wo0KcaMEckE2LZ
         Mm5fDZKaMSsRKiNx8zssqpnxTxk51otlRGh7q7hB5Vrd590RnlDY1JrCUBDguBquiwwh
         cnBJYBAIwLjJvapqeigRKN63+lwLXd4exK0PekCXRB/t6wl1re5X02Xvu9ttJym+rA/O
         MHEetFcN8k/tkfou8y9pKWZTXylVt+2ypvoFx5/NgpqwkZuiYdqk1Ub54Tpv/CbPUbub
         Qz7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqede3ssMOkw4MlkveS53O0WRdxESWBvik0rFWG37+tgfcLjj1zJCIxtLk11+ilrDvc7g5ClimV4SySHT8DVmrJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzqZxCbsfPp2I/fojFRqFSctp6kyKuIb4hQgGbr1NFCkOKAS/eP
	k5bJZem4KjW4UF1RAV7TQpoObjeBJiXOd8tjmFjOQraSMtR6OSMWTcmYvEPgsDRJMMnbntOK9vY
	f4Q92hA==
X-Gm-Gg: AR+sD11sexqiKU5UE7MQK+yjN9B3H6NQEFGIsV/SqmfklQRmBLEdl/CZDD24aU10tS3
	DVV2r83luJ/oEefgdK7IPOwwIqNUcDfZTPUlm66dxG3bpRQ1yfiG9caCI6mF0fint5Wm4i+N+b7
	AsGrGE8L7iMU+hdUgK5JFfMDfMSZF2JXNYwTFjDFfY5DGUw4TqjWAaGOBB7z7xAFTEpf2D3vxw4
	OH0GpkC2wC9B5PndOJF5Qz9xjEA/BqF7xkYzjJeOKf9cITyHJg+qM+g1QyZrRq9G2iHWYBndseX
	A1UXBoqY5ldieCAx3dN4G1Iz5yKTEN15e9GXk4ki8t/XflhOihoPR/qTKRBFAO7E3DjwF5x8zRv
	C1DvOgQr73fhseG6ufJKABzdHO/vMaJ0782hgIEnuf33zZ1fptMgRQ3H6fflhuhANuNQAWjaqu8
	3/OvrPUcaZcMH04xJ57ZcdJnU56URzUTrncSFV9g==
X-Received: by 2002:a05:600c:656:b0:493:a96b:f9fe with SMTP id 5b1f17b1804b1-496b4cf18e5mr153555e9.4.1784921210084;
        Fri, 24 Jul 2026 12:26:50 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb5a46sm25674153f8f.9.2026.07.24.12.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 12:26:49 -0700 (PDT)
Date: Fri, 24 Jul 2026 19:26:45 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH 5/7] iommu/arm-smmu-v3: Move the DMA API comment to
 flush_iotlb_all
Message-ID: <amO8dYdZ5RNJ-7ye@google.com>
References: <0-v1-807e2d1a5efb+e1-iommupt_armv8_jgg@nvidia.com>
 <5-v1-807e2d1a5efb+e1-iommupt_armv8_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5-v1-807e2d1a5efb+e1-iommupt_armv8_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_122652_388260_2E259DE0 
X-CRM114-Status: GOOD (  24.01  )
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

On Mon, Jul 06, 2026 at 01:29:11PM -0300, Jason Gunthorpe wrote:
> arm_smmu_tlb_inv_context() is the wrong flush_all for this comment,
> it is only called during io-pgtable destruction not during the dma-iommu
> operation. Move it to arm_smmu_flush_iotlb_all() which is the flush
> that is triggered by the dma-iommu lazy flush thread.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 31 +++++++++++----------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 5087603ea18e62..dd22c0f881bfba 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2392,21 +2392,6 @@ static void arm_smmu_tlb_inv_context(void *cookie)
>  {
>  	struct arm_smmu_domain *smmu_domain = cookie;
>  
> -	/*
> -	 * If the DMA API is running in non-strict mode then another CPU could
> -	 * have changed the page table and not invoked any flush op. Instead the
> -	 * other CPU will do an atomic_read() and this CPU will have done an
> -	 * atomic_write(). That handshake is enough to acquire the page table
> -	 * writes from the other CPU.
> -	 *
> -	 * All command execution has a dma_wmb() to release all the in-memory
> -	 * structures written by this CPU, that barrier must also release the
> -	 * writes acquired from all the other CPUs too.
> -	 *
> -	 * There are other barriers and atomics on this path, but the above is
> -	 * the essential mechanism for ensuring that HW sees the page table
> -	 * writes from another CPU before it executes the IOTLB invalidation.
> -	 */
>  	arm_smmu_domain_inv(smmu_domain);
>  }
>  
> @@ -4078,6 +4063,22 @@ static void arm_smmu_flush_iotlb_all(struct iommu_domain *domain)
>  {
>  	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
>  
> +	/*
> +	 * If the DMA API is running in non-strict mode then another CPU could
> +	 * have changed the page table and not invoked any flush op. Instead the
> +	 * other CPU will do an atomic_read() and this CPU will have done an
> +	 * atomic_write(). That handshake is enough to acquire the page table
> +	 * writes from the other CPU.
> +	 *
> +	 * All command execution has a dma_wmb() to release all the in-memory
> +	 * structures written by this CPU, that barrier must also release the
> +	 * writes acquired from all the other CPUs too.
> +	 *
> +	 * There are other barriers and atomics on this path, but the above is
> +	 * the essential mechanism for ensuring that HW sees the page table
> +	 * writes from another CPU before it executes the IOTLB invalidation.
> +	 */
> +
>  	if (smmu_domain->smmu)
>  		arm_smmu_tlb_inv_context(smmu_domain);
>  }
> -- 
> 2.43.0
> 

