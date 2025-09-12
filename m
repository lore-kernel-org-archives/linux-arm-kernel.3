Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E848CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 15:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXLIcrZm+LNwlbOzko+dZ8lAjcDt0VuS9vFOFdLmx8U=; b=xkVwH50Hg2/Q7g4rNjwjr9LrnH
	RiEmG6s29uFpVZqlEUND9jUe6dyUfCmpQg9WgdNw+8VhRLFVuN8Y1CV7cycAJ7O+AfPprnalzqrTT
	6HSSNnTmV0yZdQgity2s24JR7JvalFuL0g5ITuEnCBy879Ao/1D0P9EkMscgzu2bo25rCe2oXA8b0
	QvbvjNjmYKG9F6pdn0GYDDsS7H/3qNLpN/fMfEeICmGgoCF+SYbtWyxEhVaq2ZSznbysDRHTGi8HS
	IEWPVngEiUeEIWthe1oLrSFfN4ioIXsSeWkpiZBQh+q3zjxW3IBNG0MnNFLgNyqVOYGhsPixVaFLo
	Vs0enAJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5Od-0000000A7Qx-0bqb;
	Fri, 12 Sep 2025 15:09:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5Oa-0000000A7Ps-1O6X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 15:09:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B8FD12FC;
	Fri, 12 Sep 2025 08:08:55 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE3143F694;
	Fri, 12 Sep 2025 08:08:58 -0700 (PDT)
Message-ID: <842edca0-11c7-43ac-ba4b-ab40678034e2@arm.com>
Date: Fri, 12 Sep 2025 16:08:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/29] arm_mpam: Add mpam_msmon_read() to read monitor
 value
From: Ben Horgan <ben.horgan@arm.com>
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-24-james.morse@arm.com>
 <1344b395-66aa-4714-b1fc-9c970c0fd0bf@arm.com>
Content-Language: en-US
In-Reply-To: <1344b395-66aa-4714-b1fc-9c970c0fd0bf@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_080904_505447_21637D2C 
X-CRM114-Status: GOOD (  15.13  )
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

Hi James,

On 9/11/25 16:46, Ben Horgan wrote:
> Hi James,
> 
> On 9/10/25 21:43, James Morse wrote:
>> Reading a monitor involves configuring what you want to monitor, and
>> reading the value. Components made up of multiple MSC may need values
>> from each MSC. MSCs may take time to configure, returning 'not ready'.
>> The maximum 'not ready' time should have been provided by firmware.
>>
>> Add mpam_msmon_read() to hide all this. If (one of) the MSC returns
>> not ready, then wait the full timeout value before trying again.
>>
>> CC: Shanker Donthineni <sdonthineni@nvidia.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> ---
>> Changes since v1:
>>  * Added XCL support.
>>  * Merged FLT/CTL constants.
>>  * a spelling mistake in a comment.
>>  * moved structrues around.
>> ---
>>  drivers/resctrl/mpam_devices.c  | 226 ++++++++++++++++++++++++++++++++
>>  drivers/resctrl/mpam_internal.h |  19 +++
>>  2 files changed, 245 insertions(+)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index cf190f896de1..1543c33c5d6a 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> +
>> +static void gen_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
>> +				   u32 *flt_val)
>> +{
>> +	struct mon_cfg *ctx = m->ctx;
>> +
>> +	/*
>> +	 * For CSU counters its implementation-defined what happens when not
>> +	 * filtering by partid.
>> +	 */
>> +	*ctl_val |= MSMON_CFG_x_CTL_MATCH_PARTID;
>> +
>> +	*flt_val = FIELD_PREP(MSMON_CFG_x_FLT_PARTID, ctx->partid);
>> +	if (m->ctx->match_pmg) {
>> +		*ctl_val |= MSMON_CFG_x_CTL_MATCH_PMG;
>> +		*flt_val |= FIELD_PREP(MSMON_CFG_x_FLT_PMG, ctx->pmg);
>> +	}
>> +
>> +	switch (m->type) {
>> +	case mpam_feat_msmon_csu:
>> +		*ctl_val = MSMON_CFG_CSU_CTL_TYPE_CSU;
>> +
>> +		if (mpam_has_feature(mpam_feat_msmon_csu_xcl, &m->ris->props))
>> +			*flt_val |= FIELD_PREP(MSMON_CFG_CSU_FLT_XCL,
>> +					       ctx->csu_exclude_clean);
>> +
>> +		break;
>> +	case mpam_feat_msmon_mbwu:
>> +		*ctl_val = MSMON_CFG_MBWU_CTL_TYPE_MBWU;

As you mentioned offline, this zeroes the other bits in *ctl_val.


Thanks,

Ben


