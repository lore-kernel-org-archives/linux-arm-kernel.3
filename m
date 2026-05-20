Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF9FCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 14:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+wF22bF5EmTZVPtYuYx3YYi/+1MmDMRoeQxqbotBDA=; b=Q78zzlL8jcNBzpr8smCQbx1H/3
	THg0WD2t3RYhFfJ2ae634FPty8V5zpq3SjkKnVwEmU++uKUYVr9f1fi/TiOZTHAUldvE7pLYPMuI9
	yiDsVAnXtL19N7MHSOTF96aZeSoBPCNyJ3YrkIqQ/VVgZBLGv0SeW/ywO9VLmIloVBHbL9ltANG3Y
	Y/sFyxhyWoVjUkmwAkcQ0acvItQgepE7JTrFYFD/rMReAFnY7WeJIg18tUn3KGyMXqbjxnxw+Jatg
	cchvpbO8lEs3TvC4ARvcDPemEa3z0hfieO3AcjjoDcUdMnlUtxOcZMCQJv3kvKoLEUYMDZ76EoNvU
	Pv0UutMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhxY-00000004pWh-39HW;
	Wed, 20 May 2026 14:31:44 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhxW-00000004pVx-3DSg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 14:31:43 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-449de065cb3so4579325f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 07:31:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779287500; cv=none;
        d=google.com; s=arc-20240605;
        b=NVp7kJgAZ3OJ0xW0wInJLceZfbekoCbYPAmxeTg3HLWGyUtSWjP6PZDW7zx777L9EM
         +x9ER9/IdBiBw7KhVAYesf9s8M3k49lYVEQjT/ooQV3cONN8dmWu4EaiSqo+/wjzKemv
         2FG0h+uHQvG+vUWtmN40sdNKPisoScQsghy195odVFfGR1DvZp6xu8gb4zMJWRsEyk7o
         R49crsJLIMTTDKKlDhn+zPkHDcj5NEMG9ljVxuMZ5g+bMKWGw+dcwkrrblDkA86Ilpft
         a0ywViKLV0Ow3WusS3ztIf2EUpNErwnpcgXKdpJoqGpHDmZ9IoEqDZpWeZrANeQeXL7G
         GbQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l+wF22bF5EmTZVPtYuYx3YYi/+1MmDMRoeQxqbotBDA=;
        fh=GZ58q7r6aN2i2o13BYeCH8w/y7a0Nvkom+5YhbJotkI=;
        b=R5n6xacrDUwMfcR0mBe5M/mshcgkRqNA8bvfsRAPma5tTkqLIF6JTp1+1w+DVPQfVY
         X68DLozvtmbopdmfVcRWPS1ORxRkIVUJsEXuwB8OAPs0jREzVgabAm6JqnL6+NrsxAh1
         qDitbJzfxFW4We3UPUwWTDw86Ov3q0nB5IWp/CLSdQWH5/hnlOIib7y4HyyJ8wXJ1sy7
         54wFBMBzJhOvy7WAdXdoDHThoxayWMdEt6kV2t0+to8pumTffpa3vqMGgZ+lQ0/Q8Bjs
         ll76AMeVjPyhe6WpS4W29vZ+qezAPzylmqYM+1xMcrpoCmGiyhCGyrCWx5MGdOSePbpm
         l4iw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779287500; x=1779892300; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+wF22bF5EmTZVPtYuYx3YYi/+1MmDMRoeQxqbotBDA=;
        b=XppHlFUGlJWkBmpsBYrxLLC2tstOPbkX4mkAPZlIOYwguDPRg6TjMw0qJA7Ohz8y0M
         ZhtL0HKjtlPGygpjVayzkQ7A0NQpVku3P/K3mYYhZW1GQQnQxBZC8ixNi7J4FHCmHoQ1
         qMKT2hXX+OBXR1DfCqzkqbv7txAkYz9OAvKrdn3naFCt2RIAgvhobI8WJblCMXIJvwrf
         ZfoPlWq6HdFd1N6bnhIZKtPrYF1AEaNIvF2kl7gXdKpi8SJT202p64uG1g+WCVPWsuqC
         l0Yj8iiKISLEvfFuZ8KUVpKm+UHojwSD2j55ROHEw/gsnFoLwqRRVtfeyNjqkvCdNJci
         GVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779287500; x=1779892300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l+wF22bF5EmTZVPtYuYx3YYi/+1MmDMRoeQxqbotBDA=;
        b=NTO6vMsYkpJTSMuicomTVbvfdeNKWzhJ19nhx1fMxrCMOS98RKaolSz6wnG1qZAse6
         IbdkR7zD/FcY9LH6L+PZVU7VO8udZmTLjeSCu0Jv/SQ5f+QlMRGs/IT0VYhwmMzBHGGu
         J2bT+KMHtdEXiRbnnTlNItiYGrByHl3gpY6pQ5wusJ355rIt1YEYJenyxtXHor/922qx
         5Z8KkNIrKi+2kAQ7XEoULvzyYMr0tgmE5D1JYxF3+V1/lXwxo9Nk4ijy74eiMbnb65gx
         sP0XtaOh4xKQ3MOQOBFgyQcMrq7KtlRcvBnW3HniGk/FZBmmJ2tcOhBykS/7wMe99ReU
         qvYg==
X-Forwarded-Encrypted: i=1; AFNElJ/fhckN3mdFORdmZxRkOO0y2qneQWSldsdQa5J7UYA1zB25Js2lHNdtzpxAMXwiusvX+mamC56Bdh+UJs2z4SP2@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3eaIrLFfHfueU5/vAIfSWhkwnqCiLjBZ8kvVCRFIFn9d5J+rM
	RBPOn3Iv4Kq3Nidn6n7lrNvJNNU7HrEhyVjEQjSTdPhlj1nTOMHW0E3VUPf0Q1X+NU37SXztqFZ
	/aT/XsjvCA78B92yEtIWZOaEBqJweVgwYviq9rU0=
