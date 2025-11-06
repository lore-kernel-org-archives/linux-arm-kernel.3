Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF887CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 15:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xFZuIwzfOTMUb4IA86Mr5Kbz2dzYNoS4YEoK0eqHLA=; b=nDPLq19Gu8eO42EnN8R3X3riAR
	GAxUL+cxUkTbG4I4dRyHRe5JaGM3eM6XH3SIiFn9inhkd89m7+St1XZMkGL7YZa14l17Ikk2EqiZc
	HFL5W61DUbc8e6RQfV0om+aDUwxMQbTd/RtxsGw2GYtEHV0P/KCxA31LMzJWXP40N8mGnDfYriZV+
	CzJlgFbqMPZjBBMA1xl4sZkrADZjYmAvnw2woA5j8RsSetik8VhsCoSjEZKYt+vITM7uBvtwQj6Ri
	jjV7xPhWfL6SW/iuX4DFurSjaUUtLLxxs30kYSCwYEkoI3bPa311kUyXG1C1q0qfC72elaFDCRShH
	xRkCMJMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH29E-0000000Fq3B-1NZn;
	Thu, 06 Nov 2025 15:43:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH29B-0000000Fq2h-14X2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 15:43:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 378B715A1;
	Thu,  6 Nov 2025 07:43:26 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 69DAE3F694;
	Thu,  6 Nov 2025 07:43:29 -0800 (PST)
Message-ID: <9dbc4e1a-d614-4427-a7e8-066a3e29055e@arm.com>
Date: Thu, 6 Nov 2025 15:43:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 26/29] arm_mpam: Use long MBWU counters if supported
To: Peter Newman <peternewman@google.com>, James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, dfustini@baylibre.com,
 amitsinght@marvell.com, David Hildenbrand <david@redhat.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Gavin Shan <gshan@redhat.com>
References: <20251017185645.26604-1-james.morse@arm.com>
 <20251017185645.26604-27-james.morse@arm.com>
 <CALPaoCgO+NW9Hnb0x-eL7oR-Yj75V14hOW=LxAEYUEeK9SMCUA@mail.gmail.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <CALPaoCgO+NW9Hnb0x-eL7oR-Yj75V14hOW=LxAEYUEeK9SMCUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_074337_390771_F1BDE34D 
X-CRM114-Status: GOOD (  30.41  )
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

Hi Peter,

