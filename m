Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D44C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1/anwh1bqqHUf4EN9XkEDdbFNVMa1nyZcPFf3i2Ukg=; b=YhkKcP9Pa2oIYKWHWSDg87sEtj
	/rwUwXzpKjtESuTcavmoq/eawp2dO9wVLhvNHN1vPCzc/lIY0acmrxw1eoBt95IQjDVMDg8hbPTXP
	cEG99BG0f9ZjY+QeT0Vct0lG6OR2uY3zLhuVkX6bS9owxu4wMSmVZN9OV3kqBDsDtrKyNn2BueRCL
	GgFmw37t/WattD7+JSyHNYlG7JgVSxwZd4XCqk+eGRqnX9WJkCrAGIeIO/6c/Eys2XU0Si79HkWuP
	Ri+bDLAvU6TXWsh3iQhaQqeNFcBn8GF2X77LHpXfTR3u2BWmLt8VwRi5VRc7FwdoBOrWbT5xeeC2S
	4+3ilW6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulriN-0000000BICN-0wgN;
	Tue, 12 Aug 2025 16:19:07 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulmGH-0000000AVml-2xMm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 10:29:46 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-459fc779bc3so46335e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 03:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754994583; x=1755599383; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s1/anwh1bqqHUf4EN9XkEDdbFNVMa1nyZcPFf3i2Ukg=;
        b=kpdbu3wLabbA11VIYX2X8MF+tgPg4q4gllkXhR/dxRlf3Q323ecXKO/s6UpjgjssWL
         WdRA8Tl2iBV5L0e/lhC9LcPsdVlI+/ALZ7mDyKy98yHCthXuIJrQprm6nNS4eoUdIMob
         Nvmgx2/6FYYeT7Jv+dmGcnV5O5Oqnr0AfLy3+QThyN6CzsWcUHUwLDsW4W31UYAI9I26
         bgd2mfXiJOEZnQBjsESveXx91EFzuLBCzuid+7UJmceLkka+tcjztoQGlP+Z6hrB/nGn
         FV8XB7zr7DuLXhm/obbh+m5aaYsCk6n9YJjVD81AHfAWUiGk7pN0BN0nWt4pml47U/hb
         fAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754994583; x=1755599383;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s1/anwh1bqqHUf4EN9XkEDdbFNVMa1nyZcPFf3i2Ukg=;
        b=MdAmLsuLnmnzrnSuaBH7ve+NoqfMkuZJuBgn/4BKpD+9KWEKKthTe9X2pN40YBHdjP
         0zu4tbDq1k0HYoHkfAdmNLjtu6xmpJ1dxiHe9VbAH8lpf1/RzTR2cPlEJGH4wYFsFr1C
         QEChIxiUF/3vZJL2jd9YYJ/yacZOup4WI4EKD9VIBwQkoVlZmWgg1qz0P+zbR5naptKu
         naOz2N8Llj7fcoyfObgCTmUegOdoBh9zGToS9EhgxEBykZn6xyCL5yU6MJlqrnVHdm6B
         eLI18bEQB+M9LxH8bsMES6n9tRwbn5X5STAQgyKmy2yMvpPCae/fHrocCuRpmOphkdKl
         yDIw==
X-Forwarded-Encrypted: i=1; AJvYcCWaVm2B5aMAqZyWz7pI9nDSIMQDSfCfnNYgnX5y2/WYDnH/fNW9gG+tBiu+gx/VtJM4Dfl/DU8uOSnUT+69Kku2@lists.infradead.org
X-Gm-Message-State: AOJu0YyG0sPAxXXXyZbuiUUFn5EJlYSqOdThpviYhPOCKEMF0vqgnZRA
	y/5ikwmrGQiXrZmsFHD6H8mAjnEYTZJDjN06w44GicXdZ8hgyss4oaEkS2vzcqeDzA==
X-Gm-Gg: ASbGncvI8uNkIQr1G2k46eSSinzYkhhvydM57mGgf6nXD6GT1rq3aGosb66Jqh4FeMj
	EZTd0qXqts9ZNPpSeyErDVjpL/0OHKPaCoLKoIY3ylfvZFA+ioA7fD2PZ7EPRs2an2bsKp6SDux
	Qu47h6tncF9f0UNFSIaMCemCLU8LjgeYItrMkrjOzEr3FAuI61wRd4jvs0w1I43xbst4X9ctraO
	4jT5r5bBgWTUv1ffteF56F5wwZPPts+TCQd19UD1RVJLNGgRGmjgiLsCNrlHZuQXZyAacb12PFG
	2U+UWxn/OzImVJ2Fo7zhwbSscfgRva/8eacaOspso21LTp/PzQ5KhMbK/D6EMca9KzZlH1TNw/Q
	yMqrG6TBv1EVzTnZzvH8St04pt113MSUb2Y6k6Oudxw9K5kbbfSkcVOC/sOUMY9wYQZ891/8x9j
	qT
X-Google-Smtp-Source: AGHT+IHaYmnizcPqrn3Lb/9/nhKegnTEZ2frct1vzrtYBKDcVLr6eexdb/QiWRjNckapmQO/Wt9MMQ==
X-Received: by 2002:a05:600c:899:b0:458:b4ae:41a0 with SMTP id 5b1f17b1804b1-45a118d4771mr710605e9.5.1754994583250;
        Tue, 12 Aug 2025 03:29:43 -0700 (PDT)
