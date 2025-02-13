Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13CCC02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 01:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FnnVExe7d6QVUJNp8Nm3NF0K0bg0bBBcU3T/4AzgGYI=; b=u9VX5rh9OScNA1VnAS3S4tLRBe
	LxPAcwfzPrCdJlKLUtnc+OgM0blCGG56pVQ9/r7f9T34K7hlLL8NYAXOQZxrqH+7qbsQGFCumtOfg
	6De9lmxl9k0aEm1hv/Dxgw8yjhOxLrklbkXtGIpbwFObvU64AxSvNlRS/Tyi4equZ0yfqzftZGMVY
	MGmH8S+MeVs/lO7KGPyf/zeQWzuQih1kFedhdzsnJuAH5zopbdSTI0jb1vBj4YxvhHyF0xxvMJcp9
	U7g3bwgPilbz6DtLp5sVYngYJIFEovnyWaudP3PJpG6ZwB9vTrakAG9OwVMogKNOa5mssdcVPzOir
	6C11ZcgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiO34-00000009Od9-2MJE;
	Thu, 13 Feb 2025 01:29:50 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiO1d-00000009OKy-1BBz;
	Thu, 13 Feb 2025 01:28:22 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38f1e8efef5so155657f8f.1;
        Wed, 12 Feb 2025 17:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739410099; x=1740014899; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnnVExe7d6QVUJNp8Nm3NF0K0bg0bBBcU3T/4AzgGYI=;
        b=PkQD1UmJ+gm9wsyvi1ov7gavDQ37RmUbcuZ5qf4dGvY5yUwAXHjiIKdi56dOE0FGIm
         riR+KmW0IByyP5qkPR49IwiMXJJ5KIY17OlfT70CvJfYH2e+LradT+TNlBAnfG7h3lAK
         uWQz9zUcF8GoRcOr0FcfguvHL28AE9Pf7KJyxnqEoAra1fCrY/zk+jf8fuSwuK+BSaDq
         epALQq8ByQ+2omFdxR2D/PKsWNr+NbB/lw1+ldVDOKQHsjpU194xt9o9/6OBmY6tVc0Y
         /rf8+DUBNMHKz1sqTzP2OHvgRa35uHOnAKdZ9/CAEOsswby+Lfa++Nel+JfOZLXQFaTz
         Bx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739410099; x=1740014899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FnnVExe7d6QVUJNp8Nm3NF0K0bg0bBBcU3T/4AzgGYI=;
        b=YKe2XrbaRGb5RluY/IY4mIgl9LXv6JyF6HVfx4POVr6r21T19VlskWAQtJggDwx0sV
         NbjaME5lF+ueyF/pOHl2fak1hLHBmrCFgXbaLGzvS5yQBbKrQD0pCnQ4yb1wdI9jVLBm
         MgSjv2TCGd4o+J9ByhNRLmNAxf7cOYvwau0D90aq/ONZgxaSQNTqIJsC9XIDO8kgnjjr
         rCWdJIbMdvNqZn2OXJBdeodPz45xXT+M0hfRALuk64fxGV2hbAru24l7L9vX204a7wL9
         Lh4RudYpCXq5bR4NWUzLu2R7QPGkdZMEiO4jtGohZtras73ET90c9Sz7kZfAY9Jb4FYt
         ehOg==
X-Forwarded-Encrypted: i=1; AJvYcCVTaesbG89kDCSBOpaPcUjZpdF871iIZRbPTSirPHIThGaNgDxXpWEbwQb+xPWSI6joPFXbkCpOflQtub7ObwvX@lists.infradead.org, AJvYcCXxMGG7jvqQtE18/rKdh/TuibsGjiRPaJi+hg9y9miB8IO/b03T+bRp4cMk4T7gJhPGNpqvmq1G2W3Rn7o=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8Bx+cExPATwvBPZveUsOkMYkpFnSBab+0HBvDqwzlWZx1VE79
	mpD5wmjZqkMeDuB15upOz0Im9TW+1EbgceB1/AGbtx/poQSBvBfpL9pMRwx98gPFczzMMxGP/0N
	WGSUY7GSm+7ekqGj7xyzt0L2WkMQ=
X-Gm-Gg: ASbGncsCvfP+9awH+y7oCzjFYcXn70udBe0K/iJX3VBIh8kTWvu+vd+xEJCmfp84Q2Y
	T27HkFecSjyya5EauEjg9FjTP79khlgH3teIezM/gxFDl+NIJWLUmlbYzH0/3eSiUH26vnmTxJi
	E=
