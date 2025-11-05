Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71A7CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 12:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6qLM7cFUO6Rovi+sMaEuhR6tkw0vMx18u/1v+OOsBE=; b=EtGVaq2GWMTtvsqTqjhiFpKbkl
	+mQM/pzmA3hyeJn6mQF8oYXlnZuH9Sp2c1elxv78V9nsCIL2duJG5W+GhpzRzbck4wT0+2k5Q8TQq
	3sbqSzYnfGAvWSVpmDZgI480tffhwOeeU6Jp7koVfa/UrSzwUD+6RaA/pJ6H3gRdLJz717MZpjYGx
	5ASAaI3YEEzuO03Cl1YdMhOJYY/ie70WtVfEKSulWPC1HhdCJ94PY54vQQZI/s0xGLPXP2UwufcON
	UWgIdFSUSuEp4lnYeK1dewvcZ3w0a9nS7oEpzn1NAn/DDszbdmyaHM5P7xf1A2P7M8n/RVVNvy3+Q
	tqdJdbdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGcMd-0000000DaO8-2dzj;
	Wed, 05 Nov 2025 12:11:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGcMb-0000000DaNm-0MGB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 12:11:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7170E169C;
	Wed,  5 Nov 2025 04:11:33 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 973C53F66E;
	Wed,  5 Nov 2025 04:11:36 -0800 (PST)
Message-ID: <597d479f-4f1d-4cae-b15f-21ecc73a35bf@arm.com>
Date: Wed, 5 Nov 2025 12:11:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/29] arm_mpam: Add mpam_msmon_read() to read monitor
 value
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>,
 'James Morse' <james.morse@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 "carl@os.amperecomputing.com" <carl@os.amperecomputing.com>,
 "lcherian@marvell.com" <lcherian@marvell.com>,
 "bobo.shaobowang@huawei.com" <bobo.shaobowang@huawei.com>,
 "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
 Jamie Iles <quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
 "peternewman@google.com" <peternewman@google.com>,
 "dfustini@baylibre.com" <dfustini@baylibre.com>,
 "amitsinght@marvell.com" <amitsinght@marvell.com>,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
 "baisheng.gao@unisoc.com" <baisheng.gao@unisoc.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Gavin Shan <gshan@redhat.com>
References: <20251017185645.26604-1-james.morse@arm.com>
 <20251017185645.26604-24-james.morse@arm.com>
 <OSZPR01MB8798C425E5A820C2E0AAA7BC8BC5A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <OSZPR01MB8798C425E5A820C2E0AAA7BC8BC5A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_041145_205773_3A4BFA23 
X-CRM114-Status: GOOD (  21.35  )
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

Hi Shaopeng,

On 11/5/25 08:32, Shaopeng Tan (Fujitsu) wrote:
> Hello James,
> 
>> Reading a monitor involves configuring what you want to monitor, and reading
>> the value. Components made up of multiple MSC may need values from each
>> MSC. MSCs may take time to configure, returning 'not ready'.
>> The maximum 'not ready' time should have been provided by firmware.
>>
>> Add mpam_msmon_read() to hide all this. If (one of) the MSC returns not ready,
>> then wait the full timeout value before trying again.
>>
>> CC: Shanker Donthineni <sdonthineni@nvidia.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
[...]
>> +/* Call with MSC lock held */
>> +static void __ris_msmon_read(void *arg) {
>> +	u64 now;
>> +	bool nrdy = false;
>> +	struct mon_read *m = arg;
>> +	struct mon_cfg *ctx = m->ctx;
>> +	struct mpam_msc_ris *ris = m->ris;
>> +	struct mpam_props *rprops = &ris->props;
>> +	struct mpam_msc *msc = m->ris->vmsc->msc;
>> +	u32 mon_sel, ctl_val, flt_val, cur_ctl, cur_flt;
>> +
>> +	if (!mpam_mon_sel_lock(msc)) {
>> +		m->err = -EIO;
>> +		return;
>> +	}
>> +	mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL,
>> ctx->mon) |
>> +		  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
>> +	mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
>> +
>> +	/*
>> +	 * Read the existing configuration to avoid re-writing the same values.
>> +	 * This saves waiting for 'nrdy' on subsequent reads.
>> +	 */
>> +	read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
>> +	clean_msmon_ctl_val(&cur_ctl);
>> +	gen_msmon_ctl_flt_vals(m, &ctl_val, &flt_val);
>> +	if (cur_flt != flt_val || cur_ctl != (ctl_val | MSMON_CFG_x_CTL_EN))
>> +		write_msmon_ctl_flt_vals(m, ctl_val, flt_val);
> 
> When reading the CSU counter of a different control group, the counter is cleared to 0 by the write_msmon_ctl_flt_vals().
> 
>> +	switch (m->type) {
>> +	case mpam_feat_msmon_csu:
>> +		now = mpam_read_monsel_reg(msc, CSU);
>> +		if (mpam_has_feature(mpam_feat_msmon_csu_hw_nrdy,
>> rprops))
>> +			nrdy = now & MSMON___NRDY;
>> +		break;
> 
> The first time read the counter(MSMON_CSU), all bits except nrdy are 0.


I'm trying to understand your problem. Isn't what you are describing the
intended behaviour of the nrdy bit? It takes some time to get a count of
the cache utilization so if it's not ready this is set and the driver
retries.

> 
> This means when check the cache monitoring value the first time,
> cat mon_data/mon_L3_0*/llc_occupancy
> the result will be 0.
> From the second time, the result will return to normal.

This is not expected. On creating a new ctrl_mon group, generating some
memory traffic and checking the llc_occumpancy I see a non-zero value on
my setup. Not sure why you wouldn't.

> 
> Best regards,
> Shaopeng TAN
> 

Thanks,

Ben


