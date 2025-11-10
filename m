Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A5CCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 23:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpLpAuSScfpCpLk9/tKb4sUEHRL2syy6l9sHy6Oz5tI=; b=cBrwa6Ah+YKYNkjhm+/g7jubpg
	loJ862cGRp0vkc2BZFLafpFzcGs0x6h8ynVjPEL0rHnklGXJFZcm/+U2HGCGi2VUqYg+rhbCBqhHn
	JgdIynTnVuAYabe805ozjQBChzeQ9KUzUVuTgSuMuLIeaH7/YRGdHacarz3I49hH1AK4zjB0xfs9k
	gbYPufzHFb5xWifFg7l4bQXcCidMeuxJpk0hQM7kFEvu0WLZ4hcbWdeyZfR9778+Z2OEw4dECt+G2
	rX1excTbJI5XC5stdydQftzcM1Njo/jfIvRdIpI8Q/PosSfWXeh9WjkLms7eXu58SdEsxMqrPtB/D
	Yg5XZ+gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIbHb-00000006FsP-14CM;
	Mon, 10 Nov 2025 23:26:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIbHW-00000006Frt-1ply
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 23:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762817199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bpLpAuSScfpCpLk9/tKb4sUEHRL2syy6l9sHy6Oz5tI=;
	b=fS6uJZVIpWC+uasBEIKQGT/8prl7+H9xHyCF6ice11TbAU1fsqmqiQwPhp0p6xen68I3Hl
	VVYuUVMit+74c7G140NQGbWu6ycoltBB/PkDCoTESQNWvzkxZjEPjhRwG4n+z62GQlgyI/
	zkdhIBEeZlul54mML0QAiBopPVvs6SI=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-g0oRCc2_MOGAmtpc121Q6w-1; Mon, 10 Nov 2025 18:26:38 -0500
X-MC-Unique: g0oRCc2_MOGAmtpc121Q6w-1
X-Mimecast-MFC-AGG-ID: g0oRCc2_MOGAmtpc121Q6w_1762817197
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b969f3f5bb1so7782682a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 15:26:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762817197; x=1763421997;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bpLpAuSScfpCpLk9/tKb4sUEHRL2syy6l9sHy6Oz5tI=;
        b=OffTnkAQVLV4f0kjZaouQ8jbJG1pIMIL6KIJUPYXP8D2XaiIdP8aFbCWQGBVgeUZ/f
         4uHsEtlv3wMvqdMgUSjj80mKBAn7d+u5KvgdRbi3TGWLYIJDVfVxGVfwB/1pHo7YO9Px
         HPmuxyCJq4YyTPe0iQqBVZbMNReJiPhR+O0EueGx/S/iiil+O7z3lYiVvYMEulV+jaj0
         Dh2AcbZBnrUojs56iCOzMLhkVKvJayK+EQhHxGo5RVPwDea91WIceYghaetEvMm3QQl0
         q1O6l8YFGGXeZBCGqLe+nL9eNF3+e6SOgmot1iPKj+p5rRsmU5zeNYuFDThkgOLm0SXC
         rIKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtdCgYtSR5EBPsbqsqeDa2qJTg+QQrT4LGZMwK3/Zvot5zEm19lpSadsts/Fatnk5BDcO1v9fvtpXhxn8yxEi3@lists.infradead.org
X-Gm-Message-State: AOJu0YwMQt9Z/GayMTCcPyk7Fpf/brlr0DqaeuoFb5t82Qiwey87DM8D
	r0kwnRDVmYM3XXLcMmz2PWif7I3F1on9MKhDFN/Pe1iOsiEvyeOJu82JP9bnV1BkEJwe8SGwn6p
	jRnPhqaMkwUqKrMEuYdR2XWj8waKPpPFMcZwDHmvrV0ExMIFoW5ESD1c7+9pQjcbBi3ZvcRCLts
	SW
