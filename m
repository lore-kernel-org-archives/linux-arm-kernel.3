Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4A6CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 02:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhRXGlPI7eTuBNU9/cBeyXlhvR5QBZCVis/qgqQbLB8=; b=2UQZU5+dKlnUIaKUzv3y2mY9Pc
	LLLg5gxeuZviC25dTkXys6Y4Pps34nRLfFQ8R+NrNcsBo8m1/KEWq6lYQ5Dt8HIA6F6g9FqOZhgyw
	3ByYmz2FyKN35ecpgbwUelSTXUMm4ivOE03hVcrcucQXQHJEjjsyMEHrYqQ+cOLrLn8L+hwKZeHBb
	71yYijtq+5SyYO6pX0K+pxH5X56i7U+vC1xfzIKzqBR1VKKIqSKELDzISZCkNf9kztoseCevngNaG
	SjjuO7SFUYw1/0igdzuGrNW86iknjE1bMl9xmBG6s1Zko5ZqOLiTW7yeWvLGa+SkdDhHHJWhiIcZD
	gvWESCHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBNTI-000000027QM-02Ik;
	Tue, 29 Sep 2026 02:21:32 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBNTF-000000027Px-3Cg9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 02:21:31 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48af4663da5so43468f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 19:21:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790648487; cv=none;
        d=google.com; s=arc-20260327;
        b=B/4wsD5I5D0dJdAanPH5aMv8oZUsl7+3A8cY2I6IhICGLDSW+mhZLxIp+8eQy7YYHD
         G5oemdQM+YTDajxCxPzBar99n9LE/xALC3+P7ABYjqCV/Ha6GlroDkqx1oeo9vfvahpZ
         nCEkvWUtcIB1UH/v6rx+5Ivhi/RhJ5M9D5wQ0Cxpce8u8fPEbtdAXgj4uGU0ShOIKBJt
         DdXayGsNfBDTNkDxuDnH+Dz1Dt/igc6VvjqH2UDu8LpvcKsCSBsXwO1nj4ZOlSzIJrTN
         rW92vYqNojCkK1gOZIr6yFq/Us42Yi44NwrAugzOTt0xc7BTTr1rfaswTCJ8GfGxs3NA
         Dqrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QhRXGlPI7eTuBNU9/cBeyXlhvR5QBZCVis/qgqQbLB8=;
        fh=J6tAqF8IQCHlyzCoKX27076eklshYz323pECm7rtaO4=;
        b=GdgIiG/dX0Cb6oi7+JdO4v5rd9jd7DiRR3YGL6xNEKAItIjkCIJ2CajHq2k70v8jrE
         NlnE0JWiA3eCsaqkKkY26emVSvELxyA0qTPHrxEZC5zoZ8k8QXp34AKUE0fYohtFVmLz
         6VOF68PU2OiPuPGwC6kC6ZNFi77UnbChVpSOuBt5M6x+gpibOJ20fbXyY5l/siQC2EBj
         Qp6TIJ+VAJRPbCZccg5878tLoJH5vRiEU2VZtDw7FWGDHQzf8svDZ5MH08FUwxK80zkx
         0oJIH0Wq2Dg3KuCctw7KgxCswxegdxaA761d5YPnysCK/tR/MeYXj4zeWk8O/pYgybxE
         2c7A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790648487; x=1791253287; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QhRXGlPI7eTuBNU9/cBeyXlhvR5QBZCVis/qgqQbLB8=;
        b=BZz5tlEZdu1CJGYu4ZIJVWd4ZItUHM7TfFgOkgH3bHIon+w5xXZvyXDR5d1G2ubp9+
         5Wnk2jpJ0O8dbwhshocTyYgoGGcRsa372dkBSSI8ANXw711gr+1JxF0rlT56Pb3qYZVi
         ZVTMSk7IAnnrXgLWso22fk9G2qN8C/xK2Hp4sRJx5RRKTaFIm0BZC3ct4+n+jNWXfCMG
         M1pY6NLI2TggDKrZ4aal74oeI+WNih3NrpI1KjdVdGVcVXg2Snu51PtdToEOQqDlPiAJ
         KvEP/t8EETqs6gKk9+wfggn3f8oEAkhjtLTw8r+I3qXpQQy748C9mqLEKigM1hY0QOnv
         1O7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790648487; x=1791253287;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QhRXGlPI7eTuBNU9/cBeyXlhvR5QBZCVis/qgqQbLB8=;
        b=v5v4nG1kbqrEGPt/8Ie2B/Hw9MUZTvIauKHMPUQWiwvOlg3Zm8cuJPe8xqKO30sYXe
         rXm4Y4woJlNp7STubuURR8BJgy5OXa8RCV8l0BhcKC+edHMhwDookJFIfqgUGy49vugc
         b2e9eWW2q6AmtbEF3v77Z859TQMPKtb5/6rcSL0hPwXqLMQBtFYZq/xbNLWpjS1xYWrd
         t0kf2dScUPB5b+9452JNMD2i6JgVuwPwhHeXRBzvJiMJn5xBgDQr49/ueGtq7ALksMvN
         7XBxZUrqphzeIAuaIWVHBpiz/Jj3F1YIUnuWPndG0hCjCEPAQxSpmR5v5+qAAkEC2m6L
         rSnA==
