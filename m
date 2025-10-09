Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4384CCD18C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 17:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NpcUlGnJ9MJJn2bH2KIjiYghvYVdholoJBCO5p5vf1w=; b=mpaQKi+gRefh+kmIqNe6CDsflZ
	jA2xryCGqddkO2aJgNswcvlgUPq7+itmWNUDbJrnS1+lRplJM6QuocG5MUdzvS+6G5RLLBoFMooRv
	Sb8goBIoeVEFpDd/yMqrbTs3PLGQiHqFV3AYu0RsNcZI+LYH53smn/CjTNEtklE2y3dE9kW0kXgtJ
	3TYJUOOmaGwt8/mZ1tzfIEl82nQX19rWl0/XPpZyNnlaoedV1tv58cZMpZ4h7/B9e238RQLaJQdMX
	2+MGWoZWZd6tpHK2oIAokaJQ9/QFFQ3WfwItYgffv57CTPmPmABexrkXySR8C+bFrzpcu7wKa9m4G
	tDszZNNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ulP-00000006qGw-10Wx;
	Thu, 09 Oct 2025 17:49:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ulM-00000006qF9-1qyA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 17:49:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A1342641;
	Thu,  9 Oct 2025 10:49:02 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EF543F66E;
	Thu,  9 Oct 2025 10:49:05 -0700 (PDT)
Message-ID: <d009edc0-651e-4815-89de-19c419ba0183@arm.com>
Date: Thu, 9 Oct 2025 18:48:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/29] arm_mpam: Track bandwidth counter state for
 overflow and power management
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com, Rob Herring <robh@kernel.org>,
 Rohit Mathew <rohit.mathew@arm.com>, Rafael Wysocki <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-25-james.morse@arm.com>
 <20250912142419.00006c6d@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250912142419.00006c6d@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_104912_529385_5E16FF3A 
X-CRM114-Status: GOOD (  14.48  )
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

On 12/09/2025 14:24, Jonathan Cameron wrote:
> On Wed, 10 Sep 2025 20:43:04 +0000
> James Morse <james.morse@arm.com> wrote:
> 
>> Bandwidth counters need to run continuously to correctly reflect the
>> bandwidth.
>>
>> The value read may be lower than the previous value read in the case
>> of overflow and when the hardware is reset due to CPU hotplug.
>>
>> Add struct mbwu_state to track the bandwidth counter to allow overflow
>> and power management to be handled.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>

> Trivial comment inline.  I haven't spent enough time thinking about this
> to give a proper review so no tags yet.

>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 1543c33c5d6a..eeb62ed94520 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -918,6 +918,7 @@ static void gen_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
>>  	*ctl_val |= MSMON_CFG_x_CTL_MATCH_PARTID;
>>  
>>  	*flt_val = FIELD_PREP(MSMON_CFG_x_FLT_PARTID, ctx->partid);
>> +

> Unrelated change.  If it makes sense figure out where to push it back to.

Done. This is may favourite mistake to make with a merge conflict!


Thanks,

James


>>  	if (m->ctx->match_pmg) {
>>  		*ctl_val |= MSMON_CFG_x_CTL_MATCH_PMG;
>>  		*flt_val |= FIELD_PREP(MSMON_CFG_x_FLT_PMG, ctx->pmg);
> 

