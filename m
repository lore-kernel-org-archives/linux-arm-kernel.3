Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362EEC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 01:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWJGRC9xwxNiRy963FgpQnyOwKOSfdYPf5s+6GKenIQ=; b=g3yWW9rR/aVRrniERllocspmcI
	d4nRLsuSNXnCfkMYdFJ70W6HxomFgyQ/g3hW9HUNoOhQY35+CTzG9Ky8NRQ3rlhv9Z+YNOM9+qYGG
	3lnoS9+tTJRXI5UJ2oCowf2ZI1WwwBRu/pLYPhAu27UZPSVGpM0B0w+S1Pwt23yP+OjKeh4tqG2tg
	eNRTRg/k4oyq0VyVCcwPX9sWk4ijenlgr9OsdAuLqMOYxvSKQz28HV5vA8A5KdvMgPaJOtsdFUIh6
	05hZBdY4hRNRtGIxeuVmnAq/Iugm6MdXrvLKMCyFV9+JK1js/AS3tcREH5fO2XVh1qbdP4Af/ocUp
	5XbPJt9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7LWr-0000000CmfA-3Nyq;
	Thu, 17 Sep 2026 23:28:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7LWq-0000000Cmes-0NnO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 23:28:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9DA7260209
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 23:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39ECD1F008A4
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 23:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789687709;
	bh=IWJGRC9xwxNiRy963FgpQnyOwKOSfdYPf5s+6GKenIQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jMRG6GJ+jPVZWQcib59ikf8sCh9LM7ZZPeIKXq2t1Qa616NOpa2A9yZE8zyfkQsNp
	 XDywILAj2dBZCJHat9rjUD9SXiyT+FIR/P9rULMIOVe6G7mThYpyxf/+gwakDJDQ0p
	 JX+pek5ZzlealjcCSM5DFo3m1D7sEjNa0T+wq8ngURIp9C5stDPdLxz2oxFn+dftXx
	 wj0/JQU+Tdox291aHVZBLSA+nZPmtbE9wAtJqIrz+LX0DcIZUZqN7dHtBM74cZwTAl
	 YOE6AvLK3Mngyu68jQSlXiPocReBiKW2XwB/no1ZLubp2CR+4ZLiALYzxrr1ZKXypZ
	 +lcif3Qk/CfWA==
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb76ef1d0so1217971cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 16:28:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxxtQeecQxmmmBtQ5wmM4EVd224DquWXxAHirIcScohfpb93Vhv7CE5VoKBGc5jth2gs1rjfP11oXcGpBI8rlBs@lists.infradead.org
X-Gm-Message-State: AFuF++lCZFBKQ5FNeKyuav5g1RLWA/e5Syvx2ni4nVvKt/uxk1rTgYkx
	EBzmA8C0gS41Bp8Co5vHvYhlqCS7PcPZYGqlD9iZ+mOmZxzReoRm2LAJmr6fC5i11t9CsxPJrVJ
	ZQGIPdx2iHP8G21+uq1ZvvwvHcOo8lzM=
X-Received: by 2002:a05:620a:280b:b0:93b:d79e:1907 with SMTP id
 af79cd13be357-93bdc9fdcc8mr86080885a.74.1789687708536; Thu, 17 Sep 2026
 16:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com> <20260917052933.188679-3-jiangwenxiaomi@gmail.com>
In-Reply-To: <20260917052933.188679-3-jiangwenxiaomi@gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Fri, 18 Sep 2026 07:28:17 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wDbDLv5mxfNiyraOS6tKCSV+g8xL5+SsRCyqLnN2ON7A@mail.gmail.com>
X-Gm-Features: AcwNN1W3AgFfdfDDbqU2CtZG2lqgv5Z_JbQps_-ItFYT5oYqTIYjvyQ2wpW_oIg
Message-ID: <CAGsJ_4wDbDLv5mxfNiyraOS6tKCSV+g8xL5+SsRCyqLnN2ON7A@mail.gmail.com>
Subject: Re: [PATCH v8 02/10] powerpc/8xx: add pte_set_huge()
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

On Thu, Sep 17, 2026 at 1:30=E2=80=AFPM Wen Jiang <jiangwenxiaomi@gmail.com=
> wrote:
>
> From: Wen Jiang <jiangwen6@xiaomi.com>
>
> vmap installs PTE-level block mappings (SZ_16K/SZ_512K on powerpc/8xx)
> by reusing set_huge_pte_at(), a HugeTLB helper gated by
> CONFIG_HUGETLB_PAGE. This makes the feature silently unavailable on
> CONFIG_HUGETLB_PAGE=3Dn kernels and couples mm/vmalloc.c to HugeTLB
> internals it does not otherwise need.
>
> Add pte_set_huge() to powerpc/8xx, next to the existing
> pmd_clear_huge()/pud_clear_huge() in mm/nohash/8xx.c. It builds the huge
> PTE and writes it into the backing cells directly, without going through
> set_huge_pte_at(), so it does not depend on CONFIG_HUGETLB_PAGE.
>
> No pte_clear_huge() is needed: 8xx does not implement
> arch_vmap_pte_range_unmap_size(), so the vmap unmap path never takes the
> block-mapping branch.

I assume you mean the block-unmapping (or PTE-clearing) branch.
Please make this clear in the changelog.

>
> In practice PPC_8xx selects HUGETLBFS unconditionally, so
> CONFIG_HUGETLB_PAGE=3Dn does not occur there today; this is a decoupling
> cleanup rather than a new configuration.
>
> There is no caller yet: mm/vmalloc.c is converted later in this series,
> once the generic fallbacks are in place.
>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> ---

BTW, this patch applies cleanly to the mm-new branch.

Best Regards
Barry

