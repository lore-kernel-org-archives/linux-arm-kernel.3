Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F23C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 18:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jr6COAzZQd1YZD6Knd07jyj5Q1nEe5SAc40WyTUG0tI=; b=IB/Y8pkz/6HFG3OMNU24JBqODy
	3PuR7MrEulyqYNJnoqZdp1AIFriZmY73cQeULHqCtfw6rxOawKuuo1fkV4IFZ2wMPqtLifxU1OX3r
	U7G07mKfNrCNp60tZLSU+iOZjdY1XDUZPIPvTtqKuedgqU7126S3uf/z4lXS/a2ZvTSMC+kYqxMhx
	6j4vM5a9j45n+tBL5MIGD44v0XwmJY26R16uNJnK423FSmEDHnJxS3JDHlMrLooNIHxTLDM+y1SdY
	W2DdU/C6nLPSRWhi+ZhJO2+H64GJEsszcy3Yj+J6DBgS0gx08ctR0rCnsgs3OLmoDf0zcwf+gRipI
	aasv4F/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhXm6-00000004Ebi-2x5T;
	Thu, 31 Jul 2025 18:13:06 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhWbQ-00000004809-0akW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 16:58:01 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7dfdcded923so117192285a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 09:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1753981079; x=1754585879; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jr6COAzZQd1YZD6Knd07jyj5Q1nEe5SAc40WyTUG0tI=;
        b=CZIqAeYaZx28tSr4w/sNNorCD5g+iFe1bxAaLDEEdEtzj5M7NPYS9y6miLKow4iKWz
         1gRqNX0kanduh2JsvEO3w8bD6gWafjaHSCCn7vD+Lkc5LwEi+srs/wrJzv4u+mfYuw0w
         UNk23HE83XwM1wwp77iX8ef1oL0ADiSS15x2GoZhn+0pGiRUnqDqp8+2HNQUKfrsx44Z
         cW5z6Et/ZGmrrRU8E+2iaiurPnMYXuxXTI2osRmQsHEqkHEUaYOoY/gxjmxAYowN1Ddq
         d9kLsqgU6jbKNaN0UZFPjnT1Btw3+gIToFqaSL5kwWkF6NK5uhibJjKMbkKspkQB6xuM
         EnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753981079; x=1754585879;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jr6COAzZQd1YZD6Knd07jyj5Q1nEe5SAc40WyTUG0tI=;
        b=JcLSgshIQodZVkRAs6TgFE6YOyYYrej2+OjtjWiNWMvNgCBlkn0mH8lMBtxP0GFr3V
         slR6JFcVrE2gmHJilmHFYgwO4Lkp6msSTBEpTCDQUHJ1NZ/puI7FY6f8qGEZUBTV+Xux
         ukX9QzRVuiWi2PN+6faBeRDFl4GraWe3OKJhx1Pyoa564JNAoaSQIb7EgW8YncirznNj
         2FgA7mhsJswtNIOTouW7TCU930GVIo2KwbxNQQ/LwmKF4mwupUGqC9DJt7jbcTCrRmJD
         yA5zn5SNk3s8ORUdu3QsWeHCiZmVU9D/cYvoybohc0FjCOf0qqa8VbztbllTDWjVDGlK
         KfJg==
X-Forwarded-Encrypted: i=1; AJvYcCU78SzYfr+LzZGAuZRkW14xY7JPmgGsH7XVRlGae+m13mKfAYoBY0T9NpxeLY6CwidDYyYfa6a7vLvJWBWMsPKt@lists.infradead.org
X-Gm-Message-State: AOJu0YwGxN9I9KWxe0Lqo575k9ccECN3VQZuoOyt78sRl12SVl9UWxg7
	7k5046LQh6xn+rU31AnoSWxNWKseEvAuLurQEtTpOSaYrnc/5iE1I/+w1EVhFex4H/I=
X-Gm-Gg: ASbGnctMR9ePiVxkE8i7dFyjD7/v+tDQqFlAx0CK4B5I0l6fVZgOhGYWUeTkyrDXIVH
	+BHMTle90wxbt3LRAbjgdPFnh25jP9dyCNA3iEgRusUUxuEJsj43RTvf7BAfhFOvQn/5JUDpNkn
	MQQZVBVA1H5nJ0NCFE0E5rtAYyL+xr005gTzypoWN5xgU41FTS3eil+0WDDb8ZHzQzMzAmNz/+c
	E6xEHnXxdScwRGH/wYN0Op1VGC6OlVDQix/uPzBw6JJWupBGoqBeDYqKQXozNotGJMlEUhStx0p
	tw2SyLCMFup7b5XaKHAy/2N/ptpEp+wQBeyy/w0Z8srv0Nx4gl8Ar1xs3VvkrXRJeDTc1iq/U6E
	PnSyCf7yaDNwugPjJ+2vlRm+TIXYSlacvsQqwJLAFVld+loO2S7cgphl8NSTT0ffFQSUR
