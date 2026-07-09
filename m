Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6D2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auENchSQYPPK/iId01P0BNzV/jUSAPLGspoIqRFWkr0=; b=iZGAhT8D/FVS3JbyuPb0e4IPGc
	lX3+RMNvbep15fbnF9bHHA/VXpOtKqARySUBz2dMaATruPEQNLUPbqwDJEJvF8pqMO27K8U3eoj86
	ek2dwq0j/kTRe0KLfdrX5UUtnVrdAznmySmr6JPoep07dm5PBE+alKA/35iiKm3OXsP0F6MCpD+GU
	4wUnbvxQQJgwoTFqLbq+uXzbEJg74ccKPKGryi+6S5fd9RnOJJOiTWjtLEHe5LgNYvZ339jZY7FyU
	xbCEw/oHSg0VeLhkNR+goQOCUEHcF8yqD50phmPxD5JXNfeoIZjweAxVw8TEmaUR4lignKRJvZLqG
	9F4PKoTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnCG-00000002FUq-0hac;
	Thu, 09 Jul 2026 11:45:40 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnCC-00000002FSo-3HpJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 11:45:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=auENchSQYPPK/iId01P0BNzV/jUSAPLGspoIqRFWkr0=;
	b=MAVuwFKesjoVK8nwyL9hjaTQK/AmChmdC+pC1jM2XPRG2r9DkpW7J8LudAKbOAyOOVJKwGesP
	fnLIBYKj6d2P3HavsKgAaNCMNvgC+1MS3lwaywLzI4DA8prq+81/QKctwv9CBy0kjeq6qGcgPy5
	4NLrZyru8O6sAjH7EZqwYn4=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gwtFm4cg3z1prLD;
	Thu,  9 Jul 2026 19:36:12 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 53E0B40575;
	Thu,  9 Jul 2026 19:45:29 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 9 Jul 2026 19:45:26 +0800
Message-ID: <be58c2a9-e9cd-4f23-ac05-273c20c3d975@huawei.com>
Date: Thu, 9 Jul 2026 19:45:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
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
 <ajvKkLw5bL-FT5JC@willie-the-truck>
 <32d41a67-cf37-4079-8218-bed2b73bbf14@huawei.com>
 <akvoN5vvQaW3MdmI@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <akvoN5vvQaW3MdmI@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_044537_152674_6DC36009 
X-CRM114-Status: GOOD (  17.33  )
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



On 7/7/2026 1:39 AM, Will Deacon wrote:
> Hi Jinjie,
> 
> On Thu, Jun 25, 2026 at 09:34:36AM +0800, Jinjie Ruan wrote:
>> On 6/24/2026 8:16 PM, Will Deacon wrote:
>>> Please just give me the time I asked for. If you want to help out in the
>>> meantime, there are plenty of patches that need reviewing...
>>
>> It was a mistake on my part, and I sincerely apologize for wasting
>> community review resources and disrupting your schedule.
>>
>> I will absolutely back off now and wait for your official series. Lesson
>> learned. Thanks for your patience and for calling me out on this.
> 
> So I've mostly got the old series back on its feet:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=cpu-hotplug

Hi Will,

I tested the boot time on the HIP12 hardware based on your patch, as the
other two boards with 32 cores and 64 cores can only be booted using the
5.10 kernel，but the patches are greatly different, and the adaptation is
complex.

Bringup Time Comparison on real hardware (ms, lower is better):

 |     Platform             | Baseline|   P=0   |   P=1   | Delta(%)|
 | -------------------------| ------- | ------- | ------- | ------- |
 | 288-core server(HIP12)   | 21989.6 | 21989.7 | 12915.3 | 41.3%   |

> 
> but there are still two issues left to resolve:
> 
>   1. The printing that can happen before RCU has started. Although I've
>      reduced this somewhat, there are still error paths in e.g.
>      verify_local_cpu_capabilities() that print a message before dying.
> 
>   2. check_local_cpu_capabilities() can mutate the system capability
>      state via update_cpu_capabilities(), so it's really dodgy running
>      that prior to synchronisation.
> 
> Since you've added patches in this series that try to tackle these
> problems, I'll reply on those two so we can figure out how we would like
> to proceed.
> 
> Cheers,
> 
> Will


