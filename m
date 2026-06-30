Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8DCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RtSqH+WqtZAB5cklSCb440iNsoDcg75bAXjvEoBq+ok=; b=MT2c7wShYoBcAZ3JMlPUcxLtFt
	ojY/oSozTYW1m/+hV17xT4lpknxVWsmIrCE+hCOz6Nv8iQAaWErZq1IjPVKeFjAYv50WkgSIGZtl5
	pYuSingQ9HKvjyBVqPEC0CXJ2zNVTiv6AOK2B2FCy7HCmBy/PNtNtfa8EDfpKL3gSxWblsOLUj2GG
	S9f1B+UXwMIt6H24CTG5AwRgTsoFkRbMVtI6v7x6WIaIHLNqTWqeqKYASMtilNOCwPvi5+UV1sJs+
	hkQO6mfAXMw9alixg4wfT02NKXO0IXrbNAhVIusX1TjHRux7q9Kv+Q36mzIDQaoqpLB0hC7+uKV5p
	qYRbKJsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV86-0000000GX0h-43OY;
	Tue, 30 Jun 2026 09:51:46 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV81-0000000GWzC-10jW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:51:43 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4926e5803e5so40655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 02:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782813098; x=1783417898; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RtSqH+WqtZAB5cklSCb440iNsoDcg75bAXjvEoBq+ok=;
        b=sZ3eF22D3bQGLla1Et4Dh7i4QrEJI+YaCoKsQewGPP6FNdWd6lH/LBHRID1w7d50Xz
         wQX5MZS0UERGwuO5Kaewgm4eEFGQlm4/Rl1+z+O2zudw6kP87p/n9qD8GkSe5jMQ236s
         voYzc1aEVOhG6V8VFSVK9fdJhWIB7Vz60FIyWAwkUiLMEiNWNWaruUnARj2k9oHEcVRn
         cYGW4InN8RnPo60A5d8wlKRw1wjzUuGPxlZ+IEnznGJsQO/gSPcRtr4b1jierBX+kKPw
         WWJBrVOzmfN26pvIaT2Xy6xn3gxHDm1OHUR9+GcsZMo47wq4RjeRJ8ZjfTpycRd8GBp5
         vgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782813098; x=1783417898;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RtSqH+WqtZAB5cklSCb440iNsoDcg75bAXjvEoBq+ok=;
        b=dgNh2yRnJStqe4gw5jhevMtNIH+WI05+cpIR7lLxf4ER9JUWyRry0rQuIWQZPmP44a
         gjZ0a+/CYQ7aTGLmwL7xewDfd7RiavJ57BwTHHyyht/y68cB5BcgItZBKhLWQx87qjxX
         FFNEvdujELrmXYg370pwimuS3/gGyBJvzljDyMOCXzgcTZeMZPq6GkETNWVy30OTQIsQ
         +s3IR7OEGE+PifFiKM/0io94g+1kH3QGiUX28uJbklJlasMxPO+7QVv8yrwdsPdHtkl2
         7ulUXvIJMW6P0ewg7VBoE0sdVx3FR45bNSv/oW22ipUQ/dlnvKE537DDKLKKVurznuw8
         MQfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/vlEXHAl5DCYHFd5xJg0sSHD5kFu27NOs4zJhcW56Mh/AmdGAj9iQmKylp0kfabfDFH/S7fiBfOySDiaKq+m66@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9QTSw3ZCxB0VCwGgA1nQoVXsz1VE7gJMAuxQ2cUMOmMv3kTzz
	2nNxP6IAIAPVSt+EMZIS9iPDN04lKxobENfmujucIYv5LJPz5LhifQcrxQnCaYM8nw==
X-Gm-Gg: AfdE7cna5cWyknmjyHe8oV2GyTc/QAl0WdkWXRvkXXxTyWTlyzdywHRy/YzvJpLpeYx
	FaV21fai1V+WwBOMYK8w8vfiJr+Ye2nTXOGeYQWg7Sg8qSIQ1qbMfXCkoUTB3AEe9xazHYgRTwE
	Fm2UeCjGRT5kxy2PEEtFxRwM60ZAaCQWzmK7RYxxYAlXgvRXl4dOn4SB1eYu+XN9DTOH77vFygc
	KcQne46s31VWtmK01JNn3v371RpyT+2dj/wL0/KaesV6ddEDEitRLY0JhRzbER69NA/+lOq2ENX
	+ZMPJa7GKZkesFOnqCmJbp2d4ldgebGql1IqTA/14mk/6yHsX0U81+z/JSDJndIP9IlSwhrnqXw
	2zGAwDJcoogS+8VKO6Ee+L1/5bXFWVNzYoq6k5ExxSpRSq09nJ60EdKrZZm7MUaie71JnlTcxNl
	2uUF3LGgiY8MmkvaJD9JL50yrD1M/Gp1DJhzweQ7mwQnOh5UzW582VCADiQ6M=
