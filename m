Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5287FFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 07:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PPTQwN6FHCEM1yLuNFwiLgAzpEKdINGGfUZaIfMV9DE=; b=jIRCIKp8h5ZCckUL/W1DhEcKgK
	gPPrcGANYg1C2NytbVVqpp9cLl/yiDVaGd5tJvJ8N1A2SPpGHczTGxqfQxcCf2BkHPhJkXhsM1MVL
	lFROjK6ywDehnPQsv+YYiOM7IBX0vv6KN6vjc1XkZ+BvFP6soXGJbDEEzMcxhmPZeabWl8U5848Gm
	Ams/rnpL6St4CpB6Vkup101H6CAY+jxg2ZP9x3nOEAcqYBZ75bSDKvMyxV4PdIQpchmAfgn0K0+U1
	glof1SahuXwZIdnvQCRKKBv4Oc8dE34TIDyzLAq/e+cV/TsJkCFqOC9EGJMjbgYBSwRBcKJAC+9NR
	BxzT9/FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHznN-00000003CP8-0U5P;
	Wed, 29 Apr 2026 07:57:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHznJ-00000003COi-3LJa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 07:57:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D5982574;
	Wed, 29 Apr 2026 00:57:10 -0700 (PDT)
Received: from [10.57.62.76] (unknown [10.57.62.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC0283F62B;
	Wed, 29 Apr 2026 00:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777449436; bh=PPTQwN6FHCEM1yLuNFwiLgAzpEKdINGGfUZaIfMV9DE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tu884VDNcnff9i319agoWfbHCU09dt7nv52tTghEcTpUmoE/TLPT0pXCWMeWZK+hR
	 5tZo5fr795P2mHfGf0u5pH2d+gOGMhuK62mkoBPTbQE/fpcwqBc2rXrefL8saY2apM
	 vGNABGXJYLp2iVd9jeWXE4aOkG4vyKK3pzyrtv+I=
Message-ID: <1ba0b6ce-3e71-45f7-a3c8-cdc5aadcaf27@arm.com>
Date: Wed, 29 Apr 2026 09:57:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/15] arm64: mm: Map the linear alias of text/rodata
 as tagged
To: Ard Biesheuvel <ardb@kernel.org>, Ard Biesheuvel <ardb+git@google.com>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-hardening@vger.kernel.org
References: <20260427153416.2103979-17-ardb+git@google.com>
 <20260427153416.2103979-18-ardb+git@google.com>
 <82091dd4-9d11-4054-89ec-99aadaeec7b2@arm.com>
 <6f514d91-c8ce-473f-8383-f3b9a4cc2f7a@app.fastmail.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <6f514d91-c8ce-473f-8383-f3b9a4cc2f7a@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_005717_970074_66A750BF 
X-CRM114-Status: GOOD (  12.38  )
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

On 28/04/2026 18:23, Ard Biesheuvel wrote:
> Hi Kevin,
>
> On Tue, 28 Apr 2026, at 16:16, Kevin Brodsky wrote:
>> On 27/04/2026 17:34, Ard Biesheuvel wrote:
>>> From: Ard Biesheuvel <ardb@kernel.org>
>>>
>>> Before moving the empty_zero_page into the __ro_after_init section, make
>>> sure it has the memory-tagged type. This is needed to ensure that
>>> cpu_enable_mte() will be able to initialize the tags correctly.
>> mark_linear_text_alias_ro() is called after all features have been
>> detected and enabled, so do we actually need this?
>>
>> AFAICT the lines that matter for cpu_enable_mte() are those, in map_mem():
>>
>>     __map_memblock(pgdp, kernel_start, kernel_end,
>>                PAGE_KERNEL, NO_CONT_MAPPINGS);
>>
>> It is probably this call that needs to be changed to use
>> pgprot_tagged(PAGE_KERNEL).
>>
> I see. I guess we should probably update both, no?

We could, but would we ever access the tags in data mapped read-only?
cpu_enable_mte() needs tag access to zero them, but AFAIU it's really a
special case that is only relevant to the situation where the data is RW.

- Kevin

