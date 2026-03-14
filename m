Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032B9107BCF2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 02:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ejtXFezvM4/MIrV0ExVdbB3cmL15fMSqz8fjmYgx6o=; b=AgfeqVuBkWu6TRuJXk+CjupuM2
	F6yUTJXr3fEc3XxjVrBD/frcas+MMspzuD1HIh6JS0fynlHNokrxLanS9WPl5iJhR+ZotektHXn3i
	oZA/dF9+LH5jzxc22BJRkDHG200WjMO/0AevQAIsasa38dZ7az3eSJxa9OvqB3wF9/PGHz9cycoKy
	GiZpxw5gAm2lKxY4teC4E75va7lI/BbmmakZDiAco+U+aAu50yTHc0VUK0kJwT1C8eTUfeTanuUcV
	qxLq+RB/B1d5FgiapxoOOOL1K03yV38wsfgeA4wNfnWi+Svk37I0Mmz3OQbVpU6w5M3I23u0cnkYF
	TbuOiW3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1ESN-00000001Pi9-25ry;
	Sat, 14 Mar 2026 02:10:23 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1ESK-00000001Phl-1n5K
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 02:10:22 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-64ae2ce2fe1so2850064d50.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 19:10:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773454219; cv=none;
        d=google.com; s=arc-20240605;
        b=Dx9mxeCW9+D+9jhsNp/6R4kl4fkgHpX3QOEHjglDzSqcnupvB+tmVS7RLX9M0ctI9+
         axlEFdAjcpAylsoKZl4NhujKWSQXK+NjyE90JrC+1O0svT5RpeGBUau4xLvaINs3wLbY
         3ZMO0OV8Yc876PPTTRckFN3xRjARz+/hSFzjoiBEcyfT+LFeGzTaYFSIVfiFbu048UwH
         NkJR4p0fF412yzwozLfOKmAkWO8iHnGM3uwLcFcIkBsOas+RhANmnoYNd3hHIJ+svZ4N
         qcTxIrUNu8LWmuLRXmNMh0d2N+ivsRdh+M+mFDHGGvfJzAzD9dDlUxYe+MR863uqQB8s
         POng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7ejtXFezvM4/MIrV0ExVdbB3cmL15fMSqz8fjmYgx6o=;
        fh=4PEYdOjS4Zt/b67NcE96RKPOuNfi6nYh6M0H+CRKDzI=;
        b=Zh51cxhf4F+yXkvlTGGmBVR3a2gVhW2gV4sIm/2JRXfs96OKfxXoc6MsWCnhk7nIh4
         UFv6lHOG+6yw6jrqj/99D6Qq35VoCG29w7KGsf7Ft0xV+J0DdgKZpLH4Y+mXQtTJQZ7B
         t4Ks3xxoL7HPXBLTnOrIMMZZXn1uxEQlOKHDI/1H3iUPlpWv6m/ref8YcjvITrR9Tgus
         NqJJa/QZ9dx45zUrKFmQ3sDICes9Nlz73lmC9aW2LwNG8Thu1pinyI6ExOFFRTGHUBuH
         hU/8Kav0jhx67Fbbs12TOkklsZIYCZ6ThrMY/Ph5BIwAlmiPVYrSt7KzUgVNCKxhl1hu
         P3OQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20230601.gappssmtp.com; s=20230601; t=1773454219; x=1774059019; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ejtXFezvM4/MIrV0ExVdbB3cmL15fMSqz8fjmYgx6o=;
        b=lZz9QK/NCxu6EOSk0xAF00u5HjeNqzUKgKMTpiuqH0LEhgBIYuufHibRPStEAnlA/3
         Nn/BvQ1NmJ22jUe0E2ZYgmflY6XT5Wt3eRp/hkVx4Gj/fyoLgblQESZ6u3OhPqI+iuFP
         ab6tx5rZgvefEfla5Mpwh+V9KJalo9o43iWcGOy8RMNBI9jbHiHnzGKQV6j+8ULGPcPw
         vF29S3uiIPdiQrCoHrqPFo4YBw5CnPrPBijPCON9hwec1yzJXEcOo5wDyyTqmFQZyreH
         /uqIbv66lwwITfrP5vhwy6rAjsd8VbpInU4y0zqNIz5Plwa+grYEiBmvCL+R4V711TzJ
         8xHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773454219; x=1774059019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ejtXFezvM4/MIrV0ExVdbB3cmL15fMSqz8fjmYgx6o=;
        b=Q+0YnYL6QAtXCStjVMEyTO2vDKbn4ssU04aHHANi8rdufK4AfGOi6TLfwwbtmnzxSX
         EmJNti/tRNnH3LHh5h4UjfPpQH23G7SuB/MMqVx2pUbiwEk4MA7tzyAkanvay4NDEmVk
         9qWxcB5Snmh/HNIF/ykQX3biuLj3Q92NatY/t1D1IZkCvQP81ZRu6Ff5RZ7lSIsd/5uh
         r0XJYiIxIFTrpym/0qhbFytYj9OJ/CsbotfdIGyYhGFTYmIn/yeGR2wWMAjVCgTrliSC
         Um1XciAWfQFckmsEWCYaVL3GCHmTE6e0cz5CHDBeYRmiL/iEhHZp0hM+GOE6muij7wXW
         ASKw==
