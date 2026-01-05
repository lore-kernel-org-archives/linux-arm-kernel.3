Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DF4C79FA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 16:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tokmr1R5sqvMIcP0K9SdWOEEn5TxtnR6Psof8qHRvek=; b=4QrOOhgjOkbEQl2XeFQ8a+PDld
	6DNgBsTGROW7VDAHyvRKeaJDcklUrrfZ2EcgaWJTUA37BDspsqxhmJtnvUl7K/CYOxutHte/wx9P7
	Uzu9d1YH9rmhT1hxCqFEUgq37clh0wp++7tiBWmr828h/3FdQSv6ej0eTL16UafltTdOoRBndiqIX
	cj+uGDYmnufbUyAOFej4+8/ThdwNvJHlBDml1VeagQBV9GVS9ZR6GFtpGm3BdJHXnlHSoZt16+frQ
	V10pRTJeSDkGSbVAHUO97CnZsp4MIFnN8Oe9ip7vGAAnCSHTdeAOdg8rb2Ttg1QYNy1fii8dVVhDb
	44fo+Lsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcntQ-0000000Blec-1gqx;
	Mon, 05 Jan 2026 16:57:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcntN-0000000BleH-3Tlw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 16:57:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B61F4339;
	Mon,  5 Jan 2026 08:57:08 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B675F3F5A1;
	Mon,  5 Jan 2026 08:57:10 -0800 (PST)
Message-ID: <a984edef-10e6-4977-a939-6299e37d8ef1@arm.com>
Date: Mon, 5 Jan 2026 16:57:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/45] KVM: arm64: Make MPAMSM_EL1 accesses UNDEF
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20251219181147.3404071-1-ben.horgan@arm.com>
 <20251219181147.3404071-7-ben.horgan@arm.com>
 <20260105164738.0000792f@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20260105164738.0000792f@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_085717_940906_F47A2685 
X-CRM114-Status: GOOD (  14.41  )
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

Hi Jonathan,

On 1/5/26 16:47, Jonathan Cameron wrote:
> On Fri, 19 Dec 2025 18:11:08 +0000
> Ben Horgan <ben.horgan@arm.com> wrote:
> 
>> The MPAMSM_EL1 controls the MPAM labeling for an SMCU, Streaming Mode
>> Compute Unit. As there is on MPAM support in kvm, make sure MPAMSM_EL1
>> accesses trigger an UNDEF.
>>
>> The range of valid configurations for the PARTID and PMG in MPAMSM_EL1 is
>> not currently specified in Arm Architectural Reference Manual but the
>> architect has confirmed that it is intended to be the same as that for the
>> cpu configuration in the MPAMy_ELx registers.
> 
> Good to know but I'm not seeing why it matters in this patch. Perhaps
> a little more on that?

Hmmm, yes. This paragraph should go with patch 11 where we start setting
MPAMSM_EL1 with the same value as MPAM0_EL1 and MPAM1_EL1.

> 
>>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> 
>> ---
>>  arch/arm64/kvm/sys_regs.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>> index c8fd7c6a12a1..72654ab984ee 100644
>> --- a/arch/arm64/kvm/sys_regs.c
>> +++ b/arch/arm64/kvm/sys_regs.c
>> @@ -3373,6 +3373,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>>  
>>  	{ SYS_DESC(SYS_MPAM1_EL1), undef_access },
>>  	{ SYS_DESC(SYS_MPAM0_EL1), undef_access },
>> +	{ SYS_DESC(SYS_MPAMSM_EL1), undef_access },
>> +
>>  	{ SYS_DESC(SYS_VBAR_EL1), access_rw, reset_val, VBAR_EL1, 0 },
>>  	{ SYS_DESC(SYS_DISR_EL1), NULL, reset_val, DISR_EL1, 0 },
>>  
> 

Thanks,

Ben


