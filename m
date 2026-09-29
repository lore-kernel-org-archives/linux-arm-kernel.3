Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7812CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 22:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kR4AtM70UWS0nV7zJyrdzUIjsewddKiOPqkkcSmZ8L0=; b=3dHt22FADj90ctGuVEm7tOZvP5
	KD6r7twXK++PsoEgOmgMDDCXoXkcV85yi6NPpFtn51cXSCjGB34UOBH+RrcO08CYbw+KdL538Qv5W
	tdnM/Zc48GbqfYfty+mcFdfRislkN87O5lFWjo7vipJTvpjnKnQsQWJGYvc8SwkKAXrKa/Y7S2V1J
	yDS6HBsIwHJ5yPQ85wlVxwFb8MSd1IaeTnHga8GfaPh9p/w+WH1U6EsB+RUep31wUyPhhonafVPw1
	Q9LnFTvMANYzJshIxE+Eu0qtqxB1EwlXUePgFb7aEyU3vKheQAab4nGrPzgIyEoOS/S2xdwyi3q7H
	gR1kQqvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBgG8-00000004hK1-0EAz;
	Tue, 29 Sep 2026 22:25:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBgG5-00000004hJb-02X1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 22:25:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3528C1477;
	Tue, 29 Sep 2026 15:25:04 -0700 (PDT)
