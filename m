Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8655C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 00:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOyFPtHP7h9UHgRrm67PAH0DWzbHzUFre5ZWiI2n6oo=; b=0rrDH6Rk1L+0dIhIoJnDMBp0OS
	Vt6rZVWzKyyKKg+78ICJJLNFdrbDMTAbiAY11y740rparfBvWi2uDLOFuan2Ea+lIjpC5YOT0CTzr
	ZvIJQfWTc4TuHICTi1DUKHkY1sE1XzTSdeXI9OKGKKiUJ5GVjbsAeuV+C1CqmyErOR9ergDZYd5UF
	i/pJhViGKTqc93SOs6n633a6knunA41EJhPvKcyc8Dp4yVij0qV8Vwb5RK898jVckw7rdJ5OOnMEl
	qD0/tjOCZvTAnmnuw4hYrgiZtQF1Jq5w/iH4Q1xksv5FW1vJ0JIahj7tTETJvb1fHEsN6cbn7NO+e
	0wQhgJFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyewD-0000000HXUS-464Z;
	Tue, 25 Aug 2026 00:22:49 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyevy-0000000HXSt-37jp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 00:22:48 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c16794450aeso597999166b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 17:22:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787617353; cv=none;
        d=google.com; s=arc-20260327;
        b=OhjGS4QhLW71k41Mucr+0iXHV/Jn87Jhlo2jWlsPT7Ss5ih5c6HIOT0JZb5NEY1Hs1
         GNcL3bzRv1gOArWwMv2JbLFjoBLcCG1WkxR5TiKzYtRzqoyVierXLAVTMTO7DaTx7qHU
         m9GwrAtnT7ssprMeHLhp4NtBJ18KJXkDFvrxttufYfSw+epQ1CpUmTrabaGn8rt8Go6j
         7WE5fJIiSAwR+kqNRiQIQnQOuykuV98tTGyq+xCfkxbiam/W88e0lA4c+J59Dnr6AxIj
         CGP7KkqLzBBWEEXNChuK7HIaKg6dcnYp8rKgSH6Qazil2j+MgRKdG9SDya99DfEQ5yp/
         J8yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kOyFPtHP7h9UHgRrm67PAH0DWzbHzUFre5ZWiI2n6oo=;
        fh=xCL9W4srsoV0+tUG3b31fuy/t8f04mpTKMDfn5v8NAk=;
        b=H4LANmCaPkzuCLGvpotlymyMLfFhSUyHTjST1Ece3MQDqK34UJJ0W7ZtYSTq6jz81a
         mvFp+Ys2DHY4PqgDoaYvFM0QHWbSDwgt+4V8vzV+o2OGtnAOZCBMG7HU19lcJ8ZZErdC
         6GGOBbUAFxVagx8+BQCeOKsDf15v55xboIii+dz8Yier8FTgvWJGULv9q8mlU2Q6fvio
         /0PbiqNxNT2+080ZIMwgRzADifQovKOgtRZoiMRMUXJnyAvd+A4X7Fu7uQstD1nMWTyl
         mzIMnn/Ww9NI0gJ/4yG+h7EtP5o0UPwdzaj770p/3b2s0xSCh+CnKdOP9Uq0D7Y5ArV1
         NOuw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787617353; x=1788222153; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kOyFPtHP7h9UHgRrm67PAH0DWzbHzUFre5ZWiI2n6oo=;
        b=tYAobOr+FRpW9jSHuqehpifpcYF5LYtkIci0qkcPdNcoszXDXcNdRn8rekEExkYtoO
         03Fn4oTvdBHu3c08UepqS+de8SKfU1X0wGjGIPDybsm1JLG7t1JDXBTIA7PLt63BG6/M
         tSvCF2Cf4dmIBma2C5wQZM01OOM6aXlJEmOvm0D6YNpAKaJzTIu5lQTmMJ93gxT1BKzf
         yax3vBrfo+2mdOLxWSSgCyXmBhswjhYtnZK1vZibc6/+xxefhsxWi3wCfGWqGpDh7wpO
         5SPH1X3rllG2HXc3Akv8kpLhk7DgxGsw0ytXAdxgc5qgeWoz6qbOwilRsq+qXaMaZJqG
         q4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787617353; x=1788222153;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kOyFPtHP7h9UHgRrm67PAH0DWzbHzUFre5ZWiI2n6oo=;
        b=KD80drCFHH3B4Q6r6Jo181r1/jBWTL0VTEVBspOgqZvZmvB3mb4dYr7ebKtA4C/STq
         yk/gLfaLNa5rTUUMlkUbNQeJbdTysRDbi+LCUn8DjxvJsDyAdVr02F0NZFOAnXiE5YaE
         t+JMsA+iIFc0+9Sd9y5n31t2ExAXjVyiMsGp6A/Hf/yP3Uy8NUKrXkvw1fDDuGQQm1cN
         Z0zHUH+186SpWtHMop+gZzSH6vcBJknNAZUmgcq02EnM/1in3t0BZ2ku277XKgLBXmHK
         vImplWoUvxeC/459dsfZWmvmyKOIff+C3SpY9rDPcUE1OXRXJ7/E/irSSef29cldqhxr
         jgow==
