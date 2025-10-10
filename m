Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE55ACCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 16:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LAgU4T4HgYk4AVIirr64b1vRMZ+aokGPaweJQHWK7gY=; b=3RYS6GJo4PK3DQg1OTiiy996sW
	zAyaHYwWJiTK9USz1Dus5WzV/7gR7I+bcRa6z9I9aJ8aT+JNkdgEkr5mEJIwR564CnL6htugjIay0
	/I9TFZuiZCfrmbdu40dAylhcJFF/cRK3ziuiH5TMkqpeFpYl4d4yEcthVnhprTNFgxjJO4IRxIZFb
	rCeO3hFJpGkxU+8pM10HCwSGm3FTQmsOawOFbofZJuUDsctTGcZdb/hSioNyRW1j5iHiXi4OqdND2
	9Q4u2Du/QQBAaQhM1xhkbIR3+W0zOM3+YuKpJB/MaU5HIg8QED0BXgJt9PSj/soKBBzSSxlm6FrOa
	owsSSiZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GNA-00000008zxB-1H2h;
	Fri, 10 Oct 2025 16:53:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GN8-00000008zvZ-1BVC
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Oct 2025 16:53:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LAgU4T4HgYk4AVIirr64b1vRMZ+aokGPaweJQHWK7gY=; b=Y+D+NT3GFYxduvaC62/WOuqwC8
	cHu8hQE9EOkyZVS0OaddwJwLYgtvmwwzc/hGzBWwfT5KZGARqp9S3ng0sLTDl5HGzENdkljv18mt3
	ERSWD65GWbyXwNXX0JrWAx6i+VfqGYk0VOGOND3P+oXloO1Ep1kqG7cVGI1XH6AKO5SndR/lNqBjG
	E36bom0ipwlH11/D06cMizWJ9rbiSFarJDpvlZSVkRe0lVv6gU4F9s5WfBG25HvsIR6kcnLPIvrb1
	/Jtj1r8O/2IWrv34rfDx1Z2dLXEHNVrLn/npTUulG7q+KWDUrYHwI1tcjS3wBBeASHuLY89SxNAza
	smDc4NwQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GN5-00000002J33-0HYj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 16:53:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CAB01713;
	Fri, 10 Oct 2025 09:53:24 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BFF23F66E;
	Fri, 10 Oct 2025 09:53:27 -0700 (PDT)
Message-ID: <960a8bf9-63ad-4748-a669-622b2570700a@arm.com>
Date: Fri, 10 Oct 2025 17:53:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 27/29] arm_mpam: Add helper to reset saved mbwu state
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>,
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
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-28-james.morse@arm.com>
 <OSZPR01MB87982A954238E8122FF3ABD58B16A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <OSZPR01MB87982A954238E8122FF3ABD58B16A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_175335_455716_4E2BE8C4 
X-CRM114-Status: GOOD (  24.09  )
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

On 18/09/2025 03:35, Shaopeng Tan (Fujitsu) wrote:
>> resctrl expects to reset the bandwidth counters when the filesystem is
>> mounted.
>>
>> To allow this, add a helper that clears the saved mbwu state. Instead of cross
>> calling to each CPU that can access the component MSC to write to the counter,
>> set a flag that causes it to be zero'd on the the next read. This is easily done by
>> forcing a configuration update.

>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 3080a81f0845..8254d6190ca2 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -1112,7 +1122,10 @@ static void __ris_msmon_read(void *arg)
>>  	read_msmon_ctl_flt_vals(m, &cur_ctl, &cur_flt);
>>  	clean_msmon_ctl_val(&cur_ctl);
>>  	gen_msmon_ctl_flt_vals(m, &ctl_val, &flt_val);
>> -	if (cur_flt != flt_val || cur_ctl != (ctl_val | MSMON_CFG_x_CTL_EN))
>> +	config_mismatch = cur_flt != flt_val ||
>> +			  cur_ctl != (ctl_val | MSMON_CFG_x_CTL_EN);
>> +
>> +	if (config_mismatch || reset_on_next_read)
>>  		write_msmon_ctl_flt_vals(m, ctl_val, flt_val);

I don't have a platform that implements any of the bandwidth counters, so may need a hand
to debug this ...


> mbm_handle_overflow() calls __ris_msmon_read() every second. 
> If there are multiple monitor groups, the config_mismatch will "true" every second. 

It shouldn't be - I think you've forced it into a pathalogical case that the resctrl glue
code tries very hard to avoid.

The pattern of allocating a montior, detecing a mismatch and reconfiguring it is needed
for CSU. That stuff is re-usable for MBWU, but you never want it to happen outside
control/monitor group creation because it means you're losing data.

For those reading along at home:
resctrl expects there to be as many hardware monitors as PARTID*PMG - because every
control and monitor group has 'mbm_total_bytes' or equivalent files. User-space can read
these at any time, and the deal is they start at 0 from boot, and reset when the control
or monitor group is created.

This means the MPAM driver needs to have enough, and it needs to pre-configure them on
startup.

The resctrl glue code calls this 'free running'. It means when you call
resctrl_arch_mon_ctx_alloc() for a bandwidth monitor - it doesn't allocate a context, but
returns a magic out of range value 'USE_RMID_IDX' so that subsequent calls use the
pre-allocated monitor.


If you don't have PARTID*PMG's worth of monitors - you can't have resctrl's
mbm_total_bytes interface. People regularly complain about this - but the alternative is
counters that randomly reset, meaning you could never trust the value.
I have no intention of supporting that mode, (its already available in /dev/urandom!)


If you're seeing this mismatch happen from the overflow thread - I think you've forced
the mbwu counters on when you don't have enough monitors.
Even if the resctrl overflow 'thread' used the same mon_ctx - USE_RMID_IDX means it will
access a different hardware monitor each time.
Another option is clean_msmon_ctl_val() is missing a bit that is set by hardware, causing
the values to mismatch when they shouldn't.


Could you check mon_ctx is USE_RMID_IDX, and check which bits are mismatching?


> Then "mbwu_state->prev_val = 0;" in function write_msmon_ctl_flt_vals() will be always run.
> This means that for multiple monitoring groups, the MemoryBandwidth monitoring value is cleared every second.

Yes - this should never happen because the overflow thread should never cause a mismatch,
and the montiros should only be reconfigured when control/monitor groups are allocated.



Thanks,

James