X-Received: by 2002:a05:600c:58d0:b0:493:adf3:d892 with SMTP id 5b1f17b1804b1-493bd76f95emr1505e9.3.1782813096603;
        Tue, 30 Jun 2026 02:51:36 -0700 (PDT)
Received: from google.com (143.11.148.146.bc.googleusercontent.com. [146.148.11.143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bb4f174esm22907135e9.2.2026.06.30.02.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:51:36 -0700 (PDT)
Date: Tue, 30 Jun 2026 09:51:30 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, oupton@kernel.org, sudeep.holla@kernel.org,
	will@kernel.org, jens.wiklander@linaro.org, joey.gouly@arm.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	maz@kernel.org, mrigendra.chaubey@gmail.com,
	op-tee@lists.trustedfirmware.org, perlarsen@google.com,
	seiden@linux.ibm.com, smostafa@google.com, sumit.garg@kernel.org,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v7 6/7] KVM: arm64: Ensure FFA ranges are page aligned
Message-ID: <akORop8Z9Levu9Sr@google.com>
References: <20260617145130.3729015-1-sebastianene@google.com>
 <20260617145130.3729015-7-sebastianene@google.com>
 <ajQmN-UQD3uJJddJ@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajQmN-UQD3uJJddJ@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_025141_348111_808A0F12 
X-CRM114-Status: GOOD (  31.18  )
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

On Thu, Jun 18, 2026 at 06:09:11PM +0100, Vincent Donnefort wrote:
> On Wed, Jun 17, 2026 at 02:51:29PM +0000, Sebastian Ene wrote:
> > From: Mostafa Saleh <smostafa@google.com>
> > 
> > At the moment we only check that the size of the range is page
> > aligned, and truncate the address to the page boundary.
> > This make an assumption that TZ will do the same.
> > 
> > However, it might decide to use the extra offset of the neighbour
> > page at the end, which is valid under FFA if NS is using larger
> > page size.
> 

Hey Vincent,

> I failed to parse this 
> 
> But I see 
> 
> /* The base IPA of the constituent memory region, aligned to 4 kiB */ 
> 
> So it sounds fair to prevent oversharing when PAGE_SIZE > 4KiB
> 

I think the problem is when you have a mismatch between FFA_PAGE_SIZE
and the system PAGE_SIZE. We expect a fixed FFA_PAGE_SIZE of 4kb and
this is enforced by :
https://elixir.bootlin.com/linux/v7.1.2/source/arch/arm64/kvm/hyp/nvhe/ffa.c#L761

if FFA_PAGE_SIZE = 4kb and PAGE_SIZE = 16kb you can end up annotating more pages with FF-A then
needed when the range->address is unaligned.

It took me a while to understand this so I guess it is better to rephrase the commit msg.

> > 
> > Harden this check by also checking that the base address is aligned
> > and reject it otherwise.
> > 
> > Fixes: 436090001776 ("KVM: arm64: Handle FFA_MEM_SHARE calls from the host")
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> 
> Perhaps the commit description needs some improvement.
> 
> The rest looks good.
> 
> Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
> 
> > ---
> >  arch/arm64/kvm/hyp/nvhe/ffa.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > index 1a2abd0154c6..d7c5701d0584 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > @@ -352,7 +352,7 @@ static u32 __ffa_host_share_ranges(struct ffa_mem_region_addr_range *ranges,
> >  		u64 sz = (u64)range->pg_cnt * FFA_PAGE_SIZE;
> >  		u64 pfn = hyp_phys_to_pfn(range->address);
> >  
> > -		if (!PAGE_ALIGNED(sz))
> > +		if (!PAGE_ALIGNED(sz | range->address))
> >  			break;
> >  
> >  		if (__pkvm_host_share_ffa(pfn, sz / PAGE_SIZE))
> > @@ -372,7 +372,7 @@ static u32 __ffa_host_unshare_ranges(struct ffa_mem_region_addr_range *ranges,
> >  		u64 sz = (u64)range->pg_cnt * FFA_PAGE_SIZE;
> >  		u64 pfn = hyp_phys_to_pfn(range->address);
> >  
> > -		if (!PAGE_ALIGNED(sz))
> > +		if (!PAGE_ALIGNED(sz | range->address))
> >  			break;
> >  
> >  		if (__pkvm_host_unshare_ffa(pfn, sz / PAGE_SIZE))
> > -- 
> > 2.54.0.1136.gdb2ca164c4-goog
> > 

Thanks,
Sebastian

