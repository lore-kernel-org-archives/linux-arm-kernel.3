Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA92CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 03:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4jyWtrQc8g2pI2pic4k6+wyMVGvRVzOyfNe1d7hw3Kg=; b=D3EcMdxvkQLiv0nz3IBy4WV8Cs
	5Gkq+ZWfipPLSJQ4NCgJl1u5NKHz7eIQHa9dvDkOHTZIVxEdCn24qgazWceio7Cz3jv67RL2jJg3f
	4cMYli30REdCDRGciaKz2IrPh2W1aqJ6GMH4LjYZt2ZyV1V++/xftWAwi1/BA6tB6lwRgUk1HI4c8
	Dc480NdeC6Yin4dRr2Nw9HxjoIcfNldq1R2bGxCSskjosSNCgGgHKPLZupjP+W3AMEQ7gK1dACIYU
	h0g8BlngsQdLFoLejcULVEHXOSwCaClm5mXIGIcOgEl9XJpa/SleNIbrXQa1vKp82fSYy2/n5mldl
	8XQ1xbtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq15O-00000005f8i-1CSw;
	Sun, 24 Aug 2025 03:08:02 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq12k-00000005ezH-16TU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 03:05:19 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45a1b065d58so27700545e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Aug 2025 20:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756004717; x=1756609517; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jyWtrQc8g2pI2pic4k6+wyMVGvRVzOyfNe1d7hw3Kg=;
        b=eWVN1A6IMyBMYOO+l9+9q+nTbYLNH/sQGxQRLnXKm41RlTmddfAe/AUWnXZJJoUZ4+
         q7K5QeHdpOs/THtSkkGFpzVoBACQwMrXqaAwBy6Es6s8RMxgApNdLlsT9m00u+FXBKbE
         Vsu8cuc4e9z6ldrLYEhbObAzcnXo+WlssUNFusAQFV/Osxoq+Rpmf78epRpiPgEn2617
         +Cr96z2SpBWWHNo8eL2ESXHVZuKDEe2KpZXe3IZWQjD9wm8KvYx0VUNoarj6ZOh8/ElE
         SlHRiUIW8QRA41iynk/xsFoNWfCzXUzoPpNIduWtbK3hACmBSQd3uGm+CVOrlhvLPoCw
         PZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756004717; x=1756609517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jyWtrQc8g2pI2pic4k6+wyMVGvRVzOyfNe1d7hw3Kg=;
        b=Su4SBsa3ZJekgl0kg5bNv5glVYpMSPwsgvPf5aGakMON+9JSsFYENjMpk6+kn2hgKb
         E30hIa/rfh4/qY8Ce/IzdGNQBIJUFUcwxrInXwmSd0ECmDsTjDD1ZmxJTL/5SwjaiECn
         aNGOFpVosjHknOMcgIhA4VqoJ4bTajXqYmg8wMb20KqKA6E6Ttmgoe2qikZzCWTksxi9
         6IB6YzQtZ1ZDxPLmZkRA2e0ZQrpi7BKKeTIFx6J9T9UykBaTLYoMloTs9TfRtwRKD4gA
         42TsE8cxIJ729q095oTZi5ZhpaxTE7HPAXqrRqsNjZKGg/x/q3XV4/q0Ss8qOh4o2IyJ
         Mitw==
X-Forwarded-Encrypted: i=1; AJvYcCUStLmItYJLYLYzZlFjhYW7nr/xOCyIADRyZdHIHwsCRycl5nxImY3b0VoxFke9rLy8JmuYNeik0uug91mcIEgA@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw8PyCgQDX1UteRHBBJG2I580bzZdHL5Thoz/hN1QJuL180r5q
	Glasz141MPBhv4rdpOWw+/CSj5JHDRFnlxMr0uB3WHzP2lk+2M8dCYC2Tx66uRK3JKXOe9BYfTW
	pHeMQhTO9///6z7/9/RVml7zN6yCyNrvp5l5/tQyc0Q==
