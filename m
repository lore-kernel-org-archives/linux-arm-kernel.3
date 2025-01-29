Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29334C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 12:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFFd9yC5/f0kHgmyC8Nq87cOj1SlBpm6jLMMJf6nWJo=; b=OnRvSNEbtIs+68Artgrrop4iXW
	xkK3J+K07uS8IezOWTEjg1WfRNhdq+eCr/ozlR1BvJhnctSecbmxkvaSpUY1X59UeVU2tM6O6Bwa5
	jzb4CEIUoefpZe82m0BJocCBNyWmb8sJJZpBc63/pCDixFgQv9MxdHHq1dZcyhqNoJrVi1oKjPxEQ
	xTfGkgZj8SBu317aJyYFplBmQJGjOoY8f81R64OBdMKMb10rcyUokeDIs+6rSjpKjoWq1YHea8/pJ
	xyVrzewjPdMO2tEo8PiB3kbHACex0Jg/hyEb5MUcJ7pFOWl6e8JYwhFVtp3v+fCpb7rNjsNSGEISi
	yJKB4tXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td75R-00000006vSL-2qMj;
	Wed, 29 Jan 2025 12:22:29 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td748-00000006vLy-1w0f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 12:21:09 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-438d9c391fcso85505e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 04:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738153267; x=1738758067; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AFFd9yC5/f0kHgmyC8Nq87cOj1SlBpm6jLMMJf6nWJo=;
        b=X2zTk7THRJpuxeiJkhUjDb0o9s1Hm40b9F6dirmh3pnP3F3zWznkedEzOrv3O/Ukj/
         h0xoqYr4lp7/YoZVIBM5D6UmeLkFqFdcCnZ6WfIL3m2NoAfg0HtPrSkCtqR4vGebBokq
         k7+uRwVinS85i1yhgaMCOOGogY1v6in2Kd1tn4xtap3aMVZIXo7Relx8Ca4t9kqcWJ+8
         FG6nFYacCayVM+Dvmg5LdPx1UOkizc1SOKPK4xWYAQx0HMDZeGakebg1Jkgjg4gfWFNz
         HE1s/1CBtsUQtGjD3AflSzkeR43u4xO0TUbnvI04etFYUHHxZt2JNU27XnBk/XOqizjV
         hUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738153267; x=1738758067;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AFFd9yC5/f0kHgmyC8Nq87cOj1SlBpm6jLMMJf6nWJo=;
        b=B9KPDca1RdovBOBaePS9CRPcpqw30D8B9SJjiK0wo4C3+GzguF2HVvvTZ/y37B7rSD
         O6c2zle6y9I5zbhnM8jf1ZM7oy8Rb5o9Uv3AhHzh9YCRieKXA2I4vCJ6dpb6CbeUS7gh
         ghzYiPiUTuMDEefTaW1ymBwe0HVe+mkmVQe5ih5broFBPtE9F7DWraFcdlu0KKY6SWaP
         pn2TuzH3zBEH2BoKkIOXbZiqkiWlFQzkva2hCYCB8sgZQYtTj5MlTZuW4CRtojMLhv8x
         2cPJtXG3t8MiuQD8PdH8IHQVuSlKtLj6dqmvlRwaDoQY4fQEy0J3TVSohjcjhQVu7r1R
         N7kA==
X-Forwarded-Encrypted: i=1; AJvYcCXbr0VFgVnyb8lR0vPXIXSDv5yHEk9dABQ7VskjV8D00SJ582UbOiq5N3k/3Fmte4mYXRBVvqJ3rFISkQ5QfPqG@lists.infradead.org
X-Gm-Message-State: AOJu0YxiY1gNvUdzQiQiMq/dxUNRC7w9ByWzv+qsqNZtaFLP/dPSqG5U
	/VnJPlioOpjsbTWTdZFRzwaLjkqXzHa+elCQaZOxTat/Z6kio02IkbJ5aaEfog==
X-Gm-Gg: ASbGncvza/ws+Wg5enqxgaudT0+AfXneWyjZ1kIuDaGuVlLwjzp/Fje0/uGqSrz2y8x
	q5O6MLCG7znI32meDYaHB8+ywmqhyP2zfqYk+Jd75SRBY2vJfZOArLzHTjl48ZYWL8U77pc/DcQ
	no43xIIif2Cqr/sr6+IXjrsGhEdUQCyC3c6rGIkq4azzPqOXHNNKJCzVmY882dY6a3iCBf2blqM
	cXEPauRfJbbDjeBLnhoZTngZni/cthinHaolyXc3CwxN/9xW2thmIecz7oj4O9MKDOLfwR2P7rD
	fAirPNQdUH/UT1A7gYn2fLMdHrPKT+dbkhl7pb+cY/neLr8c9bI=
X-Google-Smtp-Source: AGHT+IGIQmgNk9mmmgAHeZGEIv+1UNTnqmCcNTg78X7B3IzWsxFEcV4Tw9QmlwIksmRNHaG+4MYD7A==
X-Received: by 2002:a05:600c:1f84:b0:42b:a961:e51 with SMTP id 5b1f17b1804b1-438dc21f186mr995805e9.0.1738153266027;
        Wed, 29 Jan 2025 04:21:06 -0800 (PST)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bb0d4sm17295245f8f.69.2025.01.29.04.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 04:21:05 -0800 (PST)
