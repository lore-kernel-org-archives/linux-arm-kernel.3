Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222E4CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 13:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Mb3ECCQF4KDrnD1oEZunr+tebvyQKuHVVgCgeE/hK8=; b=FTZc+mk6GBnUJm9627eH0Lx9RS
	Tdh+euiPzTMowtjYs2Tf9VVlt75Vc1zZCs3Zud8XIpvPQg/gZLJvUkFFEJiZZCZanpd/F5nJTHlmq
	BqUIQCkjetaCMPAm9lN/bMckOMBYXMXGfTRQj7BHgaYLNduFOSBparG7TxDuXOrRJgP3uLDU0QOKp
	A0AvUbI5mim1Xe3TEEa3S5ML5j9S/n8cIzVSBEnWyYufWG6ycaAENYvi3fm258z4jnV5V1T/WtFQj
	bEJWIK0Mo7q++DA8MPu8iB2MHpY44c4k8ZouymZCYdVrgtwZeN8zuA4H4pnjshzq2FYX6HbrgEcrV
	v0Jj06Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwTj-00000005ehU-2oEy;
	Tue, 09 Jun 2026 13:26:51 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwTf-00000005egQ-3XoS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 13:26:49 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490b1df16acso5141465e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 06:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781011606; x=1781616406; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Mb3ECCQF4KDrnD1oEZunr+tebvyQKuHVVgCgeE/hK8=;
        b=ZHBqU/CVoUEpYvc2soIMOtsBTn5ruZGGRgGsjrGKdhy1cQuGfiWi1k1z9KZYQvZwRS
         E141ByXp6BAopOX+b1qWTT/qw9J7RrzyNmCWBWnZ18nAZoi2KXuXDZRqk0+Y6YRJAM3E
         QlT3xwh35myYACE72UX4DUpKvuRaeip1sNYp/pEtQ+5yNPC7CArHMNz6JUgITauTkTln
         epG7nmlTW7jhrTRQcZ5n5kCaWe8j6o9TDXaTNgCv/oGbcBOwNSnj2qA/qc/pE2xGoanQ
         PxcdQzOWJeIesFFO8niZIA4rQB5fpr2X2By4OKBXMxCQxQsLzWFz3qJIfBWasvmdbOJ3
         NtNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781011606; x=1781616406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Mb3ECCQF4KDrnD1oEZunr+tebvyQKuHVVgCgeE/hK8=;
        b=MqtxP+pG+9QaIhG3M8oC+FdmvGz+MfPzKafUIDkMGXVWj1rpxCbVi+eTLfX2/4aqmH
         l3edor2nmCpYEqhRhr4AHLwzz0gRm9pyygqUq0Y8GZICo16EQSDkyOreFpWBI/2xwP4T
         JzgYuC3hJyk9T3dmhRuVlzUFq0PP01jUIlj72f6v2T1/aygAbGtmogzY8vcC0I3OHQUz
         BvLqqPqD90ExgrK51MmM8P3fKv6Kb0TaXfjBQog4W4gdglCTutmcf945TnJOWYgpCtXk
         d9TD+eiaAXxqLvjaowE2xNRISD/nUuVKfFEP6EhSQn5jFBRTttGcZm339inhrj7iHm/a
         XTGQ==
X-Forwarded-Encrypted: i=1; AFNElJ/YcjU9jgdwqHQxA5jzsr0KVdngxQFFKdYeVu9O15LNDD4ny5LN9EBUzdGBlVkWvvVQ5RGZjKO0eVTekDTedqFF@lists.infradead.org
X-Gm-Message-State: AOJu0YySn1FDN0qvWW8Ii8iCnBybCV3N/Ki29UmqwuSF/7yw/9TcDoWK
	bZhUq6C6mB04ag9h5IgVP+F/DbD5P2HzxA/Q0Uqciqoa8znzwQsW4Hc62koxOTcmeh4=
