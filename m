Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97619606C7EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 11:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W5PPwA5d;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=C6c17ZsM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VwYktvc9ZuSAG/AWyoWRNsgxr2Z6jBVkd5OucG0+82I=; b=W5PPwA5dLth/A7B1ejZG1bcFt5
	7N92hjGMRy+PyZtHK8jx5EPorNEZgwjeugYapRkiugVX6B7uYD8FxdF+5YlK4RLbWRV41hjhLuINJ
	aERpMP33NYC6+NhTmoMUh4BDydUKZxjDOCcDPJ19UYlBoc7DXM3VSbVUtdDjllWj7VUC6Pbcvvq84
	SjQ8xlYuqzzxqbFKT/t6PN/ZINnxKynVuAwlDXeWfJv6QnOj0GEKZsxNZrld7akdDjq55P8/Qimy6
	QPfgl5JRfFlhA8juHfxBjJcPi45Y5u9soCIEasB0jTwuXVFD44OTOMVmO9a9REZ5kOm2CXZG5L5Vg
	0vEfDmhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIBW-0000000C9j2-2C89;
	Fri, 06 Nov 2026 11:32:42 +0000
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIBT-0000000C9hV-13Tq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 11:32:41 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=zs6GksGR9IOQ4D/rhKg8wscXt05dWTxmDSpfW/B3uBQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793964755; v=1; x=1794569555;
 b=C6c17ZsMUH8pFXwUSY7A+iHs0UmIzAZX6Nz+5li1uZvQ+EdryCc3O3i4ud5NB9YEchaTZzF5
 Fxwij6DuSUsoD5A+dK/Fr1SgP4Kr/icu0yCZqIa6JMNeH7ptF9eRkE5N8zXvOtiMpxmBw0GhEdk
 BZQiW5Q+i7pALkiCYMtheiUw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7520b0e9489a9d6f;
	Fri, 06 Nov 2026 11:32:35 +0000
X-Mizu-Trace-ID: 7520b0e9489a9d6f
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bff701efa5so3203e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 03:32:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxlJefIhAkrzwkX19T0tGfnW5JXIV28oxkX74++o7mvQX5z1Qu70YhHPSnrEMWuWRqL54CuERWcf07ATh++xO+t@lists.infradead.org
X-Gm-Message-State: APuU4Z/8TV2pPqleqR0P0jIL762g8qD4d9b6W7gJRZx7KN2BDBrd35jA
	txdcXzfYZe1vCpbFPIHY7N9c2I8mXglQqBqspVMnofi6wf4f4GeT43KQJqTPL8EcuTjlSCHtdfm
	0WZORj7lnFt+po7A0UUIjmsBf2jFOVjIBW6kSR2ax
X-Received: by 2002:a05:6512:3c84:b0:5c0:1b9:2de8 with SMTP id
 2adb3069b0e04-5c006378923mr59625e87.0.1793964754169; Fri, 06 Nov 2026
 03:32:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-hyp-pool-and-map-v2-0-44a6ca90190b@cs.columbia.edu> <20261105-hyp-pool-and-map-v2-1-44a6ca90190b@cs.columbia.edu>
In-Reply-To: <20261105-hyp-pool-and-map-v2-1-44a6ca90190b@cs.columbia.edu>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 6 Nov 2026 11:31:57 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxXpA6sCrSmwRJBA=YKGfNP4zs-THhheRHTaq2BfYY-Lw@mail.gmail.com>
X-Gm-Features: AclHuK9gc8zZSVttdzXS2GHVj1w7PkDDqC-dBzIEQ_RXvW813sjnQFEQOIIR5dE
Message-ID: <CA+EHjTxXpA6sCrSmwRJBA=YKGfNP4zs-THhheRHTaq2BfYY-Lw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] KVM: arm64: Compute hyp early-allocation and pool
 sizes in 64 bits
To: xuheng@cs.columbia.edu
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_033239_679282_8BFEC9E2 
X-CRM114-Status: GOOD (  15.36  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Xuheng,

On Thu, 05 Nov 2026 22:59:48 +0000, Xuheng Li <xuheng@cs.columbia.edu> wrote:
> hyp_early_alloc_contig() and hyp_pool_init() both take a page count as
> an unsigned int and compute the size in bytes as nr_pages << PAGE_SHIFT
> in 32 bits.  For 4 GiB or more (nr_pages >= 2^20 with 4 KiB pages) the
> shift overflows.

Mostafa (Cc'd) posted a fix for the same truncation in July [1],
widening the parameters to unsigned long instead. Would you be OK
picking up his patch for v3, keeping him as the author and your
description and tags?

> Two of the regions that pKVM carves out at boot are sized from the
> amount of memory: hyp_s1_pgtable_pages() for the hyp page tables (hpool)
> and host_s2_pgtable_pages() for the host stage-2 pool both provision
> page-granular tables for all of memory, about one page per 2 MiB of
> RAM, so they reach 4 GiB on a machine with about 2 TiB of RAM.  Arm
> systems of that size exist, for example AWS Graviton4 x8g.metal-48xl
> instances (3 TiB) and Ampere Altra Max servers (up to 4 TiB per
> socket).

Could you also list the hyp vmemmap here? It's sized the same way and
overflows at 2 TiB too.

> On such a machine, divide_memory_pool() gets a truncated hyp page-table
> region from hyp_early_alloc_contig(), so the host stage-2 region and the
> FF-A proxy pages that follow it start inside the range that hpool will
> own.  hyp_pool_init() then attaches all nr_pages pages of each pool to
> its free lists, so hpool and host_s2_pool share pages and the same page
> can be handed out twice, for example as a hyp stage-1 table and as a
> host stage-2 table.  hyp_pool_init() also derives range_end and
> max_order from the truncated size, so most of each pool is treated as
> external order-0 pages; on a host whose IPA size makes the host stage-2
> PGD a multi-page allocation (for example a 42-bit PARange), that
> allocation fails and host_s2_zalloc_pages_exact() uses the NULL result.

Could you describe here what actually happens? I think pKVM init fails
before any page is handed out twice. Just below 2 TiB, hyp_pool_init()
for host_s2_pool hits the BUG_ON() in hyp_set_page_refcounted() on
hpool's page-table pages, and from 2 TiB up hyp_back_vmemmap() zeroes
the new hyp page tables while they're being built.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260715150125.2798116-1-smostafa@google.com/