X-Gm-Gg: ASbGnctg+9YzRX7dayjn21K475C3psjQ7bh8ta42TM3ODhPAuXqpGorQ/32IQmeJ241
	NBMBreN7IItBCIpguP2dpg+2mqpVlX2MBkM410lQg7vJR9qJ7QVV+nVf0frQdZMj1JIN3zr3iuB
	AaJ+u5kjUWg+1RA9xMctjMZN50MzW8WE03KRqnwGnCvZw3zNtzEvnH/4U3gQ1CNOfETrmieWOpz
	gSG6AAIZ2UiUTAHDV2XyyUiJLQmaHbx+Ryyu5c3T9EuCHiiKIYQLNR/IasOJexyaXnCScxGjINK
	SsKszaJemkPc0mqYtKAL7TPkGE60MLW6TXSVHsQk9T5UzcVvQmHLlyLZww9FE3HaHUQ8oxpzDGr
	dA7ZGZgwmR1HoTM4Gpcjb07NIzA0eR5W7sIDfd1A=
X-Received: by 2002:a05:6a20:9190:b0:34e:8c68:35f with SMTP id adf61e73a8af0-353a11a5098mr13356881637.12.1762817197067;
        Mon, 10 Nov 2025 15:26:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFevV2VCej3Ahq2iba40TX2lDlyCIbyd5ei9Wr8DC+sIXOAZcR2/kiux1he7iYtDDGagU6bRg==
X-Received: by 2002:a05:6a20:9190:b0:34e:8c68:35f with SMTP id adf61e73a8af0-353a11a5098mr13356842637.12.1762817196603;
        Mon, 10 Nov 2025 15:26:36 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f8e750c1sm13773441a12.1.2025.11.10.15.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 15:26:35 -0800 (PST)
Message-ID: <33f9822a-fbb5-47e1-ab5c-97b30511a97f@redhat.com>
Date: Tue, 11 Nov 2025 09:26:22 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/33] arm_mpam: Probe hardware to find the supported
 partid/pmg values
From: Gavin Shan <gshan@redhat.com>
To: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-15-ben.horgan@arm.com>
 <7d0c73d3-1943-469f-813a-eba1dac38d4a@redhat.com>
In-Reply-To: <7d0c73d3-1943-469f-813a-eba1dac38d4a@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pcAqgO0OMaHyq0V2DT2VZMEGdq5qO6h4V5Zd9YRNkhE_1762817197
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_152642_975179_4E453FBD 
X-CRM114-Status: GOOD (  32.55  )
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

