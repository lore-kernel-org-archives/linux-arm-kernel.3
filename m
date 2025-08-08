Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E58C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 07:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9L19gAHXIx+TjDdTptEWaC0VHqB0bVrkCQOOb6Jwzw=; b=fJZOF9XUFQELnUjT0yAkvOPsfJ
	1K9Qo+G1nE+/xgtJAYONLi/Vf9Typ84JYWhG9zp1LcaxPazLBHmCNY5Kq5k+d45zjmaSAJ+qWDDAO
	w1Bwo+I7vFae0/R1IzZmUMXX9TllTl/C/dHQnDWdfa0vy0Cqz6E8v4x88jyCxaCFBtpz53ncNvJVJ
	c5Xhx2NsGjF+C0jganDrkw/Q7x7W3B8fFXgBh2rHlJ/kXEc+Alu7p1wLMFGbKMwRFjaNoPcCnekzl
	u/Lk/3x7ezvNR36YT6vnpvnj0MynWU7lvGo3SUU4GI3KCwZqn0WXd2n9V16dKLeI/fz911K968//E
	/paOFgqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHQB-00000002BJK-0PDP;
	Fri, 08 Aug 2025 07:21:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHGo-00000002A6H-23e7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 07:12:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43FB822EA;
	Fri,  8 Aug 2025 00:11:57 -0700 (PDT)
Received: from [10.57.5.99] (unknown [10.57.5.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 358A53F673;
	Fri,  8 Aug 2025 00:12:00 -0700 (PDT)
Message-ID: <c526e084-dcd3-4117-873e-67c6d9869b8f@arm.com>
Date: Fri, 8 Aug 2025 08:11:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 25/36] arm_mpam: Register and enable IRQs
To: Ben Horgan <ben.horgan@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Zeng Heng
 <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
 Carl Worth <carl@os.amperecomputing.com>,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>
References: <20250711183648.30766-1-james.morse@arm.com>
 <20250711183648.30766-26-james.morse@arm.com>
 <a8dd0921-9d25-4f57-97ee-9b44b8ff5057@arm.com>
Content-Language: en-US
From: James Morse <james.morse@arm.com>
In-Reply-To: <a8dd0921-9d25-4f57-97ee-9b44b8ff5057@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_001206_583310_01B9AAA3 
X-CRM114-Status: GOOD (  13.55  )
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

On 28/07/2025 11:49, Ben Horgan wrote:
> On 7/11/25 19:36, James Morse wrote:
>> Register and enable error IRQs. All the MPAM error interrupts indicate a
>> software bug, e.g. out of range partid. If the error interrupt is ever
>> signalled, attempt to disable MPAM.
>>
>> Only the irq handler accesses the ESR register, so no locking is needed.
>> The work to disable MPAM after an error needs to happen at process
>> context, use a threaded interrupt.
>>
>> There is no support for percpu threaded interrupts, for now schedule
>> the work to be done from the irq handler.
>>
>> Enabling the IRQs in the MSC may involve cross calling to a CPU that
>> can access the MSC.
>> diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/
>> mpam_devices.c
>> index 145535cd4732..af19cc25d16e 100644
>> --- a/drivers/platform/arm64/mpam/mpam_devices.c
>> +++ b/drivers/platform/arm64/mpam/mpam_devices.c
>> @@ -1548,11 +1638,193 @@ static void mpam_enable_merge_features(struct list_head

>> +static int mpam_enable_msc_ecr(void *_msc)
>> +{
>> +    struct mpam_msc *msc = _msc;
>> +
>> +    __mpam_write_reg(msc, MPAMF_ECR, 1);
> You can use MPAMF_ECR_INTEN.

Sure,


>> +
>> +    return 0;
>> +}

>> @@ -1644,7 +1939,6 @@ void mpam_enable(struct work_struct *work)
>>       struct mpam_msc *msc;
>>       bool all_devices_probed = true;
>>   -    /* Have we probed all the hw devices? */
> Stray change. Keep the comment or remove it in the patch that introduced it.

Fixed.


Thanks,

James



