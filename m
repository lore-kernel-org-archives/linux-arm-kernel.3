Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA7BCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 14:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIlNsIQj0kEdipfyw8JGQsqqTUPEkGp3JCVuP8lQoQ0=; b=CkUhEKf8U0yDy6A8uzMrzSbdSc
	uJMBBVZfqYb/LrDXIYTai9NUfvri5xfNXtGnICkOLz3ZVIzH5ALgI6FwjzWwBGzZsNd+/6J7g46lx
	JqLOepx1XVJc8wLrvaX9vFxxyAWhyEd82fmb6gxCOMbJ6xuq+XLqGMGHCKbKKU1IB9wBUmyeghSEK
	wi0QxLAY8OgCUPHpj/5bROdmwYLrZ3zCWDhYuRJptH5maIBTrVpaLF9W00raWmOb+Lxy+IqtMcx39
	f/3fLNulCbt0gk8ZR1beSnFophP87xwc2q26TyCsILNnYTMR3NxQM786/taEQae1Jkz7EUZFjH/k7
	5xpaD7fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waaRA-00000002ae6-3Lxg;
	Fri, 19 Jun 2026 14:43:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waaRA-00000002adz-1ego
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 14:43:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E793601E2;
	Fri, 19 Jun 2026 14:43:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDDD31F000E9;
	Fri, 19 Jun 2026 14:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781880195;
	bh=EIlNsIQj0kEdipfyw8JGQsqqTUPEkGp3JCVuP8lQoQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=buwtobMkHr0DOLNc9UZX4q/YAVNcCwXujLYAR3XthpBhEGfYbwZnA/ZnRvByeDUES
	 2FCVOCqelalG++ypX+KppY6r5T4wrNrqDpKDEDyHT8O4d9kbDWwEV6BWYtFdqGB5+L
	 Y9p/IAYmPnDONSJdyy3hwExxSJyNe0jGjPsge2iCeI7w2lGGX7GR+EG5sOOUU+5DZ5
	 rmKHM7/ge3QmAvWr6PdYejC90q4QKcohKhFbzMCCo5IxI1TWEpa2Rl53TYKWXN04xs
	 S2vh6jPiCEnJfLmS3KoAu9b+i63HX0wbKeaAp7k0ZIHSYSkc2JcrrK+nPsFOpclvJd
	 UBXYkbGvDG2qA==
Date: Fri, 19 Jun 2026 15:43:10 +0100
From: Will Deacon <will@kernel.org>
To: Yu Peng <pengyu@kylinos.cn>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, lpieralisi@kernel.org,
	guohanjun@huawei.com, sudeep.holla@kernel.org
Subject: Re: [RFC] arm64: early_ioremap fails to map ACPI MADT on 64K pages
Message-ID: <ajVVfnGIq_6zt2jC@willie-the-truck>
References: <20260617060110.2846851-1-pengyu@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617060110.2846851-1-pengyu@kylinos.cn>
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

+arm64 ACPI maintainers

On Wed, Jun 17, 2026 at 02:01:10PM +0800, Yu Peng wrote:
> I hit an early boot failure on an arm64 system built with 64K pages while
> parsing the ACPI MADT.
> 
> The failing system reports:
> 
>   PAGE_SIZE: 64K
>   MADT physical address: 0x5a7ae018
>   MADT length: 0x32094

The MADT isn't even 4k aligned, so why does the page size matter in this
case?

> The failure happens when acpi_table_parse_madt() calls into early_memremap()
> via __acpi_map_table(). The MADT itself is smaller than 256K, but its
> placement causes the early mapping to require 5 64K pages:
> 
>   offset within 64K page = 0x5a7ae018 & 0xffff = 0xe018
>   mapped range           = PAGE_ALIGN(0xe018 + 0x32094)
>                          = PAGE_ALIGN(0x400ac)
>                          = 0x50000
>   nrpages                = 0x50000 / 0x10000 = 5
> 
> On arm64, NR_FIX_BTMAPS is currently derived from a 256K per-slot budget:
> 
>   #define NR_FIX_BTMAPS        (SZ_256K / PAGE_SIZE)
> 
> So for 64K pages, NR_FIX_BTMAPS is 4. The mapping therefore fails the
> early_ioremap() check:
> 
>   if (WARN_ON(nrpages > NR_FIX_BTMAPS))
>           return NULL;
> 
> After that, MADT parsing fails and the boot continues with symptoms such as:
> 
>   ACPI: APIC not present
>   missing boot CPU MPIDR, not enabling secondaries
>   Kernel panic - not syncing: No interrupt controller found.
> 
> A firmware change can avoid this by placing MADT so that:
> 
>   (madt_phys & 0xffff) + madt_length <= SZ_256K
> 
> However, I do not think ACPI requires such placement, so this looks like a
> kernel-side robustness issue as well, especially on large arm64 systems where
> MADT can grow with CPU topology.
> 
> One possible kernel-side change is to increase the boot-time mapping budget for
> CONFIG_ARM64_64K_PAGES, for example using a 512K per-slot budget only in that
> configuration. I do not think this should be applied unconditionally to all
> page sizes, since the arm64 early fixmap code expects the boot-ioremap range
> to stay within one PMD.
> 
> Has anyone seen similar failures on arm64 64K systems?
> 
> Would maintainers prefer treating this as a firmware layout issue, or would
> increasing the early_ioremap budget for 64K pages be acceptable?

It think it boils down to what ACPI says about the alignment of the MADT.

Lorenzo?

Will

