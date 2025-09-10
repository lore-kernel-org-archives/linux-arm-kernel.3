Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668C4CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 19:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJAyq8l3x5EiRQ1oQDy/pVL2rPvO0N+2cKIwEOSnKD0=; b=nPxSLzvNZZal1+NUDqr01FUpzD
	uoIpaz5RagOyY7EjdHss38BII0JXJq3tQMFoLal8uIn9lQQk8WDMqj4En821jDOq7TWPLEqR2Od0c
	2ax4ad1bWPFs6LbhDm7Ae+4crQw6CbkQIx/KBKj6PeAQlN18LA3JokwedGQn1vDCJ8PxJziOSO/1g
	niG2L34texlBlZ4H1Jqa/01epktg7PyfCoV71zqt8sObbNShYyLj6QvtO1VAdFEJsV3FcZqrD6ZSq
	BBAeF89HbXj9lIBZpt/RPexYce9fNgSwec7oTXvyN4MWTcftTXsZvZwxefiFQifGlkdXlgT1qoPSZ
	elu+byxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQWe-0000000GICp-1iVg;
	Wed, 10 Sep 2025 19:30:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQWb-0000000GIAr-2cJQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 19:30:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A97A016F8;
	Wed, 10 Sep 2025 12:30:28 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 093773F694;
	Wed, 10 Sep 2025 12:30:30 -0700 (PDT)
Message-ID: <761245fb-a045-4809-9fd9-5efc56794b37@arm.com>
Date: Wed, 10 Sep 2025 20:30:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 27/33] arm_mpam: Add mpam_msmon_read() to read monitor
 value
To: Ben Horgan <ben.horgan@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-28-james.morse@arm.com>
 <f71d944e-7f9d-489e-a278-2d09900f5d53@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <f71d944e-7f9d-489e-a278-2d09900f5d53@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_123037_799747_245F9E39 
X-CRM114-Status: GOOD (  15.24  )
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

On 29/08/2025 16:55, Ben Horgan wrote:
> On 8/22/25 16:30, James Morse wrote:
>> Reading a monitor involves configuring what you want to monitor, and
>> reading the value. Components made up of multiple MSC may need values
>> from each MSC. MSCs may take time to configure, returning 'not ready'.
>> The maximum 'not ready' time should have been provided by firmware.
>>
>> Add mpam_msmon_read() to hide all this. If (one of) the MSC returns
>> not ready, then wait the full timeout value before trying again.

>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index e7e00c632512..9ce771aaf671 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -973,6 +973,228 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)

>> +static void gen_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
>> +				   u32 *flt_val)
>> +{
>> +	struct mon_cfg *ctx = m->ctx;
>> +
>> +	switch (m->type) {
>> +	case mpam_feat_msmon_csu:
>> +		*ctl_val = MSMON_CFG_CSU_CTL_TYPE_CSU;
>> +		break;
>> +	case mpam_feat_msmon_mbwu:
>> +		*ctl_val = MSMON_CFG_MBWU_CTL_TYPE_MBWU;
>> +		break;
>> +	default:
>> +		return;
>> +	}
>> +
>> +	/*
>> +	 * For CSU counters its implementation-defined what happens when not
>> +	 * filtering by partid.
>> +	 */
>> +	*ctl_val |= MSMON_CFG_x_CTL_MATCH_PARTID;
>> +
>> +	*flt_val = FIELD_PREP(MSMON_CFG_MBWU_FLT_PARTID, ctx->partid);
>> +	if (m->ctx->match_pmg) {
>> +		*ctl_val |= MSMON_CFG_x_CTL_MATCH_PMG;
>> +		*flt_val |= FIELD_PREP(MSMON_CFG_MBWU_FLT_PMG, ctx->pmg);
>> +	}

> As we are using MSMON_CFG_MBWU_FLT_{PMG,PARTID} for both CSU and MBWU
> how about changing to MSMON_CFG_x_FLT_{PMG,PARTID}?

Sure,


>> +
>> +	if (mpam_has_feature(mpam_feat_msmon_mbwu_rwbw, &m->ris->props))
>> +		*flt_val |= FIELD_PREP(MSMON_CFG_MBWU_FLT_RWBW, ctx->opts);

> This needs to be conditional on the type of the monitor being
> configured. There is an XCL bit here for CSU monitors.

Fixed ... that wasn't there last time I looked!
I may as well wire that up too...


Thanks,

James

