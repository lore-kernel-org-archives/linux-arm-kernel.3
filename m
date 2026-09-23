Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DA5C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 14:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJ+xcGas6Gs0DUbNkFsLqUYTG/kJ0yvHazAmaBZ9DQc=; b=TtJGbCdq+SrwBJXGukeOD6mFLN
	gwhLN8v2SuOTvFx+Og2KdzSbuKIlwhcV9P9+0iJMyyLZ6ALjngUeJuK10BFOCenFHR+hlralD4uNt
	ieGkX7EFQ/NnrG+5syimfG+ktGkF+Ub6XrlHQm3Jm/bDjZkGEsNboDagc+DL/atQUD6mvYoxEt8Lm
	fB1UO2Bcz5t3rprgR1n3b0xbhz/k67TJV7CqY4uhQPrkY0cm64DsVXM6rLmxAaoyZJ6VH9uE4FS7r
	dZryU4XKSS9/8/Tp3pKhprMF4/V+ThTdinccn823mxpRa/uQTU2wc9ev7jjCguMIwm8by5EU5Dbrc
	egkVNYlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Nxz-00000008Wi7-260O;
	Wed, 23 Sep 2026 14:28:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Nxx-00000008Whj-3ANM;
	Wed, 23 Sep 2026 14:28:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3046C42E6E;
	Wed, 23 Sep 2026 14:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 671E01F00893;
	Wed, 23 Sep 2026 14:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790173737;
	bh=KJ+xcGas6Gs0DUbNkFsLqUYTG/kJ0yvHazAmaBZ9DQc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=gKi1uvT9tdO35/ODP00YcZaB1OEqOdJRXC43vCAtVa6/M+rRGUzFwrcEFzwLOcpM8
	 rFd8FKNGTwcNeaPZJWHgle4aXrscaEQgzv4xKlpwSHuHfa8mOnUXOSeK49Z1Cyp2jU
	 UGm/xAuJEzcqCQlbTOQ8w8JSwAyYh5Y3iAm3TlZ8hc3a46rYZqfHKqB/caJeoPyRSS
	 /zj2aVMtbmuIKRqQ0GaxIrliBpBI6zWSJwyasssqkyicL2r7QVdLv9yWU0w6X9G84P
	 DbwpUJekxBnSZqWqQEEPtZQ3gmRz621gb2mQKitAsMTjtTiWuylDjnHn8PUQB8+ZGO
	 YoEgEm2KBqXYg==
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
Subject: Re: [PATCH v5 4/6] dma: swiotlb: Centralize memory-encryption pool
 sizing
In-Reply-To: <644aa208-55f0-440c-94b9-75e58e588dde@arm.com>
References: <20260921063628.362078-1-aneesh.kumar@kernel.org>
 <20260921063628.362078-5-aneesh.kumar@kernel.org>
 <644aa208-55f0-440c-94b9-75e58e588dde@arm.com>
Date: Wed, 23 Sep 2026 19:58:36 +0530
Message-ID: <yq5awlsc11pn.fsf@kernel.org>
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
>> Memory-encrypted guests use shared or unencrypted memory for DMA and may
>> route all DMA through SWIOTLB. The default pool can therefore be too
>> small for I/O-intensive workloads.
>> 

 [ ... 133 lines skipped ... ] 

>> +/**
>> + * swiotlb_adjusted_size() - get the prospective adjusted SWIOTLB size
>> + *
>> + * Return the size that confidential-computing guest sizing would select for
>> + * the default pool, without changing the configured SWIOTLB size. An
>> + * explicit swiotlb= size is always preserved. An explicit area count is
>> + * included in the size calculation. Automatic area sizing is initialized
>> + * later from the running kernel's possible CPU map and any resulting size
>> + * adjustment is therefore not reflected in the returned size.
>> + */
>> +unsigned long __init swiotlb_adjusted_size(void)
>
> This is yet another misleadingly ambiguous name.
>

Do you have any suggestions for a better approach? This returns the
swiotlb size adjusted according to the existing heuristics.

