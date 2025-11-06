Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E21CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 11:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xP2QazUoPgLd8bd4CuoIUWxA+WJ3ehNooABdbD8w52A=; b=Y+aBuWP8IEoKVe6l0wal2/Qf1e
	OVhxeLrOzwXs/1qEQabJG/dDl3fySr6vyRiwPIqcwc0kCYpO0oy5urddPUrENVsPFN1QMzjb3Y1Ul
	Pan5yjBnU0I8QaaPfSp9dmuFVj92pnCJmUZdJ9RZ0n7stte0+Oy/GJHxWIuoC7CutyAny3BJB40fY
	pjvxB1ZCCm6XpQXeqsvyP/8mbm1O6Wd3DJEvSc1dcD8ahR9CYxtv305e9LcfEuIeZTSMbHoBoLjYo
	4y0Iqh+dzHMyctH8Ne6tGw09TxujA/VkHz4ERpM7b7UxGtwi7XGVIovducuHn2f1Nt2Ul2dW/iYcV
	sECxPzBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGxor-0000000FMTh-0MYB;
	Thu, 06 Nov 2025 11:06:21 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGxoo-0000000FMTB-05dD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 11:06:19 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4770d4df4deso42525e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 03:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762427176; x=1763031976; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xP2QazUoPgLd8bd4CuoIUWxA+WJ3ehNooABdbD8w52A=;
        b=OVIAEf0dRlg4THxQ7CcgpjWas1F8NbngFQNtxI9PSX91qozanqg3A0RxBA1KomHfaO
         AJjx1S7prfX6v8EgzdeOYiccEaz9eFcCVmJ+WuZIx4iih2p47rRHmJwKzjunFui8TQ3w
         0HIJGZZz/yFEclU663QvB9rmgE2SiyDCCZPDellkcxDqnVdv58GrXngzEFgBzu3lwSwN
         U/Sc9UHSyjYDD0o+GdJF56lAx80RT7zYaQcwXql45moKvR5CLGdl01p6ag9ok/sDIuld
         ER49LHN3h+KfchXALJZwFX8aeKr2hn0zx1PCbMBI2r6mApazszlFwlQmmmh6ns4ZKBS6
         pkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762427176; x=1763031976;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xP2QazUoPgLd8bd4CuoIUWxA+WJ3ehNooABdbD8w52A=;
        b=Ziqv8Wd8vw9lh5BQCg3QcOu1fTU93x+pqms0GNCPUUxrH20RDUVJA297wTq+ilb4hv
         jfcxcg1QQmWAbAcV0QDbDaKuAr8SxhtpL7MfMqjxdzZBz15dQ7F/7X3tW6n6hLCLX4aI
         OY99X4UDc09CTX1ezDPnIgrcHkQ6UzdFTJJq8jwkdHG0h7Fbons855SNFxrEwlvM2OBo
         GcvVpT73HyKWUiMABejFjBAYvt7KMD4SDw2S9iWOo+0v4OPYQqAdT1tbZgTGpFMuCuga
         S7UkjmSa9rU0WmwH4ZFxJMxHj+NtzSSjdu+Q9pFm87vlt79aqggrLW16CamyEXfBjYIv
         DiGw==
X-Forwarded-Encrypted: i=1; AJvYcCU7rP74k+951kb8DXSVYpCxsGFKQn5vK57Hroq9k0kRjtz8/w4gNrbHAiGbkQ/Ia51VTOj4iQHp9kxZddUobPFS@lists.infradead.org
X-Gm-Message-State: AOJu0YzLb1VTLVuWqWulJ/trZTs64nyhiqLELTUhxcKYuIx4inlyZTAs
	s8aVIe96bt21vfrO4hAXto3d8nvzNKlla29ii5B4AhzGuuOpG7bQQH9zY2kj6ftIGQ==
X-Gm-Gg: ASbGncvRZb7x4JDtpJvjPHpn9c9/Woq9dgRsv2RH0jqA3xzt4cbq8kgmAJdgKCNlcfr
	R+liW0LYsBohPUWgL+y5A1dWEn20KI1UVIbcIdsOVB1URsvOx6HyynrL6BJe4QKcyxmrwFJk2mg
	gsCw+Q4GtDno0KSE2R1cz8P+J4oAMwfjMaun03PEUA4/7VXTftd0gt9Q1SpN//O1B32y/L0y8LQ
	HIhs5+1SQ4jxvjR+SNnE6LF6YxSjxqpBRLSin1rFyQgN9DFq0R8neeinpdgU7zCPH/ogmaOJ4sI
	EObWSl9E9iubUOZYtzxyd3W5qW+h6UCbC7Sp6S5Pmunljsv7l3ICHs83rIyZO0lVz2sFZXiVe+0
	VT3dKKgRoFXQepwZRL5TON4C/ApFmkjyPUu7xfT1BTgMh1+Adab3YN3jDx4USpzBrsXT0xCHkuP
	Tea/Q+4MET9SHRPQZN0lfA3+mT34A8RYMpP+D1QjbM3n2huKdGNw==
