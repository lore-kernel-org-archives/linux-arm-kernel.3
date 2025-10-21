Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB67CCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 03:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IKp8K5lCZ3dpAyDEqf6jcNNDcXUsYhzNGDh14Qf0pAE=; b=0oVZlo37HSS9w+S4P4RSc48Mtl
	C+uNr3qaibK/7S7si6l+76gTLc4AF7Q/VkipRc8aNDj6KXmrEr9PaXKTg+zHQMwl9JXQYpF44cXsv
	CQz8G8GLSlEWiSEOeNVi+b+V5YmXlmjJS1kM/NYpgq9PfbIjgZN/6OiLJ5NnyMbvOn/IuE2tHMqca
	VG9U4Cmp9lTfpRykCb5SBJTczfnSflXmdMtwuAVCcGvBd9A8VYLxIGrZpjmcy9tZ0Flt9Y3tVHU3d
	v71fWlm6Ol4jkdXsl3uEXh0w78roMfM4fzewDQQqhBBxq91jm9pFV4CIx0dPgBpVaMWNQ+Y9ffvMd
	i3RnkfIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB2sv-0000000Fgui-21J2;
	Tue, 21 Oct 2025 03:18:05 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB2ss-0000000FguN-44VU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 03:18:04 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-88fa5974432so702542685a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 20:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761016681; x=1761621481; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKp8K5lCZ3dpAyDEqf6jcNNDcXUsYhzNGDh14Qf0pAE=;
        b=Scd4uZPhJWGlRxYxlT8GnQMrYCyu/j+zGO5ivxYboUaVjJxM1rxAYZasNTNroCRyd9
         gNIO+mfOtV6PIAY99A+3klv8i7FPUINyYdvd1pcSrWFDCpbGNna3bcgzsjKGw2a2EqME
         cfoflIek7XmsYEJFNUq3sL2GaQ+U/Ab92m0TQCwleXZ4rStMCSVk6s8zHYKSxDrww8qQ
         ide5Wi83p2vxsbpfV65vlZ8tRzJwDqu22sdAPiby3MKX0iRuOqU8n03rmYhcaDFTVD1D
         YYf+XCBWbUJwjgaU/KH+zwlFS5woVgAVFFWF1SyJyEH5ycfHE1AhAq2BxT2NVIkzI/M6
         Df2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761016681; x=1761621481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKp8K5lCZ3dpAyDEqf6jcNNDcXUsYhzNGDh14Qf0pAE=;
        b=gtJhPY4EIYD1aA22FaI2rjAlQqvpgS6pMrBGlBA4Rr0RRRgJvnQuCAOBF4CPJ+r7tk
         AKTOocyxqb1eOxpEkxk2vzcxeBi+R4CxTq9vjJz1PdT37NVNa9vCdTAclpDHnr3zN0zF
         2w7i33rAZ3Oc4Iv8zPKWI6VhtGXSFbJ7tdcMWIaTN+bbKWMHpBF7kx9h/m5jfq5VSsPO
         rILxloiHzmzzWaSD62GlRXFsjIlHHeMcfZMGlTDYGv8wJ6HtsgbK7mvgFLaMzV7d5hru
         4dfyRPxU7PpSU0qF7BQGDvhGDdLkBzbYqcQMOcmsnpyjSyeHTJv6Pt0oMvgAzf4KNbVB
         JacQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeLVWQ/ELEwvjf0UMHgEIHWoMQxcKVemK//a4p0V3zwMR9l80aQ+xLPR0B123FpI88GAFRwKdnHPATGbbeYqa1@lists.infradead.org
X-Gm-Message-State: AOJu0YyNnIeQmHZ29dWkQKyg+TPJw1H2+pOUWFctYxbpYGDjgFIIgkFG
	RpBivCG3xbdDcmLkrDR6p1Lq4L+10CbndxvGi9BnYZwcLAbjwnU3uye0gNXrlaTjzHCVoJWQDfS
	p/KqnVh2eXORkJV7glciNLaD381Gj1PM=
X-Gm-Gg: ASbGnctDgY9jahju1llmQWavkCUbA9KWksyfoqX1cY6My7YkIYjgWioK7JiqBpZAPqr
	c3zHlOt/Ox9BCjLiJ91P14GtLLTYvTQX4/j0FY7P7NsH8lVLOF4hwQbTfX//DpiuKyMN3CFNUA7
	mrZkVadCTk/dKXsmX6vOgRAASFVQSL4LAzKutqHbDeWqPHmv9zu5w8+V9gKlwAOY5QkhESbIb65
	70ctTrVzHSk77G/ww08jwvASba8l4OANFzxL4j2FcTfOwr1b3LxW4zCrzg3IgYoT2MJXG/vsmgi
	1HLyskfeEyWXntmJTMW22VyQQmv/sdcWA85IQA==
