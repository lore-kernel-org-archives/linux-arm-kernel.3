Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CC6C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 14:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+bwpuTRptvyCO3bOxQYXi/J+49Jig0wU9FV1VYgk1U=; b=1Zv1KT9uPB9IpJkTz9l6NFBOJ8
	XpHrA6zmaPQ+DKES4AYyOSDbA8uP50kDl9fFmyof6A/uJ7L3yeN4PfQGKGCSQyMDyfdNaGaQ44Vpe
	lXopNtY79+1yYQkFFh3Ld/62P7F4KoBOs82B0+C7sTSs0QezQgafwexGT083vM7HmpqOHjt/PSWWZ
	bqmONsxQtl5v7Z0aAYRSc4moqHCCUun1mOX0seNnh2Xufj9fh6gVy5dcRq4CNE8FmPEJZYHNnwcxI
	zLqCl87yeG3jIvrjtq7Etxs0EZsXK8VSmd1aZO7CxLB2evUcQ/4yaXVM2Wu5yiO9IHik+/sjVDcc8
	at7MBM+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0PX-0000000F5da-1iKU;
	Wed, 15 Jul 2026 14:16:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0PW-0000000F5dP-09KJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 14:16:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B002D42A18;
	Wed, 15 Jul 2026 14:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 179E91F000E9;
	Wed, 15 Jul 2026 14:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784124989;
	bh=t+bwpuTRptvyCO3bOxQYXi/J+49Jig0wU9FV1VYgk1U=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=LRTh16mRsy/c1BfJrXztagTLiF6iwreCzUL+HMeDfNjLTGE+v0MTqoHM8/94eqABY
	 N+4rtgZL0EhbYK5cAWGP8gj1ZAFr8ysQnUg3LJ1PmoX2SySSt09D3L2ijTv/4nXxuR
	 4LDqQrY4WGX8Sm/idsfK4IcTNLzYVepREK/kdWMk38B1xyBvHKg+MdYQDRQF14bs45
	 jul3NIZI0mB8QJhljbpCxZSix9msf8uYy+MmNt65ImY7LaGLv/N9lIzfEszPHiiEtr
	 Acq2DWAV0AppoRiInvJeAEKS8BHpzof/0gBMpYFlWjlydAXfZwQxHBKZTGLZ8EgTm/
	 CUv8LK3VaELxw==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH mm-hotfixes v3 1/4] mm/vmalloc: acquire init_mm lock on
 huge vmap to avoid ptdump UAF
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Toshi Kani <toshi.kani@hpe.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Dev Jain <dev.jain@arm.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, David Carlier <devnexen@gmail.com>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
 syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
In-Reply-To: <aldhVdwj9oMRN1Lk@thinkstation>
References: <20260714-series-vmap-race-fix-v3-0-b812eccfa0f9@kernel.org>
 <20260714-series-vmap-race-fix-v3-1-b812eccfa0f9@kernel.org>
 <aldhVdwj9oMRN1Lk@thinkstation>
Date: Wed, 15 Jul 2026 15:16:08 +0100
Message-Id: <178412496800.59347.11482869717348078349.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1974; i=ljs@kernel.org;
 h=from:subject:message-id; bh=pGwB/bTHOs2/inH07hoVPtuuEgBzmNSQea1pphRCakw=;
 b=kA0DAAoWz53NioHifxQByyZiAGpXlimhljcAvWKWFrIOS3sEzEn8GxUJs2S9+ijUshZ0yWDKX
 oh1BAAWCgAdFiEE5/QXv1IUVp6J0E9Gz53NioHifxQFAmpXlikACgkQz53NioHifxSp3QD/TBV5
 Z46e/1R1KuwDd9I5f4zeXSY2PL7Lfd/HyDWWJhEA/2/77m0B36Vzye1+PL6ojrs5HOdPpWBBkzu
 ZANDfPtQA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
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

On 2026-07-15 11:34 +0100, Kiryl Shutsemau wrote:
> On Tue, Jul 14, 2026 at 06:24:23PM +0100, Lorenzo Stoakes wrote:
> > Currently there is a nasty race between ptdump and vmap when attempting to
> > map a huge P4D, PMD or PUD entry:
>
> Nit: that's a strange order of levels :P

Ha, seems I couldn't decide on ordering so went with something random :P

Let's try 'P4D, PUD or PMD' instead :))

>
> > Fix this by holding the mmap read lock in vmap_try_huge_*() when freeing
> > page tables.
>
> How about adding here something like:
>
>   The read lock is sufficient: ptdump is the only walker that must be
>   excluded and it holds the mmap write lock. Other holders of the read
>   lock may run concurrently, but each exclusively owns the range it
>   operates on and cannot reach the page tables freed here.

You mean maybe I put the commit message on _too_ much of a diet? :)

Yeah sure, sounds good.

>
> > +	/*
> > +	 * Kernel page table walkers either walk ranges they own exclusively or
> > +	 * hold the mmap write lock on init_mm (ptdump being the motivating
> > +	 * case).
> > +	 *
> > +	 * Therefore, acquire the mmap read lock to prevent use-after-free when
> > +	 * freeing page tables.
> > +	 */
>
> Same for the comment, maybe:
>
>       /*
>        * Acquire the mmap read lock to exclude ptdump, which walks
>        * kernel page tables it does not own under the mmap write lock.
+	 *
>        * Concurrent read lock holders are safe: each exclusively owns
>        * the range it operates on and cannot reach this page table.
>        */

Yeah that's better agreed.

Let's replace it, but I think (being super nitty) with an extra blank line as
above.

>
> With that:
>
> Reviewed-by: Kiryl Shutsemau <kas@kernel.org>

Thanks!

>
> --
>   Kiryl Shutsemau / Kirill A. Shutemov
>

Andrew - could you fix the commit message and the comment as above? Can respin
if needed.

Thanks, Lorenzo


