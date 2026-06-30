Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DE9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 16:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rGel1rvdm2vqYO1DEls9OmTRzPQ+QRBZhk43D5aDGso=; b=e9zxMOTzAmujyFwcFkKqDfrewI
	7uUhoV0XhRoGPrdmHSfHa7KzVIfEVm5EWYXERVyjhmxD+xIRRRNmNvYUXsfTks31lSIXfblG1b5u+
	U1EfUv7ByRQM1GWxjWP3V92mzBDV6Chqy6q1eIklbg1SwAS9dzv3PStnRyvzBhpoY5wE2HGX/dYAw
	hR2Xg8MxFTXHykORUZQSfmIxeAlXXqL16UnDbWbRl+UFsm3lJHNrT6iZa0sPnadfbiP3DuW7W0KCw
	Ya09XfXYguZdtwJeakfsb2OxniLSAdxqwrhNFlcxXj6acTUWYl9nHf4i3SglcCLrLmo1PXxRgPrfS
	4BMUY8yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webA6-0000000HSMF-0XiT;
	Tue, 30 Jun 2026 16:18:14 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webA1-0000000HSLb-38x4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 16:18:11 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-8eefd0c5f59so34154296d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 09:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1782836288; x=1783441088; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rGel1rvdm2vqYO1DEls9OmTRzPQ+QRBZhk43D5aDGso=;
        b=I1TAzFpC68CCVQtC6HyKTHQb9IU6qhAVrz24+99RqruM0ADltRhF9hJ1cT5Wbkgynj
         Bjzl3U37fQRXX4CSaxPw7bAYmQCj2xNCTyf3RujHE4Ko7B/mnXAIweYHGqOZBOVIO+sE
         v+x2GFhzw6IR445MrxGgnPMWRhxguoCmIJXj9u1tJ8e/ebKnZ5UV/VJR+5DwYxOnUv+U
         iTVct2sFHsxsPyx3Hxq7AonQNs/9f1ro9XmIEQmP+HQI3TfbTJ+crlhhuTdp4JNqMwZA
         KJW74wrQKmPtZQjI7L/Ne29HMN2OKRWkbzc+Jq88JWE2hRmUwsXa/lo65ZZyJ9XIcVCe
         G7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782836288; x=1783441088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGel1rvdm2vqYO1DEls9OmTRzPQ+QRBZhk43D5aDGso=;
        b=dSoKGKFcyj82gt6UJiQamtqRpgspcx6IMURPMvO7BA8g7Ofn/FhxS/mjT4mC0EGLoi
         2C5R+ucakVOGxE0/S9FbhFPCMriqIy/nPUNtB7oz3e/kGFNMDp0i70mDl8U0aigcEg4i
         wu58cM0EW8Acb9rT25WgQH1wQC1caE9oe4zFy5WFopQExxXTntHd2Oa71cmpzg6uW3m1
         a1hPmbDybh58t4cpBRKByw+f8Meu9iqNpwxmJ1cHG7UTV3U4jAIiG9xOoroTu6MnBPr8
         OXNIxbnj0AStG1vezvxrXUMepGzvYUiGRGi/NSm9Y+K56vuR+AOy4lN8LC3G7IKU5Kqj
         EdOA==
X-Forwarded-Encrypted: i=1; AHgh+Ro8f5YVxtHORuNqWVLOqbq4hVkUIKv7lgjsjB+b0uvkxE+TltGit9zoORHY60+JBaogtJrYXaYYX9pkyBKNv5Fv@lists.infradead.org
X-Gm-Message-State: AOJu0YzmQDeBELl/zV/7SPNQfIgsgyqCZ55k2CsAdkcce1SBBgfdsdYi
	Vi5SsMC1+9zUFPEfomu+lm3oXEdRwFUa4phneotkNosLGcOhnhAWJPml7RcCfLOq1Ne9CtHWqPQ
	Ryblo
X-Gm-Gg: AfdE7clwXNi6bvrkgQ4kSm3few0E9yIVgqzV+57KP2IRcy63UJdg6Xl/c8kHX4NM2ko
	uW3cDFFSzqTQnsu23xzRbw84n7qDkNdWb6Ncvv2HM3d6a+PGasjCYPFSkjMKaaoaouZJmeeZlQ3
	/9ehTWXe0CX3zCd0LqoOKc9GEDygqIzKQDh+fxCTS6W1+ZsvuoPhQPV1RArrcIiNCICS/i+2aoq
	lw5O92r6dcSNi9O8Vki/99fhMA8VTQ4d3NHmHGxYOAQQgky11sNAzmcKQKkzRivJRge8XXRzDq3
	XDXSNaQKmzOBD+pa1fjAxy+PouPRJ+22dbdlfnyHA+4RfZX29S5NFDqPmB5GAlHV0je0a9DpkBX
	13vaDPPTR3G+qiz7FS3Jy1VVgtorguxR/KjbSwttV32yLsVgqNfQd6UbUQ352JZ8b9H6xPzV1Ey
	sbfyj8CzopfWLErs+RUtKL/mibX75IH825LwFcfccMODIyYGJaIuttbiC0sO+8iI561gE=
X-Received: by 2002:ad4:4a6e:0:b0:8f0:1b69:25d2 with SMTP id 6a1803df08f44-8f1ba1b1e7bmr44221716d6.23.1782836288213;
        Tue, 30 Jun 2026 09:18:08 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f24723defcsm15060566d6.49.2026.06.30.09.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:18:06 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1web9x-000000028Ii-0dcm;
	Tue, 30 Jun 2026 13:18:05 -0300
