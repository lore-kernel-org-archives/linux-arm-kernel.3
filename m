Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C8CCD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 18:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/iWiuvGopjfPOqN1ltMMiCqrYpx4WW05J/mF6yDghGQ=; b=tIgtna5myxnN+c26+0k8YSvDsB
	PaXn3teOgn/jvP6qC+gGKfBGSU2/aQXmQOU63K14Alat7AV3yZWjgp1JCKBtwuFlUlgbKjkB01Ra7
	m8MAvcNW7QG80jOHwBqU+NzNulGT9fBNuHlyb6dwMqO0kXkU33aN3eG7Nb+K/klKsffnHV+85m9yU
	FiJDzE72Wi5IRXAZh17Qei4+U67P1rxugj9ZUXwZjfKwCASRfKmZOZg0cc8jFpXqenvCMRuvCniLd
	7PX3re0LW5a0Xek1Q/aJ2Ht7/2a9y4+ofKztWChqwdIUPtTYNBAZTr77994tdUhKp93AiS+YExyPu
	GsLP5kkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT26Q-0000000889E-1ain;
	Fri, 29 May 2026 18:38:38 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT26O-0000000888b-1Iee
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 18:38:37 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso85809935e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 11:38:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780079914; cv=none;
        d=google.com; s=arc-20240605;
        b=CBJRlCOOluVcDM9Kau7AjdLTziEOyk8A1VYk62ilGMbHBwE3GYYUayBvJO3qC+CtD6
         mI9Xa6OBCXqAfr+NSYd2FPKT/o3s7jNPxf+CwtaqaBbq+SjQ9GAFUisRwjHGP2NL1h5f
         h5LzcqV3wU9h5hQm9kgjJ51+UjcVTtqH81HeutRbBoSdpZ53eg5czaK856dGD0i+8LNs
         3mB1jQTEK/Oju3tn14w+T6RFk1tX0ZrXjVT0dueweplXh/g9yJ0peHSr3yKnj49GEX9w
         i+owq0DiJjWBiAZxF71sfp9EceZwxtFOdC9tGf3VEItkmKCcScABcsgHrVDTyFbL+G1Q
         HjOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/iWiuvGopjfPOqN1ltMMiCqrYpx4WW05J/mF6yDghGQ=;
        fh=uuS5EVFfAF/t1+5F250U+NImNKT621I/BbjMVN1i81M=;
        b=RSkQdUpa3FABCkE4UGlWYok0VVvFAqJs4K4x4kpYPwx3kTKA9AJJFfcf3JR8oo5bPF
         PinctahCh+aQTI6QzmQEpEI0bOfKsxJq2EQxcnZfN/GODzB67O0ctHzXoKsRYqjXn8o9
         RigDrj2ZgdR2vfdM6VxzJFDl36ivZ05KOSyww4zkH3LW3zwawP0VIrizkGOmKYnOtN+3
         BOhGnq7mZ0MeUxZRiz3yJH0MLUfS7yGoSRZbe45uyNRN3vFWJVsnKJER0jBx60sOVhSs
         /6AvGcgBmLay0ez806V0mhCE7LdEAPG0ZOVlKwqCOUVlCm6Autrpjuh47fzS4dMmH0M2
         7XcA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780079914; x=1780684714; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/iWiuvGopjfPOqN1ltMMiCqrYpx4WW05J/mF6yDghGQ=;
        b=MClH3HY355itJXL21Nhlzy3qMKhFnduq88z79E6sCXqn7FzIgMZdnSlaCXamphaeXa
         UGx2GaSe3ccOA//dFP0KMS9EOclNAeHgNUx4FB0S0RZXyNF/RTWF+qt3K5tLgt6lNmZQ
         kh/t3JomHDQyTJjQZqAQ+8iOYHxVUwWKTD0WDY6KRTsN5j45JG8iyIPE6rKnqX+FKHrA
         /Ind/9iTnRASqcYGU2JQI+abEEn8zvWWbzVq09CuXB7A6UROI/MjAXRn0EChhqR2Bg/d
         3R/RDgGKwdk8enD6sEv9r9ZbG/8mLlKQoqEK5wU2BhHxeI7NOcwLZKKp6yjTWo8IOj1a
         WUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780079914; x=1780684714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/iWiuvGopjfPOqN1ltMMiCqrYpx4WW05J/mF6yDghGQ=;
        b=kBzqh79p/hbWHI66YXNvXjvVAOKdvmjqRNX5WpiuD9OYEaiZzE1k90PasfSqzMMj6T
         zByHDsujYOYgDHfxgHuODnF/djKnYgd7Shal4MBpBzdy3/buGmagJ0gvAJc9ERfp9a4v
         SmTLElRN24eZ1pC+zez4FrjO7salJEWO/syEB0H0b3Qha6vR31eH5vbeu7JmDae7y44S
         ViQhy+vkhGxC7hzL7WLRyH+fXUN4Oy6YZv9IcV40+Ek037EvrULY/3Lb2lRh+/8RFCxp
         irZYuEFLHXBNif6lUhlsUiwkOtYFfzf1+HvyJ9RwgEwlMoCgGhmsAIj+fB8JvyAVgY9l
         5BgQ==
