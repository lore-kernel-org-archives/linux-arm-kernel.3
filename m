Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5576BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 03:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjvgHK+G0r4/mvCQ9MN1WfW1ce01kaSxTrYU8mERSnc=; b=nVMnos/A905H9BlIJ0c2Zc3Pju
	O6Tn4C19j53jwsOoxxwheqAEqG8hmGqBdtuQ5OQ08khex4x9inSk6VPQiAY9AF4gQXa/tkr+TgQs+
	ObYiT8ZLEhpqc0gZY5O342HB5g3jQ8eq3DR/MBogfcteGfQaVHNmfq2/HFWNejvgyBHAhjbA782MD
	bGh4AaAL2xeX1VwfT7R1T+zRpyQi7YuEr0wCCF2O+Ai2M3hmJAcM2wyTAs5qRTeHG4jZ8NvPz/v85
	zwPSinqXzwWM/rcue1FICRmMv86WlC3pIs4ynU8g9FlQaXWuXe+QrRqCld0EJpyD/x8oGAjT+Qtx6
	UzHgeP4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwQS-0000000E0UA-2kpn;
	Tue, 07 Jul 2026 03:24:48 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwQP-0000000E0T6-0av1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 03:24:47 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=NjvgHK+G0r4/mvCQ9MN1WfW1ce01kaSxTrYU8mERSnc=;
	b=A72vJeMQMW9HloQLkhuJIPwWH24vuFemiwkIkj9V71URNM0KUux4vDUG/CPODyN8UuiVLGHUk
	Z3SMYB4vf5XK4tcZAcIPGMESXgbbBz9lWv61BaNDE5QuQxWOhXTpHRiosr9h/GucbvXR+Pnneau
	fgfymoJvVlveakYsPTMFS9U=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gvRDn6V4Bz1prq6;
	Tue,  7 Jul 2026 11:15:21 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 299154058C;
	Tue,  7 Jul 2026 11:24:37 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 7 Jul 2026 11:24:34 +0800
Message-ID: <6a388036-e3ce-4cf3-a413-c78ec6c0a012@huawei.com>
Date: Tue, 7 Jul 2026 11:24:33 +0800
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
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_202445_814020_C7B795D2 
X-CRM114-Status: GOOD (  20.68  )
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

Hi Will,

I have also considered this direction, and I fully agree that it is a
much more robust solution than merely making the bit operations atomic.

- Concurrency is eliminated completely: After moving
update_cpu_capabilities() to after cpuhp_ap_sync_alive(), the subsequent
CPU state transitions (e.g., from the AP synchronization phase to the
final online state) are strictly serialised by the cpuhp state machine.
This means system_cpucaps will no longer be modified concurrently. The
original race condition simply disappears.

- No dead-wait on the boot CPU: I also verified that
update_cpu_capabilities() never calls cpu_die_early() — it only updates
system-wide capability bitmaps and does not trigger any error path that
would cause a secondary CPU to fail or die. Therefore, moving its
invocation to a later point (after the sync point) will not introduce
any risk of the boot CPU waiting indefinitely for a secondary CPU that
might have panicked or got stuck.

Thus, I think your suggestion is the correct way forward.

Best regards,
Jinjie

> we'd have something akin to setup_boot_cpu_features() for the secondary
> CPUs.
> 
> Will


