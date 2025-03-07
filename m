Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69337C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 18:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CLx4leN4ymPiYXrLGF1EUEnPJvAHbrGxQYwMqyVsB0I=; b=V7t/b2u1obQs9aTTR/753OVYat
	wQi2rW43CnWpBHVqiU15hOg06J/a8k7Wp60w8K1U1CkbbIRnjEDjGAapmMcKsE9E950TKugkQG1a7
	ULKEozHMi5J8y/8uKwEQAIsHyhh+Sctm1hh2xucm2ZTPDjpM27tCj5ITipN1gCHKMYycVQlXw17TV
	LIC8jI8SYyHPZN11ZhTeNAgbNoFqxLHm6wGUmG8EIkiOfjXINsc/L9lfIKgswsPFZQ3Rk0BiZkjJ6
	rtTRdZVZv9hYT0yDrdpUsDT/GhGwazkxlaFTp/9XULlMpgD0E5OgTugvdkuObsIyp2uR0md1GJvaK
	W0b1k3tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqcr0-0000000FGTL-0Hbo;
	Fri, 07 Mar 2025 18:55:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqcpM-0000000FG1w-2Ts7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 18:53:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98B5A1477;
	Fri,  7 Mar 2025 10:53:53 -0800 (PST)
Received: from [10.57.37.135] (unknown [10.57.37.135])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C3673F66E;
	Fri,  7 Mar 2025 10:53:39 -0800 (PST)
Message-ID: <4c621070-688a-4a75-9134-ea19b6d20f04@arm.com>
Date: Fri, 7 Mar 2025 18:53:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: mm: Handle PAN faults on uaccess CPY*
 instructions
To: Catalin Marinas <catalin.marinas@arm.com>,
 =?UTF-8?Q?Kristina_Mart=C5=A1enko?= <kristina.martsenko@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Tong Tiangen <tongtiangen@huawei.com>,
 James Morse <james.morse@arm.com>
References: <20250228170006.390100-1-kristina.martsenko@arm.com>
 <20250228170006.390100-3-kristina.martsenko@arm.com>
 <Z8s-4OPE2DNSogwB@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <Z8s-4OPE2DNSogwB@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_105344_675559_A1182254 
X-CRM114-Status: GOOD (  11.72  )
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

On 2025-03-07 6:45 pm, Catalin Marinas wrote:
> On Fri, Feb 28, 2025 at 05:00:05PM +0000, Kristina Martsenko wrote:
>> +bool extable_insn_may_access_user(const struct exception_table_entry *ex,
>> +				  unsigned long esr)
>> +{
>> +	switch (ex->type) {
>> +	case EX_TYPE_UACCESS_CPY:
>> +		return cpy_faulted_on_uaccess(ex, esr);
>> +	default:
>> +		return true;
>> +	}
>> +}
> 
> Not a problem with this patch but I wonder whether we should return
> false for EX_TYPE_LOAD_UNALIGNED_ZEROPAD for completeness

Or maybe rather, true for EX_TYPE_UACCESS_ERR_ZERO and then false in the 
default case?

> (and remove
> the EX_TYPE_KACCESS_ERR_ZERO, it's no longer used. 

I think that's just hidden in the macro swamp of 
__get_mem_asm()/__put_mem_asm()...

Cheers,
Robin.

