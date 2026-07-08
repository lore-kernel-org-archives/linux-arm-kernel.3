Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9A4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJ+P1FAy8PcQIRUquHStGYnLrQlgAn0eWhkNpUoI/wA=; b=djYgmPNn32cSeXuHjog5dhmsbI
	ihkQUlN8PVTMV0xCv2RoHIvTW1lRWmqGSVU1gA5Y2rDcCwf38ObxD2v68JB/FgldG51YU4Oisghus
	l//J6FvjG5H1aJXX4ECN5CZUDpT+JsDTi3K8ipDT75OvV9AAIIQnNkQRYsq0UD6zQvj1M/7FjPGUX
	Jkuy4Tt5HFFV1uWw7M6jyZIXLnE/jkda2hezldZ5I+XlJwxiUR3FRyNf5w25IeFHTCSA0+yDUyUjZ
	awxpWlM4IdDJTVaGiY+g1s5x4htWvzt71pUdpv7Xl3jNTXgDqftuVDmUZoOa74sPy2DalmzWwIHNP
	/V4V8zgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whP5l-0000000Gnjw-1tGH;
	Wed, 08 Jul 2026 10:01:21 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whP5g-0000000GnjD-0V5C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 10:01:19 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VJ+P1FAy8PcQIRUquHStGYnLrQlgAn0eWhkNpUoI/wA=;
	b=tomzzafwsssd0sSDomrfOJwELNtTFSNuiVO5enkxvs+RDcaw7dnogCNwwB0OisQ6rmlp4MR1e
	LaFynzUOTFHZpsULsEv32JVlmVZOibMtZJ3S6Aj0oXPpCQNmBXfS21gp2HTpBsIA5cFULT5lyhz
	cE8fI+QRaFv77GKUEf8nLvk=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gwD0d4P6nznTVZ;
	Wed,  8 Jul 2026 17:52:33 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 9995F40578;
	Wed,  8 Jul 2026 18:01:09 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 8 Jul 2026 18:01:05 +0800
Message-ID: <3501828e-7dd4-4587-b29a-71eabcc05ab8@huawei.com>
Date: Wed, 8 Jul 2026 18:01:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/12] arm64: cpufeature: Ensure atomic updates to
 system_cpucaps bitmap
To: Will Deacon <will@kernel.org>
CC: <catalin.marinas@arm.com>, <tsbogend@alpha.franken.de>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <peterz@infradead.org>, <kees@kernel.org>,
	<nathan@kernel.org>, <linusw@kernel.org>, <ojeda@kernel.org>,
	<david.kaplan@amd.com>, <lukas.bulwahn@redhat.com>, <ryan.roberts@arm.com>,
	<maz@kernel.org>, <timothy.hayes@arm.com>, <lpieralisi@kernel.org>,
	<thuth@redhat.com>, <menglong8.dong@gmail.com>, <oupton@kernel.org>,
	<yeoreum.yun@arm.com>, <miko.lenczewski@arm.com>, <broonie@kernel.org>,
	<kevin.brodsky@arm.com>, <james.clark@linaro.org>,
	<yangyicong@hisilicon.com>, <tabba@google.com>, <osandov@fb.com>,
	<arnd@arndb.de>, <anshuman.khandual@arm.com>, <david@kernel.org>,
	<akpm@linux-foundation.org>, <ljs@kernel.org>, <dev.jain@arm.com>,
	<yang@os.amperecomputing.com>, <chaitanyas.prakash@arm.com>,
	<kprateek.nayak@amd.com>, <chenl311@chinatelecom.cn>,
	<sshegde@linux.ibm.com>, <thorsten.blum@linux.dev>,
	<chang.seok.bae@intel.com>, <tim.c.chen@linux.intel.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
 <20260624092537.2916971-10-ruanjinjie@huawei.com>
 <akvooksAvkmG971U@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <akvooksAvkmG971U@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_030117_745546_3108A280 
X-CRM114-Status: GOOD (  22.76  )
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



