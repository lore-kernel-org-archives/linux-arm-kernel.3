Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447EECCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 10:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MIoodsSk+dZNAko2/OLgW+qJBuZLtPiqSSEMWIAqSG0=; b=PG2mWp7pREtOEQ/zYXIK54GXua
	OG5i/6iiXpOj+RwAt2ovmq7WjLmXxpNbb0wGMo3smji5JiVNaZ02z74bRQhxgSYu7a2Teo8c/Nxl5
	HXILgwKZnXPCTgOrLO+si+rKTb1SlR71oc7aAQkayOp+KKCCiufxbSSeouQovJIpiNW+c91Gx9UQA
	urYUfkZUFl1NT7ae++PoBBakuLfH3tjTqYuhkG4bWdulEW8VcYwtBmNrTVY+mab2LY4LDPnv4mKgF
	MUe6ayuQVF/qVcWfZ8UEPzgVTjQp2bafMpL3z6BsVsm83sazIKK2csuafVduh0Sswv6svSoeimpRT
	PQyc3nXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHK6D-0000000H9D5-2ypH;
	Fri, 07 Nov 2025 10:53:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHK6C-0000000H9Cv-0Gy0
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Nov 2025 10:53:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MIoodsSk+dZNAko2/OLgW+qJBuZLtPiqSSEMWIAqSG0=; b=frelZ+xeVFn/b+uKqcwsHOKjJm
	N9BVseOmMElL1F3iYBCMFnGeWQ8ofXeGnv7Ns5RtnN6HW7bU5hTm+Y1HLqDgC4ta5ggFp7lvwhfAP
	SqrKBxJnFNjhoe/Qc8uH926p0R2A5BsweHuH6MnQU1GeNAPvv8AbM2purcAn5b0gFyjyex54HRygB
	DnFyuIyySfgE41YOi6xlvpICSUSimJjJwJkcRNyNZmQcPDt6GPYE3EyccriOvvRDp1eO3Loq2piDt
	c+ZqzCImX5MYF/KPm34wfe2Op3cbg07+JQd7pmPPiC3vSUNUU2w5TG1bv+I1cWEUOSNEzGiTCDH98
	VvGbXzyg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJER-00000006EbS-2UPK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 09:58:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84B101516;
	Fri,  7 Nov 2025 02:53:30 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CEE33F63F;
	Fri,  7 Nov 2025 02:53:33 -0800 (PST)
Message-ID: <1b8875ab-39ee-4a9c-9f99-0a8f6b80a2ca@arm.com>
Date: Fri, 7 Nov 2025 10:53:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 26/29] arm_mpam: Use long MBWU counters if supported
To: Peter Newman <peternewman@google.com>
Cc: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
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
 <CALPaoCjJXHD+HgFizzvNEvBorbUcJLTngLb7UJy-uMdybhCfrg@mail.gmail.com>
 <9e2f912d-2a2e-49ed-b0ab-4286fe94e145@arm.com>
 <CALPaoCg7ZeQOgkeaPQ6ERKtaJqQ_n3xQUrK=qxi01CnuTjL4PA@mail.gmail.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <CALPaoCg7ZeQOgkeaPQ6ERKtaJqQ_n3xQUrK=qxi01CnuTjL4PA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_095812_154935_4CEA2A73 
X-CRM114-Status: GOOD (  29.28  )
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

