Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16701CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EkLqdPxdSLJ7raVGNPbHVI/2jD90kTakfFHeUisjhwo=; b=yWFsNUTIL5gRdtJRhV0VKwMyQ8
	8ECsdO1xLt3LvA2Yo003YusXBoZActvE4Y+ppPFNkTz/jQj4QSp3lrBTMgzFSuJ5KIcGNvGxw5duM
	Dgm1feDDPAS9AKpRjadxXnnPNgFliLHHJrzDkUMuJB4KoLayUpV/afq8X074lhYz85T88Afc2IJAg
	wnKPR6cbsCb3yI//6dLLlamEDHjULikYvaotbZ6Kocr3kOhO38+YpJwsLzabP+gJ8ohbGHF1hV5g6
	DrIPxvhTKT4zoEMZkR17KUCIGTlLRUhMa+WHQDtlJw3mS7bh85us6yojq3eOfE0i862DSEI1OL20t
	PFGN0O1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBV6i-00000003B3l-3Eih;
	Tue, 29 Sep 2026 10:30:44 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBV6O-00000003ArK-1WgA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:30:26 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=EkLqdPxdSLJ7raVGNPbHVI/2jD90kTakfFHeUisjhwo=;
	b=oQDMyzVG0KUbNXrlQWQVUUgqlaxkHcIvP0UyRXSYha/jMxqpVXzhuX7JzocEF+KHQ8CFuZWfQ
	RVkrmt5LsNqvHKSsgtLnndDZqHoZkw0pdq20Iamax3CgIsFWe1TahupnpVNy6Uctf2+KKGlgdsJ
	lnasTD8Tzgck/G26vQR3kaw=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4hvDdv3WJpz1T4dr;
	Tue, 29 Sep 2026 18:18:11 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 924A140537;
	Tue, 29 Sep 2026 18:30:11 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 29 Sep 2026 18:30:10 +0800
Message-ID: <10e3784d-fcb0-4d61-b9e1-27a0ad5c9113@huawei.com>
Date: Tue, 29 Sep 2026 18:30:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/5] KVM: arm64: pgtables: Change write bit from
 S2AP_W to DBM
To: Leonardo Bras <leo.bras@arm.com>
CC: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>, Fuad
 Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden
	<seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
	<yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Raghavendra
 Rao Ananta <rananta@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20260901171558.2674031-1-leo.bras@arm.com>
 <20260901171558.2674031-2-leo.bras@arm.com> <86bja17cg7.wl-maz@kernel.org>
 <aql8jY4o8SzjJuFU@LeoBrasDK> <aqnku2TcFzIKhjQl@kernel.org>
 <aqp73SxO78o7LJTs@LeoBrasDK>
 <eb629070-a02f-426a-92ee-b2c8f9e2aa9a@huawei.com>
 <arE8EOPh1-NWtFIU@LeoBrasDK>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <arE8EOPh1-NWtFIU@LeoBrasDK>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.103]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_033025_072336_A75C248D 
X-CRM114-Status: GOOD (  30.44  )
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



On 9/21/2026 10:15 PM, Leonardo Bras wrote:
> On Fri, Sep 18, 2026 at 05:39:17PM +0800, Tian Zheng wrote:
>>
>>
>> On 9/16/2026 7:22 PM, Leonardo Bras wrote:
>>> On Tue, Sep 15, 2026 at 05:37:15PM -0700, Oliver Upton wrote:
>>>> On Tue, Sep 15, 2026 at 06:12:45PM +0100, Leonardo Bras wrote:
>>>>>> Yes, the HW should ignore it. But we have also
>>>>>> seen quite a few broken designs in this area...
>>>>>>
>>>>>
>>>>> I lack experience on what bad thing could happen. So I will expand on what
>>>>> I belive to understand up to here:
>>>>>
>>>>> - The PTE is in memory, so the DBM bit can be set regardless of being RES0
>>>>> - For SW pagetable walking, I don't think 'bit 51 == 0' is checked
>>>>> - For HW pagetable walking, maybe some faulty implementation may rely on
>>>>>     bit51 being RES0, and fault otherwise.
>>>>>
>>>>> If that's the case, then we would have to actually support both encodings,
>>>>> and only enable the new one if HAFDBS is available in the system.
>>>>>
>>>>> I just wonder how high are the chances to have such a broken design,
>>>>> or other broken designs did not come to my mind, and if we have to start
>>>>> with that multiple-encoding option.
>>>>
>>>> FWIW, the host stage-1 already uses the DBM bit unconditionally,
>>>> treating it as a software bit on implementations without HAFDBS.
>>>> Although given the quality of any garden variety Arm MMU I understand
>>>> where Marc is coming from.
>>>>
>>>> I don't think the HAFDBS enablement is complicated enough to be done in
>>>> a separate series without any meaningful users, nor would I really be
>>>> interested in taking it without, say, HDBSS.
>>>>
>>>> Can you please work with Tian to get a combined series out for this?
>>>>
>>>
>>> Hi Oliver, thanks for reviewing!
>>>
>>> Sure, one of the reasons I sent like this is so Tian could use it as a base
>>> for his next version.
>>>
>>>
>>
>> Hi Oliver, Leo,
>>
>> Works for us. I plan to send HDBSS v5 maybe next week with this series
>> merged in. Both dirty-tracking consumers are already built on top of the
>> DBM approach: dirty ring and dirty bitmap.
>>
>> Leo, with your blessing, I'd like to pick patches 1-4 into the HDBSS
>> tree with your Signed-off-by preserved and mine added on top, plus some
>> bug fixes on top of this RFC series.
> 
> Yeah, no problem on my side. I would just observe the maintainers' comments
> on those before merging them.
> 

All right, thanks.

Tian

>>
>> For patch 5, I'd like to rework it into a derived hardware dirty mode
>> that replaces both kvm_set_hafdbs() and our earlier HDBSS enable/disable
>> hooks, so the whole thing lands as one series.
>>
> 
> My intention when I wrote that patch was to add a base so you could add
> HDBSS on kvm_arch_commit_memory_region() with new patch such as:
> 
> 	/* Disable HAFDBS when dirty-logging starts */
> 	if (kvm_supports_hafdbs(kvm))
> 		kvm_set_hafdbs(kvm, 0);
> +	else
> +		kvm_enable_hdbss(kvm);
> ...
> 
> 	/* If dirty-logging was canceled, set HAFDBS back on */
> 	if (kvm_supports_hafdbs(kvm) &&
> 	    atomic_read(&kvm->nr_memslots_dirty_logging) == 0)
> 		kvm_set_hafdbs(kvm, 1);
> +	else
> +		kvm_disable_hdbss(kvm);
> 
> 
> That being said, I need to run tests to make sure the usage of HAFDBS
> outside of dirty_tracking makes any sense in terms of performance, but if
> that's not the case, it would be fine to rework it so it does not
> enable/disable HAFDBS there.
> 
>> Performance looks good in both dirty ring and dirty bitmap scenarios so
>> far.
>>
> 
> Awesome!
> 
> Thanks!
> Leo
> 


