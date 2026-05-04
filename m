Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39C4FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 12:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fF7JaMofibfK5YJZe9N2mfIM5JCfx6a/BKfKMnCAPBc=; b=F6n+6aO05Zd5uyCo4i7ZO7u20n
	6/EtqHxNVKSFlc4b6LFrJ+rCICfus2woSgLqU9Jq25ki1yySWGpn5GTYucGiJXPIAYAPgO0nuOnFx
	VsdS2xvimA/YQx25znQx+0nEnn4PRHdtghsPAg0ppHc6ODuPRQ+ryjvNo0VbQKVQ5nNLekY2Q6sYI
	fV7D/K9abCPOM6Bay6a1UPwr5/yESib3IPP27eTB2QAru1JwPNu5sM1FFiIWrtnvJ8ByDuiB9hmtk
	wik2Zo7Y5vvZLnD9vmCoVjxcnm7ecMPkb6Nee4OoeKVcW10IXQNnEGbjbGV+0LZc3o+NnZqr5TUFq
	plfLW5yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJsCu-0000000D8Et-312C;
	Mon, 04 May 2026 12:15:28 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJsCs-0000000D8EN-0xI6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 12:15:27 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4891ad5c074so202575e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 05:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777896924; x=1778501724; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fF7JaMofibfK5YJZe9N2mfIM5JCfx6a/BKfKMnCAPBc=;
        b=JD75A87urJ5wfT2ntLN79tzbrkgI9NDLsIEKa7oGRbasNPKzzs6BCSfYEVOKDi2Yrc
         9sfbtAvsbwtgvkVQ0IRucrWJ+pCnjZEYkE8XIypf9Vm54QbCUqRK3Rm+YtZjGvMNtaOn
         EcK7e2vQr51+MkRUHt3wlZU2MMsy7kY2z96lHjPKt8MMgJ1dPdbCpDJOcP3DEE/1E36x
         QOeN/tIRG+hKI5NjQxSRGErceNqtS1D/hcdssntcAGEdau/tJVxwj5npvZLSonYpV6fA
         i2VhZ+ko1Yaa/+yxYqIym7TIB7HC4ylYp8tyQXjKbFquJpUpucEjIatRSasLjF6TM5AS
         uogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777896924; x=1778501724;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fF7JaMofibfK5YJZe9N2mfIM5JCfx6a/BKfKMnCAPBc=;
        b=aQfUKklteev5+xIZfOIhPnBicXy0WuaSjpx74f7pysIwv+FRuSmZULA5fG0I2d72/S
         LZf3TJsPjEsF1U+j/zxkltuyeb1SGLIr9ncu5cj6x8xrBlmlFF2lZ3DVodg6vjIUBjYT
         9lCZFp6bGGMhWjV4mN8dHAiKRwvb8ewrVkICI7y3XWVXThU+FXvhF86LbSl11hA8C+3x
         lHEpGOQajwCD7MgzisYcHsk2PXHX2Zy445xpOQFySZCmnkkAlhvvu6HFX6I/RRnqMPlX
         z5ol8/W+ahvV251iatBKaj0XPFQUsu4tHcunuMayQiKD3xRTMVY5alxnCpyhncdljIK7
         wC0A==
X-Gm-Message-State: AOJu0YxT4iyxFqjIZsu+Cvv2h3HHljyBgkdbObQujbzWbxqHwzCB1Sqx
	EmXnLksAAcRmkVz5OptrZM77YWDralAxyYz81VQ0el6++lQHr0zHZY0NwHRB6GBFJt9wQrK+gHB
	BZjW4eQ==
