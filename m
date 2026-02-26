Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A19FC5906
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 07:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GU5SM6jqGe2gfNc3W7uqQvvp0coVugTWgrE3eLCzdQ=; b=ImbzlEx0KMDW/c8kbq40u3U7t3
	6jW9A6nzmqsVw9mh02hxaZ5sR4CpAh9XaV1UiEbg67HoSd3R+6iCQJSFKUp6TUr1NvMJO/j0Fl+f/
	dQh/x3c33yRi+ZiZZvtibgazTBf0WySkun7rtj52ehH7cIH4xFGjpSApjyGM6+GQ69qsXwjEdQSH8
	NST9XoFZlhWuen8x9eaQx3itEYsBNy5H64nXfHT4uTcfpZDNyb2GCiumZ0Hy+RwXRCYUG4flIWC6d
	hIk+x4y31+Mgu3N4P4yYqCJL29kJIiYu3wI29Z7VlrYUV0R1Rf75jz/3r9WPdV1wn42CG1qf09HJf
	/fD44POA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvVzR-00000005abe-0prY;
	Thu, 26 Feb 2026 07:40:53 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvVzO-00000005aao-2BFV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 07:40:51 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2adb1c1f9d4so74845ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 23:40:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772091649; cv=none;
        d=google.com; s=arc-20240605;
        b=joJPqz7z/waKN8PagGB9YYSOajl7J0gGX4Cowg1R890hWKXE+1CHTKIaF3hF3Uyo1M
         ginuOrs+5g6qbEAVQqrPm4PCx/j0pweMLAfaRDpuWlIzOIKAHWc+CCwOT2HuVa3gVp0V
         GI58ShHbJtvDk/hLne1ZqQsUuA/j8+l95hnLrwJ2oyyXTe+S7CYUuhnTAVeAykCSSjhk
         Fje5GH1aDkSAh5t2VWfDROYD04F+em/dvkGh2LspGp5Nzc7sNQCSsMyyhz35kmDUY0Z2
         O4acvjqoeyK5vKL0Xa901tjW2qVlcSD25YJNMpQyjOgCgwRZ++/b2PJSpImrEtBctX7H
         G5AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2GU5SM6jqGe2gfNc3W7uqQvvp0coVugTWgrE3eLCzdQ=;
        fh=CRLbMr6K4GJzewc4YxfQUfcXXpH2xbQMJMyV4PBjkec=;
        b=jSVnVLJh7dXAiO4TLU24AIOCt2P4bs+vSmlFokIdU2CS+HpcVO6hHxrkrtRNNUVbwV
         kadpB/M77PDVLMg++w8dZqRAvdG6CzpQz4DMpjNI2ScArvIrkZuzHdGYWQ0z3JanLse5
         I/bL7SSIOEP++87agcPnc3sYWixcb1rYVoDXYBtoDd+YwCc1U3h6LsmG+FeD++cHJs3d
         4gVqLEi0vKfGYeNAS1yzIf30YZN/z2uiAzdEO4ysx9ycGGFQ7NXtVEMCPDVwe0e0GaCe
         7eUA4BBnVkm2EgwrdHcMkLlVbke07OmnMjn1WS6sbHpzE/nEQcKZuu3wNzbJ3h4Vcq7j
         Tjqg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772091649; x=1772696449; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GU5SM6jqGe2gfNc3W7uqQvvp0coVugTWgrE3eLCzdQ=;
        b=D9XyAGaGFWQ1lwzRoIOfucLRgx3u5TW+o67q5aHElxR2UuWKVOAqHn6OFlAFu/TZEb
         /FwJKU84Ga/UNOazFKRPJZVmt4ol/T7QKO5hyoNJ4PfC3ws0zxHe89tVzd9zv1hKM9F+
         dJyr+HAYFpjRDO74Ay/44+xuEoJ1XRBcgsC4aM9TbRr/TvhXHYqNkEnQH0XIuldQZPO2
         bFWj9U9Rz1MLDC1vdoX6yZmXBoVvTePpr0PJcu8OhVeiLuAd1O65zkXCrZx+mKlzcJPd
         oMGeehpuaOiQbdQ6TTmvpBONm3o6sGsg8nJ8DLg3N9YbYmbrDr0l2AeGMMh71D3u8V6b
         r8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772091649; x=1772696449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2GU5SM6jqGe2gfNc3W7uqQvvp0coVugTWgrE3eLCzdQ=;
        b=WiMP2YD4hE0Fv2j6G84YaSk+XSYLEuHkuLO+P5g6xTBsY0+zqL9rs5bS5kE0u11h53
         Qrnez0SpEM1973S4Ts3N7wxRzVVt2BaBvLfbRESv9kkoO0sfzceeulZq1fJEgdze1vVC
         f4kmxuFNDMWDjjBT47EzzXPZJhnxV8SQKRMXbylPpBx28PcyHgtggUe8qFMEjXc/tbzY
         qg4HBKKosPaNGSLVi+KX/YPekpBsDz53vxluExRpkha4RjPR/YKFW0FYD2n4H8hH1sbc
         V0/qwB+8HjYf1AwZnKZJnoLNZmuotoHOgT6T9RiG1WuwRB4agjYfPTbCK6ctpENJJlAW
         ow5g==
