Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC64CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 09:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mcRDTEAbzquuDlXqMd0IqQmK0PoHGGByotq3KkqD9LA=; b=xdw+qnozf5wIJexd87wmcUYuRb
	Z7tTMylzZ+wixX7DNVICA7RblURopA/es/NYG/4cpJoAAEGrPMXS3axxz89QvG7Cm253OYsYT98HX
	14RDnbHz8LnJwoVZ5D3bLWKJYPPNaCU/cHsB40UzzTsV8jnXk8OCC0Jiaw+KQENHs90zRVWE3ZA6K
	cHd9KWDre2V+xTf3sRy0vcKS7s1nFJDgQSbOcc0XnHiPcaZVS3ycxgSzdHm3TagkxOxrl/IfUD5hi
	vELmM3hj8nEExvu6q063I/GKk3oXA7YhBb2BkNO91M82WX2TRkCNTuZ9Up5K72kcl2ac9f9h3gxv5
	qioVy98A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUjQ-00000002ArB-2XGH;
	Wed, 22 Oct 2025 09:02:08 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUjO-00000002Aqb-0yaX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 09:02:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1761123724; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=mcRDTEAbzquuDlXqMd0IqQmK0PoHGGByotq3KkqD9LA=;
	b=nqQHAVnBGfa83IiGGCHU0HOuH7EAaToIgZ6y1+wk0Iz1Utj43ybNWCMHG3Az8QE66YaGxzaZ0sik/EopUNuUGFpF0si1uKgMVXHeD3JXW6HwdQ0VQQOU8sJSviTpvI4KttOxU+geoWvoPJ9C4C4PnHXI+iwWMTiL6QIjfY5S1Xc=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WqmBveP_1761123720 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 22 Oct 2025 17:02:01 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Barry Song <21cnbao@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,  Will Deacon
 <will@kernel.org>,  Andrew Morton <akpm@linux-foundation.org>,  David
 Hildenbrand <david@redhat.com>,  Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>,  Vlastimil Babka <vbabka@suse.cz>,  Zi Yan
 <ziy@nvidia.com>,  Baolin Wang <baolin.wang@linux.alibaba.com>,  Ryan
 Roberts <ryan.roberts@arm.com>,  Yang Shi <yang@os.amperecomputing.com>,
  "Christoph Lameter (Ampere)" <cl@gentwo.org>,  Dev Jain
 <dev.jain@arm.com>,  Anshuman Khandual <anshuman.khandual@arm.com>,
  Yicong Yang <yangyicong@hisilicon.com>,  Kefeng Wang
 <wangkefeng.wang@huawei.com>,  Kevin Brodsky <kevin.brodsky@arm.com>,  Yin
 Fengwei <fengwei_yin@linux.alibaba.com>,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-mm@kvack.org
Subject: Re: [PATCH -v2 2/2] arm64, tlbflush: don't TLBI broadcast if page
 reused in write fault
In-Reply-To: <CAGsJ_4zPH0fwBOLQwh1y6jG3tCXHLGRCTyVVSCWb+NfLCEMV0Q@mail.gmail.com>
	(Barry Song's message of "Wed, 22 Oct 2025 21:14:48 +1300")
References: <20251013092038.6963-1-ying.huang@linux.alibaba.com>
	<20251013092038.6963-3-ying.huang@linux.alibaba.com>
	<CAGsJ_4xaA8QRjP9H=n1hQfEfGop7vOd5Y=J+KQzuOyfa8GK-kQ@mail.gmail.com>
	<87a51jfl44.fsf@DESKTOP-5N7EMDA>
	<CAGsJ_4zPH0fwBOLQwh1y6jG3tCXHLGRCTyVVSCWb+NfLCEMV0Q@mail.gmail.com>
Date: Wed, 22 Oct 2025 17:02:00 +0800
Message-ID: <871pmv9unr.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_020206_456981_AC3F86E3 
X-CRM114-Status: GOOD (  16.16  )
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

Barry Song <21cnbao@gmail.com> writes:

>> >
>> > static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
>> >                                            unsigned long uaddr)
>> > {
>> >         unsigned long addr;
>> >
>> >         dsb(ishst);
>> >         addr =3D __TLBI_VADDR(uaddr, ASID(mm));
>> >         __tlbi(vale1is, addr);
>> >         __tlbi_user(vale1is, addr);
>> >         mmu_notifier_arch_invalidate_secondary_tlbs(mm, uaddr & PAGE_M=
ASK,
>> >                                                 (uaddr & PAGE_MASK) +
>> > PAGE_SIZE);
>> > }
>>
>> IIUC, _nosync() here means doesn't synchronize with the following code.
>> It still synchronizes with the previous code, mainly the page table
>> changing.  And, Yes.  There may be room to improve this.
>>
>> > On the other hand, __ptep_set_access_flags() doesn=E2=80=99t seem to u=
se
>> > set_ptes(), so there=E2=80=99s no guarantee the updated PTEs are visib=
le to all
>> > cores. If a remote CPU later encounters a page fault and performs a TLB
>> > invalidation, will it still see a stable PTE?
>>
>> I don't think so.  We just flush local TLB in local_flush_tlb_page()
>> family functions.  So, we only needs to guarantee the page table changes
>> are available for the local page table walking.  If a page fault occurs
>> on a remote CPU, we will call local_flush_tlb_page() on the remote CPU.
>>
>
> My concern is that:
>
> We don=E2=80=99t have a dsb(ish) to ensure the PTE page table is visible =
to remote
> CPUs, since you=E2=80=99re using dsb(nsh). So even if a remote CPU perfor=
ms
> local_flush_tlb_page(), the memory may not be synchronized yet, and it co=
uld
> still see the old PTE.

So, do you think that after the load/store unit of the remote CPU have
seen the new PTE, the page table walker could still see the old PTE?  I
doubt it.  Even if so, the worse case is one extra spurious page fault?
If the possibility of the worst case is low enough, that should be OK.

Additionally, the page table lock is held when writing PTE on this CPU
and re-reading PTE on the remote CPU.  That provides some memory order
guarantee too.

---
Best Regards,
Huang, Ying

