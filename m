Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4611ACCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 13:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7wtPPBtmobTf3tpzGJgjCZN1OD+0vuddCl5gz261Lk=; b=ZsOMDImzU5+b4Jz7IlNFNkiI2X
	3He1Qv3js9gJgZd2OIKJ86HZ4cjFPOGjkc21nsWswTyTb3WbaU+WVwXdMHg0qCMjgJprELRAsUBfg
	93NLARW6hUfwSVPIo9o2MQ6Ryxme/oPtjBlDLkc6cjqBU8NKvaO09BtX2xZUkpqINDUhy5LEqO2Ox
	mFF9M4vqL9KCwweqC/ca6Gfcm+Pe0S+FL2IBWm7HXLtieFz2+MPINjKUgopo2HKds2wyMgfw3I79K
	5kHVfpWP1jt4jhte0rGuXnaXJcP99OPPz0ORgX5PhpSal4C21YEiU9/+8acd0NokTdKgaUvfo78U/
	8AqWlY8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzxh-0000000FYwr-49PC;
	Thu, 06 Nov 2025 13:23:37 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzxf-0000000FYvZ-0aQI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 13:23:36 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4ed0d6d3144so9563841cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 05:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1762435414; x=1763040214; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O7wtPPBtmobTf3tpzGJgjCZN1OD+0vuddCl5gz261Lk=;
        b=YsjITA/gUqPTOgnEzOcH3ob8UMl0tX9e+Q5WQowCEQEpXaMYIct4if4qeNHUJZNEW0
         SKIh5KRLR5f2tQG84Nz6daFj5xNcd3XnTVwC4kefvSqm/fyIbQSO5km5FfpPABnYi9eG
         PHIA9+NbzR8ZoCg2IOuq6LQv+zEhvuiOm/vsdqDuCmBMnCZwps+0KC+hKRcavrbs7um4
         ggED5M0Ue9eUbnmFon+dnHJV3ULhO8IlT5X4RBgwOLp6BUNuAo5geTYd+7lXhiMmWyle
         XG6ctD4YcAzbtSRdKFO4LdW3sfDnnXXo8i/vARkMgxQA9u3b7RWLfvBmWXtTea0zvuy+
         UG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762435414; x=1763040214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7wtPPBtmobTf3tpzGJgjCZN1OD+0vuddCl5gz261Lk=;
        b=mQSXsrTKreJ1NwWUdOvens93X3J4BImb47F/lpGsfbifCuhJ2JdCnpBbemUM4JkIYI
         GbmEAUhmCSj6w9nxw68luzdeFCxccZr1y/Vg+v249tlsSs4j+csL0mzVXPQu70OenJ0j
         NTbAnY0VUIujMlIsnc9cm7twxboW0869q1g9GpgXZgjwKHnre2YqutdUT5jMjLdDnMBd
         wz5N5pFtVfQuFBwGilsfFl+AhC3SBg/kXlAMm3luocpCO3a151sjkzpRJ8RVPigYORh0
         S4wRefcii4Ws1PmpH4CQjXvclFrABXp9ltMiNtCJ6zOjhV9H3q7IziGJXzddeFOgHFWx
         EJng==
X-Forwarded-Encrypted: i=1; AJvYcCUqa6tNSgX2q4SZe3E+2iumU3zKSNF0mSJ4MZCbPlqGpjQt+5Ygh8Epv5wAGPRIEFkzJnArzajRGUP0Gum5AzkB@lists.infradead.org
X-Gm-Message-State: AOJu0YwHO2mjzWUL37X877DN6zZtzYt/hydr/1MRPqOxSpsqWSheCjam
	C0oL79G8Z2wtAHAS4zr9PtYANh5pMrrEfcYI82p7nXu/WSYffe6QaIL/WrTJD96yQHE=
X-Gm-Gg: ASbGnctT3ipwQBtkGjj7w0anMD8PTTdh7Wtjh0mLxOrxAfZYvPjELNQmxdDB7MaQl5h
	o28e9jxZwU6ucVu4i87EdOgOQx4hDmt1sWWweW+X4P0Kn6IaZg5K/L6y3s349ns1oyJBgSeiwAh
	6wVpUb3JZhjceD5Bm3xQCmls0GaSvjFZDUJBg94wlj8sCJT+lG9E92/Cyqjb43XXE4+VDGgfJzr
	0y9XGLf7Zq54qM0AnOVMMGBcYRZTtHiq61XKYZck1xHiFIocmKhSY2vT98kHV0OMw3r6GOZ8VSk
	yJo2l5fyYBg2MBeWkNKFC8Ca5EyoPGRRNWXoexFh110K2z5feegq5f05iC5oPRT4ycTblwHyI+f
	HdsI7CDIT20UAhwuUxLB9Wq0KU4e2yfLBF4nZrCwUnpqNTX5473srbApIfXVwgvYypD1NA/bV1i
	H6MntwVe7fcnWPcci5ixf9w2ouCugC561N5UvKL+Z5FE2/CQ==