On 7/7/2026 1:40 AM, Will Deacon wrote:
> On Wed, Jun 24, 2026 at 05:25:34PM +0800, Jinjie Ruan wrote:
>> Parallel CPU bringup allows multiple secondary CPUs to concurrently
>> execute update_cpu_capabilities() during early boot.
>>
>> The current non-atomic __set_bit() and __clear_bit() helpers perform
>> unserialized updates on the shared global bitmap, risking data races
>> and feature flag erasure.
>>
>> Upgrade these operations to set_bit() and clear_bit() to ensure all
>> concurrent modifications are properly serialized via arm64 atomics.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/arm64/kernel/cpufeature.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>> index be75e60d56ca..a1a13f3e01ed 100644
>> --- a/arch/arm64/kernel/cpufeature.c
>> +++ b/arch/arm64/kernel/cpufeature.c
>> @@ -3548,7 +3548,7 @@ static void update_cpu_capabilities(u16 scope_mask)
>>  
>>  		if (!caps->matches(caps, cpucap_default_scope(caps))) {
>>  			if (match_all)
>> -				__clear_bit(caps->capability, system_cpucaps);
>> +				clear_bit(caps->capability, system_cpucaps);
>>  			continue;
>>  		}
>>  
>> @@ -3559,7 +3559,7 @@ static void update_cpu_capabilities(u16 scope_mask)
>>  		if (!match_all && caps->desc && !caps->cpus)
>>  			pr_info("detected: %s\n", caps->desc);
>>  
>> -		__set_bit(caps->capability, system_cpucaps);
>> +		set_bit(caps->capability, system_cpucaps);
>>  
>>  		if (boot_cpu && (caps->type & SCOPE_BOOT_CPU))
>>  			set_bit(caps->capability, boot_cpucaps);
> 
> I don't think this is sufficient. Even if we use atomic updates for the
> low-level bits, the logic here which tries to avoid re-probing features
> that have already been detected isn't going to work correctly if it's
> running concurrently with itself.
> 
> I think the best bet is probably to move update_cpu_capabilities() out
> of check_local_cpu_capabilities() and call it after cpuhp_ap_sync_alive()
> when the system capabilities are not yet finalised. WDYT? That means
> we'd have something akin to setup_boot_cpu_features() for the secondary
> CPUs.

This approach most thoroughly avoids concurrency issues, as after
cpuhp_ap_sync_alive(), the secondary CPUs are woken up serially by the
boot CPU.

It also eliminates the problem of boot CPUs being stuck in deadlock wait
for the secondary CPUs, because update_cpu_capabilities() does not call
cpu_die_early() or cpu_panic_kernel().

Is it similar to the following code?

diff --git a/arch/arm64/include/asm/cpufeature.h
b/arch/arm64/include/asm/cpufeature.h
index 6c95227032b0..33185527aea9 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -651,6 +651,7 @@ void __init setup_system_features(void);
 void __init setup_user_features(void);

 void check_local_cpu_capabilities(void);
+void setup_secondary_cpu_capabilities(void);

 u64 read_sanitised_ftr_reg(u32 id);
 u64 __read_sysreg_by_encoding(u32 sys_id);
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index e3110a572bc8..4d106d90adb0 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3859,6 +3859,12 @@ void check_local_cpu_capabilities(void)
         */
        check_early_cpu_features();

+       if (system_capabilities_finalized())
+               verify_local_cpu_capabilities();
+}
+
+void setup_secondary_cpu_capabilities(void)
+{
        /*
         * If we haven't finalised the system capabilities, this CPU gets
         * a chance to update the errata work arounds and local features.
@@ -3867,8 +3873,6 @@ void check_local_cpu_capabilities(void)
         */
        if (!system_capabilities_finalized())
                update_cpu_capabilities(SCOPE_LOCAL_CPU);
-       else
-               verify_local_cpu_capabilities();
 }

 bool this_cpu_has_cap(unsigned int n)
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index fd824b96ab19..7d4c369fa090 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -243,6 +243,7 @@ asmlinkage notrace void secondary_start_kernel(void)
         * we made it into the kernel. We're still not 'online'.
         */
        cpuhp_ap_sync_alive();
+       setup_secondary_cpu_capabilities();

        update_cpu_features(cpu);
        store_cpu_topology(cpu);


> 
> Will


