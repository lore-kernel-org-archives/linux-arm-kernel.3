Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D430C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNRtJyB9QHVjAm5rxzEf0kABc3aKI1V0CftN11/9Smo=; b=WC3A22KXeZ84L3hA96Q7D03C2u
	8AtKPBKmpSeA3uhy+57JaDVVpehLKpbIdxUhobZdfvfoUTbwD5z35TNUxnA/rNLTV4z7VADO0LwIz
	z0FcBP1mzlsDCYybEVxDeTKSfF0qVbTeR4zPwEEwypIZIUQVsoOMhMhWSp2ucdgBEBvkqgCIB3eAd
	5OXhAdHFz35kZ/hkK/OqCDr581/rDFvT017OZxeK2EAlynXEzCcgAGG+R6p+t+LAFeKsR8rxIxOqC
	Jcz6SEm1+ENUyHNOJw4pIsD1pL6o9KKWFDNTPANfSnXW6fYQuQLATMbbbkKihi4fE1+uCu1XrkpLn
	H51CHxYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu3c-00000003PQO-23bF;
	Thu, 09 Jul 2026 19:05:12 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu3W-00000003PFN-187n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 19:05:10 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-698ab9aae16so269679a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 12:05:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783623903; cv=none;
        d=google.com; s=arc-20260327;
        b=JPlSjCigqeXPprHywPIK/4JXb35O4PBlKSTUXS+cZkq9zzQo3xLYSmJE25R0JJf3AN
         qsaAj5OQu++jcVd8lRpGEnstnCVMkuqDlDxUGHWQeNcWOl96xcDHR2au/ZhhqXaEZG8a
         897wrPR06efEC8qP/XvOrKS66G3kWEt42Sw0N3Djz4877XgGprjSqzM/kS4McgOx4RCZ
         Ghkqs1UeyoZ8D07pFKYJaac3NPyptBYIhBTtNp/V3WS8JyK+4Z+JenDjsZFlclVI/ayI
         LLodb1eWfo4E+Jm4J7a4YaNRldkjkRfnga2uauUVXqFnOJPLBTURRuUIgnwCS5DbhLCR
         3CPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bNRtJyB9QHVjAm5rxzEf0kABc3aKI1V0CftN11/9Smo=;
        fh=D1phbIyzM00FwE00c0Ksm8LeUk2JL4TF6BeRPQxhZFw=;
        b=GT+yEwCaKjs7/7tHdHDkvgJHzE5JfD28ztTd7X4PMHHlUCRj6oI3KX8cEujbtbv6/g
         eMLYRyp+meCnI7tHQWgwsqfDI0RuyHOFY4Bqyco/ByBeNEH4jyeO+pOtT3xoNGU3wVVj
         OPcbsXDZ0J/8BejxoEGeXVwMVCF2L5S1k87LkgXBiBrZvUOyqGMwlGUTaof8InZhIa69
         HWi7sYEoDpht5sdvpfWZ15VHYDJLVDpvRvrgqxH8ZQaJtSCq4Ks8SLX+H8ZLzDxmYWd3
         mOKQnWpfNPR2uA/rhTDgFjj5vUhTvJxRKqleffUPWzLKYsInokjvV5fmh9iqed3rbY72
         oacg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783623903; x=1784228703; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bNRtJyB9QHVjAm5rxzEf0kABc3aKI1V0CftN11/9Smo=;
        b=lfAmycheWqRLMeA2OMLulVjydH99pNKl4bCUtJMb9GGQI20ncttqjCqXEWPjmrzKHD
         TH2u+u8RXVQWjfRWFk2YqRRWkfTMkN/9DS81iA0P8zVvr8ZLqS0HufWQqmpd7SW3H9c2
         tpyxR26BBJRPqHF3vY159RKP/VPZU/XVIe+gsDyYl4Dfq2/+BoI/14EcB6EOcZ5wgFwF
         yidZyXNH4XEhd3bBl2WRbw+lqtmtA+IpUqvIXvsfNYRJdS8CIVnSBwaYLb1Rl31z1wux
         SVMQmx3xt8ciNEv/3TnpcDY2alQLX7XaOdmaW7D1ZP/qE6FDQnj/OCwAKZ+ztUlbOZ6Z
         J8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783623903; x=1784228703;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bNRtJyB9QHVjAm5rxzEf0kABc3aKI1V0CftN11/9Smo=;
        b=SYRTYcbY5HJ/LkYyANejuBdkd7mBkK6nZmROBALm9qdA/sSJFpYTw2FAhYx+NGxFg9
         ebx47HYugr7LSTHqrBax7k75+uONEAGx7oVJiL6BO94L3Ap6fmW0ZwrbKBhv7TrneRa1
         i9u1WRIhsrqEGod0pNttyvN0+zTjvBeEV9ccvOpnbjQbBTM7XC/gUSJTW28bQeDAOnuT
         GnCT6S9Ol/yE9ZjXzcq/QRwCA3AdC3q/NTk9Q5p5PUCI3p3eJxVQ0WUEiKRfNbEuQF5+
         IGPiII+tIzq6Em/mpNW1qqvpZB6+5tLFn0qVasydoFzOh9NouVyqlzM687Bumpnc/hTV
         +DUg==