X-Gm-Gg: AeBDiev2E3cS3gVJL2EorN4lbECU/bWDBoN9+tNGOEUIwKWdCnTdnde7uRXuBkqrMYh
	TeFjB6bjn0+mPYZLTX8jomyXssrSQh+MI1+LlfzCWnL6+KfCPk+b44KU0uHfYn+43VOaeaoDi3W
	3nVWwae7WvvVZiykQ1pGCGM/RWcYj/juPWyHEidjh0Xpq697SakRkjmrJhOnppxJYBwnJRsqEcE
	qeYWWNOPtkCHpzVQSpfljyCJuc4aQ/ojb4dpnzLPitenPRau2n/oZaB3ZdD2RbXyitIz3ggYU/D
	SDLVNwCG/cRaCeFFGKsReBbUlcw1g6Z3R8+wbzVnEHlIeZ2J5YTqRSAi847b/2H93mvKpjkxbTO
	160fEUjMxvuL4A+NHdEjd0Q9zg+GgIO/LGb/vnL+Kw/DgM4GCHFO0X1Nw9GBZ1iU2faOagBYv84
	vOS+16bQYpP47gMd5q0H3AKLVqSi2WioSoZY+fRh8Fx86UGwT4/IxhNqbBS4UkpnxB0a61f2rgF
	HZrBA==
X-Received: by 2002:a05:600c:8206:b0:485:2ab4:c1f9 with SMTP id 5b1f17b1804b1-48a9810f468mr968965e9.4.1777896923958;
        Mon, 04 May 2026 05:15:23 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fe4b4edsm100731345e9.0.2026.05.04.05.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 05:15:22 -0700 (PDT)
Date: Mon, 4 May 2026 12:15:17 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 04/25] iommu/arm-smmu-v3: Move TLB range invalidation
 into common code
Message-ID: <afiN1UwS9q6F6A_v@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-5-smostafa@google.com>
 <20260501124143.GB6912@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260501124143.GB6912@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_051526_306829_415A3C52 
X-CRM114-Status: GOOD (  29.70  )
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

On Fri, May 01, 2026 at 09:41:43AM -0300, Jason Gunthorpe wrote:
> On Fri, May 01, 2026 at 11:19:06AM +0000, Mostafa Saleh wrote:
> > Range TLB invalidation has a very specific algorithm. Instead of
> > re-writing it for the hypervisor, move it to a function that can
> > be re-used.
> 
> I think this is too narrow.
> 
> You should start at __arm_smmu_domain_inv_range() and shove all of
> that callchain into a new file "arm-smmuv3-tlbi.c" which you can then
> double compile for pkvm.
> 
> pkvm would have to present the tlbi description and the invs array
> which shouldn't be hard for it. Then it will enjoy all the same
> hypervisor optimizations we are working on for the normal driver.
> 
> I am about to send a patch series here for iommupt that significantly
> alters this. I think it will help your pkvm effort as the invalidation
> entry point becomes significantly decoupled from the
> iommu subsystem:
> 
> static void arm_smmu_domain_tlbi_inv(struct arm_smmu_tlbi *tlbi,
> 				     struct arm_smmu_invs *invs)
> 
> struct arm_smmu_tlbi {
> 	struct arm_smmu_domain *smmu_domain; // Can be removed 
> 	unsigned long start;
> 	unsigned long last;
> 	u8 leaf_levels_bitmap;
> 	u8 table_levels_bitmap;
> };
> 

I am not sure if it’s worth it, the hypervisor is much simpler, there
is a single page table, it’s locked (also identity mapped), it’s
updated on VM boot/teardown only, we don’t even use iotlb_gather at
the moment, although possible but I wanted to keep this series as
simple as I can then we can add more features later.
So this patch is the least intrusive change, as whatever the main SMMUv3
driver does, the range tlb invalidation logic is the same.
But I am happy to experiment with that when posted.

Thanks,
Mostafa


> Which pkvm should have no trouble invoking. It has to build an invs,
> but I guess that is pretty simple and done once at boot for pkvm?
> 
> Once done all the fiddly bits about building the commands would be
> shared. There is really no reason this should differ anyhow.
> 
> https://github.com/jgunthorpe/linux/commits/iommu_pt_arm64/
> 
> cover-letter: Organize SMMUv3 the invalidation flow so iommupt can use it
> 
> Jason

