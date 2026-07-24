Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC304C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 18:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CkcDlQm95hN79BG8pe6Fnyvb5ldSCmP0zDkjVIL3cc=; b=X1UZnshL+e4OlCflsbziVYdp0l
	4v7xBJCuNNXaSFCpbXK0LJSfme7lfHJM4FkN084TcKrKJIoQwNLEHHOWL1d2hLl8TwqHu0BBgtf/K
	ANm0prMAV8b2dAQTKBWH/6qZaZTLD2gEAxE9/FkoJF8rH4E0MLbKlo3CdOw4N+yhipAO24mAjUfQI
	NMEZnKQfaZFon/HQSZM9NPMssM5yfHXOCUb+0bCEnPYQYFgrUQwquNBQJFEiD/+BlLWXZE7B08thg
	BhGP56POJ1RD/p9UWJpXhHh+ckyixPwV6H0Mku8mKciUT7ZGudUfrrd2amoN/TmmI6rAO5H3Uv9PL
	TnM4znBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKgi-0000000H4Rv-0nlm;
	Fri, 24 Jul 2026 18:32:00 +0000
Received: from fhigh-a6-smtp.messagingengine.com ([103.168.172.157])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKgf-0000000H4RT-1HPr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 18:31:58 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id F1D331400106;
	Fri, 24 Jul 2026 14:31:55 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 24 Jul 2026 14:31:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1784917915;
	 x=1785004315; bh=4CkcDlQm95hN79BG8pe6Fnyvb5ldSCmP0zDkjVIL3cc=; b=
	F3zKcY6ui/Jp282wYGqdVRNgRDalIYqCVGhvFeD3uNQVV0fcly6MzeuwnaeiL91a
	vX0vRGPo9IkoHSVjzJbq7xQiYV2ln3G/ZbG6h/W20XV0w3TCOsuhn/c4U8WiIIks
	gQEfayauGm6cmgmc0NNmoxOskm9QlLpLlnmf9q5HBmhK8KcNzRLMZkirU//GLWHj
	b8UmNdU5Rn5S+YNvnMpA3G+4m8fzf41kUNNzpDo1LvWocZduCTe6+Tc+W92Qou+C
	X/5FP5qYQWOAA6h/j9/xPZC2wpM9bX840JRBmkIz84mFCAebuvliu/ry6TUZpzOv
	BboowxRtc4MoiSqwsSFZVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784917915; x=
	1785004315; bh=4CkcDlQm95hN79BG8pe6Fnyvb5ldSCmP0zDkjVIL3cc=; b=c
	GNtjvHXEs45YUTc4VEohpmjPSDhIujK79KOw6fs0VXrfWkVpdyIJ6lu/jW+GtXOx
	u0tcIPQ21UTAmJ6vUPIoZ3ykmMHzQlQ/QONzKqdadrZEiYCRsQlyw4qXxB6VqUd2
	xCdmz5RhNnc5P0bTxgzuboA0DDPmUuvCszGPUtiu0Z/LbdXoBDvScjhHdSa+9jgb
	LUncJ6oaI9D+kIMzILXIsWZIBMcQgeyYdvS73dWkyPaYvk1DfMgKzX2ytZelb/Uh
	3vylssaf47mgevCLkfsCE1cq1UcRiGbaVB6zS75RHu8AfCecP5onUuprzlxGGF2b
	rxHynxZeGR+hOrRhDkwVQ==
X-ME-Sender: <xms:m69jamMteFh-91H9NmO2ypPWZswGIYRvWieCSRX_m6eEaYKAh5XSDQ>
    <xme:m69javwYxTBEolSM2yxF_l57B7JKAK5h36HAiYMnklNUMhR-qZdf8nOb-zMDcpojf
    eXi0yksPv5MW_br3f-XdaVYGiWA8EDGxetJyB2sikKShjXJah94sZU>
X-ME-Proxy-Cause: dmFkZTFR72bfsXxreKNr4p0N2FRxElULeVEj58Qf1DbwxZn39e65uh/VNLKTcCj6dUgA8e
    dqNoimcV8oEtPYb1D+VMLbM2yFqL1twUGGJOdIqOrduKupVYAUyIUCVOxpFMCmLoFFq4Id
    ylXpS0BerA6RXpNnaCQOuAdgrMRwkqnzRIjQkNEXsEaibGkM73upKn/7twKRiEIHHhGGF5
    BhTgsMlMNaN0bcYjgT+4EMfoVsBCYFax2uqOYTAANciCXKzusOFJsvYf46Dh48wgxtf9L6
    FqZZvygPHL4res6xAp9ZzpKtQH4oIPIJzj2xpV+nD6bmDjcI/mz+Ww5eUeiKW2ZBmT7eaN
    koR5nQzmqun0AdeIF2qXNirk+ThWZ9LJLwxWFUSYBDyPNJxcECeitdoyzP9vGGa0tSNWmq
    fqt4arczBwwWvEd8DBuC75IEArzg/3ZhS0m0OdySUb+33jHDGoMP1pR5dy+VKKFNjrtyiR
    ZrxIH/PcBn0Bboh9QV/1T7jdA8f1yQz1ebpTBC6ux01Yue4kFruQM/BgYoo/9fTyzg8Csh
    3JBEAuHzMxZJkNaUKDUqMN6Rp9LmW7zwkf3VY+O8aIcL1w1D6RPqAUA//4ffjJK0ZYaaFu
    API8n7UIK5j+gd43IkngpvxGfBopUS3D6/uk0DEVn9TgQShbI4M6vSfNoEkg