X-Forwarded-Encrypted: i=1; AJvYcCVK7uvF6ZwxmnQvtSpqTQGINAp3/fE3DMgkAfpq60+znM2+fCAt0h/MYXm2xh3jAIwg4Gyn0F1b0u2aaNnVSlFx@lists.infradead.org
X-Gm-Message-State: AOJu0YysBNCp4Lyem95QiUFN77LcIN/VONn5hJcijlfPJEikC3S6ak6d
	SdNXocpYVXVicMlimF2KihmSqUh2Lezkbyy/SLxdcnahI6xlFfwKWKpR6n2v+DMEt9jgkhaD3oI
	0UuuHiRaF21PIgUy9kD4FHJ/211XRHAaCgaptfeTL
X-Gm-Gg: ATEYQzwtvg5AyxG5E+CAAfREaHRjzOT59s2Jgtb6oLnFVva9CDRfSzw4+Kmo6ayGPH+
	3xNDGNzhrUMACEvBJrSO0f4gwqIHzsOjrEEXXyojjhqdMVuESaZlTdyMLG6yFuynzUYk7wAvKAA
	cL8enXdEK+w8Pktj6LMqiePEaNRWOe8G57O+quGRDw4YyGleBXCMTq4mcnbdQdaCyroqWeptEtZ
	w5VcRHL64ZMPVKmuSxC1RmD9AWaB9qs11YU8cfMHRzI3tt71DGcL6PmKxd79puMTeq6kRILUUQd
	LzLFJTLQ5udsf2e1/7MuaLIKPFYcCpiIN2JUA9uyNUpmh51D2A==
X-Received: by 2002:a17:903:1ad0:b0:2a7:6c4e:5914 with SMTP id
 d9443c01a7336-2adf7721839mr1456305ad.6.1772091648235; Wed, 25 Feb 2026
 23:40:48 -0800 (PST)
MIME-Version: 1.0
References: <20260217145026.3880286-1-dev.jain@arm.com>
In-Reply-To: <20260217145026.3880286-1-dev.jain@arm.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Wed, 25 Feb 2026 23:40:35 -0800
X-Gm-Features: AaiRm53qWWo5MB4ueH2PCIe5gx6Mwj_ETLVvRNUsIKl5chlpjmW_kvj6j6uOl6s
Message-ID: <CAC_TJvfD19E--wyeVyTmp-LP9ffoLQaUHruZARbdes2EnKgptQ@mail.gmail.com>
Subject: Re: [LSF/MM/BPF TOPIC] Per-process page size
To: Dev Jain <dev.jain@arm.com>
Cc: lsf-pc@lists.linux-foundation.org, ryan.roberts@arm.com, 
	catalin.marinas@arm.com, will@kernel.org, ardb@kernel.org, 
	willy@infradead.org, hughd@google.com, baolin.wang@linux.alibaba.com, 
	akpm@linux-foundation.org, david@kernel.org, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, =?UTF-8?Q?Mateusz_Ma=C4=87kowski?= <mmac@google.com>, 
	=?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>, 
	Marcin Szymczyk <marcinszymczyk@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_234050_571672_D4560855 
