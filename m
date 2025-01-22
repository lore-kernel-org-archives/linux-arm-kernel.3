Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10772C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 17:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rVn+04C2RZSnNCuyRNAtEoZLpXdVmoal+q/IITqcBxo=; b=UZZTIAEoZCKd2mwTH7j61p4h84
	Ah7rcvy+gl2MJmc5Fw6Y3Xwp641m9TBZXL9X7dHOcgCDURIwhZ17EVLmtL0UfgAl9t4l+N/6rbnP2
	/2vQ2Fp2fNY2h2M7C9jxKRX+r1KMsz21kxiQ3QmXsRomjduvFogmrsDCzOMH69uKq9hoZHZUQqUgE
	Q2KFU2juVWyWrMCSCdyvGXl3jiKEzXwnkDlnsUw2ZbccsB6IVMOfli/TQGNU3P7l1vsFHo1fYIxus
	gR1lngl95D7zbe2VB6I0hbSBcPJ28x7EOCMfgk9J3RgwnvfG8TRFCFm9UUDs8TJ2jGIOJoCETWcer
	1gZNCJYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taeNn-0000000AqWm-3wPA;
	Wed, 22 Jan 2025 17:19:15 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taeMW-0000000AqLO-2fsH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 17:17:57 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43621d2dd4cso71185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 09:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737566275; x=1738171075; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rVn+04C2RZSnNCuyRNAtEoZLpXdVmoal+q/IITqcBxo=;
        b=axxe+6P9wNnr/vOvYUuGaIPfKVbxFeiy3jUDsIjv/zIlv/H7fcGt7cXVjAZWcf4NIK
         VL9amsmHalfvuTlGu6mxcAo9Auh3uGS+VPS5jE1LXwpdSIJMGNSjO6/5pIaJOj5JTbdm
         xds7z/HQLUZ+ilylfJ5y+YMOd0WFRDVzCCVi5PjJGQ+lJudzExupZKo66LBmHXUf6L5L
         ur/ZZ/uCMXtHdCKD8YEShCpVY/ZM88lA6c/2Uv0FyfvGA9SmVWXrVJg6r1ktUWhTAeTL
         r+r1YFCn7HH/6khw7pWdOiwp5JbNmpaaqFSfHx2xjNPRwNxzMuE3A4dkN1PQu0C5Etd6
         5/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737566275; x=1738171075;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rVn+04C2RZSnNCuyRNAtEoZLpXdVmoal+q/IITqcBxo=;
        b=YDoHSNceGmxVrLRTBCt301IIBVlidp5JXg/oHBO5tgpCHygRbB7IThk47alfUqRe2S
         a/5E3sZ6noMl87asykDx3wlzuAeiVzHJHbQsy1gyLrjop6NWMQGvk6JXmnRiRsmpSzjv
         eLt9H5jsG8lDpwJLIDO8th3TwncOzioWFfEBvSThjBIAf/ZuZ4N91bJKfD21QChTgE9h
         zz7jXT3w6iqytwEErBDzfgLUjCEgPXkhcOAl8oHKEXmpMa4bvUnWAJAxOo2qvdOLKWqg
         ybAeFQhLISDiNwBiiZRHj8nJu3b2bOBLHlkWz4UBxd4jfda0rA+VQQCRJKmn39H95lm+
         wBPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdJVzB7+s+CB7NA24V6cmP0skpfhvEUtVo8GWI9dzp/SDjo5k4t1Tk05a/PluE0qfnp10Mo/eaEcvBfmDuYrJO@lists.infradead.org
X-Gm-Message-State: AOJu0YxvI/5+s/VKj70W9OnfrzKsFA7p4nz0COHA5yLsbtTq7hwdSPlC
	gMYASPxTThJua7NMWczJ17pQ6SiaTNoZprtlRus3k6PxL/If2aENi6fKLRzEvw==
