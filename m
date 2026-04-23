Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2A7F589A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 12:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fo94b7MqFfTgDj99SSJRoVZ8tjQmbwLpsx6plvLcAHM=; b=tnK3SC0fpvaR85FQiVDQmvlpC3
	4GTiltzKXFryTRoKUKmWxyL4DYw/jlQ6yAvSBRDX+Pmt8fdnNe7EeMf9Pqy6StVdzmntSkpgzI5cU
	bfrkbu/Xj7HS+aTRBsn1KSQ7zcOp8NdemTjTsLvx0sH0TuzTNgt0ARqTSp5u/UMdnlb9Gnmg/+aSg
	kQnhwSVZclli+9YqcF/1IR4s+35E9Aah+6gQuJHPU4rRVTv072rm/RC9aaMQ+uh5nb/nv99gTa4W8
	Wzsz3hxXXTcyFh+aCv27t4GmxNNGnV4XfYz8WSZouCqBb2uO9r1fDXxx7sJMj9jWsX2MwSBqak/GD
	ydNA/rDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtEf-0000000BcbO-2wJ8;
	Thu, 23 Apr 2026 12:32:49 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtEZ-0000000Bcac-15r0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 12:32:48 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=fo94b7MqFfTgDj99SSJRoVZ8tjQmbwLpsx6plvLcAHM=;
	b=vek5LSEiClJIzXVuYeoZz7x2S2Tdsogj999dQK1WVA07tF3DQcFMWfs0U3I4hSuXRPdV6cwnl
	oh77IPF8Sf0Fm2pOh7U+7Dij9xeYsbipUZb9EuHXcEPZg7Tg58IlMf3jOruAIY9VdCYwiRNtbpQ
	COep4lW3SCwS/mz1FuWqW7Q=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4g1b0z6Wksz1cyPZ;
	Thu, 23 Apr 2026 20:26:11 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 729E1402AB;
	Thu, 23 Apr 2026 20:32:34 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 23 Apr 2026 20:32:33 +0800
Message-ID: <78515da3-03a1-4fdb-a606-3fea9f4cd20b@huawei.com>
Date: Thu, 23 Apr 2026 20:32:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpu/hotplug: Fix NULL kobject warning in
 cpuhp_smt_enable()
To: Thomas Gleixner <tglx@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>
CC: <peterz@infradead.org>, <sudeep.holla@kernel.org>,
	<yangyicong@hisilicon.com>, <dietmar.eggemann@arm.com>,
	<Jonathan.Cameron@huawei.com>, <linux-kernel@vger.kernel.org>, James Morse
	<james.morse@arm.com>, <linux-arm-kernel@lists.infradead.org>
References: <20260417075534.3745793-1-ruanjinjie@huawei.com>
 <aeNxKpHzTQX4_kId@arm.com> <87ldee0z1w.ffs@tglx>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <87ldee0z1w.ffs@tglx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_053243_977282_14CE61B9 
X-CRM114-Status: GOOD (  19.84  )
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



On 4/23/2026 6:08 PM, Thomas Gleixner wrote:
> On Sat, Apr 18 2026 at 12:55, Catalin Marinas wrote:
>> Another option would have been to avoid marking such CPUs present but I
>> think this will break other things. Yet another option is to register
>> all CPU devices even if they never come up (like maxcpus greater than
>> actual CPUs).
>>
>> Opinions? It might be an arm64+ACPI-only thing.
> 
> I think so. The proper thing to do is to apply sane limits:
> 
>  1) The possible CPUs enumerated by firmware N_POSSIBLE_FW
> 
>  2) The maxcpus limit on the command line N_MAXCPUS_CL
> 
> So the actual possible CPUs evaluates to:
> 
>    num_possible = min(N_POSSIBLE_FW, N_MAXCPUS_CL, CONFIG_NR_CPUS);
> 
> The evaluation of the firmware should not mark CPUs present which are
> actually not. ACPI gives you that information. See:
> 
>          5.2.12.14 GIC CPU Interface (GICC) Structure
> 
> in the ACPI spec. That has two related bits:
> 
> Enabled:
> 
>    If this bit is set, the processor is ready for use. If this bit is
>    clear and the Online Capable bit is set, the system supports enabling
>    this processor during OS runtime. If this bit is clear and the Online
>    Capable bit is also clear, this processor is un- usable, and the
>    operating system support will not attempt to use it.
> 
> Online Capable:
> 
>    The information conveyed by this bit depends on the value of the
>    Enabled bit. If the Enabled bit is set, this bit is reserved and must
>    be zero. Otherwise, if this bit is set, the system supports enabling
>    this processor later during OS runtime
> 
> So the combination of those gives you the right answer:
> 
>    Enabled	Online
>    	        Capable
>    0            0        Not present, not possible
>    0            1        Not present, but possible to "hotplug" layter
>    1            0        Present
>    1            1        Invalid

On x86, it seems that all CPUs with the ACPI_MADT_ENABLED bit set will
be marked as present.

acpi_parse_x2apic()
  -> enabled = processor->lapic_flags & ACPI_MADT_ENABLED
  -> topology_register_apic(enabled)
     -> topo_register_apic(enabled)
        -> set_cpu_present(cpu, true)

> 
> The kernel sizes everything on the number of possible CPUs and the
> present CPU mask is only there to figure out which CPUs are actually
> usable and can be brought up.

> 
> The runtime physical hotplug mechanics use acpi_[un]map_cpu() to toggle
> the present bit.
> 
> Thanks,
> 
>         tglx
> 
> 
> 


