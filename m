Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBE8CD3425
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 12:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6VnYrS4OpoYLvnXY1t3ZH4F+GKUvLaqlaowydMT7CM=; b=dcqX9AYny8qW4fL7hktzxjrbde
	naVZIM152n0f0Khg3BnMe1i44r+lGXlYdvNiazYGij+UtKsHJKpLCR+if0vpR9UflE2Cb9HbPbswt
	20o0oxWTC8sBfabbrPAlUJiLblPg2JZCSzEzWW8orTS0IuI055cS8sV1N9wC0jkUL3KmMKAFqisG6
	UKhwFBOeuZVZOI1r23S0o30U9cOAsp+4txJvCAe2Vt5zS/2kCSbCpr5wMLVbnMw5twskiR/Tzw/RA
	f2EFypiGGyEuABHobHAhZuUf/qNxEfFP3vV3hBf8oZzkjOKXU6T7wj6xNxj2XUbARsTqcRrD35H9M
	Usj2dDCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wInH7-000000078LI-3idb;
	Fri, 01 May 2026 12:47:21 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wInH4-000000078Kb-3Vcw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 12:47:19 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-8a08fa355a1so26925076d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 05:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777639637; x=1778244437; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J6VnYrS4OpoYLvnXY1t3ZH4F+GKUvLaqlaowydMT7CM=;
        b=JfPmeraiy+EqTq/p8775UBa4PtBGYjcgSW2PqCjYjGST1EzKYQg9MAhnG9P7E7BWvn
         xdQ1AZm5Wd/e2Sw0psQHkPYWwDhTDBTPOVJ8mvNWb4xlRN4aF0RaoC5JQY4zW0KELbU1
         DI5W66XXisHOG02Ilemo9vMHZRphtilNsr7/u+6nEWgaIIRJ0pXMJpUNr3oPfVaqTHLU
         BVorSMYsK1z0mFQlsMOOZ3LkhVjLF6ND0M4/8598lqojQEzelQCsPvc+9MvwErkji2MG
         u/4S45I6KtapPJByi828InGM40bLoj1rtWS2MvZtAASQl2V6UorfUD7+YF010BO0k66Q
         5gVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777639637; x=1778244437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6VnYrS4OpoYLvnXY1t3ZH4F+GKUvLaqlaowydMT7CM=;
        b=OJH/dZV0QIetK7iWfbh0EPeoyn334VmOcEAxYc1QDYEWfEXzWUp4vp1Ray6G58j8ui
         udKfTV3VoZu46O4oPFW1NJz9yOjDdVQ2zDO3muv5mvlwlmh7ypmrHyauUmY9vaDshmcQ
         VW9++6mPlxvPQAxCwsa8clT6dUJodXAUlupIwN8C+GLQbZzcpkGq78BacmzxPKJIztp8
         JrjXetW4O4su+lt1s6nehPNi25NN0Ag6l6sT31VQjpU/g9XFAwvb8TTx1/Y3SFFEssND
         /LXTUjNdOPbYG84opynqvqBW5HvATuRWpLvtJyPtFk8tdYOAOsaFF4oBcdOaITA99RQu
         exxA==
X-Gm-Message-State: AOJu0Yyan/jNsjxScIRmDXPgOqT1P6IqM4liBI13NyVuHY4AyzVb4n+7
	IZvRRf3Vz+71ywOu/pDRuu2D8oAUk/YQAP43KQ+GGfJWVPCi74wefD4z+Sbudjia/Eg=
X-Gm-Gg: AeBDieurWxHlqnGQ/uCuKZscV64NFkEwruVbjhkqG2oe5Ge/NVPAIVh4q+DHr8AEDi2
	Xxe3ngtMpPn2eOR/k0hSCb6zHIf39H+NrFhEFpAj9lrUnVkEswpS95M88TKp2e4F2ROlAJ0KfwN
	Y4aUPV8lOAta6u1zF9w4oAvNxIOyRr+/3w7yeDlfqrrHvZLD2WXOHjojVmZ3tBXW6yC4qDwcn+t
	oMzCuf+ZQmpzyoPXKLJ7IHcHkk1IF7B1mMG95x/aoLMmIh9LuIi30q0kI5JHl6IfbNS4dYraExN
	UUnHLmHbfl+aQ/0JSFJKa+nXdZuR3/kTzTR0qV29EEDtkdLYo/rKGWdUCKP19wM0owspt5KpDmi
	EdSbilbn9awdU2Z2I8KgpV/liDpf6X0yktNUtSb/gNc8G3EdXpRupBhdC1ULJC+wThffZn+q0EO
	FQhjQ77AzUx3IQ05wpXkq+lc+tF/2hMf3cpSOTWj7uaHpKYy98uX63sMTAbLyLX2UEXAbR8u/0X
	aLsPp4/Sfmm6Fr/
X-Received: by 2002:ad4:5769:0:b0:8a1:34df:bbe3 with SMTP id 6a1803df08f44-8b3fe795fb9mr109078226d6.28.1777639637543;
        Fri, 01 May 2026 05:47:17 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c0e6d72sm25671376d6.26.2026.05.01.05.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 05:47:17 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wInH2-000000059zk-2EQo;
	Fri, 01 May 2026 09:47:16 -0300
Date: Fri, 1 May 2026 09:47:16 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 05/25] iommu/arm-smmu-v3: Move IDR parsing to common
 functions
Message-ID: <20260501124716.GD6912@ziepe.ca>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-6-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501111928.259252-6-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_054718_901064_9508B517 
X-CRM114-Status: GOOD (  13.79  )
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

On Fri, May 01, 2026 at 11:19:07AM +0000, Mostafa Saleh wrote:
> Move parsing of IDRs to functions so that it can be re-used
> +unsigned long smmu_idr5_to_pgsize(u32 reg)
> +{
> +	unsigned long pgsize_bitmap = 0;
> +
> +	if (reg & IDR5_GRAN64K)
> +		pgsize_bitmap |= SZ_64K | SZ_512M;
> +	if (reg & IDR5_GRAN16K)
> +		pgsize_bitmap |= SZ_16K | SZ_32M;
> +	if (reg & IDR5_GRAN4K)
> +		pgsize_bitmap |= SZ_4K | SZ_2M | SZ_1G;
> +	return pgsize_bitmap;
> +}

I think this should include:

> +	smmu->oas = smmu_idr5_to_oas(reg);
> +	if (smmu->oas == 52)
>  		smmu->pgsize_bitmap |= 1ULL << 42; /* 4TB */
> -		break;

ie it should return the supported page sizes by inspecting all the
idrs and don't leave this tricky bit to be open coded..

Jason

