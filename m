Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24601C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 09:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmrb0YESjLDDQvAfrvXG5WhHbn9ivEjnRLF1FaaGt34=; b=SWy44TTgLntGqedC3XagjgRN0C
	QqEuKzu3VWAi9t0j5uE5Qi9oJDym8zGlk787JGFBwqf3p47WDVpOfJS6TvU3zf01DqICuW0jPNQvX
	QYlw5iCBIB5OAMJ/GwZcvj2WDr3Xmn490EpclAL+AI9rZCwyQFK7259j33CWSVnswwzroOCZyCr0V
	RS0wNZNA65Tri7fJ+J+FUzhAmU6Pxfj9silGjFazCSon/RH6AyR+ptQUvvHcXbIK6kmQxlnZ4wVBz
	b4D4qdRrM3lEKO3A/BolfmnHUlbrzWzI6v4qnmGf60EHNo2hS28pCv6gSh6ZkcYyvWgnNXu1ugHwW
	zB72JK4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KgY-0000000BPjI-2U36;
	Tue, 01 Sep 2026 09:21:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KgV-0000000BPi7-1Yww
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 09:21:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A380C1692;
	Tue,  1 Sep 2026 02:21:34 -0700 (PDT)
Received: from [10.57.7.38] (unknown [10.57.7.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 461E13F882;
	Tue,  1 Sep 2026 02:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788254498; bh=d//sRRyeATR2XER8C63DKurn876rElyS0ew2RlJKmyk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tFZaD8OomT/iBVMAGMTFX2gOOiDx9+faBP6Bu9/PxfBU5aQdrs4A/uRdFNPjZYhGV
	 lx2S3pjy1cYj8gr76k1bL3/U/0njq8fbKjy9pUshI1Xg4QqXwxOMUcFHXw3bRm7LQo
	 opNf+lP+KnVLOvnObXaXf5iEz7AJm/P/2ZVDSkd0=
Message-ID: <16f40b06-e871-4921-bbc6-42637c63e6bd@arm.com>
Date: Tue, 1 Sep 2026 11:21:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/4] arm64: mm: Map fixmap page tables read-only
To: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, Jann Horn <jannh@google.com>,
 linux-hardening@vger.kernel.org
References: <20260827164409.3421848-6-ardb+git@google.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260827164409.3421848-6-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_022139_455914_1C5A1A06 
X-CRM114-Status: GOOD (  15.88  )
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

On 27/08/2026 18:44, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> This v2 now covers intermediate level page tables as well as the PTE
> level page table for the fixmap. The latter is a special case, as it
>
> a) is only accessed via the kernel image's mapping, and never via the
>    linear map (except for ptdump etc)
>
> b) must be accessible via a read-write mapping, as all manipulation of
>    read-only page table descriptors relies on the fixmap itself
>
> and so it is treated separately. The intermediate page tables may be
> shared with other mappings in the upper kernel/vmalloc region, so they
> must be updatable using the ordinary APIs.
>
> Build tested and boot tested on a Lenovo Yoga C630 using 16k pages.
>
> v1: https://lore.kernel.org/all/20260805104042.1107678-2-ardb+git@google.com/
>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Kevin Brodsky <kevin.brodsky@arm.com>
> Cc: Liz Prucka <lizprucka@google.com>
> Cc: Seth Jenkins <sethjenkins@google.com>
> Cc: Kees Cook <kees@kernel.org>
> Cc: Jann Horn <jannh@google.com>
> Cc: linux-hardening@vger.kernel.org

Looks like the Cc's didn't propagate to the actual patches, fortunately
my lei filters did catch this series ;)

Either way I quite like this series, it's an elegant approach and it
should increase security without overhead, what's not to like!

I also considered it from the perspective of kpkeys protection [1] and I
think they should work together fine. The kpkeys series still allows
page table setters to write to all page tables, so if we get a fault
there it must be because the target is read only, and not because of a
pkey fault.

- Kevin

[1] https://lore.kernel.org/all/20260818-kpkeys-v9-0-743ad31b2c8f@arm.com/