X-Forwarded-Encrypted: i=1; AFNElJ/sVblHxKIl3pKoW+5Ys2axr7OL7PIvC6RLiW9C4RvKlL1Bwf92FAC+QhXrIP+7egDkRMoCud/BbMExdKKU5D1M@lists.infradead.org
X-Gm-Message-State: AOJu0YyY6DaCgu5gFwDQBLgV5datl2e7HND9kxeiL4zTxkFWfyr6G4ri
	rT07CsPg6qIVHVeFxNgVgqB0MBDPWVOyOKtoKYX7ttKMJL5zzslJKMKRMuV9uD9CZvXYYNcFk6H
	6Bdg/zSCUSLGANCykCfccdPXid8rp2lwuR4tv
X-Gm-Gg: Acq92OFpPgym/fgn57V9za20N8p0t1/5laE3O0bu79uqiQ1XPjYBXyXoBLXixgkMpYf
	cWdHLPX1mM9nrXWQQvgou3vIcD38TUZdW8AsCtSTfPMBe2zAuOLF8zEAJjhHvtVvJq0oRSv6agG
	LLXs5HFNQoC93ddRRad0bAju+qU4Ww4IibEXRUlXPIZGmSYfqWHLIs1byUnI4fYG9GL+1B3xOPc
	w/wd/8YnfGshclrcU1p5ICMLegYhaEGZb1bhk5IPaWQQNz0uclToxBHTvUzMZ6R2sqwS/8uXvNw
	k0HeenSIlxmEzsxyXwImXxnKG1JSpxajYCPP8TM9m6NtRUsLU/DskGAwDNgKMDg6IK/mbO8RvlA
	gXBQoFq6TIjZXcKhFUweIPkgCibwI1y5cZgOud0OOAwNq83o=
X-Received: by 2002:a05:600c:34c8:b0:488:ac01:72de with SMTP id
 5b1f17b1804b1-490a2b6e3d2mr7261425e9.5.1780079914175; Fri, 29 May 2026
 11:38:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260522172219.1423324-1-tj@kernel.org> <20260522172219.1423324-3-tj@kernel.org>
 <7fd673df-22f3-4d70-a779-ea0b878188b3@kernel.org> <DIUMP21RASZI.2VNQV45RIL209@gmail.com>
 <3901fe0537edee9d7acdfd91695ead28@kernel.org>
In-Reply-To: <3901fe0537edee9d7acdfd91695ead28@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 29 May 2026 11:38:21 -0700
X-Gm-Features: AVHnY4KtV1pUn-d6UzBaLOg5AUfIedwDfvDWPug9r5TxPVQH38dOVxXqqoga_T4
Message-ID: <CAADnVQJ+CqAszS2sSVu7gSfA_g4oaTR+SWmLNMX3_8c=OdR7NQ@mail.gmail.com>
Subject: Re: [PATCH 2/8] bpf: Recover arena kernel faults with scratch page
To: Tejun Heo <tj@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, David Vernet <void@manifault.com>, 
	Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, sched-ext@lists.linux.dev, 
	bpf <bpf@vger.kernel.org>, X86 ML <x86@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-mm <linux-mm@kvack.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_113836_362281_FECCDAE5 
X-CRM114-Status: GOOD (  16.32  )
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

On Fri, May 29, 2026 at 11:12=E2=80=AFAM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> > It should do set_pte_at() unconditionally.
>
> I think two concerns are tangled here.
>
> 1. The racing write. set_pte_at() and the scratch installer's
> ptep_try_set() hit the same PTE with no common lock. On x86-64 and arm64
> set_pte_at() is a single atomic store, so it can't tear against the
> cmpxchg, but a plain store racing a cmpxchg isn't atomic in general.
> David, is that the worry - an arch where set_pte_at() is split and could
> tear - or something else?
>
> 2. The SEGV. It's a BPF program failure propagating out as a SEGV. Maybe
> not ideal, but as long as we surface the BPF error properly, it doesn't
> necessarily seem broken to me.

returning EBUSY because apply_range_set_cb() hit scratch page
is SEGV out of arena_vm_fault() and arguably ok-ish,
but bpf_arena_alloc_pages() returning NULL because scratch page
was in the range just sucks.
Earlier bpf prog passed the wrong arena addr to kfunc and triggered
that scratch page. It broke the contract and kept the pieces,
so ok-ish too, but overwriting scratch page with proper page
during bpf_arena_alloc_pages() is imo much better behavior.
That scratch page will cause all future bpf_arena_alloc_pages() fail as wel=
l.
Hence I prefer that check removed.

