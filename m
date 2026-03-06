Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB3CFCC076
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 21:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xF2QVJKlsJyPQ0rinDSP7ff02KEvuEZ/pXqwJdII48=; b=GK0RhNXkpWKQRC+UZcFzdhgwl4
	tw4AxH26TWXJUptkGoT6LY+vDYzB6AgkJgLHnNC6ghJ+0A+qOuILsRtdo1/nmkctVMlBDH6M8UjM0
	WaUKqJ9pat4/i2YNJdqCuefxuK1O1G8ycBsWAWrpOT2x+HoyClcKGsu63vy00SQYPJU7Enk60By6g
	eP3OV60dgCrmUca+ikwIKKBAGOfrlfLbD7rNnBTPnJ89t1oT+Om3epuxVKgAkMpIkx1LerjXcrNRv
	tVNFuGA+khfZU/ASNxJViWQGChqO3YWQxZU6lPeMRJ1jGoD1MxzlI57IYHzH6ameumvauPeC6fW0Z
	f5MuiEiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vycb8-00000004WUS-3KmX;
	Fri, 06 Mar 2026 21:20:38 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vycb7-00000004WTv-03UX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 21:20:38 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-505a1789a27so57880061cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 13:20:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772832036; cv=none;
        d=google.com; s=arc-20240605;
        b=f4H6j5fnHnzXbs0wJQZQmknXNmEVEaFWIV9k3yLirdb4ya5Mhejt5koVIvSz+L8A/J
         8NImBSNmXvly95fLmiJPMbmlKZALKnjgiVWtmQqh4qMYdd1mtjKpNsvkWW/gVmz6tt1N
         1dW9J/CmAC0kPcI9iRsv2KX+iUBQ9pvZ5Ne26ifUekQjrb0zlxyUbCX4BtPq4r1ZQRux
         0vBgKpjg/uCxbo3zjX2kOW8T9BIdqc6o9PykfTo2tA+Q8Gph6QvB/BWRSXLJwxc4KRKp
         Zd2HTv3CRQ3e4vvzm73ml+71+GWQ78ut7kqGx5FjBmCdMgROPLtW1V9PBZcRRSvyx5YW
         W54w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4xF2QVJKlsJyPQ0rinDSP7ff02KEvuEZ/pXqwJdII48=;
        fh=yrlYQjAGispeVM2WFfKYkdkiMsORMYrYiPG8yLMVk2w=;
        b=HSPCrYOhEZYft178Iki6mKqOzt1MIDxBRe9OfGxuBKmEr/M2+ep3Er37DclLB+gYCj
         4kxVLcZbjc5SLEFS33UN+met6hs9Q1GUNqvIy2pI+9yGlEi8VMpqe/IcLvUU7TzNejL2
         eVZuCqnw/qsWHvU4a+4M0rLRh59n7RUI83TUl9R/EZuFO/B6rl8KIwr4Al+v1+7S3dcX
         sATKCcJD1oZfVCn659+MSj/X0S/FLoJesx2HulzkJ1FtHqWVjsUoAWJO0XJw+aHQPiDT
         7EbJxjUgD2O4yiQVzQ/Liuz49Pq2PVPU/K8nc9NkUaca0kiLQ4jCpmV+XJglazo1/Uu4
         14vQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772832036; x=1773436836; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xF2QVJKlsJyPQ0rinDSP7ff02KEvuEZ/pXqwJdII48=;
        b=CqVpMydrKJOd51tMrKbbdm1NA327G9wCling5urxx3s6+X/pMnZwcCTZ8QSLJi9N4N
         H2up8MnA+UEMeGyk0qMA4/sOfhNCusJsKKbkHD3N9FL7tlwUP6Hn2v/cTnBeJUZMQFcf
         hNOR9732qZoUQVWbb32HfzpBUxcIYHHBe4fvb9HcY7JzK+LpBrUTsIYQZGrv+8BkZiLe
         yer6tw89t94tgBZCjTXadvql/iB8nlLISpwBkc0nyI0vEQPVifM529wpyX7WL2m6HEH1
         sE4NQnyTololbhc38C6fMCkvSkbZKeVZt44J1rXqIY2EHUpqqHXvs9mNhoh4pgLmrpNk
         1+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772832036; x=1773436836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4xF2QVJKlsJyPQ0rinDSP7ff02KEvuEZ/pXqwJdII48=;
        b=IW7blgyxgk7tMAwg4+44mkUv0s6W3sXCl+hkAmDgBKaQGZDmIRhe4ElTGpDEmfF+fT
         v3vDDUOea9hJqzhkoMkJ/8+vg0DB93FaBvr4sqyKzvbJFcxzoOEli97605rIyf4ZJTMv
         0Fv0LX6aCljJdmKUrx5+YXsrQHlCPVaLgCAp+8SIeRB88HGhul1sr5ElWLZJqlRjQLld
         NcWMyV63fUTwenJp9AB5tdNJ7u92XRUXbmel8xb1/R9VWhMIT3mVMtqsm4eKG2Wz7q6M
         3Msmh9NDLqO7Z3EVUYEHWyQWplVhRmDnOpfr62vqD2cTAr3zb7+LSdE2p9f2sE587fsC
         DBww==