On 11/6/25 15:18, Peter Newman wrote:
> Hi James,
> 
> On Fri, Oct 17, 2025 at 8:59 PM James Morse <james.morse@arm.com> wrote:
>>
>> From: Rohit Mathew <rohit.mathew@arm.com>
>>
>> Now that the larger counter sizes are probed, make use of them.
>>
>> Callers of mpam_msmon_read() may not know (or care!) about the different
>> counter sizes. Allow them to specify mpam_feat_msmon_mbwu and have the
>> driver pick the counter to use.
>>
>> Only 32bit accesses to the MSC are required to be supported by the
>> spec, but these registers are 64bits. The lower half may overflow
>> into the higher half between two 32bit reads. To avoid this, use
>> a helper that reads the top half multiple times to check for overflow.
>>
>> Signed-off-by: Rohit Mathew <rohit.mathew@arm.com>
>> [morse: merged multiple patches from Rohit, added explicit counter selection ]
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
>> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
>> ---
>> Changes since v2:
>>  * Removed mpam_feat_msmon_mbwu as a top-level bit for explicit 31bit counter
>>    selection.
>>  * Allow callers of mpam_msmon_read() to specify mpam_feat_msmon_mbwu and have
>>    the driver pick a supported counter size.
>>  * Rephrased commit message.
>>
>> Changes since v1:
>>  * Only clear OFLOW_STATUS_L on MBWU counters.
>>
>> Changes since RFC:
>>  * Commit message wrangling.
>>  * Refer to 31 bit counters as opposed to 32 bit (registers).
>> ---
>>  drivers/resctrl/mpam_devices.c | 134 ++++++++++++++++++++++++++++-----
>>  1 file changed, 116 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index f4d07234ce10..c207a6d2832c 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -897,6 +897,48 @@ struct mon_read {
>>         int                             err;
>>  };
>>
>> +static bool mpam_ris_has_mbwu_long_counter(struct mpam_msc_ris *ris)
>> +{
>> +       return (mpam_has_feature(mpam_feat_msmon_mbwu_63counter, &ris->props) ||
>> +               mpam_has_feature(mpam_feat_msmon_mbwu_44counter, &ris->props));
>> +}
>> +
>> +static u64 mpam_msc_read_mbwu_l(struct mpam_msc *msc)
>> +{
>> +       int retry = 3;
>> +       u32 mbwu_l_low;
>> +       u64 mbwu_l_high1, mbwu_l_high2;
>> +
>> +       mpam_mon_sel_lock_held(msc);
>> +
>> +       WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
>> +       WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
>> +
>> +       mbwu_l_high2 = __mpam_read_reg(msc, MSMON_MBWU_L + 4);
>> +       do {
>> +               mbwu_l_high1 = mbwu_l_high2;
>> +               mbwu_l_low = __mpam_read_reg(msc, MSMON_MBWU_L);
>> +               mbwu_l_high2 = __mpam_read_reg(msc, MSMON_MBWU_L + 4);
>> +
>> +               retry--;
>> +       } while (mbwu_l_high1 != mbwu_l_high2 && retry > 0);
>> +
>> +       if (mbwu_l_high1 == mbwu_l_high2)
>> +               return (mbwu_l_high1 << 32) | mbwu_l_low;
>> +       return MSMON___NRDY_L;
>> +}
>> +
>> +static void mpam_msc_zero_mbwu_l(struct mpam_msc *msc)
>> +{
>> +       mpam_mon_sel_lock_held(msc);
>> +
>> +       WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
>> +       WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
>> +
>> +       __mpam_write_reg(msc, MSMON_MBWU_L, 0);
>> +       __mpam_write_reg(msc, MSMON_MBWU_L + 4, 0);
>> +}
>> +
>>  static void gen_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
>>                                    u32 *flt_val)
>>  {
>> @@ -924,7 +966,9 @@ static void gen_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
>>                                                ctx->csu_exclude_clean);
>>
>>                 break;
>> -       case mpam_feat_msmon_mbwu:
>> +       case mpam_feat_msmon_mbwu_31counter:
>> +       case mpam_feat_msmon_mbwu_44counter:
>> +       case mpam_feat_msmon_mbwu_63counter:
>>                 *ctl_val |= MSMON_CFG_MBWU_CTL_TYPE_MBWU;
>>
>>                 if (mpam_has_feature(mpam_feat_msmon_mbwu_rwbw, &m->ris->props))
>> @@ -946,7 +990,9 @@ static void read_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
>>                 *ctl_val = mpam_read_monsel_reg(msc, CFG_CSU_CTL);
>>                 *flt_val = mpam_read_monsel_reg(msc, CFG_CSU_FLT);
>>                 return;
>> -       case mpam_feat_msmon_mbwu:
>> +       case mpam_feat_msmon_mbwu_31counter:
>> +       case mpam_feat_msmon_mbwu_44counter:
>> +       case mpam_feat_msmon_mbwu_63counter:
>>                 *ctl_val = mpam_read_monsel_reg(msc, CFG_MBWU_CTL);
>>                 *flt_val = mpam_read_monsel_reg(msc, CFG_MBWU_FLT);
>>                 return;
>> @@ -959,6 +1005,9 @@ static void read_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
>>  static void clean_msmon_ctl_val(u32 *cur_ctl)
>>  {
>>         *cur_ctl &= ~MSMON_CFG_x_CTL_OFLOW_STATUS;
>> +
>> +       if (FIELD_GET(MSMON_CFG_x_CTL_TYPE, *cur_ctl) == MSMON_CFG_MBWU_CTL_TYPE_MBWU)
>> +               *cur_ctl &= ~MSMON_CFG_MBWU_CTL_OFLOW_STATUS_L;
>>  }
>>
>>  static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
>> @@ -978,10 +1027,15 @@ static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
>>                 mpam_write_monsel_reg(msc, CSU, 0);
>>                 mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val | MSMON_CFG_x_CTL_EN);
>>                 break;
>> -       case mpam_feat_msmon_mbwu:
>> +       case mpam_feat_msmon_mbwu_44counter:
>> +       case mpam_feat_msmon_mbwu_63counter:
>> +               mpam_msc_zero_mbwu_l(m->ris->vmsc->msc);
>> +               fallthrough;
>> +       case mpam_feat_msmon_mbwu_31counter:
>>                 mpam_write_monsel_reg(msc, CFG_MBWU_FLT, flt_val);
>>                 mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val);
>>                 mpam_write_monsel_reg(msc, MBWU, 0);
>> +
>>                 mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val | MSMON_CFG_x_CTL_EN);
>>
>>                 mbwu_state = &m->ris->mbwu_state[m->ctx->mon];
>> @@ -993,10 +1047,19 @@ static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
>>         }
>>  }
>>
>> -static u64 mpam_msmon_overflow_val(struct mpam_msc_ris *ris)
>> +static u64 mpam_msmon_overflow_val(enum mpam_device_features type)
>>  {
>> -       /* TODO: scaling, and long counters */
>> -       return GENMASK_ULL(30, 0);
>> +       /* TODO: implement scaling counters */
>> +       switch (type) {
>> +       case mpam_feat_msmon_mbwu_63counter:
>> +               return GENMASK_ULL(62, 0);
>> +       case mpam_feat_msmon_mbwu_44counter:
>> +               return GENMASK_ULL(43, 0);
>> +       case mpam_feat_msmon_mbwu_31counter:
>> +               return GENMASK_ULL(30, 0);
>> +       default:
>> +               return 0;
>> +       }
>>  }
>>
>>  /* Call with MSC lock held */
>> @@ -1037,11 +1100,24 @@ static void __ris_msmon_read(void *arg)
>>                         nrdy = now & MSMON___NRDY;
>>                 now = FIELD_GET(MSMON___VALUE, now);
>>                 break;
>> -       case mpam_feat_msmon_mbwu:
>> -               now = mpam_read_monsel_reg(msc, MBWU);
>> -               if (mpam_has_feature(mpam_feat_msmon_mbwu_hw_nrdy, rprops))
>> -                       nrdy = now & MSMON___NRDY;
>> -               now = FIELD_GET(MSMON___VALUE, now);
>> +       case mpam_feat_msmon_mbwu_31counter:
>> +       case mpam_feat_msmon_mbwu_44counter:
>> +       case mpam_feat_msmon_mbwu_63counter:
> 
> Should you check for one of these three features instead of
> mpam_feat_msmon_mbwu further up in this function when checking for
> reset_on_next_read?
> 
> -       if (m->type == mpam_feat_msmon_mbwu) {
> +       switch (m->type) {
> +       case mpam_feat_msmon_mbwu_31counter:
> +       case mpam_feat_msmon_mbwu_44counter:
> +       case mpam_feat_msmon_mbwu_63counter:
>                 mbwu_state = &ris->mbwu_state[ctx->mon];
>                 if (mbwu_state) {
>                         reset_on_next_read = mbwu_state->reset_on_next_read;
>                         mbwu_state->reset_on_next_read = false;
>                 }
> +               break;
> +       default:
> +               break;
>         }
> 

Yes, this looks like a correct change to me.

[...]
>>  int mpam_msmon_read(struct mpam_component *comp, struct mon_cfg *ctx,
>>                     enum mpam_device_features type, u64 *val)
>>  {
>>         int err;
>>         struct mon_read arg;
>>         u64 wait_jiffies = 0;
>> -       struct mpam_props *cprops = &comp->class->props;
>> +       struct mpam_class *class = comp->class;
>> +       struct mpam_props *cprops = &class->props;
>>
>>         might_sleep();
>>
>> @@ -1129,9 +1218,12 @@ int mpam_msmon_read(struct mpam_component *comp, struct mon_cfg *ctx,
>>         };
>>         *val = 0;
>>
>> +       if (type == mpam_feat_msmon_mbwu)
>> +               type = mpam_msmon_choose_counter(class);
> 
> `type` was already recorded in arg->type, so the result of this lookup
> will be ignored on the first call to _msmon_read()
> 
> If mpam_feat_msmon_mbwu can somehow still result in -EBUSY, then the
> repeat call may use the right type.

Good spot. I think we can just move the 'if' further up. I'll make these
changes when I do the repost for James.

> 
> Thanks,
> -Peter

Thanks,

Ben


