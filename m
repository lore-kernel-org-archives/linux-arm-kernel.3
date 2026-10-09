Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AE5CA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 06:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HaXEEt+6oUYTgk3yLziOOP26vbiRye4IPhhc+D5Un/s=; b=22o2EjHitnhzUowIxCj7fhpwyU
	gbcuON5XGsiJ6YLwm90meQShgiXiut2+4j9MYNGwlNz1qfePCi7+bXzGMRS5SIBIOrFTjGMFbbTNm
	az1B1dgdbgdbx+1FVudxns1PQiuuiR1X4bgZSp9Hy0fuSUmn20aRv31lQKuoUEiwXxJtfam4cIahU
	u75TayPHDNB7vJW7UNtDTcQMcdrVS//rIWrhsZ33tuh5Irc6mydl3iWlOak3XPvPbdd43R4wGrnE7
	YPCV30q3rXnHonoA/o/3bzzk4xVf0Vdxc5VN97nNncVlLSFM/EjjMnIavqG/onR8QeAksatDIcYE1
	2rtXTf6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3nV-00000005acL-1iWT;
	Fri, 09 Oct 2026 06:09:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3nU-00000005acB-1xK7;
	Fri, 09 Oct 2026 06:09:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 879AA602C3;
	Fri,  9 Oct 2026 06:09:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC7FE1F000FF;
	Fri,  9 Oct 2026 06:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526175;
	bh=HaXEEt+6oUYTgk3yLziOOP26vbiRye4IPhhc+D5Un/s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=HWkN5KrlKIk6OWt38SO9fMGwArGXNLm8Sc0PCX7ZgeMYOylWuJpHNU8t2FYDltQLn
	 2hKVTP6VzNHCqHXVINEqZTs/LUesNwkJVsuSfNVRWiSG6EM+asdu7XUYpBPEPDbhyg
	 xxL2L457nAJjsnW9ul382bkmFZlkcJ0BfutYNMatFDZqAAKt4pPj7uICuTiy4ojVEP
	 ugz5q4KFQCUm7kDaKATbRD/9S7WIDuKfPfrxc0hLnTMVOL+lI7sBSP7t1MeAxfaysa
	 lqZ9eoh+QQZamGuMRiYovi7Gku403d6K2cuOnrn5lClA+St/Yv/3lziXSu4nT82KA4
	 ZsIxQ2m9QprXw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, stable@vger.kernel.org, david@kernel.org,
 osalvador@suse.de, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com, catalin.marinas@arm.com, will@kernel.org,
 mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-riscv@lists.infradead.org, agordeev@linux.ibm.com,
 kevin.brodsky@arm.com, bjorn@rivosinc.com, apopple@nvidia.com,
 linux-kernel@vger.kernel.org, muchun.song@linux.dev
Subject: Re: [PATCH 2/4] riscv/mm: fix hotplug page-table destructor handling
In-Reply-To: <20261008073021.2512665-3-songmuchun@bytedance.com>
References: <20261008073021.2512665-1-songmuchun@bytedance.com>
 <20261008073021.2512665-3-songmuchun@bytedance.com>
Date: Fri, 09 Oct 2026 08:09:31 +0200
Message-ID: <87jynrs8v8.fsf@all.your.base.are.belong.to.us>
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

> RISC-V uses the same memory-hotplug teardown code for the linear map and
> vmemmap, although their page-table pages are not always allocated in the
> same way. Late linear-map allocations run page-table constructors, while
> vmemmap and early allocations may provide constructor-free pages.
>
> The PTE path unconditionally runs the destructor, which is wrong for
> constructor-free vmemmap tables. The PMD path avoids that problem by
> using is_vmemmap as a proxy for constructor state, but that assumption
> will no longer hold once runtime vmemmap allocations use the normal
> pgalloc helpers.
>
> Page-table constructors record their state in PG_table. Centralize
> page-table freeing and use PageTable() to decide whether the destructor
> is required. Keep reserved and constructor-free pages on their existing
> freeing paths.
>
> Fixes: c75a74f4ba19 ("riscv: mm: Add memory hotplugging support")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>  arch/riscv/mm/init.c | 29 ++++++++++++++---------------
>  1 file changed, 14 insertions(+), 15 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 857f9a55039c..429a0b015ec1 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -1486,10 +1486,19 @@ struct execmem_info __init *execmem_arch_setup(vo=
id)
>  #endif /* CONFIG_EXECMEM */
>=20=20
>  #ifdef CONFIG_MEMORY_HOTPLUG
> +static void __meminit free_pagetable(struct page *page)
> +{
> +	if (PageReserved(page))
> +		free_reserved_page(page);
> +	else if (PageTable(page))
> +		pagetable_dtor_free(page_ptdesc(page));
> +	else
> +		pagetable_free(page_ptdesc(page));
> +}

Is PageReserved() enought to determine if there's no dtor to run? On
rv64 your code is correct, but maybe for robustness?

  | if (PageTable(page))
  |         pagetable_dtor(page_ptdesc(page));
  |=20
  | if (PageReserved(page))
  |         free_reserved_page(page);
  | else
  |         pagetable_free(page_ptdesc(page));


Bj=C3=B6rn

