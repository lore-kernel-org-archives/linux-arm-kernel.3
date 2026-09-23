Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0945CC98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 21:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJsOwx/QHJRKZ+n0C8ukvZV0N0chl7bP1M9sQ8QHM+0=; b=bUS9sg7tQ6fSwKV9r0l7uIZZve
	1fkB0lzisU8EmGjUvpM3YZhWJB6MpSGASet6Vz8jGQSXrGCePT2stG2XYPP80QbLYM/EfR47UouYO
	7Fm/EY1a4K/gUxnmJO4ydGCmFHdiSVrPK4+WQcC24TOZQQnbACi0mn7yMw9nkDhRhvy4MEjKWB6Tr
	VeV464oP7D/lbULByKyPwA0qjAb5jKHD6qmbIDhVLsSpCVb6IiYLh6vGDx4bkfzqtaeSM5MrHtbKj
	IBb0iznFJYL2pg28IzhCNVfQbckm4+E6lM8fw5niVwqErYrOvcA4GAurbqY0/ym0bSg5rIP4t9CjI
	Hl6kkmDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9UfW-00000009asS-0HQo;
	Wed, 23 Sep 2026 21:38:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9UfU-00000009asE-1hRb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 21:38:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D0935409EA
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 21:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B47DB1F00893
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 21:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790199499;
	bh=YJsOwx/QHJRKZ+n0C8ukvZV0N0chl7bP1M9sQ8QHM+0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dxo6gZMNT18URkGZhYXcRMlxr2sCiuieBP1kADBFjFrV7hwOqC6KI+cYMVN0+459x
	 7bn80QRNap9jNWfvtKyMpgpbo9dLFi6KDfP2icWTd2ZXz+yFAtVNl4+QreAQpCSN8N
	 pC4LbSpIqLDDzmSsZkRoXkFZ3iOH9lCUYcDsoRc4hRQC8K44gptrtwf20PCytUIj26
	 IePdBbiMQvRknVtoEJFcE09lTXXYBC9s5W2TkhZZjI55udEfooLXi7Jr2biYFbVExJ
	 97k0rjqJWdHJzNynvyNVR0yXYZJ/UHOyaBuKV2u/YIrSlq0Onv6ewm8Kr3NILwH2L2
	 6uCeRWG1jXQsw==
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb766bfd3so10147151cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 14:38:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy70Zv+Gy0OLkE8OkW3TFfWlKDF7GsuWvxAwrIHyDUzwd195luwBX2aSy5Z8SViNVJdiVU0a4mlUomIuSfJ6khl@lists.infradead.org
X-Gm-Message-State: AFuF++lZPxGaY3ak+G9KqsVeDxQeZWNgA95e1xx2Ib2P7orQh/1d9RTc
	0vQQ0Fpyh2MrFpP/3uaaUgj3aTyb6l/FebwRH8sdLQep1NoddCeoPUdeqJoe9VFBV9GiW6djRoP
	DZzlJCCnXXtEtBn8P4GcgKOPfSjONRl0=
X-Received: by 2002:a05:620a:2556:b0:939:7c8:78a9 with SMTP id
 af79cd13be357-93c346c0eaemr75510685a.3.1790199499119; Wed, 23 Sep 2026
 14:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260923062832.479455-1-jiangwen6@xiaomi.com> <20260923062832.479455-4-jiangwen6@xiaomi.com>
In-Reply-To: <20260923062832.479455-4-jiangwen6@xiaomi.com>
From: Barry Song <baohua@kernel.org>
Date: Thu, 24 Sep 2026 05:38:07 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4z-oqoxKynRr6mz0-5zZU_2NBnPkwz05CEEHHnwTyqa-Q@mail.gmail.com>
X-Gm-Features: AclHuK9KKxh7jAVCjl18JX2rsGxXVsV-K4ZOPHC6NmnXnXWa0kkH7W0rz6HMa0w
Message-ID: <CAGsJ_4z-oqoxKynRr6mz0-5zZU_2NBnPkwz05CEEHHnwTyqa-Q@mail.gmail.com>
Subject: Re: [PATCH v9 03/10] mm/vmalloc: use pte_set_huge()/pte_clear_huge()
 for PTE-level block mappings
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com, 
	ajd@linux.ibm.com, anshuman.khandual@arm.com, chleroy@kernel.org, 
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Sep 23, 2026 at 2:28=E2=80=AFPM Wen Jiang <jiangwenxiaomi@gmail.com=
> wrote:
>
> vmap installs PTE-level block mappings by reusing set_huge_pte_at() and
> huge_ptep_get_and_clear() under #ifdef CONFIG_HUGETLB_PAGE. This makes
> the feature silently unavailable on CONFIG_HUGETLB_PAGE=3Dn kernels and
> couples mm/vmalloc.c to HugeTLB internals it does not otherwise need.
>
> Now that arm64 and powerpc/8xx provide pte_set_huge() and
> pte_clear_huge(), add the generic fallbacks next to the existing
> pmd/pud_set_huge() family and convert vmap_pte_range() and
> vunmap_pte_range() to the new helpers. The CONFIG_HUGETLB_PAGE guards
> around the block-mapping paths are dropped, so PTE-level block mappings
> now also work on CONFIG_HUGETLB_PAGE=3Dn kernels, and mm/vmalloc.c no
> longer includes <linux/hugetlb.h>.
>
> The fallbacks exist only to keep the build working on architectures
> without PTE-level block mapping support. They are unreachable there:

Since this is a `BUILD_BUG`, can the compiler simply eliminate the call?
I guess the build would still pass even without the fallbacks, so this is
more of a build-time check than something needed to keep the build passing?

Am I missing something?

> the callers only run when arch_vmap_pte_range_map_size() or
> arch_vmap_pte_range_unmap_size() return a size other than PAGE_SIZE,
> which requires an arch implementation. BUILD_BUG() makes that
> explicit rather than silently doing nothing.
>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>

Nice to see that `#ifdef CONFIG_HUGETLB_PAGE` and
`#include <linux/hugetlb.h>` are no longer needed in `vmalloc`.

Nothing concerns me except for the changelog issue mentioned above.
Please double-check whether the changelog needs to be corrected.

Reviewed-by: Barry Song <baohua@kernel.org>

