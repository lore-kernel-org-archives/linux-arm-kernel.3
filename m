Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D83C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 03:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtP7mqdwbcbBQ3dE4FdyL7JubqoEeAIm5NkObJNd6ps=; b=DmoHSxk4Z5WiOQQdZIaTXr5y1G
	+rCZcH0dyCCa2eaqHEzsoShja1kUrdzmB7msKlWErcm21Ss0ojeFN06RR5HMesyzyasETxnm/IQFh
	SXgbO1zxaQQfEPwK7KrqkCs/PNc8Z0YN/sp5WDcjBY3k3V6ZQHr3IsHrXWnLw/0adLKypAh811Q1S
	xE9q2vOVIZ+qxYEJToJqEYsKE+4iu4EVhUkljH1CAk0J/p2jS02ZQFJU2qNr0s3k2I7UewGzMboFi
	P2FzUDDuijfE2updnrLR0ND839mJv7Rrl0HX/5QvIYRxQVszj8TaSRH/gTUqg3S4S3RkUHm3N6S1i
	0xSoVU+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjqLY-0000000Dgp5-3fzp;
	Wed, 15 Jul 2026 03:31:44 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjqLV-0000000Dgod-34Xt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 03:31:43 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-493bf73ec2aso33966065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 20:31:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784086300; cv=none;
        d=google.com; s=arc-20260327;
        b=AcWkl56AonJFi5sQ6rRPPQ9dee1kcTKv4gXteAsPdjXp1NxQCn6HkH23luwvw1cfyZ
         SvIrQOOR+mMJ4GSKD/swLLly5QIhRQ9eaTGs2IOxXriWzR49Occh/4MYlXcjH2wWwTfy
         dqMr4rCUEtki9ea3TvMF3laSOZKtQTnw5JsM8bz0VWI/dNyPvveMuKvg2dm0ytmT0x0T
         SIfXI8B6XJyWolEd3UIh4nzCuy7qLE4gdSjEZI3vOUc1C/chO4rBaFpf3vYsC3qNjARg
         RN2NsnG6iWwYxg9pZGVAJp7cgPFzv0Gzb0ARCDlpuVqjfrjHc6FwGp0QmywISGziMURQ
         trSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GtP7mqdwbcbBQ3dE4FdyL7JubqoEeAIm5NkObJNd6ps=;
        fh=46gCkXaf5EvKwQDX2vBbAT3kVGERskF/p9fDusMYptc=;
        b=Z0I2xOl4uNYIP7NlUfOjGidw2FKkE/I26g6N//l5IXXxFIAuAYXnp+PlwAGIfMMWW5
         Xbut1nahAFrdL39Y27NxY2P7KA4EzIGsoDIWE9lPj/irBgdYsLguAqwpkLkea0VR2QSi
         HYARFQJmn0Qfn25okfFSnLhRYMddsU0MFyvr/7Uv5LjWa2g9UNhNw5pD/XAmbUQJxpFq
         2CYaNnntu946wF/Rpdxzu6f8P4R8zTypiDWmxLxCAp43OeSmFbAtmTZpFxX7P6o0mDVx
         ioGNtDo6aWsu6VF0fstHUa163OszURtXOsUEDZPwt8NCp63ZpB1RLMgua2+mTBCyMsNr
         iKvw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784086300; x=1784691100; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GtP7mqdwbcbBQ3dE4FdyL7JubqoEeAIm5NkObJNd6ps=;
        b=E5EiXErtrmMbID2BKF9yBNvafELZZKVMmrgl9vtgUX+REYQSXQoagQlhLB+apgk+hb
         /sou7wt09be0DE0l4Wmlfhoo/0mMH/RXG2oaoYKFKlh7HCy9aKiw4AD+v+/TJ26HJP2E
         wvRiR8ghtqrgtBWK8LWwTNjPb765fNfrBcn2BDmcWd/5biBD2vMHvJuHvoShRPiZ1qi/
         kwVERORAwdDf6OzOt/z3GiAau3l1pVAv5undlJVwjw9P5abcqK0qXEwcmbDA4v07yZ+I
         l0DKWCCCuEYcRSZsU3RBgQLiqw8IFO/H1S2/oR0uxY274AgJfWfzDLRPxacAMAd08lBp
         jexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784086300; x=1784691100;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GtP7mqdwbcbBQ3dE4FdyL7JubqoEeAIm5NkObJNd6ps=;
        b=rzs9ithn7Qy1UXuGywRLpXqxTcJhZ8ev2dyDWcZO10oGsTGfbiUYuHYX9pn4xAzoWi
         TLxm0+HqaF5lzYZ6RWwnNs3UMQ9S7gChruTKAE1bJWvZEY5B0kcmSbzDZ8OeL+5pnUt7
         ApY3ijr1TzR3op6ZYw+y3STMYIpSyiqtG1YqqTBGfS6EIVRaK6cafr9nlPdZ6eVSQkPv
         unW0rNPVRDnRHZn0HiabOitgcOdzsCJ5lSsBmrkyCHywDFZ/dhNQzmjvDWl31xgCweBs
         6PGqIxIj9z8JlpAI85hNIVh6GPCDsxRw8vcQYlULtI9LQqud55z4y/QQdBhq5haitCYV
         busA==
