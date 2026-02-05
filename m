Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E258EA794D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 01:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MJFRYStTa8t+Xo+rPSmdjbnHA08UchzozX/e9R3wx4M=; b=eo/e4xgCQyUbeq
	H6pEZEOSrCW6lnwzheloaAtR2NdqU90glgGmStH1j7dLAQwRNJb0DCUnfHEYiytncknCN6aEi6VYK
	Xd5OXkd39GhlDT02LLsrzlzqmvAq7ldw7WWPVz9it6w0LpCrSzjN+YYX/cI6PsHi1Urguhn7tfNv2
	78nBsrRZhRyxngWoN8287c7oA53HHTFzYn2fO6KhObBIeXMK8mHgmndx3m7YjwP34fJihCQrioV1L
	mP6kdy0yRenRJo0opxpwkkeHTFqG7K2fPFXETeBxII1bnGJmpIevouBm0w+nDowkQlCUXr3Xq36Zv
	CCCZwWQ9cL32s7Abl44g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vno2o-00000009G6E-0kPs;
	Thu, 05 Feb 2026 01:20:30 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vno2k-00000009G5r-3dor
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 01:20:28 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=MJFRYStTa8t+Xo+rPSmdjbnHA08UchzozX/e9R3wx4M=;
	b=af1PnjGvwLCSHKqGiYSKqriAiaGFhXGRJgp8eUJg9qDUsgchwrSGftPg1P/82+nasjFFMy0hp
	nNuLG4/+Rc96K+z/Ad4VgSJVb4pat+yNFwbvkrWC++HPY2LTl/AO/CF89iYhkeniifjJw+c6DNm
	E44m7kmfl78RiH6atEqQtT4=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4f5zmt3CYPzmV71;
	Thu,  5 Feb 2026 09:15:42 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id DF10840565;
	Thu,  5 Feb 2026 09:20:17 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 5 Feb 2026 09:20:16 +0800
Message-ID: <704d4e92-b1b7-5506-568a-92605086f376@huawei.com>
Date: Thu, 5 Feb 2026 09:20:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v12 00/13] arm64: entry: Convert to Generic Entry
Content-Language: en-US
To: Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>
References: <20260203133728.848283-1-ruanjinjie@huawei.com>
 <87bji552uk.ffs@tglx> <2699bcdc-8d56-7fe9-fa9a-a3d61476e806@huawei.com>
 <87y0l823o9.ffs@tglx> <aYM2jM5BMRGdjnt4@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <aYM2jM5BMRGdjnt4@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_172027_282235_97782589 
X-CRM114-Status: GOOD (  14.80  )
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
Cc: mark.rutland@arm.com, kees@kernel.org, catalin.marinas@arm.com, ldv@strace.io, song@kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org, linux-arm-kernel@lists.infradead.org, kmal@cock.li, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, linux-kernel@vger.kernel.org, kevin.brodsky@arm.com, charlie@rivosinc.com, pengcan@kylinos.cn, broonie@kernel.org, richard.weiyang@gmail.com, dvyukov@google.com, wad@chromium.org, oleg@redhat.com, luto@amacapital.net, liqiang01@kylinos.cn, akpm@linux-foundation.org, reddybalavignesh9979@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 2026/2/4 20:07, Will Deacon wrote:
> On Wed, Feb 04, 2026 at 11:39:34AM +0100, Thomas Gleixner wrote:
>> On Wed, Feb 04 2026 at 09:28, Jinjie Ruan wrote:
>>> On 2026/2/3 22:16, Thomas Gleixner wrote:
>>>> On Tue, Feb 03 2026 at 21:37, Jinjie Ruan wrote:
>>>>> Currently, x86, Riscv, Loongarch use the Generic Entry which makes
>>>>> maintainers' work easier and codes more elegant. arm64 has already
>>>>> successfully switched to the Generic IRQ Entry in commit
>>>>> b3cf07851b6c ("arm64: entry: Switch to generic IRQ entry"), it is
>>>>> time to completely convert arm64 to Generic Entry.
>>>>>
>>>>> The goal is to bring arm64 in line with other architectures that already
>>>>> use the generic entry infrastructure, reducing duplicated code and
>>>>> making it easier to share future changes in entry/exit paths, such as
>>>>> "Syscall User Dispatch".
>>>>>
>>>>> This patch set is rebased on "sched/core". And the performance
>>>>
>>>> Why are you using sched/core, which contains a lot of unrelated
>>>> changes. core/entry is the one which has the prerequisites and nothing
>>>> else....
>>>
>>> By the way，it looks like core/entry and arm64 for-next/entry have
>>> diverged: the first three patches of this series are already in arm64
>>> for-next/entry but missing from core/entry.
>>> Perhaps the two branches should be reconciled so that both contain the
>>> same baseline.
>>
>> The first three patches of this series are ARM specific and have nothing
>> to do with the queued core/entry changes in tip. They are independent of
>> each other and these three ARM64 changes have no business in my tree.
>>
>> If the ARM64 folks want to apply the rest of your series then they have
>> to pull the core/entry branch into their for-next/core branch first so
>> the whole thing builds.
>>
>> But given that the merge window opens on sunday, this is probably moot
>> anyway and the rest of this series can go on top of rc1 in the ARM64
>> tree w/o any further complications.
> 
> Yup, the rest of the series (beyond what we've both queued) also needs
> some more review so this is all post -rc1 material.

Sounds good; I’m looking forward to more expert eyes on the remaining
patches once -rc1 is out.

> 
> In the meantime, thanks for picking up the generic bits.
> 
> Cheers,
> 
> Will
> 

