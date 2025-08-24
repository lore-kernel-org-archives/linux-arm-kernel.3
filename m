Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2390CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 23:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+B9sOQcHZGWCingXfvCh9FZr+nr6lsPlBdBXw4dYQhw=; b=ROrUqAwSTK45okunlzbtZTlXoV
	ahqIyh8FUk1S1/l3NHPlrbqGZa5e5das6q89Qw7z5rs+1lgitbOebreCZo+HZJKp+mk1BrGMVJuqu
	9YrfV44Z5q2T//+MhfzOXmx2Y3M+cH8EQocbKkd6NalaGTQ4mIgZ0vh0dil+UtkoSlzHzivMK4jZk
	gbLKKSqnwP1Fac9cDTyStnoVKLD45BJE3K24dVB9Bm+OlGWyw+U/E8odBM6+SE45gq6JMjW2qySgW
	PbQzKXPeDK6KSCLj9DiO3fY9AG1Tatz+RXdUePVeMyhPGbbxzVk6XQVExLQ0osuS6oeMaV2ZthjnN
	mE+aeEsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqKPU-00000006dZu-0Ict;
	Sun, 24 Aug 2025 23:46:04 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqKMr-00000006dTC-1tj2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 23:43:22 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3c79f0a606fso773054f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Aug 2025 16:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756079000; x=1756683800; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+B9sOQcHZGWCingXfvCh9FZr+nr6lsPlBdBXw4dYQhw=;
        b=DzckNayBtkNziqIOOXsYpDbE4fAKkveCm3x+Whm7dw/H4X9p9uzG0qMgnstC7frhuf
         zHTMKZMLR9dJJhbjVSaH7n1jTU6w1Bi9JYleWCBB2u8D9HjSZ7lRxL6r3ZnfT43Vi30E
         h8YL9RX9+TBzAtzCG4a3RU0NmsFSCudqzMnu+vWJyYSbe8XqTtZqU7EcDGGVvjqzNSRW
         RVr2EaxwdOK6K6b5gGFRo0ll/a+ZtG8K2RBlf1IurKTgvoerLM0y6uxadepXpEEU1X8/
         /HagK0FXxckrkazq4XWzn+YSsjyROHNeWBYJzx9g06V4JMNhZBrJm/UhNebMkSsNAnd9
         FTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756079000; x=1756683800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+B9sOQcHZGWCingXfvCh9FZr+nr6lsPlBdBXw4dYQhw=;
        b=ljI3zgsdB/5150sDlfEiHHEoU++9niPzEUFLnlzSXuR8DDI/B6GqBuIGffVosekK+T
         evYkYKWTsRGw7Zz3GN78lAvvY8fVN/LCrqISpqrfexFk0E3zJSuae0QDD0VDuPUhjUO8
         LgkqukKQblZleAAmgqTVE8SkhkUSIFyxPUUnqus4LSo5LnThGAdMmgmMfiOtF7tNrLO1
         ibA2HAl3J88GiWAnEHLf5bmCjygsZkEnzh0oGByacCzQhivlHE9WNqScRNkTPv2/OMZu
         oKu7qDGTFrHyF7Tu40pPUTk7Mm1pPrzFrI1F8FfMhCuy+9rFTf88/MGz+P+Yj2JW17Te
         GuAw==
X-Forwarded-Encrypted: i=1; AJvYcCXmMqB5IxaM0sbOyDlyHWx32DXLooev2Zyuf0oHTCs9SL9+dRrC+VJIiAs0FmorSaTCMr10qc6Xg0ZFFQbIuPy0@lists.infradead.org
X-Gm-Message-State: AOJu0YxYiQpB7FuNseaelZCtP+sc3WcXgXznbcw80uTVsiXNXvRwOIx1
	NtHDU6A4zKN4nqbT/t2T3oCYb8zhQNegm7Z032xXa5gATBrkLV0aCmUj8FuaSe/rNFpXKTpd23N
	PJaOc0Hg3qEUdxikzVPZezD4hrkmInHw=
X-Gm-Gg: ASbGncsaJKVa1hs1BMr+Hwy4Q0nAXohR9t8KOdutNo5z9wROxpjscDuBZyPwCjclQsW
	+mBhwXN9ZhIEJ7p+K5w9aEM+VqPgOQE0ZKg4sn62XovSyybqxuG4FDeKSq3b4czxyZVp0p+BH0h
	wQDbj3rpcpjPsEM1ECHABlS26ey3Jvk1mykUYMDKOF1uEhCJZZ3kruIPI0n28yiHDOofiwwiYNk
	PBDRdwYmIxd7n305eeqOOyrdJPMSOwSvxrgoMqJP7yyAQqZVxNq6qbyigVu+9bPFwpF4a5n5S1K
	zjxYQQ==
X-Google-Smtp-Source: AGHT+IHG8+LzmBHQPlkNbiAM+nxvka89tnoNbrD8fD99XUN2AtcXD7uaHnfS5btqkSxaYHYlEHcyAzLCF/UdZPXlBSE=
X-Received: by 2002:a05:600c:1d28:b0:459:d709:e5c9 with SMTP id
 5b1f17b1804b1-45b517955a9mr98779065e9.6.1756078999495; Sun, 24 Aug 2025
 16:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250822041526.467434-1-CFSworks@gmail.com> <CAMj1kXH38gOUpDDdarCXPAY3BHBbuFzdD=Dq7Knsg-qHJoNqzQ@mail.gmail.com>
 <CAH5Ym4gTTLcyucnXjxFtNutVR1HQ0G2k_YBSNO-7G3-4YXUtag@mail.gmail.com>
 <CAMj1kXF00Y0=67apXVbOC+rpbEEvyEovFYf4r_edr6mXjrj0+A@mail.gmail.com>
 <CAH5Ym4h+2w6aayzsVu__3qu3-6ETq1HK7u18yGzOrRqZ--2H9w@mail.gmail.com> <874itx14l5.wl-maz@kernel.org>
