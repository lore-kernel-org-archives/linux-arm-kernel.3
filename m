Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256D3C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 18:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j6U4iis3R5XjOi+aCw7RCiw2bmEOQJGCtpg1KsnzGR0=; b=wWFzEMPadKgxdV9nnWxfBskeJg
	eFjogRZzT9f3tkZu2F0tThLpojA27nhmor0aeeBuEAjwc16hqVDzXrNXYjj/GO5hXND5KfJ/EK1rn
	VeJAn5UOg1vHMh3T6Si2uqSFW4uLWGpalZEZjiUty1DNPhnlW05pgp0GzJtCZMqd2NHOqu3TKnRh/
	Zyu+r5SdV1fTyIEZkqSvDSIuWzzDFu4yUT+t6oK1M/WTbaWjWQOSWLcoMwI6fPfTbZRjhf4mxvtAK
	U5jTy9Ll+MdvH7XBOwVbRzFG/kvv8CcqU4scH+fQ4mORcc8rW/5l0gYPAnA7b5vIHnIzUzgJDHD4d
	oDsxqgwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKiB5-0000000GNEt-288F;
	Thu, 29 May 2025 18:40:31 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKi8w-0000000GN8U-1472
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 18:38:19 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7cadd46ea9aso145986385a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 11:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748543897; x=1749148697; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j6U4iis3R5XjOi+aCw7RCiw2bmEOQJGCtpg1KsnzGR0=;
        b=JTmj1dSIP76NZQAYxmUtodr1CCuWI+VHd58YAyC/kqtggDEAJ81zzMxBWkCITzkDA/
         iZ6bao0enO+G/58YSY3WyOSyOxCLviy9mjPY2keUvRU874VEt7K5gid8A/P+u1rDgvZj
         i4RYb18uQIx/PYdEx94iQ6uUjnkhKr0hvFw+EP4qCFjwek1Q97XJpGjMib7bLxZxsczc
         XgpNMLGOf8G5BocrANP6HwxkfSavT01IApzcBKUU8bgCMjqr/ayApF6ARiUWEZuem5dP
         M9VLHekA4j1UE+YlYBm6Y1u9VXLA/Z5mqY2SMyfVuGOybW2TbxmoFfIZSYb0kF+9eMzw
         nq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748543897; x=1749148697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6U4iis3R5XjOi+aCw7RCiw2bmEOQJGCtpg1KsnzGR0=;
        b=O7xTRnVC6Vx3HZ3/PYheQdOS4S6rpY+Vakc2AFoeVFebvRdP2Ft7+HQ6cTG0uSz3GK
         vnHxLZWUwe5fUDk1y3bNvsclFxeUqpGwuYpnmv4pwD3zl3BJIkZQX4otY4Iyjpq98SJE
         1l7uwjf08DonPAiKX+aEdEUl8GZWfT7FpEEc0ttG4XDAY9vQorDO/U/O2g3h+xnZ2ces
         pa1oRwLBPmrQ+3f55vLWHIPAcb/B9JR82L2LfXwhbhwJ4B+zKa7FMF1Uhrx73VMW7oRX
         QNeHlYv/3Jznx/k1Pq4PVri6sfpna4xe5DjEz2AqXp90EgNoJSdhdm0eC30lb0ihfqvk
         rGSg==
X-Forwarded-Encrypted: i=1; AJvYcCU0rs++6GugJtwS8NRQvpUsMltvSWgcuVxVd5syjl45eBDs9E9rjaKPwKFB/0olEk0cUQtxbtS4+ZXiL7PJI9ls@lists.infradead.org
X-Gm-Message-State: AOJu0YyRSqdfq7XDyC3rRi9WfeiajSj0IlgxungWVWwfmzFcn98PFL3r
	mySa/S2fHVPxw//f0Sd7Rp/NgjcECWBjLzpPsbcaKCx5ZFSCqVJB5NB1buWzYoFvYcc=
X-Gm-Gg: ASbGncvt+HT0AHqc3DaaqLuwiDFVyBjnA3ctQLG7dGxrXixqfw9JD1ojouKG0qOmegU
	MaLpNVx2HxtC0O/3gNblEy1onFSKWnbPG73eRpzftmpFp65SrkLEmYxSiTl/N2IdbSPe41Bc/br
	J1K8+ZZ4Gzlll3MU21cG3+3+hJTHG5UmjMHqsRtVhqGP3NK+LCsuqSN1By9aCT9eSbYZoC89uQR
	ZnXaWV8sZVyLwaCpyQr9N8cd6aTUda2FOFy9kwurdqfkYroI/ntmizy+Ps/OMQWoJ3XhzbtpkCZ
	0SvtslrY/NDSxd43SWQunGX2Eh6nfjVqmouv2ibekul3yUdI+ol2tHTHNDYtxy0aBQkh4dcNW/Z
	6KI4k1rPUKfuf2bfcku8p0l6Nb7Mg/T4r6PEZzA==
