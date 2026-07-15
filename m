Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C60AC4450E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 16:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PnMaZ9rLUwegJbCl+hMXgmC4wVJrv88KFOLnkV0W75Q=; b=Y5oQYcbZKv9XPEGxt9LkIQsUn/
	rZyE/3LJoFNLLvo3x9DZYuqKU8tpVvEFyCt1Uq3CSiYTISuac1HiOCCa/al1E1I02sI7mHfmRbuKd
	0ZtFFLrmnF4+HMVuoSu0lS/tUx1ZpEKcK+5s4+xN0H5t3wKuknuO7izydZo6ep/aQqpXgExzTnotk
	IIn2boZyTLX82g0SipOS8p1sCHGoH5pmRg2tNk3stkj8UWwrS38xZZiDLONhNzGh1C/pu3OSNQKdp
	7ztEnRx3MJBhM9rIGUuSoRd3zirDHC6Y1j5afNqpLe6WhRdHw36lV6E3Mqygu1YgJLQeGlczaEd0+
	FuPriTDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk237-0000000FOZQ-2ccE;
	Wed, 15 Jul 2026 16:01:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk235-0000000FOZ0-3RW4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 16:01:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B11481477;
	Wed, 15 Jul 2026 09:01:21 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3315C3F905;
	Wed, 15 Jul 2026 09:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784131285; bh=mJJklrROHEk/tA5Mbwt+AYggUFwOMun7Z1dh7jn/DRE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FKpGyqfyRetwxovw7y092KStA6+osWVtZ6nL37lpeA8y6aLmqMjEoPzX4rOKopVqf
	 StzSCYj2CtYBlVW8jVmM/BWw8XRB3Ehp2QslU5myRNBlRXGCN95lC1FngFDDiBOko2
	 HLz4+DH1EIFjanOUJBaTfLaP2VZms3VeDHYZly4M=
Message-ID: <7cbb06bc-7fac-4323-915a-9a6fc3330f5d@arm.com>
Date: Wed, 15 Jul 2026 17:01:21 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v3 01/16] arm_mpam: let low level MSC read accessors
 return an error
To: Andre Przywara <andre.przywara@arm.com>,
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
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <6b2845cf-e7ba-4588-b65a-c52f8ea40237@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_090127_967070_B227E684 
X-CRM114-Status: GOOD (  25.59  )
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

Hi Andre,

On 7/10/26 22:40, Andre Przywara wrote:
> Hi Jonathan,
> 
> many thanks for the time you spent on this - though it wasn't particularly pretty, I guess.
> 
> This is just a quick reply, unfortunately (well...) I will be on holidays next week, so cannot reply
> in detail now.
> 
> On 7/10/26 20:11, Jonathan Cameron wrote:
>> On Fri, 10 Jul 2026 16:45:05 +0200
>> Andre Przywara <andre.przywara@arm.com> wrote:
>>
>>> The upcoming MPAM-Fb support does not use MMIO primitives to access an
>>> MSC, but employs a shared-memory/doorbell based firmware protocol.
>>> Its complexity means that is must be able to handle errors, whereas we
>>> always assume an MSC access succeeds today.
>>>
>>> Change the __mpam_read_reg() low level accessor function to return the
>>> requested data through a pointer, and return an error code instead.
>>> At the moment this is always 0, but this will change with alternative
>>> MSC access methods.
>>> Change all users of those MSC read wrappers to comply with the new
>>> prototype, though at the moment without propagating any errors.
>>>
>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>
>> Why do it in this order? It seems like it is a path for some code churn
>> from patch to path.
> 
> Well, this is pain however you do this - as you figured. And I knew this before, that's why I
> avoided this in v1, but then found we have to bite the bullet at some point anyway, so we could as
> well just do it now.
> 
> So I did the change in one go, and the diff was completely unreadable and even more so unreviewable.
> Then I figured to start with the actual root cause: the low level accessors, to show the motivation,
> then split the rest up in reasonably small chunks. And with the unavoidable dependencies, this led
> to the structure you see, with the added churn of requested changes and refactors between v2 and v3.
> 

From my point view, I think the order of the patches is ok and I'd consider it a bonus if you do
find a clean way to avoid changing the same line twice in this patch set. What I'm more interested
in is that the code itself is clean and consistent but with correctness trumping everything. I
hadn't discovered the ACQUIRE() and ACQUIRE_ERR() before but I do expect that, as Jonathan points
out, they could be used judiciously to make the code clearer.

Thanks,

Ben