X-Google-Smtp-Source: AGHT+IEUOv1ZE3UbDFaV92jPApWKF4Ndj0TjhhcPgVhbXYQBhOFnOW3XBZWOwcR3RPC6W7WWXNjURQ==
X-Received: by 2002:a05:600c:58d1:b0:475:d905:9f12 with SMTP id 5b1f17b1804b1-477628cece0mr1822875e9.4.1762427175811;
        Thu, 06 Nov 2025 03:06:15 -0800 (PST)
Received: from google.com (54.140.140.34.bc.googleusercontent.com. [34.140.140.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb49a079sm4426519f8f.32.2025.11.06.03.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 03:06:15 -0800 (PST)
Date: Thu, 6 Nov 2025 11:06:11 +0000
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
Message-ID: <aQyBIohAuxNHV-XI@google.com>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-16-smostafa@google.com>
 <aMQmA9cLaeYWG5_C@willie-the-truck>
 <aNKwROPzDCWgJBGQ@google.com>
 <20250923173806.GF2547959@ziepe.ca>
 <aNppE9A3PDiDg_1W@google.com>
 <20251002151308.GG3195829@ziepe.ca>
 <aQt9-kTCe8TpuyVq@google.com>
 <20251105171208.GN1204670@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251105171208.GN1204670@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_030618_112101_1D6EC78D 
X-CRM114-Status: GOOD (  43.08  )
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

On Wed, Nov 05, 2025 at 01:12:08PM -0400, Jason Gunthorpe wrote:
> On Wed, Nov 05, 2025 at 04:40:26PM +0000, Mostafa Saleh wrote:
> > However, that didn’t work because, as from Linux perspective the
> > nested driver was bound to all the SMMUs which means that any
> > device that is connected to an SMMUv3 has its dependencies met, which
> > caused those drivers to start probing without IOMMU ops.
> 
> ??
> 
> What code is doing this?
> 
> If a struct device gets a fwspec attached to it then it should not
> permit any driver to probe until iommu_init_device() has
> succeeded. This broadly needs to work to support iommu drivers as
> modules that are loaded by the initrd.
> 
> So the general principal of causing devices to not progress should
> already be there and work, if it doesn't then maybe it needs some
> fixing.
> 
> I expect iommu_init_device() to fail on devices up until the actual
> iommu driver is loaded. iommu_fwspec_ops() should fail because
> iommu_from_fwnode() will not find fwnode in the iommu_device_list
> until the iommu subsystem driver is bound, the kvm driver cannot
> supply this.
> 
> So where do things go wrong for you?

Thanks for the explanation, I had a closer look, and indeed I was
confused, iommu_init_device() was failing because of .probe_device().
Because of device_set_node(), now both devices have the same fwnode,
so bus_find_device_by_fwnode() from arm_smmu_get_by_fwnode() was returning
the wrong device.

driver_find_device_by_fwnode() seems to work, but that makes me question
the reliability of this approach.

> 
> > It seems device links are not the write tool to use.
> 
> Yes
>  
> > So far, the requirements we need to satisfy are:
> > 1- No driver should bind to the SMMUs before KVM initialises.
> 
> Using the above I'd expect a sequence where the KVM SMMU driver loads
> first, it does it's bit, then once KVM is happy it creates the actual
> SMMU driver which registers in iommu_device_list and triggers driver
> binding.
> 
> This is basically an identical sequence to loading an iommu driver
> from the initrd - just the trigger for the delayed load is the kvm
> creating the device, not udev runnign.

SMMUv3 driver as a module won't be a problem as modules are loaded later
after KVM initialises. The problem is mainly with the SMMUv3 driver
built-in, I don't think there is a way to delay loading of the driver,
besides this patch, which registers the driver later in case of KVM.

> 
> > 2- Check if KVM is initialised from the SMMUv3 driver,
> >    if not -EPROBE_DEFER (as Will suggested), that will guarded by the
> >    KVM driver macro and cmdline to enable protected mode.
> 
> SMMUv3 driver shouldn't even be bound until KVM is ready and it is an
> actual working driver? Do this by not creating the struct device until
> it is ready.
> 
> Also Greg will not like if you use platform devices here, use an aux
> device..
> 

But I am not sure if it is possible with built-in drivers to delay
the binding.

Also, I had to use platform devices for this, as the KVM driver binds
to the actual SMMUv3 nodes, and then duplicates them so the SMMUv3
driver can bind to the duplicate nodes, where the KVM devices are the
parent, but this approach seems complicated, besides the problems
mentioned above.


The other approach would be to keep defering in case of KVM:

@@ -4454,6 +4454,10 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	struct arm_smmu_device *smmu;
 	struct device *dev = &pdev->dev;
 
+	if (IS_ENABLED(CONFIG_ARM_SMMU_V3_PKVM) && is_protected_kvm_enabled() &&
+	    !static_branch_unlikely(&kvm_protected_mode_initialized))
+		return -EPROBE_DEFER;

That works for me. And if we want to back the KVM driver with device I was
thinking we can rely on impl_ops, that has 2 benefits:

1- The SMMUv3 devices can be the parent instead of KVM.
2- The KVM devices can be faux/aux as they are not coming from FW and
   don't need to be on the platform bus.

And this is simpler.

Besides this approach and the one in this patch, I don't see a simple way
of achieving this without adding extra support in the driver model/platform
bus to express such dependency.

Thanks,
Mostafa



> Jason

