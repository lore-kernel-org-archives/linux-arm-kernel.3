Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46452C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 17:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+sWyggwBV1D9IUYjZa6aLkPXJtAz+OTvh2XpzdjOSmY=; b=JbXKwllf4OMJwArxGz8+OgM9bB
	hflK5R59ncjDz5eaVMkQfclLUp5t+ZohMXnyQEnl00hdBZH+TX8kKOnppDw8JMs2KG3u52kBRkt3Z
	9HtS9oAyVdom/wJ2YhQ+3nAgutOXxg9eCQ6HNEZSXlJY+ePtCqswnv6sTxz+U6lcbklfitbT1TiNE
	rd2vQiXFSRhCqAdgOwFnfMso5D3Z/yYXMZpFNIe01f6qN8iHykQEOEKe/VuJqVuGWf+19V0zpEKK8
	j4ipxTAqWvF9yUUHofriuP1z0ZxmiVetZbPluU5PEjeNrISODJ0WvECdf8bXufHGioBfREXjUPoLl
	9/KM1uXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9QRz-00000008yJ8-1gfj;
	Wed, 23 Sep 2026 17:08:07 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9QRw-00000008yIT-0X2g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 17:08:05 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49e6425f96eso765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 10:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790183282; x=1790788082; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+sWyggwBV1D9IUYjZa6aLkPXJtAz+OTvh2XpzdjOSmY=;
        b=r/H5f1BcTcdlmZtTMyquh9b/og2n71+qfyuCJRyAZr3h3FvyQhCR8p2ZH/xlLi7Stk
         V3Lt863Kme5DI38jsLgpwRKW5CU9S1qTUmGQP3B74aySdjzeg54797tMX2g1efc67Q3V
         C+ki8QADnBD8tF4nFfLFgPVjm8Yq12Ce+YsE96kpQ1HR5ef/sSUH6LjfP2yuvac4yhdL
         SiBF2VwiTwpF29d9DdrAMAf6GOCe037wbbolmx+2UM5KdXVK3Rf+V9x9WZQXL5rj7J62
         a/Mn1MZpsVEipFWb/lefnj30Wgl7cvvGMpa9iW1JQL5MvMcM6DngCU8cKMi4ilLcnqbo
         0EyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790183282; x=1790788082;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+sWyggwBV1D9IUYjZa6aLkPXJtAz+OTvh2XpzdjOSmY=;
        b=UHz/4JehkdgXiMJ2g0X9FbC302bFSwC6sBoTxSKR/ko/dCRqztUu8/Z2SrbCeTMJft
         WaTCOCXfmT2y66cqh73E4UJLl7hAH4y160YPbamYOMu0IurR1wU2VxgxEeQ5lDlb/wQo
         Kh6U2/VgeQxpseTu/IkIjtfKOsSHcxcnpXcq3Zr2TJAUVysDni/ja+pTelHtq3cos81Z
         ZkYTG4OmKwsD7fmFa+Cpm5Ei4SflZQY+qd+plPi9l6lGFSTZCoz+yvjE9LB4QZH/ZZev
         bDnhwfe1pRcBtVJR8insTDVZ4aRivwQqU8Aqp7VdHFa3ysAALa/yAjxftw75ZHqOlFU1
         e6ag==
X-Forwarded-Encrypted: i=1; AKwUvBw2qi9H3KfpSVOvK5rNb3ZXYTnTOkrNfhKQ1gpn0spD4VBW0jLTpXSF1FWwjaT03W7NQz8JjHUakhXuHPkXexeD@lists.infradead.org
X-Gm-Message-State: AFuF++n/gzMiS035o9ABcUd51rzwVKZZMS8Olh1Y7gsWbSHBTXDm90GT
	n2edvmhJNqvYkYljnfXNy3n3IoxMa8yY0EMJdc7tQdWX4cwK/Op5NTa2CuQiiYNHsQ==
X-Gm-Gg: AYBFou0SLCK0ge+6eqwVwhbUsepkcADmtPLwIYUkrBTwZLlEzAOs6KMnEUN7WEU3dNS
	dJIJJvOfiHDbZgTKAygZecFUoZ8dujXegu1Dm0aHqjQwRzgIxncq6Nwlz9E0r9tSECOanBQFgwZ
	r3tp7Bk4kbu0yMNCRquDLxF5LJvJCTsoZWudNSIT8cic2zY3eNrwUSh0g3VDLQXsfmTxhY2MzGx
	judNOs2lNWiiSG6KvXrN+4rvhfRkZL5M4LluC3cnyYUzpzUMjNphOWhyE23vM7LNxIuCjSegxdO
	pbeOCQLV+qI7wfyy7aeEkEmXA94U69Retf8H/m8gCtVpkDZ/Q6I7H/1gfPOvEbQvMKyK4fpTuO5
	Let6fPxxmQ064mSwEA9QiKXSfdhUG8cJGNqwNPeawAglMIMPEa56idOifPZ82/MADSD8bAwqMxP
	HIS4pUJQ5H80yS2T+uHozgPbGZiraFKJIPBzX/AtwTN/4qQEdqZ9DvWVTmP/XDc3lGbpclznTzv
	ZPxwk4auD0oOBXi3w0JD9NFdYBSXopffc7Fsz4S
