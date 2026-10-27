Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BE5606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 16:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3o4n7xbv;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bbsz9qDk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kAcnFFHoGCaLIkdfu6vQlgxivqnlgRGe6B2VS1ojrEM=; b=3o4n7xbv7FoXhNfJCig8yNYBlK
	sqfjRQ2727aY5Z9Em+SahUOmomnLVgW/o9EKcR1PWT3MmSr+vxEVWW47AK+mrobYQMw/45iNQvGVn
	+1Yuf6A6AzF+SZfhuzQNLRIT4Vsqj65dVd3BxHPB5twyvsMqwsnRsIwMYF63eLOCdkoINoPA+Sa60
	fztFBO/9mUdYmak1+z2derYCSnZ4f+vPIhCn0eIfJxYt/VAUyX/GjiZQQzUdQVSlw11gCGMEOsO0U
	tC2QtokDwco9BENUpHCOUh7EDK3doNfbIGo/Rv0WppznvohtV5yPGqB6rrKX3nUf6Iym6ABxGZtVC
	S6Gaom+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLk3L-00000005MX4-17EZ;
	Tue, 27 Oct 2026 16:29:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLk3K-00000005MWt-1c7D;
	Tue, 27 Oct 2026 16:29:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E6824183F;
	Tue, 27 Oct 2026 16:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F061F01828;
	Tue, 27 Oct 2026 16:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793118573;
	bh=kAcnFFHoGCaLIkdfu6vQlgxivqnlgRGe6B2VS1ojrEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bbsz9qDkyDs8H77dSEWFVVoSrMeEk+WXm5r3OPWiNyeYoBpxmsOCn5CmGtRqVetHo
	 mcFkRLPNplY4m3ig1H1ERqm+PaSGY5Qy91L8YocM14s/zdxHBU39CJJs+LR0NjqRUy
	 HYaZ+qVnsrkUB90AOxXitaTHRIDzbW2nZQKAt2axcvSGr90/Ecy4aiZxxfFFZPczPN
	 a6bkSOpR33GdMYXlejOZDAznosukKn1HJsw8fzq1fezE3Gnm3ptrKyXX0qKJZIsYvz
	 +AJX6Eljxg3TrZYEEkkyIT2+mZGLlRxnvv9SjcB2Q0e4+EvEqvROnMfyR4IutR6Tvb
	 hVXHbkO+pwc3A==
Date: Tue, 27 Oct 2026 16:29:21 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Barry Song <baohua@kernel.org>, Hongru Zhang <zhanghongru06@gmail.com>, 
	akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	surenb@google.com, david@kernel.org, liam@infradead.org, mhocko@suse.com, 
	rppt@kernel.org, shakeel.butt@linux.dev, vbabka@kernel.org, zhaonanzhe@xiaomi.com, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, chenhuacai@kernel.org, kernel@xen0n.name, 
	loongarch@lists.linux.dev, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, linuxppc-dev@lists.ozlabs.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com, 
	hca@linux.ibm.com, gor@linux.ibm.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, linux-s390@vger.kernel.org, dave.hansen@linux.intel.com, 
	luto@kernel.org, peterz@infradead.org, tglx@kernel.org, mingo@redhat.com, 
	bp@alien8.de, x86@kernel.org, hpa@zytor.com, 
	Hongru Zhang <zhanghongru@xiaomi.com>
Subject: Re: [PATCH v6] mm: retry page faults once under the per-VMA lock
Message-ID: <auDRAEofBdqZy36y@gremlin>
References: <20260911025613.1220845-1-zhanghongru@xiaomi.com>
 <arFYRAa-i7CIwmHL@gremlin>
 <arF-E3Nsw9ZliH0t@casper.infradead.org>
 <arI_w2wTfA00Mgy9@gremlin>
 <armexcXDiG8ryZd6@casper.infradead.org>
 <CAGsJ_4xuFi7K+crAcFQ998SxXS0xPM6QeA34JV+6+Sy005rXLg@mail.gmail.com>
 <ar7MsOb6IJLt4eLo@casper.infradead.org>
 <ar-o1TrOMGrrcxLX@gremlin>
 <ataDTEZIKOYtwhUF@casper.infradead.org>
 <auDGPs8jzC-90-_y@gremlin>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auDGPs8jzC-90-_y@gremlin>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 04:26:39PM +0000, Lorenzo Stoakes (ARM) wrote:
>
> Thread A (Parent)          | Thread B (Parent)       | Thread C (Parent)
> ---------------------------|-------------------------|----------------------
> < Fork >                   |                         | < has TLB entry >
> copy_present_ptes()        | < no TLB entry >        |
>   wrprotect parent page X  |                         |
>   -> 2 mappings, refs      | *ptr = x                |
>                            | < Page fault >          |
>                            | do_wp_page()            |
>                            |   < shared, so CoW >    |
>                            |   wp_page_copy()        |
>                            |     copy X -> new pg N  |
>                            |                         | *ptr = x;
>                            |                         | [ OOPS! stale TLB,
>                            |                         |   lands in X not N ]
>                            |     ptep_clear_flush()  |
>                            |       < TLB flush >     |
>                            |     parent PTE -> N     |
>                            |     [ X now child-only ]|
>                            |                         | ASSERT(*ptr == x);
> flush_tlb_mm(oldmm)        |                         | // fails! N lacks x
>   < far too late >         |                         |
>

Sigh, I drew this entirely manually, then had the LLM overlords 'correct' it,
but it also made it less clear :).

Thread C ends up writing to what-becomes-the-child-page X, whereas the parent
ends up with page N after CoW.

So a thread in the parent writes to a page of ordinary memory and then it
disappears under them, and the child ends up with corruption in their page.

--
Cheers, Lorenzo