On 11/9/25 10:43 AM, Gavin Shan wrote:
> On 11/7/25 10:34 PM, Ben Horgan wrote:
>> From: James Morse <james.morse@arm.com>
>>
>> CPUs can generate traffic with a range of PARTID and PMG values,
>> but each MSC may also have its own maximum size for these fields.
>> Before MPAM can be used, the driver needs to probe each RIS on
>> each MSC, to find the system-wide smallest value that can be used.
>> The limits from requestors (e.g. CPUs) also need taking into account.
>>
>> While doing this, RIS entries that firmware didn't describe are created
>> under MPAM_CLASS_UNKNOWN.
>>
>> This adds the low level MSC write accessors.
>>
>> While we're here, implement the mpam_register_requestor() call
>> for the arch code to register the CPU limits. Future callers of this
>> will tell us about the SMMU and ITS.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
>> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
>> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>> Tested-by: Peter Newman <peternewman@google.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>> Changes since v3:
>>  From Jonathan:
>> Stray comma in printk
>> Unnecessary braces
>> ---
>>   drivers/resctrl/mpam_devices.c  | 148 +++++++++++++++++++++++++++++++-
>>   drivers/resctrl/mpam_internal.h |   6 ++
>>   include/linux/arm_mpam.h        |  14 +++
>>   3 files changed, 167 insertions(+), 1 deletion(-)
>>
> 
> One comment related to 'partid_max_init', but this looks good to me in
> either way:
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> 
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 4162a7a57626..e1e26cb350f7 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -6,6 +6,7 @@
>>   #include <linux/acpi.h>
>>   #include <linux/atomic.h>
>>   #include <linux/arm_mpam.h>
>> +#include <linux/bitfield.h>
>>   #include <linux/cacheinfo.h>
>>   #include <linux/cpu.h>
>>   #include <linux/cpumask.h>
>> @@ -42,6 +43,15 @@ static atomic_t mpam_num_msc;
>>   static int mpam_cpuhp_state;
>>   static DEFINE_MUTEX(mpam_cpuhp_state_lock);
>> +/*
>> + * The smallest common values for any CPU or MSC in the system.
>> + * Generating traffic outside this range will result in screaming interrupts.
>> + */
>> +u16 mpam_partid_max;
>> +u8 mpam_pmg_max;
>> +static bool partid_max_init, partid_max_published;
>> +static DEFINE_SPINLOCK(partid_max_lock);
>> +
> 
> If mpam_partid_max and mpam_pmg_max are initialized to USHRT_MAX and 255 here,
> the state related to partid_max_init can be removed...
> 
>>   /*
>>    * mpam is enabled once all devices have been probed from CPU online callbacks,
>>    * scheduled via this work_struct. If access to an MSC depends on a CPU that
>> @@ -142,6 +152,70 @@ static inline u32 _mpam_read_partsel_reg(struct mpam_msc *msc, u16 reg)
>>   #define mpam_read_partsel_reg(msc, reg) _mpam_read_partsel_reg(msc, MPAMF_##reg)
>> +static void __mpam_write_reg(struct mpam_msc *msc, u16 reg, u32 val)
>> +{
>> +    WARN_ON_ONCE(reg + sizeof(u32) >= msc->mapped_hwpage_sz);
>> +    WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
>> +
>> +    writel_relaxed(val, msc->mapped_hwpage + reg);
>> +}
>> +
>> +static inline void _mpam_write_partsel_reg(struct mpam_msc *msc, u16 reg, u32 val)
>> +{
>> +    lockdep_assert_held_once(&msc->part_sel_lock);
>> +    __mpam_write_reg(msc, reg, val);
>> +}
>> +
>> +#define mpam_write_partsel_reg(msc, reg, val)  _mpam_write_partsel_reg(msc, MPAMCFG_##reg, val)
>> +
>> +static u64 mpam_msc_read_idr(struct mpam_msc *msc)
>> +{
>> +    u64 idr_high = 0, idr_low;
>> +
>> +    lockdep_assert_held(&msc->part_sel_lock);
>> +
>> +    idr_low = mpam_read_partsel_reg(msc, IDR);
>> +    if (FIELD_GET(MPAMF_IDR_EXT, idr_low))
>> +        idr_high = mpam_read_partsel_reg(msc, IDR + 4);
>> +
>> +    return (idr_high << 32) | idr_low;
>> +}
>> +
>> +static void __mpam_part_sel_raw(u32 partsel, struct mpam_msc *msc)
>> +{
>> +    lockdep_assert_held(&msc->part_sel_lock);
>> +
>> +    mpam_write_partsel_reg(msc, PART_SEL, partsel);
>> +}
>> +
>> +static void __mpam_part_sel(u8 ris_idx, u16 partid, struct mpam_msc *msc)
>> +{
>> +    u32 partsel = FIELD_PREP(MPAMCFG_PART_SEL_RIS, ris_idx) |
>> +              FIELD_PREP(MPAMCFG_PART_SEL_PARTID_SEL, partid);
>> +
>> +    __mpam_part_sel_raw(partsel, msc);
>> +}
>> +
>> +int mpam_register_requestor(u16 partid_max, u8 pmg_max)
>> +{
>> +    guard(spinlock)(&partid_max_lock);
>> +    if (!partid_max_init) {
>> +        mpam_partid_max = partid_max;
>> +        mpam_pmg_max = pmg_max;
>> +        partid_max_init = true;
>> +    } else if (!partid_max_published) {
>> +        mpam_partid_max = min(mpam_partid_max, partid_max);
>> +        mpam_pmg_max = min(mpam_pmg_max, pmg_max);
>> +    } else {
>> +        /* New requestors can't lower the values */
>> +        if (partid_max < mpam_partid_max || pmg_max < mpam_pmg_max)
>> +            return -EBUSY;
>> +    }
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL(mpam_register_requestor);
>> +
> 
> With mpam_partid_max and mpam_pmg_max initialized to USHRT_MAX and 255, this
> can be:
> 
>      if (!partid_max_published) {
>              ...
>          } else {
>              ...
>          }
> 
>>   static struct mpam_vmsc *
>>   mpam_vmsc_alloc(struct mpam_component *comp, struct mpam_msc *msc)
>>   {
>> @@ -451,9 +525,35 @@ int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>>       return err;
>>   }
>> +static struct mpam_msc_ris *mpam_get_or_create_ris(struct mpam_msc *msc,
>> +                           u8 ris_idx)
>> +{
>> +    int err;
>> +    struct mpam_msc_ris *ris;
>> +
>> +    lockdep_assert_held(&mpam_list_lock);
>> +
>> +    if (!test_bit(ris_idx, &msc->ris_idxs)) {
>> +        err = mpam_ris_create_locked(msc, ris_idx, MPAM_CLASS_UNKNOWN,
>> +                         0, 0);
>> +        if (err)
>> +            return ERR_PTR(err);
>> +    }
>> +
>> +    list_for_each_entry(ris, &msc->ris, msc_list) {
>> +        if (ris->ris_idx == ris_idx)
>> +            return ris;
>> +    }
>> +
>> +    return ERR_PTR(-ENOENT);
>> +}
>> +
>>   static int mpam_msc_hw_probe(struct mpam_msc *msc)
>>   {
>>       u64 idr;
>> +    u16 partid_max;
>> +    u8 ris_idx, pmg_max;
>> +    struct mpam_msc_ris *ris;
>>       struct device *dev = &msc->pdev->dev;
>>       lockdep_assert_held(&msc->probe_lock);
>> @@ -464,6 +564,40 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
>>           return -EIO;
>>       }
>> +    /* Grab an IDR value to find out how many RIS there are */
>> +    mutex_lock(&msc->part_sel_lock);
>> +    idr = mpam_msc_read_idr(msc);
>> +    mutex_unlock(&msc->part_sel_lock);
>> +
>> +    msc->ris_max = FIELD_GET(MPAMF_IDR_RIS_MAX, idr);
>> +
>> +    /* Use these values so partid/pmg always starts with a valid value */
>> +    msc->partid_max = FIELD_GET(MPAMF_IDR_PARTID_MAX, idr);
>> +    msc->pmg_max = FIELD_GET(MPAMF_IDR_PMG_MAX, idr);
>> +
>> +    for (ris_idx = 0; ris_idx <= msc->ris_max; ris_idx++) {
>> +        mutex_lock(&msc->part_sel_lock);
>> +        __mpam_part_sel(ris_idx, 0, msc);
>> +        idr = mpam_msc_read_idr(msc);
>> +        mutex_unlock(&msc->part_sel_lock);
>> +
>> +        partid_max = FIELD_GET(MPAMF_IDR_PARTID_MAX, idr);
>> +        pmg_max = FIELD_GET(MPAMF_IDR_PMG_MAX, idr);
>> +        msc->partid_max = min(msc->partid_max, partid_max);
>> +        msc->pmg_max = min(msc->pmg_max, pmg_max);
>> +
>> +        mutex_lock(&mpam_list_lock);
>> +        ris = mpam_get_or_create_ris(msc, ris_idx);
>> +        mutex_unlock(&mpam_list_lock);
>> +        if (IS_ERR(ris))
>> +            return PTR_ERR(ris);
>> +    }
>> +
>> +    spin_lock(&partid_max_lock);
>> +    mpam_partid_max = min(mpam_partid_max, msc->partid_max);
>> +    mpam_pmg_max = min(mpam_pmg_max, msc->pmg_max);
>> +    spin_unlock(&partid_max_lock);
>> +