X-Forwarded-Encrypted: i=1; AJvYcCVQMa/0hp611oe4vKn4A9kgG9fFR0+NKA6jO0AJDzcCCApZzaM9rRKeYEUa1eSnvTFGEuA985szFBAgeIsshI8m@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi8qZoLGetXvibi1HGd2uawazUaAPX/QVOt+Fb7B5GlY9IHUXm
	SPJ40wl1B1pbYRdP2sH1T04/kKnWGrM47srOUNtN0pGjkG6b0PAzeLd/V6/HNKOhD2BERnjpqwu
	3OVgds9qHUiI+wCABDn6ex5zJZrbkR90=
X-Gm-Gg: ATEYQzwqGHeoflVDv/8nYkGlCuVNsZb0luGXaunC3vP0SLNyOrvjq72GvcNlzG/tXmF
	uGCOeqrCgJJFBvowqYJBG8W2OMzRxQljrs3Wkkv5wgFxFMNGduqHYu3uYliJ1TPXAg/GdvGS9+Q
	7SNBwCQIDKApVNCW53d3cyyVckLDPUYrKHxi81c1FzOkEuas1Ru8u3TtBpsSoxmBxM0CJ7qpxXW
	DxJcJYGA3uhGkmhCEevGDFSVXcoW8ylwWM9zo1bHhP/KL5uutsftn2olZYu6fXn//mHXG65s9M7
	16CUHg==
X-Received: by 2002:a05:622a:1923:b0:4ec:fdaa:b31e with SMTP id
 d75a77b69052e-508f49096camr42838931cf.32.1772832035179; Fri, 06 Mar 2026
 13:20:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770645603.git.baolin.wang@linux.alibaba.com> <ce749fbae3e900e733fa104a16fcb3ca9fe4f9bd.1770645603.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <ce749fbae3e900e733fa104a16fcb3ca9fe4f9bd.1770645603.git.baolin.wang@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Sat, 7 Mar 2026 05:20:23 +0800
X-Gm-Features: AaiRm50sO_fItcg8g6Y4AgDfWstLovjyaZSZQA5x11X8O-Ah4D4-J_DxFKLuC_I
Message-ID: <CAGsJ_4wA-bpCaY8uLnwmzDT40s4RbsOXdRutvj5bZU+Em6cFeg@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] arm64: mm: implement the architecture-specific clear_flush_young_ptes()
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com, 
	willy@infradead.org, dev.jain@arm.com, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_132037_066345_58794362 
X-CRM114-Status: GOOD (  17.49  )
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

On Mon, Feb 9, 2026 at 10:07=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> Implement the Arm64 architecture-specific clear_flush_young_ptes() to ena=
ble
> batched checking of young flags and TLB flushing, improving performance d=
uring
> large folio reclamation.
>
> Performance testing:
> Allocate 10G clean file-backed folios by mmap() in a memory cgroup, and t=
ry to
> reclaim 8G file-backed folios via the memory.reclaim interface. I can obs=
erve
> 33% performance improvement on my Arm64 32-core server (and 10%+ improvem=
ent
> on my X86 machine). Meanwhile, the hotspot folio_check_references() dropp=
ed
> from approximately 35% to around 5%.
>
> W/o patchset:
> real    0m1.518s
> user    0m0.000s
> sys     0m1.518s
>
> W/ patchset:
> real    0m1.018s
> user    0m0.000s
> sys     0m1.018s
>
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

Reviewed-by: Barry Song <baohua@kernel.org>

> ---
>  arch/arm64/include/asm/pgtable.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pg=
table.h
> index 3dabf5ea17fa..a17eb8a76788 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1838,6 +1838,17 @@ static inline int ptep_clear_flush_young(struct vm=
_area_struct *vma,
>         return contpte_clear_flush_young_ptes(vma, addr, ptep, 1);
>  }
>
> +#define clear_flush_young_ptes clear_flush_young_ptes
> +static inline int clear_flush_young_ptes(struct vm_area_struct *vma,
> +                                        unsigned long addr, pte_t *ptep,
> +                                        unsigned int nr)
> +{
> +       if (likely(nr =3D=3D 1 && !pte_cont(__ptep_get(ptep))))
> +               return __ptep_clear_flush_young(vma, addr, ptep);
> +
> +       return contpte_clear_flush_young_ptes(vma, addr, ptep, nr);
> +}

A similar question arises here:

If nr =3D 4 for 16KB large folios and one of those entries is young,
we end up flushing the TLB for all 4 PTEs.

If all four entries are young, we win; if only one is young, it seems
we flush 3 redundant pages. but arm64 has TLB coalescing, so
maybe they are just one TLB?

> +
>  #define wrprotect_ptes wrprotect_ptes
>  static __always_inline void wrprotect_ptes(struct mm_struct *mm,
>                                 unsigned long addr, pte_t *ptep, unsigned=
 int nr)
> --
> 2.47.3

Thanks
Barry

