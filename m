Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D957DCD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 14:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8sI4JQyYAzVqiBIia2rY6sk/3gfVLhjVcCP3+jTSxNY=; b=VoBayhBgL6Ozqq5YKogecJq5Jk
	MffvF4Cjq4tVTdXkqjj088HH13SAK7TgeVMxN/nrBb3RmSey0jWoigdeyDjBNvMdL/AkWfPy2zT7l
	MzElGPDrsW7es06xBnhBu2B5FAW7l179LakQNqukHCZUDjOMQT5VCgl3Zz2rZaLY0WKPoUT/wWmjm
	2CciC9WXGEo/gKe4ap9FdJ95jItDQ7e09Pwdlvwp/sOiLPGZGSWRbzA3L1Lq1/858pXE6BiO6FTfX
	imjy6Rn1b6f0ovG3yy+kawgudAhia0kVnf6D3ZgbCyrIn7252LV4UHAEW4sIGxIrMcNmaCtSzxk0c
	YFS2lquQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXfrT-00000009YjL-1xwC;
	Thu, 11 Jun 2026 13:54:23 +0000
Received: from out-174.mta0.migadu.com ([91.218.175.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXfrP-00000009Yil-3QPC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 13:54:21 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781186056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8sI4JQyYAzVqiBIia2rY6sk/3gfVLhjVcCP3+jTSxNY=;
	b=A3e/grzAHb/uzD8WFwwuASnBnW79ffERfX4DyUk1lpKuO+kjGP/3Ks9ZTEDEa1yBP0yWno
	btblvrCoLDnqsx/dNHjTkfDUIKd+3oaEY47+d8YJ6lrjYn7zgTbdvlbYHpCaExm5AJ8+Ho
	83oDlw2fYDR5jNr+dTQUUsfsxf/EAKI=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 13:54:13 +0000
Message-Id: <DJ69RCVRBO0Y.3JCYSW50IC4RC@linux.dev>
To: =?utf-8?q?Adrian_Barna=C5=9B?= <abarnas@google.com>,
 <linux-arm-kernel@lists.infradead.org>
Cc: <linux-mm@kvack.org>, "Catalin Marinas" <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, "Ryan Roberts" <ryan.roberts@arm.com>, "David
 Hildenbrand" <david@kernel.org>, "Mike Rapoport (Microsoft)"
 <rppt@kernel.org>, "Ard Biesheuvel" <ardb@kernel.org>, "Christoph Lameter"
 <cl@gentwo.org>, "Yang Shi" <yang@os.amperecomputing.com>, "Brendan
 Jackman" <jackmanb@google.com>, <owner-linux-mm@kvack.org>
Subject: Re: [RFC PATCH 3/6] arm64: mm: fix restoring linear map permissions
 on execmem cache clean
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Brendan Jackman" <brendan.jackman@linux.dev>
References: <20260611130144.1385343-1-abarnas@google.com>
 <20260611130144.1385343-4-abarnas@google.com>
In-Reply-To: <20260611130144.1385343-4-abarnas@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_065420_704086_53EADE91 
X-CRM114-Status: GOOD (  21.81  )
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

On Thu Jun 11, 2026 at 1:01 PM UTC, =3D?UTF-8?q?Adrian=3D20Barna=3DC5=3D9B?=
=3D wrote:
> Strip the read-only attribute from the selected memory range when
> restoring the linear map after an execmem cache clean.
>
> An execmem cache clean is performed when a cache block becomes empty
> after unloading a module. When making the memory valid again, the linear
> memory alias must also have its read-only attribute cleared.
>
> Without this change, the linear memory alias remains read-only even
> after the execmem cache block itself is freed, which prevents subsequent
> allocations from writing to that memory.
>
> Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
> ---
>  arch/arm64/mm/pageattr.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 88720bbba892..eaefdf90b0d5 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -239,6 +239,13 @@ int set_memory_x(unsigned long addr, int numpages)
>  					__pgprot(PTE_PXN));
>  }
> =20
> +static int set_memory_default(unsigned long addr, int numpages)
> +{
> +	return __change_memory_common(addr, PAGE_SIZE * numpages,
> +				      __pgprot(PTE_VALID),
> +				      __pgprot(PTE_RDONLY));
> +}
> +
>  int set_memory_valid(unsigned long addr, int numpages, int enable)
>  {
>  	if (enable)
> @@ -362,7 +369,15 @@ int set_direct_map_valid_noflush(struct page *page, =
unsigned nr, bool valid)
>  	if (!can_set_direct_map())
>  		return 0;
> =20
> -	return set_memory_valid(addr, nr, valid);
> +	/*
> +	 * Execmem cache uses this function to reset permissions on linear mapp=
ing
> +	 * when freeing unused cache block. On x86 it makes memory RW which is
> +	 * desirable.=20

Hm, maybe desirable for execmem but that doesn't really mean the x86
behaviour is correct. Maybe it makes more sense to change the x86
to align with the arm64 behaviour here?

BTW we should probably document this API a little bit, I never thought
abut what "valid" actually means until now. I had thought of it as "I
can access this memory" but that's an unclear concept and now I realise
"valid" is a technical concept in Arm that's confusing. And it's extra
confusing if the kernel API uses "valid" to mean a _different_ thing.

Also, shouldn't execmem be using set_memory_default_noflush() before
freeing anyway? I guess that shoudl even be documented as "if you change
anything you need to call this before you free the page".

> On ARM64 set_memory_valid() just change valid bit which
> +	 * leave direct mapping read-only so use set_memory_default instead.
> +	 */
> +
> +	return valid ? set_memory_default(addr, nr) :
> +		       set_memory_valid(addr, nr, false);
>  }
> =20
>  #ifdef CONFIG_DEBUG_PAGEALLOC