X-Gm-Gg: Acq92OFJY+B3xUsLiOi77II6C5PLaovi6a1G0nG2tEs8Fbs5h6qRW5o70ZJg79nacue
	UHmPxYJARmzB/pVq6Ia94fwSQdeiFONrs/Cd3XchKkq+DcEr/+DzPK6Q9v0HobdsRp+/4i6K8S2
	W2h7HTngY3eg4SINUUnH13AYtRWJqxwvopalbutPyGgm0S5KdmJgl+55FuIdSsY1+VF1GP2r6JE
	JvxLpPdXbAqeQt5K5BMGEbh4JPiBdKocHUH9TiBFQzxxptF2T1caYXG94Btfkm2q1ehCDS2ken3
	Pmb7a5wngVXgmECbguPPX/r21Yd7r2bOgjL6O0cinczyLOVTH4Cl9rHSCsIH5hHune/++p+mUXA
	es7Vh08bdO0Xml2iD6fa6/Fyg1g6rAZb3YKulFk3OZf8zvCUR1zBguKKINAY51O3S8YQDD4VtUt
	ZwpWdqLOMz4bZZE9W8D3SsTpo=
X-Received: by 2002:a05:600c:8705:b0:490:3fdd:d344 with SMTP id 5b1f17b1804b1-490c25897eamr150306735e9.1.1781011605912;
        Tue, 09 Jun 2026 06:26:45 -0700 (PDT)
Received: from mordecai ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39def5sm469464095e9.5.2026.06.09.06.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:26:45 -0700 (PDT)
Date: Tue, 9 Jun 2026 15:13:54 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, Robin Murphy
 <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Will
 Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Steven Price
 <steven.price@arm.com>, Suzuki K Poulose <Suzuki.Poulose@arm.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Jiri Pirko <jiri@resnulli.us>, Jason
 Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, Alexey
 Kardashevskiy <aik@amd.com>, Dan Williams <dan.j.williams@intel.com>, Xu
 Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, x86@kernel.org, Michael Kelley
 <mhklinux@outlook.com>
Subject: Re: [PATCH v6 15/20] iommu/dma: Check atomic pool allocation result
 directly
Message-ID: <20260609151354.534bb18d@mordecai>
In-Reply-To: <20260604083959.1265923-16-aneesh.kumar@kernel.org>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
	<20260604083959.1265923-16-aneesh.kumar@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_062647_907996_9B85D03D 
X-CRM114-Status: GOOD (  17.99  )
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

On Thu,  4 Jun 2026 14:09:54 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> The non-blocking, non-coherent allocation path uses dma_alloc_from_pool(),
> which returns the allocated page and fills cpu_addr only on success.
> 
> Do not rely on cpu_addr to detect allocation failure in this path. Check
> the returned page directly before using it for the IOMMU mapping.
> 
> Fixes: 9420139f516d ("dma-pool: fix coherent pool allocations for IOMMU mappings")
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Reviewed-by: Petr Tesarik <ptesarik@suse.com>

Petr T

> ---
>  drivers/iommu/dma-iommu.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 725c7adb0a8d..52c599f4472c 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -1671,13 +1671,16 @@ void *iommu_dma_alloc(struct device *dev, size_t size, dma_addr_t *handle,
>  	}
>  
>  	if (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> -	    !gfpflags_allow_blocking(gfp) && !coherent)
> +	    !gfpflags_allow_blocking(gfp) && !coherent) {
>  		page = dma_alloc_from_pool(dev, PAGE_ALIGN(size), &cpu_addr,
>  					   gfp, attrs, NULL);
> -	else
> +		if (!page)
> +			return NULL;
> +	} else {
>  		cpu_addr = iommu_dma_alloc_pages(dev, size, &page, gfp, attrs);
> -	if (!cpu_addr)
> -		return NULL;
> +		if (!cpu_addr)
> +			return NULL;
> +	}
>  
>  	*handle = __iommu_dma_map(dev, page_to_phys(page), size, ioprot,
>  			dev->coherent_dma_mask);


