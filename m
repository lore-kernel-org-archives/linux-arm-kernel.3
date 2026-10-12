Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F11CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 15:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9RalS/cTcqwsvzfIqCagLYWCk6dkc4dqFyKF+MlULZ8=; b=i/hBRNCOY0gSivy9ERUDL+YGWe
	8hTr2SzA8f7Yr+OMQzd8iOee7l3qwooZrTZmmxHPzo21w69TprrDeT7ynCdPVEPMZ4habhydelo84
	IoCYfU5nGINkYzg/VZGlAAGw9qnVOaRPah7ME2Z3vs6+WHl1+4O2Zb61ZCI+JduOU3cT3fBCEqqvW
	WtdfLh+g0T0W0hnDn8j6f81p5c7kdHfG5YpxEVq1ufjn42fGoK7yzKNlS6H2zdQmhwOtE7psvMI05
	PAY991yiI9JL0NoKHlQ/8x7XDbxzYDi9CL/PK8aEgY3gW5bnvP/tNQ4sH5AACsHVxGCqmIQA+nzs7
	oj+T34eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGI0r-0000000AoOj-42W3;
	Mon, 12 Oct 2026 15:32:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGI0q-0000000AoON-1LCJ;
	Mon, 12 Oct 2026 15:32:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BDC2A6020F;
	Mon, 12 Oct 2026 15:32:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932731F0089C;
	Mon, 12 Oct 2026 15:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791819147;
	bh=9RalS/cTcqwsvzfIqCagLYWCk6dkc4dqFyKF+MlULZ8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=BLfowVUDFCXLcBE+jUBEJcCE17njSGG/cEAXjI9SvlCmRgJ0RrMUebOvIcBAL22BB
	 A5D1Ri6caBnDzMOyvw37AhfMKib7RzMuriZqCSELM5q15v3sxBzfQ8n7TqBMg1MALg
	 f3P+U+A9SBVHtbrlZkYfADTjPQJMACeNex5p7EwJsb/Q6fyY5ByM1kTOML9DLEjduS
	 vg1xLLhUq2LLv9TqJQ7596pdNj928fQNhattCPpvQEci98nbFuNBOI20aOTmMGRjbI
	 iabjxCy/wtzovR4naUlpBT1NouVwoL8cfFW609Er4QIxLWEecFqpPCxGaIiRJ9emGT
	 3iz/OYxGy2RzQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Oscar Salvador
 <osalvador@suse.de>, Dave Hansen <dave.hansen@intel.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, =?utf-8?B?Qmo=?=
 =?utf-8?B?w7ZybiBUw7ZwZWw=?=
 <bjorn@rivosinc.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin
 Brodsky <kevin.brodsky@arm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Alistair Popple <apopple@nvidia.com>,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Muchun Song <muchun.song@linux.dev>, Muchun Song
 <songmuchun@bytedance.com>
Subject: Re: [PATCH v2 2/4] riscv/mm: fix hotplug page-table destructor
 handling
In-Reply-To: <20261010112457.49485-3-songmuchun@bytedance.com>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
 <20261010112457.49485-3-songmuchun@bytedance.com>
Date: Mon, 12 Oct 2026 17:32:15 +0200
Message-ID: <87ik37aq9s.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Muchun Song <songmuchun@bytedance.com> writes:

> RISC-V uses the same memory-hotplug teardown code for linear-map and
> vmemmap page tables. Late linear-map allocations run page-table
> constructors, while vmemmap and early allocations may not.
>
> free_pte_table() unconditionally calls pagetable_dtor(), corrupting
> NR_PAGETABLE accounting for constructor-free tables. free_pmd_table()
> avoids that for vmemmap using is_vmemmap, but mapping type is not a
> reliable proxy for constructor state. In particular, it becomes invalid
> once runtime vmemmap tables use the normal pgalloc helpers.
>
> Introduce free_pgtable_page() to select free_reserved_page() for reserved
> pages and pagetable_free() otherwise. The latter runs the destructor only
> when PageTable() is set, handling both constructor-backed and
> constructor-free tables.
>
> Fixes: c75a74f4ba19 ("riscv: mm: Add memory hotplugging support")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Nice!

Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>