X-Google-Smtp-Source: AGHT+IEISLt1R8Tq3GUFGAlLRQg2JU0sPn1UxM/cYxwrh/JtX54j7bP+h6dE4yyysVO1BfHw279yngY5UxCTBJDhC+g=
X-Received: by 2002:a05:620a:2950:b0:80d:4088:82dd with SMTP id
 af79cd13be357-8906b7aaec6mr1842418985a.0.1761016680601; Mon, 20 Oct 2025
 20:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <20251017160251.96717-1-dev.jain@arm.com>
In-Reply-To: <20251017160251.96717-1-dev.jain@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 21 Oct 2025 16:17:48 +1300
X-Gm-Features: AS18NWDI6AbZQPBjErDyOP8dFS6M9xx3Z6lnBR5rWfIWS85iIEUyVJpIZk0sZ5U
Message-ID: <CAGsJ_4xwS9Q_5e8-F6PmyHm_1OyuHuTKnnzH_WPNiOmVzkkmdw@mail.gmail.com>
Subject: Re: [RESEND] [PATCH v2] arm64/mm: Elide TLB flush in certain pte
 protection transitions
To: Dev Jain <dev.jain@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, anshuman.khandual@arm.com, 
	wangkefeng.wang@huawei.com, ryan.roberts@arm.com, pjaroszynski@nvidia.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_201803_018268_C7360D0A 
X-CRM114-Status: GOOD (  24.65  )
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

On Sun, Oct 19, 2025 at 12:36=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
> Currently arm64 does an unconditional TLB flush in mprotect(). This is no=
t
> required for some cases, for example, when changing from PROT_NONE to
> PROT_READ | PROT_WRITE (a real usecase - glibc malloc does this to emulat=
e
> growing into the non-main heaps), and unsetting uffd-wp in a range.

I recall seeing this pattern frequently in multi-threaded programs. The sta=
cks
for the threads can be observed by running strace on a multi-threaded app:

mmap(NULL, 20480, PROT_NONE,
MAP_PRIVATE|MAP_ANONYMOUS|MAP_STACK, -1, 0) =3D 0x7fbfcd14c000
mprotect(0x7fbfcd14d000, 16384, PROT_READ|PROT_WRITE) =3D 0

The stack guard page in the mmap region remains non-READ/WRITE, while the
rest of the area is set to RW after initially being PROT_NONE.

>
> Therefore, implement pte_needs_flush() for arm64, which is already
> implemented by some other arches as well.
>
> Running a userspace program changing permissions back and forth between
> PROT_NONE and PROT_READ | PROT_WRITE, and measuring the average time take=
n
> for the none->rw transition, I get a reduction from 3.2 microseconds to
> 2.85 microseconds, giving a 12.3% improvement.
>
> Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> Signed-off-by: Dev Jain <dev.jain@arm.com>

The patch seems to make a lot of sense to me, but I=E2=80=99m not an ARM ar=
chitecture
expert and cannot judge whether __pte_flags_need_flush() is correct. I=E2=
=80=99ll leave
that to Will and Catalin.

> ---
> mm-selftests pass. Based on 6.18-rc1.
>
> v1->v2:
>  - Drop PTE_PRESENT_INVALID and PTE_AF checks, use ptdesc_t instead of
>    pteval_t, return !!diff (Ryan)
>
>  arch/arm64/include/asm/tlbflush.h | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/t=
lbflush.h
> index 18a5dc0c9a54..40df783ba09a 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -524,6 +524,33 @@ static inline void arch_tlbbatch_add_pending(struct =
arch_tlbflush_unmap_batch *b
>  {
>         __flush_tlb_range_nosync(mm, start, end, PAGE_SIZE, true, 3);
>  }
> +
> +static inline bool __pte_flags_need_flush(ptdesc_t oldval, ptdesc_t newv=
al)
> +{
> +       ptdesc_t diff =3D oldval ^ newval;
> +
> +       /* invalid to valid transition requires no flush */
> +       if (!(oldval & PTE_VALID))
> +               return false;
> +
> +       /* Transition in the SW bits requires no flush */
> +       diff &=3D ~PTE_SWBITS_MASK;
> +
> +       return !!diff;
> +}

Thanks
Barry

