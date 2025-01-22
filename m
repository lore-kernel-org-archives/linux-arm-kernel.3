Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D99C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 11:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsNhBEt0dk+OxPbn5Xdlhe7W26EoJocfUoky1jHz1O0=; b=OfK79bzGBa+VB5frV0mpsjK/qC
	L8Fr5rpIwqyN0LrS0XB1PJnBxcCTVHfl100fTpHLhDD/MQq51tEOCT2n0/yR6eo82yZGpRevYBc3s
	eWZvo+IgeI7Qq7e7yj4hATpe7PRZT3J58YlcK5EtgEfVdB2Y79lJWUVBkzHsEyw01aM8rjA7/ROLy
	7/xS0sP8kB+zsO1q+Rg++pleRb2kSVcTRDqeAS2xMxuzFLa8bqi8o44qMG3I2vnzQ02OpnXb1Wjon
	68kpw1mitzF9M5slsHGzvuhmUNhrg9DF52Cu3v8qvf/qjONxgM1u07w8uyIHDMSLt0Uj+P8cLfOcx
	EPn6vDSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taYx2-0000000A3kv-2bem;
	Wed, 22 Jan 2025 11:31:16 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taYue-0000000A3TK-3pTJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 11:28:50 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4368a290e0dso37565e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 03:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737545327; x=1738150127; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CsNhBEt0dk+OxPbn5Xdlhe7W26EoJocfUoky1jHz1O0=;
        b=YYlpJHWOd6TTd0YB6tDr0Gwkf6xdbflhJQY/BerrDN1Nn3kVsB9sEuHlC7MR3yq30S
         N3qfd5aDDLSrsNHaLE5LCV+836JXBuHqzxFHuf83qPk0tq9b7/Z+r144HdVitr31IZQC
         c1ekp7pblM4PNA/IFLjJ5E2E3Qv9NL1jZWRomTe0HNOHITlvi69pgqu8ThzFLceCPpLx
         XYycErVjpX30xebUC+fqbunBATUqGXdOVdRD0Lh/+IoFKY62p8lIGJjKNfDbgtkRJ2I3
         9cykTCMMIxXw5Es3y9/NjQf/H8vbRlTkLNJy4ki1ULzuTvEfvZtZiMcFSGYy6eaUGoLv
         iI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737545327; x=1738150127;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CsNhBEt0dk+OxPbn5Xdlhe7W26EoJocfUoky1jHz1O0=;
        b=iGODrlJ4nZ3zbX1KE8I+7IctaZPEqfaEVTDzHkUtmUIeqxW5qvQ28mUKFel+ar5Igu
         ZvPRzhuZidlRu977kICRPmRvZVwAhRxpHjDtK73DylH5ou9vV5SRSvaHsIxvqv9v2Z1R
         KPtHm0Wdv1qWrcOhh8WR37ZeKB5lRwGx27ouHhe6TPSusbhpYYcpth/n1yQfSgPvyox3
         qF/DQ3VlzIQziGsubiLwoygEe2kGHrfW8JwQUzqOn1fZ1ifRKUjHphYX5Ck+Dcl5+TlQ
         ITL1P4jAMkdcSZdlm9A6JsPUaiRjT/swYTKUcVDcI7G6GQHG77smf5xORc2qKfJBbF85
         86aw==
X-Forwarded-Encrypted: i=1; AJvYcCWfEiUVMyXSYtcpE7QBmqFLJNylKt8tCyXYWDP8XqqQwoqkj473pRs+5M0N8441jH8sZvcFa9pwSGNp6+T+pXkF@lists.infradead.org
X-Gm-Message-State: AOJu0YxN0RXMRzMPuI5BHRyY/WRXZQolrLQVaiVTXQpuIJFacQxNdMTi
	GTi757mzyv6vDsgDPBz78iYoThKIOZ1L8YNDXRyeaIw/vqexxbr4VhMM+obiDg==
