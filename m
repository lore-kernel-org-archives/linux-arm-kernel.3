Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37F3CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 09:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=leTG8eQL2d1TJ+ZkjUXd68HfBJsD5TPizgYkX6kdZYY=; b=I/1xQqXdIwFqlSjccADPAsyr6v
	VNOMVLfZNWx+QRpUx2kBqUivFNJXQU6l9uLqLP7kR9YHFGjJCShONhp3zUUMOqDG4hJtbLrmG1Q12
	gMFp4t9iXIM6onjwnjBR4cXyV3Kd7HjhRCqeAeXS8konm749MXIeRe5NWTKMmH9X1usGaoVr5rrOT
	Q2pUVi1kzMoxMyQE1RMDE3pLsB62El4uVTrBZp0fNzIBifvXzy/ABUUG/DK/dmjdHf4GYIMuxexdP
	pjDeOcMExcsoT+62304SDMCZQKFKLdovgqndIx2r20sMvqOM6pkI1ZI6aSFI4n4s79N0beLfHyolj
	m4DHBB2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVQq-00000002JXF-0ImI;
	Wed, 22 Oct 2025 09:47:00 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVQk-00000002JVd-0cNA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 09:46:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1761126411; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=leTG8eQL2d1TJ+ZkjUXd68HfBJsD5TPizgYkX6kdZYY=;
	b=lejdTTWjyOeDXaFrUZDxnnE7kH6QxLl3cYZr0eXW5EMBo2grkiWY4tk8ys2I8E1XjS6WRG7GyZFFeybipzt3NGzOQZkpjjwduvpAHddyEuJkAIAnJvjEGKJTxI9N14WNIarmT/WJPbr7Q3iSV5FAZO+Q1tGy5bLNRxPFRuZOCdw=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WqmS8Fc_1761126408 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 22 Oct 2025 17:46:49 +0800
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
In-Reply-To: <CAGsJ_4zKGS-Xd-58ufXGoyRfaZWd8wTgv0b6ibHJ2aS14mQqtw@mail.gmail.com>
	(Barry Song's message of "Wed, 22 Oct 2025 22:37:54 +1300")
References: <20251013092038.6963-1-ying.huang@linux.alibaba.com>
	<20251013092038.6963-3-ying.huang@linux.alibaba.com>
	<CAGsJ_4xaA8QRjP9H=n1hQfEfGop7vOd5Y=J+KQzuOyfa8GK-kQ@mail.gmail.com>
	<87a51jfl44.fsf@DESKTOP-5N7EMDA>
	<CAGsJ_4zPH0fwBOLQwh1y6jG3tCXHLGRCTyVVSCWb+NfLCEMV0Q@mail.gmail.com>
	<871pmv9unr.fsf@DESKTOP-5N7EMDA>
	<CAGsJ_4zW6ogVdi=t9JCuvGD9N21mA_ORXRCakw4Av68d9n+DDw@mail.gmail.com>
	<875xc78es0.fsf@DESKTOP-5N7EMDA>
	<CAGsJ_4zKGS-Xd-58ufXGoyRfaZWd8wTgv0b6ibHJ2aS14mQqtw@mail.gmail.com>
Date: Wed, 22 Oct 2025 17:46:48 +0800
Message-ID: <87a51j6zg7.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_024655_686966_19ACDA1C 
X-CRM114-Status: GOOD (  10.31  )
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

>>
>> With PTL, this becomes
>>
>> CPU0:                           CPU1:
>>
>> page fault                      page fault
>> lock PTL
>> write PTE
>> do local tlbi
>> unlock PTL
>>                                 lock PTL        <- pte visible to CPU 1
>>                                 read PTE        <- new PTE
>>                                 do local tlbi   <- new PTE
>>                                 unlock PTL
>
> I agree. Yet the ish barrier can still avoid the page faults during CPU0's PTL.

IIUC, you think that dsb(ish) compared with dsb(nsh) can accelerate
memory writing (visible to other CPUs).  TBH, I suspect that this is the
case.

> CPU0:                                                                  CPU1:
>
> lock PTL
>
> write pte;
> Issue ish barrier
> do local tlbi;
>
>
>     No page fault occurs if tlb misses
>
>
> unlock PTL
>
>
> Otherwise, it could be:
>
>
> CPU0:                                                                  CPU1:
>
> lock PTL
>
> write pte;
> Issue nsh barrier
> do local tlbi;
>
>
>     page fault occurs if tlb misses
>
>
> unlock PTL
>
>
> Not quite sure if adding an ish right after the PTE modification has any
> noticeable performance impact on the test? I assume the most expensive part
> is still the tlbi broadcast dsb, not the PTE memory sync barrier?

---
Best Regards,
Huang, Ying

