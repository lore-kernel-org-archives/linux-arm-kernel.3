Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4370CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qy5jSwN7S6PcN2+UAQhcACOnAgI06MV590m9VcIejho=; b=Cev4jm3o2B4XumQ0DamqajLQbt
	icwArLgx9pgEOszSgQNzXR8RgTH75Dn9kH7CtcUnGLBhD0NHJf/KTmMDhKY3L7qBeIcVC1y3xL53s
	dzgKayPMQdIdNM6d8MdLmz7+gUNfKip2MX2lbMzO8ZcoVPPXgaCt2sWzAzSHTp2FNlAGiFrdmOwuc
	AHc7yoVdJjTvFeJc3AsR0gF2Lb8Vlwx4PBADGcFdjGubPgPoTFi7kZcbKsmSNi6uU3YUUJlkzlYJI
	BRs5jdX3baCpb+3OiQwVy7Iaj6iIsqdpELb8PLKgkUEA90gU3VCibsJ7GC01g62fesVvhHIU3efvr
	J3GZiMvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3G6-0000000Fy13-1gpJ;
	Thu, 06 Nov 2025 16:54:50 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3G2-0000000Fy0Y-28mV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:54:48 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47754e0a13bso86525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 08:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762448083; x=1763052883; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qy5jSwN7S6PcN2+UAQhcACOnAgI06MV590m9VcIejho=;
        b=MjXsEVdho+viKgtNt5IH8ENHMY6AN/Ex55tmGbYd4FTPwHqJuf7KrCChGcM0xG+wGZ
         pWJT+BXLUd4FLH3KERIS2OJ3GponrRJwgo7noDYT05JzJuyDsUwgYjimiL8DGYvyXR6h
         cwXLXSmxcDObB79XCVg3fhq41YtK6hY0hgBYser/60w1Bf29+ktJhOWmThv0H97gkJhX
         0WjsHHWCY/YKTx5c863nd/Z5efBOQS4eYLv6U0xg6zCH97Gy74oR/4pew3xCucsAn45/
         usIcQUtXzl7cCSRJuQsBp7KLxUqFmZPegmYdJKo8nn5Nld9ikx4jvEY4Mf85hqCnc9Q4
         la8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762448083; x=1763052883;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qy5jSwN7S6PcN2+UAQhcACOnAgI06MV590m9VcIejho=;
        b=ffZcNaEESgDlqYYaiYsNQ4fP7lJzXiP19TXhscUA3O2u7CY+PENb5O49DVbKkzNn/X
         H5ADtL3VKYAmOMXauRAKpVxUQ/kZeR5Cbfh9mvwEr+ILkPHo+w4fTVmxhOTWtGueIdz6
         yoUYjaFbZxXBZ9Y49i8ct7bJK7nvny9yz9lVUJNiB8SdkMIeKdNVvAwPyr0EpdTyMtEm
         2+d4ieliw8cIqpN2e2i93yZwv+jWIiOqii5uvrNSAoVWJjEALON4wi5eTxz56tgeyUln
         yC2Qhx82rdOElYF4JvJszx19md6YSXJUVEshGmDIZ6TVpUWkYvNlHM5sKjuq2T5/+8nv
         rSBA==
X-Forwarded-Encrypted: i=1; AJvYcCXdWEqh6NUGjF0RoHS6KatZSeB6vhVuMSsiJ00b+tya4hmO+CKy286lPKLHMwPPFm2rBufVwtOua+DguKNQOFZj@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp1XiVI/uUZRpbxGKJt/2P2nMd/gV8QnoFRzjszhTXaPtPZHX7
	oprS2ergp0gIcM1FVdtYxctwemYP6mbjEWCeR7HqMfU1HaSNVEnl7mh5SVqIAjluKXFhtOxdQFa
	YbCFBQA==
X-Gm-Gg: ASbGncvTB/F3Q5R9cyu0bpwlWW9DUwz8ZA52d+01lw4+e7uZXG9pQxEUjGSsc1ytmCI
	5lHVNmZEa4sfeoas12FvdXIE7oaY50+dyyzSpgK2ae8s8bBu4N2NJc8K9n+Ve5BRuXQHkGXtCvE
	YuLTyO4jMgXdAr6NGgy8SG7BCgqH/CaNOxzTKS5+EzbDEAybF7UUx8AOS3KVZaz/eSH/7DT4k+O
	NAHkvHeq1UoUk4wDwpm3WsfjMHpwaScOGYkNn4qdYnIFQTurO0KFV95xoXDF8jcAOYu6phwhGdM
	mE0MmZiWLz4aCS6v5ekRqF8qPcjw5/6H9nx4ds2qW+V9JrIs0JIwGD9ML6kk68u7Ol2ivct1qfk
	/IFdDmMb8+7FTKBWpnWZy/quth3hKt4+1uZESCd1IlqxCQSl/JN+hENuWB/eWHzz5xvDpiyU2nQ
	c9CqhXcylv5clCZ6ooPowyQanBb3zs/VhROtamFZYqhyemiKaYSvVqFVr2rWGu
X-Google-Smtp-Source: AGHT+IH9Sel42fS+BYooq+9ScS2mxKoFKXpJsaK/tHTCGPR8SBDeDrXp6AvREwD204lt8g8KrZ9JGg==
X-Received: by 2002:a05:600c:c10f:b0:477:1afe:b962 with SMTP id 5b1f17b1804b1-4776410ec16mr2231445e9.1.1762448083254;
        Thu, 06 Nov 2025 08:54:43 -0800 (PST)
