Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54219CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 02:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=segD3+8ZS3LE1n/y/n1VU6GjTGRurN5pKK9r7VTiX90=; b=5AhhNpgRfyQFGiUUpifl9PDwsI
	wMlc8XAvG5rQR0p4uCCdXYzLSNr3fiH0KzRfkpnUEuL3uS/EOWYdN/WPQhOKTry6TFbLS2YCDJk/q
	eE9XiarxrS5NUUf2z9Dx8AFf4kNYBi0lG1A8rEh9YrSkiJK31Do8n4SFdTGmKF6VVwL6KvOdTcSCz
	nHx5gH9BbEhjr1ek0B/NWwblB/r8Dx1I9Pwi0pV89+8+AXP2SOuPu+vvoW2H2mYk417AnaPDOC2PV
	zBY2YRYVYBTWS+bLp6fhLl3b+7FnU/BkQqj3lv42FvulD9PrtyLYRRIBWDfHQ/Tkgc9TEwxN4zTu+
	oFvNKGBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpID-0000000Eixz-0TYc;
	Thu, 06 Nov 2025 02:00:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpIA-0000000Eixb-39QJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 02:00:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6C3B168F;
	Wed,  5 Nov 2025 17:59:52 -0800 (PST)
Received: from [10.163.73.244] (unknown [10.163.73.244])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB8833F66E;
	Wed,  5 Nov 2025 17:59:58 -0800 (PST)
Message-ID: <044a6526-d6e8-4ae0-9279-8cc42bff5aa0@arm.com>
Date: Thu, 6 Nov 2025 07:29:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Add a fallback stub for pgd_page_paddr()
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org
References: <20251014110633.304961-1-anshuman.khandual@arm.com>
 <aQoORmgliayA0s_a@willie-the-truck>
 <e660e033-6300-4deb-b034-4d26746d8d01@arm.com>
 <aQuDdE_Tj3di7q3P@willie-the-truck>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aQuDdE_Tj3di7q3P@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_180002_838183_1F6A50C3 
X-CRM114-Status: GOOD (  11.96  )
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



On 05/11/25 10:33 PM, Will Deacon wrote:
> On Wed, Nov 05, 2025 at 08:24:40AM +0530, Anshuman Khandual wrote:
>> On 04/11/25 8:01 PM, Will Deacon wrote:
>>> On Tue, Oct 14, 2025 at 12:06:33PM +0100, Anshuman Khandual wrote:
>>>> Add a fallback stub for pgd_page_paddr() when (PGTBALE_LEVELS <= 4) which
>>>
>>> typo
>>
>> Sure will change - s/Add/Adds
>>>
>>>> helps in intercepting any unintended usage and which is also in line with
>>>> existing stubs for similar [pud|p4d]_page_paddr() helpers.
>>>
>>> Are you saying the kernel compiles in this case without your patch? Which
>>> definition of pgd_page_paddr() does it end up using?
>>
>> Kernel compiles for PGTBALE_LEVELS <= 4 just fine without this patch as both
>> its current users p4d_offset_phys() and p4d_offset_lockless() are wrapped in
>> with PGTBALE_LEVELS > 4.
> 
> Ok, but your patch is trying to catch broken users of the macro, right?

Right but there are no broken users at present because all the users are
wrapped inside #ifdef PGTBALE_LEVELS > 4.

> So my question is, would such a user compile today? If not, then your
> patch is pointless.

The point is this macro is not visible outside #ifdef PGTBALE_LEVELS > 4
where as similar ones such as p4d_page_paddr() and pud_page_paddr() are
always visible via their respective fallback stubs, when PGTABLE_LEVELS
are lower.

