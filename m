Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD262606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 09:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cRzdLIWT;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LAHQOhdr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ph5jOO1GJkWHfez0YQCFb1ckQjLY8JeVKtFL0PrDBnU=; b=cRzdLIWTROPT8KBA/gXgjamAgW
	mZoNWAoVw7DbbQchmknceW9sUJMQ9PRWWlRb9o0+Pxt8GrqYIQntkJhPV9n5xztZ3KixIaNIEAk2Q
	RYNrGuQ2Y+61XY4Y/kYLzMexbjvnHzb2jl/nXLON/t5CVMdEocH/y6o5Ip9K1meM3IZslAGU8ogjd
	UR6+9eqR0p2ExYj8foIcuxB1TJLI0k7xd9Mvlh8OfiMY8i2SjsgP4v2cFYS2xLbgmMH32DyJ/AvOU
	J11COmJ1qgIY+7KOwK1cjhK8H/r0qklPnVwxTNh0CbDt6FxSd+aAYNptm7yKG/sE6UAC5d2X7QC4h
	SWeHw+Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJT1e-0000000BXhA-4Ai3;
	Wed, 21 Oct 2026 09:54:26 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJT1c-0000000BXfr-09Uh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 09:54:25 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=mtNnOi1A0NVeWv71nH2FKskD2CAi32/TwrkTagWD074=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792576462; v=1; x=1793181262;
 b=LAHQOhdrACH2uKpTmTwpy2nnJvEuOsPIWIWFykGDycUbPghtcFhl1t35CijPXf67YUiojPN/
 VOQ9emlN5v9k6BxruqAvX8yUBYPZvPuCJ86irQQ2s5NY9LPw9Q8B1ZZUYBmynq48VmEWbhrRjzs
 n4CLIH99Tc41TwqOn9hEdQUc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta10.migadu.com with ESMTPS id f8890043187a53cd;
	Wed, 21 Oct 2026 09:54:21 +0000
X-Mizu-Trace-ID: f8890043187a53cd
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v2 03/20] hugetlb_vmemmap: Always flush TLB if needed upon
 PTE remapping
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261003002123.505555-4-jthoughton@google.com>
Date: Wed, 21 Oct 2026 17:54:06 +0800
Cc: Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nikos Nikoleris <nikos.nikoleris@arm.com>,
 Linu Cherian <linu.cherian@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Nanyong Sun <sunnanyong@huawei.com>,
 Yu Zhao <yuzhao@google.com>,
 Frank van der Linden <fvdl@google.com>,
 David Rientjes <rientjes@google.com>,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B8A44041-1516-4405-976D-534AA2412A49@linux.dev>
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-4-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_025424_239079_7106601F 
X-CRM114-Status: GOOD (  23.78  )
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi James,

> On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> =
wrote:
>=20
> vmemmap_remap_range() can potentially leave the vmemmap in a partially
> optimized state. In this case, a TLB flush should be done if the walk
> caller asked for it, even if the optimization was not fully applied.
>=20
> A follow-up patch will more completely deal with partially-optimized
> folios.

Why are we dealing with partial optimization cases right from
the start?

I know that in patch 12, you try cmpxchg 16 times, and if it
fails, it leads to the partial optimization state. What I want
to ask is, why do we limit the maximum number of attempts? Is
it because during testing you found that this kind of failure
is very common? If we did not limit the number of attempts,
was it because during testing you found that the scheduling
latency caused here is very large? Or is this just defensive
programming? In my view, scenarios with such intense
concurrent access to these struct page structures should be
very rare.

If your testing did not find any problems, my suggestion is
not to set an upper limit on the number of cmpxchg attempts.
This should be able to simplify the design of the initial
version of the code to a certain extent. If we want to
determine whether an upper limit should be added in the
future, I think we can add timing monitoring in the arm64
try_update_vmemmap_pte function and trigger a warning when
the measured time exceeds a certain threshold. If someone
reports this kind of warning to the community in the future,
then I think we can improve it at that time.

What do you think?

Thanks,
Muchun

>=20
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
> mm/hugetlb_vmemmap.c | 4 +---
> 1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index 0057fa2a16a8..1a2645c382ba 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -163,13 +163,11 @@ static int vmemmap_remap_range(unsigned long =
start, unsigned long end,
> 	ret =3D walk_kernel_page_table_range(start, end, =
&vmemmap_remap_ops,
>    					NULL, walk);
> 	mmap_read_unlock(&init_mm);
> - 	if (ret)
> - 		return ret;
>=20
> 	if (walk->remap_pte && !(walk->flags & =
VMEMMAP_REMAP_NO_TLB_FLUSH))
> 		flush_tlb_kernel_range(start, end);
>=20
> - 	return 0;
> + 	return ret;
> }
>=20
> /*
> --=20
> 2.56.0.rc1.315.gc6ed9934b7-goog
>=20