X-Gm-Gg: ASbGncvBSPRmUQkGQSvCCGGYhasHiJFHQmsADiv5Lo4Xpc5qAzv4CTa6jUd2QNGBioS
	cXqYudEyyWcGS7PMwTaKkFX8tj0KMZHQVlpMHyFVFFx60yn18wO4lhkp9yLXtOpK9TKutVlMLM5
	m42nM99uVIRPWCiSatU9Kep7787p1WoVQRtGoe+DRje5gcBUzrHuqqX2QtcUEHoSXxcJRZrRPqr
	cz0VZbWqdBFj7QOiWawyY88AabeAP1ZjkUmviU3NWv3w9rCCuENBVTTYzPVWYeT0H9f1RnXIKbQ
	kNw3qT8bPviMPSUOzYk5BlgfmhWVfw==
X-Google-Smtp-Source: AGHT+IECuRWfKnePAPaGqtvOA0k5raSnulcZedW9oYouCa9keSSKkUoBJV4FBWh1VG9lH6tWjMpe+A==
X-Received: by 2002:a05:600c:1c96:b0:42c:9e35:cde6 with SMTP id 5b1f17b1804b1-438b218ae0dmr1070955e9.2.1737545327264;
        Wed, 22 Jan 2025 03:28:47 -0800 (PST)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b3124a14sm21260335e9.0.2025.01.22.03.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 03:28:46 -0800 (PST)
Date: Wed, 22 Jan 2025 11:28:42 +0000
From: Mostafa Saleh <smostafa@google.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"joey.gouly@arm.com" <joey.gouly@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"robdclark@gmail.com" <robdclark@gmail.com>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>,
	"vdonnefort@google.com" <vdonnefort@google.com>,
	"qperret@google.com" <qperret@google.com>,
	"tabba@google.com" <tabba@google.com>,
	"danielmentz@google.com" <danielmentz@google.com>,
	"tzukui@google.com" <tzukui@google.com>
Subject: Re: [RFC PATCH v2 00/58] KVM: Arm SMMUv3 driver for pKVM
Message-ID: <Z5DWag7ZKCPl1Eje@google.com>
References: <20241212180423.1578358-1-smostafa@google.com>
 <20241212194119.GA4679@ziepe.ca>
 <Z1yNWI9lBNIZg6Le@google.com>
 <20250102201614.GA26854@ziepe.ca>
 <Z35rEeSVwfZVA9IF@google.com>
 <BN9PR11MB52760686ABB3145E44BAD95A8C1A2@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BN9PR11MB52760686ABB3145E44BAD95A8C1A2@BN9PR11MB5276.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_032848_960351_00FE1294 
X-CRM114-Status: GOOD (  50.45  )
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

Hi Kevin,

On Thu, Jan 16, 2025 at 08:51:11AM +0000, Tian, Kevin wrote:
> > From: Mostafa Saleh <smostafa@google.com>
> > Sent: Wednesday, January 8, 2025 8:10 PM
> > 
> > On Thu, Jan 02, 2025 at 04:16:14PM -0400, Jason Gunthorpe wrote:
> > > On Fri, Dec 13, 2024 at 07:39:04PM +0000, Mostafa Saleh wrote:
> > > > I am open to any suggestions, but I believe any solution considered for
> > > > merge, should have enough features to be usable on actual systems
> > (translating
> > > > IOMMU can be used for example) so either para-virt as this series or full
> > > > nesting as the PoC above (or maybe both?), which IMO comes down to
> > the
> > > > trade-off mentioned above.
> > >
> > > IMHO no, you can have a completely usable solution without host/guest
> > > controlled translation. This is equivilant to a bare metal system with
> > > no IOMMU HW. This exists and is still broadly useful. The majority of
> > > cloud VMs out there are in this configuration.
> > >
> > > That is the simplest/smallest thing to start with. Adding host/guest
> > > controlled translation is a build-on-top excercise that seems to have
> > > a lot of options and people may end up wanting to do all of them.
> > >
> > > I don't think you need to show that host/guest controlled translation
> > > is possible to make progress, of course it is possible. Just getting
> > > to the point where pkvm can own the SMMU HW and provide DMA
> > isolation
> > > between all of it's direct host/guest is a good step.
> > 
> > My plan was basically:
> > 1) Finish and send nested SMMUv3 as RFC, with more insights about
> >    performance and complexity trade-offs of both approaches.
> > 
> > 2) Discuss next steps for the upstream solution in an upcoming conference
> >    (like LPC or earlier if possible) and work on upstreaming it.
> > 
> > 3) Work on guest device passthrough and IOMMU support.
> > 
> > I am open to gradually upstream this as you mentioned where as a first
> > step pKVM would establish DMA isolation without translation for host,
> > that should be enough to have functional pKVM and run protected
> > workloads.
> 
> Does that approach assume starting from a full-fledged SMMU driver 
> inside pKVM or do we still expect the host to enumerate/initialize
> the hw (but skip any translation) so the pKVM part can focus only
> on managing translation?