X-Gm-Gg: Acq92OE8pFb3wuK5tJGuJpaJzoKRlV1mcoVfBoUCzyt+cegmBnf2GwPuws2hRJsT8LI
	ldi0qEHEjMD0LAImgORJrcnS5VH1lArrPg9UtnXkMM5dvVSfcJhtuJ08JPlSVBoGJxv//0jhDfE
	Kn7Ooo3LFW0smsgXc39Sv+IvgL2OGOM8PxpnNE8x2bOZ/A5IZ/1vSYOHTHvt+OQuJnokkKzwqqh
	YREJfBZLR1DNGsv2J8fCK2Ob7HvKNwcf5DZYVmnPeu2zyPPPp9yhcb2cEJAiRr4d+WQuTRv5Ook
	3ZVL7Zj1ycTnfFzSLPW6ros8gdWiYyKFjkWnZS1y6DO0b5hDXAKkQAS5s2OkvK6frqcZyG550Pp
	+FSw=
X-Received: by 2002:a05:6000:2489:b0:441:36b7:725f with SMTP id
 ffacd0b85a97d-45e5c57d4c7mr39111981f8f.5.1779287500133; Wed, 20 May 2026
 07:31:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260517211232.1670594-1-tj@kernel.org> <20260517211232.1670594-2-tj@kernel.org>
 <9ba50fd2-077e-4291-9276-9adb18186873@kernel.org> <agtuPrgIDNKSu2Oo@slm.duckdns.org>
 <2f02d90d-cdc9-48ef-abe3-99e00f22595f@kernel.org> <297658c4ae2d6e7103f5968efc936224@kernel.org>
 <04b03066-86d3-4c0b-b077-307fd0f3bc9c@kernel.org> <5590fd3d-dae1-4070-b52f-bc40982ac678@kernel.org>
 <agyZxmHoueGwBAQg@slm.duckdns.org> <CAADnVQJt0p7hSn2G074QZRh2LEdthy3RKYJ9j3w5yeJ-e8UQLw@mail.gmail.com>
 <fb889bfc-af0e-491e-a69f-38c2abf88d22@kernel.org>
In-Reply-To: <fb889bfc-af0e-491e-a69f-38c2abf88d22@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 20 May 2026 07:31:28 -0700
X-Gm-Features: AVHnY4Jfl2x_h-7nV11QrGsQRKElNx9baYm9fCq6a9rlTD86qFRr9_qH0Fp83GM
Message-ID: <CAADnVQ+j4o0Xy+cykSdx9txSqCouy0yHFaA09qTJp3OVF3VaRA@mail.gmail.com>
Subject: Re: [PATCH 1/8] mm: Add ptep_try_install() for lockless empty-slot installs
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
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
X-CRM114-CacheID: sfid-20260520_073142_830495_E0A72C22 
X-CRM114-Status: GOOD (  28.93  )
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

On Wed, May 20, 2026 at 10:41=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 5/19/26 21:04, Alexei Starovoitov wrote:
> > On Tue, May 19, 2026 at 10:11=E2=80=AFAM Tejun Heo <tj@kernel.org> wrot=
e:
> >>
> >> On Tue, May 19, 2026 at 11:40:48AM +0200, David Hildenbrand (Arm) wrot=
e:
> >> ...
> >>
> >> Wouldn't it still be either or with both cases being okay?
> >>
> >>>
> >>> ... or can we run into similar problems with kprobes? (I am obviously=
 no bpf
> >>> expert ...)
> >>
> >> Yeah, I mean, that was just the first TP I found scanning the code. An=
y
> >> kprobes or other TPs in the path would behave the same.
> >>
> >> When this fault triggers, the BPF program has already malfunctioned, s=
o it's
> >> not going to be a high frequency path and performance isn't a primary
> >> consideration. So, anything that can ensure that the kernel doesn't cr=
ash or
> >> lock up would be fine. Any better ideas?
> >
> > As you guys already figured out the trylock is not an option.
>
> And that should be carefully documented.

+1

>
> At least in apply_range_clear_cb() one could similarly switch to
> ptep_try_install() to at least have both these paths handle races in a
> reasonable way. (having to handle when ptep_try_install() is not really i=
mplemented)

You mean to use ptep_get_and_clear() ?
Makes sense to me.

Also noticed bogus defensive check there that should be removed:
+ if (unlikely(!d))
+   return 0;


> Anyhow, the documentation of ptep_try_install() must clearly spell out th=
at this
> must be used very carefully, and only in special kernel page tables, neve=
r user
> page tables. There are likely other scenarios we should document (caller =
must
> prevent concurrent page table teardown somehow, and must be prepared to h=
andle
> races if other code is not using atomics).
>
> To highlight that, we should likely consider adding a "kernel" in the nam=
e, like
> "ptep_try_install_kernel()".
>
> I am also not sure if "install" is the right terminology and whether it s=
hould
> instead be "ptep_try_set()". (set_pte_at is the non-atomic interface righ=
t now)

I suggested using the ptep_try_set() name too :)

> Further note that last time I talked to Linus about arch helpers, he pref=
erred
>
> #define ptep_try_install ptep_try_install
>
> over __HAVE_ARCH_PTEP_TRY_INSTALL

ok.
I guess __HAVE_ARCH_PTEP_GET_AND_CLEAR is legacy ?

