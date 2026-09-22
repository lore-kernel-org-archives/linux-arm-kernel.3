Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F078EC982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 05:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3epzgFAGTIrwRdhpNfOPzvquVJOf1jbVVt83Gylxrw4=; b=XduxyBkA90doqN4CKzZ0+o5mho
	AaZc1PG7Qk1DvEe+cAYIeBcS6iFXrwW0Ke58xR6yuWlD7RMw8cm6B6bh5H2Hh0n/73i9X/3fzvA5u
	hzOuKJ63Myj9ImA9ZECh9wQI04+fvPexFBU7MsjXCkEzU+tLFK8RB28CWPBtJSx0EbCcWFjAKkAkO
	L9tUNbEujYjFJ9TJ+B/Q1jJpeG5rt3bzAK6HoE1zqsDm4e2gqC8IAzSGUBXk1bzBbnUBmNS8HzyZT
	BmkWVpBO5e9dFRBW8z010L9SsA0xB+uHNmuaR+7BD6x/0TtFKunanTsx4puPt3mdmsTp2ORPdhmZ9
	PCWT8NOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tGq-00000004GZl-3lNy;
	Tue, 22 Sep 2026 05:42:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tGk-00000004GY9-3W2S;
	Tue, 22 Sep 2026 05:42:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DD7F8437C2;
	Tue, 22 Sep 2026 05:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 943B51F000FF;
	Tue, 22 Sep 2026 05:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790055737;
	bh=3epzgFAGTIrwRdhpNfOPzvquVJOf1jbVVt83Gylxrw4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=n3cAyn/RCRCO8X+Uau1YjXbZxv8R3e4DCS+Xrx4rxCRgSj1hcmaLfTbRORYJw1hgq
	 Cdw8d9qTesIZG96UD++KmUGKR0DtVp8Km9oejn5XjuarV7G50P0Egv95jNovWg5nHx
	 9biemEsqA2QDkJEW6YxDns/Fcj6SeGFmgfINJQBFXMauH1rC7qKLOGGgJDa1ksYZVv
	 F4bBFg9Uu6vXcF5kxVU5L5bwk4e2hX2UdCkTsGD76gFExoimfyeuDNQ9fxDXt/f2f3
	 LrIkgC9XUMg3K6ZpKCyfWYLJRw6k5gX7a/F2+K9SqAsZpSXf2NYCDRauBSvMK89oLc
	 6F8UvRtFunsPg==
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
Subject: Re: [PATCH v5 2/6] dma: swiotlb: Track whether the pool size was
 explicitly set
In-Reply-To: <94630348-d295-4424-9f6c-0dc3b8704077@arm.com>
References: <20260921063628.362078-1-aneesh.kumar@kernel.org>
 <20260921063628.362078-3-aneesh.kumar@kernel.org>
 <94630348-d295-4424-9f6c-0dc3b8704077@arm.com>
Date: Tue, 22 Sep 2026 11:12:01 +0530
Message-ID: <yq5ase313kra.fsf@kernel.org>
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
>> swiotlb_adjust_size() must not override a pool size supplied through the
>> swiotlb= command-line parameter.
>> 
>> Currently, it determines whether a size was supplied by comparing
>> default_nslabs with IO_TLB_DEFAULT_SIZE. This fails when the user
>> explicitly requests the compiled-in default size, allowing the request
>> to be overwritten by automatic pool sizing.
>> 
>> Record whether swiotlb= supplied a numeric size and add
>> swiotlb_default_size_changed() to query that state.
>> 
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>> ---
>>   kernel/dma/swiotlb.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>> 
>> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
>> index aa19e81ae544..8f86deb25be2 100644
>> --- a/kernel/dma/swiotlb.c
>> +++ b/kernel/dma/swiotlb.c
>> @@ -107,6 +107,7 @@ static struct io_tlb_mem io_tlb_default_mem;
>>   
>>   static unsigned long default_nslabs = IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
>>   static unsigned long default_nareas;
>> +static bool swiotlb_size_set __initdata;
>
> Nit: there are various ways and reasons that the size is set in general; 
> could this please be named something clearer, e.g. 
> "swiotlb_cmdline_size_set"?
>
>>   /**
>>    * struct io_tlb_area - IO TLB memory area descriptor
>> @@ -269,6 +270,7 @@ setup_io_tlb_npages(char *str)
>>   		/* avoid tail segment of size < IO_TLB_SEGSIZE */
>>   		default_nslabs =
>>   			ALIGN(simple_strtoul(str, &str, 0), IO_TLB_SEGSIZE);
>> +		swiotlb_size_set = true;
>>   	}
>>   	if (*str == ',')
>>   		++str;
>> @@ -304,6 +306,11 @@ unsigned long swiotlb_size_or_default(void)
>>   	return default_nslabs << IO_TLB_SHIFT;
>>   }
>>   
>> +static bool __init swiotlb_default_size_changed(void)
>
> ...and then do we really need a trivial wrapper function with the exact 
> same scope as the variable itself? (Plus the name is similarly confusing 
> as the places this is used are themselves potentially changing the 
> default size, if you consider "default" to mean "not explicitly 
> specified"...)
>
> With the naming improved,
>

Updated and dropped the helper.

>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
>


-aneesh

