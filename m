Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651F3C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 07:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GS6w62IL/zxzq4/zoss8k2p0TRrsAsNyMrcb0qeyi48=; b=HvfqZ3JHvClJka9GcFmGXLY2iN
	TZXogENRN9ONU3UQDEzUKFo2caV9SFqNbsWX4xounmpvz0H6hHIeKqKEk3tA6kLEnoEXf9Y+SV6e+
	Djzt3VrtWlqUzQyEX6MI4AKCLUqR8PKFMlX0LMpVdROaSK/5S9lW7T6zC3ceRiToTcLcITBTyhCgu
	MCiR/eqkNA/WRrPAU67fpqHWZaChQfw+LITKIS5G4cvIlWLoOQxJTUidIT+y2XCLCsTsx6o4R8Mc7
	WFm4p3PJ4fdvnTcbBn6x378KfccYs6U/uWRUEXazQcFKcrQAYxNXMNf29mDgDm98rFlmgA23rkJ6v
	esFAk3GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8Ru-000000022E7-1Hs9;
	Wed, 26 Aug 2026 07:53:30 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8Rr-000000022DW-2fld
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 07:53:28 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-482e7093e75so2318f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 00:53:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787730805; cv=none;
        d=google.com; s=arc-20260327;
        b=OVwKeUNXe/JqSaTQppzU6CRILzkC0G9jQtqZdN8NKx5ONqKAtIOGayljhM12OHeTOu
         mHE+nL2GeyQYTHEEkt4kUzTcCyFcCEIDXbxvDf/vCWKww1edKTVRg/uPwv181IIgu8zo
         NkY7ySHdvJjGQRQi6QensBf/RCrkF8hCUsF8PLpquyPrFDMIAU6a501Hv9eu+TtBH5fg
         I4EFrEikewslQFaElzArI5i7dh1vBBB0pR7m4p89gujnBYvwN5++dNUF9bDn2C5L36/E
         ZEfW0gaF97Z0C0pcJjtKEXfXeqofMjv8Wh0FyNQNkhxNuRvc01X6rWeB8OkQs7A3XMeu
         +F5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GS6w62IL/zxzq4/zoss8k2p0TRrsAsNyMrcb0qeyi48=;
        fh=1M8zY/WVK3dCxTCwAFZxnw9qndvXhuvzJjbEDel/3as=;
        b=XaeEioe32nO133bKIUqpt3UMzLnaBet/3kDVx9A5QMfkd8oRgyoRrgp6NE1TtafE8u
         KLn3dKR9N/5DuiJ0npe2/WGNm8th1WIQdi3sRij2J3fcVULkKtPkpWaPboDS2KdejRjy
         mPyeiIvXAXBakqsy14uX2P/fuVjrlXLPpBC7I7YrenZlp6qopqukthSlhR0a0lIge3gz
         1zCT9sHfeYFgB/AwLcBKsztbiYMmmLNLNdKpLWz6XcgFdkxb7s8DkQjwb5CHwara1Ebs
         a798DGXjSVtbO8xNLJpa4Iga6IPD8ZirQi9A5P/VnJIqbKMz6aluER5c0qKmP4ZIFYhe
         gYoA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787730805; x=1788335605; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GS6w62IL/zxzq4/zoss8k2p0TRrsAsNyMrcb0qeyi48=;
        b=ofZdok99h9dNAZDZBW51oWHM93WuNgPKPebinzkDXYXQ3FZI0kb3N8gEfeREbzDdVC
         KG84JRWYMtm3+cPNLSvhQnfGGR1KfkhZ7EPZHorful7kh3WZOg/h4gT12vH6Lnautf0g
         r4By26PBP05REJysLoSSOmFgMaqJmA14Bwkp4DTKbI96cyw2jWPVaWsP7ks9xMvWeo5/
         LTHukqkxGepvxmZHqhcKxRcFjPAkHeyaCn92wWnX7ZezSxMnum5aFpH5bNSFKK+DhVNK
         6BezoLNczJpQoRJJiMgxSJoVIGZXDF3ujqwuDNvinWvvEZdUSotq+8dci9UVZPdWL4+e
         8LMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787730805; x=1788335605;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GS6w62IL/zxzq4/zoss8k2p0TRrsAsNyMrcb0qeyi48=;
        b=UWmF5u9coLTaD76VAdvHmuPOrd+uEjdIxuzOzxNCKgOEFeqILQcJw3sWqy9yETqYaH
         D3a2LhfRde7hSHL62q5VeXtrS7vHiTm1m5u0RTT49Kd5/LgUTiwfOK6Lq4kZWJDvtbHJ
         fzlBBm7apgA38MRNsxS8CuXqj5qLX8O8lEhh4TkKRXoENksW/dV17LZrcqPyoc96rFvH
         OxIRVY6KOBVmRnW+Qf5IyhvCz2/OLNOeNzJhSgIFU1HYGw3ZwXTnw0uTzjF7pIvDxNCe
         C0tslL5qEO3abXceLds/idTq4fNweftVuot8XQ3sUAtMgeIIo3GPNZgvKc13rBeV88ED
         C+KA==