Date: Tue, 30 Jun 2026 13:18:05 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v6 00/20] dma-mapping: Use DMA_ATTR_CC_SHARED through
 direct, pool and swiotlb paths
Message-ID: <20260630161805.GJ7525@ziepe.ca>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <aigYbK12D8uKQvJF@arm.com>
 <20260609144746.GL2764304@ziepe.ca>
 <2ecfa1a8-6202-4319-9692-a6ffeb5a3dbf@amd.com>
 <yq5aqzm4dz25.fsf@kernel.org>
 <20260618153705.GH231643@ziepe.ca>
 <d4ef9a9f-18d9-40e1-9d02-87aeb9cb6540@amd.com>
 <20260619120309.GI231643@ziepe.ca>
 <9f20ce61-1edd-411e-a7c3-be541fb89cb4@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f20ce61-1edd-411e-a7c3-be541fb89cb4@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_091810_298261_90330D3A 
X-CRM114-Status: GOOD (  48.27  )
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

On Mon, Jun 22, 2026 at 10:58:23AM +1000, Alexey Kardashevskiy wrote:

> > I think it was a big mistake for the AMD SME stuff to overload the
> > decrypted/encrypted CC stuff which should mean shared/private in a
> > guest context to also mean things about physical memory encryption in
> > the host. It is really confusing.
>
> It is a bit in the PTE which says "encrypted", what do you mean by overloaded?...

Encrypted meaning I'm using DRAM encryption on the host and Encrypted
meaning this page is private and inaccessible to the hypervisor are
very different things with very different requirements and is
confusing they have been overloaded in Linux :(


> > The SME side is just a bad arch choice, the real world doesn't work
> > well if you set high address bits in your dma_addr_t. I think AMD
> > needs to use those restricted swiotlb pool where it allocates this
> > very special "SME Disabled" memory that will have a low
> > dma_addr_t.
> 
> The generic __init iommu_subsys_init(void) calls
> iommu_set_default_translated() if CC_ATTR_MEM_ENCRYPT (==force the
> use of IOMMU) and eliminates the bouncing by default, pretty
> much.

Sure, I know, it is a gross solution to a self inflict error.

> We (AMD) do not really want to force Cbit in DMA handles and
> it is not happening unless "iommu=pt".

Lots of real HW won't work will because of this, so yeah you pretty
much have to. But also there is HW that is fine, like you can use a
mlx5 device and it will handle the C bit just fine.

It is pretty hacky to globally force the iommu mode because some
devices end up not working.

> > Then alloc and bouncing will get memory with a suitable
> > dma_addr_t. This has nothing to do with force_dma_unencrypted() which
> > is only a CC guest concept and nothing else in the OS should ever
> > touch decrypted memory.
> 
> True.
> 
> Although, with "iommu=pt" enabled, dma handles from swiotlb should
> not have Cbit so these swiotlb pages have to be unencrypted.

That is how it should ideall work, in this case the purpose of the
swiotlb pool is to provide low dma address memory because the device
cannot reach the normal linux dram addresses.

> As you mentioned in another mail in the thread, DMAing to
> unencrypted memory with mem_encrypt=on make no sense security
> wise. 

Yes, pretty much.

> May be enforce either mem_encrypt=on or iommu=pt is allowed at
> the same time but not both? I am worried though that some weirdo
> still has a use case for it.

Arguably it should be done per device. The problem is the iommu layer
doesn't know what the dma mask is until the driver binds so it can't
detect a device that is unable to reach any dram and switch away from
identity automatically. That would be much cleaner.

> > > I am looking for a way to set up my "sev-guest" device such as when
> > 
> > Whats a "sev-guest" device?
> 
> It is a platform device, presented in SNP VMs as /dev/sev-guest and
> the guest userspace calls ioctls on it when it needs VM attestation
> report/certificates/etc.
> 
> The sev-guest driver makes calls to the HV (GHCB protocol) to:

> 1) get report/certificates/measurements from the HV <- this is done
> via shared memory as the HV writes to it;

> 2) asks the HV to get the digests from the PSP <- this is done via
> encrypted memory (buuuut it is software encrypted and as far as the
> hw is concerned - it is shared - no Cbit, no RMP - these buffers
> contain plaintext headers of the PSP requests and cyphertext of the
> request/response body).

Ok, but here you have overloaded the word encrypted again :( Decrypted
memory containing ciphertext I think you mean

> > > dma_alloc_attrs(snp_dev->dev,...) happens, it allocates a page from
> > > the shared swiotlb pool (with no actual bouncing) and there is no
> > > obvious way to trick the DMA layer into doing that.
> > 
> > Why do you need this?
> 
> /dev/sev-guest uses only shared memory (from the HW standpoint), and
> it is normally lot less than 1MB. If hugepages are used, then today
> it allocates 4K pages (they come encrypted and likely backed with a
> 2M page), the driver converts them to shared to make that GHCB
> call. The conversion smashes backing 2M page to 4K pages (+RMP
> +IOPDE as there is possible ongoing DMA), which is a problem (I have
> mentioned it as "TMPM" before - a hw/fw helper to do the smashing).

Okay, but this has nothing to do with sev-guest at all, and should not
be solved uniquely for it.

The DMA API in general has a problem spraying allocations all over
system memory and fragmenting the RMP/GPT/etc and yes it needs a
solution, but it should be entirely in the DMA API and have no
special involvment with sev-guest. sev-guest should just make coherent
allocations and use them in the normal way.

> The idea here is that if swiotlb is already shared, the sev-guest
> could use that memory pool.

dma_alloc_coherent using the swiotlb pool instead of allocating and
converting in general is a reasonable proposal, IMHO. Again, nothing
to do with sev-guest.

Jason

