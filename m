Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90148CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 08:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCGUloykHYiuCuZEtw9fiqIuDOMh4v9mTor+YU1AuXs=; b=kKPKeb5DXEGNlQCwb+4rF8LQiG
	h8gjvURUF5NcXW7y4j3sGIqEOuSMNiYgNBXL6JdOhJ1RocCHfZ+9N5hZLepKOSiRB/cru3XgykXLv
	4jD4sn0UxiplLi4cj5vKpVJJPVrgFuaZO5OEte/DhdWlYmBOOQpaIUh7ijl2dO1b++LCLmHBEc7oy
	LmBFT/6YVxTbPcQB/OqxPvLsRyUklbQ1R5SuNNyVkE8CxuS7J6nmyFV+day2I2x7MoLRNe0Ku5esw
	kqVu7JkfppRrWdoEgngTTXf8hvbhAHJVDuJHPoDr0E5RFohFeLr4ZeDT/5139PsJ3M+SDXkkC9l5V
	ySE/tbyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJp0Z-0000000Cl6P-0xsP;
	Mon, 04 May 2026 08:50:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJp0V-0000000Cl5h-3DtT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 08:50:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A83531713;
	Mon,  4 May 2026 01:50:18 -0700 (PDT)
Received: from [10.57.34.72] (unknown [10.57.34.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6D133F763;
	Mon,  4 May 2026 01:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777884624; bh=FCMkZ9hkweao0c59LeiVz688RdDZQ8lSc3hEZVLOErk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vugjd43cPy1s2or/IKdw/90It0UtXRePbtH549/6cttjMFAgm9Gdw5rlF0k8TrWC0
	 6z8xwVelspAzl3e+lQ+ekhrPmZ5vMU0D9K2Wl9nCbaJCCexBDwY0/8LBrXBEpFJPOf
	 gEIFSygQ8vdYubxqMBnzuD3iSgcy8OysDOF8lTgQ=
Message-ID: <49eb450b-0045-4add-b993-a8b518514c34@arm.com>
Date: Mon, 4 May 2026 10:50:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/15] arm64: mm: Map the kernel data/bss read-only in
 the linear map
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
 <20260427153416.2103979-29-ardb+git@google.com>
 <a8740f95-e167-48ae-ae65-97c6701d9c94@arm.com>
 <9ff1d19d-f3f8-4106-aeeb-66c4c21742b9@app.fastmail.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <9ff1d19d-f3f8-4106-aeeb-66c4c21742b9@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_015028_026903_6059CDC7 
X-CRM114-Status: GOOD (  12.52  )
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

On 29/04/2026 16:46, Ard Biesheuvel wrote:
>>> @@ -1155,7 +1157,11 @@ static void __init map_mem(void)
>>>  	 * of the region accessible to subsystems such as hibernate,
>>>  	 * but protects it from inadvertent modification or execution.
>>>  	 */
>>> -	__map_memblock(kernel_start, kernel_end, pgprot_tagged(PAGE_KERNEL),
>>> +	__map_memblock(kernel_start, init_begin, pgprot_tagged(PAGE_KERNEL),
>>> +		       flags);
>>> +
>>> +	/* Map the kernel data/bss so it can be remapped later */
>>> +	__map_memblock(init_end, kernel_end, pgprot_tagged(PAGE_KERNEL),
>> Maybe I'm missing something obvious, but considering patch 3/4 couldn't
>> we directly map the range RO here?
>>
> After 3/4, __map_memblock() will no longer combine new mappings with existing
> ones into block mappings or contiguous ranges. However, it will still set the
> requested type and permission attributes on the entire range, and so the second
> invocation is needed to restore the read-only bit.
>
> IOW, we could also map it read-only twice, the result would be the same, but the
> second call is still needed.

Got it, thanks.

- Kevin