X-ME-Proxy: <xmx:m69jaobn0fkHy6MLiegFJWNT19zjAVkEcw7v6mCg0CRiuRst1jWs_g>
    <xmx:m69jasVR5ptUmuLJtLGu75GMfSHNPUqh7N6fJIjW6MQ9DbRNCqDNuQ>
    <xmx:m69jaugWXdz0Qa44yTeCxJMQKk0KoETObjVQT9USoCxy16_u-JV5NA>
    <xmx:m69jaityiLvMhdatj9rZSBAC3WynuWK0z95eku7kDA6wqYTquw53LQ>
    <xmx:m69jamRJjrPQNkByTIpZOotD-S5OqV-R0reZYTjIEJ41HTVtPkkmFYAm>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6E5911820082; Fri, 24 Jul 2026 14:31:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A4FDpBWSXDKo
Date: Fri, 24 Jul 2026 20:31:35 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Karl Mehltretter" <kmehltretter@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Cc: "Russell King" <linux@armlinux.org.uk>,
 "Kevin Cernekee" <cernekee@gmail.com>,
 "Gregory Fong" <gregory.0xf0@gmail.com>
Message-Id: <0d6dbd8f-c5c5-49d2-b36e-3cdd404eb55b@app.fastmail.com>
In-Reply-To: <20260724174748.65958-1-kmehltretter@gmail.com>
References: <20260724174748.65958-1-kmehltretter@gmail.com>
Subject: Re: [PATCH v2] ARM: set !LPAE MAX_PHYSMEM_BITS to 32 and remove IO_36
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_113157_421326_8516ED4A 
X-CRM114-Status: GOOD (  16.75  )
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

On Fri, Jul 24, 2026, at 19:47, Karl Mehltretter wrote:
> An arm randconfig with CONFIG_GET_FREE_REGION=y (selected by
> RESOURCE_KUNIT_TEST, DEVICE_PRIVATE, CXL_REGION or DRM_XE) and the
> default CONFIG_WERROR=y fails to build:
>
>   kernel/resource.c: In function 'gfr_start':
>   include/linux/minmax.h:86:37: error: conversion from 'long long
>   unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes
>   value from '68719476735' to '4294967295' [-Werror=overflow]
>
> since commit 14b80582c43e ("resource: Introduce
> alloc_free_mem_region()") clamps against (1ULL << MAX_PHYSMEM_BITS) - 1
> in resource_size_t arithmetic, which is 32-bit without LPAE while
> arm's default MAX_PHYSMEM_BITS is 36.
>
> The 36-bit default exists for CONFIG_IO_36, added in commit
> 23bdf86aa06e ("[ARM] 3377/2: add support for intel xsc3 core") to let
> IXP23xx ioremap() I/O above 4GiB using supersections.  IXP23xx was
> removed in 2012, IOP13xx, the last user of addresses above 4GiB, in
> 2019 with v5.4, and PXA3xx as the only remaining XSC3 platform has
> nothing above 4GiB.
>
> Supersection descriptors have no domain field, as thos bits hold
> extended physical address bits.  36-bit I/O therefore required
> renumbering the protection domains to make DOMAIN_IO zero, and
> ioremap()'s supersection path is only compiled in that case.
>
> Remove IO_36, the alternate domain numbering, and the ioremap()
> supersection path.  Reject non-LPAE physical ranges beyond the
> 32-bit phys_addr_t limit before truncation, preventing faults from
> ranges crossing 4GiB.  Since high non-LPAE ranges are rejected
> before truncation, remove the corresponding static-mapping
> exclusion as well.  Reduce ioremap alignment from 16MiB to the
> 2MiB covered by a PMD's pair of sections.
>
> With that, LPAE is the only way to address more than 32 bits of
> physical memory, so use the 36-bit MAX_PHYSMEM_BITS default only
> there, matching phys_addr_t.
>
> Link: 
> https://lore.kernel.org/all/3c79d2dc-8fbd-40fc-8b2d-9d1b4f8ed34e@app.fastmail.com/
> Link: 
> https://lore.kernel.org/all/CAK8P3a2MCdUbN0QSb+M3g5_6HjPsaQwtKxFjADMZWomdry4-Ww@mail.gmail.com/
> Fixes: 14b80582c43e ("resource: Introduce alloc_free_mem_region()")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

This all looks very good to me, thanks for the updated version!

> Deliberately left in place: create_36bit_mapping() and the
> PMD_SECT_SUPER/SUPERSECTION_* definitions, now unreachable for
> device mappings.  A follow-up patch can remove them.

I'm not sure why you remove remap_area_supersections() but keep
create_36bit_mapping(). I would just remove that as well.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

