Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A39FD111A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 05:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnSkd78+Nuq+52uqp8ZZdNIRk+xiBu0ZIIKuyQ1661M=; b=ke3TkyIMOn5DR9Sr37qHC8E7VO
	q0NDeDcY5Ptw/romPlldLR0whbfwP+uyqLZYyihEMgV3vTiCR+yqi14J+i3tC8gu61blHmirU7hox
	6CaZlo0VnKjpZp4uBffplGF9SBV/J0O0d2NcYmqrGcyhcrpOlLwhNss6hdz7EiLM0/wdeqtC4CpSG
	tcwntekGFRw7cazH+z3Vf3r0AlL7S54rmRJOBpr2GT6hVaL1FlfGP/WZhvahvt2kG/u3yIiFsK3/C
	JQaejqsMmht+qqqWlsgHDCu5kWVDJOpNG7eEkvpf5ckttbidd5bfYRxdJmf7cfDF71deXvizWkvai
	MUetCgNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7pCU-0000000CegE-3F52;
	Mon, 04 Nov 2024 05:00:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7pAn-0000000CeUc-31tV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 04:58:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B741FEC;
	Sun,  3 Nov 2024 20:59:10 -0800 (PST)
Received: from [10.162.16.84] (a077893.blr.arm.com [10.162.16.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F2D93F66E;
	Sun,  3 Nov 2024 20:58:38 -0800 (PST)
Message-ID: <1a724b58-d61b-443d-9f3d-aebcd35e9610@arm.com>
Date: Mon, 4 Nov 2024 10:28:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Re-organize arch_make_huge_pte()
To: Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 linux-kernel@vger.kernel.org
References: <20241029044529.2624785-1-anshuman.khandual@arm.com>
 <173048223682.1108539.16990086073905192650.b4-ty@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <173048223682.1108539.16990086073905192650.b4-ty@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_205842_064614_5A5416AA 
X-CRM114-Status: GOOD (  13.63  )
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



On 11/1/24 23:05, Catalin Marinas wrote:
> On Tue, 29 Oct 2024 10:15:29 +0530, Anshuman Khandual wrote:
>> Core HugeTLB defines a fallback definition for arch_make_huge_pte(), which
>> calls platform provided pte_mkhuge(). But if any platform already provides
>> an override for arch_make_huge_pte(), then it does not need to provide the
>> helper pte_mkhuge().
>>
>> arm64 override for arch_make_huge_pte() calls pte_mkhuge() internally, thus
>> creating an impression, that both of these callbacks are being used in core
>> HugeTLB and hence required to be defined. This drops off pte_mkhuge() which
>> was never required to begin with as there could not be any section mappings
>> at the PTE level. Re-organize arch_make_huge_pte() based on requested page
>> size and create the entry for the applicable page table level as needed. It
>> also removes a redundancy of clearing PTE_TABLE_BIT bit followed by setting
>> both PTE_TABLE_BIT and PTE_VALID bits (via PTE_TYPE_MASK) in the pte, while
>> creating CONT_PTE_SIZE size entries.
>>
>> [...]
> 
> Applied to arm64 (for-next/misc), thanks!
> 
> [1/1] arm64/mm: Re-organize arch_make_huge_pte()
>       https://git.kernel.org/arm64/c/f8192813dcbe
> 
> I think we can now get pte_mkcont() to only set PTE_CONT without
> touching PTE_TYPE_PAGE. Previously it wasn't possible because
> pte_mkhuge() was clearing the PTE_TABLE_BIT and we added it back via
> pte_mkcont(). Give it a try and send an additional patch cleaning up
> pte_mkcont() if this works. Thanks.

Yes, it does indeed work. Sent the following patch for the same.

https://lore.kernel.org/all/20241104041617.3804617-1-anshuman.khandual@arm.com/

