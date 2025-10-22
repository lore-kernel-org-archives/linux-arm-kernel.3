Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD95CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 09:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uy2pQANmt/EIY8vvrnFu49o9JdxiulocdSZxw8h3NM4=; b=WfX5jFfLqKSK/C5cRhgJ0TrU6v
	K66nW5HJOfSpr1nrk4mQLo4ipn/Uh/nMdukMcjDXmvmWAhDdPvuO+tLYKVi4vOsR4h6O0h/lOGjkf
	pLfsfqxPjj6YfKt+GITOoaoJPxA6MzFxdQB7ciFlo7thX5iWhvIiPlFBmkxv6/PZpWX2LnDoNNSMA
	oZo0I1c7KGkZ1ck7+eFlT4JZdPusxzQpOS2ukFynL8e+RNxZTDreliR4H1w2bCKmq68hxgemv5h/V
	d7eP/QfakOe2A0pIkAzanRUX7EioLorguZ30ej4MCR8oAKR7a/oPN7Orp1S5dISLojW4klf/wcjfW
	H7zZ0wcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBV6e-00000002G71-38Nm;
	Wed, 22 Oct 2025 09:26:09 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBV6a-00000002G4y-3g1W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 09:26:07 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Uy2pQANmt/EIY8vvrnFu49o9JdxiulocdSZxw8h3NM4=;
	b=IcFDykuWnJgWYfU5jyfCGXJCCFMA5VvuTnT6EN+Y6A4WEu/zeIyqVYstviUAVW6bl8I2lMXrb
	rUsnIbbD1u7WollSQS3WQ9r0jyJ/anyK3SvgjYy2uhsqm7KznG1Y3N584mwBWo5OIeminTOq+BF
	4ChSV3O9JlReQjL00kz1sgw=
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4cs3fM5f2gz1T4Fg;
	Wed, 22 Oct 2025 17:24:59 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id EF32B140154;
	Wed, 22 Oct 2025 17:25:53 +0800 (CST)
Received: from kwepemq200011.china.huawei.com (7.202.195.155) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Oct 2025 17:25:53 +0800
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemq200011.china.huawei.com (7.202.195.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Oct 2025 17:25:52 +0800
Message-ID: <de4f09aa-3216-4ac5-8d76-899a685e05f5@huawei.com>
Date: Wed, 22 Oct 2025 17:25:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Add kernel parameter to disable trap EL0 accesses
 to IMPDEF regs
To: Yicong Yang <yangyccccc@gmail.com>, <corbet@lwn.net>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <akpm@linux-foundation.org>,
	<paulmck@kernel.org>, <pawan.kumar.gupta@linux.intel.com>,
	<mingo@kernel.org>, <bp@alien8.de>, <kees@kernel.org>, <arnd@arndb.de>,
	<fvdl@google.com>, <maz@kernel.org>, <broonie@kernel.org>,
	<oliver.upton@linux.dev>, <yeoreum.yun@arm.com>, <james.morse@arm.com>,
	<ardb@kernel.org>, <hardevsinh.palaniya@siliconsignals.io>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20251021115428.557084-1-liaochang1@huawei.com>
 <1ad9d43b-fd1f-4a66-b67b-14f0b3217aec@gmail.com>
From: "Liao, Chang" <liaochang1@huawei.com>
In-Reply-To: <1ad9d43b-fd1f-4a66-b67b-14f0b3217aec@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq200011.china.huawei.com (7.202.195.155)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_022605_788356_5874EF14 
X-CRM114-Status: GOOD (  17.35  )
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

Hi, Yicong

在 2025/10/22 13:26, Yicong Yang 写道:
> On 2025/10/21 19:54, Liao Chang wrote:
>> Add kernel parameter to allow system-wide EL0 access to IMPDEF system
>> regregisters and instructions without trapping to EL1/EL2. Since trap
>> overhead will compromises benefits, and it's even worse in
>> virtualization on CPU where certain IMPDEF registers and instructions
>> are designed for EL0 performance use.
>>
>> More early discussion could be found from link below.
>>
>> Link: https://lore.kernel.org/all/24afb8de-622a-4865-bd8e-8e89ccfff8f4@huawei.com/
>> Tested-by: Xinyu Zheng <zhengxinyu6@huawei.com>
>> Signed-off-by: Liao Chang <liaochang1@huawei.com>
>> ---
>>  Documentation/admin-guide/kernel-parameters.txt |  9 +++++++++
>>  arch/arm64/kernel/cpufeature.c                  | 14 +++++++++++++-
>>  2 files changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index 5a7a83c411e9..11ffa9f7b972 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -326,6 +326,15 @@
>>  			See Documentation/arch/arm64/asymmetric-32bit.rst for more
>>  			information.
>>  
>> +	no_trap_el0_impdef [Arm64,EARLY]
>> +			Allow system-wide EL0 access to IMPDEF system registers
>> +			and instructions without trapping to EL1/EL2.
>> +			Since trap overhead compromises benefits, and it's even
>> +			worse in virtualization on CPU where certain IMPDEF
>> +			registers and instructions are designed for EL0
>> +			performance use. This assumes the kernel adds the
>> +			support for Armv8.8 extension FEAT_TIDCP1.
>> +
>>  	amd_iommu=	[HW,X86-64]
>>  			Pass parameters to the AMD IOMMU driver in the system.
>>  			Possible values are:
>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>> index ef269a5a37e1..d12e35d799ee 100644
>> --- a/arch/arm64/kernel/cpufeature.c
>> +++ b/arch/arm64/kernel/cpufeature.c
>> @@ -2459,9 +2459,21 @@ static bool is_kvm_protected_mode(const struct arm64_cpu_capabilities *entry, in
>>  }
>>  #endif /* CONFIG_KVM */
>>  
>> +static bool no_trap_el0_impdef;
>> +
>> +static int __init parse_no_trap_el0_impdef(char *p)
>> +{
>> +	no_trap_el0_impdef = true;
>> +	return 0;
>> +}
>> +early_param("no_trap_el0_impdef", parse_no_trap_el0_impdef);
>> +
>>  static void cpu_trap_el0_impdef(const struct arm64_cpu_capabilities *__unused)
>>  {
>> -	sysreg_clear_set(sctlr_el1, 0, SCTLR_EL1_TIDCP);
>> +	if (no_trap_el0_impdef)
>> +		sysreg_clear_set(sctlr_el1, SCTLR_EL1_TIDCP, 0);
>> +	else
>> +		sysreg_clear_set(sctlr_el1, 0, SCTLR_EL1_TIDCP);
> An id override for TIDCP1 seems simpler rather than an early param, and consistent to how we disable other 
> certain features through boot option like arm64.nosve or arm64.nompam. I see Catalin also suggested in that
> way in [1],any reason we cannot do it in that way?

Thanks for reminding me of that.

But the problem is on warm reset, SCTLR_ELx.tidcp resets to an unknown value.
This means using id_aa64mmfr1.tidcp1=0 override for TIDCP1 only skips setting
SCTLR_ELx.TIDCP to 1, it still can not guarantee the SCTLR_Ex.TIDCP is cleared.

BR,
Liao, Chang

> 
> [1] https://lore.kernel.org/all/aHqamaqueuk18NyS@arm.com/
> > Thanks.
>>  }
>>  
>>  static void cpu_enable_dit(const struct arm64_cpu_capabilities *__unused)