X-Forwarded-Encrypted: i=1; AHgh+RpKm/bporRqyTdomPtKP2NARmFlF59CCpx/3Tk9aQMpySRx1C5l+ZCc27SBniEbp7lHHYE5VuhFKehTitRBgCx5@lists.infradead.org
X-Gm-Message-State: AOJu0YzXbm/+EQiGXwQ4eeZWl/FNO6MrAmk+948qGageT/znImXSd8jd
	gm+XOKv19U6U3OrjTxSL2dsbW1gntg22Da1SrfxCCt7PREf9lWLHBPMlLEH5d/UiyKG51g7wZIj
	gx3jWC6WkoZGTUcxkei7XYK36Rau04oePYdchcfVo
X-Gm-Gg: AfdE7cnjApafFPy1tOqdH8RfnuSsOnUCaKUAsp6sGXsaAxbuyHm1tTf4Iaptys/DQa9
	Hqp/10T/y9OTk1ZqDKmMfeYIlS2yhHovzQQ8lrNxlrp7z9a1baUgzitZSJEjWrfCXTkTvR1z1Wg
	C8VU1ahaWsgDo/555cpDS7rNMvn9yKe5ZJms5ruZZoLsjtwKS5wy7qVYVzjsaOhjtjAO7zXpd8b
	VYTgVYGeSnvkQxuTkwR0rhJAG3LgPdQ9hOQsd74gcMAb5HWigPE/hlBCfm5nkwx8u6u3wO8KRng
	55tXUVp5JwwdxDHk4qxROHI1UcRz5co3ManZqo0137nUjXrJQOcJOdoSImA=
X-Received: by 2002:a17:907:e153:b0:c12:aaec:3436 with SMTP id
 a640c23a62f3a-c15cdfeac35mr299077466b.14.1783623902587; Thu, 09 Jul 2026
 12:05:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com>
 <FC9E78F0-8FF7-44AF-A848-8401B4702488@linux.dev> <CADrL8HVkrojXbBuEX-W=UHBmyyFzqxdGBvtAoPP53SyYa10uag@mail.gmail.com>
 <ABB70C2A-316E-4C19-A855-C9920BE105E1@linux.dev>
In-Reply-To: <ABB70C2A-316E-4C19-A855-C9920BE105E1@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Thu, 9 Jul 2026 12:04:25 -0700
X-Gm-Features: AVVi8CcfpMMaiNKWH9W77S2UuJGk4oIqw9AGhPYaowbYWta-f_S794HnODSYVjA
Message-ID: <CADrL8HUCqrzOQGXRDwnitintQHjHCw10n8wo6gChQ2tWvC2JBQ@mail.gmail.com>
Subject: Re: [PATCH 00/18] Another attempt at HVO support on arm64
To: Muchun Song <muchun.song@linux.dev>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Oscar Salvador <osalvador@suse.de>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_120506_367225_5DD0528E 
X-CRM114-Status: GOOD (  35.60  )
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

