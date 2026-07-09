Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926E6C44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUa4DCeBsT3foJjCJG2XE9YpJSrIz+JoZRgA3Lr+fis=; b=Ihmrlj9uYX7XEI4Uj2sJbuAtgF
	/Y12cLi9HntXtVBvJMY8iDnrkxX6nPt0iV/Y8n6dwN8oXZ7ENKIazWr1x19GHspW4DmiHUzLf/tk0
	kBH44Q4NRRHT+tsecSPcacY8izLYioy/f8iqTX53VEm4S5gHCdeTFaIkcuc0MfzC06Er616y/kIg2
	HlKiqpQGmpdeCFZxWP8YQGz83bukLMgI0u/enOyW7TMiNdcr9ioGuRTKubDAiOp1vASj/bVaBHGnV
	phMCSvCAFAnQS6epuU9/A9SWWK7YDSzzpm8FI44Ys/yOToUuOYMv81OOajWXhH3ihVzpSp/EdvRTo
	JhL+2JjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpP9-00000002iBV-1aAh;
	Thu, 09 Jul 2026 14:07:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpP6-00000002iA8-1ZfD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 14:07:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99DCC3592;
	Thu,  9 Jul 2026 07:06:54 -0700 (PDT)
Received: from [10.164.19.51] (unknown [10.164.19.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48AC13F66F;
	Thu,  9 Jul 2026 07:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783606018; bh=pViZnXqb0KK79+fc1RT7BtJbAnFIoRae4s0WiebrD2M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uTLDDJyTau3bLABjLLUAsXZO0NoEZRNeb++v4NI9cdsz68VOrDAXfXOCvz0JxeJP5
	 TdKkVpVoyWtqcO22Fa0UYGdig7M0ZBrMq8ZkE9GEj1QP9QqyUPY2QkekeaLbjGN1dc
	 xmIxx9Au4olfGye1Kv3FMM04Q01FEXdKVODZmmEc=
Message-ID: <9ec6f07f-6019-493b-9781-5a743b820062@arm.com>
Date: Thu, 9 Jul 2026 19:36:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] KVM: arm64: Record whether pKVM stage 2 mapping is
 cacheable
To: Marc Zyngier <maz@kernel.org>
Cc: Bradley Morgan <include@grrlz.net>, Oliver Upton <oupton@kernel.org>,
 Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>,
 Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260701192428.17430-1-include@grrlz.net>
 <a3b2423e-d8bc-4713-90ef-5bfac7079834@arm.com> <87echh6xuh.wl-maz@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <87echh6xuh.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_070704_461165_37EA882C 
X-CRM114-Status: GOOD (  16.02  )
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



On 06/07/26 12:57 am, Marc Zyngier wrote:
> On Sun, 05 Jul 2026 15:08:58 +0100,
> Dev Jain <dev.jain@arm.com> wrote:
>>
>>
>>
>> On 02/07/26 12:54 am, Bradley Morgan wrote:
>>> pKVM keeps its own mapping list for stage 2 operations. Its flush path
>>> uses that list directly, so it lost the PTE attribute check done by the
>>> generic stage 2 walker.
>>>
>>> Record whether a mapping is cacheable and skip cache maintenance for
>>> mappings that are not cacheable.
>>>
>>> Fixes: e912efed485a ("KVM: arm64: Introduce the EL1 pKVM MMU")
>>
>> Is Fixes tag required? If I am reading correctly, Arm ARM says this:
>>
>> "For VA-based cache maintenance instructions, the instruction operates on the
>> caches regardless of the memory type and cacheability attributes marked for
>> the memory address in the VMSA translation table entries. This means that
>> the effects of the cache maintenance instructions can apply regardless of:
>>   Whether the address accessed:
>>     Is Normal memory or Device memory.
>>     Has the Cacheable attribute or the Non-cacheable attribute."
>>
>> So nothing goes wrong if we do dcache clean for non-cacheable
>> memory.
> 
> Two things:
> 
> - having to perform CMOs for something that is not *expected* to be
>   cacheable is both pointless and a contradiction of the intent
> 
> - what you quote is about the nature of the *mapping*, and not the
>   memory that is being mapped. Cleaning a dirty cache line on an
>   unsuspecting MMIO endpoint is never going to end nicely. Just have a
>   try.
> 
> My reading of all this is that a fix indeed is required, and therefore
> a Fixes tag *must* be present.

Thanks for explaining.


> 
> 	M.
> 


