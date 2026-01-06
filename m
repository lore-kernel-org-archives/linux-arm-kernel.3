Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98316C47BEA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 11:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHBDyXVIOAL9+6Fn2E8SrqGH6lc+RtsJ2XKqh2jPvJs=; b=EB2TQO6mkHvbv4PQNTXwcyRrGw
	I11nx0knH1H27Xj8MlAtxijd30fv0wRXHslpCM4d+x7FPvK0yKbnv7BFgY7yvUYlEzbka9g1SlhNE
	22J9QIRR7KEJpRUvinbiD+0a+xlGAi8/4ZwusM87SPvzegLTd14pDZxWDWqizq+gtjpxf12CC1pvi
	M1afpJQyZQs3G1biLBLfAzfVf4oD6CxXr3zkSw2CNXGM7WeIGdFMwswQc6sdhmChy9RG+IAVCQJoZ
	d4p132bqh7pIuzcLEBRyAYOgkJwjyrDW/uNPyfNt/nd8MX9ffiw9tNYb0OYMUSbfY1fwao8cXGn9a
	UMJN0jTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd56E-0000000Crgp-1lK7;
	Tue, 06 Jan 2026 11:19:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd56B-0000000Crg2-3rpR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 11:19:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E01A91595;
	Tue,  6 Jan 2026 03:19:31 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC3AE3F5A1;
	Tue,  6 Jan 2026 03:19:33 -0800 (PST)
Message-ID: <4152d2bb-098c-48db-94f0-a90306700266@arm.com>
Date: Tue, 6 Jan 2026 11:19:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/45] arm_mpam: resctrl: Implement
 resctrl_arch_reset_all_ctrls()
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20251219181147.3404071-1-ben.horgan@arm.com>
 <20251219181147.3404071-19-ben.horgan@arm.com>
 <20260105175154.00002041@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20260105175154.00002041@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_031940_014756_9C1401F0 
X-CRM114-Status: GOOD (  11.61  )
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

On 1/5/26 17:51, Jonathan Cameron wrote:
> On Fri, 19 Dec 2025 18:11:20 +0000
> Ben Horgan <ben.horgan@arm.com> wrote:
> 
>> From: James Morse <james.morse@arm.com>
>>
>> We already have a helper for resetting an mpam class and component.  Hook
>> it up to resctrl_arch_reset_all_ctrls() and the domain offline path.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> I left all the context as my one comment on this is I don't see a reason
> to expose mpam_reset_class()  Only the _locked() variant ever seems to be
> used outside of mpam_devices.c
> 
>> ---

>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
>> index 554e4887ba81..b9a739abb101 100644
>> --- a/drivers/resctrl/mpam_internal.h
>> +++ b/drivers/resctrl/mpam_internal.h
>> @@ -389,6 +389,13 @@ extern u8 mpam_pmg_max;
>>  void mpam_enable(struct work_struct *work);
>>  void mpam_disable(struct work_struct *work);
>>  
>> +/* Reset all the RIS in a class, optionally while holding cpus_read_lock() */
>> +void mpam_reset_class_locked(struct mpam_class *class);
>> +void mpam_reset_class(struct mpam_class *class);
> 
> Not clear from this patch why we need to expose mpam_reset_class()

Good spot. That's not required in this series, so I will stop exposing it.


Thanks,

Ben