Received: from google.com (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm43741716f8f.39.2025.08.12.03.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 03:29:42 -0700 (PDT)
Date: Tue, 12 Aug 2025 10:29:38 +0000
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
Message-ID: <aJsXkidmcSl3jUJP@google.com>
References: <aIo1ImP7R7VhRpVE@google.com>
 <20250730164752.GO26511@ziepe.ca>
 <aIt67bOzp6XS_yO-@google.com>
 <20250731165757.GZ26511@ziepe.ca>
 <aIurlx5QzEtjpFLd@google.com>
 <20250801185930.GH26511@ziepe.ca>
 <aJDGm02ihZyrBalY@google.com>
 <20250805175753.GY26511@ziepe.ca>
 <aJNiW48DdXIAFz8r@google.com>
 <20250811185523.GG377696@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250811185523.GG377696@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_032945_769314_A4AFFAE0 
X-CRM114-Status: GOOD (  51.00  )
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

On Mon, Aug 11, 2025 at 03:55:23PM -0300, Jason Gunthorpe wrote:
> On Wed, Aug 06, 2025 at 02:10:35PM +0000, Mostafa Saleh wrote:
> > I am not sure I understand, the SMMU driver will register its IOMMU
> > ops to probe the devices
> 
> You couldn't do this. But why do you need the iommu subsystem to help
> you do probing for the pKVM driver? Today SMMU starts all devices in
> ABORT mode except for some it scans manually from the fw tables.
> 
> They switch to identity when the iommu subsystem attaches devices, you
> can continue to do that by having the paravirt driver tell pkvm when
> it attaches.
> 
> What is wrong with this approach?
> 

My confusion is that in this proposal we have 2 drivers:
- arm-smmu-v3-kvm: Register arm_smmu_ops? binds to the SMMUs
- pkvm-iommu: Register pkvm_iommu_ops, binds to faux devices.
So how does attach/detach... (rest of iommu_ops) work? In that case we need
the pkvm driver to handle those. So, why do we need to have iommu_ops for the
kvm one?

> > > > Also I am not sure how that
> > > > looks from the kernel perspective (do we have 2 struct devices per SMMU?)
> > > 
> > > I think you'd want to have pkvm bound to the physical struct device
> > > and then spawn new faux, aux or something devices for the virtualized
> > > IOMMUs that probes the new paravirt driver. This driver would be fully
> > > self contained.
> > 
> > I think it’s hard to reason about this as 2 devices, from my pov it seems
> > that the pKVM HVCs are a library that can be part of separate common file,
> > then called from drivers. (with common ops)
> > Instead of having extra complexity of 2 drivers (KVM and IOMMU PV).
> > However, I can see the value of that as it totally abstracts the iommu ops
> > outside the device specific code, I will give it more thought.
> > But it feels that might be more suitable for a full fledged PV
> > implementation (as in RFC v1 and v2).
> 
> Maybe, but I'm feeling sensitive here to not mess up the ARM SMMU
> driver with this stuff that is honestly looking harder and harder to
> understand what it is trying to do...
> 
> If you can keep the pkvm enablement to three drivers:
>  - A pKVM SMMU driver sharing some header files
>  - A the untrusted half of the above driver
>  - A para virt IOMMU driver
> 
> And not further change the smmu driver beyond making some code
> sharable it sure would be nice from a maintenance perspective.

I am almost done with v4, which relies on a single driver, I don’t think
it’s that complicated, it adds a few impl_ops + some few re-works.

I think that is much simpler than having 3 drivers.
Also better for the current SMMUv3 driver maintainability to have the KVM driver
as mode, where all the KVM logic is implemented in a new file which relies on few
ops, similar to “tegra241-cmdqv.c”

I will post this version, and then it would be easier to compare both approaches.

> 
> > I had an offline discussion with Will and Robin and they believe it might
> > be better if we get rid of the kernel KVM SMMUv3 driver at all, and just
> > rely on ARM_SMMU_V3 + extra hooks, so there is a single driver managing
> > the SMMUs in the system.
> 
> > This way we don’t need to split current SMMUv3 or have different IOMMU ops,
> > and reduces some of the duplication, also that avoids the need for a fake device.
> > 
> > Then we have an extra file for KVM with some of the hooks (similar to the
> > hooks in arm_smmu_impl_ops we have for tegra)
> > 
> > And that might be more suitable for nesting also, to avoid the bind/unbind flow.
> > 
> > I will investigate that and if feasible I will send v4 (hopefully
> > shortly) based on this idea, otherwise I will see if we can separate
> > KVM code and SMMU bootstrap code.
> 
> Maybe, not sure what exactly you imagine here.. You still have your
> para virt driver, yes?
> 
> This especially is what bothers me, I don't think you should have a
> para virt driver for pkvm hidden inside the smmu driver at all.
> 
> And if we have a smmu driver that optionally doesn't register with the
> iommu subsystem at all - that seems unwise..

I was imagining just splitting all the KVM specific code outside of the
SMMU code, but not as a driver, it would be a library which “arm-smmu-v3-kvm”
calls into.

Thanks,
Mostafa

> 
> Jason