X-Forwarded-Encrypted: i=1; AHgh+RokSxk8K8uzjif+d6Z1gKitwUzoWL+E6+aC/ieUQkFrSVMzdg5vnfTSF0O352NzB/3sx1nVqsoR189tnx5SaDgM@lists.infradead.org
X-Gm-Message-State: AFuF++kFNK2X3kJ9kmzpEpr20emCvME/jjM8Auh9MjloWAeII/WrbbRD
	9T4MvVSiMINaYpQqMQdEfbC4iOCoFM5YOpenugme1i7sFoUh6jHpQo932xKPs+8TsywegI0fXR0
	S/EPNZ4uvx3HjHJmNaBx1gq+Y+cX6EKBkr/wfGMYJ
X-Gm-Gg: AR+sD13B5/Jptc6HhjLjwvtxNsguSIa3Gvy8mLgbYGYk6K3TMFjk6RC+1mr/F3/c04G
	QSeyN+RzbewwTFiAL2v4FzMln7jXqAPvJJzXVfuIvVLm1w0ouj3C17QCOBR00aRskxOA/3rXIKR
	h5f+5KI+yTelogXZ9fs+16B4P43yR/wY4czvtwFH2rVrLC7TR+8xtJ/8opvxtUpDNgVzJCvMy4F
	51WS0FGhAU8ylZ6HRLb+mwL5NALgx6QW7FkToD0t6R0AMYe9eS3YtNOZ8nn1N6Zhniu87hT453B
	7mSqlOc/2g6cAolGK+q65NOHoBAY+5KZkI4IxS4y1vVTWr+p8azG3WImMpbyqtWx5vvUp6pjUkB
	Csp7YmyFYJP0g9ZhcstcWuIQjfX2wRzdYHRNiO1dJJgQnWo3dmrp7CwHvGZfE/CLzhmwxfe6JlK
	xXgZOWuTIPLcEozodKfQ==
X-Received: by 2002:a17:907:f509:b0:c19:49ee:19b9 with SMTP id
 a640c23a62f3a-c246a654f4emr3673287166b.15.1787617352275; Mon, 24 Aug 2026
 17:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com>
 <20260708031129.3503195-13-jthoughton@google.com> <aoSJcAFMNJ1nPl2H@arm.com>
In-Reply-To: <aoSJcAFMNJ1nPl2H@arm.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 24 Aug 2026 17:21:54 -0700
X-Gm-Features: AcwNN1X7B0NHnRVh6P3ybt_oiJ38AaVOx7MEwM5ijGiH_DdKQLX63EhW2oZ28oc
Message-ID: <CADrL8HXZy3HgQeHA6b8TzJX7oWc9goe30sPfP1F5OMUtWLbyBA@mail.gmail.com>
Subject: Re: [PATCH 12/18] arm64: Implement try_populate_vmemmap_pmd using AF trick
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
X-CRM114-CacheID: sfid-20260824_172240_912629_91B41C11 
X-CRM114-Status: GOOD (  26.92  )
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

On Tue, Aug 18, 2026 at 9:34=E2=80=AFAM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:
>
> On Wed, Jul 08, 2026 at 03:11:22AM +0000, James Houghton wrote:
> > This routine is to be used for updating in-use, leaf-level PMDs in the
> > vmemmap without introducing a window where vmemmap accesses might fault=
.
> >
> > Implementing this on arm64 requires some care: use the same access flag
> > trick that is used for vmemmap PTE updates. HAFT is not needed and the
> > TLB flushing routine remains identical, as we are not overwriting a
> > non-leaf PMD.
> >
> > For systems that support BBML2_NOABORT, there is no need to use the AF
> > trick.
>
> This part needs even more text in the Arm ARM. With dropping of the
> BBML2_NOABORT requirement in patch 13, we are left with the D8.17.2
> rules in the Arm ARM (M.c) requiring BBM. I'm not sure we can infer much
> from the AF=3D0 caching rules as here we talk about the walk caches. For
> example, a walk cache memorises the VA to block descriptor translation
> and that's irrespective of the leaf entry AF bit. If AF=3D0 and you skip
> the TLBI, nothing flushes the walk cache which may confuse the CPU when
> it suddenly sees a table entry where it expected a block one.

The CPU must still respect block descriptors that become invalid, so
it wouldn't be able to just assume "this is a valid Block descriptor",
right? But I really don't know how implementations actually work here,
so it could be possible that the walk cache could get confused during
Block -> Table transitions without a BBM sequence.

I agree that this should be clarified. I'll try to prepare an HVO-less
description of the required behavior and work with Will to properly
ask about it.

> If it's not critical to the series, I suggest we leave this patch and
> the next one out for now.

I originally included it because I didn't have any machines with
BBML3, but I think I have a Neoverse N3 system which supports BBML3.
:)

I think I'll still include these patches anyway (it's at least useful
to continue to drive the discussion of whether or not the Block ->
Table transition is legal); I'll structure the series such that they
can be easily left off. And I'll note in the cover letter that they
probably ought to be merged separately after more scrutiny.

