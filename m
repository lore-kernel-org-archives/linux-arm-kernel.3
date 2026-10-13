Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C048ACA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 02:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPwxJwwUbsYmUjf0+QOdw7ObRSYifXqwx8YV7+AcyYY=; b=Emt9XmCRBC9PpDfWtX9+P9B7EH
	JE3uyPmVBbDcNzsPn/CshkdtD1TLTEUMB6hiZsJpvafODDEkECvbv1AUkdneKqryOBws9skp8fDqC
	4PDKKFp88JpGQWgX7kSGQ7p53yCtlmJbmI3vm0uoxXp7SBbFacKJOl1QxTGtxa4s+gJYbIV3WqggS
	bjS1i+X63jpaDUnQo+0c/yhUKe4K4AEceZLKnwlEu5gG1bWdKDj9+gaVF7VjYEEXs5m8Y5gtklkug
	r+YQfjI04TjRK7LAAEWf8aJNJ/3MRMHZXdFD2Y0T3/23Wt5Rzfb+KHiwFygM154HLgUH73uPgf5/F
	u0DahNsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGSbL-0000000BqAK-0zOk;
	Tue, 13 Oct 2026 02:50:51 +0000
Received: from out-45.mta1.migadu.com ([2001:41d0:203:375::2d] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGSbH-0000000Bq8q-3SXP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 02:50:49 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=8wMdqUD76bepHOzOME5xbGf9H6wBMPJCOauRyfPWxJE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791859845; v=1; x=1792464645;
 b=oNPtqFiXxOnTU0X6djyqNB5Ani+3gr1I6RXWS1BqRJvAY16ZMR4dOS8JM5773LU8YHIiFcjn
 Bv1zvPpk1o0kxvVbA+SeDa2/4LNFdl6no0YIWSlHSQSsaH5xf3Rwttgyrl7E+zB/DFCIZSlN+8C
 ChXlTFK6PauB81+RAz+tia2g=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a849ca26c8b26880;
	Tue, 13 Oct 2026 02:50:38 +0000
X-Mizu-Trace-ID: a849ca26c8b26880
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v2 1/4] mm: fix missing page-table destructor in
 pagetable_free()
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261012193114.77147e0a43affa8ee1ae896c@linux-foundation.org>
Date: Tue, 13 Oct 2026 10:50:21 +0800
Cc: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 Muchun Song <songmuchun@bytedance.com>,
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
Message-Id: <200A83B9-233C-44C7-B4AF-0900BA1E09DF@linux.dev>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
 <20261010112457.49485-2-songmuchun@bytedance.com>
 <asy-b7_C3SjnmSaS@gmail.com> <145CD5DC-6457-4E1E-8B9D-AE7D1EDB0AB8@linux.dev>
 <20261012193114.77147e0a43affa8ee1ae896c@linux-foundation.org>
To: Andrew Morton <akpm@linux-foundation.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_195048_095404_2DCB3376 
X-CRM114-Status: GOOD (  17.98  )
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



> On Oct 13, 2026, at 10:31, Andrew Morton <akpm@linux-foundation.org> =
wrote:
>=20
> On Mon, 12 Oct 2026 20:55:06 +0800 Muchun Song <muchun.song@linux.dev> =
wrote:
>=20
>>=20
>>=20
>>> On Oct 12, 2026, at 19:15, Jose A. Perez de Azpillaga =
<azpijr@gmail.com> wrote:
>>>=20
>>> On Sat, Oct 10, 2026 at 07:24:54PM +0800, Muchun Song wrote:
>>>> Since commit 49f599666420 ("mm: call ctor/dtor for kernel PTEs"),
>>>> pte_alloc_one_kernel() runs the page-table constructor for kernel =
PTE
>>>> tables.
>>>>=20
>>>> HVO (HugeTLB Vmemmap Optimization) uses pte_alloc_one_kernel() when
>>>> splitting a PMD. Restoring the vmemmap backing pages does not =
collapse
>>>> the PTE table, so a later memory hot-remove eventually frees it =
through
>>>> pagetable_free() on x86-64. That releases the page without running =
the
>>>> matching destructor and leaves NR_PAGETABLE elevated.
>>>>=20
>>>> Make pagetable_free() detect constructor-backed pages and run the
>>>> destructor before releasing their memory to fix the problem.
>>>>=20
>>>> Fixes: 49f599666420 ("mm: call ctor/dtor for kernel PTEs")
>>>> Cc: stable@vger.kernel.org
>>>=20
>>> is the x86 case covered for 6.16-6.18? as far as I can see, x86
>>> free_pagetable() only uses pagetable_free() since bf9e4e30f353
>>> ("x86/mm: use pagetable_free()") in v6.19, so the backport wouldn't
>>> change anything there. or am I missing something?
>>=20
>> Yes, you are absolutely right =E2=80=94 thanks for catching this.
>>=20
>> I double-checked and indeed x86's free_pagetable() only starts using
>> pagetable_free() since bf9e4e30f353 ("x86/mm: use pagetable_free()"),
>> which landed in v6.19. So for 6.16-6.18 the prerequisite is not =
present
>> and the backport would be a no-op there.
>>=20
>> The correct trailer is:
>>=20
>> Cc: <stable@vger.kernel.org> # 6.16-6.18: bf9e4e30f353: x86/mm: use =
pagetable_free()
>>=20
>> Andrew, would you be able to update the trailer in the patch when you
>> pick it up? If there are further review comments that require code
>> changes, I'll fix this trailer as part of the v3 respin. Thanks a =
lot!
>=20
> I don't know if/how the -stable maintainers handle a comment like =
that.
> I expect it's more reliable to do this via Fixes:.  Possible?
>=20

Thanks. I used this format because it is explicitly documented by the
stable kernel rules.

The shell-style comment is the format documented in
Documentation/process/stable-kernel-rules.rst for specifying additional
patch prerequisites:

  Cc: <stable@vger.kernel.org> # 3.3.x: <commit>: <subject>
  Cc: <stable@vger.kernel.org> # 3.3.x

See:

  https://docs.kernel.org/process/stable-kernel-rules.html#option-1

A Fixes tag alone cannot express this dependency. It does not specify
an additional commit that must be cherry-picked first. The documented
Cc comment provides both the prerequisite and the required cherry-pick
order.

Would this be sufficient for the stable team to pick up the =
prerequisite?

Thanks,
Muchun