>> +{
>> +	unsigned long nslabs, size = swiotlb_size_or_default();
>> +
>> +	if (swiotlb_default_size_changed() ||
>> +	    !cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
>> +		return size;
>
> And this makes for another needlessly convoluted calling convention.
>

I have updated this to

+static unsigned long __init swiotlb_adjusted_size(void)
+{
+	unsigned long nslabs;
+	u64 size = swiotlb_default_pool_size();
+
+	if (!swiotlb_cmdline_size_set &&
+	    cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)) {
+		/*
+		 * For SEV and TDX and CCA, all DMA has to occur via
+		 * shared/unencrypted pages. Kernel uses SWIOTLB to make this
+		 * happen without changing device drivers. However, depending on
+		 * the workload being run, the default 64MB of SWIOTLB may not be
+		 * enough and SWIOTLB may run out of buffers for DMA, resulting in
+		 * I/O errors and/or performance degradation especially with high
+		 * I/O workloads.
+		 *
+		 * Adjust the default size of SWIOTLB using a percentage of guest
+		 * memory for SWIOTLB buffers.
+		 *
+		 * The percentage of guest memory used here for SWIOTLB buffers is
+		 * more of an approximation of the static adjustment which 64MB for
+		 * <1G, and ~128M to 256M for 1G-to-4G, i.e., the 6%
+		 */
+		size = div_u64((u64)memblock_phys_mem_size() * 6, 100);
+		size = clamp_val(size, IO_TLB_DEFAULT_SIZE, SZ_1G);
+	}
+
+	nslabs = swiotlb_calc_nslabs(size, default_nareas);
+
+	return nslabs << IO_TLB_SHIFT;
+}
+

But as shown above, we apply the CoCo sizing heuristic only when no
explicit swiotlb= size was specified and guest memory encryption is
enabled.

>
>> +	/*
>> +	 * For SEV and TDX and CCA, all DMA has to occur via
>> +	 * shared/unencrypted pages. Kernel uses SWIOTLB to make this
>> +	 * happen without changing device drivers. However, depending on
>> +	 * the workload being run, the default 64MB of SWIOTLB may not be
>> +	 * enough and SWIOTLB may run out of buffers for DMA, resulting in
>> +	 * I/O errors and/or performance degradation especially with high
>> +	 * I/O workloads.
>> +	 *
>> +	 * Adjust the default size of SWIOTLB using a percentage of guest
>> +	 * memory for SWIOTLB buffers.
>> +	 *
>> +	 * The percentage of guest memory used here for SWIOTLB buffers is
>> +	 * more of an approximation of the static adjustment which 64MB for
>> +	 * <1G, and ~128M to 256M for 1G-to-4G, i.e., the 6%
>> +	 */
>> +	size = memblock_phys_mem_size() * 6 / 100;
>
> But mostly I fail to see how this makes any sense for the x86 
> crash_low_size_default() case anyway. This calculation is based on the 
> *total* system memory, of which 6% is likely comparable to (or perhaps 
> even more than) the *entire* amount of memory reserved for the crash 
> kernel itself. What's more, if the low memory and size restrictions are 
> lifted for regular CoCo SWIOTLB as people want, then it becomes even 
> more utterly nonsensical to tie crashkernel_low to this.
>
> Yes, this happens to be the behaviour that falls out of how two 
> different parts of the existing code interact, but I highly doubt it was 
> ever intentional, so I'm not convinced that complicating SWIOTLB 
> interfaces to blindly preserve it is the right thing to do.
>


I agree with the concern, but what would be the right solution? When the
crash kernel boots, it will try to allocate the SWIOTLB pool according
to this sizing heuristic, and the allocation may fail if insufficient
memory was reserved.

I have split the x86 crash-kernel changes into a separate patch, which
we can drop depending on the conclusion here. I must admit that I do not
understand the crash-kernel memory restrictions and allocation details
well enough to propose a solution.

-aneesh

