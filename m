Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390B0CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 10:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zApZp8kIsLL8CaVDud/rM1l2bNSLJbbDdobxbcxNIAk=; b=acy+4RyOSPHm80ow27AfVKuSKr
	mpDRFiQxSI7o/KvySo8zyQPZbeUyfcxAOWGNz6JpPOyIoJLYMIcLJEdtpu4kE22gHhvnaIKr0a3mX
	2OWXdzs1JnGXJFs7MWSqXPqh2grc/K4TVqQFOwwiMTy7f9TPrVyMu10a1wYqwTGYo3ITZynqFGDs4
	f1hknEfJ1VzKfxHWVexADpHObUSDAjYx11BZe4KlWA+ad6M0cFI5YHIww5eK4Q3JUJA0J0KxR5YaH
	UEza7RWap7RxjO75bZgVVdLIPJIJ9SrC/MAOIpi9eR2YEeFxobjLKz5pLJwRi1/emaOCwkDXAtS5d
	SqH273jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBWAx-00000002Vkl-0V53;
	Wed, 22 Oct 2025 10:34:39 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBWAn-00000002Vg9-0r2f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 10:34:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1761129264; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=zApZp8kIsLL8CaVDud/rM1l2bNSLJbbDdobxbcxNIAk=;
	b=xsYsuZV938cITXYtw7bbfKeuyPvMLPftM/SQOW1qVSi7IfTQ1KTYVGleYNVYqfMC8WkK2hPC9aOnKubHIJpI5mH5XTrqbqZx1UfU2I9UjuvNbIhe9JtABlYy7t15BXB1gTQ0qFjNNsMUYO7wttK85wDHd6/wo4uCFVs7KmYObbw=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WqmTUwB_1761129260 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 22 Oct 2025 18:34:20 +0800
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
In-Reply-To: <CAGsJ_4y32i3aNYPum=8J3_Kt6vOSisr_jg6btB-YG1uQBqHG7Q@mail.gmail.com>
	(Barry Song's message of "Wed, 22 Oct 2025 22:55:05 +1300")
References: <20251013092038.6963-1-ying.huang@linux.alibaba.com>
	<20251013092038.6963-3-ying.huang@linux.alibaba.com>
	<CAGsJ_4xaA8QRjP9H=n1hQfEfGop7vOd5Y=J+KQzuOyfa8GK-kQ@mail.gmail.com>
	<87a51jfl44.fsf@DESKTOP-5N7EMDA>
	<CAGsJ_4zPH0fwBOLQwh1y6jG3tCXHLGRCTyVVSCWb+NfLCEMV0Q@mail.gmail.com>
	<871pmv9unr.fsf@DESKTOP-5N7EMDA>
	<CAGsJ_4zW6ogVdi=t9JCuvGD9N21mA_ORXRCakw4Av68d9n+DDw@mail.gmail.com>
	<875xc78es0.fsf@DESKTOP-5N7EMDA>
	<CAGsJ_4zKGS-Xd-58ufXGoyRfaZWd8wTgv0b6ibHJ2aS14mQqtw@mail.gmail.com>
	<87a51j6zg7.fsf@DESKTOP-5N7EMDA>
	<CAGsJ_4y32i3aNYPum=8J3_Kt6vOSisr_jg6btB-YG1uQBqHG7Q@mail.gmail.com>
Date: Wed, 22 Oct 2025 18:34:19 +0800
Message-ID: <87ms5j4444.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_033429_943684_9A7B99F4 
X-CRM114-Status: GOOD (  12.47  )
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

> On Wed, Oct 22, 2025 at 10:46=E2=80=AFPM Huang, Ying
> <ying.huang@linux.alibaba.com> wrote:
>
>> >
>> > I agree. Yet the ish barrier can still avoid the page faults during CP=
U0's PTL.
>>
>> IIUC, you think that dsb(ish) compared with dsb(nsh) can accelerate
>> memory writing (visible to other CPUs).  TBH, I suspect that this is the
>> case.
>
> Why? In any case, nsh is not a smp domain.

I think dsb(ish) will be slower than dsb(nsh) in theory.  I guess that
dsb just wait for the memory write to be visible in the specified
shareability domain instead of making write faster.

> I believe a dmb(ishst) is sufficient to ensure that the new PTE writes
> are visible

dmb(ishst) (smp_wmb()) should pair with dmb(ishld) (smp_rmb()).

> to other CPUs. I=E2=80=99m not quite sure why the current flush code uses=
 dsb(ish);
> it seems like overkill.

dsb(ish) here is used for tlbi(XXis) broadcast.  It waits until the page
table change is visible to the page table walker of the remote CPU.

---
Best Regards,
Huang, Ying