X-Forwarded-Encrypted: i=1; AHgh+Rpl26Bhid+vDMM+ABDQ62ztUyxjjFfUreRj+/1pp5lT+DKkVJIaMzPEaz3YLm3PoOVfm83llbcJgwBfztuB8ChU@lists.infradead.org
X-Gm-Message-State: AFuF++myBgTBNx1QieVhWjXdqGweKJhmuNjDr2i2JbSTH8iBSUX3SCvN
	wDg+uozWnVJJRkumFKpYlhE1wp4qfKgyQrcyVWrekksJB13Wr5M1ACUCjzTnHJTPyZ1LBU+goBN
	Skurm12dtN6+SkoLdyVED4q6g5DJ57D8=
X-Gm-Gg: AR+sD13CB3oztZQ4EFipPNXhJXs9lXUfC/zFv4ugZS7mbUXrfdlp0qZBqaSIVPxWGrt
	JCCpKH/akvpRLi4UMT658MomZowe5GXYPscz8GyOtwNwAqn+DBeXLCTizOs2ENyssWYdqXSBQfw
	RHmg7xB9+GCP6ql/9LL7vts6T4tS2Et1GtihsbIihFCkhLJ22Aj4NTGBatCbQz+m0tSRhSpPoK3
	nZJTUoXGvPojp9eCe7crwL/etQdwShuEHUwosrQI5x+kJrxfDvYXkTvao9xQeuQT6BfB18/8GFN
	DhzWfqVGrXsqBojD2lqUnBxy+Dk9dcQDDZqYGPa8KLaqqX8mmsX/5KuVXok9S+Mwq9/GG/nL4R0
	uCcXQNm/4ixOM95oSoF/aUCJyHoQTVQ==
X-Received: by 2002:a05:6000:2f89:b0:482:db2d:4530 with SMTP id
 ffacd0b85a97d-482e2679df3mr2200734f8f.1.1787730804949; Wed, 26 Aug 2026
 00:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260730090647.2401252-1-xueyuan.chen21@gmail.com>
 <20260730090647.2401252-3-xueyuan.chen21@gmail.com> <c81ff923-800c-4ef4-b6e4-ec9f5eb1671f@kernel.org>
 <ao3GXvT2ltf89_rG@willie-the-truck> <86823e2b-f739-4ebe-b92f-a35b9dcfa0c7@kernel.org>
In-Reply-To: <86823e2b-f739-4ebe-b92f-a35b9dcfa0c7@kernel.org>
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Wed, 26 Aug 2026 15:53:12 +0800
X-Gm-Features: AcwNN1VjJ2lKh5_YdVKV0IGoF8qN-k3btcVN2OMCYjKb6W9mIPF2WiO3SwjTsXc
Message-ID: <CA+qSx6yPD7bz1s8B3QHxFhaVzsgSV9H_iKfskSQXjbu6kuG3tQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] arm64/mm: add set_direct_map_ro_noflush()
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Will Deacon <will@kernel.org>, akpm@linux-foundation.org, ljs@kernel.org, 
	usama.arif@linux.dev, catalin.marinas@arm.com, 
	linux-arm-kernel@lists.infradead.org, tglx@kernel.org, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	rppt@kernel.org, ryan.roberts@arm.com, ziy@nvidia.com, baohua@kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Lance Yang <lance.yang@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_005327_702656_1A941AFA 