X-Google-Smtp-Source: AGHT+IF0HcZH8FVBmKJ4GmjA2mzyAVblpZ7PRNdTI+fWx8fAyi9WQRlG7UaDpDQUTKMH5yyVV73AIA==
X-Received: by 2002:a05:620a:4515:b0:7e0:a51a:b393 with SMTP id af79cd13be357-7e68128ccb4mr331058485a.7.1753981078536;
        Thu, 31 Jul 2025 09:57:58 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f706406sm105256385a.49.2025.07.31.09.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 09:57:57 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uhWbN-00000000qFA-1y2m;
	Thu, 31 Jul 2025 13:57:57 -0300
Date: Thu, 31 Jul 2025 13:57:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v3 29/29] iommu/arm-smmu-v3-kvm: Add IOMMU ops
Message-ID: <20250731165757.GZ26511@ziepe.ca>
References: <20250728175316.3706196-1-smostafa@google.com>
 <20250728175316.3706196-30-smostafa@google.com>
 <20250730144253.GM26511@ziepe.ca>
 <aIo1ImP7R7VhRpVE@google.com>
 <20250730164752.GO26511@ziepe.ca>
 <aIt67bOzp6XS_yO-@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aIt67bOzp6XS_yO-@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_095800_181831_C77557B2 
X-CRM114-Status: GOOD (  32.86  )
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

On Thu, Jul 31, 2025 at 02:17:17PM +0000, Mostafa Saleh wrote:
> On Wed, Jul 30, 2025 at 01:47:52PM -0300, Jason Gunthorpe wrote:
> > On Wed, Jul 30, 2025 at 03:07:14PM +0000, Mostafa Saleh wrote:
> > > On Wed, Jul 30, 2025 at 11:42:53AM -0300, Jason Gunthorpe wrote:
> > > > On Mon, Jul 28, 2025 at 05:53:16PM +0000, Mostafa Saleh wrote:
> > > > > Register the SMMUv3 through IOMMU ops, that only support identity
> > > > > domains. This allows the driver to know which device are currently used
> > > > > to properly enable/disable then.
> > > > > 
> > > > > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > > > > ---
> > > > >  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 92 ++++++++++++++++++-
> > > > >  1 file changed, 91 insertions(+), 1 deletion(-)
> > > > 
> > > > Can you split the new iommu subysstem driver out please? I think I
> > > > asked this before.
> > > 
> > > Sorry, maybe I misunderstood, do you mean split this patch into multiple
> > > patches or split all KVM SMMUv3 driver out of this series?
> > 
> > Yes the latter, the iommu driver introduction is best as its own
> > series
> 
> I thought about that but I was worried the maintainers wouldn't like
> introducing the infrastructure first in the hypervisor without a user.
> I am open to split this, but let’s see what they think.

You can merge both series at the same time

> Makes sense, from the kernel point of view it will be attached to
> identity/blocking domains, but the hypervisor api is just enable/disable HVC
> as it doesn’t know what is a domain. If terminology is really a problem,
> I can make it one hypercall as “set_state” with on/off or identity/blocking

I would call it set_state with states IDENTITY/BLOCKING. That is
clear. enable/disable is ambiguous.

> TBH, I am not sure what hardware does that. So, another option is to fail
> gracefully if RMR exists (which falls back to the current driver) and then
> pKVM would run with DMA isolation, which is the status quo.

iGPUs either access the DRAM through the iommu or they use some OS
invisible side band channel.

The ones that use the iommu have this quirk.

> They are not random, as part of this series the SMMUv3 driver is split
> where some of the code goes to “arm-smmu-v3-common.c” which is used by
> both drivers, this reduces a lot of duplication.

I find it very confusing.

It made sense to factor some of the code out so that pKVM can have
it's own smmv3 HW driver, sure.

But I don't understand why a paravirtualized iommu driver for pKVM has
any relation to smmuv3. Shouldn't it just be calling some hypercalls
to set IDENTITY/BLOCKING?

> I am not sure if we need get_resv_regions, maybe it's useful for sysfs
> "/sys/kernel/iommu_groups/reserved_regions"? I will double check.

It is important to get this info from the FW..

Jason

