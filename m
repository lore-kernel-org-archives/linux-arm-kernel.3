Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F43606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 11:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P1rOGtKt;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=PwyI9/9e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=u+foQgDZkWrHkKQBx0bvyWV25TtNNT4zfUBVT49zaP8=; b=P1rOGtKtE3CMx7
	SSBNSq0cY8WQsy/fIY6cbGB8V5oZKxlSYXTC6obBgkMV0vb88MvnbsXDiFQx+KMIXUZw6v60RHq8+
	SdMBy3Edr/jt1xyB+V7hDWqALNN3ExqeI70kCPBZFTzTATFqTV5UZ/zlGiFoCl2DUlmu9Nv9YcT4V
	YLQx/5/UaW+CeTRRPbaP4RzFs9N8g7x432zuc6iNtOGJFmfLWNZeO6VO+SU2D3WIDn3oHs8X1WYhQ
	7sZZLhU96E9iwlY5jYDlFjnHT7btF5VVnMPXm2DdVMJXWPao7yjDVHe3qZlwHEVZ337NDA6QFFFKg
	IxEhy34gvfj+C35pNx2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZ3h-000000058Ln-2WSW;
	Wed, 04 Nov 2026 11:21:37 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZ3f-000000058LS-30hc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 11:21:36 +0000
Received: from [192.168.1.10] (unknown [4.194.122.136])
	by linux.microsoft.com (Postfix) with ESMTPSA id A8DDB20B7166;
	Wed,  4 Nov 2026 03:21:15 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A8DDB20B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1793791278;
	bh=u+foQgDZkWrHkKQBx0bvyWV25TtNNT4zfUBVT49zaP8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=PwyI9/9eBIlcYIEGJgioMFRBfJW+1zfgWp7hfPyi+uePu6rLPrZ2mePdxUWLqyUfU
	 Ty+s22sa0kTHr49CCc+KaGT8RgFWLGLJrnYX6gvD93AOUwyGdZAcGheCWHMciSofEQ
	 +D3Zpt5n0tPsU1Y652bkAiEUedd8lb2u7epaZm1k=
Message-ID: <439409ae-bd42-459e-9c0d-21fc5629f635@linux.microsoft.com>
Date: Wed, 4 Nov 2026 16:51:28 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mailbox: zynqmp-ipi: Fix CPU hotplug state cleanup
To: "Pandey, Radhey Shyam" <radheys@amd.com>, jassisinghbrar@gmail.com,
 michal.simek@amd.com, tanmay.shah@amd.com, saeed.nowshadi@amd.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ssengar@linux.microsoft.com, tgopinath@linux.microsoft.com,
 srivatsa@csail.mit.edu
References: <20261103062051.676519-1-ptsm@linux.microsoft.com>
 <15903ed0-d3bd-4cf9-a051-ec663411ae38@amd.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <15903ed0-d3bd-4cf9-a051-ec663411ae38@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_032135_793307_4370243A 
X-CRM114-Status: GOOD (  21.75  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>

Hi Radhey Shyam,

Thanks for reviewing this.

On 04-11-2026 11:23, Pandey, Radhey Shyam wrote:
> On 11/3/2026 11:50 AM, Prasanna Kumar T S M wrote:
>> On driver removal, the CPUHP_AP_ONLINE_DYN CPU hotplug state is removed
>> instead of the its actual state. This can leave the mailbox driver
>> callbacks dangling. Use the actual CPU hotplug state during driver
>> removal.
>>
>> Hotplug registration failures are also ignored, allowing probe to
>> succeed without the callbacks needed to enable interrupts on CPUs
>> brought online later.
>>
>> Fixes: 6ffb1635341be ("mailbox: zynqmp: handle SGI for shared IPI")
> 
> Nit - only first 12 characters of the SHA-1 ID are sufficient.

Sure, I will update.

> 
> Also describe the failure signature and how the error is reproduced.
> 
> 
>> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
>> ---
>>   drivers/mailbox/zynqmp-ipi-mailbox.c | 14 +++++++++++---
>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/ 
>> zynqmp-ipi-mailbox.c
>> index 42d2583e44ca..b0643ee75db0 100644
>> --- a/drivers/mailbox/zynqmp-ipi-mailbox.c
>> +++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
>> @@ -136,6 +136,7 @@ struct zynqmp_ipi_pdata {
>>       unsigned int method;
>>       u32 local_id;
>>       int virq_sgi;
>> +    enum cpuhp_state hp_state;
> 
> Warning: drivers/mailbox/zynqmp-ipi-mailbox.c:141 struct member 
> 'hp_state' not described in 'zynqmp_ipi_pdata'

I will update this in v2.

> 
>>       int num_mboxes;
>>       struct zynqmp_ipi_mbox ipi_mboxes[] __counted_by(num_mboxes);
>>   };
>> @@ -863,15 +864,22 @@ static int xlnx_mbox_init_sgi(struct 
>> platform_device *pdev,
>>       irq_set_status_flags(pdata->virq_sgi, IRQ_PER_CPU);
>>       /* Setup function for the CPU hot-plug cases */
>> -    cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "mailbox/sgi:starting",
>> -              xlnx_mbox_cpuhp_start, xlnx_mbox_cpuhp_down);
>> +    pdata->hp_state = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
>> +              "mailbox/sgi:starting", xlnx_mbox_cpuhp_start,
> 
> what is :starting here ?

I used the existing string.

> 
>> +              xlnx_mbox_cpuhp_down);
>> +    if (pdata->hp_state < 0) {
>> +        irq_clear_status_flags(pdata->virq_sgi, IRQ_PER_CPU);
>> +        free_percpu_irq(pdata->virq_sgi, &per_cpu_pdata);
>> +        irq_dispose_mapping(pdata->virq_sgi);
>> +        return pdata->hp_state;
> 
>   1. The new error path double-frees and then hits BUG().
> Please reconfirm.
> 
> zynqmp_ipi_probe() sets pdata->irq_type before calling 
> xlnx_mbox_init_sgi(), and its only error label runs
>    zynqmp_ipi_free_mboxes() → xlnx_mbox_cleanup_sgi() whenever irq_type 
> == IPI_IRQ_TYPE_SGI. So the new unwind runs, then the caller's unwind 
> repeats
>    irq_clear_status_flags(), free_percpu_irq() and 
> irq_dispose_mapping(). Before any of that, cleanup calls 
> cpuhp_remove_state(pdata->hp_state) with the negative errno still in the 
> field, and _cpuhp_remove_state_cpuslocked() opens with 
> BUG_ON(cpuhp_cb_check(state)), which rejects anything <= CPUHP_OFFLINE. 
> A failed hotplug registration now panics instead of failing probe.
> 

I will fix this in v2.

> 
>> +    }
>>       return ret;
>>   }
>>   static void xlnx_mbox_cleanup_sgi(struct zynqmp_ipi_pdata *pdata)
>>   {
>> -    cpuhp_remove_state(CPUHP_AP_ONLINE_DYN);
>> +    cpuhp_remove_state(pdata->hp_state);
>>       on_each_cpu(xlnx_disable_percpu_irq, NULL, 1);

Thanks,
Prasanna Kumar