X-Gm-Gg: ASbGncsOxB34WYarLJbmEsIybXrWBws1p9IgFbdTgQH3G1IY+U2GGfPj91nYG7aXb6q
	SgPLw/DxGZo7eRXiI4byXrv4QGXxKkEvE40D9IrZXPZ800w95IvaNxRNvXq9I0exi7l3k+a4g8D
	WcNGTANmKliuzz3RSY2oOsKEp56Zy9W9v/Yrjl6XqvVi4KgUfQPdqda2BtGVjnTBLg/SNpnHXVK
	xDRWoYoHrqZHZ/P3Gz9uU9ndAi8mzgvoZxm35K78318+Szo2C+t5pVjScTMdTdSj8PhqvbbNQHe
	ulshp50=
X-Google-Smtp-Source: AGHT+IE/tovVvnSvhovKx4wpdK0zjfz7bDptLp7GrOq9JmFQOIKGH33Ed0788RfMSUGXgzGH/fAnHqRaO9pTqakyng8=
X-Received: by 2002:a05:6000:18aa:b0:3c7:89d1:1d85 with SMTP id
 ffacd0b85a97d-3c789d12c99mr2184560f8f.18.1756004716482; Sat, 23 Aug 2025
 20:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250822041526.467434-1-CFSworks@gmail.com> <CAMj1kXH38gOUpDDdarCXPAY3BHBbuFzdD=Dq7Knsg-qHJoNqzQ@mail.gmail.com>
 <CAH5Ym4gTTLcyucnXjxFtNutVR1HQ0G2k_YBSNO-7G3-4YXUtag@mail.gmail.com> <CAMj1kXF00Y0=67apXVbOC+rpbEEvyEovFYf4r_edr6mXjrj0+A@mail.gmail.com>
In-Reply-To: <CAMj1kXF00Y0=67apXVbOC+rpbEEvyEovFYf4r_edr6mXjrj0+A@mail.gmail.com>
From: Sam Edwards <cfsworks@gmail.com>
Date: Sat, 23 Aug 2025 20:05:05 -0700
X-Gm-Features: Ac12FXyI67lJWWDgtcYQ1v8MsKjdO7Ht761tYvtQRRVx6LSYMJ2W4IX8vn5NvMo
Message-ID: <CAH5Ym4h+2w6aayzsVu__3qu3-6ETq1HK7u18yGzOrRqZ--2H9w@mail.gmail.com>
Subject: Re: [PATCH] arm64/boot: Zero-initialize idmap PGDs before use
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Baruch Siach <baruch@tkos.co.il>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_200518_305030_F3E036A4 
X-CRM114-Status: GOOD (  41.53  )
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

On Sat, Aug 23, 2025 at 5:29=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
> On Sun, 24 Aug 2025 at 09:56, Sam Edwards <cfsworks@gmail.com> wrote:
> >
> > On Sat, Aug 23, 2025 at 3:25=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org=
> wrote:
> > >
> > > Hi Sam,
> > >
> > > On Fri, 22 Aug 2025 at 14:15, Sam Edwards <cfsworks@gmail.com> wrote:
> > > >
> > > > In early boot, Linux creates identity virtual->physical address map=
pings
> > > > so that it can enable the MMU before full memory management is read=
y.
> > > > To ensure some available physical memory to back these structures,
> > > > vmlinux.lds reserves some space (and defines marker symbols) in the
> > > > middle of the kernel image. However, because they are defined outsi=
de of
> > > > PROGBITS sections, they aren't pre-initialized -- at least as far a=
s ELF
> > > > is concerned.
> > > >
> > > > In the typical case, this isn't actually a problem: the boot image =
is
> > > > prepared with objcopy, which zero-fills the gaps, so these structur=
es
> > > > are incidentally zero-initialized (an all-zeroes entry is considere=
d
> > > > absent, so zero-initialization is appropriate).
> > > >
> > > > However, that is just a happy accident: the `vmlinux` ELF output
> > > > authoritatively represents the state of memory at entry. If the ELF
> > > > says a region of memory isn't initialized, we must treat it as
> > > > uninitialized. Indeed, certain bootloaders (e.g. Broadcom CFE) inge=
st
> > > > the ELF directly -- sidestepping the objcopy-produced image entirel=
y --
> > > > and therefore do not initialize the gaps. This results in the early=
 boot
