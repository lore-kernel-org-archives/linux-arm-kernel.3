Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14CBC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 17:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcWB14Cn8mezh693QdjehHNThSsfRoWZAjW9od9JFCc=; b=gNulv5hJH8LdnHGeER7mH4q7Ua
	cHquv6F4/LLoeWCeS9xB0FSVht/3NlcBPLD2qXtBUMDbxDflNwwrOwG+1uxjPru6PXf+wo3hb4QHC
	1ZlDQ6H5rQq6Hx3Q3Abg/82cefvYAzIOzQ8euSxQvJ2oNwqGL5MzQ0Z/bl7O9QP9H8qCHii0QyGCX
	xazBzT4b3M0i9A4jEK4x8IzVmvkIS7GRouMi2QtsTXmQhrY4Abo/6wcmLleVHRsxA81x2l6L2yXuw
	kVs6KDMTZE94S4Kw7EsX8f/Be78Emj8+mJIEFd75XbdFopeAy/8P8fl6/d6G1rmrFrPcDpzhkU70c
	RsSR7Ahw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhX4Y-00000004AQT-28Bv;
	Thu, 31 Jul 2025 17:28:06 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhU5z-00000003o2O-1NJy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 14:17:24 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-455b63bfa52so48055e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 07:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753971442; x=1754576242; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pcWB14Cn8mezh693QdjehHNThSsfRoWZAjW9od9JFCc=;
        b=eu5XnkngwAiUtjYZqP4D9ljK586OiBt4MDi0hdyLCRIBLermQPb7xghOmKBrJoW8XM
         2qoGFaXl7MOcuAGc/yoPQfUEGwtSX5aZNZ87fyd7OZfGiGTyEpBGqOaWnjkPz5ScM7bi
         TwOV3Aua61K6lb2t+WIp+jOmUMoCE20zZi6xzHclBODDr4M0NQSHQNbarXL8YuVrtI9G
         32EuZDAPadb9Kqo7KIo1SJ4xmZ1Qz1OACyrHxu8EXKstB2GbdnSBTESazQZz4u8nOKS0
         0ndmCuziM2tKAgqUkTwOmg0ejPVcYawiF1gkt+q5PLk4B77GO4rL7itDFK6lEXqeieJA
         ksRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753971442; x=1754576242;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pcWB14Cn8mezh693QdjehHNThSsfRoWZAjW9od9JFCc=;
        b=N3San8YYD61QDRSYw5IgVDb9ytmG80LNQ5wVNhsNG5ERPduReYdUtZX+vniJzp4TQ5
         yIB+6m5acfg+vqV+66/tyMQ1fk6Kb3aZl0XTe6JkbZjixdv+gcnCFphlL+P/VAF60If/
         i3RgghEkxBoY+KewKEQhVE72TeRaeLp8BvLXRRgt/VQJ5cvX1X2BgWfk0gyvUk+uniDD
         UALd8IxPyUeBpWjByNuTpr6aQaZ3jXZysh6zVcZJ1zM2+WCgVrqzlhd8iarLcQ8+OhSV
         /knuxcChVzB7+gEq0egszaWZ8idn+782w3+a8EWrDCm6SvA+k6PiojHRzk5HLqX2GCJh
         mM4w==
X-Forwarded-Encrypted: i=1; AJvYcCWudFixHZ6NNvWRBQCbPkN9SpypSybuvnm1KE5Vd7oi2/x4+SAOHjx+4FCgPqZOn7tA8dQPPReMsiW/5lEy7vxy@lists.infradead.org
X-Gm-Message-State: AOJu0YyhFHHEbsZTEW0/vq6HhHu5e/Z4Ofo728bQRHSFFiu6YXMmD0HH
	0T1qvaRgrbdjDJX5Ui0OzLuP6H3FatVbI7iY71lgIcDrItJg5Fao8dxJYhRJnERPxw==
X-Gm-Gg: ASbGncuntFVvmdMJILTAF42J/fqlbrZ/486jQuGwN9zG/doMMZ0DdKULHLmpJUbOH5b
	TbkCfio+pNvrRm7PpsGyTy+WXTWkJcmFviPPp+rgDp9ulIslZCb4RttDMTKuDZQL6WC8gXgdsVU
	rffSY65XIrVaZUPEtY6ctaquFto/x2V1CWoaTdRhCNlcYCTqOcH6y9wjAZNV84k/emD3SOgbb+X
	o5zGK243zPdyjI+Yh/v1OSqZK0F/n7PeksD/+nAeroAsCsvbFK8v/hRbVN+XnVbgRBUv7qIhbjT
	2aDVQSnvqpyqhzbQ29Jw/uKpPYbuEcXyfj4NEJWjNras34EwVS61Ihl9RPQmOCy34JzIq6FX6nE
	Bqv8FRD92OLbjCYRpVmZ7VndvLnE3nWOx59VjwUJPcDfV6HbvMW+hXl04K0MLukk8mw==
X-Google-Smtp-Source: AGHT+IHQna8PBH+0rnLeEfLwPLu5VSthuOinGeMrMZmAiA37gK//dxUBEvZYVDk/z0ZzOGHZAGlqMw==
X-Received: by 2002:a05:600d:108:10b0:455:fd3e:4e12 with SMTP id 5b1f17b1804b1-4589f38f199mr1003195e9.4.1753971441527;
        Thu, 31 Jul 2025 07:17:21 -0700 (PDT)
