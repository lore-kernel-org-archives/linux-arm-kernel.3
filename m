Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB44C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 04:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/GJvTUB0Fc/V+y5K6V4KuOXG7ykfjR54qQ9NpMgq5k=; b=xHeVq2cmhu/GqyqvEt5NWEVxDj
	Hr9KOs0OsWCjPJO58iGp4y2/jIqD+mIPpigfXXzDYgW4FDj3lFGOx+vTWq0GEM+eXM4gDwoPoehQx
	nO6R9KWmUSdfnNxK8g/Cih9ZfQPu6ch280j9oGRnOlC01MLe78a7tpuCBxhZ66Q/7y45Im5xeg6Yp
	BDDPjD1goUa1pj4VQD3dPXRGGen/VS29E5qKiroKT2sRFA3ysnWKR/qB5KCCDiFPlOYE9Y3II+1/1
	uWpFIxuBSJ+gIRQv87GoCPMAtqNfCR23VJG02WUBRwC7qiUnPA5cycH0jzCZEb9an4SuTBPtzmc1p
	M0RpUvvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn7nZ-0000000FTXi-3zo7;
	Fri, 24 Jul 2026 04:46:13 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn7nX-0000000FTXI-3Wsk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 04:46:12 +0000
Received: from [192.168.0.105] (unknown [4.194.122.170])
	by linux.microsoft.com (Postfix) with ESMTPSA id 9998920B7167;
	Thu, 23 Jul 2026 21:45:52 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9998920B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1784868356;
	bh=X/GJvTUB0Fc/V+y5K6V4KuOXG7ykfjR54qQ9NpMgq5k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=swgSdo9KScjxK2OqSJz8QOxqkfGxp4gXfakbWLqh8l3CT7QKquoToCBKsmB0bvG9m
	 0FKB4YCtb1VHT1C38M/FPHAIe0j+PbLP0xfoqdrF8gvhisMP8gAZNuZZN/90BTqDGG
	 zzV/TK3wmTWMVsTRTjI/f7YVxKsEzAwWsgWpIy+I=
Message-ID: <d52431ea-3166-459c-8f3d-988fdef63c32@linux.microsoft.com>
Date: Fri, 24 Jul 2026 10:16:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: smp: distinguish secondary CPUs that hang after
 reaching head.S
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Jinjie Ruan <ruanjinjie@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Thomas Huth <thuth@redhat.com>,
 Fuad Tabba <fuad.tabba@linux.dev>, Thomas Gleixner <tglx@kernel.org>,
 Pengjie Zhang <zhangpengjie2@huawei.com>,
 mrigendrachaubey <mrigendra.chaubey@gmail.com>,
 Saurabh Sengar <ssengar@linux.microsoft.com>
References: <20260722113044.1835365-1-namjain@linux.microsoft.com>
 <6e13c10f-ccc2-48c3-bf8a-d65133a33e17@huawei.com>
 <70e8596f-7316-4cc9-90e8-ff06a94c4616@arm.com>
Content-Language: en-US
From: Naman Jain <namjain@linux.microsoft.com>
In-Reply-To: <70e8596f-7316-4cc9-90e8-ff06a94c4616@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_214611_939590_63227AAC 
X-CRM114-Status: GOOD (  17.58  )
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



On 7/23/2026 11:26 AM, Anshuman Khandual wrote:
> 
> 
> On 23/07/26 8:19 AM, Jinjie Ruan wrote:
>>
>> 在 2026/7/22 19:30, Naman Jain 写道:
>>> When a secondary CPU fails to come online, __cpu_up() falls back to
>>> __early_cpu_boot_status, but boot status 0x0 is ambiguous: it cannot
>>> distinguish a CPU that never executed head.S (firmware/hypervisor never
>>> dispatched it, so it never ran a single instruction) from one that
>>> entered head.S, started executing, and then got stuck somewhere in kernel
>>> bring-up. Add a change to let us tell those two cases apart, which
>>> narrows down where to look when a CPU goes missing during boot.
>> I previously encountered this issue when debugging the parallel startup
>> of ARM64 secondary cores. It is difficult for the kernel to determine
>> whether the secondary core is hung in the firmware or whether it has not
>> executed a single instruction. So I think this motive is reasonable.
> 
> Why should kernel determine the difference here ? Would not the firmware
> know if it has started any secondary CPU for the kernel which must have
> come inside head.S ? If the cpu gets hung inside firmware while starting
> up then the debug responsibilities belong there instead.
> 
> Still wondering what's the rationale for this change.

Hello Anshuman,
This sounds fair to me. Let me elaborate the problem, beyond the scope 
of this patch. In production, we occasionally see these crashes where 
one of the CPU fails to bring up online, with 0x0 status code. 
Hypervisor may be missing the telemetry, but the problem is that we 
don't know if the secondary CPU ever started executing the instructions 
or is stuck somewhere between the start of head.S and marking itself 
online at the end of secondary_start_kernel().
There are couple of places, where we get those other status codes, but 
not everywhere. If the issue is not easily reproducible, experiments on 
local setups do not yield anything. That's where I am attempting to add 
some more information in kernel to debug these issues.

Regards,
Naman