On Thu, Jul 9, 2026 at 2:55=E2=80=AFAM Muchun Song <muchun.song@linux.dev> =
wrote:
> > On Jul 9, 2026, at 00:49, James Houghton <jthoughton@google.com> wrote:
> >
> > On Wed, Jul 8, 2026 at 1:41=E2=80=AFAM Muchun Song <muchun.song@linux.d=
ev> wrote:
> >> Do you mean that the support for AF might vary across different CPUs?
> >> I'm not that familiar with arm64, so it seems a bit strange to me that
> >> such basic hardware features can differ so much from one CPU to anothe=
r.
> >
> > Yes, hardware updates of the Access Flag is a per-CPU feature. It is
> > available for a CPU to use if TCR_EL1.HA is set. TCR_EL1 is a system
> > register; each CPU has its own. (Linux will always enable HW AF for a
> > CPU when it is onlined[1] if support is advertised, so we simply need
> > to check if support is advertised to know that it is in fact enabled.)
> >
> > These days it is not uncommon for a system to have two (or more?)
> > different core implementations, like with "fast" cores and "efficient"
> > cores.
> >
> > [1] See the CONFIG_ARM64_HW_AFDBM bits in arch/arm64/mm/proc.S
>
> Thanks for your detailed explanation. When enabling HVO via the cmdline,
> can we simply prevent CPUs that do not support AF from coming online?
> Would implementing it this way be much simpler? In practice, developers
> definitely know whether the current system is suitable for enabling HVO.
> If some CPUs do not support AF, they would just need to evaluate the
> trade-off between memory savings and having fewer online CPUs than expect=
ed.
>
> For scenarios where HVO is enabled via sysctl, we simply need to check
> if all CPUs support AF. If any do not, the system should return an error.
>
> Then, we can proceed with the Pre-HVO.

I don't think it makes sense to try to implement pre-HVO.

We cannot do HVO if any boot CPUs do not support HW AF, as HW AF will
be required to free the HugeTLB pages later, which we should continue
to support. Pre-HVO (today anyway) happens before all boot CPUs are
onlined. IMO it is not okay to prevent boot CPUs from onlining.

Let's say for a moment that HVO cannot be toggled at run-time, then
the best we can do is:
- If a user does not specify hugetlb_free_vmemmap=3D1, we can always
allow onlining of late CPUs
- If a user specifies hugetlb_free_vmemmap=3D1 but not all boot CPUs
support HW AF, we can always allow onlining of late CPUs.
- If a user specifies hugetlb_free_vmemmap=3D1 and all boot CPUs support
HW AF, we must not allow onlining incompatible late CPUs.

HVO compatibility has to be modeled as an Arm system feature. To
support conditional onlining of late CPUs based on whether or not "HVO
is being used", we still need the extra cpufeature.c logic.

So if HVO cannot be toggled at run-time, we can simplify the
definition of "is HVO being used?" (for the purposes of determining if
late CPUs can be onlined). We can simplify it from what it is now
("are there any optimized pages?") to
"vmemmap_optimize_enabled=3D=3Dtrue?". That allows us to drop patch 15
(which then needs a slight change to patch 17), but that's about it.
So this is a slight simplification, which is nice.

If you (or the Arm folks) feel strongly, I'm happy to write this simplifica=
tion.

> > I'm hoping you can look at patches 1-3 anyway. I think they're the
> > right thing to do, even without the arm64 changes.
>
> Yes, I've looked it over. I think that making modifications across
> several areas will be much simpler on top of my refactored codebase.
> For example:
>
>  - In patch 2: There is no longer a need to move vmemmap_get_tail().
>  - In patch 3: Handling partially-HVOed pages becomes straightforward
>                because vmemmap_restore_pte() no longer relies on
>                ->vmemmap_tail to detect whether a restoration is needed.
>  - In patch 4: I have updated the ->remap_pte callback to return an int
>                as well, making it easy to adapt your changes.
>
> Overall, the implementation is significantly cleaner, so I won't list
> every detail here.

Thanks! Good to know I can basically drop those patches. :)

Please CC me on these HVO simplifications when you send them out, thanks!