In-Reply-To: <874itx14l5.wl-maz@kernel.org>
From: Sam Edwards <cfsworks@gmail.com>
Date: Sun, 24 Aug 2025 16:43:08 -0700
X-Gm-Features: Ac12FXzpphFzjfC62UXFEc5AApowvpQZxz4HbijNMarXXS5OpHei395iBSb46eM
Message-ID: <CAH5Ym4iqvQuO6JxO-jypTp05Ug_2vDokCDoBgGB+cOzgmTQpkQ@mail.gmail.com>
Subject: Re: [PATCH] arm64/boot: Zero-initialize idmap PGDs before use
To: Marc Zyngier <maz@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Baruch Siach <baruch@tkos.co.il>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_164321_495292_566DD7E7 
X-CRM114-Status: GOOD (  27.17  )
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

Hi, Marc! It's been a while; hope you're well.

On Sun, Aug 24, 2025 at 1:55=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote=
:
>
> Hi Sam,
>
> On Sun, 24 Aug 2025 04:05:05 +0100,
> Sam Edwards <cfsworks@gmail.com> wrote:
> >
> > On Sat, Aug 23, 2025 at 5:29=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org=
> wrote:
> > >
>
> [...]
>
> > > Under which conditions would PGD_SIZE assume a value greater than PAG=
E_SIZE?
> >
> > I might be doing my math wrong, but wouldn't 52-bit VA with 4K
> > granules and 5 levels result in this?
>
> No. 52bit VA at 4kB granule results in levels 0-3 each resolving 9
> bits, and level -1 resolving 4 bits. That's a total of 40 bits, plus
> the 12 bits coming directly from the VA making for the expected 52.

Thank you, that makes it clear: I made an off-by-one mistake in my
counting of the levels.

> > Each PTE represents 4K of virtual memory, so covers VA bits [11:0]
> > (this is level 3)
>
> That's where you got it wrong. The architecture is pretty clear that
> each level resolves PAGE_SHIFT-3 bits, hence the computation
> above. The bottom PAGE_SHIFT bits are directly extracted from the VA,
> without any translation.

Bear with me a moment while I unpack which part of that I got wrong:
A PTE is the terminal entry of the MMU walk, so I believe I'm correct
(in this example, and assuming no hugepages) that each PTE represents
4K of virtual memory: that means the final step of computing a PA
takes a (valid) PTE and the low 12 bits of the VA, then just adds
those bits to the physical frame address.
It sounds like what you're saying is "That isn't a *level* though:
that's just concatenation. A 'level' always takes a bitslice of the VA
and uses it as an index into a table of word-sized entries. PTEs don't
point to a further table: they have all of the final information
encoded directly."
That makes a lot more sense to me, but contradicts how I read this
comment from pgtable-hwdef.h:
 * Level 3 descriptor (PTE).
I took this as, "a PTE describes how to perform level 3 of the
translation." But because in fact there are no "levels" after a PTE,
it must actually be saying "Level 3 of the translation is a lookup
into an array of PTEs."? The problem with that latter reading is that
this comment...
 * Level -1 descriptor (PGD).
...when read the same way, is saying "Level -1 of the translation is a
lookup into an array of PGDs." An "array of PGDs" is nonsense, so I
reverted back to my earlier readings: "PGD describes how to do level
-1." and "PTE describes how to do level 3."

This smells like a classic "fencepost problem": The "PXX" Linuxisms
refer to the *nodes* along the MMU walk, while the "levels" in ARM
parlance are the actual steps of the walk taken by hardware -- edges,
not nodes, getting us from fencepost to fencepost. A fence with five
segments needs six posts, but we only have five currently.

So: where do the terms P4D, PUD, and PMD fit in here? And which one's
our missing fencepost?
PGD ----> ??? ----> ??? ----> ??? ----> ??? ----> PTE (|| low VA bits
=3D final PA)

> > > Note that at stage 1, arm64 does not support page table concatenation=
,
> > > and so the root page table is never larger than a page.
> >
> > Doesn't PGD_SIZE refer to the size used for userspace PGDs after the
> > boot progresses beyond stage 1? (What do you mean by "never" here?
> > "Under no circumstances is it larger than a page at stage 1"? Or
> > "during the entire lifecycle of the system, there is no time at which
> > it's larger than a page"?)
>
> Never, ever, is a S1 table bigger than a page. This concept doesn't
> exist in the architecture. Only S2 tables can use concatenation at the
> top-most level, for up to 16 pages (in order to skip a level when
> possible).
>
> The top-level can be smaller than a page, with some alignment
> constraints, but that's about the only degree of freedom you have for
> S1 page tables.

Okay, that clicked for me: I was reading "stage" in the context of the
boot process. These explanations make a lot more sense when reading
"stage" in the context of the MMU.

So PGD_SIZE <=3D PAGE_SIZE, the PAGE_SIZE spacing in vmlinux.lds.S is
for alignment, and I should be looking at cases where PGDs are assumed
to be PAGE_SIZE to make those consistent instead. Thanks!

Cheers,
Sam

>
> Thanks,
>
>         M.
>
> --
> Jazz isn't dead. It just smells funny.

