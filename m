Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCC0C5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 00:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4AA8OiM1vXV9NGju9aaAoOj8PkOEmbJNYD0kmJf+fW0=; b=3+BbJMTcs7LyvcVj2gAcQSAls8
	jwJX2k35UAzrjL+ofd8qkCBVXo6rB1ekSV/CZRVY9u1/spObeJeAr6bPvZbiccKdF+leZ2jmCSBEv
	jAQhHjql/6t7dg7c0ZDr18yVvU0Y7GLPoNUja1v0E+fA3QnqmHBtNpED43kqy70zoEYqJiLUK4Kio
	yBaFhTu8Sy9jCjsjM64E0aoamjeYqrBlqqSRrnekpZA0OxDkfCOgMSFPAwvQ7OJU+dkmrP+3XIvdn
	92hQ6BUGWgqSt9c2UVsr6zn5LyqdU/p8mNv7lNGb5tGbCaTH+2UNNrszOdgEM39wgrtqZLhjNiqnF
	P6x3XbrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyesc-0000000HWs2-1gMi;
	Tue, 25 Aug 2026 00:19:06 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyesa-0000000HWrF-3N2J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 00:19:05 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c16794450aeso597682266b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 17:19:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787617143; cv=none;
        d=google.com; s=arc-20260327;
        b=i3l2Dr9507PIYz/H+wnU8PPmPMjIMZDSYKj+JaHRHbarD2R0rmtw50tCFWrVm8rNdh
         uPSWd513qrkGNPo2bsnU7J1Zh8IXh0H1jZdCqrnlKIHkoZfcuKKDP9byiqbR7ViE7N0m
         Cn4cS7GQQljfghI2lK8EbSkXXzOFLh/tOz2qdKjFq1lTbkMGdjpDmtV3UrSUvqIZDN8T
         zL0jDvuD7Jt5cnEZ5iIjp4jSE7NrkkmcKTfcUtHe0Ae2V+05UBezY5Xoe5cDTEwHbYR/
         w6Gps72olicCubU/AKVT7CEL45LO9WnmwmNeg/gWLkYov3YcwAHcOpDfP8U9aVzTFnJA
         sbuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4AA8OiM1vXV9NGju9aaAoOj8PkOEmbJNYD0kmJf+fW0=;
        fh=j/+p+sCypVNqlkORy82vojXChqH4BxfKKkWDqD2Ki0c=;
        b=PKZQUxu+coIVLU7NIA+Zs/3JVyr4FEtZM6eOVR90opop9f15INznDlGD7i6TP+JXg+
         h6MIztwlU8Cw13gOQjOWuYvLB8J3HvDbwaGNV5Cl/TTlPFXmyP6IPRisHnvDY0rFM4xj
         PGf1o+1RRdGHzAbMX3sOQL/9Hin/Gj/mkIC0MwR/dGJpNQrvR+EoTIX095FA8uNLqhry
         RSAjnXbepVIEzw0bB8kQwEsZVIOJAvjSk6J7h7skyNs7mn93FkhLRuOdvS2Y1UkkhWVW
         KUVg4/1om9b7ooaqjxlONJKUXWZJgbK88QuFDLwHmbz7SXd6HD0ujdvwQHffW3PzMetZ
         F3Hw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787617143; x=1788221943; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4AA8OiM1vXV9NGju9aaAoOj8PkOEmbJNYD0kmJf+fW0=;
        b=bm1YgOvT10hyKgquWrvdC3kX99ZovhuhS0heqYo7LbofdbIgmH9cyCvyHQKf7qCq8E
         0/iuiKO2WT21vVJd1cxZ6kZF7FtyYeKbHpOW6MldbUaznLcrkc2TmDegO9rH6dCFr+uo
         nAmVslFu6r81M1gp+xacVCR1iY2JlwEjPTPAg4/REsLl8dFrbrqooPBCM7qe454CxN3h
         Uh8tpko8Ecx0IjHHoPXODEroJY7KchEGNU0hgJClA6rwtMRNv7H6yT1q55t3LcB/9qAj
         gmXjXkzuBroT34xQa8HbvvqlX+PAvaoVrIZCSARy6GIWzphHs1aAHNnM7aijX2TQJSG4
         chSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787617143; x=1788221943;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4AA8OiM1vXV9NGju9aaAoOj8PkOEmbJNYD0kmJf+fW0=;
        b=fE+VUOPSE+EelvN1eh4BVpa0nZ5tHRPhSVcs6cpLrlnwb0qmhyrcDvA49mDH+qNImL
         eHcndtUaT3ZD6jlqh6yn0h+zl9ELK7L5gYUa3qX1qgIMVx9O5/17E2ph8P7jW3SSLpwk
         iU518T+zbxkGvLyHGZrK+K02H6QpugCcwI1dmFK7m5T1T4rNSD49sxQuoxVr45zQ57VU
         JhZAk7F9SEiX91hgSp22s2bNuIT0KiZyAra4r5M3lMK0ez+aeeurhLUSCk/zVRD9zldV
         ySVzo6Ro8VnScDXFB4+7YrwFafe5bZeysRMqwJroqBIv20Egq+Uc9fsdLXdBKRirz3Tn
         uW1g==
