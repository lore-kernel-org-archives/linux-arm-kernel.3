Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023B7C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 04:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/HDVNfpm4IgEkiIMCM3yP2KnKeVuWAC4QAkvqd3Q1U=; b=v+OD1i759Q+mW19d6gAZWkwv1s
	P+hDEbR8jj6ohzDCqDmdJ3DQQvPqphCeWymTUtQ+N521iwEUyRARP8Yvcenb2AbLdmE9/wb76pQam
	99NKqKed6N0An4FpzkSEq7+1MRFmWapVReue2uy5y1FCU0/vhh50uTsIfD3xB+kXkM4UJsg94bYqp
	DimOzevQjz/eW52/arddkmyijP1S1UdinHVLojnPM5LQOkwGL928ifcDf1XJP6gk9XFuEDQxdduH/
	3IfOCTc3izWMJWDMJWcjUn7nTIRrNOVbyfaIVWCYe/Qds0psLyssQLNiv+2NS4MCRmHDyHDHVYM5/
	CwwqJd6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Bm6-00000007iqj-0ktU;
	Thu, 03 Apr 2025 04:01:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0BkK-00000007ikX-073a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 04:00:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6AB49106F;
	Wed,  2 Apr 2025 21:00:02 -0700 (PDT)
Received: from [10.163.48.25] (unknown [10.163.48.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 952463F59E;
	Wed,  2 Apr 2025 20:59:58 -0700 (PDT)
Message-ID: <c8cddfa5-fcf2-4de9-ab66-ca036363c0bb@arm.com>
Date: Thu, 3 Apr 2025 09:29:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [boot-wrapper] aarch64: Enable access into FEAT_FGT2 registers
 from EL2 and below
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
References: <20240730054643.157295-1-anshuman.khandual@arm.com>
 <Z7xmenE0scM9omcU@J2N7QTR9R3.cambridge.arm.com>
 <4a87b3b7-6bd3-4c86-9a30-43f15759948a@arm.com>
Content-Language: en-US
In-Reply-To: <4a87b3b7-6bd3-4c86-9a30-43f15759948a@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_210004_161603_1DB121E2 
X-CRM114-Status: GOOD (  21.36  )
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



On 3/11/25 11:39, Anshuman Khandual wrote:
> 
> 
> On 2/24/25 18:00, Mark Rutland wrote:
>> On Tue, Jul 30, 2024 at 11:16:43AM +0530, Anshuman Khandual wrote:
>>> FEAT_FGT2 adds system registers HDFGRTR2_EL2, HDFGWTR2_EL2, HFGITR2_EL2,
>>> HFGRTR2_EL2 and HFGWTR2_EL2. But access into these system registers from
>>> EL2 and below exception levels, will trap into EL3 unless SCR_EL3.FGTEN2
>>> is set.
>>>
>>> Enable access to FEAT_FGT2 registers when they are implemented. Given that
>>> these new FEAT_FGT2 trap registers have fields that reset to UNKNOWN values
>>> when resets are taken to EL3, this initialises all registers as cleared.
>>>
>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>> ---
>>> This picks up from an earlier discussion regarding [PATCH 2/2].
>>>
>>> https://lore.kernel.org/all/20240404073726.947215-1-anshuman.khandual@arm.com/
>>>
>>>  arch/aarch64/include/asm/cpu.h | 7 +++++++
>>>  arch/aarch64/init.c            | 9 +++++++++
>>>  2 files changed, 16 insertions(+)
>>>
>>> diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/cpu.h
>>> index a5744e1..878d03d 100644
>>> --- a/arch/aarch64/include/asm/cpu.h
>>> +++ b/arch/aarch64/include/asm/cpu.h
>>> @@ -23,6 +23,12 @@
>>>  #define SCTLR2_EL1		s3_0_c1_c0_3
>>>  #define SCTLR2_EL2		s3_4_c1_c0_3
>>>  
>>> +#define HDFGRTR2_EL2		s3_4_c3_c1_0
>>> +#define HDFGWTR2_EL2		s3_4_c3_c1_1
>>> +#define HFGRTR2_EL2		s3_4_c3_c1_2
>>> +#define HFGWTR2_EL2		s3_4_c3_c1_3
>>> +#define HFGITR2_EL2		s3_4_c3_c1_7
>>
>> These all look correct per ARM DDI 0487 L.a, table D23-2.
>>
>>> +
>>>  /*
>>>   * RES1 bit definitions definitions as of ARM DDI 0487G.b
>>>   *
>>> @@ -63,6 +69,7 @@
>>>  #define SCR_EL3_SCTLR2En		BIT(44)
>>>  #define SCR_EL3_PIEN			BIT(45)
>>>  #define SCR_EL3_D128En			BIT(47)
>>> +#define SCR_EL3_FGTEN2			BIT(59)
>>
>> This looks correct per ARM DDI 0487 L.a, section D24.2.163.
>>
>>>  
>>>  #define HCR_EL2_RES1			BIT(1)
>>>  
>>> diff --git a/arch/aarch64/init.c b/arch/aarch64/init.c
>>> index c9fc7f1..b4d64a0 100644
>>> --- a/arch/aarch64/init.c
>>> +++ b/arch/aarch64/init.c
>>> @@ -68,6 +68,15 @@ void cpu_init_el3(void)
>>>  	if (mrs_field(ID_AA64MMFR0_EL1, FGT))
>>>  		scr |= SCR_EL3_FGTEN;
>>>  
>>> +	if (mrs_field(ID_AA64MMFR0_EL1, FGT) >= 2) {
>>> +		scr |= SCR_EL3_FGTEN2;
>>> +		msr(HDFGRTR2_EL2, 0);
>>> +		msr(HDFGWTR2_EL2, 0);
>>> +		msr(HFGITR2_EL2, 0);
>>> +		msr(HFGRTR2_EL2, 0);
>>> +		msr(HFGWTR2_EL2, 0);
>>> +	}
>>
>> Superficially, this looks sane to me. I haven't audited all the bits, but I
>> assume that you have gone through all of the bits and checked that zero is a
>> sensible reset value for all of these.
>>
>> I intend to apply this shortly.
>>
>> As an aside, I think some necssary support is missing on the kernel side -- I'll reply
>> on that front shortly.
> 
> Hello Mark,
> 
> Seems like neither this boot wrapper patch nor the more recent one which sets
> MDCR_EL3.EnPM2 for FEAT_PMUv3p9 registers [1] (as you had pointed out earlier
> on the kernel thread) has been applied.
> 
> [1] https://lore.kernel.org/all/20250227041603.2029058-1-anshuman.khandual@arm.com/
> 
> IIUC both these boot-wrapper patches are necessary for the kernel patch and
> also for existing FEAT_PMUv3p9 feature.
> 
> https://lore.kernel.org/all/20250227035119.2025171-1-anshuman.khandual@arm.com/
> 
> FEAT_PMUv3p9 is the only current user with dependency on FEAT_FGT2 based traps,
> beside upcoming FEAT_Debugv8p9 feature which is still under development.
> 
> Just wondering if there is something else that still needs to be addressed ?
> Please do let me know, will accommodate the changes as required. Thank you.

Hello Mark,

The current mainline kernel with HEAD a1b5bd45d4ee ("Merge tag 'usb-6.15-rc1'
of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb") does not boot
on the latest boot wrapper without this patch. Please consider merging this
patch, otherwise the boot-wrapper based environment will become unavailable
for v6.15-rc1.

- Anshuman

