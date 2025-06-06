Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF74C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 18:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VAUhjYxThgXkitpnjxyy0unZevW/6JACvYls6YdZBNI=; b=fJmQTVfh3ajYx19Yx8+SFIoojr
	1srkSr8QNGJKqy0cvN8rAwy7uNmztn16PUwEBT/Vlw3DE6P18zbYahLq4/JfHx2xww9kbBwSDB3wD
	fbXI3SgN4Or26LFdCm7yoZfWsdlqBeS23QfcwhAREUodeUTJ5xrgVxfBo9QRWIyRFQ8zzpRhq3dzi
	6DpyJ2cMT1n/X4bL8z5FXZeVcl3b8fwT3Iy++QfeKswh7ZbcZXyFB9GT5O43SMV6efCsbbJUY2QIx
	xIOHfYkJQFMkSeUnjqEynYlYNW38VNxnSoe+MaW1BU5FqejIYTCUbHpXY454CcPFSMqD8FS8PDkCQ
	kY+ODsfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNbeA-00000000n8y-08WW;
	Fri, 06 Jun 2025 18:18:30 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNbaT-00000000mk8-2oBW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 18:14:42 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-31315427249so2549344a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 11:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749233680; x=1749838480; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VAUhjYxThgXkitpnjxyy0unZevW/6JACvYls6YdZBNI=;
        b=Zg7UyW/g4gGQJDvhvkQeVuv31/zFEcOuVF5XSio+OI/NvIPqy/sma+j2fzroU5gd1g
         P0JUYW4ddxWTVKXUSR3H+L0QvjhHIxTjbg8BjrJXjX4AbaJ/q3p26P7s3yskNjKdF2i0
         uhQyXu9zRiRRfhGoHv8T03wxT8RHwMMlk4MufTNOsEDslMqm26/SQiPZyhXxOk6xWbwK
         2k6h6wg2EqpMPz2ajoiT28nwGgdxqAxqTq0LgOwg3bvy485Fbc/V4tjilrePmmdIC93i
         I+P4tUId9PYw8AbRFkga2Z+3rUTs+FuASzRghN0mHPPbtuLlWYdy3HVCtd3jl5MXUmeL
         4U4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749233680; x=1749838480;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VAUhjYxThgXkitpnjxyy0unZevW/6JACvYls6YdZBNI=;
        b=rfm5uMtpJHIctQvjbVYleDTiZEc8vEe37Ia5oSDlfpcdWq7OCO8yWHHXQShkfprFQn
         TyXaN35XBUXz7x96tWs+kaQQFEG9l2Qo3ZXIum84JAXPQ4eSRAmPJgiy1cF0ByrOzXw6
         UWze/LNW+xtVDS7DpaVN3OF20f0X2AaBGFLw5STGXAuoSOjep7yhPI6KF2300AeJ+Fhs
         lOmrl8nMj99TSDI1dLym0iD6iJMigzaayWTOHqDNnhX49N7pz5qfQDOVE+UAWs1eUfWq
         zUaF/ki26lC1JgubbYGvAAx+3pB3PZ9PLUmHYxkUoDpdugcefOKnRfOGY9Tzjq1TIvcI
         yDEw==
X-Forwarded-Encrypted: i=1; AJvYcCV6zw5IzmBanKXqo7xPky3L9FdZlRnWDlOJK1xHQ+pbleQjxBW1DU1SNrdtF1Tsy7UTDDHzMIZ9jATMYZmW4Sfs@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9SqOrQFp0o9NJorBvXQRGQZ8ZpHEAHtG8+vnbSlZHiK8rh26i
	0P5hZE2k2kvQ11CUNIEGwq4sabFABWvEcRk3BNHxfrbzbdCqXDzcJF0IAh9UV/gfdxia0RTdpxq
	U3CXPJQ==