I have been thinking about this, and I think most of the initialization
won’t be changed, and we would do any possible initialization in the
kernel avoiding complexity in the hypervisor (parsing
device-tree/acpi...) also that makes code re-use easier if both drivers
do that in the kernel space.

> 
> I'm curious about the burden of maintaining another IOMMU
> subsystem under the KVM directory. It's not built into the host kernel
> image, but hosted in the same kernel repo. This series tried to
> reduce the duplication via io-pgtable-arm but still considerable 
> duplication exists (~2000LOC in pKVM). The would be very confusing
> moving forward and hard to maintain e.g. ensure bugs fixed in
> both sides.

KVM IOMMU subsystem is very different from the one kernel, it’s about
paravirtualtion and abstraction, I tried my best to make sure all
possible code can be re-used by splitting arm-smmu-v3-common.c and
io-pgtable-arm-common.c and even re-using iommu_iotlb_gather from the
iommu code.
So my guess, there won't be much of that effort as there is no
duplication in logic.

I am still thinking about how v3 will look like, but as mentioned I am
inclined to Jason’s suggestion to reduce the series and remove the
paravirtualtion stuff and only establish DMA isolation as a starting point.
That will remove a lot of code from the KVM IOMMU for now, but we'd
need to address that later.
And we can build on top of this code either a para-virtual approach or
nested-emulation one.

> 
> The CPU side is a different story. iiuc KVM-ARM is a split driver model 
> from day one for nVHE. It's kept even for VHE with difference only
> on using hypercall vs using direct function call. pKVM is added 
> incrementally on top of nVHE hence it's natural to maintain the
>  pKVM logic in the kernel repo. No duplication.
> 
> But there is no such thing in the IOMMU side. Probably we'd want to
> try reusing the entire IOMMU sub-system in pKVM if it's agreed
> to use full-fledged drivers in pKVM. Or if continuing the split-driver
> model should we try splitting the existing drivers into two parts then
> connecting two together via function call on native and via hypercall
> in pKVM (similar to how KVM-ARM does)?

For the IOMMU KVM code, it’s quite different from the kernel one and serves
different purposes, so there is no logic duplication there.
The idea to use hypercalls/function calls in some places for VHE/nVHE,
doesn’t really translate here, as already the driver is abstracted by
iommu_ops, unlike KVM which has one code base for everything, as I
mentioned in another reply, we can standardize the hypercall part of the
kernel driver into a an IOMMU agnostic file (as virtio-iommu) and the
KVM SMMUv3 kernel driver would ony be responsible for initialization,
that should be the closest to the split model in nVHE.

Also, pKVM have some different code path in the kernel, for example pKVM
has a different mem abort handler, different initialization (pkvm.c)

Thanks,
Mostafa

> 
> Thanks
> Kevin