X-Forwarded-Encrypted: i=1; AHgh+Rr8WigGLjDPoHhV/tkt1SlW9YjIuJQC4fx+nsefQxGCr9ebRq6/kddZgsg82C5JkyHIt0DCwlKyGD0BedSia5F4@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8/pkGMJxSq322NOEE/IJ82jdG2TUSjlmXAsozg2wF/X3u5MFd
	3a2/wWyeFNCgiJPz/55oUl5G41xtjoa71ytm+2rhg8NAdACc/QLrPnIOdbDQffDflHtCYtZeVMI
	SMURBmMJ2TWnkTFzLrs4ihZGUbKp+ga0=
X-Gm-Gg: AfdE7cnRG2O9RQEL1YH0BDRfEMIZZe1EJMBGRDf45kM789jgdpvXJkNinirin7nwprY
	Uif2ser03EmlTvUAcutOOBMomuufaYqAKrg36MdLL/Q5YABtphHi1k96MR6i14NW5OPl8ZynqwB
	nw+Jz81FwsD3E06XwR2cmTPg99hr47g5qu4RncRd0qvILTfv7XeHCQCaJXj7KGeReLUXai+QvYG
	bp2d5YSy/e9aDWbzn9cQ62bsSsTFvJoHUtfTiWGWtNrZlmVuRidkMwN4uMlTS5fB7f62SupOA==
X-Received: by 2002:a05:600c:4ba4:b0:495:3af9:4cfe with SMTP id
 5b1f17b1804b1-4953c27b2fdmr6872935e9.20.1784086299564; Tue, 14 Jul 2026
 20:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260709073823.6643-1-jiangwen6@xiaomi.com> <20260709160805.26e63bae89dd03cf2951104e@linux-foundation.org>
 <CAHKocdH5kp5kTtZht+v5j-4-Thh40TGvif3=kRMgErRXr+Q+RQ@mail.gmail.com>
 <929dedc2-eea3-4153-be6d-d2dd727fed89@arm.com> <a08e2a7b-2ab8-4429-8d4d-9c13b6a2a77b@arm.com>
In-Reply-To: <a08e2a7b-2ab8-4429-8d4d-9c13b6a2a77b@arm.com>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Wed, 15 Jul 2026 11:31:27 +0800
X-Gm-Features: AUfX_mzMWyMfwUSgcUr2LDzdSwpL1lZmN1GS12WSAWlTo3L5vUmb6NstvZeybe0
Message-ID: <CAHKocdEJHF-33ExyBHJEvr6hTWZ2xmTXPqmZaC67TyLmwNnp5w@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
To: Dev Jain <dev.jain@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com, 
	will@kernel.org, Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, 
	david@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, rppt@kernel.org, ryan.roberts@arm.com, 
	Wen Jiang <jiangwen6@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_203141_894126_3B562110 
X-CRM114-Status: GOOD (  27.87  )
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

On Tue, 14 Jul 2026 at 19:17, Dev Jain <dev.jain@arm.com> wrote:
>
>
>
> On 14/07/26 2:06 pm, Anshuman Khandual wrote:
> >
> >
> > On 10/07/26 2:24 PM, Wen Jiang wrote:
> >> On Fri, 10 Jul 2026 at 07:08, Andrew Morton <akpm@linux-foundation.org> wrote:
> >>>
> >>> On Thu,  9 Jul 2026 15:38:17 +0800 Wen Jiang <jiangwenxiaomi@gmail.com> wrote:
> >>>
> >>>> This patchset accelerates ioremap, vmalloc, and vmap when the memory
> >>>> is physically fully or partially contiguous.
> >>>
> >>> Thanks, I added this to mm.git's mm-new branch for wider testing.
> >>>
> >>> AI review asked some questions, and some of them are new since the v5
> >>> series:
> >>>         https://sashiko.dev/#/patchset/20260709073823.6643-1-jiangwen6@xiaomi.com
> >>
> >> Hi Andrew,
> >>
> >> I've gone through the Sashiko findings:
> >>
> >> - Patch 1 (find_num_contig): Over-interpretation. No new hugetlbfs hstate
> >>   is added. The extra sizes are only used by init_mm kernel mappings via.
> >
> > But not sure if that is a right approach. If these multi CONT_PTE
> > sized mappings need to be supported in vmalloc() but without adding
> > corresponding HugeTLB sizes, probably these required helpers could
> > just be factored outside HugeTLB.
>
> The problem is that the existing vmalloc-huge code reuses the hugetlb helpers
> because it is easier that way.
>
> If you really look at it, num_contig_ptes(), set_huge_pte_at() and arch_make_huge_pte()
> do not have anything to do with hugetlbfs, but with huge mappings. It is unfortunate
> that these helpers are sitting in hugetlbpage.c . Really these functions should be
> pulled out of CONFIG_HUGETLBFS and put into some common header - but I can't think
> of a clean solution to this.
>
> So I think for this series, the least we can do is add a comment to clarify that these
> helpers can be used by non-hugetlbfs mm code to set multiple huge mappings at the PTE level.
>

Hi Dev,

I tried to add a comment, but it feels awkward to place it cleanly around
these helpers. Since the change is mainly about vmalloc reusing the existing
huge-mapping helpers, I left the code as-is for now. Do you have a suggestion
for a better place to add a short comment?

Thanks,
Wen

>
> >>
> >> - Patch 5/6 (NULL page): Invalid input. vmap() expects a fully populated
> >>     array of valid struct page pointers.
> >>
> >> - Patch 6 (32-bit count << PAGE_SHIFT overflow): Pre-existing. This was
> >>     already discussed in the V3 thread, and a separate fix was proposed
> >>     there.
> >>
> >> Thanks,
> >> Wen
> >
>

