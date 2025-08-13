Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C3ECA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 14:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRh53LhwzwIVu2CoRYc8EdlqoIGtiq5RV6ngg5LPmCE=; b=qZyMErYd7LOFulbJB/CId/6GAg
	+hggBkTve2qktDA2XDeSLs6J6X3hTA3yNjhJTORM52xWzu6tYar78qt7giatJ8lzynnB/dWKopYWw
	grL/I9n4s4fpauVsj6Ctqez6Vs2Q+50KPH42DZAgJxBspBKim+SJQPCzWNaVDjgoR0xEQ9P1lWCmJ
	6w70xIEN/kwjE0zxsNJlkUN/r7i94TgXZhV5udQLASgsaRxNe9Jj9hwoRVtNkEmQWv0ZKw/5cvRyQ
	QI6XQBm7M8+8/f/msBs/Jq1E36Vf7qsKgnfdhnU/KQHt09oYP6CkI4SSS2GiFho2kxEas4OvqTecx
	6fhAmNqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCMN-0000000DtZQ-2E2y;
	Wed, 13 Aug 2025 14:21:47 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBuK-0000000DpPy-2rLw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 13:52:49 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-459fc675d11so56815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 06:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755093166; x=1755697966; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yRh53LhwzwIVu2CoRYc8EdlqoIGtiq5RV6ngg5LPmCE=;
        b=rMv91PKgx3nGL7QzItcKP3dOmNcxzM/caWh33OWG2lLW0TyCaoWLZucYeHsy30myis
         m7sS+a0Rg2niYjvDuXZZGsCaw8INoAHsE0c57625oo451OQ7PvFEvu2WyLG60rlNZCOD
         kNB9gAs5o85HhTx9ORW7hdoOBY+UvzcAck0UasnxiEuCHgCl0EF2uBVSFNA/HyvPTEYp
         +Xme7K4rlKCsrdN9qUYpyIbhVLhKwQuglbTIcZZJQwO7k/jxMoEvCg1R7qd+jBI4xMN6
         dmdCJu5uhLp3iYYc2wRW1uu/hsq48P+UsFq0OezsVvo40VYhrH5csFc74wzCOcGpT5xl
         wMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755093166; x=1755697966;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yRh53LhwzwIVu2CoRYc8EdlqoIGtiq5RV6ngg5LPmCE=;
        b=FMa99qinR6BjOSWry+ZAfUK+QOHh5OQZLbvK8WOrtkmLlfoTgGoQppWRvGdBFz5hSZ
         UdsFqEXUwJpkQP8mSuNYOYE6w4bhS9AY7y+8Ou+U3nUtw3bhMXHC7K/gpYNSb+oj7FEy
         SpgNkkCg5E66rM5IAR3JZ+5V0Qpxl0wYrlmz84P/bsW888RJ/lcQPQeEe4rb1eDmdr4/
         dvR8g9uRkQ8gxiQH303mU9EG+i5hFnsPPacI4MqQgkHD+ZzAQcVH0+h/k0XSSqlKG/+c
         TWJoSewkwx70OT7y733qs8+N9nAEBJI6BOZ3CbEDkQ7HlBK3vNptlx/sNLP88o/ZF9au
         HS4g==
X-Forwarded-Encrypted: i=1; AJvYcCWBXDi118vNa2UaOctg5MQnEL23B5DkDg08qtMAq77OxxCWbgwk0iixfStYNHwk9BmLfBWFTPDBnRv3vC55IVzg@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5hzH8/Xq303XN+QQYtXGOPTyVqv7KOHWMJkn25xsz28SRZ06H
	N/6xJfl/WEeVSZ+lWnwZM92O4u58zmvWyCEhcCJkLiSZgDQoQxWZOcfYUAdrYgmcl+xNNTA3wFu
	x50Llbw==
X-Gm-Gg: ASbGncvfd7CUATa6hhtYbmH7yVn7S8+gCe2a+KgbJzSnw6hxoU20GIevmH8Ij6tj1qV
	X7eN0ROKX9/xYUA82xWXjSrMv87bKr8i8Gi+3Tlq/dDryv6JRGPhs2ZDmE0nJkDBDPlfJSr1CYC
	SnSFIqBRBW3afNCMxYGmiw0gMi4mfVLcqFDEs9w/BBHUSuQHGVmjMAY+sA4OoRelj3dIdMzMujs
	3BgSa+T1UKnKXxGxYzOU5InyaqnSu2igoD9lvQgjY9mnd+BjKrbRNSCviiJzyDw302UuZ8laVN7
	MU+W60eVjWvu2YgD++q0m4dGaIMB79OIp8fNvYTIPUo0Ei+R5vQ3Hmv7BD9dg1BXEl27X+cgHaD
	jYmPHequWycgoMvHI0xI4pw/UG4GU58eWH5IBMeJxjIZ7ZJbk6cKlBveILlaeHry4e979tcl3pq
	ws
