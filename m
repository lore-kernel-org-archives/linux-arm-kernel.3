Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7570C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 05:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jw2uiP8cUGCdhPv/LxU9CPv+frywgpyLX4urRLZhxvw=; b=vbAKtfK+noAEF6pLkKOAWRPdnV
	KD6xNfcZtVWbY6zlDp+OM16phuwWBEn0hlXjchrOLly1B2LrXsnXQJCI3Cbl/yQx/FjnfVfkPhX0Y
	B8MNa86tLtnNz3PsWRL775VQi5nAjWPiSN2fhQ42CJHHAxY32smyOmMclxUCGKpzN9/o+dlzMa15m
	25bM890knwyaaFjpw2KB2SxMhkZ6iOZVUJY6YgBLqiY0H2I3cna+KIjvmTi3p1jsxAhveTOx+tvWC
	cWQ9IcTwM7zHi7qm1Hda8xER3urNAF7Qh8WFPNhqOsk49A0USops6i/mVRwPKJfmTdD0wWbwFktNU
	WJ2Ap2bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woE2Z-00000001z5o-19z3;
	Mon, 27 Jul 2026 05:38:15 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woE2X-00000001z5R-2LmB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 05:38:14 +0000
Received: from [10.7.58.6] (unknown [4.194.122.162])
	by linux.microsoft.com (Postfix) with ESMTPSA id 926BA20B7166;
	Sun, 26 Jul 2026 22:37:52 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 926BA20B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1785130675;
	bh=Jw2uiP8cUGCdhPv/LxU9CPv+frywgpyLX4urRLZhxvw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CmE9F8/jlZtTcF9dHjxwTinRAqbe0e88Z9h4nAJbbiTZkkAeNrzrlyQiWkloWWY3G
	 FymA/q3zeS4GGJ7U/lW8V513b2VPtrvyGk7ayEEkvADHfp8WKx0T/SLkznoKo9pCYh
	 hjH4ch5K3oHTgLnbpm4+hl0jIGpi+NlujR9UoOdk=
Message-ID: <45ab9640-14b7-48d7-89e2-109aa3935539@linux.microsoft.com>
Date: Mon, 27 Jul 2026 11:08:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: smp: distinguish secondary CPUs that hang after
 reaching head.S
To: Will Deacon <will@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
 Jinjie Ruan <ruanjinjie@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Thomas Huth <thuth@redhat.com>,
 Fuad Tabba <fuad.tabba@linux.dev>, Thomas Gleixner <tglx@kernel.org>,
 Pengjie Zhang <zhangpengjie2@huawei.com>,
 mrigendrachaubey <mrigendra.chaubey@gmail.com>,
 Saurabh Sengar <ssengar@linux.microsoft.com>
References: <20260722113044.1835365-1-namjain@linux.microsoft.com>
 <6e13c10f-ccc2-48c3-bf8a-d65133a33e17@huawei.com>
 <70e8596f-7316-4cc9-90e8-ff06a94c4616@arm.com>
 <d52431ea-3166-459c-8f3d-988fdef63c32@linux.microsoft.com>
 <amYPss8PK9dgg2TD@willie-the-truck>
Content-Language: en-US
From: Naman Jain <namjain@linux.microsoft.com>
In-Reply-To: <amYPss8PK9dgg2TD@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_223813_652255_7E4B0957 
X-CRM114-Status: GOOD (  26.98  )
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



On 7/26/2026 7:16 PM, Will Deacon wrote:
> On Fri, Jul 24, 2026 at 10:16:03AM +0530, Naman Jain wrote:
>> On 7/23/2026 11:26 AM, Anshuman Khandual wrote:
>>> On 23/07/26 8:19 AM, Jinjie Ruan wrote:
>>>> 在 2026/7/22 19:30, Naman Jain 写道:
>>>>> When a secondary CPU fails to come online, __cpu_up() falls back to
>>>>> __early_cpu_boot_status, but boot status 0x0 is ambiguous: it cannot
>>>>> distinguish a CPU that never executed head.S (firmware/hypervisor never
>>>>> dispatched it, so it never ran a single instruction) from one that
>>>>> entered head.S, started executing, and then got stuck somewhere in kernel
>>>>> bring-up. Add a change to let us tell those two cases apart, which
>>>>> narrows down where to look when a CPU goes missing during boot.
>>>> I previously encountered this issue when debugging the parallel startup
>>>> of ARM64 secondary cores. It is difficult for the kernel to determine
>>>> whether the secondary core is hung in the firmware or whether it has not
>>>> executed a single instruction. So I think this motive is reasonable.
>>>
>>> Why should kernel determine the difference here ? Would not the firmware
>>> know if it has started any secondary CPU for the kernel which must have
>>> come inside head.S ? If the cpu gets hung inside firmware while starting
>>> up then the debug responsibilities belong there instead.
>>>
>>> Still wondering what's the rationale for this change.
>>
>> Hello Anshuman,
>> This sounds fair to me. Let me elaborate the problem, beyond the scope of
>> this patch. In production, we occasionally see these crashes where one of
>> the CPU fails to bring up online, with 0x0 status code. Hypervisor may be
>> missing the telemetry, but the problem is that we don't know if the
>> secondary CPU ever started executing the instructions or is stuck somewhere
>> between the start of head.S and marking itself online at the end of
>> secondary_start_kernel().
>> There are couple of places, where we get those other status codes, but not
>> everywhere. If the issue is not easily reproducible, experiments on local
>> setups do not yield anything. That's where I am attempting to add some more
>> information in kernel to debug these issues.
> 
> I think this is a game of diminishing returns. There's a lot of stuff
> that the firmware/hypervisor can get wrong here and trying to detect or
> handle that in Linux is going to be a real mess. For example, if it
> enters the kernel at the wrong address, or in the wrong mode, or with
> the MMU enabled etc. It sounds like you don't have much idea about
> what happens in the failure case, so it might not even execute the code
> that you're adding correctly.

That is true. I agree. While we cannot and should not worry about adding 
logs for each of these firmware failure points in kernel, do you see any 
merit in adding any of this information to the kernel to at least narrow 
down the problem?

Or, can I safely consider 0x0 unknown error in CPU bring-up to be 
definitely a result of firmware/Hypervisor issues?

Regards,
Naman

> 
> It's also going to conflict heavily with the ongoing parallel bringup
> work, which significantly reworks this code.
> 
> I think you need to add the debug to your hypervisor, rather than the
> kernel.
> 
> Will