X-Google-Smtp-Source: AGHT+IEhltifMX701fYkEDmSU69qM9C3gXECNDsqw8PpPT3Yw5x0mc+ricaPHhG6ElqQmHswedH/T+PZOKbLltISlh4=
X-Received: by 2002:a05:6000:144f:b0:38f:227e:6ff2 with SMTP id
 ffacd0b85a97d-38f244df054mr1302880f8f.14.1739410099435; Wed, 12 Feb 2025
 17:28:19 -0800 (PST)
MIME-Version: 1.0
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
 <20241022015913.3524425-2-samuel.holland@sifive.com> <CA+fCnZeBEe3VWm=VfYvG-f4eh2jAFP-p4Xn4SLEeFCGTudVuEw@mail.gmail.com>
 <e7t5yzfw3dq5stp5xjy5yclcx6ikne4vwz7d6w2ukfw2b7gr6t@oomoynf3b2jl>
 <zjuvfdbl7q76ahdxk3lrgaznk7vjj43f5ftzfgrnca6dqtcd5x@5qj24womzgyq>
 <CA+fCnZfySpeRy0FCFidLdUUeqp97eBdjAqQyYPpz1WxYwcsW9A@mail.gmail.com>
 <aqhm7lc57srsfuff3bceb3dcmsdyxksb7t6bgwbqi54ppevpoh@apolj3nteaz6> <CA+fCnZdjTkreTcoo+J8wMhwDuAFM4g33U5BFy0OPtE0UCvyJbQ@mail.gmail.com>
In-Reply-To: <CA+fCnZdjTkreTcoo+J8wMhwDuAFM4g33U5BFy0OPtE0UCvyJbQ@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 13 Feb 2025 02:28:08 +0100
X-Gm-Features: AWEUYZn2XkAKpo5fHBIg4DaefcDCWc7cwclFMrZ0d3cOTpLW86BXbO6cjB81ilc
Message-ID: <CA+fCnZcoVdfXVN8VBFLx835cV0eGAT6Ewror2whLW761JnHjNQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, 
	Evgenii Stepanov <eugenis@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_172821_318549_B9BF82F8 
X-CRM114-Status: GOOD (  25.96  )
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

On Thu, Feb 13, 2025 at 2:21=E2=80=AFAM Andrey Konovalov <andreyknvl@gmail.=
com> wrote:
>
> On Tue, Feb 11, 2025 at 7:07=E2=80=AFPM Maciej Wieczor-Retman
> <maciej.wieczor-retman@intel.com> wrote:
> >
> > I did some experiments with multiple addresses passed through
> > kasan_mem_to_shadow(). And it seems like we can get almost any address =
out when
> > we consider any random bogus pointers.
> >
> > I used the KASAN_SHADOW_OFFSET from your example above. Userspace addre=
sses seem
> > to map to the range [KASAN_SHADOW_OFFSET - 0xffff8fffffffffff]. Then go=
ing
> > through non-canonical addresses until 0x0007ffffffffffff we reach the e=
nd of
> > kernel LA and we loop around. Then the addresses seem to go from 0 unti=
l we
> > again start reaching the kernel space and then it maps into the proper =
shadow
> > memory.
> >
> > It gave me the same results when using the previous version of
> > kasan_mem_to_shadow() so I'm wondering whether I'm doing this experimen=
t
> > incorrectly or if there aren't any addresses we can rule out here?
>
> By the definition of the shadow mapping, if we apply that mapping to
> the whole 64-bit address space, the result will only contain 1/8th
> (1/16th for SW/HW_TAGS) of that space.
>
> For example, with the current upstream value of KASAN_SHADOW_OFFSET on
> x86 and arm64, the value of the top 3 bits (4 for SW/HW_TAGS) of any
> shadow address are always the same: KASAN_SHADOW_OFFSET's value is
> such that the shadow address calculation never overflows. Addresses
> that have a different value for those top 3 bits are the once we can
> rule out.

Eh, scratch that, the 3rd bit from the top changes, as
KASAN_SHADOW_OFFSET is not a that-well-aligned value, the overall size
of the mapping holds.

> The KASAN_SHADOW_OFFSET value from my example does rely on the
> overflow (arguably, this makes things more confusing [1]). But still,
> the possible values of shadow addresses should only cover 1/16th of
> the address space.
>
> So whether the address belongs to that 1/8th (1/16th) of the address
> space is what we want to check in kasan_non_canonical_hook().
>
> The current upstream version of kasan_non_canonical_hook() actually
> does a simplified check by only checking for the lower bound (e.g. for
> x86, there's also an upper bound: KASAN_SHADOW_OFFSET +
> (0xffffffffffffffff >> 3) =3D=3D 0xfffffbffffffffff), so we could improve
> it.
>
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D218043