X-CRM114-Status: GOOD (  48.17  )
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

On Tue, Feb 17, 2026 at 6:50=E2=80=AFAM Dev Jain <dev.jain@arm.com> wrote:
>
> Hi everyone,
>
> We propose per-process page size on arm64. Although the proposal is for
> arm64, perhaps the concept can be extended to other arches, thus the
> generic topic name.
>
> -------------
> INTRODUCTION
> -------------
> While mTHP has brought the performance of many workloads running on an ar=
m64 4K
> kernel closer to that of the performance on an arm64 64K kernel, a perfor=
mance
> gap still remains. This is attributed to a combination of greater number =
of
> pgtable levels, less reach within the walk cache and higher data cache fo=
otprint
> for pgtable memory. At the same time, 64K is not suitable for general
> purpose environments due to it's significantly higher memory footprint.
>
> To solve this, we have been experimenting with a concept called "per-proc=
ess
> page size". This breaks the historic assumption of a single page size for=
 the
> entire system: a process will now operate on a page size ABI that is grea=
ter
> than or equal to the kernel's page size. This is enabled by a key archite=
ctural
> feature on Arm: the separation of user and kernel page tables.
>
> This can also lead to a future of a single kernel image instead of 4K, 16=
K
> and 64K images.
>
> --------------
> CURRENT DESIGN
> --------------
> The design is based on one core idea; most of the kernel continues to bel=
ieve
> there is only one page size in use across the whole system. That page siz=
e is
> the size selected at compile-time, as is done today. But every process (m=
ore
> accurately mm_struct) has a page size ABI which is one of the 3 page size=
s
> (4K, 16K or 64K) as long as that page size is greater than or equal to th=
e
> kernel page size (kernel page size is the macro PAGE_SIZE).
>
> Pagesize selection
> ------------------
> A process' selected page size ABI comes into force at execve() time and
> remains fixed until the process exits or until the next execve(). Any for=
ked
> processes inherit the page size of their parent.
> The personality() mechanism already exists for similar cases, so we propo=
se
> to extend it to enable specifying the required page size.
>
> There are 3 layers to the design. The first two are not arch-dependent,
> and makes Linux support a per-process pagesize ABI. The last layer is
> arch-specific.
>
> 1. ABI adapter
> --------------
> A translation layer is added at the syscall boundary to convert between t=
he
> process page size and the kernel page size. This effectively means enforc=
ing
> alignment requirements for addresses passed to syscalls and ensuring that
> quantities passed as =E2=80=9Cnumber of pages=E2=80=9D are interpreted re=
lative to the process
> page size and not the kernel page size. In this way the process has the i=
llusion
> that it is working in units of its page size, but the kernel is working i=
n
> units of the kernel page size.
>
> 2. Generic Linux MM enlightenment
> ---------------------------------
> We enlighten the Linux MM code to always hand out memory in the granulari=
ty
> of process pages. Most of this work is greatly simplified because of the
> existing mTHP allocation paths, and the ongoing support for large folios
> across different areas of the kernel. The process order will be used as t=
he
> hard minimum mTHP order to allocate.
>
> File memory
> -----------
> For a growing list of compliant file systems, large folios can already be
> stored in the page cache. There is even a mechanism, introduced to suppor=
t
> filesystems with block sizes larger than the system page size, to set a
> hard-minimum size for folios on a per-address-space basis. This mechanism
> will be reused and extended to service the per-process page size requirem=
ents.
>
> One key reason that the 64K kernel currently consumes considerably more m=
emory
> than the 4K kernel is that Linux systems often have lots of small
> configuration files which each require a page in the page cache. But thes=
e
> small files are (likely) only used by certain processes. So, we prefer to
> continue to cache those using a 4K page.
> Therefore, if a process with a larger page size maps a file whose pagecac=
he
> contains smaller folios, we drop them and re-read the range with a folio
> order at least that of the process order.
>
> 3. Translation from Linux pagetable to native pagetable
> -------------------------------------------------------
> Assume the case of a kernel pagesize of 4K and app pagesize of 64K.
> Now that enlightenment is done, it is guaranteed that every single mappin=
g
> in the 4K pagetable (which we call the Linux pagetable) is of granularity
> at least 64K. In the arm64 MM code, we maintain a "native" pagetable per
> mm_struct, which is based off a 64K geometry. Because of the guarantee
> aforementioned, any pagetable operation on the Linux pagetable
> (set_ptes, clear_flush_ptes, modify_prot_start_ptes, etc) is going to hap=
pen
> at a granularity of at least 16 PTEs - therefore we can translate this
> operation to modify a single PTE entry in the native pagetable.
> Given that enlightenment may miss corner cases, we insert a warning in th=
e
> architecture code - on being presented with an operation not translatable
> into a native operation, we fallback to the Linux pagetable, thus losing
> the benefits borne out of the pagetable geometry but keeping
> the emulation intact.
>
> -----------------------
> What we want to discuss
> -----------------------
>  - Are there other arches which could benefit from this?
>  - What level of compatibility we can achieve - is it even possible to
>    contain userspace within the emulated ABI?
>  - Rough edges of compatibility layer - pfnmaps, ksm, procfs, etc. For
>    example, what happens when a 64K process opens a procfs file of
>    a 4K process?
>  - native pgtable implementation - perhaps inspiration can be taken
>    from other arches with an involved pgtable logic (ppc, s390)?
>

