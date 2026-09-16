Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D500BC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 01:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wj5xqr16b+MiF4gXbOwrdteITzUjU5K79Zm5S/GYYos=; b=Uc5u5Elm65ZH2lFPKIUWinz7wq
	Ma55vdeUDPSfiih1AWGsYR9DNwPVScJYnZ8qHyge+hxRs2sqmx4LWZJwRMlYBrwQWM4tpMPpTNKfj
	oxO/dfH+JVR1K4UAqviCczUWjkh9l8tOswr1DHSK/ZDp7lOERoxk8cMrJicD5SC5vYh92+kBOqYlj
	YU9e31BD3c1/WbNBSbialfr1O5KYChn+bpWUVbACBWIFF/Hh7aePU1KO0LSRE5Bh8H8zWWtC+A6J0
	07/XM47/u2CUWYXG3XirRKst1DOvf8wmwb4uRob5Qkzc7S1lbenxvT3W/cs2M5Efdr0vAXr77zKoJ
	USXMMr6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6eFw-000000089K9-3Mrr;
	Wed, 16 Sep 2026 01:16:12 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6eFq-000000089JZ-3Amx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 01:16:11 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Wj5xqr16b+MiF4gXbOwrdteITzUjU5K79Zm5S/GYYos=;
	b=6UUP6TpG0J+fyZ3faJJH2xKA7tmsEgCYAzlBcLo25E83gIbC0jyMxX8/rysB+6+2zm6RY9vuP
	I83KyOVhB+bjkh3+me+WYUltdWmprtK8nGUWVZNGU/Um6XJfOAVpIFEtkn1tvH3Psjx3mzOWlc5
	qlNaZjrzTFVw4F+aN2vZZZ8=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4hl0zf2CKvz1K9B2;
	Wed, 16 Sep 2026 09:05:02 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id E326F4057A;
	Wed, 16 Sep 2026 09:16:00 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 16 Sep 2026 09:16:00 +0800
Message-ID: <eaf9019f-ae88-4ede-9bcf-36e0b6e88155@huawei.com>
Date: Wed, 16 Sep 2026 09:15:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/19] cpu/hotplug: Avoid busy-polling on archs where
 cpu_relax() is a no-op
To: Will Deacon <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-4-will@kernel.org>
 <0fa7d64c-9ccb-4a25-b40a-6ffbf5e33406@huawei.com>
 <aqP6wy6BBZXI80vq@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <aqP6wy6BBZXI80vq@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_181607_439711_C6E601EA 
X-CRM114-Status: GOOD (  10.80  )
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



在 2026/9/11 20:57, Will Deacon 写道:
> On Fri, Sep 11, 2026 at 03:16:23PM +0800, Jinjie Ruan wrote:
>> 在 2026/9/8 0:40, Will Deacon 写道:
>>> diff --git a/kernel/cpu.c b/kernel/cpu.c
>>> index 97a9bfe4edad..d9fe204f02cb 100644
>>> --- a/kernel/cpu.c
>>> +++ b/kernel/cpu.c
>>> @@ -303,7 +303,13 @@ static inline void cpuhp_ap_update_sync_state(enum cpuhp_sync_state state)
>>>  	(void)atomic_xchg(st, state);
>>>  }
>>>  
>>> -void __weak arch_cpuhp_sync_state_poll(void) { cpu_relax(); }
>>> +void __weak arch_cpuhp_sync_state_poll(atomic_t *st, int old)
>>> +{
>>> +	if (old < SYNC_STATE_ALIVE)
>>> +		cpu_relax();
>>> +	else
>>> +		atomic_cond_read_relaxed(st, VAL != old);
>>> +}
>>
>> As sashiko pointed out, it seems that the else branch unreachable for
>> the call of cpuhp_wait_for_sync_state(cpu, SYNC_STATE_ALIVE,
>> SYNC_STATE_SHOULD_ONLINE), the old state can only be "SYNC_STATE_KICKED"
>> or "SYNC_STATE_SHOULD_DIE", which go the if branch.
> 
> Ah yes, it's a harmless leftover from my initial (failed) attempt to use
> cpuhp_wait_for_sync_state() in cpuhp_ap_sync_alive(). I can drop this
> part and reword the commit message.

Thanks, looking forward to your update — that will be nice.

> 
> Will


