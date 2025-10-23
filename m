Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E083CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 01:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2IDMW7CBAbRVu3DReKyJ3tXIFVRCpnWKhvXJ2ha+0SM=; b=dg6n42Ju+fxV5gHCXSAWlkRVRr
	oXiAlw0zIroLPmXVbI7kYRdNu+cyZP3QPyTUPnH+RQwFEjuDasjAx8igvM6rs6gwMyk/glAXOSPx6
	dEnULHRh4Bvg3FeYqAFdnu9/Cte0j7roTfc11/myRBlCCkmEB4YEgI4UezwbdXrohxxKFyg/mcuOX
	NcmIHGr0PMSdq06am1r+lavZJaIDx3BDrvrpWQBo321EKcuoYSp5HnPQTxR4EOx95a0U/5RIbHyLg
	qcFWGBUGwrHx04g88MHaJtxLkCMG/ZmHC95ck3+87NWuJ+mBZ7FDnHh5SnFZTV/7mvrzAADY6W8gB
	Z4EPLHmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBk1x-00000004kTq-18sV;
	Thu, 23 Oct 2025 01:22:17 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBk1t-00000004kSj-0OY3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 01:22:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1761182529; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=2IDMW7CBAbRVu3DReKyJ3tXIFVRCpnWKhvXJ2ha+0SM=;
	b=LBRBSITn+lYzPaJmzq9qZgM0i315LC7+D34GBE4WYvXKVNdoll+Ohyvu6jloRZxYnZg8g2Hdnq3IHWxs6rhTJZA+zfCLyRxzB4feovYus3LDn2iY5kiTVzPw3Y2SwzQPMcdvGTeCZ4DsVriJ52fic1ibwlXJJt3WUCebp8tnuew=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WqooiVd_1761182526 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 23 Oct 2025 09:22:07 +0800
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
In-Reply-To: <CAGsJ_4xhJSLnXOZy4kPmnif5Paq+OPN_Ww+rPk2WO4-ADSC0Yw@mail.gmail.com>
	(Barry Song's message of "Wed, 22 Oct 2025 23:52:23 +1300")
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
	<87ms5j4444.fsf@DESKTOP-5N7EMDA>
	<CAGsJ_4xhJSLnXOZy4kPmnif5Paq+OPN_Ww+rPk2WO4-ADSC0Yw@mail.gmail.com>
Date: Thu, 23 Oct 2025 09:22:05 +0800
Message-ID: <87qzuu1kg2.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_182213_572360_23126D19 
X-CRM114-Status: GOOD (  18.14  )
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

> On Wed, Oct 22, 2025 at 11:34=E2=80=AFPM Huang, Ying
> <ying.huang@linux.alibaba.com> wrote:
>>
>> Barry Song <21cnbao@gmail.com> writes:
>>
>> > On Wed, Oct 22, 2025 at 10:46=E2=80=AFPM Huang, Ying
>> > <ying.huang@linux.alibaba.com> wrote:
>> >
>> >> >
>> >> > I agree. Yet the ish barrier can still avoid the page faults during=
 CPU0's PTL.
>> >>
>> >> IIUC, you think that dsb(ish) compared with dsb(nsh) can accelerate
>> >> memory writing (visible to other CPUs).  TBH, I suspect that this is =
the
>> >> case.
>> >
>> > Why? In any case, nsh is not a smp domain.
>>
>> I think dsb(ish) will be slower than dsb(nsh) in theory.  I guess that
>> dsb just wait for the memory write to be visible in the specified
>> shareability domain instead of making write faster.
>>
>> > I believe a dmb(ishst) is sufficient to ensure that the new PTE writes
>> > are visible
>>
>> dmb(ishst) (smp_wmb()) should pair with dmb(ishld) (smp_rmb()).
>>
>> > to other CPUs. I=E2=80=99m not quite sure why the current flush code u=
ses dsb(ish);
>> > it seems like overkill.
>>
>> dsb(ish) here is used for tlbi(XXis) broadcast.  It waits until the page
>> table change is visible to the page table walker of the remote CPU.
>
> It seems we=E2=80=99re aligned on all points[1], although I=E2=80=99m not=
 sure whether
> you have data comparing A and B.
>
> A:
> write pte
> don't broadcast pte
> tlbi
> don't broadcast tlbi
>
> with
>
> B:
> write pte
> broadcast pte

I suspect that pte will be broadcast, DVM broadcast isn't used for
the memory coherency IIUC.

> tlbi
> don't broadcast tlbi
>
> I guess the gain comes from "don't broadcat tlbi" ?
> With B, we should be able to share many existing code.

Ryan has some plan to reduce the code duplication with the current
solution.

> [1]
> https://lore.kernel.org/linux-mm/20251013092038.6963-1-ying.huang@linux.a=
libaba.com/T/#m54312d4914c69aa550bee7df36711c03a4280c52

---
Best Regards,
Huang, Ying