mpam_register_requestor() could be used here to avoid the capacities
(maximal PARTIDs and PMGs) are unexpectedly lowered.


>>       msc->probed = true;
>>       return 0;
>> @@ -686,10 +820,20 @@ static struct platform_driver mpam_msc_driver = {
>>   static void mpam_enable_once(void)
>>   {
>> +    /*
>> +     * Once the cpuhp callbacks have been changed, mpam_partid_max can no
>> +     * longer change.
>> +     */
>> +    spin_lock(&partid_max_lock);
>> +    partid_max_published = true;
>> +    spin_unlock(&partid_max_lock);
>> +
>>       mpam_register_cpuhp_callbacks(mpam_cpu_online, mpam_cpu_offline,
>>                         "mpam:online");
>> -    pr_info("MPAM enabled\n");
>> +    /* Use printk() to avoid the pr_fmt adding the function name. */
>> +    printk(KERN_INFO "MPAM enabled with %u PARTIDs and %u PMGs\n",
>> +           mpam_partid_max + 1, mpam_pmg_max + 1);
>>   }
>>   void mpam_disable(struct work_struct *ignored)
>> @@ -756,4 +900,6 @@ static int __init mpam_msc_driver_init(void)
>>       return platform_driver_register(&mpam_msc_driver);
>>   }
>> +
>> +/* Must occur after arm64_mpam_register_cpus() from arch_initcall() */
>>   subsys_initcall(mpam_msc_driver_init);
>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
>> index 4e1538d29783..768a58a3ab27 100644
>> --- a/drivers/resctrl/mpam_internal.h
>> +++ b/drivers/resctrl/mpam_internal.h
>> @@ -49,6 +49,8 @@ struct mpam_msc {
>>        */
>>       struct mutex        probe_lock;
>>       bool            probed;
>> +    u16            partid_max;
>> +    u8            pmg_max;
>>       unsigned long        ris_idxs;
>>       u32            ris_max;
>> @@ -138,6 +140,10 @@ struct mpam_msc_ris {
>>   extern struct srcu_struct mpam_srcu;
>>   extern struct list_head mpam_classes;
>> +/* System wide partid/pmg values */
>> +extern u16 mpam_partid_max;
>> +extern u8 mpam_pmg_max;
>> +
>>   /* Scheduled work callback to enable mpam once all MSC have been probed */
>>   void mpam_enable(struct work_struct *work);
>>   void mpam_disable(struct work_struct *work);
>> diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
>> index 5a3aab6bb1d4..c7246cfeb091 100644
>> --- a/include/linux/arm_mpam.h
>> +++ b/include/linux/arm_mpam.h
>> @@ -49,4 +49,18 @@ static inline int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>>   }
>>   #endif
>> +/**
>> + * mpam_register_requestor() - Register a requestor with the MPAM driver
>> + * @partid_max:        The maximum PARTID value the requestor can generate.
>> + * @pmg_max:        The maximum PMG value the requestor can generate.
>> + *
>> + * Registers a requestor with the MPAM driver to ensure the chosen system-wide
>> + * minimum PARTID and PMG values will allow the requestors features to be used.
>> + *
>> + * Returns an error if the registration is too late, and a larger PARTID/PMG
>> + * value has been advertised to user-space. In this case the requestor should
>> + * not use its MPAM features. Returns 0 on success.
>> + */
>> +int mpam_register_requestor(u16 partid_max, u8 pmg_max);
>> +
>>   #endif /* __LINUX_ARM_MPAM_H */

Thanks,
Gavin