> > > > code crashing when it attempts to create identity mappings.
> > > >
> > > > Therefore, add boot-time zero-initialization for the following:
> > > > - __pi_init_idmap_pg_dir..__pi_init_idmap_pg_end
> > > > - idmap_pg_dir
> > > > - reserved_pg_dir
> > >
> > > I don't think this is the right approach.
> > >
> > > If the ELF representation is inaccurate, it should be fixed, and this
> > > should be achievable without impacting the binary image at all.
> >
> > Hi Ard,
> >
> > I don't believe I can declare the ELF output "inaccurate" per se,
> > since it's the linker's final determination about the state of memory
> > at kernel entry -- including which regions are not the loader's
> > responsibility to initialize (and should therefore be initialized at
> > runtime, e.g. .bss). But, I think I understand your meaning: you would
> > prefer consistent load-time zero-initialization over run-time. I'm
> > open to that approach if that's the consensus here, but it will make
> > `vmlinux` dozens of KBs larger (even though it keeps `Image` the same
> > size).
> >
>
> Indeed, I'd like the ELF representation to be such that only the tail
> end of the image needs explicit clearing. A bit of bloat of vmlinux is
> tolerable IMO.

Since the explicit clearing region already includes the entirety of
__pi_init_pg_dir, would it make sense if I instead move the other
pg_dir items (except __pi_init_idmap_pg_dir) inside that region too,
both to keep them all grouped and to ensure that they're all cleared
in the same go? I'd still need to handle __pi_init_idmap_pg_dir, and
it would mean that reserved_pg_dir is first installed in TTBR1_EL1 a
few cycles before being zeroed, but beyond those two drawbacks it
sounds simpler to me, reduces the image size by a few pages, and meets
the "only clear the tail end" goal.

> Note that your fix is not complete: stores to memory done with the MMU
> and caches disabled need to be invalidated from the D-caches too, or
> they could carry stale clean lines. This is precisely the reason why
> manipulation of memory should be limited to the bare minimum until the
> ID map is enabled in the MMU.

ACK. ARM64 caches are one of those things that I understand in
principle but I'm still learning all of the gotchas. I appreciate that
you shared this insight despite rejecting the overall approach!

> > >
> > > > - tramp_pg_dir # Already done, but this patch corrects the size
> > > >
> > >
> > > What is wrong with the size?
> >
> > On higher-VABIT targets, that memset is overflowing by writing
> > PGD_SIZE bytes despite tramp_pg_dir being only PAGE_SIZE bytes in
> > size.
>
> Under which conditions would PGD_SIZE assume a value greater than PAGE_SI=
ZE?

I might be doing my math wrong, but wouldn't 52-bit VA with 4K
granules and 5 levels result in this?

Each PTE represents 4K of virtual memory, so covers VA bits [11:0]
(this is level 3)
Each PMD has 512 PTEs, the index of which covers VA bits [20:12] (this
is level 2)
Each PUD references 512 PMDs, the index covering VA [29:21] (this is level =
1)
Each P4D references 512 PUDs, indexed by VA [38:30] (this is level 0)
The PGD, at level -1, therefore has to cover VA bits [51:39], which
means it has a 13-bit index: 8192 entries of 8 bytes each would make
it 16 pages in size.

> Note that at stage 1, arm64 does not support page table concatenation,
> and so the root page table is never larger than a page.

Doesn't PGD_SIZE refer to the size used for userspace PGDs after the
boot progresses beyond stage 1? (What do you mean by "never" here?
"Under no circumstances is it larger than a page at stage 1"? Or
"during the entire lifecycle of the system, there is no time at which
it's larger than a page"?)

Thanks for your time and attention to this,
Sam