X-Gm-Gg: ASbGncvgYc9lcbuYwlqJ4Cy/VeyjEVDGmIJBuuDzH2cFjrbxuGPgjSE3IonP9nugawT
	9dQ9xdXrS9UBLDlqOKzCpEBnZ9fB8f/7HoT6gyXkevVwUlAgoJa99t6JQRQ9yo57ZQrF9XbUH8D
	h92AiguwszqiwbS82qVoqczFhWhI4NyszEpntrHI/SOju8FKoVSf5xIM42BS7WfDFwE7nFnPTn+
	wtm6sqtyCKyDRxZKx8axWGGW6XiwZp13ZoPxANlaQieqX8XEsu9HQvDhexN47g/889rNtDge08s
	d5nqQcOx334ccHHX/lHIcwvSQC4L0Q==
X-Google-Smtp-Source: AGHT+IEcwSDzQsZnDZKS1v3rTQ17LH/kmqqhoYTY24yzjHG6NB2YOSFoasiucC8pKLaOn7Z5/gfrAw==
X-Received: by 2002:a05:600c:314a:b0:42b:a961:e51 with SMTP id 5b1f17b1804b1-438b214a8afmr1528605e9.0.1737566274993;
        Wed, 22 Jan 2025 09:17:54 -0800 (PST)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3214c5csm16835486f8f.8.2025.01.22.09.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 09:17:54 -0800 (PST)
Date: Wed, 22 Jan 2025 17:17:50 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
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
Message-ID: <Z5EoPhhU9mm9zNWB@google.com>
References: <20241212180423.1578358-1-smostafa@google.com>
 <20241212194119.GA4679@ziepe.ca>
 <Z1yNWI9lBNIZg6Le@google.com>
 <20250102201614.GA26854@ziepe.ca>
 <Z35rEeSVwfZVA9IF@google.com>
 <BN9PR11MB52767756EE35DA2359C351F08C1A2@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20250116191455.GC674319@ziepe.ca>
 <BN9PR11MB52766732572A17627D16CBAC8C1B2@BN9PR11MB5276.namprd11.prod.outlook.com>
 <Z5DQuNn3GoU1vYPV@google.com>
 <20250122162055.GV674319@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250122162055.GV674319@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_091756_673469_BA2B17BE 
X-CRM114-Status: GOOD (  22.65  )
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

On Wed, Jan 22, 2025 at 12:20:55PM -0400, Jason Gunthorpe wrote:
> On Wed, Jan 22, 2025 at 11:04:24AM +0000, Mostafa Saleh wrote:
> > AFAIK, the most common use cases would be:
> > - Devices using DMA API because it requires a lot of memory to be
> >   contiguous in IOVA, which is hard to do with identity
> 
> This is not a feature of the DMA API any driver should rely on .. Are
> you aware of one that does?
> 

I’d guess one example is media drivers, they usually need large contiguous
buffers, and would use for ex dma_alloc_coherent(), if the IOMMU is disabled or
bypassed, that means that the kernel has to find such contiguous size in the
physical address which can be impossible on devices with small memory as
mobile devices. Similarly.

I will look more into this while working on the patches to identity map
everything for v3, and I’d see what kind of issues I hit.

> > - Devices with security requirements/constraints to be isolated from the
> >   rest of the system, also using DMA API
> 
> This is real, but again, in a mobile context does this even exist? It isn't
> like there are external PCIe ports that need securing on a phone?

It’s not just about completely external devices, it’s a defence in depth
measure, where for example, network devices can be poked externally an
there have cases in the past where exploits were found[1], so some vendors
might have a policy to isolate such devices. Which I believe is a valid.

[1] https://lwn.net/ml/oss-security/20221013101046.GB20615@suse.de/

Thanks,
Mostafa

> 
> > - VFIO is something we are looking at the moment and have prototyped with
> >   pKVM, and it should be supported soon in Android (only for platform
> >   devices for now)
> 
> Yes, this makes sense
> 
> Jason

