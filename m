Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B8CC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 16:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wb7EzNeuZNtT7LoNB6YIvTwNTIj8nYWDYSy4GeuX+MM=; b=h3PMNSdS/UsQXY3J8Ou/l4mDcr
	ndwCkjpOpXpNzew9FMR4lGs91wUnZvcVh4UbOAqNqaHi4si7D3bNjhfnEYt7/zeC3uKugeju7SfeP
	Yqd+z2e+YYjuZWPil8boKt77ZYoeKjUYCQnwgSU2Jwxewky7Y1qr7DjZO6mOAVVu+F6pZoxIB+1S1
	RyelWViKZm8Bq0rjv9HPFQ2RKRII0QvSTl5NoAJbjhOZOcqhEE5wo4VW1wtl9HHr03sCdcpmD1cUq
	Td+o8ZfrLW+uPGB9vr5GJlS1tBt8ewc6LcrWdOjzAWD/GLLipDH20PfiknmFwDFogP3Ui/ISZTFMQ
	m9dDHjLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2qt-00000001E9I-1D4o;
	Fri, 30 May 2025 16:45:03 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2Zm-00000001BBC-2ZE7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 16:27:23 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6000791e832so11057a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 09:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748622441; x=1749227241; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wb7EzNeuZNtT7LoNB6YIvTwNTIj8nYWDYSy4GeuX+MM=;
        b=2V0n3OLJUvm8+kkJdh3gz4fjx2UrzrL0Llz0wxOsGaIsuHPl2gAUf+NsID6PojaX2K
         aCYMWUV56kx5oBA8E7pSjLUHF3mOZj4HXHHe01DdAUuDqvHlvToscXOR3mo14iSGz79V
         stERPjTewasWQe08CqT/BZnDT/81xNqBO1Xnj2Xt+LjrAn92eYLg//oKgJ6fynPEqLt9
         goR8cTwpGD25kitiJze90ds5vkOtDXpFVEuUihOtv+0lyTGvo3QIfYN2PIbmiqFcg463
         0dshUH794NfYcgyKdTKyPafRN9gGwCOlljWdWLkY1gZrapF63i5pLxxogw/qGvl5qeDS
         U1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748622441; x=1749227241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wb7EzNeuZNtT7LoNB6YIvTwNTIj8nYWDYSy4GeuX+MM=;
        b=qIMm7KYZeyf7c8gJfQA8w2MTPociPX+9OyUM8Mg+QNzfhCldV5KcxjpqyTaPGiOZRq
         HD1Q5Whi9DbMjGytySSas7oPr03GSj746EdVoNtpdPU2YJato3yyRMwg9T8qM0VmPpYe
         ZShUBWjkKspNlAGQlPtsSTrZU9WMe7EZAh38HOZv0x7OoJwmp8/o9UKaEyP9s8UsVkQo
         Zls+3jvWg7MD6ytbzRC0XC4WXnBeahLOTcyb6FCc2V0Y59NH2YYFNosIEmaSTGd52gmX
         COq6K5F4eGSHJv+yj/Ose9K+vsCK0LPwUUgklNp3xN2TGFx6Gb02CJDmtpwdqezMf1SM
         AwUw==
X-Forwarded-Encrypted: i=1; AJvYcCUp2KjvK5NMNlLVjHozHojoYdSAH1WbSDaHZ+8hs158xF1OKfT62zMQXPGKB2kX45Ooo08bKnLLVPkzs64aQ5BP@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6tiFy8er8edx06e6LVkLFT5IR774l1/Eobcm2H/9gWojGxLoa
	Sm1WXMkiS2uEJ4OZt2yeYQ8+/QxmiwsJf8ZCWrs/rJ/4mMVj0kUYXTHd8Kpz/Rd2lgITwpBzeXu
	J2R53Ibh160Ix8fZaBrFQzfLYoUxagbcr98r4xfUJ
X-Gm-Gg: ASbGnctWaz330Jn1aD/Zw7ZcLjZmiNCt7q/kpRD7cghuuGpJ3cQsju/hknPYj266IRG
	gynZPxc9YXwb4P76cVBeFoBoDr3BC+9YX5G62z+bwvguOvXGTdPImvQzeoUo+pGmbWJT7g1mPje
	2aUZ1qP2G3TeVC8Cd/L/IDoNc+rpnXCSsONHXRPygolhIS/el042phjV+TDBNTBtLFijNw9Jc=