Hi Dev, Ryan,

I'd be very interested in joining this discussion at LSF/MM.

On Android, we have a separate but very related use case: we emulate a
larger userspace page size on x86, primarily to allow app developers
to test their apps for 16KB compatibility using x86 emulators [1].

Similar to your proposed "ABI adapter" layer, our approach works by
enforcing a larger 16KB granularity and alignment on the VMAs to
emulate the userspace page size, while the underlying kernel still
operates on a 4KB granularity [2].

In our emulation experience, we've run into a few specific rough edges:

1. mmap and SIGBUS: Enforcing a larger VMA granularity means that
mapping files can easily extend the VMA beyond the end of the file's
valid offset. When userspace touches this padded area, the 4KB filemap
fault cannot resolve to a valid index, resulting in a SIGBUS that
applications aren't expecting.

2. userfaultfd: This inherently operates at the strict PTE granularity
of the underlying kernel (4KB). Hiding this from a userspace that
expects a 16KB/64KB fault granularity while the kernel still operates
on 4KB granularity is messy ...

3. pagemap and PFN interfaces: As you noted with procfs, interfaces
that expose or consume PFNs are problematic. Userspace tools reading
/proc/pid/pagemap, /proc/kpagecount, /proc/kpageflags,
/proc/kpagecgroup, and /sys/kernel/mm/page_idle/bitmap calculate
offsets based on the userspace page size ABI, but the kernel returns
4KB PFNs which breaks such users.


It would be great to explore if we can align on a unified approach to
solve these.

[1] https://developer.android.com/guide/practices/page-sizes#16kb-emulator
[2] https://source.android.com/docs/core/architecture/16kb-page-size/gettin=
g-started-cf-x86-64-pgagnostic

Thanks,
Kalesh

> -------------
> Key Attendees
> -------------
>  - Ryan Roberts (co-presenter)
>  - mm folks (David Hildenbrand, Matthew Wilcox, Liam Howlett, Lorenzo Sto=
akes,
>              and many others)
>  - arch folks
>