X-Google-Smtp-Source: AGHT+IF7ECca/wRqtLDQUCBhDGbisYdGUoI40f4LwZi2mrfI2AA/kkhA/v5r6hx61UdEeG1jvFSALQ==
X-Received: by 2002:ac8:7d82:0:b0:4ec:f09a:4faa with SMTP id d75a77b69052e-4ed7234f780mr81238951cf.19.1762435413664;
        Thu, 06 Nov 2025 05:23:33 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ed8131b8d7sm18568161cf.2.2025.11.06.05.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 05:23:32 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vGzxb-00000007LoB-2m3P;
	Thu, 06 Nov 2025 09:23:31 -0400
Date: Thu, 6 Nov 2025 09:23:31 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 15/28] iommu/arm-smmu-v3: Load the driver later in KVM
 mode
Message-ID: <20251106132331.GU1204670@ziepe.ca>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-16-smostafa@google.com>
 <aMQmA9cLaeYWG5_C@willie-the-truck>
 <aNKwROPzDCWgJBGQ@google.com>
 <20250923173806.GF2547959@ziepe.ca>
 <aNppE9A3PDiDg_1W@google.com>
 <20251002151308.GG3195829@ziepe.ca>
 <aQt9-kTCe8TpuyVq@google.com>
 <20251105171208.GN1204670@ziepe.ca>
 <aQyBIohAuxNHV-XI@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQyBIohAuxNHV-XI@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_052335_195948_F580648C 
X-CRM114-Status: GOOD (  31.07  )
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

On Thu, Nov 06, 2025 at 11:06:11AM +0000, Mostafa Saleh wrote:
> Thanks for the explanation, I had a closer look, and indeed I was
> confused, iommu_init_device() was failing because of .probe_device().
> Because of device_set_node(), now both devices have the same fwnode,
> so bus_find_device_by_fwnode() from arm_smmu_get_by_fwnode() was returning
> the wrong device.
> 
> driver_find_device_by_fwnode() seems to work, but that makes me question
> the reliability of this approach.

Yeah, this stuff is nasty. See the discussion here.

https://lore.kernel.org/linux-iommu/0d5d4d02-eb78-43dc-8784-83c0760099f7@arm.com/

riscv doesn't search, so maybe ARM should follow it's technique:

static struct iommu_device *riscv_iommu_probe_device(struct device *dev)
{
        struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
        struct riscv_iommu_device *iommu;
        struct riscv_iommu_info *info;
        struct riscv_iommu_dc *dc;
        u64 tc;
        int i;

        if (!fwspec || !fwspec->iommu_fwnode->dev || !fwspec->num_ids)
                return ERR_PTR(-ENODEV);

        iommu = dev_get_drvdata(fwspec->iommu_fwnode->dev);
        if (!iommu)
                return ERR_PTR(-ENODEV);

It would make it reliable..

> > > 2- Check if KVM is initialised from the SMMUv3 driver,
> > >    if not -EPROBE_DEFER (as Will suggested), that will guarded by the
> > >    KVM driver macro and cmdline to enable protected mode.
> > 
> > SMMUv3 driver shouldn't even be bound until KVM is ready and it is an
> > actual working driver? Do this by not creating the struct device until
> > it is ready.
> > 
> > Also Greg will not like if you use platform devices here, use an aux
> > device..
> 
> But I am not sure if it is possible with built-in drivers to delay
> the binding.

You should never be delaying binding, you should be delaying creating
the device that will be bound.

pkvm claims the platform device.

pkvm completes its initialization and then creates an aux device

smmu driver binds the aux device and grabs the real platform_device

smmu driver grabs the resources it needs from the parent, including
the of node. No duplication.

Seems straightforward to me.

> Also, I had to use platform devices for this, as the KVM driver binds
> to the actual SMMUv3 nodes, and then duplicates them so the SMMUv3
> driver can bind to the duplicate nodes, where the KVM devices are the
> parent, but this approach seems complicated, besides the problems
> mentioned above.

I don't think you need to do this this, you can use aux device and the
fwspec things all search the iommu_devices_list to find the
iommu_driver. You don't need to duplicate anything.

Create the aux driver when the emulated smmu is ready to go.

> That works for me. And if we want to back the KVM driver with device I was
> thinking we can rely on impl_ops, that has 2 benefits:

> 1- The SMMUv3 devices can be the parent instead of KVM.
> 2- The KVM devices can be faux/aux as they are not coming from FW and
>    don't need to be on the platform bus.

IMHO this is backwards. The kvm driver should be probing first, the
smmu driver should come later once kvm is ready to go.
 
> Besides this approach and the one in this patch, I don't see a simple way
> of achieving this without adding extra support in the driver model/platform
> bus to express such dependency.

You shouldn't need anything like this.

Jason

