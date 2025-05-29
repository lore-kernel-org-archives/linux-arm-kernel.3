Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4E9C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 18:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YNUyfyg1HbaBDiYAUpaOAIe/tOlUxr3f8C7O9P4Zl4s=; b=1Dbkzyg9rVJsdQCdtoIecI3zY9
	BjEWytVyIMYZEL7/7ynKZPPiFbhI2Qz++Csu96MGg3QXRf/BX+ThNKmdn7GYCt4Hi0RTS4qZWv5St
	iVVP1oEOr2liqeruTApU8AEvwZ6jNoSXGORBRoG12mw/JjJY+PlEtE1fFcIomNDvPuygliW28nP44
	1B7GZHnDwtMkkm4TkWkiR6CsLfK1uvtBRWFIcuxAZcFtGuJRkOE8s4psLovX6nzWlh1HzOOQ+3Xzw
	tLXLf0uoCfGgWgKdZfzJZ8/WNUsEULm2OeMfhfUujQylZtoBfvmQIXHlukepAG11GwkUYHbdzw9ON
	AQMgwslw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKhvd-0000000GLua-2Yd2;
	Thu, 29 May 2025 18:24:33 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKhtV-0000000GLmY-3hJO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 18:22:23 +0000
Received: by linux.microsoft.com (Postfix, from userid 1152)
	id 8A59F2078632; Thu, 29 May 2025 11:22:19 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8A59F2078632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1748542939;
	bh=YNUyfyg1HbaBDiYAUpaOAIe/tOlUxr3f8C7O9P4Zl4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WRwwteRkcy3o05WG0KDJfOEL2Sk4Q0gxIYKM00uEeHmjwhMdhh3RPW5hTfEXDrgeK
	 D5FSvORQZBKOdYa1WdudMDFpbVX5ye5V4OFoSwcKLpkSB90tX/RplK4BzifQMiVk0z
	 zaU1gr1yS/SiWZkwTBSbD5y5cmDQuSkEEGw2oZ4Q=
Date: Thu, 29 May 2025 11:22:19 -0700
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jacob Pan <jacob.pan@linux.microsoft.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	virtualization@lists.linux.dev, will@kernel.org,
	eric.auger@redhat.com, code@tyhicks.com,
	eahariha@linux.microsoft.com, vijayb@linux.microsoft.com
Subject: Re: [PATCH v2 0/3] arm-smmu: select suitable IOVA
Message-ID: <20250529182219.GA20289@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20250410225030.2528385-1-shyamsaini@linux.microsoft.com>
 <20250410230008.GA6905@ziepe.ca>
 <67fff12d.650a0220.208c7c.d69dSMTPIN_ADDED_BROKEN@mx.google.com>
 <20250416181759.GF493866@ziepe.ca>
 <20250520224224.GA16365@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20250525190703.GD12328@ziepe.ca>
 <20250527205428.GA14019@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20250528000425.GC146260@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528000425.GC146260@ziepe.ca>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_112221_973585_22AC4C3F 
X-CRM114-Status: GOOD (  45.62  )
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

On Tue, May 27, 2025 at 09:04:25PM -0300, Jason Gunthorpe wrote:
> On Tue, May 27, 2025 at 01:54:28PM -0700, Shyam Saini wrote:
> > > The above is the only place that creates a IOMMU_RESV_SW_MSI so it is
> > > definately called and used, right? If not where does your
> > > IOMMU_RESV_SW_MSI come from?
> > 
> > code tracing and printks in that code path suggests iommu_dma_get_resv_regions()
> > called by vfio-pci driver, 
> 
> Yes, I know it is, that is how it setups the SW_MSI.
> 
> > > As above, I've asked a few times now if your resv_regions() is
> > > correct, meaning there is a reserved range covering the address space
> > > that doesn't have working translation. That means
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

so should it be for all the iommu groups?

                no_dma_mem {
                       reg = <0x0 0x8000000 0x0 0x100000>;
                        no-map;
                };
 
i think that's how we reserve memory in general, eg: ramoops
but this doesn't show up in:
  /sys/kernel/iommu_groups/*/reserved_regions

 
> > Yes, i tried that,
> > 
> > This is how my dts node looked like
> > reserved-memory {
> >                faulty_iova: resv_faulty {
> >                        iommu-addresses = <&pcieX 0x8000000 0x100000>;
> >                };
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
 
> So what is the problem if you have figured out how to fix up
> /sys/kernel/iommu_groups/Y/reserved_regions?

sorry, i haven't yet
 
> If you found some cases where you can't get /sys/../reserved_regions
> to report the right things from the DT then that needs to be addressed
> first before you think about fixing SW_MSI.
> 
> I very vaguely recall we have some gaps on OF where the DMA-API code
> is understanding parts of the DT that don't get mapped into
> reserved_regions and nobody has cared to fix it because it only
> effects VFIO. You may have landed in the seat that has to fix it :)

I think this is the case we are dealing with?

> But I still don't have a clear sense of what your actual problem is as
> you are show DT that seems reasonable and saying that
> /sys/../reserved_regions is working..

/sys/../reserved_regions is working for certain devices like dma controller
but it doesn't work for pcie devices and its vfio-pcie driver calling
iommu_get_resv_regions() but we don't have dts node for vfio.
I have confirmed this about pcie on two different platforms, it seems to be
OF DMA-API gap that you hinted above, happy to work on that :), it would be
great if you can share any other reference discussions to that problem

When i specify this for dma controller:

		faulty_iova: resv_faulty {
			iommu-addresses = <&dmaX 0x8000000 0x100000>;
		};
&dmaX {
	memory-region = <&faulty_iova>;
};

I see following:
$ cat /sys/kernel/iommu_groups/y/reserved_regions 
0x0000000008000000 0x00000000080fffff reserved
0x00000000a0000000 0x00000000a00fffff msi

Clarifying the Issue with MSI and SMMU Faults on Our Platform:

We are encountering SMMU faults when using our userspace tool/driver that
relies on MSI. Specifically, the issue arises when the MSI_IOVA_BASE is set
to the current default value of 0x08000000.

The observed fault is as follows:

arm-smmu 64000000.iommu: Unhandled context fault: fsr=0x402, iova=0x00000040,
fsynr=0x2f0013, cbfrsynra=0x102, cb=15

Upon investigation, our hardware team confirmed that the memory region
containing 0x08000000 is already mapped for other peripherals, making it
unavailable for MSI usage.

eg: using 0xa0000000 as MSI_IOVA_BASE solves our problem.

let me know if you have any other questions

Thanks,
Shyam

