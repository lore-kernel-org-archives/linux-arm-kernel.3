Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CC6C9830C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 14:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=66owRjOvJSAr/FtK7BlN29u7V5NJZ0MbFNauyPpj7FQ=; b=1/9h5c78KhXXZP9ewbhndDuelN
	terdSI0xJ7vl7vzZVhkAQdIycsaN26sOQhpZmt+58vQ6QHFWCCF3FYQpEYue4KYNGRLKXddni2FaQ
	9OnfofcId5u62JJtwBtAf8dPpwc/65PDIc+rZsfoj3ztHeKDPBmm0y8rIrbHnf6VUaxZ8RiO6k84W
	5YhSTxrZQylJ0aAT6mDBsvzGqovNpGsV3F0MMjpwryYFvIppSBcWj3dvRuDpNuIeoBTUCUzJBtUHk
	3418uycaIXyhz2dHZGdTfvGySVg86FRRCEf+P6eVhecLTl3nVxxuxCqiG3u+VxZkrS4t73zMKoa2Q
	Jus69Xlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Nnu-00000008Vds-0IZX;
	Wed, 23 Sep 2026 14:18:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Nns-00000008Vdd-3xzA;
	Wed, 23 Sep 2026 14:18:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 50F09400FD;
	Wed, 23 Sep 2026 14:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82AEC1F000FF;
	Wed, 23 Sep 2026 14:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790173112;
	bh=66owRjOvJSAr/FtK7BlN29u7V5NJZ0MbFNauyPpj7FQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=c09/orxsyiIgQr/XyV4THd+6iBSzQc+CshjgJM2aYHJg3nIicfYSVJmPSlSo5eFCG
	 73M97zJBx7RC8G1UDuMC4dveij/CiJQWWbFiW+OEd8kV+Cyc9mTNrOw2ns0ax3MTDP
	 avvAEjCrzYEPWHqfvFJUlE4W+kzhwxoPDQB9AvNWNECA0vioHaZenC1uGyNZ3nqHJv
	 4MedGiREESIFrLlZ7bkyRnA0Yc+Sr+MQuaCJEm+QJTuJbhZ1jAwpzyTFOJOwe5smc4
	 HBTbt1JP9nhGwgB5/15SJUaOSpadMGna89qHgONKNr3b7WbH0HXPGdbC0lFsvvTwfG
	 LxBRc+m1G3jZg==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v5 5/6] dma: swiotlb: Add an overridable architecture
 pool opt-out
In-Reply-To: <8c9c04ae-cba7-4096-a7d1-70b90a46c161@arm.com>
References: <20260921063628.362078-1-aneesh.kumar@kernel.org>
 <20260921063628.362078-6-aneesh.kumar@kernel.org>
 <8c9c04ae-cba7-4096-a7d1-70b90a46c161@arm.com>
Date: Wed, 23 Sep 2026 19:48:13 +0530
Message-ID: <yq5azex8126y.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Robin Murphy <robin.murphy@arm.com> writes:

> On 21/09/2026 7:36 am, Aneesh Kumar K.V (Arm) wrote:
>> On x86, iommu=off historically prevented SWIOTLB initialization by not
>> setting SWIOTLB_INIT_ADDRESSING_LIMIT. This overloads that flag: it
>> controls both whether a pool is selected and where the pool is
>> allocated. If another requirement, swiotlb=force selects a pool
>> independently, omitting SWIOTLB_INIT_ADDRESSING_LIMIT may place it above
>> the addressable range of devices which need bounce buffering.
>
> Well then surely something is wrong with the design? If 
> SWIOTLB_INIT_ADDRESSING_LIMIT is set then SWIOTLB still needs to respect 
> it irrespective of any *additional* reasons for activating (either from 
> arch code or internally). And conversely, if devices have addressing 
> limits but SWIOTLB_INIT_ADDRESSING_LIMIT is *not* set, then the arch 
> code has clearly gone wrong or made a bad assumption, but that doesn't 
> seem like SWIOTLB's problem to worry about.
>

That is what this patch does. It sets SWIOTLB_INIT_ADDRESSING_LIMIT
based on max_possible_pfn, while SWIOTLB_INIT_FORCE_DISABLE allows the
architecture to opt out of SWIOTLB initialization independently.


>
>> Add SWIOTLB_INIT_FORCE_DISABLE to let an architecture opt out of normal
>> pool initialization without discarding the pool placement constraints.
>> 
>> Unlike swiotlb_force_disable, which is set by swiotlb=noforce and
>> unconditionally prevents pool initialization, the new flag is an
>> architecture default. Explicit requirements such as memory encryption,
>> architecture remapping, or swiotlb=force take precedence over it.
>
> Logically, that should already be implied by the architecture passing no 
> SWIOTLB_INIT flags.
>

We now have a case where max_possible_pfn causes
SWIOTLB_INIT_ADDRESSING_LIMIT to be set, while the kernel command line
specifies iommu=off. We want to disable SWIOTLB in this case even though
the SWIOTLB_INIT flags are nonzero.

-aneesh