X-Received: by 2002:a05:600c:4e8a:b0:49f:e185:f3ae with SMTP id 5b1f17b1804b1-49fe55e13a1mr140635e9.2.1790183281720;
        Wed, 23 Sep 2026 10:08:01 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5bae53dsm575695e9.4.2026.09.23.10.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:08:00 -0700 (PDT)
Date: Wed, 23 Sep 2026 17:07:54 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Nicolin Chen <nicolinc@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com, vdonnefort@google.com,
	sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v8 11/25] iommu/arm-smmu-v3-kvm: Add the kernel driver
Message-ID: <arQHamIHuaUqlJyy@google.com>
References: <20260922131259.2975334-1-smostafa@google.com>
 <20260922131259.2975334-12-smostafa@google.com>
 <arMbxX+sqTS3gByB@nvidia.com>
 <arO9hGmEx7c9mZAj@google.com>
 <20260923155507.GJ1540250@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923155507.GJ1540250@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_100804_278710_BACD02D3 
X-CRM114-Status: GOOD (  38.74  )
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

On Wed, Sep 23, 2026 at 12:55:07PM -0300, Jason Gunthorpe wrote:
> On Wed, Sep 23, 2026 at 11:52:36AM +0000, Mostafa Saleh wrote:
> > I can add more info in the cover letter about the code split. Mainly:
> > - arm-smmu-v3-kvm.c: Is the kernel driver for KVM SMMUv3 (this runs in
> >   EL1 and can use all the kernel functions).
> >   The main job of this driver is for discovery, it doesn't do anything
> >   else in the runtime.
> 
> Maybe call this el1 stub or something like that?
> 
> guest_pkvm_stub.c
> pkvm/hyp.c
> 

It is not really a stub and I was following the convention of
arm-smmu-v3-(iommufd/test/sva) I think for the pkvm/ one it can be:
- pkvm/arm-smmu-v3-pkvm.c
- pkvm/arm-smmu-v3-nested.c
- pkvm/arm-smmu-v3-el2.c
- pkvm/arm-smmu-v3-hyp.c

All of those are fine and for the other one:
- arm-smmu-v3-{pkvm, nested, el2, hyp}-init.c
- arm-smmu-v3-pkvm-el1.c

Anything along this lines, otherwise it's too vague IMHO.

> ?
> 
> > > > +extern struct pkvm_iommu_ops kvm_nvhe_sym(smmu_ops);
> > > > +
> > > > +static size_t				kvm_arm_smmu_count;
> > > > +static struct hyp_arm_smmu_v3_device	*kvm_arm_smmu_array;
> > > > +static size_t				kvm_arm_smmu_cur;
> > > 
> > > That spaces/tabs in those two lines look a bit odd..
> > > 
> > 
> > These are tabs to indent the variables, similar cases exist in the
> > SMMUv3 driver, check arm_smmu_cmdq and friends for example.
> 
> Personally I hate this style, it is a huge PITA for maintenance and
> makes diffs bigger than they need to do. I remove it whenever I have
> the chance :)

No strong opinion I can change it.

> 
> > TBH, this is a bit of a hack. The hypervisor can not allocate memory
> > at the runtime. All of the hypervisor memory comes from a carveout
> > allocated at boot (see kvm_hyp_reserve())
> > 
> > So we allocate the worst case for memory mapping with leaf granule. But
> > the hypervisor also need to allocate L2 pointers and the SID space can
> > be massive making the upper limit for this too large.
> > 
> > However, smmu_hyp_pgt_pages() defines the minimum pages required,
> > actual allocation comes from the command line, so it is possible to
> > tune the system without re-compiling the kernel.
> > 
> > Thinking about it now, we can just drop the 500 as this is the lower
> > bound, earlier versions of this series would allocate the carveout
> > based on this size, but it is not needed anymore.
> 
> I see, and you can't scan the ACPI to figure out all the SIDs used at
> this point to get an exact estimation?

I thought about it, but it is complicated to scan the DT/ACPI/platform
bus and I don't think a driver should be doing that; going through each
device with IOMMUs, duplicating existing logic...

And even with that, things as PCI won't be there as they are dynamic.

I think the best way is to remove the 500 as it is hacky, and rely
on the command line option.

> 
> Not being able to manage memory after boot is rather an extreme
> limitation.. But a huge amount of RMM's API complexity comes from its
> granular memory management so I can't really fault that..
> 

Yes, that was one of the main sources of complexity with the
para-virtual approach also.

Thanks,
Mostafa

> Jason