X-Forwarded-Encrypted: i=1; AJvYcCUsePzfFyEvXjS5usVXpuUOPG0aXdAJVyoRgp3ypnMVJ6lM0rX5WI27ikMXEjWF/nT909llJis6I5oy6FNBqVC5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5X875dOsLGfFeE7ZpBAT9h7mkBoI94olc5XBzK9569CIXlIGY
	DJpiN4MrE2mDzyjp5qR+pL/VeEKF6yJPvEH8A/q8E5NfsLMu+6RfcPCH69L7Ie8IFwZr6dk6Umb
	c4pLipH1HJ9jUGBzLHR2fqqhQf4V6BKzDzyT5WtNPDQ==
X-Gm-Gg: ATEYQzxbA4xZrMlYMa+vV6+Nwq9dDQdNuI0gdw21aCNdB4v9EcfmUpzsrmFJSX+7+Lz
	nR0RLVNadgRSZt9ZoPKxV6ZCqsORUXlaecoP4WrYWSY0D9EI+4Uq4S1SSuC7F7QOygCjvUDlypu
	7kpe1Tf2NbG0YsqXMjPyk+FzQhuMP6voEp0nt3HW61YNh+iw7Ny7MddwbPwlfsg+lzxnCb5p7Iv
	A4GTwz1O4XN2SAQg6G/AcU3XT/mDn3+BnMDJkkGk/nAUXqOlLxyzGdfYMY+YQ9+fUgZ1g5ycQwA
	f/6TmAGJi8d3TmKMMz13rPhFOQhlD4wviTbdPK0NnAIXq8mTLAJk
X-Received: by 2002:a05:690c:6e08:b0:798:7498:4ae4 with SMTP id
 00721157ae682-79a1c1c3f38mr54139577b3.53.1773454218867; Fri, 13 Mar 2026
 19:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260310145406.3073394-4-usama.arif@linux.dev>
 <20260313144213.95686-1-r@hev.cc> <d3f60289-3ea1-43ce-9271-58c8b79bf7a0@linux.dev>
In-Reply-To: <d3f60289-3ea1-43ce-9271-58c8b79bf7a0@linux.dev>
From: hev <r@hev.cc>
Date: Sat, 14 Mar 2026 10:10:08 +0800
X-Gm-Features: AaiRm51ZT-5Id2ShpKb8C4cESB_JJ6PpokKQgHEX0HKVk-NcE-akKpRzUvPAXoE
Message-ID: <CAHirt9g=drGaeNN7C1hbND4=zXQifhQyP4cUaCz27=tYpHYgfQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] elf: align ET_DYN base to exec folio order for
 contpte mapping
To: Usama Arif <usama.arif@linux.dev>
Cc: Liam.Howlett@oracle.com, ajd@linux.ibm.com, akpm@linux-foundation.org, 
	anshuman.khandual@arm.com, apopple@nvidia.com, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, brauner@kernel.org, catalin.marinas@arm.com, 
	david@kernel.org, dev.jain@arm.com, hannes@cmpxchg.org, jack@suse.cz, 
	kas@kernel.org, kees@kernel.org, kernel-team@meta.com, kevin.brodsky@arm.com, 
	lance.yang@linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, lorenzo.stoakes@oracle.com, npache@redhat.com, 
	rmclure@linux.ibm.com, ryan.roberts@arm.com, shakeel.butt@linux.dev, 
	viro@zeniv.linux.org.uk, will@kernel.org, willy@infradead.org, ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_191020_754008_1AF41500 
