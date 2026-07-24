Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DD2C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 12:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ve7O+p/ZPPGD54e+pKd4xh48oyQEWxZkpy09ovqKA5I=; b=ptd6Mfkt522KjbJkXHukR28uia
	Y8Y84dXWyYSuD8YfbINo8lPV6zO828XZbsx7veP1kIUowzraYVSwyJiE6wsjd1lh03r8CME7ulrbz
	g5kvVGs03EMONQlfA/UZ1lou8a7lSKXB34LyCDOTxX7cfaMyW7ogqVy/oV1xde+amEiXqMCRqrPRH
	ylUsAuWBAa+jFjNhGRKRHB/3nnLSoxQUVfo1B/pKDdSvv9KFqCETp5Bb9NAI5lVjEfnHiEPsk5CUm
	gDeOhTW3Hb0U1Sz084UQo/F3rCSNNoec7zlNpGHw1Dwls/Sd+Kr1X55wwkUMRBCBBIB7Hv7PHYCHi
	jKLdWuVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnDu6-0000000GGoW-2pwV;
	Fri, 24 Jul 2026 11:17:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnDu3-0000000GGn8-2QoL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 11:17:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6036C1477;
	Fri, 24 Jul 2026 04:17:12 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76A5C3F59E;
	Fri, 24 Jul 2026 04:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784891836; bh=XOve+0XtVKVlM/u7vcMwBknwE9v0ZsOgXPcAxAz0/xU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EuG4sy5QmEhYuJHNParTw6VDWlgVw3P44Ml0OYKI7mNOPsSITLwTqFXcavCqnuDyJ
	 0LP62H9PDG8Zm3J0vyUv5+Aqsq/ssw5spzw5ApgIS+yz3g3n//oUFjuHKsIyzXGGx0
	 iyi4T1G2B9Bx6pz3NgSVvQgdeVx21eVns2WVtYHI=
Message-ID: <1864c9a2-2e97-411e-9f12-862a8cfd4101@arm.com>
Date: Fri, 24 Jul 2026 13:17:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/10] arm_mpam: propagate MSC access errors for
 __ris_msmon_read()
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260723155454.1760823-1-andre.przywara@arm.com>
 <20260723155454.1760823-6-andre.przywara@arm.com>
 <20260724-horned-wolf-of-will-a49c1d@sudeepholla>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260724-horned-wolf-of-will-a49c1d@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_041719_892761_FD4C7CB7 
X-CRM114-Status: GOOD (  20.26  )
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

Hi,

On 7/24/26 12:02, Sudeep Holla wrote:
> On Thu, Jul 23, 2026 at 05:54:49PM +0200, Andre Przywara wrote:
>> Allow the function for RIS accesses to return an error, and propagate
>> read and write errors from the lower level up.
>> This function is a bit special, since it can be called via an SMP
>> helper, so the prototype must stay as void. So propagate any errors
>> using the "err" field in the struct passed in as the sole argument to
>> that function.
>>
> 
> Not sure if this was already discussed by build bisection regresses between
> 4/10 and 5/10 as you change function prototype there and caller here or
> am I missing to read it correctly ?

Does it? I build tested every patch multiple times yesterday, and just 
repeated it, and it comes back cleanly.

>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   drivers/resctrl/mpam_devices.c | 36 +++++++++++++++++++++++++---------
>>   1 file changed, 27 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 9ee4eb4db03f..bcff53477133 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -1328,6 +1328,10 @@ static u64 mpam_msmon_overflow_val(enum mpam_device_features type,
>>   	return overflow_val;
>>   }
>>   
>> +/*
>> + * This function might be called via smp_call_function_any(), so propagate
>> + * errors inside the arg struct.
>> + */
>>   static void __ris_msmon_read(void *arg)
>>   {
>>   	u64 now;
>> @@ -1351,7 +1355,9 @@ static void __ris_msmon_read(void *arg)
>>   
>>   	mon_sel = FIELD_PREP(MSMON_CFG_MON_SEL_MON_SEL, ctx->mon) |
>>   		  FIELD_PREP(MSMON_CFG_MON_SEL_RIS, ris->ris_idx);
>> -	mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
>> +	m->err = mpam_write_monsel_reg(msc, CFG_MON_SEL, mon_sel);
>> +	if (m->err)
>> +		return;
>>   
>>   	switch (m->type) {
>>   	case mpam_feat_msmon_mbwu_31counter:
>> @@ -1371,7 +1377,9 @@ static void __ris_msmon_read(void *arg)
>>   	 * Read the existing configuration to avoid re-writing the same values.
>>   	 * This saves waiting for 'nrdy' on subsequent reads.
>>   	 */
>> -	read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
>> +	m->err = read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
>> +	if (m->err)
>> +		return;
>>
> 
> Atleast read_msmon_ctl_flt_vals() changed to return value in last patch.

Ah, but this is not a problem that breaks the build, as we formerly just 
ignored the (at this point bogus) error value, but now pass it up.
But this is one occasion of "touching the same line twice", that was 
criticised before. Not nice, but the alternative would be to have one 
giant patch, which I figured to be unreadable.

Cheers,
Andre


