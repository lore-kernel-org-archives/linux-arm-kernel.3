Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17C5CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 02:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=neF1X1SW8f+CZ9aYnUdm8uqTfZ53Y+iDZ67qd/EFbto=; b=4tKfZ/YTg0GfTwBhpgeQuNYVnG
	IZ7AmOZfyw0HA0sG5xVR9N5uILmSFbWc04HrEwJ1XxrplEwgHqg5AFBunixNn6mUkuOTz2bLoCrov
	L/2wbfX5w5T4656VebdwHuFXeoLIvdyBIulxMlvNoV8ez8AmxLB0c1RXEdBHCsBnSXh8/5Tm5K0Pl
	g6ipBDHki5w4XVwy5XqfL+wOnhjaXerzKrIDI0oeoh5GHfpcahe+AfLKfixd9Wg4qpBt1HnX7eI9x
	QQ3IFWspGiLkepeIVl+8O0ivMzIKDimvyxakq8dDu5UWx8o87Nw6Q1Fc3gFslxNfApnbZXYKFkHmF
	pw4iSB3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGSIQ-0000000BnuT-18kE;
	Tue, 13 Oct 2026 02:31:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGSIO-0000000BnuA-3BZK;
	Tue, 13 Oct 2026 02:31:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 84E03405C7;
	Tue, 13 Oct 2026 02:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3AE01F00893;
	Tue, 13 Oct 2026 02:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1791858675;
	bh=neF1X1SW8f+CZ9aYnUdm8uqTfZ53Y+iDZ67qd/EFbto=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ex3bO/Fc0+ngjO39stCKwVk9Hhrd7Rifhq8ICQiBsfVb3HzvVvtZSrGzLxkxqd+0U
	 VLhJbkRlvRhudx0ySSyQeBPTjSDeHdu/kDYU/bsXoTKFOYkEV6o2q2M5XgxrDd31WQ
	 PGabwoaz3EcC7qUr+ttZxY9i9xXwWCFmuR7C0n1Q=
Date: Mon, 12 Oct 2026 19:31:14 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Muchun Song <muchun.song@linux.dev>
Cc: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, Muchun Song
 <songmuchun@bytedance.com>, David Hildenbrand <david@kernel.org>, Oscar
 Salvador <osalvador@suse.de>, Dave Hansen <dave.hansen@intel.com>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?Qmo=?=
 =?UTF-8?B?w7ZybiBUw7ZwZWw=?= <bjorn@rivosinc.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Alistair Popple <apopple@nvidia.com>,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] mm: fix missing page-table destructor in
 pagetable_free()
Message-Id: <20261012193114.77147e0a43affa8ee1ae896c@linux-foundation.org>
In-Reply-To: <145CD5DC-6457-4E1E-8B9D-AE7D1EDB0AB8@linux.dev>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
	<20261010112457.49485-2-songmuchun@bytedance.com>
	<asy-b7_C3SjnmSaS@gmail.com>
	<145CD5DC-6457-4E1E-8B9D-AE7D1EDB0AB8@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On Mon, 12 Oct 2026 20:55:06 +0800 Muchun Song <muchun.song@linux.dev> wrote:

> 
> 
> > On Oct 12, 2026, at 19:15, Jose A. Perez de Azpillaga <azpijr@gmail.com> wrote:
> > 
> > On Sat, Oct 10, 2026 at 07:24:54PM +0800, Muchun Song wrote:
> >> Since commit 49f599666420 ("mm: call ctor/dtor for kernel PTEs"),
> >> pte_alloc_one_kernel() runs the page-table constructor for kernel PTE
> >> tables.
> >> 
> >> HVO (HugeTLB Vmemmap Optimization) uses pte_alloc_one_kernel() when
> >> splitting a PMD. Restoring the vmemmap backing pages does not collapse
> >> the PTE table, so a later memory hot-remove eventually frees it through
> >> pagetable_free() on x86-64. That releases the page without running the
> >> matching destructor and leaves NR_PAGETABLE elevated.
> >> 
> >> Make pagetable_free() detect constructor-backed pages and run the
> >> destructor before releasing their memory to fix the problem.
> >> 
> >> Fixes: 49f599666420 ("mm: call ctor/dtor for kernel PTEs")
> >> Cc: stable@vger.kernel.org
> > 
> > is the x86 case covered for 6.16-6.18? as far as I can see, x86
> > free_pagetable() only uses pagetable_free() since bf9e4e30f353
> > ("x86/mm: use pagetable_free()") in v6.19, so the backport wouldn't
> > change anything there. or am I missing something?
> 
> Yes, you are absolutely right — thanks for catching this.
> 
> I double-checked and indeed x86's free_pagetable() only starts using
> pagetable_free() since bf9e4e30f353 ("x86/mm: use pagetable_free()"),
> which landed in v6.19. So for 6.16-6.18 the prerequisite is not present
> and the backport would be a no-op there.
> 
> The correct trailer is:
> 
> Cc: <stable@vger.kernel.org> # 6.16-6.18: bf9e4e30f353: x86/mm: use pagetable_free()
> 
> Andrew, would you be able to update the trailer in the patch when you
> pick it up? If there are further review comments that require code
> changes, I'll fix this trailer as part of the v3 respin. Thanks a lot!

I don't know if/how the -stable maintainers handle a comment like that.
I expect it's more reliable to do this via Fixes:.  Possible?


