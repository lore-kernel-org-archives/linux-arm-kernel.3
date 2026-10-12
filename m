Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DC8CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 12:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVdDm9vWio9URlOBbk5H1FhupUhm6ZtZOBzYo8Bfqf8=; b=Ib3J98HKsfNuV25de/+cM4sETn
	4H3Ez9T0Gn7OyTiqgcrvG7V1jnm73RXSasQwO0B5Ha8kgmATkZWSuo+D4I/XUdRuO/fmaluo8fEZ2
	o5XMEpDQ/trUhoVINaNsb947qIqTf58xck4Rv+p7XyiB8A47M4cfXLongAxvYx6+epWWiTxQ0j3/A
	TZ8FZHI+lL2l0CI0IwfyYjoKRupcS1Wl+pOehuhpnt33KLxnZ8Bes8HcvPKaQNq0ZJrbS5dgrWPYH
	xIWPB8TgBsavkWDIDgZBfSjfdMmLmTELXBC0HoWScmTuQ5p0UsB7QctxbnnWb1Ypk6gjQxXU4pIzu
	1ms3FLxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGFZQ-0000000AVZY-2yZx;
	Mon, 12 Oct 2026 12:56:00 +0000
Received: from out-231.mta0.migadu.com ([2001:41d0:1004:224b::e7] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGFZM-0000000AVYX-2JHF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 12:55:59 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=zVdDm9vWio9URlOBbk5H1FhupUhm6ZtZOBzYo8Bfqf8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791809753; v=1; x=1792414553;
 b=ufS1I3M5aothCcthsy/xGLEP7GopEqLUdj3dCIjUNle5smXzCvINeqPu/XFmzF9vRWAL+vZQ
 nZ4kHMvNO8iEk4uBeIU0IBE24b5yKbtKklxi2AdDrWqq3N+Qn7wzY5cncLZNdAbosUm/OUJ0WWz
 jQAwg581TweGyapJzVZOWLo8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta11.migadu.com with ESMTPS id 018eb001ca5c019a;
	Mon, 12 Oct 2026 12:55:25 +0000
X-Mizu-Trace-ID: 018eb001ca5c019a
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v2 1/4] mm: fix missing page-table destructor in
 pagetable_free()
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <asy-b7_C3SjnmSaS@gmail.com>
Date: Mon, 12 Oct 2026 20:55:06 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Dave Hansen <dave.hansen@intel.com>,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alistair Popple <apopple@nvidia.com>,
 linux-mm@kvack.org,
 linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <145CD5DC-6457-4E1E-8B9D-AE7D1EDB0AB8@linux.dev>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
 <20261010112457.49485-2-songmuchun@bytedance.com>
 <asy-b7_C3SjnmSaS@gmail.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_055557_197387_56DBE411 
X-CRM114-Status: GOOD (  14.27  )
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



> On Oct 12, 2026, at 19:15, Jose A. Perez de Azpillaga =
<azpijr@gmail.com> wrote:
>=20
> On Sat, Oct 10, 2026 at 07:24:54PM +0800, Muchun Song wrote:
>> Since commit 49f599666420 ("mm: call ctor/dtor for kernel PTEs"),
>> pte_alloc_one_kernel() runs the page-table constructor for kernel PTE
>> tables.
>>=20
>> HVO (HugeTLB Vmemmap Optimization) uses pte_alloc_one_kernel() when
>> splitting a PMD. Restoring the vmemmap backing pages does not =
collapse
>> the PTE table, so a later memory hot-remove eventually frees it =
through
>> pagetable_free() on x86-64. That releases the page without running =
the
>> matching destructor and leaves NR_PAGETABLE elevated.
>>=20
>> Make pagetable_free() detect constructor-backed pages and run the
>> destructor before releasing their memory to fix the problem.
>>=20
>> Fixes: 49f599666420 ("mm: call ctor/dtor for kernel PTEs")
>> Cc: stable@vger.kernel.org
>=20
> is the x86 case covered for 6.16-6.18? as far as I can see, x86
> free_pagetable() only uses pagetable_free() since bf9e4e30f353
> ("x86/mm: use pagetable_free()") in v6.19, so the backport wouldn't
> change anything there. or am I missing something?

Yes, you are absolutely right =E2=80=94 thanks for catching this.

I double-checked and indeed x86's free_pagetable() only starts using
pagetable_free() since bf9e4e30f353 ("x86/mm: use pagetable_free()"),
which landed in v6.19. So for 6.16-6.18 the prerequisite is not present
and the backport would be a no-op there.

The correct trailer is:

Cc: <stable@vger.kernel.org> # 6.16-6.18: bf9e4e30f353: x86/mm: use =
pagetable_free()

Andrew, would you be able to update the trailer in the patch when you
pick it up? If there are further review comments that require code
changes, I'll fix this trailer as part of the v3 respin. Thanks a lot!

Thanks,
Muchun


