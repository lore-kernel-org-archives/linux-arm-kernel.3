Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F33ECD6E4C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 08:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VvDYhItoRkSY+VDYaOrv7BbQfnd5C296YbD9BNrMnV8=; b=zwgD4NKE3ePaBCeRopA7NGcno5
	AVbtUc4f23Al5GGa2BSPQ8hSjYbTjv8hE5zBH6SQwMEfh1o+UBYe5NfWlC31QuXa8Z0fTuNrHfbP9
	B9YYQURXXE4fUXHrLdqUyMEMV71YQCEKZY9PlMR+Y45/ZqCE5gI/1/EupaMKtMe+ovpChbAfja5V+
	gnQM4D+eg2ybOOylqxaMjjACh6eszDblr5PHHqzbQHeSWq2hyYyQ2rIBnteTO5Cp027NDRBku7TyF
	SA875D9srwotyYhgIyBrcWFoGWlSdow58pzlSXlLigIfqAQJWNZ2JWg5bBO3HHyxmSNA5Ml1P+QDu
	Woq03pkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTy99-0000000AN4L-3Jec;
	Mon, 01 Jun 2026 08:37:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTy96-0000000AN3r-3rXp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 08:37:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6BEF1E8D;
	Mon,  1 Jun 2026 01:37:07 -0700 (PDT)
Received: from [10.57.94.8] (unknown [10.57.94.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 367EE3F93E;
	Mon,  1 Jun 2026 01:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780303032; bh=KhZVl+Vwqx0OaCH6S7jXIByk6u8k8lh7Uhiuy+3SVi0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PZxls1oXIsr6hApf9XohwV3WTI1Qo/Er1dviSU6itCMJmAKDxMZHODtjuGAfErgJl
	 6867qR2HsryNZcylx+G0a/AX10BCLvlvPK4pBvuCBYe/sz6hhDG0C2A1TIs2eBczWC
	 E1gn7G1PE54lFFInYxUKOqbSvwpx/gKLHzFd0Yb4=
Message-ID: <69488547-cf2a-4aa0-bca7-0cb65aa01914@arm.com>
Date: Mon, 1 Jun 2026 10:37:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/15] arm64: Move fixmap and kasan page tables to end
 of kernel image
To: Ard Biesheuvel <ardb@kernel.org>, Ard Biesheuvel <ardb+git@google.com>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>,
 linux-mm@kvack.org, linux-hardening@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org
References: <20260526175846.2694125-17-ardb+git@google.com>
 <20260526175846.2694125-26-ardb+git@google.com>
 <2a6f9f05-ac57-4ef8-9328-74cc8ccfea16@arm.com>
 <96a8b6b9-71f2-4550-bbbb-fbfa146f4e6a@app.fastmail.com>
 <b76b327f-612e-494f-b8d3-44108aa73d2a@arm.com>
 <feab72b8-2961-4145-ac5c-80e820bf1ce9@app.fastmail.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <feab72b8-2961-4145-ac5c-80e820bf1ce9@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_013717_104721_4926E385 
X-CRM114-Status: GOOD (  10.33  )
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

On 29/05/2026 16:47, Ard Biesheuvel wrote:
>>>>> +	/* fixmap BSS starts here - preceding data/BSS is omitted from the linear map */
>>>>> +	.pgdir.bss (NOLOAD) : ALIGN(PAGE_SIZE) {
>>>> Do we actually need the NOLOAD type here?
>>> Yes, otherwise it is emitted as PROGBITS, resulting in all of BSS to be
>>> emitted into Image.
>> That's rather strange, aren't the .pgdir.bss input sections already
>> NOBITS since __pgtbl_bss is only used on default-initialised globals?
> Not sure why, but the section was PROGBITS not NOBITS before I added the (NOLOAD)

I've had a closer look into this. Similar sections in other
architectures are all named .bss..<something>. If I rename this section
to .bss..pgdir, then indeed the compiler does emit an object file with
that section marked NOBITS:

$ readelf -e out/arch/arm64/mm/fixmap.o | grep bss
  [ 4] .bss              NOBITS          0000000000000000 0002ac 000000
00  WA  0   0  1
  [18] .bss..pgdir       NOBITS          0000000000000000 000750 005000
00  WA  0   0 4096

And then the linker does the right thing without having to use NOLOAD.

I was concerned that .bss..pgdir might get caught by BSS_SECTION(), but
it seems that the double dots are meant to prevent exactly that.

- Kevin