X-Google-Smtp-Source: AGHT+IFvo4UeYXqvvR6hGpmlYjccx/P9qAgBVyNpakUtwWnk/plyYyjpSLFfr/exrsOHq2DB2NbEp4NJnsA/fPm9vYQ=
X-Received: by 2002:a50:f608:0:b0:5e6:15d3:ffe7 with SMTP id
 4fb4d7f45d1cf-60577a55f40mr88916a12.7.1748622440589; Fri, 30 May 2025
 09:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250530140446.2387131-1-ryan.roberts@arm.com> <20250530140446.2387131-2-ryan.roberts@arm.com>
In-Reply-To: <20250530140446.2387131-2-ryan.roberts@arm.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 30 May 2025 18:26:44 +0200
X-Gm-Features: AX0GCFt5gaAeg9wlqckCjWiqvoyfvAtwj8XYq0jNIyzkBuWgoy0LcwI3HloBVMo
Message-ID: <CAG48ez2k6ZmM-335EQjXeL6OtKzuOjVPWQDuJ75ww9Z6NMeg5w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/6] fs/proc/task_mmu: Fix pte update and tlb
 maintenance ordering in pagemap_scan_pmd_entry()
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Juergen Gross <jgross@suse.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.makhalov@broadcom.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Alexei Starovoitov <ast@kernel.org>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mm@kvack.org, 
	Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_092722_655874_8E793E97 
X-CRM114-Status: GOOD (  23.38  )
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

On Fri, May 30, 2025 at 4:04=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:
> pagemap_scan_pmd_entry() was previously modifying ptes while in lazy mmu
> mode, then performing tlb maintenance for the modified ptes, then
> leaving lazy mmu mode. But any pte modifications during lazy mmu mode
> may be deferred until arch_leave_lazy_mmu_mode(), inverting the required
> ordering between pte modificaiton and tlb maintenance.
>
> Let's fix that by leaving mmu mode, forcing all the pte updates to be
> actioned, before doing the tlb maintenance.
>
> This is a theorectical bug discovered during code review.
>
> Fixes: 52526ca7fdb9 ("fs/proc/task_mmu: implement IOCTL to get and option=
ally clear info about PTEs")

Hmm... isn't lazy mmu mode supposed to also delay TLB flushes, and
preserve the ordering of PTE modifications and TLB flushes?

Looking at the existing implementations of lazy MMU:

 - In Xen PV implementation of lazy MMU, I see that TLB flush
hypercalls are delayed as well (xen_flush_tlb(),
xen_flush_tlb_one_user() and xen_flush_tlb_multi() all use
xen_mc_issue(XEN_LAZY_MMU) which delays issuing if lazymmu is active).
 - The sparc version also seems to delay TLB flushes, and sparc's
arch_leave_lazy_mmu_mode() seems to do TLB flushes via
flush_tlb_pending() if necessary.
 - powerpc's arch_leave_lazy_mmu_mode() also seems to do TLB flushes.

Am I missing something?

If arm64 requires different semantics compared to all existing
implementations and doesn't delay TLB flushes for lazy mmu mode, I
think the "Fixes" tag should point to your addition of lazy mmu
support for arm64.

> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  fs/proc/task_mmu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index 994cde10e3f4..361f3ffd9a0c 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -2557,10 +2557,9 @@ static int pagemap_scan_pmd_entry(pmd_t *pmd, unsi=
gned long start,
>         }
>
>  flush_and_return:
> +       arch_leave_lazy_mmu_mode();
>         if (flush_end)
>                 flush_tlb_range(vma, start, addr);
> -
> -       arch_leave_lazy_mmu_mode();

I think this ordering was probably intentional, because doing it this
way around allows Xen PV to avoid one more hypercall, because the TLB
flush can be batched together with the page table changes?


>         pte_unmap_unlock(start_pte, ptl);
>
>         cond_resched();
> --
> 2.43.0
>