X-CRM114-Status: GOOD (  25.95  )
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

On Wed, Aug 26, 2026 at 12:46=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 8/25/26 18:44, Will Deacon wrote:
> > On Tue, Aug 25, 2026 at 05:52:20PM +0200, David Hildenbrand (Arm) wrote=
:
> >> On 7/30/26 11:06, Xueyuan Chen wrote:
> >>> Implement set_direct_map_ro_noflush() for arm64 with update_range_pro=
t() on
> >>> the linear map, setting PTE_RDONLY and clearing PTE_WRITE. Keep the
> >>> existing can_set_direct_map() guard and leave TLB invalidation to the
> >>> caller.
> >>>
> >>> Co-developed-by: Lance Yang <lance.yang@linux.dev>
> >>> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> >>> Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> >>> ---
> >>>  arch/arm64/include/asm/set_memory.h |  2 ++
> >>>  arch/arm64/mm/pageattr.c            | 10 ++++++++++
> >>>  2 files changed, 12 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include=
/asm/set_memory.h
> >>> index 90f61b17275e..7083260303c3 100644
> >>> --- a/arch/arm64/include/asm/set_memory.h
> >>> +++ b/arch/arm64/include/asm/set_memory.h
> >>> @@ -14,6 +14,8 @@ int set_memory_valid(unsigned long addr, int numpag=
es, int enable);
> >>>  int set_direct_map_invalid_noflush(struct page *page);
> >>>  int set_direct_map_default_noflush(struct page *page);
> >>>  int set_direct_map_valid_noflush(struct page *page, unsigned nr, boo=
l valid);
> >>> +int set_direct_map_ro_noflush(const void *addr, unsigned long nr_pag=
es);
> >>> +#define set_direct_map_ro_noflush set_direct_map_ro_noflush
> >>>  bool kernel_page_present(struct page *page);
> >>>
> >>>  int set_memory_encrypted(unsigned long addr, int numpages);
> >>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> >>> index ce035e1b4eaf..c51236b61651 100644
> >>> --- a/arch/arm64/mm/pageattr.c
> >>> +++ b/arch/arm64/mm/pageattr.c
> >>> @@ -365,6 +365,16 @@ int set_direct_map_valid_noflush(struct page *pa=
ge, unsigned nr, bool valid)
> >>>     return set_memory_valid(addr, nr, valid);
> >>>  }
> >>>
> >>> +int set_direct_map_ro_noflush(const void *addr, unsigned long nr_pag=
es)
> >>> +{
> >>> +   if (!can_set_direct_map())
> >>> +           return 0;
> >>> +
> >>> +   return update_range_prot((unsigned long)addr, PAGE_SIZE * nr_page=
s,
> >>> +                            __pgprot(PTE_RDONLY),
> >>> +                            __pgprot(PTE_WRITE));
> >>> +}
> >>> +
> >>>  #ifdef CONFIG_DEBUG_PAGEALLOC
> >>>  /*
> >>>   * This is - apart from the return value - doing the same
> >>
> >> We'll need an ACK from arm64 maintaines. To me this looks good.
> >
> > I generally dislike deferring critical things like TLB invalidation to
> > the caller, so it would be good to see an example of a caller that real=
ly
> > needs that. The caller in patch 1 unconditionally  calls
> > flush_tlb_kernel_range() immediately after calling
> > set_direct_map_ro_noflush().
> >
> > In fact, that means we have a pointless invalidation if
> > !can_set_direct_map(). See exhibit A :)
>
> Ack. I recall that the patch set originally didn't do any flushes, but we=
 really
> have to flush even though we are early during boot.

Hi David,

Right, the original assumption was that the TLB might not hold a
writable mapping for these pages at all. But the folio is allocated
with __GFP_ZERO, so the allocation itself zeroes the 2 MiB through
the writable direct map and leaves writable TLB entries behind.
That's why skipping the flush is not safe even this early during
boot. (Usama Arif pointed this out.)

Thanks,
Xueyuan
>
> So agreed, the interface should just flush internally.
>
> --
> Cheers,
>
> David

