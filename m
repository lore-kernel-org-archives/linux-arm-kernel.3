Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3009CC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 22:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BBNnTlhHJfRhv50gKjTeM2IF6Sms1SVDjpmf3Got7WQ=; b=wV3j2lI/FR/jD+bgt7Rbo8IUzZ
	u9hUCMlLoZJx+knDWmWbCNB/+uYb0XDh3DgVMfXYpy2qzIYrGd1+iu+c6aIJGTFpGK8u56O326/OZ
	kDAYg+shUsEZzbkLAst0Vl5OyHOLYf+ms8tRanBuBUdCQYYpxV3iq4hIsXdDHD7OiUJXDC3coOXIV
	NbLQH5kDyG5TXXWvFLxgiRH9pkOCVGO6vNFABXkzabjD6cSfp2F/J1mWsBlCV+2gbYCAE3b/QkmD0
	T75uhJ5+JZmfahdTHOTS4nPsbh3c306Pvxy3HD6WjT7Z9VfmteQ++fXFB5PZ/8J6RpQqe7caREMnS
	Od4tk3rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKPYO-0000000EIJl-0MJK;
	Wed, 28 May 2025 22:47:20 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKPUA-0000000EHm4-3qxv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 22:43:00 +0000
Received: from DESKTOP-0403QTC. (unknown [20.236.10.120])
	by linux.microsoft.com (Postfix) with ESMTPSA id 112512068337;
	Wed, 28 May 2025 15:42:56 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 112512068337
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1748472177;
	bh=BBNnTlhHJfRhv50gKjTeM2IF6Sms1SVDjpmf3Got7WQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Reply-To:From;
	b=eEO2qnr/d9KBIV2c9UfOMrsgOxO8ffJ8l9rq15vuEQBLDFh5iBI555Do3su8BZVjI
	 kLM+luZtvxH46g0otgcojJ+UHPeWMEbsvfAZyVUdSVvlv2DAxduzoBCXsWO9aXsDnK
	 tgc4dE26hxnh6h5muSK7GIUUmcJbcjj4uIw6yP7U=
Date: Wed, 28 May 2025 15:42:55 -0700
From: Jacob Pan <jacob.pan@linux.microsoft.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Shyam Saini <shyamsaini@linux.microsoft.com>, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 virtualization@lists.linux.dev, will@kernel.org, eric.auger@redhat.com,
 code@tyhicks.com, eahariha@linux.microsoft.com, vijayb@linux.microsoft.com,
 jacob.pan@linux.microsoft.com
Subject: Re: [PATCH v2 0/3] arm-smmu: select suitable IOVA
Message-ID: <20250528154255.769e07dc@DESKTOP-0403QTC.>
In-Reply-To: <20250528000425.GC146260@ziepe.ca>
References: <20250410225030.2528385-1-shyamsaini@linux.microsoft.com>
	<20250410230008.GA6905@ziepe.ca>
	<67fff12d.650a0220.208c7c.d69dSMTPIN_ADDED_BROKEN@mx.google.com>
	<20250416181759.GF493866@ziepe.ca>
	<20250520224224.GA16365@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
	<20250525190703.GD12328@ziepe.ca>
	<20250527205428.GA14019@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
	<20250528000425.GC146260@ziepe.ca>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_154259_016497_7CD7027F 
X-CRM114-Status: GOOD (  37.42  )
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
Reply-To: jacob.pan@linux.microsoft.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Jason,

On Tue, 27 May 2025 21:04:25 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Tue, May 27, 2025 at 01:54:28PM -0700, Shyam Saini wrote:
> > > The above is the only place that creates a IOMMU_RESV_SW_MSI so
> > > it is definately called and used, right? If not where does your
> > > IOMMU_RESV_SW_MSI come from?  
> > 
> > code tracing and printks in that code path suggests
> > iommu_dma_get_resv_regions() called by vfio-pci driver,   
> 
> Yes, I know it is, that is how it setups the SW_MSI.
> 
> > > As above, I've asked a few times now if your resv_regions() is
> > > correct, meaning there is a reserved range covering the address
> > > space that doesn't have working translation. That means
> > > iommu_get_resv_regions() returns such a range.  
> > 
> > sorry about missing that, i see msi iova being reserved:
> > 
> > cat /sys/kernel/iommu_groups/*/reserved_regions
> > 0x0000000008000000 0x00000000080fffff msi
> > 0x0000000008000000 0x00000000080fffff msi
> > 0x0000000008000000 0x00000000080fffff msi
> > 0x0000000008000000 0x00000000080fffff msi
> > [output trimmed]  
> 
> But this does not seem correct, you should have a "reserved" region
> covering 0x8000000 as well because you say your platform cannot do DMA
> to 0x8000000 and this is why you are doing all this.
> 
> All IOVA that the platform cannot DMA from should be reported in the
> reserved_regions file as "reserved". You must make your platform
> achieve this.
> 
Just to double confirm, the expected reserved region should be marked as
"direct" instead of "msi", right?

> > Yes, i tried that,
> > 
> > This is how my dts node looked like
> > reserved-memory {
> >                faulty_iova: resv_faulty {
> >                        iommu-addresses = <&pcieX 0x8000000
> > 0x100000>; };
> >                ..
> >                ..
> > }
> > 
> > &pcieX {
> >     memory-region = <&faulty_iova>;
> > };
> > 
> > I see it working for the devices which are calling
> > iommu_get_resv_regions(), eg if I specify faulty_iova for dma
> > controller dts node then i see an additional entry in the related
> > group  
> 
> Exactly, it has to flow from the DT into the reserved_regions, that is
> essential.
> 
> So what is the problem if you have figured out how to fix up
> /sys/kernel/iommu_groups/Y/reserved_regions?
> 
> If you found some cases where you can't get /sys/../reserved_regions
> to report the right things from the DT then that needs to be addressed
> first before you think about fixing SW_MSI.
> 
> I very vaguely recall we have some gaps on OF where the DMA-API code
> is understanding parts of the DT that don't get mapped into
> reserved_regions and nobody has cared to fix it because it only
> effects VFIO. You may have landed in the seat that has to fix it :)
> 
> But I still don't have a clear sense of what your actual problem is as
> you are show DT that seems reasonable and saying that
> /sys/../reserved_regions is working..
> 
> Jason