X-Forwarded-Encrypted: i=1; AHgh+Rp2h78hxGle+90uwHTeOATmZjJ8Ud4wqUI0m12TGKFX/tVz3HAV7tt5tP+uuopHLWJRqsmDz3IdaJnYyxKzzpTj@lists.infradead.org
X-Gm-Message-State: AFuF++m6g8uV7T9K3dCwXyJpcPPYSTa9OmCHwK/BLult/I/UZxoYtljH
	l2e7aATNsUtWNW/P+EdMucl5tUc40Jl0Mrsar5I27qRlBR+ypOxAOFvaHak++XcSQsm0PtjYglN
	BFwF5pcqaaQbDxSb7r5iHOQPUioAMhzJz7MaxutOH
X-Gm-Gg: AR+sD12NZA2uwMzSlhtyi69JcX9rCBjiUPK7Iem4njTax1fpDFIY3FSiMWnJYdSxqn6
	9+A7jiE6PfEWVK+L/nVjo4LBW94+8DvgD2cSyTZlmHDB+fBkaD5HbLELjCaIVJ63n+5AdQS5EMP
	1Cpr0F/ojQoLRb++pWBtpzjw9GTAthQlCW9DElONW60mVqV7uCuGxtvHinPR/z9zW0Kj6m2/Lq6
	FYgV6DR6M3G+q5L6DhsqwoUqIwv/8AJXeTuIjBWJrFOsGFeb8CbN/cSCT4sN5kuK5PcnUDkrx8P
	PE8stNWkPuWrLWsLCnbP/ahpYWe5R7z/L9RPQcAz1IO/2wH5z5371LCxHUmyh8qiDFYPa4wrcuN
	0PkERliQgi6W23wiNs0yBAAeXNl/94AnjnU/t8SVy3KyCRh3RvbAapPZXpuKjYjqDrYQrcetyZ8
	coMHglAH/p5yLnSWOrLovyZE0=
X-Received: by 2002:a17:906:f049:b0:c16:126b:98b4 with SMTP id
 a640c23a62f3a-c246a2ef584mr3235540266b.3.1787617142396; Mon, 24 Aug 2026
 17:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com>
 <20260708031129.3503195-8-jthoughton@google.com> <aoRnMRZ0jE0ycwcT@arm.com>
In-Reply-To: <aoRnMRZ0jE0ycwcT@arm.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 24 Aug 2026 17:18:25 -0700
X-Gm-Features: AcwNN1ULVV36J9NLxd762hVRv_uaRizf-iGnaiBYSt4u_4U8MisWrig5oazgX0M
Message-ID: <CADrL8HXyR0UVfaLs4i+DQtxDYCUzubatjfN6OZDURzR-R7dhNg@mail.gmail.com>
Subject: Re: [PATCH 07/18] arm64: Add system_supports_hvo
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
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
X-CRM114-CacheID: sfid-20260824_171904_873725_2AA2F488 
X-CRM114-Status: GOOD (  20.79  )
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

On Tue, Aug 18, 2026 at 7:07=E2=80=AFAM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:
>
> On Wed, Jul 08, 2026 at 03:11:17AM +0000, James Houghton wrote:
> > diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/=
cpucaps.h
> > index 25c61cda901c..6db3ef827f86 100644
> > --- a/arch/arm64/include/asm/cpucaps.h
> > +++ b/arch/arm64/include/asm/cpucaps.h
> > @@ -75,6 +75,8 @@ cpucap_is_possible(const unsigned int cap)
> >               return IS_ENABLED(CONFIG_HW_PERF_EVENTS);
> >       case ARM64_HAS_LSUI:
> >               return IS_ENABLED(CONFIG_ARM64_LSUI);
> > +     case ARM64_HVO_COMPATIBLE:
> > +             return IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP);
> >       }
>
> We shouldn't use HVO, a software feature, as a CPU capability name, even
> if it's called HVO_COMPATIBLE. Maybe we can come up with a hardware
> related name, e.g. BBM_THROUGH_AF.

I was struggling to come up with a good name. BBM_THROUGH_AF sounds
good, thanks!

I think with that more generic name, the
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP reference here no longer makes
sense, so I'll drop that.

> > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeat=
ure.c
> > index 9a22df0c5120..3b9224b99a5f 100644
> > --- a/arch/arm64/kernel/cpufeature.c
> > +++ b/arch/arm64/kernel/cpufeature.c
> > @@ -2172,6 +2172,16 @@ static bool has_bbml2_noabort(const struct arm64=
_cpu_capabilities *caps, int sco
> >       return cpu_supports_bbml2_noabort();
> >  }
> >
> > +static bool hvo_compatible(const struct arm64_cpu_capabilities *caps, =
int scope)
> > +{
> > +     /*
> > +      * We need BBML2 to support Block -> Table transitions without ta=
king
> > +      * faults, and we need HW AF support to support changing the OA w=
ithout
> > +      * taking faults.
> > +      */
> > +     return cpu_supports_bbml2_noabort() && supports_hw_af(scope);
> > +}
>
> I think this is wrong. cpu_supports_bbml2_noabort() only checks the
> current CPU while hvo_compatible() will be run once on the sanitised
> register values (SCOPE_SYSTEM). I should be something like:
>
>         cpus_have_cap(ARM64_HAS_BBML2_NOABORT) && supports_hw_af(scope)

Yep, it's wrong. :( I think I had some things confused in my head.

With my newfound understanding of things, I don't think the previous
patch (6) is doing anything. So I'll drop that patch and just write:

         cpus_have_cap(ARM64_HAS_BBML2_NOABORT) && cpu_has_hw_af()

Thanks!

