Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283AFC98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2p6lfpmyK6oEUo0D1kSTcomcrX7eHQSl2rXfKoXoeA=; b=wqirCCv2xnvKF7ZBVo4Q1ms9+d
	5zVBGGhU9BVNL1WoxDJYDzW1J/qlGH318WJ9nMPIshSrAqzxJRqAHCkVrhqIvkKMdzYwNrGqiiLsG
	V/LEvsPVRoB3pp185Jo/rZZK5Y84XjlOY20weAqfcKzw24uS4jK5zKJWiyngnpUMVT09qWDiWmUnB
	J3MZ+TzEYzmhXrXhynRZZ0eYLnhJGmedEfK6eFI8XoyPsOMI+8xo6MY53zrdHquvJ/6uQ+QNjkOcG
	LgfI++jKoNETKWIvrLPlxEiRuNIzEqhtcc+q0TVW55afm3TMAV52+pwXuWpMVz642W35SD/WHvV6C
	Hbz12liw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PJS-00000008olZ-2AP0;
	Wed, 23 Sep 2026 15:55:14 +0000
Received: from mail-vs2-x0e.google.com ([2a00:1450:4864:3a::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PJQ-00000008ol3-0Nyh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:55:13 +0000
Received: by mail-vs2-x0e.google.com with SMTP id 71dfb90a1353d-5c8319dd4a5so523603e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 08:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790178911; x=1790783711; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L2p6lfpmyK6oEUo0D1kSTcomcrX7eHQSl2rXfKoXoeA=;
        b=dt5HnQi+sxkNdpzJF7HUoMlRWn8ZbyttChqp4WAl1CpBi51H0iLa7N7mOXp+e5qOoF
         F6FQYg9rv9EK0wCVsMsOGfwsW6AAXCKZaGb20FCQHuA+DEq9BcdgROA1O8sK+anm+1gD
         WJ1G8H8UjIiqmwWhTz+IV7fBmiDrV4PJO1hG0dmKBbSM7Q5mY8p9HUuvEfWVHsxoa2bX
         /zhE2jzbiH+sdpbxGaLplXugVhYwr2OEmTdItnxAyND9ik5mVf3viT+9oKzYE+y5+xQn
         nTDbODagtLWFgZEUbv1VQSkDJ8IWe89qjXXdG52p0r1kjQ7N5h8tz2L+kflefF+Xjl5f
         uNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178911; x=1790783711;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2p6lfpmyK6oEUo0D1kSTcomcrX7eHQSl2rXfKoXoeA=;
        b=y9clYYYzpRRomwoVEPf6xEZJPY765aO5zLmIJ/mk+4TqlXQ1sIy0v6f1SwYBCTzr9J
         FOK04ZzD0Z52MuKFCAVWj6svuELiJdLge4a0Zz08KMhyyAgLzkEbL2cNqZAigFPO0LFD
         gn6yHL+aF6UEC4e76CorACcRn82ON/OEm+2ZQT0mdhV3+oMXH3+NqKOu36HPTZdPo7Uj
         gVdvOw/3mLBNbVa3QLlF633+HhIa9MbIU9Fg+o9qeT5PSJ+6PqRab+0kop2/TBZBjDl4
         F4JMoko7kEP/6ayvHoqXPrJU5iFHCooPTR+5tWPsf2v6st3BWX3VKaVCrTx66pgvrFF7
         BNdA==
X-Forwarded-Encrypted: i=1; AKwUvByDvUhROfNjoMHNU/pzbh3YniJTNVQYvQqSnE0FGFUbItrfi/UCNWPI20m4wM/XIgtUVXN6aLEaguXWu3tBxres@lists.infradead.org
X-Gm-Message-State: AFuF++lUEFlA8aEfaOdWTq+e2RU0rH6xWkBI1B//kgGHwRyzs4PU204S
	Z+iDX4RJzXym7roW9zWbwY7qzvNk8fORlHCnF6nEKHQSRsXi1qKcdLj43aH2Yzu1btNq4r00LeM
	KQAW0
X-Gm-Gg: AYBFou1zDyxdEJUKloAyVsZGnIg/p3tdhLhYKK+XEDVMMuuy+rUokGNqI2CMJcPMHJJ
	7fCNAFGF428rKxgYdrahRINFRHisUcJDYsbtT+lxx/t6usZkuQI4o9DbovV8SU6psnyjSFlbGHK
	NamEi3OFSYzp/xQGJRufwWhmwkpJ9KD+g3ZVPyyMY902TlN8Jpm/gja4pGO+J5sHUbc6gebCtUv
	Jk0zrNQGfqsyQz0cC3fSdQ5gp7x+YcKckC4QYONt0KtPhaa+fjygD8NVdZAwh+oJpt2ZxDHwdqU
	jnIzGorkWCp6pwuRU+orVoV3nkMogSPCQMJrJmlTOJeh6MIr3eC+DRk2Ra3fe4cb9TMgyEvXo0x
	3gw6ZKvuJz459xxdIYyMtGAhHS74khoJftIXGUI8kENE/6Opisf7VKGr9msMIxT2IrMmYnW7gWW
	+6h9eciLhrv2UkIXafq5Lx/2SZnhV4n1Dxx7n55SNJKOeh9vrcQVw6DiY=
X-Received: by 2002:a05:6122:338f:b0:5c9:a60b:e5c8 with SMTP id 71dfb90a1353d-5c9f1666ee8mr3394069e0c.11.1790178910702;
        Wed, 23 Sep 2026 08:55:10 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f0551688sm3382770e0c.15.2026.09.23.08.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:55:09 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9PJM-0000000DwH2-043G;
	Wed, 23 Sep 2026 12:55:08 -0300
Date: Wed, 23 Sep 2026 12:55:07 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com, vdonnefort@google.com,
	sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v8 11/25] iommu/arm-smmu-v3-kvm: Add the kernel driver
Message-ID: <20260923155507.GJ1540250@ziepe.ca>
References: <20260922131259.2975334-1-smostafa@google.com>
 <20260922131259.2975334-12-smostafa@google.com>
 <arMbxX+sqTS3gByB@nvidia.com>
 <arO9hGmEx7c9mZAj@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arO9hGmEx7c9mZAj@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_085512_142172_D2916E79 
X-CRM114-Status: GOOD (  26.08  )
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

On Wed, Sep 23, 2026 at 11:52:36AM +0000, Mostafa Saleh wrote:
> I can add more info in the cover letter about the code split. Mainly:
> - arm-smmu-v3-kvm.c: Is the kernel driver for KVM SMMUv3 (this runs in
>   EL1 and can use all the kernel functions).
>   The main job of this driver is for discovery, it doesn't do anything
>   else in the runtime.

Maybe call this el1 stub or something like that?

guest_pkvm_stub.c
pkvm/hyp.c

?

> > > +extern struct pkvm_iommu_ops kvm_nvhe_sym(smmu_ops);
> > > +
> > > +static size_t				kvm_arm_smmu_count;
> > > +static struct hyp_arm_smmu_v3_device	*kvm_arm_smmu_array;
> > > +static size_t				kvm_arm_smmu_cur;
> > 
> > That spaces/tabs in those two lines look a bit odd..
> > 
> 
> These are tabs to indent the variables, similar cases exist in the
> SMMUv3 driver, check arm_smmu_cmdq and friends for example.

Personally I hate this style, it is a huge PITA for maintenance and
makes diffs bigger than they need to do. I remove it whenever I have
the chance :)

> TBH, this is a bit of a hack. The hypervisor can not allocate memory
> at the runtime. All of the hypervisor memory comes from a carveout
> allocated at boot (see kvm_hyp_reserve())
> 
> So we allocate the worst case for memory mapping with leaf granule. But
> the hypervisor also need to allocate L2 pointers and the SID space can
> be massive making the upper limit for this too large.
> 
> However, smmu_hyp_pgt_pages() defines the minimum pages required,
> actual allocation comes from the command line, so it is possible to
> tune the system without re-compiling the kernel.
> 
> Thinking about it now, we can just drop the 500 as this is the lower
> bound, earlier versions of this series would allocate the carveout
> based on this size, but it is not needed anymore.

I see, and you can't scan the ACPI to figure out all the SIDs used at
this point to get an exact estimation?

Not being able to manage memory after boot is rather an extreme
limitation.. But a huge amount of RMM's API complexity comes from its
granular memory management so I can't really fault that..

Jason