X-Google-Smtp-Source: AGHT+IEg275FMxde1zTXTRnOX2l5C2eqH11zCR4cQAT539QqGLVvAFWBmzNkj2MQGivWQQr0ei8qBw==
X-Received: by 2002:a05:620a:4711:b0:7c5:47c6:b888 with SMTP id af79cd13be357-7d0a2013056mr95749785a.40.1748543896682;
        Thu, 29 May 2025 11:38:16 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0e3fdfsm122585685a.9.2025.05.29.11.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 11:38:16 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uKi8t-00000000zty-2gm0;
	Thu, 29 May 2025 15:38:15 -0300
Date: Thu, 29 May 2025 15:38:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: Jacob Pan <jacob.pan@linux.microsoft.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	virtualization@lists.linux.dev, will@kernel.org,
	eric.auger@redhat.com, code@tyhicks.com,
	eahariha@linux.microsoft.com, vijayb@linux.microsoft.com
Subject: Re: [PATCH v2 0/3] arm-smmu: select suitable IOVA
Message-ID: <20250529183815.GA236098@ziepe.ca>
References: <20250410225030.2528385-1-shyamsaini@linux.microsoft.com>
 <20250410230008.GA6905@ziepe.ca>
 <67fff12d.650a0220.208c7c.d69dSMTPIN_ADDED_BROKEN@mx.google.com>
 <20250416181759.GF493866@ziepe.ca>
 <20250520224224.GA16365@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20250525190703.GD12328@ziepe.ca>
 <20250527205428.GA14019@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20250528000425.GC146260@ziepe.ca>
 <20250529182219.GA20289@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529182219.GA20289@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_113818_469052_07C727E3 
X-CRM114-Status: GOOD (  28.24  )
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

On Thu, May 29, 2025 at 11:22:19AM -0700, Shyam Saini wrote:
> > All IOVA that the platform cannot DMA from should be reported in the
> > reserved_regions file as "reserved". You must make your platform
> > achieve this.
> 
> so should it be for all the iommu groups?
> 
>                 no_dma_mem {
>                        reg = <0x0 0x8000000 0x0 0x100000>;
>                         no-map;
>                 };
>  
> i think that's how we reserve memory in general, eg: ramoops
> but this doesn't show up in:
>   /sys/kernel/iommu_groups/*/reserved_regions

I don't know anymore, I've forgotten these details about DT, you will
need to consult with DT experts..

> > But I still don't have a clear sense of what your actual problem is as
> > you are show DT that seems reasonable and saying that
> > /sys/../reserved_regions is working..
> 
> /sys/../reserved_regions is working for certain devices like dma controller
> but it doesn't work for pcie devices and its vfio-pcie driver calling
> iommu_get_resv_regions() but we don't have dts node for vfio.
> I have confirmed this about pcie on two different platforms, it seems to be
> OF DMA-API gap that you hinted above, happy to work on that :), it would be
> great if you can share any other reference discussions to that problem

Some of it was around the dma_mask and the ranges, but I'm not sure
exactly what is your issue here..

It is very important the the dma-iommu.c code also knows not to use
the non-working IOVA or your system will be buggy and eventually fail.
If that isn't happening you have a critical bug beyond the SW_MSI
issue.

The easiest way to fix it is to have reserved_regions report the right
stuff.

> When i specify this for dma controller:
> 
> 		faulty_iova: resv_faulty {
> 			iommu-addresses = <&dmaX 0x8000000 0x100000>;
> 		};
> &dmaX {
> 	memory-region = <&faulty_iova>;
> };
> 
> I see following:
> $ cat /sys/kernel/iommu_groups/y/reserved_regions 
> 0x0000000008000000 0x00000000080fffff reserved
> 0x00000000a0000000 0x00000000a00fffff msi

See, that looks better. You need to make that happen for all the
effected devices.

> Upon investigation, our hardware team confirmed that the memory region
> containing 0x08000000 is already mapped for other peripherals, making it
> unavailable for MSI usage.

See, that's just wrong HW design. The path from PCI to the SMMU should
not have any other decodes on it, isn't that SBSA?

How does your platform work at all? Isn't 0x08000000 physical memory in
your address map?

Jason