X-Google-Smtp-Source: AGHT+IEVafAx0DEdokAbHZYNqcfLZrJvGcnddWO2nYwmoBUbnL46jnQNAcO/DBxC/1OVXbJIbbas3Y6XETw=
X-Received: from pjbpq14.prod.google.com ([2002:a17:90b:3d8e:b0:311:d79d:e432])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:17c5:b0:30e:9349:2da2
 with SMTP id 98e67ed59e1d1-313472d24e5mr6030735a91.4.1749233680403; Fri, 06
 Jun 2025 11:14:40 -0700 (PDT)
Date: Fri, 6 Jun 2025 11:14:38 -0700
In-Reply-To: <20250524013943.2832-5-ankita@nvidia.com>
Mime-Version: 1.0
References: <20250524013943.2832-1-ankita@nvidia.com> <20250524013943.2832-5-ankita@nvidia.com>
Message-ID: <aEMwDqxsDgfXcLKw@google.com>
Subject: Re: [PATCH v6 4/5] KVM: arm64: Allow cacheable stage 2 mapping using
 VMA flags
From: Sean Christopherson <seanjc@google.com>
To: ankita@nvidia.com
Cc: jgg@nvidia.com, maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, ryan.roberts@arm.com, shahuang@redhat.com, 
	lpieralisi@kernel.org, david@redhat.com, aniketa@nvidia.com, cjia@nvidia.com, 
	kwankhede@nvidia.com, kjaju@nvidia.com, targupta@nvidia.com, 
	vsethi@nvidia.com, acurrid@nvidia.com, apopple@nvidia.com, 
	jhubbard@nvidia.com, danw@nvidia.com, zhiw@nvidia.com, mochs@nvidia.com, 
	udhoke@nvidia.com, dnigam@nvidia.com, alex.williamson@redhat.com, 
	sebastianene@google.com, coltonlewis@google.com, kevin.tian@intel.com, 
	yi.l.liu@intel.com, ardb@kernel.org, akpm@linux-foundation.org, 
	gshan@redhat.com, linux-mm@kvack.org, ddutile@redhat.com, tabba@google.com, 
	qperret@google.com, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, maobibo@loongson.cn
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_111441_710034_B6148802 
X-CRM114-Status: GOOD (  19.09  )
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

On Sat, May 24, 2025, ankita@nvidia.com wrote:
> @@ -1636,9 +1637,19 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  
>  	vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
>  
> -	if ((vma->vm_flags & VM_PFNMAP) &&
> -	    !mapping_type_noncacheable(vma->vm_page_prot))
> -		return -EINVAL;
> +	if (vma->vm_flags & VM_PFNMAP) {
> +		/* Reject COW VM_PFNMAP */
> +		if (is_cow_mapping(vma->vm_flags))
> +			return -EINVAL;
> +
> +		/*
> +		 * If the VM_PFNMAP is set in VMA flags, do a KVM sanity
> +		 * check to see if pgprot mapping type is MT_NORMAL and a
> +		 * safely cacheable device memory.
> +		 */
> +		if (!mapping_type_noncacheable(vma->vm_page_prot))
> +			cacheable_devmem = true;
> +	}
>  
>  	/* Don't use the VMA after the unlock -- it may have vanished */
>  	vma = NULL;
> @@ -1671,10 +1682,13 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  		 * via __kvm_faultin_pfn(), vma_pagesize is set to PAGE_SIZE
>  		 * and must not be upgraded.
>  		 *
> -		 * In both cases, we don't let transparent_hugepage_adjust()
> +		 * Do not set device as the device memory is cacheable. Note
> +		 * that such mapping is safe as the KVM S2 will have the same
> +		 * Normal memory type as the VMA has in the S1.
>  		 * change things at the last minute.
>  		 */
> -		device = true;
> +		if (!cacheable_devmem)
> +			device = true;

I doubt this is correct.  "device" is used for more than just the memtype.  E.g.
hugepage adjustments, MTE, etc. all consult "device".  I.e. don't conflate device
with VM_PFNMAP.