On 11/7/25 10:30, Peter Newman wrote:
> Hi Ben
> 
> On Thu, Nov 6, 2025 at 5:41 PM Ben Horgan <ben.horgan@arm.com> wrote:
>>
>> Hi Peter,
>>
>> On 11/6/25 16:15, Peter Newman wrote:
>>> Hi Ben (and James),
>>>
>>> On Fri, Oct 17, 2025 at 8:59 PM James Morse <james.morse@arm.com> wrote:
>>>>
>>>> From: Rohit Mathew <rohit.mathew@arm.com>
>>>>
>>>> Now that the larger counter sizes are probed, make use of them.
>>>>
>>>> Callers of mpam_msmon_read() may not know (or care!) about the different
>>>> counter sizes. Allow them to specify mpam_feat_msmon_mbwu and have the
>>>> driver pick the counter to use.
>>>>
>>>> Only 32bit accesses to the MSC are required to be supported by the
>>>> spec, but these registers are 64bits. The lower half may overflow
>>>> into the higher half between two 32bit reads. To avoid this, use
>>>> a helper that reads the top half multiple times to check for overflow.
>>>>
>>>> Signed-off-by: Rohit Mathew <rohit.mathew@arm.com>
>>>> [morse: merged multiple patches from Rohit, added explicit counter selection ]
>>>> Signed-off-by: James Morse <james.morse@arm.com>
>>>> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
>>>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>>>> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
>>>> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
>>>> ---
>>>> Changes since v2:
>>>>  * Removed mpam_feat_msmon_mbwu as a top-level bit for explicit 31bit counter
>>>>    selection.
>>>>  * Allow callers of mpam_msmon_read() to specify mpam_feat_msmon_mbwu and have
>>>>    the driver pick a supported counter size.
>>>>  * Rephrased commit message.
>>>>
>>>> Changes since v1:
>>>>  * Only clear OFLOW_STATUS_L on MBWU counters.
>>>>
>>>> Changes since RFC:
>>>>  * Commit message wrangling.
>>>>  * Refer to 31 bit counters as opposed to 32 bit (registers).
>>>> ---
>>>>  drivers/resctrl/mpam_devices.c | 134 ++++++++++++++++++++++++++++-----
>>>>  1 file changed, 116 insertions(+), 18 deletions(-)
>>>>
>>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>>>> index f4d07234ce10..c207a6d2832c 100644
>>>> --- a/drivers/resctrl/mpam_devices.c
>>>> +++ b/drivers/resctrl/mpam_devices.c
>>>> @@ -897,6 +897,48 @@ struct mon_read {
>>>>         int                             err;
>>>>  };
>>>>
>>>> +static bool mpam_ris_has_mbwu_long_counter(struct mpam_msc_ris *ris)
>>>> +{
>>>> +       return (mpam_has_feature(mpam_feat_msmon_mbwu_63counter, &ris->props) ||
>>>> +               mpam_has_feature(mpam_feat_msmon_mbwu_44counter, &ris->props));
>>>> +}
>>>> +
>>>> +static u64 mpam_msc_read_mbwu_l(struct mpam_msc *msc)
>>>> +{
>>>> +       int retry = 3;
>>>> +       u32 mbwu_l_low;
>>>> +       u64 mbwu_l_high1, mbwu_l_high2;
>>>> +
>>>> +       mpam_mon_sel_lock_held(msc);
>>>> +
>>>> +       WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
>>>> +       WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
>>>> +
>>>> +       mbwu_l_high2 = __mpam_read_reg(msc, MSMON_MBWU_L + 4);
>>>> +       do {
>>>> +               mbwu_l_high1 = mbwu_l_high2;
>>>> +               mbwu_l_low = __mpam_read_reg(msc, MSMON_MBWU_L);
>>>> +               mbwu_l_high2 = __mpam_read_reg(msc, MSMON_MBWU_L + 4);
>>>> +
>>>> +               retry--;
>>>> +       } while (mbwu_l_high1 != mbwu_l_high2 && retry > 0);
>>>> +
>>>> +       if (mbwu_l_high1 == mbwu_l_high2)
>>>> +               return (mbwu_l_high1 << 32) | mbwu_l_low;
>>>> +       return MSMON___NRDY_L;
>>>> +}
>>>> +
>>>> +static void mpam_msc_zero_mbwu_l(struct mpam_msc *msc)
>>>> +{
>>>> +       mpam_mon_sel_lock_held(msc);
>>>> +
>>>> +       WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
>>>> +       WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
>>>> +
>>>> +       __mpam_write_reg(msc, MSMON_MBWU_L, 0);
>>>> +       __mpam_write_reg(msc, MSMON_MBWU_L + 4, 0);
>>>> +}
>>>> +
>>>>  static void gen_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
>>>>                                    u32 *flt_val)
>>>>  {
>>>> @@ -924,7 +966,9 @@ static void gen_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
>>>>                                                ctx->csu_exclude_clean);
>>>>
>>>>                 break;
>>>> -       case mpam_feat_msmon_mbwu:
>>>> +       case mpam_feat_msmon_mbwu_31counter:
>>>> +       case mpam_feat_msmon_mbwu_44counter:
>>>> +       case mpam_feat_msmon_mbwu_63counter:
>>>>                 *ctl_val |= MSMON_CFG_MBWU_CTL_TYPE_MBWU;
>>>>
>>>>                 if (mpam_has_feature(mpam_feat_msmon_mbwu_rwbw, &m->ris->props))
>>>> @@ -946,7 +990,9 @@ static void read_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
>>>>                 *ctl_val = mpam_read_monsel_reg(msc, CFG_CSU_CTL);
>>>>                 *flt_val = mpam_read_monsel_reg(msc, CFG_CSU_FLT);
>>>>                 return;
>>>> -       case mpam_feat_msmon_mbwu:
>>>> +       case mpam_feat_msmon_mbwu_31counter:
>>>> +       case mpam_feat_msmon_mbwu_44counter:
>>>> +       case mpam_feat_msmon_mbwu_63counter:
>>>>                 *ctl_val = mpam_read_monsel_reg(msc, CFG_MBWU_CTL);
>>>>                 *flt_val = mpam_read_monsel_reg(msc, CFG_MBWU_FLT);
>>>>                 return;
>>>> @@ -959,6 +1005,9 @@ static void read_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
>>>>  static void clean_msmon_ctl_val(u32 *cur_ctl)
>>>>  {
>>>>         *cur_ctl &= ~MSMON_CFG_x_CTL_OFLOW_STATUS;
>>>> +
>>>> +       if (FIELD_GET(MSMON_CFG_x_CTL_TYPE, *cur_ctl) == MSMON_CFG_MBWU_CTL_TYPE_MBWU)
>>>> +               *cur_ctl &= ~MSMON_CFG_MBWU_CTL_OFLOW_STATUS_L;
>>>>  }
>>>>
>>>>  static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
>>>> @@ -978,10 +1027,15 @@ static void write_msmon_ctl_flt_vals(struct mon_read *m, u32 ctl_val,
>>>>                 mpam_write_monsel_reg(msc, CSU, 0);
>>>>                 mpam_write_monsel_reg(msc, CFG_CSU_CTL, ctl_val | MSMON_CFG_x_CTL_EN);
>>>>                 break;
>>>> -       case mpam_feat_msmon_mbwu:
>>>> +       case mpam_feat_msmon_mbwu_44counter:
>>>> +       case mpam_feat_msmon_mbwu_63counter:
>>>> +               mpam_msc_zero_mbwu_l(m->ris->vmsc->msc);
>>>> +               fallthrough;
>>>> +       case mpam_feat_msmon_mbwu_31counter:
>>>>                 mpam_write_monsel_reg(msc, CFG_MBWU_FLT, flt_val);
>>>>                 mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val);
>>>>                 mpam_write_monsel_reg(msc, MBWU, 0);
>>>
>>> The fallthrough above seems to be problematic, assuming the MBWU=0
>>> being last for 31-bit was intentional. For long counters, this is
>>> zeroing the counter before updating the filter/control registers, but
>>> then clearing the 32-bit version of the counter. This fails to clear
>>> the NRDY bit on the long counter, which isn't cleared by software
>>> anywhere else.
>>>
>>> From section 10.3.2 from the MPAM spec shared:
>>>
>>>  "On a counting monitor, the NRDY bit remains set until it is reset by
>>> software writing it as 0 in the monitor register, or automatically
>>> after the monitor is captured in the capture register by a capture
>>> event"
>>>
>>> If I update the 63-bit case to call
>>> mpam_msc_zero_mbwu_l(m->ris->vmsc->msc) after updating the
>>> control/filter registers (in addition to the other items I pointed in
>>> my last reply), I'm able to read MBWU counts from my hardware through
>>> mbm_total_bytes.
>>>
>>> Thanks,
>>> -Peter
>>
>> Thanks for the testing and flagging the problem. We should do the
>> configuration in the same order for all the monitors.
>>
>> I'll change the case to:
>>
>>         case mpam_feat_msmon_mbwu_31counter:
>>         case mpam_feat_msmon_mbwu_44counter:
>>         case mpam_feat_msmon_mbwu_63counter:
>>                 mpam_write_monsel_reg(msc, CFG_MBWU_FLT, flt_val);
>>                 mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val);
>>
>>                 if (m->type == mpam_feat_msmon_mbwu_31counter)
>>                         mpam_write_monsel_reg(msc, MBWU, 0);
>>                 else
>>                         mpam_msc_zero_mbwu_l(m->ris->vmsc->msc);
>>
>>                 mpam_write_monsel_reg(msc, CFG_MBWU_CTL, ctl_val | MSMON_CFG_x_CTL_EN);
>>                 break;
> 
> I tried this out but wasn't able to read the counters. I needed to
> move the MBWU[_L] write to the end. Writing the registers directly on
> the hardware I'm testing with, I confirmed that just flipping
> MBWU_CTL.EN sets NRDY:
> 
> MBWU_L=0x880
> MBWU_CTL=0x828
> 
>  / # mmio_read32 $((msc + MBWU_CTL))
> 0x80030042
>  / # mmio_read32 $((msc + MBWU_L)); mmio_read32 $((msc + MBWU_L + 4))
> 0x03ecb2c0
> 0x00000000
>  / # mmio_read32 $((msc + MBWU_L)); mmio_read32 $((msc + MBWU_L + 4))
> 0x03f70580
> 0x00000000
> 
> Clear MBWU_CTL.EN:
> 
>  / # mmio_write32 $((msc + MBWU_CTL)) 0x00030042
>  / # mmio_read32 $((msc + MBWU_L)); mmio_read32 $((msc + MBWU_L + 4))
> 0x05004680
> 0x80000000
>  / # mmio_read32 $((msc + MBWU_L)); mmio_read32 $((msc + MBWU_L + 4))
> 0x05004680
> 0x80000000
> 
> Clear NRDY and reenable MBWU_CTL.EN:
> 
>  / # mmio_write32 $((msc + MBWU_L)) 0; mmio_write32 $((msc + MBWU_L + 4)) 0
>  / # mmio_read32 $((msc + MBWU_L)); mmio_read32 $((msc + MBWU_L + 4))
> 0x00000000
> 0x00000000
>  / # mmio_write32 $((msc + MBWU_CTL)) 0x80030042
>  / # mmio_read32 $((msc + MBWU_L)); mmio_read32 $((msc + MBWU_L + 4))
> 0x001dee80
> 0x80000000
> 
> In fact, re-writing the same value back into MBWU_CTL.EN also sets NRDY:
> 
>  / # mmio_read32 $((msc + MBWU_L)); mmio_read32 $((msc + MBWU_L + 4))
> 0x00253e00
> 0x00000000
>  / # mmio_read32 $((msc + MBWU_L)); mmio_read32 $((msc + MBWU_L + 4))
> 0x00b1a6c0
> 0x00000000
>  / # mmio_write32 $((msc + MBWU_CTL)) 0x80030042
>  / # mmio_read32 $((msc + MBWU_L)); mmio_read32 $((msc + MBWU_L + 4))
> 0x018d1d40
> 0x80000000
> 
> Thanks,
> -Peter


Thank you very much for the quick testing and diagnosis. It does seeem
reasonable that the .EN flip would be considered a configuration change
and so indeed the writing NRDY (and the value) should happend after for
counting monitors (mbwu). I'll make this change now.

Thanks,

Ben


