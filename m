Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1991CC61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 12:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aceFjlRhhVLZ90elGDabHBPqZJUEfYBPbWijqEROSyk=; b=sdMP3IZgUyTudj2qQJK6UQVIxj
	bexV9xd85kgJFqLXlZQc40j+np4Zr00u3YYHnlLdj6Edfa0r7rX0Cy0+DSEAbhu5gXR46PBPMwWtI
	c1Maxl6AautgBNZV48I+9mJgo+675eamTNPghRgzuOUk9gE/2dj0uGwjgB4dl2UOu3tLncQEsEzt3
	WYOgu1mmqcPLx05flm6dRD51bnP4ia4uLNA/BkZiLSDbWBzUebp9CK410yCojlF9eMNcjHIwGUGum
	VUl2pF7sznRZjQmCKNF+6VPEYtnpJVVkep6khRQv+lSC+m9NcwzF2xlBq2OjguvvUwldbK6PfnFD4
	/236LUkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZJY-00000003yV0-2wUP;
	Thu, 27 Aug 2026 12:34:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZJW-00000003yUX-1SP3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 12:34:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42311169E;
	Thu, 27 Aug 2026 05:34:33 -0700 (PDT)
Received: from [10.43.16.29] (e126510-lin.lund.arm.com [10.43.16.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35A1A3F85F;
	Thu, 27 Aug 2026 05:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787834077; bh=aceFjlRhhVLZ90elGDabHBPqZJUEfYBPbWijqEROSyk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dbZVvGlPRVGbMOS9gpMYjRRCIrdm/QR6t04nNlV0cgrjLxA3CJUJiRs58GGu8Mq8c
	 0YtvNrcJKGCOaIxn+JC43gVTyluTOGINgGl4oSHWKXmwNzKvd8GUBnu95X8PRRAOBp
	 v3EndSvhaD48jivJgnVBYGGyqnGbxVAStJx05gUA=
Message-ID: <e4e7b0d3-e982-4c42-8907-fcb04c7ac83c@arm.com>
Date: Thu, 27 Aug 2026 14:34:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] arm64: mm: Map fixmap PTE tables r/o in the linear
 map
To: Ard Biesheuvel <ardb@kernel.org>, Ard Biesheuvel <ardb+git@google.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, Jann Horn <jannh@google.com>,
 linux-hardening@vger.kernel.org
References: <20260805104042.1107678-2-ardb+git@google.com>
 <5a3b89a6-bc42-42c3-82e8-25d6f1a2c5d2@arm.com>
 <a277a83a-cc01-443d-be42-775ce0bc96dd@app.fastmail.com>
 <c33d081b-7886-4db2-b1d9-61dc195844e5@arm.com>
 <1c0299ab-9f5f-4c7b-826e-a0547f7863dd@app.fastmail.com>
 <aacacc48-4e20-423f-b1cd-d8593485bf9d@arm.com>
 <00b4326d-af1c-429d-9495-c65ed5ce184f@app.fastmail.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <00b4326d-af1c-429d-9495-c65ed5ce184f@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_053438_438943_31A01E5C 
X-CRM114-Status: UNSURE (   7.71  )
X-CRM114-Notice: Please train this message.
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

On 27/08/2026 12:16, Ard Biesheuvel wrote:
>>> I'm currently experimenting with using __put_kernel_nofault() to update
>>> the descriptors at all levels (including PTE) and handling the fault
>>> using the fixmap approach. That way, all statically allocated page
>>> tables could move to .rodata (except bm_pte[]) and there should be no
>>> substantial performance impact.
>> Doesn't that still mean modifying a fixmap PTE every time we update
>> kernel page tables? That doesn't exactly sound cheap.
>>
> Only the ones that were allocated statically, which cover the region
> around the kernel image, and the special cases (fixmap, kasan). Everything
> else is allocated dynamically, using memblock_alloc() if very early
> during the boot.

Ah yes I see! Then it does sound very reasonable, those page tables
should rarely be written if at all. For kpkeys that would mean we would
just need to map bm_pte with the special pkey to complete the
protection, the rest being already RO or pkey-protected.

- Kevin