Received: from [10.57.11.173] (unknown [10.57.11.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80E343F85F;
	Tue, 29 Sep 2026 15:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790720707; bh=PSFY58zfgo7NCqRkFalHFfkLib+HJnqBr347USh2gQk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m7hQcXa/IwCt+CQ2zrTCDaxuzTtR7RybPJ6LZhfLPRxIihumkuxswsX8/5Fw0/5b6
	 4WxOaQ1WT4kuoYRhRgrBFiBkHeAKPTuQY5zbjMANIaBu+ua2+pEWw18fZIw8iUzy2Z
	 uq6US/z6I6kHX1t+zYCc9gmUqNkA/dzMI7SMDSiw=
Message-ID: <7859d7ee-e9cd-4589-9818-7eaafe28785b@arm.com>
Date: Tue, 29 Sep 2026 23:25:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 6/7] firmware: arm_rmm: Ensure the RMM has GPT entries
 for memory
Content-Language: en-GB
To: Shanker Donthineni <sdonthineni@nvidia.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 gshan@redhat.com, joey.gouly@arm.com, tabba@google.com,
 yuzenghui@huawei.com, linux-coco@lists.linux.dev,
 gankulkarni@os.amperecomputing.com, alpergun@google.com,
 fj0570is@fujitsu.com, WeiLin.Chang@arm.com, lpieralisi@kernel.org,
 enju.kohei@fujitsu.com, sudeep.holla@arm.com,
 jonathan.cameron@oss.qualcomm.com
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-7-suzuki.poulose@arm.com>
 <97938711-a762-4a06-a345-8e929f2e33a8@nvidia.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <97938711-a762-4a06-a345-8e929f2e33a8@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_152509_166083_9B01C75C 
X-CRM114-Status: GOOD (  24.85  )
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

On 29/09/2026 23:17, Shanker Donthineni wrote:
> Hi Suzuki,
> 
> On 9/24/2026 8:52 AM, Suzuki K Poulose wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> From: Steven Price <steven.price@arm.com>
>>
>> The RMM maintains the state of all the granules in the system to make
>> sure that the host is abiding by the rules. This state can be maintained
>> at different granularity, per page (TRACKING_FINE) or per region
>> (TRACKING_COARSE or TRACKING_INTERMEDIATE). The region size depends on 
>> the
>> underlying "RMI_GRANULE_SIZE". For a "coarse"/"intermediate" region,
>> all pages in the region must be of the same state, this implies we 
>> need to
>> have "fine" tracking for DRAM, so that we can delegate individual pages.
>>
>> For now we only support a statically carved out memory for tracking
>> granules for the "fine" regions. This can be extended in the future to
>> allow modifying the tracking granularity and remove the need for a
>> static allocation by the firmware.

Like the commit description says here ...


>> +/*
>> + * Make sure the area is tracked by RMM at FINE granularity.
>> + * We do not support changing the tracking yet.
>> + */
>> +static int rmi_verify_memory_tracking(phys_addr_t start, phys_addr_t 
>> end)
>> +{
>> +       while (start < end) {
>> +               unsigned long ret, category, state, next;
>> +
>> +               ret = rmi_granule_tracking_get(start, end, &category, 
>> &state, &next);
>> +               if (ret != RMI_SUCCESS)
>> +                       return -ENOMEM;
>> +
>> +               if (WARN_ON(next <= start))
>> +                       return -ENXIO;
>> +
>> +               if (state != RMI_TRACKING_FINE ||
>> +                   category != RMI_MEM_CATEGORY_CONVENTIONAL) {
>> +                       /* TODO: Set granule tracking in this case */
>> +                       pr_err("Granule tracking for region isn't 
>> fine/conventional: %llx-%lx\n",
>> +                              start, next);
>> +                       return -ENODEV;
> 
> This rejects any region the RMM does not already report as FINE,
> but the initial tracking state is IMPLEMENTATION DEFINED, nothing
> in DEN0137 Beta3 requires it to be FINE out of reset, and the full
> RMI_TRACKING_* range is legal to observe here.

Agreed. This was a deliberate decision to keep this series simple.
Once we have a base support merged, we can add support for dynamic
tracking and GPTs.

Kind regards
Suzuki


> 
> On NVIDIA platforms it is not FINE, so this path fails and CCA cannot
> be enabled at all. The TODO above is therefore load-bearing rather than
> an optimisation: the driver has to promote the region with
> RMI_GRANULE_TRACKING_SET and re-query, not bail out.


> 
> -Shanker
> 
>> +               }
>> +               start = next;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +/*
>> + * rmi_gpt_info - Query the GPT info for the given PAR.
>> + * @start: Base of the physical address region
>> + * @end: Top of the physical address region
>> + * @out_top: Top of the physical address region for which
>> + *             the GPT @out_gpt_par_state is valid
>> + * @out_gpt_par_state: State of the GPT covered by [start, out_top)
>> + */
>> +static long rmi_gpt_info(unsigned long start, unsigned long end,
>> +                        unsigned long *out_top,
>> +                        unsigned long *out_gpt_par_state)
>> +{
>> +       struct arm_smccc_1_2_regs regs = {
>> +               SMC_RMI_GPT_INFO, start, end,
>> +       };
>> +
>> +       rmi_smccc_invoke(&regs);
>> +       if (regs.a0 != RMI_SUCCESS)
>> +               return regs.a0;
>> +
>> +       if (out_top)
>> +               *out_top = regs.a1;
>> +       if (out_gpt_par_state)
>> +               *out_gpt_par_state = regs.a2;
>> +
>> +       return RMI_SUCCESS;
>> +}
>> +
>> +/*
>> + * We do not support creating L1 GPTs yet. So, make sure that
>> + * all the regions are managed by the firmware.
>> + */
>> +static int rmi_verify_gpt_firmware_managed(phys_addr_t start, 
>> phys_addr_t end)
>> +{
>> +       unsigned long l0gpt_sz;
>> +       unsigned long next, par_state;
>> +
>> +       l0gpt_sz = 1UL << (30 + FIELD_GET(RMI_FEATURE_REGISTER_1_L0GPTSZ,
>> +                                         rmi_feat_reg(1)));
>> +       start = ALIGN_DOWN(start, l0gpt_sz);
>> +       end = ALIGN(end, l0gpt_sz);
>> +
>> +       while (start < end) {
>> +               long ret = rmi_gpt_info(start, end, &next, &par_state);
>> +
>> +               if (ret != RMI_SUCCESS)
>> +                       return -ENOMEM;
>> +
>> +               if (WARN_ON(next <= start))
>> +                       return -ENXIO;
>> +
>> +               if (par_state != RMI_GPT_PAR_PLAT) {
>> +                       pr_err("GPT for the region is not managed by 
>> firmware %llx-%lx\n",
>> +                               start, next);
>> +                       return -ENOMEM;
>> +               }
>> +               start = next;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int rmi_prepare_memory(phys_addr_t start, phys_addr_t end)
>> +{
>> +       int ret;
>> +
>> +       if (start >= end)
>> +               return -EINVAL;
>> +
>> +       ret = rmi_verify_memory_tracking(start, end);
>> +       if (ret)
>> +               return ret;
>> +
>> +       return rmi_verify_gpt_firmware_managed(start, end);
>> +}
>> +
>> +static int rmi_init_metadata(void)
>> +{
>> +       phys_addr_t start, end;
>> +       struct memblock_region *r;
>> +
>> +       for_each_mem_region(r) {
>> +               int ret;
>> +
>> +               /* Firmware-reserved NOMAP regions are not usable 
>> system RAM */
>> +               if (memblock_is_nomap(r))
>> +                       continue;
>> +
>> +               start = PAGE_ALIGN(r->base);
>> +               end = PAGE_ALIGN_DOWN(r->base + r->size);
>> +               /* Too small ? */
>> +               if (start >= end)
>> +                       continue;
>> +
>> +               ret = rmi_prepare_memory(start, end);
>> +               if (ret)
>> +                       return ret;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int rmi_memory_notifier(struct notifier_block *nb,
>> +                              unsigned long action, void *data)
>> +{
>> +       struct memory_notify *arg = data;
>> +       phys_addr_t start, end;
>> +       int ret;
>> +
>> +       if (action != MEM_GOING_ONLINE)
>> +               return NOTIFY_DONE;
>> +
>> +       start = PFN_PHYS(arg->start_pfn);
>> +       end = PFN_PHYS(arg->start_pfn + arg->nr_pages);
>> +       ret = rmi_prepare_memory(start, end);
>> +
>> +       return notifier_from_errno(ret);
>> +}
>> +
>> +static struct notifier_block rmi_memory_nb = {
>> +       .notifier_call = rmi_memory_notifier,
>> +};
>> +
>> +bool is_rmi_available(void)
>> +{
>> +       return arm64_rmi_is_available;
>> +}
>> +EXPORT_SYMBOL_GPL(is_rmi_available);
>> +
>> +static int rmi_init_memory(void)
>> +{
>> +       int ret;
>> +
>> +       ret = rmi_init_metadata();
>> +       if (ret)
>> +               return ret;
>> +
>> +       return register_memory_notifier(&rmi_memory_nb);
>> +}
>> +
>>   static int __init arm64_init_rmi(void)
>>   {
>>          int ret;
>> @@ -843,9 +1049,19 @@ static int __init arm64_init_rmi(void)
>>          if (ret) {
>>                  pr_err("RMM activate failed (%d)\n", ret);
>>                  ret = ret < 0 ? ret : -ENXIO;
>> +               return ret;
>>          }
>>
>> -       return ret;
>> +       ret = rmi_init_memory();
>> +       if (ret) {
>> +               /* Deactivate the RMM */
>> +               WARN_ON(rmi_sro_memxfer_cmd(sro, GFP_KERNEL, 
>> SMC_RMI_RMM_DEACTIVATE));
>> +               return ret;
>> +       }
>> +
>> +       arm64_rmi_is_available = true;
>> +       pr_info("RMI configured\n");
>> +       return 0;
>>   }
>>
>>   /*
>> diff --git a/include/linux/arm-rmi-cmds.h b/include/linux/arm-rmi-cmds.h
>> index b03974fd8168c..5b177bb176326 100644
>> --- a/include/linux/arm-rmi-cmds.h
>> +++ b/include/linux/arm-rmi-cmds.h
>> @@ -70,6 +70,8 @@ static inline int rmi_undelegate_page(phys_addr_t phys)
>>          return rmi_undelegate_range(phys, PAGE_SIZE);
>>   }
>>
>> +bool is_rmi_available(void);
>> +
>>   long rmi_sro_memxfer_execute(struct rmi_sro_state *sro, gfp_t gfp);
>>   void rmi_sro_free(struct rmi_sro_state *sro);
>>   long rmi_sro_execute(struct arm_smccc_1_2_regs *regs);
>> -- 
>> 2.43.0
>>
> 