Date: Wed, 29 Jan 2025 12:21:01 +0000
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
Message-ID: <Z5odLXPZPAwu4oqe@google.com>
References: <20241212180423.1578358-1-smostafa@google.com>
 <20241212194119.GA4679@ziepe.ca>
 <Z1yNWI9lBNIZg6Le@google.com>
 <20250102201614.GA26854@ziepe.ca>
 <Z35rEeSVwfZVA9IF@google.com>
 <BN9PR11MB52760686ABB3145E44BAD95A8C1A2@BN9PR11MB5276.namprd11.prod.outlook.com>
 <Z5DWag7ZKCPl1Eje@google.com>
 <BN9PR11MB5276B783D518DB354BF58A3C8CE02@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BN9PR11MB5276B783D518DB354BF58A3C8CE02@BN9PR11MB5276.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_042108_505642_077CB0E9 
X-CRM114-Status: GOOD (  42.88  )
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

On Thu, Jan 23, 2025 at 08:25:13AM +0000, Tian, Kevin wrote:
> > From: Mostafa Saleh <smostafa@google.com>
> > Sent: Wednesday, January 22, 2025 7:29 PM
> > 
> > Hi Kevin,
> > 
> > On Thu, Jan 16, 2025 at 08:51:11AM +0000, Tian, Kevin wrote:
> > > > From: Mostafa Saleh <smostafa@google.com>
> > > > Sent: Wednesday, January 8, 2025 8:10 PM
> > > >
> > > > My plan was basically:
> > > > 1) Finish and send nested SMMUv3 as RFC, with more insights about
> > > >    performance and complexity trade-offs of both approaches.
> > > >
> > > > 2) Discuss next steps for the upstream solution in an upcoming
> > conference
> > > >    (like LPC or earlier if possible) and work on upstreaming it.
> > > >
> > > > 3) Work on guest device passthrough and IOMMU support.
> > > >
> > > > I am open to gradually upstream this as you mentioned where as a first
> > > > step pKVM would establish DMA isolation without translation for host,
> > > > that should be enough to have functional pKVM and run protected
> > > > workloads.
> > >
> > > Does that approach assume starting from a full-fledged SMMU driver
> > > inside pKVM or do we still expect the host to enumerate/initialize
> > > the hw (but skip any translation) so the pKVM part can focus only
> > > on managing translation?
> > 
> > I have been thinking about this, and I think most of the initialization
> > won’t be changed, and we would do any possible initialization in the
> > kernel avoiding complexity in the hypervisor (parsing
> > device-tree/acpi...) also that makes code re-use easier if both drivers
> > do that in the kernel space.
> 
> yeah that'd make sense for now. 
> 
> > 
> > >
> > > I'm curious about the burden of maintaining another IOMMU
> > > subsystem under the KVM directory. It's not built into the host kernel
> > > image, but hosted in the same kernel repo. This series tried to
> > > reduce the duplication via io-pgtable-arm but still considerable
> > > duplication exists (~2000LOC in pKVM). The would be very confusing
> > > moving forward and hard to maintain e.g. ensure bugs fixed in
> > > both sides.
> > 
> > KVM IOMMU subsystem is very different from the one kernel, it’s about
> > paravirtualtion and abstraction, I tried my best to make sure all
> > possible code can be re-used by splitting arm-smmu-v3-common.c and
> > io-pgtable-arm-common.c and even re-using iommu_iotlb_gather from the
> > iommu code.
> > So my guess, there won't be much of that effort as there is no
> > duplication in logic.
> 
> I'm not sure how different it is. In concept it still manages iommu
> mappings, just with additional restrictions. Bear me that I haven't
> looked into the detail of the 2000LOC driver in pKVM smmu driver. 
> but the size does scare me, especially considering the case when
> other vendors are supported later.
> 
> Let's keep it in mind and re-check after you have v3. It's simpler hence
> suppose the actual difference between a pKVM iommu driver and
> a normal kernel IOMMU driver can be judged more easily than now.

I see, I believe we can reduce the size by re-using more data-structure
types + more refactoring on the kernel side.

Also, we can make many parts of the code standard outside the driver as
calling hypercalls, dealing with memory allocation...., so. other IOMMUs
will only add minimal code.

> 
> The learning here would be beneficial to the design in other pKVM
> components, e.g. when porting pKVM to x86. Currently KVM x86 is 
> monothetic. Maintaining pKVM under KVM/x86 would be a much
> bigger challenge than doing it under KVM/arm. There will also be
> question about what can be shared and how to better maintain
> the pKVM specific logic in KVM/x86.
> 
> Overall my gut-feeling is that the pKVM specific code must be small
> enough otherwise maintaining a run-time irrelevant project in the
> kernel repo would be questionable. 😊
> 

I am not sure I understand, but I don’t see how pKVM is irrelevant,
it’s a mode in KVM (just like, nvhe/hvhe where they run in 2 exception
levels) and can’t be separated from the kernel as that defeats the
point of KVM, that means that all hypercalls have to be stable ABI,
same for the shared data, shared structs, types...

Thanks,
Mostafa

