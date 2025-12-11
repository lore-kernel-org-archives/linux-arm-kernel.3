Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703F6D41C20
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 11:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vu5B6Ed3VbarfX0oicGBCAsIq8zRMFvt4RWXRT3eFpY=; b=etVNOKuuvXTR3U5dxm1+UFn277
	N7lglKPwbdwrngBMcO+6L+31ZeR3nr3G3rMyshlYneXBdLk85P+epOrPVVXE9BFsh837+s9uJT3po
	yyqFSw1Cw8i/FgsHsWvFPtF8PhVhp4/OGXIL6QUrA32zNoabuSwaelSdo56tuBMl3focYEz2ZGBJd
	gqfxfH7XayBmqBa03mt5L7klygiobCCdUnEQxHShTrqGRPImdSIoE/DCg1YrAs/3PJOsBK9OgvVFm
	XYc/sPLEDFjrCQIe8Xldq6sOW8bl7xF5ZqcIYG0YX9UVtmE+LsD0Xhk8LCkVBmUqmnyLmrAWe7D8f
	wy+FNjlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeum-0000000GXfs-16qL;
	Thu, 11 Dec 2025 11:32:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTeuj-0000000GXed-0ThC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 11:32:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01B97FEC;
	Thu, 11 Dec 2025 03:32:45 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC4583F740;
	Thu, 11 Dec 2025 03:32:48 -0800 (PST)
Message-ID: <b798402a-1bc4-4765-aff6-6e3c3a398987@arm.com>
Date: Thu, 11 Dec 2025 11:32:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 02/38] arm64: mpam: Re-initialise MPAM regs when CPU
 comes online
From: Ben Horgan <ben.horgan@arm.com>
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Gavin Shan
 <gshan@redhat.com>, rohit.mathew@arm.com, reinette.chatre@intel.com,
 Punit Agrawal <punit.agrawal@oss.qualcomm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
 <20251205215901.17772-3-james.morse@arm.com>
 <0ea282be-c44f-4562-9104-1efe57348a3e@arm.com>
 <b922ff73-c583-482e-8925-ad7758280705@arm.com>
Content-Language: en-US
In-Reply-To: <b922ff73-c583-482e-8925-ad7758280705@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_033253_193035_DF9F60B8 
X-CRM114-Status: GOOD (  13.28  )
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

Retraction... sorry

On 12/11/25 11:23, Ben Horgan wrote:
> Hi James,
> 
> On 12/9/25 15:13, Ben Horgan wrote:
>> Hi James,
>>
>> On 12/5/25 21:58, James Morse wrote:

> 
> Actually, this code is only run before the mpam enablement is finished,
> importantly before the mpam_enabled static key is set, and so
> arm64_mpam_current is still 0 for every cpu. For cpus that are brought
> up after boot time this is never run.

Actually, actually, this is run whenever a cpu comes online, even if by
hotplug later, and so arm64_mpam_current will be 0 as need on the first
switch on and the previous value for the cpu when it has previously been
off.

> 
> As SYS_MPAM0_EL1 and SYS_MPAM1_EL1 are unknown out of reset we should
> set them to 0 whenever a cpu comes online to make sure they initially
> use PARTID 0 as that is the only one guaranteed to have sensible
> defaults in the MSC. Once the mpam driver has configured the MSC we can
> start setting other values.
> 
>>
>>> +
>>> +	write_sysreg_s(regval, SYS_MPAM1_EL1);
>>> +	isb();
>>> +
>>> +	write_sysreg_s(regval, SYS_MPAM0_EL1);
>>>  }
>>>  
>>>  static bool
>>
>> Thanks,
>>
>> Ben
>>
>>
> 
> Thanks,
> 
> Ben
> 
> 

-- 
Thanks,

Ben


