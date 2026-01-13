Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727D4D2F347
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 17:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DjClY2VYGy+8n/MbQIWlUZ3JA0HiiaFAfzP1ZeX18U=; b=WEOvXSGFrUxgTKO5OLERsmEs75
	MAZEEZ0obKg4PxR5+FZEoWQe5FTq18bIAntco74XYfvko5rmtRTJ9WUjv4bY85jPV7hoOtkghhNev
	yUzmy2SmC57hWgj6If2O90W+ItZX4wGH2p1+dx+9hOfNx593f/f06G1HlkpjpV852LUFB8fB4OzQG
	F0K0T2EmhQcGlTLdf40PKAA/rycnmICOsrp/nN1fG73oqdW6tJDi6SBk8EOhQQe8vC9dGxHWulMxM
	ZggIal5Jf2wp4y7+edE9Iem7ATqnbwo2fl9wu89qYSf50htbaThN6MKZU6F3o6whrkD2FfI2idzmT
	92Ex7GlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfi2J-00000007WCH-1Xe6;
	Tue, 13 Jan 2026 17:18:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfi2H-00000007WAX-0f5A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 17:18:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57B24497;
	Tue, 13 Jan 2026 09:18:19 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1E963F632;
	Tue, 13 Jan 2026 09:18:20 -0800 (PST)
Message-ID: <f4e77744-cb32-4cea-a23f-3cd1a2ae9d79@arm.com>
Date: Tue, 13 Jan 2026 17:18:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/45] arm_mpam: resctrl: Implement
 resctrl_arch_reset_all_ctrls()
To: Zeng Heng <zengheng4@huawei.com>, jonathan.cameron@huawei.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 catalin.marinas@arm.com, corbet@lwn.net, dave.martin@arm.com,
 david@kernel.org, dfustini@baylibre.com, fenghuay@nvidia.com,
 gshan@redhat.com, james.morse@arm.com, joey.gouly@arm.com, kobak@nvidia.com,
 kvmarm@lists.linux.dev, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 maz@kernel.org, oupton@kernel.org, peternewman@google.com,
 punit.agrawal@oss.qualcomm.com, quic_jiles@quicinc.com,
 reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 suzuki.poulose@arm.com, tan.shaopeng@fujitsu.com, will@kernel.org,
 xhao@linux.alibaba.com, wangkefeng.wang@huawei.com
References: <20260105175154.00002041@huawei.com>
 <20260109034506.1176234-1-zengheng4@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20260109034506.1176234-1-zengheng4@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_091829_263363_B28219EB 
X-CRM114-Status: GOOD (  15.25  )
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

Hi Zeng,

On 1/9/26 03:45, Zeng Heng wrote:
>> From: James Morse <james.morse@arm.com>
>> Date: Fri, 5 Dec 2025 21:58:32 +0000
>> Subject: [PATCH v2 18/45] arm_mpam: resctrl: Implement resctrl_arch_reset_all_ctrls()
>>
>> We already have a helper for resetting an mpam class and component.  Hook
>> it up to resctrl_arch_reset_all_ctrls() and the domain offline path.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>>  drivers/resctrl/mpam_devices.c  |  6 +++---
>>  drivers/resctrl/mpam_internal.h |  7 +++++++
>>  drivers/resctrl/mpam_resctrl.c  | 15 +++++++++++++++
>>  3 files changed, 25 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index bc4f1c80eab..d32e8700245 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -353,6 +366,8 @@ void mpam_resctrl_offline_cpu(unsigned int cpu)
>>
>>  		ctrl_dom_empty = true;
>>  		if (exposed_alloc_capable) {
>> +			mpam_reset_component_locked(dom->ctrl_comp);
>> +
>>  			ctrl_d = &dom->resctrl_ctrl_dom;
>>  			ctrl_dom_empty = mpam_resctrl_offline_domain_hdr(cpu, &ctrl_d->hdr);
>>  			if (ctrl_dom_empty)
> 
> mpam_cpu_offline() already directly calls mpam_reset_ris() to reset the
> MPAM MSC that is about to go offline. So why here still need
> mpam_resctrl_offline_cpu() to invoke mpam_reset_component_locked(),
> which ends up calling mpam_reset_ris() again?
> 
> Please point it out if I might have overlooked anything, thank you.

Yeah, this doesn't look right. A component will usually have affinity
with more than one cpu and if we weren't doing the reset elsewhere we
should only be doing the component level reset when the last of those
cpus goes offline. I'll give this cpu offline/online code another look over.

> 
> 
> Best Regards,
> Zeng Heng
> 

Thanks,

Ben