X-Google-Smtp-Source: AGHT+IFChMgXbcY7CfRuwbBbzu+f+Z+kFs7pTSJpSto9E0MCkZ9ZxRMPiVmiGbuQ06PfA2dGw4w1jg==
X-Received: by 2002:a05:600c:4e53:b0:450:cb25:ead with SMTP id 5b1f17b1804b1-45a16e80868mr1336535e9.7.1755093166147;
        Wed, 13 Aug 2025 06:52:46 -0700 (PDT)
Received: from google.com (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a537193sm3359695e9.21.2025.08.13.06.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 06:52:45 -0700 (PDT)
Date: Wed, 13 Aug 2025 13:52:42 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v3 29/29] iommu/arm-smmu-v3-kvm: Add IOMMU ops
Message-ID: <aJyYquSQl_OfNDA-@google.com>
References: <aIurlx5QzEtjpFLd@google.com>
 <20250801185930.GH26511@ziepe.ca>
 <aJDGm02ihZyrBalY@google.com>
 <20250805175753.GY26511@ziepe.ca>
 <aJNiW48DdXIAFz8r@google.com>
 <20250811185523.GG377696@ziepe.ca>
 <aJsXkidmcSl3jUJP@google.com>
 <20250812121056.GB599331@ziepe.ca>
 <aJs1dMiomjtxVwl4@google.com>
 <20250812134808.GC599331@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250812134808.GC599331@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_065248_742071_C7DD9B48 
X-CRM114-Status: GOOD (  48.01  )
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

On Tue, Aug 12, 2025 at 10:48:08AM -0300, Jason Gunthorpe wrote:
> On Tue, Aug 12, 2025 at 12:37:08PM +0000, Mostafa Saleh wrote:
> > I see, but most of the code in KVM mode is exactly the same as in the
> > current driver, as the driver is not HW agnostic (unlike virtio-iommu).
> > In fact it does almost everything, and just delegates
> > attach_identity/blocked to the hypervisor.
> 
> How is that possible? the kvm driver for smmuv3 should be very
> different than the iommu subsystem driver. That seemed to be what this
> series was showing.. Even the memory allocations and page table code
> were all modified?
> 
> This delta seems to only get bigger as you move on toward having full
> emulation in the hypervisor.
> 
> So, I'm confused what is being shared here and why are we trying so
> hard to force two different things to share some unclear amount of
> code?
> 

Originally, this series from v1-v3(currently), just split the common
code (SMMUv3 and io-pgtable) to separate files and added a new driver
so it was a clear boundary.

But, I started re-working the series as I mentioned based on the feedback
to have KVM as mode in the driver.

IMO, there is a value in either approaches (single or 2 drivers), a
single driver is less intrusive to the current driver as it doesn't do
any splitting, and just add few hooks.

As I mentioned I open to both, not trying to force anything :)

> > In addition, with no standard iommu-binding, this driver has to be
> > enlightened somehow about how to deal with device operations.
> > 
> > As mentioned before, when nesting is added, many of the hooks will be
> > removed anyway as KVM would rely on trap and emulate instead of HVCs.
> > 
> > Otherwise, we can skip this series and I can post nesting directly
> > (which would be a relatively bigger one), that probably would rely
> > on the same concept of the driver bootstrapping the hypervisor driver.
> 
> I think you end up with the same design I am suggesting here, it is
> nonsense to have one smmu driver when it is actually split into two
> instances where one is running inside the protected world and one is
> the normal iommu subsystem driver. That's not just bootstrapping, that
> is two full instances running in parallel that are really very
> different things.

But they don’t do the same thing? they collaborate to configure the IOMMUs.
That’s how the kernel boots, it starts as one object then splits between
EL1 and EL2, which runs in parallel. At run time KVM will decide if it
runs fully in EL2 or in split mode and either do function calls or
hypercalls. It makes sense for KVM drivers to follow the same model.
See kvm_call_* for example.

> 
> > I am generally open to any path to move this forward, as Robin and
> > Will originally suggested the KVM mode in the upstream driver approach,
> > what do you think?
> 
> Well, I'd like to see you succeed here too, but it these series are
> very big and seem a pretty invasive. I'm very keen we are still able
> to support the smmuv3 driver in all the non-pkvm configurations
> without hassle, and I don't want to become blocked on inscrutible pkvm
> problems because we have decided to share a few lines of code..

Makes sense, but making changes is part of evolving the driver, for
example attaching devices looks nothing at the moment as 3 years ago
when I started working on this.
Many of the cmdq code has been reworked for tegra which is not part of
the SMMUv3 architecture.

IMHO, we can’t just reject changes because it’s invasive, or some people
doesn't care about it.

Instead based on maintainability of new changes and whether it makes
sense or not.

> 
> Are you sure there isn't some inbetween you can do that allows getting
> to the full emulation of smmuv3 without so much churn to existing
> code?
> 
> This is why I prefer adding new stuff that you then just erase vs
> mangling the existing drivers potentially forever..
> 

What I can do is to hold back v4, and I can revive my nesting patches,
it doesn’t need any hooks in iommu_ops nor hypercalls.

However, the tricky part would be the probe, as the hypervisor has to know
about the SMMUs before the kernel doesn’t any anything significant with,
but the same time we don't to repeat the probe path.

If that goes well, I can post something next week with nesting instead
of the current approach.

Thanks,
Mostafa

> Jason

