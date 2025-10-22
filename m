Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC52CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 09:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZHxml0O18Vg7HUA3QwmCPVMku0Lb676UdH10r5wy0U=; b=XqJfqCoIrVE4noQ4bZKXx3yRD8
	T/lugjUmiyXmwJU6Rs3bQTOL9Es7nUlJw/9ZiuH67mcQcUDzxIfajnJlXCv9Vo5dltcU6jLSZ8EOf
	EBypoN/fU8YgEXpo6BHXsd2UD2KDEs9+8PnwNrbRSWGQZNmwifp7GUgSCyr1AZ6KJb+iY4uRzmGZZ
	4f7xDITwFGZ54unLaU6OeHUSHvUMmqLs9bmIkUCVRFQjcpiVb8OjSj0eKCT3y69Pg8rn1ne9k15zO
	HK4QbYpNC60r2rMTK997dN5A6eNfsqmF41eHDGKj14/rqBpjMqUQl0VY5ShMe1BXTgjnOvpnbp2Rd
	WtMrXyvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVAw-00000002Gmq-3Ux1;
	Wed, 22 Oct 2025 09:30:34 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVAt-00000002Glq-1ou2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 09:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1761125428; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=mZHxml0O18Vg7HUA3QwmCPVMku0Lb676UdH10r5wy0U=;
	b=R1UJnbxSC6winO8xKpN7UoXyrhe8uR+hx3QnUbS+YPO+Z8jLR4DHU4m7VcWwbRBq0nq1oTs6rCPhN0MowyeFOqLSgbZ80xgllrfzPT0mazPcTya67RBNSWEVZOFOWi3nVzDXq25bzQfL/0Wa8hXsr2RXRMjZ7dFEQTc6HPSa5Js=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WqmQxuR_1761125423 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 22 Oct 2025 17:30:24 +0800
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
In-Reply-To: <CAGsJ_4zW6ogVdi=t9JCuvGD9N21mA_ORXRCakw4Av68d9n+DDw@mail.gmail.com>
	(Barry Song's message of "Wed, 22 Oct 2025 22:17:56 +1300")
References: <20251013092038.6963-1-ying.huang@linux.alibaba.com>
	<20251013092038.6963-3-ying.huang@linux.alibaba.com>
	<CAGsJ_4xaA8QRjP9H=n1hQfEfGop7vOd5Y=J+KQzuOyfa8GK-kQ@mail.gmail.com>
	<87a51jfl44.fsf@DESKTOP-5N7EMDA>
	<CAGsJ_4zPH0fwBOLQwh1y6jG3tCXHLGRCTyVVSCWb+NfLCEMV0Q@mail.gmail.com>
	<871pmv9unr.fsf@DESKTOP-5N7EMDA>
	<CAGsJ_4zW6ogVdi=t9JCuvGD9N21mA_ORXRCakw4Av68d9n+DDw@mail.gmail.com>
Date: Wed, 22 Oct 2025 17:30:23 +0800
Message-ID: <875xc78es0.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_023032_081965_21710A53 
X-CRM114-Status: GOOD (  22.33  )
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

> On Wed, Oct 22, 2025 at 10:02=E2=80=AFPM Huang, Ying
> <ying.huang@linux.alibaba.com> wrote:
>>
>> Barry Song <21cnbao@gmail.com> writes:
>>
>> >> >
>> >> > static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
>> >> >                                            unsigned long uaddr)
>> >> > {
>> >> >         unsigned long addr;
>> >> >
>> >> >         dsb(ishst);
>> >> >         addr =3D __TLBI_VADDR(uaddr, ASID(mm));
>> >> >         __tlbi(vale1is, addr);
>> >> >         __tlbi_user(vale1is, addr);
>> >> >         mmu_notifier_arch_invalidate_secondary_tlbs(mm, uaddr & PAG=
E_MASK,
>> >> >                                                 (uaddr & PAGE_MASK)=
 +
>> >> > PAGE_SIZE);
>> >> > }
>> >>
>> >> IIUC, _nosync() here means doesn't synchronize with the following cod=
e.
>> >> It still synchronizes with the previous code, mainly the page table
>> >> changing.  And, Yes.  There may be room to improve this.
>> >>
>> >> > On the other hand, __ptep_set_access_flags() doesn=E2=80=99t seem t=
o use
>> >> > set_ptes(), so there=E2=80=99s no guarantee the updated PTEs are vi=
sible to all
>> >> > cores. If a remote CPU later encounters a page fault and performs a=
 TLB
>> >> > invalidation, will it still see a stable PTE?
>> >>
>> >> I don't think so.  We just flush local TLB in local_flush_tlb_page()
>> >> family functions.  So, we only needs to guarantee the page table chan=
ges
>> >> are available for the local page table walking.  If a page fault occu=
rs
>> >> on a remote CPU, we will call local_flush_tlb_page() on the remote CP=
U.
>> >>
>> >
>> > My concern is that:
>> >
>> > We don=E2=80=99t have a dsb(ish) to ensure the PTE page table is visib=
le to remote
>> > CPUs, since you=E2=80=99re using dsb(nsh). So even if a remote CPU per=
forms
>> > local_flush_tlb_page(), the memory may not be synchronized yet, and it=
 could
>> > still see the old PTE.
>>
>> So, do you think that after the load/store unit of the remote CPU have
>> seen the new PTE, the page table walker could still see the old PTE?  I
>
> Without a barrier in the ish domain, remote CPUs=E2=80=99 load/store unit=
s may not
> see the new PTE written by the first CPU performing the reuse.
>
> That=E2=80=99s why we need a barrier in the ish domain to ensure the PTE =
is
> actually visible across the SMP domain. A store instruction doesn=E2=80=
=99t guarantee
> that the data is immediately visible to other CPUs =E2=80=94 at least not=
 for load
> instructions.
>
> Though, I=E2=80=99m not entirely sure about the page table walker case.
>
>> doubt it.  Even if so, the worse case is one extra spurious page fault?
>> If the possibility of the worst case is low enough, that should be OK.
>
> CPU0:                    CPU1:
>
> write pte;
>
> do local tlbi;
>
>                                        page fault;
>                                        do local tlbi; -> still old PTE
>
> pte visible to CPU1

With PTL, this becomes

CPU0:                           CPU1:

page fault                      page fault
lock PTL
write PTE
do local tlbi
unlock PTL
                                lock PTL        <- pte visible to CPU 1
                                read PTE        <- new PTE
                                do local tlbi   <- new PTE
                                unlock PTL

>> Additionally, the page table lock is held when writing PTE on this CPU
>> and re-reading PTE on the remote CPU.  That provides some memory order
>> guarantee too.
>
> Right, the PTL might take care of it automatically.

---
Best Regards,
Huang, Ying