X-CRM114-Status: GOOD (  29.82  )
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

On Sat, Mar 14, 2026 at 3:47=E2=80=AFAM Usama Arif <usama.arif@linux.dev> w=
rote:
>
>
>
> On 13/03/2026 17:42, WANG Rui wrote:
> > Hi Usama,
> >
>
> Hello!
>
> > Glad to see you're pushing on this, I'm also following it. I first noti=
ced this when rustc's perf regressed after a binutils upgrade. I'm trying t=
o make ld.so to aware THP and adjust PT_LOAD alignment to increase the chan=
ces of shared libraries being mapped by THP [1]. As you're probably seen, I=
'm doing something similar in the kernel to improve it for executables [2].
>
> For us it came about because we use 64K page size on ARM, and none of the
> text sections were getting hugified (because PMD size is 512M). I went wi=
th
> exec_folio_order() =3D cont-pte size (2M) for 16K and 64K as we can get b=
oth page
> fault benefit (which might not be that important) and iTLB coverage (due =
to
> cont-pte).
> x86 already faults in at 2M (HPAGE_PMD_ORDER) due to force_thp_readahead =
path in
> do_sync_mmap_readahead() so the memory pressure introduced in ARM won't b=
e worse
> than what already exists in x86.
>
> >
> >> +                    if (exec_folio_order())
> >> +                            alignment =3D max(alignment,
> >> +                                    (unsigned long)PAGE_SIZE << exec_=
folio_order());
> >
> > I=E2=80=99m curious, does it make sense to add some constraints here, l=
ike only increasing p_align when the segment length, virtual address, and f=
ile offset are all huge-aligned, as I did in my patch? This has come up sev=
eral times in the glibc review, where increasing alignment was noted to red=
uce ASLR entropy.
> >
>
> Yes I think this makes sense!
>
> Although maybe we should check all segments with PT_LOAD. So maybe someth=
ing
> like below over this series?
>
> diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
> index 2d2b3e9fd474f..a0e83b541a7d8 100644
> --- a/fs/binfmt_elf.c
> +++ b/fs/binfmt_elf.c
> @@ -1116,10 +1116,30 @@ static int load_elf_binary(struct linux_binprm *b=
prm)
>                          * the hardware cannot coalesce PTEs (e.g. arm64
>                          * contpte) even though the physical memory and
>                          * file offset are correctly aligned.
> +                        *
> +                        * Only increase alignment when at least one
> +                        * PT_LOAD segment is large enough to contain a
> +                        * full folio and has its file offset and virtual
> +                        * address folio-aligned. This avoids reducing
> +                        * ASLR entropy for small binaries that cannot
> +                        * benefit from contpte mapping.
>                          */
> -                       if (exec_folio_order())
> -                               alignment =3D max(alignment,
> -                                       (unsigned long)PAGE_SIZE << exec_=
folio_order());
> +                       if (exec_folio_order()) {
> +                               unsigned long folio_sz =3D PAGE_SIZE << e=
xec_folio_order();
> +
> +                               for (i =3D 0; i < elf_ex->e_phnum; i++) {
> +                                       if (elf_phdata[i].p_type !=3D PT_=
LOAD)
> +                                               continue;
> +                                       if (elf_phdata[i].p_filesz < foli=
o_sz)
> +                                               continue;
> +                                       if (!IS_ALIGNED(elf_phdata[i].p_v=
addr, folio_sz))
> +                                               continue;
> +                                       if (!IS_ALIGNED(elf_phdata[i].p_o=
ffset, folio_sz))
> +                                               continue;
> +                                       alignment =3D max(alignment, foli=
o_sz);
> +                                       break;
> +                               }
> +                       }

I think this logic should live in maximum_alignment(), so we don't
have to walk the segments twice. It might be better to move it into a
separate helper, something like should_align_to_exec_folio()?

>
>                         /**
>                          * DOC: PIE handling
>
> > [1] https://sourceware.org/pipermail/libc-alpha/2026-March/175776.html
> > [2] https://lore.kernel.org/linux-fsdevel/20260313005211.882831-1-r@hev=
.cc
> >
> > Thanks,
> > Rui
>