Received: from google.com (54.140.140.34.bc.googleusercontent.com. [34.140.140.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce210a7sm120476545e9.12.2025.11.06.08.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:54:42 -0800 (PST)
Date: Thu, 6 Nov 2025 16:54:38 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 15/28] iommu/arm-smmu-v3: Load the driver later in KVM
 mode
Message-ID: <aQzSzhcndQ3Ry0a2@google.com>
References: <20250819215156.2494305-16-smostafa@google.com>
 <aMQmA9cLaeYWG5_C@willie-the-truck>
 <aNKwROPzDCWgJBGQ@google.com>
 <20250923173806.GF2547959@ziepe.ca>
 <aNppE9A3PDiDg_1W@google.com>
 <20251002151308.GG3195829@ziepe.ca>
 <aQt9-kTCe8TpuyVq@google.com>
 <20251105171208.GN1204670@ziepe.ca>
 <aQyBIohAuxNHV-XI@google.com>
 <20251106132331.GU1204670@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251106132331.GU1204670@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_085446_592874_83E80E6F 
X-CRM114-Status: GOOD (  41.47  )
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

On Thu, Nov 06, 2025 at 09:23:31AM -0400, Jason Gunthorpe wrote:
> On Thu, Nov 06, 2025 at 11:06:11AM +0000, Mostafa Saleh wrote:
> > Thanks for the explanation, I had a closer look, and indeed I was
> > confused, iommu_init_device() was failing because of .probe_device().
> > Because of device_set_node(), now both devices have the same fwnode,
> > so bus_find_device_by_fwnode() from arm_smmu_get_by_fwnode() was returning
> > the wrong device.
> > 
> > driver_find_device_by_fwnode() seems to work, but that makes me question
> > the reliability of this approach.
> 
> Yeah, this stuff is nasty. See the discussion here.
> 
> https://lore.kernel.org/linux-iommu/0d5d4d02-eb78-43dc-8784-83c0760099f7@arm.com/
> 
> riscv doesn't search, so maybe ARM should follow it's technique:
> 
> static struct iommu_device *riscv_iommu_probe_device(struct device *dev)
> {
>         struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>         struct riscv_iommu_device *iommu;
>         struct riscv_iommu_info *info;
>         struct riscv_iommu_dc *dc;
>         u64 tc;
>         int i;
> 
>         if (!fwspec || !fwspec->iommu_fwnode->dev || !fwspec->num_ids)
>                 return ERR_PTR(-ENODEV);
> 
>         iommu = dev_get_drvdata(fwspec->iommu_fwnode->dev);
>         if (!iommu)
>                 return ERR_PTR(-ENODEV);
> 
> It would make it reliable..

That makes sense, and it will address the problem Robin was solving also:
https://lore.kernel.org/r/6d7ce1dc31873abdb75c895fb8bd2097cce098b4.1733406914.git.robin.murphy@arm.com

> 
> > > > 2- Check if KVM is initialised from the SMMUv3 driver,
> > > >    if not -EPROBE_DEFER (as Will suggested), that will guarded by the
> > > >    KVM driver macro and cmdline to enable protected mode.
> > > 
> > > SMMUv3 driver shouldn't even be bound until KVM is ready and it is an
> > > actual working driver? Do this by not creating the struct device until
> > > it is ready.
> > > 
> > > Also Greg will not like if you use platform devices here, use an aux
> > > device..
> > 
> > But I am not sure if it is possible with built-in drivers to delay
> > the binding.
> 
> You should never be delaying binding, you should be delaying creating
> the device that will be bound.
> 
> pkvm claims the platform device.
> 
> pkvm completes its initialization and then creates an aux device
> 
> smmu driver binds the aux device and grabs the real platform_device
> 
> smmu driver grabs the resources it needs from the parent, including
> the of node. No duplication.
> 
> Seems straightforward to me.

Maybe I am misunderstanding this, but that looks really intrusive to me,
at the moment arm-smmuv-3.c is a platform driver, and rely on the
platform bus to understand the device (platform_get_resource...)

You are suggesting to change that so it can also bind to AUX devices, then
change the “arm_smmu_device_probe” function to understand that and possibly
parse info from the parent device?

One of the main benefits from choosing trap and emulate was that it
looks transparent from the kernel of point view, so doing such radical
changes to adapt to KVM doesn't look right to me, I think the driver
should remain as is (a platform driver that thinks it's directly
talking to the HW).
The only thing we need to do is to make the SMMUs available after
KVM is up (at device_sync initcall).

> 
> > Also, I had to use platform devices for this, as the KVM driver binds
> > to the actual SMMUv3 nodes, and then duplicates them so the SMMUv3
> > driver can bind to the duplicate nodes, where the KVM devices are the
> > parent, but this approach seems complicated, besides the problems
> > mentioned above.
> 
> I don't think you need to do this this, you can use aux device and the
> fwspec things all search the iommu_devices_list to find the
> iommu_driver. You don't need to duplicate anything.
> 
> Create the aux driver when the emulated smmu is ready to go.

See my point above.

> 
> > That works for me. And if we want to back the KVM driver with device I was
> > thinking we can rely on impl_ops, that has 2 benefits:
> 
> > 1- The SMMUv3 devices can be the parent instead of KVM.
> > 2- The KVM devices can be faux/aux as they are not coming from FW and
> >    don't need to be on the platform bus.
> 
> IMHO this is backwards. The kvm driver should be probing first, the
> smmu driver should come later once kvm is ready to go.

Agree.

>  
> > Besides this approach and the one in this patch, I don't see a simple way
> > of achieving this without adding extra support in the driver model/platform
> > bus to express such dependency.
> 
> You shouldn't need anything like this.

Agree.

Thanks,
Mostafa

> 
> Jason

