Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3F3C4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 15:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDAZiiGOxfH2GxyZqsj4FnhHxPcoy/n5y1EqcEDTFpU=; b=XkFCiW6TGlYWYMQHcpgRQl9TDe
	BDHsjP521trC1o3UVjfiykmT5APRRLHYzC0Mtriw+dHer/yX0BmvcOa4XEQx/EkMqNr/PULWIa7XR
	0XFWVCK+Mmc8sc5FdPJ6EzlrPNgLtuKyAKmPfHzeWJMuMH6JsQbl7ixq5V0OAMPU+PzZsDAfOheSa
	Dm0HZdxtK++o6WH5hqIG330Dsg/ECCXwUOtsDqZ9EKHimplBPsyqXGqVXhmol3YQFWEBjpgAat/m8
	kDPcmeQ0MGlSU0ZT2d52dPFbwaXkiXyxHUjhMq+KxxX07J+bPlazs14kJ64eyui2uZ3inuyfXtlC+
	mwg+5I6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZEo-0000000CGDx-0zcI;
	Wed, 22 Jul 2026 15:52:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZEj-0000000CGA4-3Eby
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 15:52:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFADD1595;
	Wed, 22 Jul 2026 08:51:50 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A4283F66F;
	Wed, 22 Jul 2026 08:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784735514; bh=Xjt0lBgGShXW7SqRhWOUnYIZ5HHakKCfZizHyeiPu1U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ee/BjEDdBxk5Ok6ePChYqTFf70qtxqUMxczNTFC4QVi+NgNCluA/VS6k+9ZcAae3W
	 KnS5mvhY5mcLeRZdGvL2RN0bOXLGoVgftFdr9Tmx5/5F6d4A6zzZU4UGqywR/ERfJY
	 OH2wWOSSiqYsH2xOb8tUZ0j5jFOOieUAC/xDyafQ=
Message-ID: <6776ab83-4e29-46d2-9d0b-e34b934a161a@arm.com>
Date: Wed, 22 Jul 2026 17:51:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/16] arm_mpam: let low level MSC read accessors
 return an error
To: Ben Horgan <ben.horgan@arm.com>,
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>,
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
 <6b2845cf-e7ba-4588-b65a-c52f8ea40237@arm.com>
 <7cbb06bc-7fac-4323-915a-9a6fc3330f5d@arm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <7cbb06bc-7fac-4323-915a-9a6fc3330f5d@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_085157_908986_55450A01 
X-CRM114-Status: GOOD (  25.31  )
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

Hi Jonathan, Ben,

On 7/15/26 18:01, Ben Horgan wrote:
> Hi Andre,
> 
> On 7/10/26 22:40, Andre Przywara wrote:
>> Hi Jonathan,
>>
>> many thanks for the time you spent on this - though it wasn't particularly pretty, I guess.
>>
>> This is just a quick reply, unfortunately (well...) I will be on holidays next week, so cannot reply
>> in detail now.
>>
>> On 7/10/26 20:11, Jonathan Cameron wrote:
>>> On Fri, 10 Jul 2026 16:45:05 +0200
>>> Andre Przywara <andre.przywara@arm.com> wrote:
>>>
>>>> The upcoming MPAM-Fb support does not use MMIO primitives to access an
>>>> MSC, but employs a shared-memory/doorbell based firmware protocol.
>>>> Its complexity means that is must be able to handle errors, whereas we
>>>> always assume an MSC access succeeds today.
>>>>
>>>> Change the __mpam_read_reg() low level accessor function to return the
>>>> requested data through a pointer, and return an error code instead.
>>>> At the moment this is always 0, but this will change with alternative
>>>> MSC access methods.
>>>> Change all users of those MSC read wrappers to comply with the new
>>>> prototype, though at the moment without propagating any errors.
>>>>
>>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>>
>>> Why do it in this order? It seems like it is a path for some code churn
>>> from patch to path.
>>
>> Well, this is pain however you do this - as you figured. And I knew this before, that's why I
>> avoided this in v1, but then found we have to bite the bullet at some point anyway, so we could as
>> well just do it now.
>>
>> So I did the change in one go, and the diff was completely unreadable and even more so unreviewable.
>> Then I figured to start with the actual root cause: the low level accessors, to show the motivation,
>> then split the rest up in reasonably small chunks. And with the unavoidable dependencies, this led
>> to the structure you see, with the added churn of requested changes and refactors between v2 and v3.
>>
> 
>  From my point view, I think the order of the patches is ok and I'd consider it a bonus if you do
> find a clean way to avoid changing the same line twice in this patch set. What I'm more interested
> in is that the code itself is clean and consistent but with correctness trumping everything. I
> hadn't discovered the ACQUIRE() and ACQUIRE_ERR() before but I do expect that, as Jonathan points
> out, they could be used judiciously to make the code clearer.

So I now squashed most of the write patches into the ones introducing 
the read return handling, more grouping them by function rather than by 
read or write. This already removes most of the "touches a line again" 
issues. The cost is a larger first patch.

And as mentioned in the previous replies, I also used scoped_guard() and 
friends to make the error handling look more common and more schematic.

Cheers,
Andre


