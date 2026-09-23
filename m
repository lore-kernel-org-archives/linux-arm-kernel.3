Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59202C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 21:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d3tq9N0LJ4r7VJ+9wdwqQQlbn4k6qzBMuLB5kE1baa4=; b=J6n4k1QlGMKe8JzBzj1TjG7Kfe
	UjFcCjHg4uVw7AtZCYkpcxHSn7wI4v4ikkIOxMqdMqSxq6s9RbCttl2CCnWx9niy1XXfytpp7HWKJ
	+MrYtU5BGQpifVu7tDoOWDPM5f6+jDUByLPcYULFmeS+QaQ8zfs7JrFAsly2rMmkUklo3AV4sKz+4
	Ki+MJsRdP/Yyjip7gGlME/tPxuBhMEfabNlKVYUw6kBQ/O+/2cuoXUqpheoqEFPiP2gV2YDgiBX9K
	m6ejT/YUTJNh+HDLsLpgxa97c0RdF6dQogDL1FJPrkpmT74WGhERxFI5Ff/OD9T5OvSDuBQMioAE9
	URT3t24w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9UXg-00000009ZlZ-0DR2;
	Wed, 23 Sep 2026 21:30:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9UXe-00000009ZlA-1AI1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 21:30:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 909EF43EA2
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 21:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57FD61F008BE
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 21:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790199013;
	bh=d3tq9N0LJ4r7VJ+9wdwqQQlbn4k6qzBMuLB5kE1baa4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JKAxKVtMZbF3TD2Yn2zgDD4fLtybBqJ/igLQzq3NUT4r9bDACuqKvXjvgz60TR+JA
	 BIFmfFeaS555lQfbIUJsxtX1zQkAUve6IUQqNm7nLfx6uf7seZiMIvm9RK03R3nD3X
	 yIqwdSH/bmBuXrza+VBpZYbApAWVCksy8bFBjD49DyaS1W6AQq+JhF2QihqME55VXB
	 IJ8+SeI/dKeiSzaW7jniNvqm6j5i8qbdAiZMMHyUhEOvu3CyESGyLW7HUG4hOhAWJf
	 +n7NPspRkMseNo+3GfhH9oIjsO6FjECoNDaxM6ZpMUq4024vg6/mylbECDTlTHtIO7
	 kd3RiEuWZgBSg==
Received: by mail-qk2-f27.google.com with SMTP id af79cd13be357-939ca12ab70so140808485a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 14:30:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwRfKmHcE3BDa/QPHA4NqxBApgglf0sL6oSaa+dGXP7a2vLu6Z4qS/3idFuAjh90M7ixegiJc7ohxdvn7KhBtJD@lists.infradead.org
X-Gm-Message-State: AFuF++leLpAyxsofqqC8eJgNZmMej8LFRBI+tzJwqmIernA4wsL0yUkX
	Ix/rmPgKSpJCJW5owYnkX9+eKKxQz/rHQPkvuDNCkvWREZAu7cqBVNaBxxQCEMeq7qUTpbbbadN
	6yri+GRnOx7+vApw4p8ibA0Z/tWUjlJg=
X-Received: by 2002:a05:620a:4707:b0:937:50b6:4a5b with SMTP id
 af79cd13be357-93c345836d2mr78355685a.23.1790199012523; Wed, 23 Sep 2026
 14:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260923062832.479455-1-jiangwen6@xiaomi.com> <20260923062832.479455-2-jiangwen6@xiaomi.com>
In-Reply-To: <20260923062832.479455-2-jiangwen6@xiaomi.com>
From: Barry Song <baohua@kernel.org>
Date: Thu, 24 Sep 2026 05:30:00 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xQhmRigaV_2G3pdOgk5mvC6HNzqCyUdRY3RSG8-QNC-Q@mail.gmail.com>
X-Gm-Features: AcwNN1UaTtV0wPc3IJY9Sx6rnYvw9-CPwWOiah8w0K1fH7hCcF4lT-foCe1dQ8M
Message-ID: <CAGsJ_4xQhmRigaV_2G3pdOgk5mvC6HNzqCyUdRY3RSG8-QNC-Q@mail.gmail.com>
Subject: Re: [PATCH v9 01/10] arm64/mm: add pte_set_huge() and pte_clear_huge()
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
> vmap installs PTE-level block mappings (PTE_CONT on arm64) by reusing
> set_huge_pte_at() and huge_ptep_get_and_clear(), which are HugeTLB
> helpers gated by CONFIG_HUGETLB_PAGE. This makes the feature silently
> unavailable on CONFIG_HUGETLB_PAGE=3Dn kernels and couples mm/vmalloc.c t=
o
> HugeTLB internals it does not otherwise need.
>
> Add pte_set_huge()/pte_clear_huge() to arm64, joining the existing
> pmd_set_huge()/pud_set_huge() family in mm/mmu.c. They build on
> __set_ptes() and __get_and_clear_full_ptes() directly, so they do not
> depend on CONFIG_HUGETLB_PAGE.
>
> There is no caller yet: mm/vmalloc.c is converted later in this series,
> once the generic fallbacks are in place.
>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>

LGTM. Please see the comment below.

Reviewed-by: Barry Song <baohua@kernel.org>

[...]

> +void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
> +                 pgprot_t prot, unsigned long size)
> +{
> +       unsigned long pfn =3D __phys_to_pfn(phys);
> +       pte_t pte =3D pte_mkcont(pfn_pte(pfn, prot));
> +       unsigned int nr =3D size >> PAGE_SHIFT;
> +
> +       VM_WARN_ON(!IS_ALIGNED(size, CONT_PTE_SIZE));
> +       VM_WARN_ON(!IS_ALIGNED(addr, CONT_PTE_SIZE));
> +       VM_WARN_ON(!IS_ALIGNED(pfn, CONT_PTES));
> +
> +       __set_ptes(&init_mm, addr, ptep, pte, nr);

You have patch 4 to revert the `clear_flush()` modification from
06fc959fcff ("arm64/mm: Support huge pte-mapped pages in vmap").

I guess you may still need to guard against the case I mentioned in my
reply to patch 4:
https://lore.kernel.org/linux-mm/CAGsJ_4xiLScr2PrPu7Eem73GvPCtsuYd3J05kW3SC=
4QSs5Q4aQ@mail.gmail.com/

Something like this:
VM_WARN_ON (pte_valid(__ptep_get(ptep)));

Best Regards
Barry

