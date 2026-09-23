Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C335DC9830C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 12:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZA++Tvj9hJMIA5FBVjp4MmA1vHg81Quk3OB7rK0L/A=; b=b5/1sETHinupppYnuDtNUcCiQi
	BxlayYgDrgjrNXyxbwW2DM1chshX6EMj6dLzQfqgRHYndqk3H8iGwg0AU8haf/4Sw6W+5u5qALUsQ
	fLDnShgiWcv9lUA0xahBsSFEWIyLy3t+LpfBkIH413dWytz7J8vT7X3r1AlpodAUvSGl2QBqG85Pr
	wyq136DJ7B4IR0KWI4ej6jrVRLO6E4f9UQCSkE+OWjmfCB7ymwQG73vr05U75gB947SicRrkLvs+F
	GGQRbFevKiUJf1hSsOUvw13qf7ETKEtrzZ3P10HQlg7p/9a2FB2/IAXbyqzX5WLwt2Qgp3l2qwZTV
	oZETE6iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MQr-00000008Iu7-2ar3;
	Wed, 23 Sep 2026 12:50:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MQp-00000008ItL-3Lnp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 12:50:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF16F1570;
	Wed, 23 Sep 2026 05:50:34 -0700 (PDT)
Received: from [10.0.138.135] (XHFQ2J9959-5.cambridge.arm.com [10.0.138.135])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8CB23F86C;
	Wed, 23 Sep 2026 05:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790167838; bh=z+yS/SoyIg7hhvgkUwal0qH2INlM/SI5Zl/XhrLUvFw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ol1t6jJCfzd6c8OpXVDodMTpqQmF63+NHtsFlKE4TQ375JHm/yI33ZZjp29fKkWf+
	 RfgLJJn28pc11PBO2a1AUz1svJeHdUebBJjxIokAlwBdwxnw8Lb76bFd3HRoK8JQ38
	 OrITSANkn63YEis81/z4L/rZwU7gTdMwO7FNk4hg=
Message-ID: <e852a2db-c15a-4e9f-b92e-ffd5740498cc@arm.com>
Date: Wed, 23 Sep 2026 13:50:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/4] arm64/mm: Use pmdp_get() for PMD accesses
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Lorenzo Stoakes <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Mark Rtland <mark.rtland@arm.com>,
 linx-arm-kernel@lists.infradead.org, linx-kernel@vger.kernel.org,
 kasan-dev@googlegrops.com
References: <20260922061638.3967467-1-anshuman.khandual@arm.com>
 <20260922061638.3967467-2-anshuman.khandual@arm.com>
 <212067fe-1b16-4b87-87a7-4ce50847eb24@arm.com>
 <m72rpspdg5cv7xptent4tglgd25zehx462nfmcx5uyjwi2ag7p@bc6hvhosgtfb>
 <bce043cc-0f69-4297-8f31-92dcfbc0061d@arm.com>
 <7dn5t2m2fzuwxj2anuycz245hnctqc5mgaj5vdx7ybfql7arwv@6ac363txw3ff>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <7dn5t2m2fzuwxj2anuycz245hnctqc5mgaj5vdx7ybfql7arwv@6ac363txw3ff>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_055039_932981_9FD1BFC7 
X-CRM114-Status: GOOD (  20.53  )
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

On 23/09/2026 13:22, Anshuman Khandual wrote:
> On Wed, Sep 23, 2026 at 12:31:42PM +0100, Ryan Roberts wrote:
>> On 23/09/2026 12:01, Anshuman Khandual wrote:
>>> On Wed, Sep 23, 2026 at 09:32:17AM +0100, Ryan Roberts wrote:
>>>> On 22/09/2026 07:16, Anshuman Khandual wrote:
>>>>> Replace READ_ONCE() with pmdp_get() for PMD accesses in preparation for
>>>>> supporting both D64 and D128 translation table formats.
>>>>>
>>>>> READ_ONCE() cannot currently be used for 128-bit page table entries on
>>>>> arm64 because it does not provide the required 128-bit single-copy
>>>>> atomicity, causing builds to fail for accesses wider than 64 bits.
>>>>>
>>>>> Although LDP/STP provide the required atomicity when FEAT_LSE is
>>>>> available (as required by FEAT_D128), extending READ_ONCE() to support
>>>>> 128-bit accesses is undesirable. READ_ONCE() is a general-purpose API,
>>>>> so doing so could encourage other 128-bit users that would either fail
>>>>> to build in configurations without D128 support or, if D128 becomes a
>>>>> runtime option, silently permit tearing on systems without the required
>>>>> hardware support.
>>>>>
>>>>> Instead, standardize PMD accesses on the existing page-table helpers.
>>>>> These can be overridden on arm64 to provide 128-bit single-copy
>>>>> atomicity when required. No functional change intended.
>>>>
>>>> I notice you have an unconverted READ_ONCE(*pmdp) in
>>>> pmdp_test_and_clear_young(). Is that intentional?
>>>
>>> Converting the above READ_ONCE() instances as pmdp_get() cuases a build
>>> failure as pmpd_get() which is defined in generic pgtable header is not
>>> visible inside platform specific pgtable header, even with a forward
>>> declaration.

I was wondering why the forward declaration doesn't work, but looks like some c
files include asm/pgtable.h directly, which explains it. Let's assume there are
good reasons and unpicking it so that only linux/pgtable.h includes
asm/pgtable.h is not practical.

>>>
>>> In D128 V2 series these conversions were performed later in the series,
>>> when platform specific pxdp_get() overrides were added via ptval_get(). 
>>>
>>> But to avoid this, we could just move pmdp_test_and_clear_young() inside
>>> arch/arm64/mm/mmu.c file instead. Folding in the following change builds.
>>
>> I'm not sure if/how this might affect performance? Probably not significant
>> since they are for higher levels, so not called as frequently as pte helpers.
> 
> Right, should not have much performance impact.
> 
>>
>> Another option would be to implement arm64-specific pxdp_get() helpers in
>> asm/pgtable.h to override the generic versions?
> 
> For now those will still be based on READ_ONCE() just like the default ones.
> Although trying to drop similar redundancies from other platforms :)
> 
> https://lore.kernel.org/linux-mm/20260923043226.331880-1-anshuman.khandual@arm.com/
> 
> But given D128 is going to define pxdp_get() anyway it might make sense to
> define them now and withdraw the above series :) Seems like s390 platform
> also has similar situation.

Given the desired end state is that arm64 defines it's own pxdp_get() helpers, I
think the best approach is just to define them now (as READ_ONCE()).

Thanks,
Ryan



