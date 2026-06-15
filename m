Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB29CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 08:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+06dmrtJLnZdbs87rF1+ux5dsEP9LjcZvNfLN8dlHk4=; b=iH5e+e6jucpLpEEgl+u7pS8Uay
	W9y0g87MxJmxLizCBmZruY4R56yNaD1JwqoAr/DOSvwjaELt20ib23kJBVhSIyrC7Kn/4QyGIqkXA
	qP3ECW5ugoNZaYL5Sd3I/IgrLYCCwWr/G0BavPBrf5fI6QmIhvMJLlKlebJdKn2CtuKp7nzOIhE+N
	rK++C/yKuqsl4rxdJn5kBzpvQgyq65QX0R50XjPgF4SfaF4Sz9E0KEdvWxxxuzhI2Uazr/rnZ7kPL
	appI8i00JNE4z5JWFtYYDeS2tdUaL3O//d/zt8+NQROrtzWRjcP6Ko1gJTo2yHlEh439IiP1ax+H4
	lRrGCU8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ336-0000000Dudc-0bbZ;
	Mon, 15 Jun 2026 08:52:04 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ332-0000000Duag-1Sfd;
	Mon, 15 Jun 2026 08:52:02 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+06dmrtJLnZdbs87rF1+ux5dsEP9LjcZvNfLN8dlHk4=;
	b=kZyP2QYInrYpJQGT8hI5P+hzIwOXSNn8KJm9IS3ZYsPNJNgOq6PHW0HqyEuMjHqjtILV0h5xR
	r4MxUI+Vo26dHexDRGEwgNHCBbrelR7D98by6DQq07Z1T+R8iajyTTcGvtBDTO3IGBAQ7OdfI0/
	rCKwnClmHHwWxOuokS4VOTg=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gf3Yz0m9lzpSw0;
	Mon, 15 Jun 2026 16:43:51 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 9E3A940571;
	Mon, 15 Jun 2026 16:51:50 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 15 Jun 2026 16:51:48 +0800
Message-ID: <e96a2579-c010-4198-a2a3-6ba35b14aef0@huawei.com>
Date: Mon, 15 Jun 2026 16:51:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] arm64: Add HOTPLUG_PARALLEL support for secondary
 CPUs
To: Michael Kelley <mhklinux@outlook.com>, "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "pjw@kernel.org"
	<pjw@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "peterz@infradead.org" <peterz@infradead.org>,
	"kees@kernel.org" <kees@kernel.org>, "nathan@kernel.org" <nathan@kernel.org>,
	"linusw@kernel.org" <linusw@kernel.org>, "ojeda@kernel.org"
	<ojeda@kernel.org>, "david.kaplan@amd.com" <david.kaplan@amd.com>,
	"lukas.bulwahn@redhat.com" <lukas.bulwahn@redhat.com>, "ryan.roberts@arm.com"
	<ryan.roberts@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"timothy.hayes@arm.com" <timothy.hayes@arm.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "thuth@redhat.com" <thuth@redhat.com>,
	"oupton@kernel.org" <oupton@kernel.org>, "yeoreum.yun@arm.com"
	<yeoreum.yun@arm.com>, "miko.lenczewski@arm.com" <miko.lenczewski@arm.com>,
	"broonie@kernel.org" <broonie@kernel.org>, "kevin.brodsky@arm.com"
	<kevin.brodsky@arm.com>, "james.clark@linaro.org" <james.clark@linaro.org>,
	"tabba@google.com" <tabba@google.com>, "mrigendra.chaubey@gmail.com"
	<mrigendra.chaubey@gmail.com>, "arnd@arndb.de" <arnd@arndb.de>,
	"anshuman.khandual@arm.com" <anshuman.khandual@arm.com>, "x86@kernel.org"
	<x86@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-4-ruanjinjie@huawei.com>
 <SN6PR02MB41575306521E6223561F476FD4182@SN6PR02MB4157.namprd02.prod.outlook.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <SN6PR02MB41575306521E6223561F476FD4182@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_015201_071288_1469ECA4 
X-CRM114-Status: GOOD (  15.92  )
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



On 6/12/2026 11:45 PM, Michael Kelley wrote:
> From: Jinjie Ruan <ruanjinjie@huawei.com> Sent: Thursday, June 11, 2026 6:38 AM
>>
>> Support for parallel secondary CPU bringup is already utilized by x86,
>> MIPS, and RISC-V. This patch brings this capability to the arm64
>> architecture.
>>
>> Rework the global `secondary_data` accessed during early boot into
>> a per-CPU array. This array maps logical CPU IDs to MPIDR_EL1 values,
>> enabling the early boot code in head.S to resolve each secondary CPU's
>> logical ID concurrently.
>>
>> To fully enable HOTPLUG_PARALLEL, this patch implements:
>> 1) An arm64-specific arch_cpuhp_kick_ap_alive() handler.
>> 2) Callbacks to cpuhp_ap_sync_alive() inside secondary_start_kernel().
>>
>> Successfully tested on QEMU ARM64 virt machine (KVM on, 128 vCPUs).
>>
>> |     test kernel	   | secondary CPUs boot time |
>> |  ---------------------   |	--------------------  |
>> |   Without this patch     |		155.672	      |
>> |   cpuhp.parallel=0	   |		62.897	      |
>> |   cpuhp.parallel=1	   |		166.703	      |
> 
> The last two rows seem mixed up. I would expect parallel=0 to
> result in a longer boot time.

Hi, Michael,

The results are correct and not mixed up.

Compared to the original non‑HOTPLUG_PARALLEL approach, the advantage of
cpuhp.parallel=0 lies in its use of cpu_relax(`yield` on arm64) instead
of the wait_for_completion_timeout() mechanism (which may cause sleep
and context switching). This significantly reduces the overhead of VM
exits and context switches in a KVM guest, thereby cutting the secondary
CPU boot time by more than half.

Regarding cpuhp.parallel=1, I believe the reason it fails to optimize
boot time is that when a large number of CPUs issue the KICK_AP call
simultaneously, it results in severe lock contention within KVM, which
paradoxically slows down secondary CPU bringup. However, this needs
further investigation into the PSCI_CPU_ON code in KVM.

I'm testing these performance aspects on physical hardware, so the
results might be somewhat different because secondary CPU bringup
requires trapping into the ATF firmware.

Best regards,
Jinjie

> 
> Michael
> 
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/arm64/Kconfig           |  1 +
>>  arch/arm64/include/asm/smp.h |  8 ++++++++
>>  arch/arm64/kernel/head.S     | 23 +++++++++++++++++++++++
>>  arch/arm64/kernel/smp.c      | 27 +++++++++++++++++++++++++++
>>  4 files changed, 59 insertions(+)
>>
> 
> 


