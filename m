Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A183EC5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 08:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IxuEvEKt9YSTfORh8mS4ZQ294gNQc3o0l041RGqOsbk=; b=FxzuuVYhL/y9toKJrrrjPjD4xL
	PAZH+5TyXIvS8AqrhXD96xhFPju2ZjtjSEJ/MBaKn5UAKu5JmbmcIpHLZ+RRnnKX8bPUWXyHSlKBC
	KdHOWeUBfjIm1o8G9TPoYM/7Bmb24JPgBp2IYiayGLFFpBlaW/hRdGHvquIlfaord/lO0ZFJNJtX5
	DtGk7ctcjHnnjls7PtNbF/0PoYlGge5zFb09zhBh8dl6g7w8yT3EHPsSrR+fGvlHhMuuhrP0zgxSX
	4bj+iATWh2syeQsItNI+ro4Q72Lc7bRLpQS0QvzkF34DEWaw61gSaLQJfz7fZA1IUY37gWpTmQaxq
	rRxuUCNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiZd-0000000C3iZ-45NZ;
	Fri, 31 Jul 2026 08:26:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiZa-0000000C3i9-3gBK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 08:26:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 528C5204C;
	Fri, 31 Jul 2026 01:26:24 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 095FD3F86F;
	Fri, 31 Jul 2026 01:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785486388; bh=lgxIT/Jas/nejvD/2M4MCC2l9S9VYqSU034/2FQsDGQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZGYsZUTJppQSYW8a0oBCzKKt3gI6KiC5UOV3Dvzy40qxergb0EFEaiECLh2Lslrkq
	 zqhnP6jtOX3LZD5KmwAQ8QgsJiDtUwTNxt5wvfkimkCwCqwFk3yKbHv2LKnk6W8UK9
	 zUE5W4NW+UcrAyj2kT2NU9uQ3UM73BS/lryf3deU=
Message-ID: <d677717e-3d00-4bde-98f9-c3992bdf982b@arm.com>
Date: Fri, 31 Jul 2026 10:26:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/10] arm_mpam: detect and enable MPAM-Fb PCC support
To: Ben Horgan <ben.horgan@arm.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 Ritwick Sharma <ritwick.sharma@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260730152539.2712312-1-andre.przywara@arm.com>
 <20260730152539.2712312-11-andre.przywara@arm.com>
 <e09e7d37-59bb-4a4f-b47e-a014c674796e@arm.com>
 <b3224280-4925-41ed-8e45-838eb212d093@arm.com>
 <0511693b-5855-4419-8e1a-8444cfdd4253@arm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <0511693b-5855-4419-8e1a-8444cfdd4253@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_012631_017571_13EF8A60 
X-CRM114-Status: GOOD (  17.77  )
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

Hi Ben,

On 7/31/26 10:22, Ben Horgan wrote:
> Hi Andre,
> 
> On 7/31/26 09:16, Andre Przywara wrote:
>> Hi Ben,
>>
>> On 7/30/26 18:13, Ben Horgan wrote:
>>> Hi Andre,
>>>
>>> On 7/30/26 16:25, Andre Przywara wrote:
>>>> The Arm MPAM-Fb specification [1] describes a protocol to access MSC
>>>> registers through a firmware interface. This requires a shared memory
>>>> region to hold the message, and a mailbox to trigger the access.
>>>> For ACPI this is wrapped as a PCC channel, described using existing
>>>> ACPI abstractions.
>>>>
>>>> Add code to parse those PCC table descriptions associated with an MSC,
>>>> and store the parsed information in the MSC struct.
>>>> There can be multiple PCC channels, and each channel can serve multiple
>>>> MSCs, so we need to keep track of the channel usage, using a list and
>>>> a refcount.
>>>>
>>>> This will be used by the MPAM-Fb access wrapper code.
>>>>
>>>> [1] https://developer.arm.com/documentation/den0144/latest
>>>>
>>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>>> Tested-by: Ritwick Sharma <ritwick.sharma@arm.com>
>>> Ritwick gave his Tested-by for the series on v5. Any reason to just add the tag on this patch?
>>
>> submitting-patches.rst says:
>> "Both Tested-by and Reviewed-by tags, once received on mailing list from tester or reviewer, should
>> be added by author to the *applicable* patches when sending next versions."
>>
>> I think this system relies on MPAM-Fb, so he couldn't test each patch in isolation, but "just" that
>> MPAM-Fb works, which is what only patch 10/10 enables.
>>
>> So I find tags given for the whole series always tricky to handle, but in this case I figured patch
>> 10/10 would be the right target.
> 
> Ok, yes. I agree with that principle - I'm still learning how these things are done. Perhaps patch 8
> would have been relevant too.

That's actually a good point, will do this.

Thanks,
Andre

>>> I guess patch 9 has significant enough changes to drop tags but I don't see it for the others.
>>
>> Well, even smaller changes could ruin a whole thing, but IIUC in this case Ritwick's setup doesn't
>> even enable error IRQs, so this part wasn't tested anyway.
> 
> 
>>
>> Cheers,
>> Andre.
>>
> 


