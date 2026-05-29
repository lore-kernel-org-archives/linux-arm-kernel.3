Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256E7CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 08:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Yr74bm5b1I6er6TsjOHvM8O63leqKbgA8DFDU1A6jw=; b=BV1+pHU4spRjOOQhBYlk/kH5b5
	XOm9/vxoZkq6xAWJTOasSJabxeRyVAJUJeFzM2K7XxkSfZmP7M0FpgiE6Xtqb+aGBESOZdERh9H4J
	2wXf6QleGO+nuOABa79COOH2w1r4PvFxHJkRAedx/9mAMVpr3o8qA1MMSmOt2dGLVCjxDdN9XFu5n
	odkDkaJvp7VgjHFAeTZN32WdWhfsstYdxn/Q5ENrQTtK7jlfOSHaG0utdhCZUBYxqlg1iagh2GMVZ
	vMVsYjZB5fEsb/BMio/KgF0ayU3p78Pkf95d+eBDEVYY1/1WD+XFnkliqXPbsoxkxFAEW8K9eIyNj
	b5HUNfiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsuF-000000070B8-0YqB;
	Fri, 29 May 2026 08:49:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSsuD-000000070AE-0CG1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 08:49:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20A2E204C;
	Fri, 29 May 2026 01:49:19 -0700 (PDT)
Received: from [10.57.91.162] (unknown [10.57.91.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 430AC3F632;
	Fri, 29 May 2026 01:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780044564; bh=0Yr74bm5b1I6er6TsjOHvM8O63leqKbgA8DFDU1A6jw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ivprReKsUadaCcTb8g0Y6fux7oLRv4zPPNFSi1TEM201qLpgF3A20EQN4tJDBDtM3
	 S0nbog1ouGDatXNHMgkBAd+V9ATrxI5QR8icYHXBy454uuQh3yuqWKsVaGy/XI47P3
	 ZKILKdQnLDYLJUH2p/YTF/kixb3dzjPrfQvx+zsA=
Message-ID: <32458c49-0e3c-4d27-b1cf-0e2d7ee0273d@arm.com>
Date: Fri, 29 May 2026 10:49:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 15/15] arm64: mm: Unmap kernel data/bss entirely from
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
 Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>,
 linux-mm@kvack.org, linux-hardening@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org
References: <20260526175846.2694125-17-ardb+git@google.com>
 <20260526175846.2694125-32-ardb+git@google.com>
 <22042b98-cfcc-428e-bb08-ebcfe785eb69@arm.com>
 <8082b77d-6522-472a-9030-317087ecd7e9@app.fastmail.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <8082b77d-6522-472a-9030-317087ecd7e9@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_014925_171213_1D162837 
X-CRM114-Status: GOOD (  18.07  )
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

On 29/05/2026 10:34, Ard Biesheuvel wrote:
> On Fri, 29 May 2026, at 10:29, Kevin Brodsky wrote:
>> On 26/05/2026 19:59, Ard Biesheuvel wrote:
>>> From: Ard Biesheuvel <ardb@kernel.org>
>>>
>>> The linear aliases of the kernel text and rodata are mapped read-only in
>>> the linear map as well. Given that the contents of these regions are
>>> mostly identical to the version in the loadable image, mapping them
>>> read-only and leaving their contents visible is a reasonable hardening
>>> measure.
>>>
>>> Data and bss, however, are now also mapped read-only but the contents of
>>> these regions are more likely to contain data that we'd rather not leak.
>>> So let's unmap these entirely in the linear map when the kernel is
>>> running normally.
>>>
>>> When going into hibernation or waking up from it, these regions need to
>>> be mapped, so map the region initially, and toggle the valid bit so
>>> map/unmap the region as needed. (While the hibernation snapshot logic
>>> seems able to map inaccessible pages as needed, it currently disregards
>>> non-present pages entirely.)
>> I'm not sure I understand this, is there something wrong with the
>> kernel_page_present() check in safe_copy_page()?
>>
> No. If the hibernate code decides to snapshot a page and it is not mapped,
> safe_copy_page() will do the right thing and map it on demand.
>
> The problem is that pages belonging to the kernel image are marked as
> PageReserved, and so the hibernation logic will not even consider the
> pages for snapshotting if they are not mapped.

Right I see the check in saveable_page() now. Maybe it would be worth
spelling it out in the commit message (hibernation logic ignores
non-present Reserved pages).

- Kevin

