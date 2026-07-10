Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E45C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 21:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfMki8oE7BIFCL2lqHuG9Ejx2+WCsfDaQWvSORqO1io=; b=oHJqHDm3ldEviY3X8OKkAO9Tco
	pdOK5x0foX1VJoiR9b0+NWz00zTVdbRFf2XfirCiFhAer0IsCxr33Q96ZQL7bC17ENqrJ09zL72V7
	B+NGu7mCx+0SdfNwwq0xPnv+if5YxnjR0b0rO6TJ6Oka23NSAcQA/OtarggkHZ0KSdv2sU6f+1VBW
	O2w2Y12wm5mWcF8z+OLOvSS1LmsBOe/LbcCxQaj+GSDLHTBJYJ5s4KFl7nddKUD4YV97gxoETmqQe
	lSEKUJ0OuwJ/WaqISscfSqKSDrA6BQvXo1jg5RUPrf3ksq8EVl5EZYKYRFfb2zOSi3O1zTn0C6rVk
	4SUbJn5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIxj-00000005s16-36Fo;
	Fri, 10 Jul 2026 21:40:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIxh-00000005s0W-0IzQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 21:40:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CC8616A3;
	Fri, 10 Jul 2026 14:40:39 -0700 (PDT)
Received: from [10.20.1.47] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2C0C3F99C;
	Fri, 10 Jul 2026 14:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783719643; bh=BaNahvn2h3Vv8JzR4dyMjs4FnPXEyIdEigSNsI7/27g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lwYt9NCo+PKUMG6PhHT/mBAiSGNqqBXfRE4XSJC/QJnLmxTaBbxYvbdNli8CivxI0
	 Uh23DQAT9P4A78gQp01gbOkjI1ZHTp4KCN0ipb9krLlcnXP33VtZPqIi1+sec3pGOa
	 taRRhQTeqy41TAGmAl4RpyuBQIeYHpWZeyLDASBs=
Message-ID: <6b2845cf-e7ba-4588-b65a-c52f8ea40237@arm.com>
Date: Fri, 10 Jul 2026 23:40:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/16] arm_mpam: let low level MSC read accessors
 return an error
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260710144520.917375-1-andre.przywara@arm.com>
 <20260710144520.917375-2-andre.przywara@arm.com>
 <20260710111159.00001367@oss.qualcomm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260710111159.00001367@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_144045_307784_1CCE16AF 
X-CRM114-Status: GOOD (  33.58  )
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

Hi Jonathan,

many thanks for the time you spent on this - though it wasn't 
particularly pretty, I guess.

This is just a quick reply, unfortunately (well...) I will be on 
holidays next week, so cannot reply in detail now.

On 7/10/26 20:11, Jonathan Cameron wrote:
> On Fri, 10 Jul 2026 16:45:05 +0200
> Andre Przywara <andre.przywara@arm.com> wrote:
> 
>> The upcoming MPAM-Fb support does not use MMIO primitives to access an
>> MSC, but employs a shared-memory/doorbell based firmware protocol.
>> Its complexity means that is must be able to handle errors, whereas we
>> always assume an MSC access succeeds today.
>>
>> Change the __mpam_read_reg() low level accessor function to return the
>> requested data through a pointer, and return an error code instead.
>> At the moment this is always 0, but this will change with alternative
>> MSC access methods.
>> Change all users of those MSC read wrappers to comply with the new
>> prototype, though at the moment without propagating any errors.
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> 
> Why do it in this order? It seems like it is a path for some code churn
> from patch to path.

Well, this is pain however you do this - as you figured. And I knew this 
before, that's why I avoided this in v1, but then found we have to bite 
the bullet at some point anyway, so we could as well just do it now.

So I did the change in one go, and the diff was completely unreadable 
and even more so unreviewable. Then I figured to start with the actual 
root cause: the low level accessors, to show the motivation, then split 
the rest up in reasonably small chunks. And with the unavoidable 
dependencies, this led to the structure you see, with the added churn of 
requested changes and refactors between v2 and v3.

> If you started at the outermost calls and
> worked in adding error handling at each layer, you wouldn't end up with
> the change here to add the parameter, then the same lines changed again
> to stash the new return value. Those lines would change just once.
> Maybe I'm wrong though and it ends up even messier.

Well, I guess there are a few ways to do this, but I doubt there is a 
really great one. And as you can imagine, there is little fun in trying 
a number of them, then comparing them. Doing this the first time was 
already painful. So I thought to just pick one approach and see what 
people say - I guess this was the wrong approach then :-(

> Or as you suggest, maybe just squash the patches, which will also
> remove the churn.
> 
> Jonathan
> 
>> @@ -226,10 +230,11 @@ static inline void _mpam_write_monsel_reg(struct mpam_msc *msc, u16 reg, u32 val
>>   
>>   static bool mpam_msc_check_aidr(struct mpam_msc *msc)
>>   {
>> -	u32 aidr = __mpam_read_reg(msc, MPAMF_AIDR);
>> -	u32 major = FIELD_GET(MPAMF_AIDR_ARCH_MAJOR_REV, aidr);
>> -	u32 minor = FIELD_GET(MPAMF_AIDR_ARCH_MINOR_REV, aidr);
>> +	u32 aidr, major, minor;
>>   
>> +	__mpam_read_reg(msc, MPAMF_AIDR, &aidr);
> 
> This will need updating to handle the error.  If you were to instead do
> the patches in the opposite order. So add return value to the outer
> most calls that is always 0 then work your way in it should end up
> as a fair bit less code churn.

But is it really better to review? You later say code lines are cheap, 
I'd say commits are cheap as well, but reviews are not. The idea was to 
allow separate, contained reviews, without forcing people to sit through 
all of this in one go - which you apparently did, so my condolences.
So yes, it's not the best to touch lines several times, but do we really 
care so much? Is it just about git blame?

Cheers,
Andre

> That update is in a later patch.
> 
>> +	major = FIELD_GET(MPAMF_AIDR_ARCH_MAJOR_REV, aidr);
>> +	minor = FIELD_GET(MPAMF_AIDR_ARCH_MINOR_REV, aidr);
>>   	/*
>>   	 * v0.0 and >v2.x aren't supported, but anything else should be backward
>>   	 * compatible to v0.1 or v1.0.