X-Forwarded-Encrypted: i=1; AKwUvBwRxLT02IbUVGtpm4LoRGfBuxuaz6b1VcKhOctRSw+xFU1EdWJfk97KyAFfP/SI02IxipwK4PMCSB+j4Jbyz9+u@lists.infradead.org
X-Gm-Message-State: AFq9FYLJFYykLDIItjIY1D/4rLM4wSUAMIhUbUUtBqfwfki42l4ecZQX
	ngrHECSBhHhO6/KvfJ+w3A4x3fpwD2AIsJFuYWxX8mqQiciisRTNEFFqsILuB/6AXew+0rMDg55
	Y7B831ElYdE5o/Pm4J6VHbKg5vm36vJ0=
X-Gm-Gg: AYBFou08LhFI7VLB7qGJmc1AdhmCmH5224H5MXHsVkxqXJ0dmQnLLVhFsee9zng4yGL
	GQLXdigjhwVgHKs1iU8Lzomm9NP+MUlQY91pANH5lbx2a3zfnRb3x3RmJ9tqf/R5XvNozGoZLxV
	7YM4SJvwdKs6oZqZYlACaF4OzAFs7aBT1Zf6O0uEPeDHb4Po9mBUZSlQYTJ4jkcSHYf5sBTJgL0
	YeoLMfFS/4WYeEE+PvREvzCn+W41TW7sRJN8fhC/74mDtoSXjKcNEqh+Ko8kzVC42MQGmMDLRuu
	d0Mz0MrnJoOXAtGs87b4roiYFzJuLGA91lnrrbirwRmBejGAu/Uxb3OI2Fn1xuRjONk=
X-Received: by 2002:a05:6000:268a:b0:486:f9d9:fe0d with SMTP id
 ffacd0b85a97d-48872abc48emr28274596f8f.29.1790648487350; Mon, 28 Sep 2026
 19:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260923062832.479455-1-jiangwen6@xiaomi.com> <20260923062832.479455-4-jiangwen6@xiaomi.com>
 <CAGsJ_4z-oqoxKynRr6mz0-5zZU_2NBnPkwz05CEEHHnwTyqa-Q@mail.gmail.com>
In-Reply-To: <CAGsJ_4z-oqoxKynRr6mz0-5zZU_2NBnPkwz05CEEHHnwTyqa-Q@mail.gmail.com>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Tue, 29 Sep 2026 10:21:16 +0800
X-Gm-Features: AclHuK8No2tft3nV17h4GBsP_bu8Pg3JxoSCR-9ncascs6inJDmmsjStzCiYUMU
Message-ID: <CAHKocdGWbEukM6y5iYDR3u-9jJrqr=zDxqAkR1smR+o+TFKGug@mail.gmail.com>
Subject: Re: [PATCH v9 03/10] mm/vmalloc: use pte_set_huge()/pte_clear_huge()
 for PTE-level block mappings
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com, 
	ajd@linux.ibm.com, anshuman.khandual@arm.com, chleroy@kernel.org, 
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_192129_884231_03023C09 
X-CRM114-Status: GOOD (  22.64  )
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

On Thu, 24 Sept 2026 at 05:38, Barry Song <baohua@kernel.org> wrote:
>
> On Wed, Sep 23, 2026 at 2:28=E2=80=AFPM Wen Jiang <jiangwenxiaomi@gmail.c=
om> wrote:
> >
> > vmap installs PTE-level block mappings by reusing set_huge_pte_at() and
> > huge_ptep_get_and_clear() under #ifdef CONFIG_HUGETLB_PAGE. This makes
> > the feature silently unavailable on CONFIG_HUGETLB_PAGE=3Dn kernels and
> > couples mm/vmalloc.c to HugeTLB internals it does not otherwise need.
> >
> > Now that arm64 and powerpc/8xx provide pte_set_huge() and
> > pte_clear_huge(), add the generic fallbacks next to the existing
> > pmd/pud_set_huge() family and convert vmap_pte_range() and
> > vunmap_pte_range() to the new helpers. The CONFIG_HUGETLB_PAGE guards
> > around the block-mapping paths are dropped, so PTE-level block mappings
> > now also work on CONFIG_HUGETLB_PAGE=3Dn kernels, and mm/vmalloc.c no
> > longer includes <linux/hugetlb.h>.
> >
> > The fallbacks exist only to keep the build working on architectures
> > without PTE-level block mapping support. They are unreachable there:
>
> Since this is a `BUILD_BUG`, can the compiler simply eliminate the call?
> I guess the build would still pass even without the fallbacks, so this is
> more of a build-time check than something needed to keep the build passin=
g?
>
> Am I missing something?
>

Hi Barry,

The generic fallbacks are actually needed to keep the build passing.
Without them, x86 defconfig fails with "implicit declaration of
function 'pte_set_huge'" =E2=80=94 the compiler requires a declaration at t=
he
call site before dead code elimination can kick in. So "keep the build
working" in the changelog is accurate.

Thanks,
Wen

> > the callers only run when arch_vmap_pte_range_map_size() or
> > arch_vmap_pte_range_unmap_size() return a size other than PAGE_SIZE,
> > which requires an arch implementation. BUILD_BUG() makes that
> > explicit rather than silently doing nothing.
> >
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
>
> Nice to see that `#ifdef CONFIG_HUGETLB_PAGE` and
> `#include <linux/hugetlb.h>` are no longer needed in `vmalloc`.
>
> Nothing concerns me except for the changelog issue mentioned above.
> Please double-check whether the changelog needs to be corrected.
>
> Reviewed-by: Barry Song <baohua@kernel.org>