Received: from google.com (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee4f0d2sm28100345e9.18.2025.07.31.07.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 07:17:20 -0700 (PDT)
Date: Thu, 31 Jul 2025 14:17:17 +0000
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
Message-ID: <aIt67bOzp6XS_yO-@google.com>
References: <20250728175316.3706196-1-smostafa@google.com>
 <20250728175316.3706196-30-smostafa@google.com>
 <20250730144253.GM26511@ziepe.ca>
 <aIo1ImP7R7VhRpVE@google.com>
 <20250730164752.GO26511@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250730164752.GO26511@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_071723_371886_DA6F9155 
X-CRM114-Status: GOOD (  50.97  )
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

On Wed, Jul 30, 2025 at 01:47:52PM -0300, Jason Gunthorpe wrote:
> On Wed, Jul 30, 2025 at 03:07:14PM +0000, Mostafa Saleh wrote:
> > On Wed, Jul 30, 2025 at 11:42:53AM -0300, Jason Gunthorpe wrote:
> > > On Mon, Jul 28, 2025 at 05:53:16PM +0000, Mostafa Saleh wrote:
> > > > Register the SMMUv3 through IOMMU ops, that only support identity
> > > > domains. This allows the driver to know which device are currently used
> > > > to properly enable/disable then.
> > > > 
> > > > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > > > ---
> > > >  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 92 ++++++++++++++++++-
> > > >  1 file changed, 91 insertions(+), 1 deletion(-)
> > > 
> > > Can you split the new iommu subysstem driver out please? I think I
> > > asked this before.
> > 
> > Sorry, maybe I misunderstood, do you mean split this patch into multiple
> > patches or split all KVM SMMUv3 driver out of this series?
> 
> Yes the latter, the iommu driver introduction is best as its own
> series

I thought about that but I was worried the maintainers wouldn't like
introducing the infrastructure first in the hypervisor without a user.
I am open to split this, but let’s see what they think.

> 
> > >  - Domain attachment looks questionable. Please do not have
> > >    attach/detach language at all in the hypervisor facing API.
> > 
> > I am not sure I understand this one, the hypervisor API has no
> > attach/detach APIs?
> > We only notify the hypervisor via “enable/disable” hypercalls when
> > devices are attached or released (as only IDENTITY DOMAIN is supported)
> > so it can enable or disable translation.
> 
> Same difference, different words.. We've had trouble with this kind of
> ambiguous language.
> 
> attach identity
> attach blocking
> 
> Keep it clean and simple

Makes sense, from the kernel point of view it will be attached to
identity/blocking domains, but the hypervisor api is just enable/disable HVC
as it doesn’t know what is a domain. If terminology is really a problem,
I can make it one hypercall as “set_state” with on/off or identity/blocking

> 
> > >  - Get the ordering and APIs right so replace works. You need this to support RMRs
> > 
> > I see, we can’t support bypass for security reasons, but we can enable
> > the identity map for such devices.
> 
> You will have a small issue if the bootup has the pkvm side put the
> device into a blocking translation then later switches to an
> "identity".
> 
> As far as I understand it display scan out buffers have to be
> continuously hitlessly mapped. So you want all the transitions from
> bootup bypass, pkvm isolation, "identity", etc to continuously
> hitlessly map the RMRs containing the buffers.
> 
> I think :)

I think that would be hard with pKVM, maybe it’s possible to achieve
that seamingless, we would need to export such devices to pKVM at
boot before de-privilege.

TBH, I am not sure what hardware does that. So, another option is to fail
gracefully if RMR exists (which falls back to the current driver) and then
pKVM would run with DMA isolation, which is the status quo.

And then RMR support for pKVM can be added later if there is interset.

> 
> > >  - Use a blocking domain not some unclear detatch idea
> > 
> > There is not a single detach in this driver, we only support attach and release
> > operation, which just goes to the hypervisor as enable/disable
> > identity.
> 
> 'disable' then.
> 
> > >  - Use a blocking domain for release
> > 
> > I see, I can add “blocked_domain” similar to “arm_smmu_blocked_domain”
> > which just disables the device translation, I will look into, I am just
> > concerned it's more code as this driver only supports a single domain
> > type.
> 
> Yes, this is the right thing. There should not be operations in the
> driver that change the underyling translation that are anything other
> than attaching domains. It becomes too hard to maintain.

Will do as mentioned above.

> 
>  
> > >  - Use the smmu-v3 approach for the fwspec, don't store things in the drvdata.
> > 
> > This is using “dev_iommu_fwspec_get” similar to the SMMUv3 driver,
> > am I missing something?
> 
> Oh I got it confused, you are just calling 
> 
> +       .device_group           = arm_smmu_device_group,
> +       .of_xlate               = arm_smmu_of_xlate,
> +       .get_resv_regions       = arm_smmu_get_resv_regions,
> 
> Which is also weird, why does an entirely new driver call 4 random functions
> in arm smmu?
> 
> Maybe don't, they are all trivial functions, or you don't need
> them. For example you don't need MSI_IOVA_BASE if the driver doesn't
> support paging.
> 

They are not random, as part of this series the SMMUv3 driver is split
where some of the code goes to “arm-smmu-v3-common.c” which is used by
both drivers, this reduces a lot of duplication.

I am not sure if we need get_resv_regions, maybe it's useful for sysfs
"/sys/kernel/iommu_groups/reserved_regions"? I will double check.

Thanks,
Mostafa

> Jason

