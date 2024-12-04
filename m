Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB921E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 09:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F57nm65FcP7ovPb8UOs4T8hiUt+4f7xqonK7+IpKpEA=; b=F5XEdN08HmXXaeT2lSQEYox+3p
	BBdqWNpjJVSHcQ3AuCOZvThKTYvRwa9MLacBMYGeAwTkiufmKACOXABIzo3V6orC30Md5CkUEnFB9
	yG/1S1VGZRadDAcj/J95Nby30RApLaI4O/DSaLlh4+7uqIzVCDiDteCZMn2e3RU10f3vhLR+lkYzE
	rsEE87HrhHaLuzodXazjlcEgJYbEoFrAJPi6Dp8+B9zvYZ6hBQXwxKyPIx3mBaNoBU2PpHbb96nif
	6sPqpvAy8Ru13VBHWPuWU8qWC1X+XIz3Kbt+nQfB8zt0pLM+tmvgr0pJ6UuB4EXbcoWbuYKtZ67rs
	wswg0ITA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlSc-0000000C0Dy-22oW;
	Wed, 04 Dec 2024 09:14:18 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlRb-0000000C04K-3Uzq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 09:13:17 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Y3BYz2SB5z11Ls8;
	Wed,  4 Dec 2024 17:10:15 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 0C2F5180104;
	Wed,  4 Dec 2024 17:13:12 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Wed, 4 Dec 2024 17:13:11 +0800
CC: <yangyicong@hisilicon.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<oliver.upton@linux.dev>, <corbet@lwn.net>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<shuah@kernel.org>, <jonathan.cameron@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>
Subject: Re: [PATCH 2/5] arm64: Add support for FEAT_{LS64, LS64_V,
 LS64_ACCDATA}
To: Marc Zyngier <maz@kernel.org>
References: <20241202135504.14252-1-yangyicong@huawei.com>
 <20241202135504.14252-3-yangyicong@huawei.com> <87mshdrtrr.wl-maz@kernel.org>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <01b65d7a-19ae-d26a-845c-4b47c82bd6e8@huawei.com>
Date: Wed, 4 Dec 2024 17:13:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <87mshdrtrr.wl-maz@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_011316_238669_E3BBD8E7 
X-CRM114-Status: GOOD (  21.83  )
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

On 2024/12/3 17:38, Marc Zyngier wrote:
> On Mon, 02 Dec 2024 13:55:01 +0000,
> Yicong Yang <yangyicong@huawei.com> wrote:
>>
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> Armv8.7 introduces single-copy atomic 64-byte loads and stores
>> instructions and its variants named under FEAT_{LS64, LS64_V,
>> LS64_ACCDATA}. These features are identified by ID_AA64ISAR1_EL1.LS64
>> and the use of such instructions in userspace (EL0) can be trapped.
>> In order to support the use of corresponding instructions in userspace:
>> - Make ID_AA64ISAR1_EL1.LS64 visbile to userspace
>> - Add identifying and enabling in the cpufeature list
>> - Expose these support of these features to userspace through HWCAP
>>   and cpuinfo
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>  Documentation/arch/arm64/booting.rst    | 28 ++++++++++
>>  Documentation/arch/arm64/elf_hwcaps.rst |  9 ++++
>>  arch/arm64/include/asm/hwcap.h          |  3 ++
>>  arch/arm64/include/uapi/asm/hwcap.h     |  3 ++
>>  arch/arm64/kernel/cpufeature.c          | 70 ++++++++++++++++++++++++-
>>  arch/arm64/kernel/cpuinfo.c             |  3 ++
>>  arch/arm64/tools/cpucaps                |  3 ++
>>  7 files changed, 118 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
>> index 3278fb4bf219..c35cfe9da501 100644
>> --- a/Documentation/arch/arm64/booting.rst
>> +++ b/Documentation/arch/arm64/booting.rst
>> @@ -449,6 +449,34 @@ Before jumping into the kernel, the following conditions must be met:
>>  
>>      - HFGWTR_EL2.nGCS_EL0 (bit 52) must be initialised to 0b1.
>>  
>> +  For CPUs support for 64-byte loads and stores without status (FEAT_LS64):
>> +
>> +  - If the kernel is entered at EL1 and EL2 is present:
>> +
>> +    - HCRX_EL2.EnALS (bit 1) must be initialised to 0b1.
>> +
>> +  For CPUs support for 64-byte loads and stores with status (FEAT_LS64_V):
>> +
>> +  - If the kernel is entered at EL1 and EL2 is present:
>> +
>> +    - HCRX_EL2.EnASR (bit 2) must be initialised to 0b1.
>> +
>> +  For CPUs support for 64-byte EL0 stores with status (FEAT_LS64_ACCDATA):
>> +
>> +  - If EL3 is present:
>> +
>> +    - SCR_EL3.EnAS0 (bit 36) must be initialised to 0b1.
>> +
>> +    - SCR_EL3.ADEn (bit 37) must be initialised to 0b1.
>> +
>> +  - If the kernel is entered at EL1 and EL2 is present:
>> +
>> +    - HCRX_EL2.EnAS0 (bit 0) must be initialised to 0b1.
>> +
>> +    - HFGRTR_EL2.nACCDATA_EL1 (bit 50) must be initialised to 0b1.
>> +
>> +    - HFGWTR_EL2.nACCDATA_EL1 (bit 50) must be initialised to 0b1.
>> +
>>  The requirements described above for CPU mode, caches, MMUs, architected
>>  timers, coherency and system registers apply to all CPUs.  All CPUs must
>>  enter the kernel in the same exception level.  Where the values documented
>> diff --git a/Documentation/arch/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
>> index 2ff922a406ad..6cb2594f0803 100644
>> --- a/Documentation/arch/arm64/elf_hwcaps.rst
>> +++ b/Documentation/arch/arm64/elf_hwcaps.rst
>> @@ -372,6 +372,15 @@ HWCAP2_SME_SF8DP4
>>  HWCAP2_POE
>>      Functionality implied by ID_AA64MMFR3_EL1.S1POE == 0b0001.
>>  
>> +HWCAP3_LS64
>> +    Functionality implied by ID_AA64ISAR1_EL1.LS64 == 0b0001.
>> +
>> +HWCAP3_LS64_V
>> +    Functionality implied by ID_AA64ISAR1_EL1.LS64 == 0b0010.
>> +
>> +HWCAP3_LS64_ACCDATA
>> +    Functionality implied by ID_AA64ISAR1_EL1.LS64 == 0b0011.
>> +
> 
> I don't mind the two others, but I seriously question exposing ST64BV0
> to userspace. How is ACCDATA_EL1 populated? How is it context-switched?
> 
> As it stands, this either does the wrong thing by always having the
> low 32bit set to an UNKNOWN value, or actively leaks kernel data.
> TBH, I don't see it being usable in practice (the more I read this
> part of the architecture, the more broken it looks).
> 

you're right, expose this LS64_ACCDATA alone to userspace won't make it
usable since ACCDATA_EL1 cannot be accessed from EL0. will drop this at
this stage.

Thanks.


