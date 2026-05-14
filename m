Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3955DCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 09:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zAIcYPs9CA2AQzBaKWRzvmYp5PdiO4TrDMadoZEFNPQ=; b=tdN9vjKN0YgoQsPt1LWD03exdJ
	+8jZIg2FK2TC8kPyz49L2u2kGu3ACJOcRUj7K/Vx9oxgerIaGnnh92tm5H41H9NYn6FDJDjAjClBL
	3EdOUmE2XAM2EZ3MgDyAh1upej2ezLR0l4s+aP8BKpzqAUGa8zP3QzpmOkukdtBpmuReZpG+4MTNd
	SVb+MUIy3ZwmptyKaAx7IwXB5pOlA5DtLl/XXB2mK4QEv0Fy6Tm+SiCZo/KLHDnfeAqyXyqUXdCh1
	uRkSRzHH9AExAgH3miH+P/eFph1fDQuH92eE/Rk1VMlTefjVCAvOT6G3AjQ4PIq1PnbqaXPD07QpQ
	YcvlP5tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNS5E-0000000514l-0BpB;
	Thu, 14 May 2026 09:10:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNS5B-0000000513b-13wN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 09:10:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE5563502;
	Thu, 14 May 2026 02:10:08 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0733A3F85F;
	Thu, 14 May 2026 02:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778749814; bh=6WdgSVMT1/HuNpQmTptj568ulJx8H66BVsxpAr09b64=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dGDtK0A4Gt7rlrsd7zSytiBBV0jCpOpMzhhPBLrR7Rl6GygveWfJtBdh8JtTyNN5i
	 LVI90aLOElSV4O8S/j4nQkbGmNEWmbO23VhMjDb0VtSgUoQ0N+QsIDx2qwF+1avWGM
	 OFqYbGR4TT3h/3vn4NuYY2JLu7S6CrtpgITZH7cQ=
Message-ID: <9b9dddc6-16d0-44a9-a785-37c072f73af0@arm.com>
Date: Thu, 14 May 2026 10:10:04 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH 5/5] arm_mpam: detect and enable MPAM-Fb PCC support
To: Andre Przywara <andre.przywara@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260429141339.3171205-1-andre.przywara@arm.com>
 <20260429141339.3171205-6-andre.przywara@arm.com>
 <42144185-2d4b-4340-a2e4-aff871637e2f@arm.com>
 <81f8bea6-bcf3-4523-ae0e-3d45c32800cb@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <81f8bea6-bcf3-4523-ae0e-3d45c32800cb@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_021017_401801_BA8B0F0D 
X-CRM114-Status: GOOD (  29.88  )
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

Hi Andre,

On 5/13/26 15:51, Andre Przywara wrote:
> Hi Ben,
> 
> On 5/8/26 12:48, Ben Horgan wrote:
>> Hi Andre,
>>
>> On 4/29/26 15:13, Andre Przywara wrote:
>>> The Arm MPAM-Fb specification [1] describes a protocol to access MSC
>>> registers through a firmware interface. This requires a shared memory
>>> region to hold the message, and a mailbox to trigger the access.
>>> For ACPI this is wrapped as a PCC channel, described using existing
>>> ACPI abstractions.
>>>
>>> Add code to parse those PCC table descriptions associated with an MSC,
>>> and store the parsed information in the MSC struct.
>>> This will be used by the MPAM-Fb access wrapper code.
>>>
>>> [1] https://developer.arm.com/documentation/den0144/latest
>>>
>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>> ---
>>>   drivers/acpi/arm64/mpam.c      |  2 ++
>>>   drivers/resctrl/mpam_devices.c | 46 +++++++++++++++++++++++++++++++---
>>>   2 files changed, 45 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/acpi/arm64/mpam.c b/drivers/acpi/arm64/mpam.c
>>> index 99c2bdbb3314..edb4d10e8dc3 100644
>>> --- a/drivers/acpi/arm64/mpam.c
>>> +++ b/drivers/acpi/arm64/mpam.c
>>> @@ -341,6 +341,8 @@ static struct platform_device * __init acpi_mpam_parse_msc(struct acpi_mpam_msc_
>>>       } else if (iface == MPAM_IFACE_PCC) {
>>>           props[next_prop++] = PROPERTY_ENTRY_U32("pcc-channel",
>>>                               tbl_msc->base_address);
>>> +        props[next_prop++] = PROPERTY_ENTRY_U32("msc-id",
>>> +                            tbl_msc->identifier);
>>>       }
>>>         acpi_mpam_parse_irqs(pdev, tbl_msc, res, &next_res);
>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>>> index 62aa04cb6905..6f0d0959d3a4 100644
>>> --- a/drivers/resctrl/mpam_devices.c
>>> +++ b/drivers/resctrl/mpam_devices.c
>>> @@ -19,6 +19,7 @@
>>>   #include <linux/irqdesc.h>
>>>   #include <linux/list.h>
>>>   #include <linux/lockdep.h>
>>> +#include <linux/mailbox_client.h>
>>>   #include <linux/mutex.h>
>>>   #include <linux/platform_device.h>
>>>   #include <linux/printk.h>
>>> @@ -27,6 +28,9 @@
>>>   #include <linux/types.h>
>>>   #include <linux/workqueue.h>
>>>   +#include <acpi/pcc.h>
>>> +#include <acpi/acpi_io.h>
>>> +
>>>   #include "mpam_internal.h"
>>>   #include "mpam_fb.h"
>>>   @@ -1042,7 +1046,8 @@ static u64 mpam_msc_read_mbwu_l(struct mpam_msc *msc)
>>>         mpam_mon_sel_lock_held(msc);
>>>   -    WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
>>> +    if (msc->iface == MPAM_IFACE_MMIO)
>>> +        WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
>>
>> This should be in a different patch.
> 
> Which one, preferably? A separate one? Or patch 3/5, which adds the PCC access code?
> This one here is the patch that enables non-MMIO accesses, so I figured that's the place we should relax this check.

I thought this matched the WARN_ON_ONCE() changes in patch 3/5 but that patch just concentrates on the lower level so
I'm ok to keep it in this patch. I think you've missed a similar WARN_ON_ONCE() in mpam_msc_zero_mbwu_l() though.

> 
>>
>>>       WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
>>>         mbwu_l_high2 = __mpam_read_reg(msc, MSMON_MBWU_L + 4);
>>> @@ -2042,10 +2047,15 @@ static void mpam_msc_drv_remove(struct platform_device *pdev)
>>>       mpam_free_garbage();
>>>   }
>>>   +static void mpam_pcc_rx_callback(struct mbox_client *cl, void *msg)
>>> +{
>>> +    /* TODO: wake up tasks blocked on this MSC's PCC channel */
>>> +}
>>> +
>>>   static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>>>   {
>>>       int err;
>>> -    u32 tmp;
>>> +    u32 pcc_subspace_id;
>>>       struct mpam_msc *msc;
>>>       struct resource *msc_res;
>>>       struct device *dev = &pdev->dev;
>>> @@ -2090,7 +2100,8 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>>>       if (err)
>>>           return ERR_PTR(err);
>>>   -    if (device_property_read_u32(&pdev->dev, "pcc-channel", &tmp))
>>> +    if (device_property_read_u32(&pdev->dev, "pcc-channel",
>>> +                     &pcc_subspace_id))
>>>           msc->iface = MPAM_IFACE_MMIO;
>>>       else
>>>           msc->iface = MPAM_IFACE_PCC;
>>> @@ -2106,6 +2117,35 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>>>           }
>>>           msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
>>>           msc->mapped_hwpage = io;
>>> +    } else if (msc->iface == MPAM_IFACE_PCC) {
>>> +        u32 msc_id;
>>> +
>>> +        msc->pcc_cl.dev = &pdev->dev;
>>> +        msc->pcc_cl.rx_callback = mpam_pcc_rx_callback;
>>> +        msc->pcc_cl.tx_block = false;
>>
>> How do we make sure that, for instance, a MON_SEL write has completed before we start reading
>> the associated counters? Is there an ordering guarantee?
> 
> What is your concern here, exactly? To group all the accesses selected by one MON_SEL write, we have the mon_sel lock
> (now mutex) already. And on the mbox side I think we are safe because the PCC channel is exclusive, we have the per-
> channel mutex (pcc_chan_lock, in patch 3/5), and we wait for confirmation from the other end, even for writes. So as

That sounds like there is no problem then. I wasn't sure that we were waiting for confirmation of writes. We can assume
that the f/w end of the link processing the requests in the order it acknowledges them, right?

Is the waiting for confirmation of writes done by this bit of patch 3?

+	status = readl(chan->shmem + SCMI_MSG_HEADER_OFS);
+	if (FIELD_GET(MPAM_MSC_TOKEN_MASK, status) != token)
+		return -ETIMEDOUT;


> long as the MON_SEL write appears in program order before the counter read, all should be good, no? Am I missing something?

I expect that I'm the one who was missing something.

Thanks,

Ben

> 
> Cheers,
> Andre
> 
>>
>> Thanks,
>>
>> Ben
>>
>>> +        msc->pcc_cl.tx_tout = 1000; /* 1s */
>>> +        msc->pcc_cl.knows_txdone = false;
>>> +
>>> +        if (device_property_read_u32(&pdev->dev, "msc-id", &msc_id)) {
>>> +            pr_err("missing MPAM-Fb MSC identifier\n");
>>> +            return ERR_PTR(-EINVAL);
>>> +        }
>>> +        msc->mpam_fb_msc_id = msc_id;
>>> +
>>> +        msc->pcc_chan = pcc_mbox_request_channel(&msc->pcc_cl,
>>> +                             pcc_subspace_id);
>>> +        if (IS_ERR(msc->pcc_chan)) {
>>> +            pr_err("Failed to request MSC PCC channel\n");
>>> +            return (void *)msc->pcc_chan;
>>> +        }
>>> +
>>> +        if (msc->pcc_chan->shmem_size < MPAM_FB_MAX_MSG_SIZE) {
>>> +            pr_err("MPAM-Fb PCC channel size too small.\n");
>>> +            pcc_mbox_free_channel(msc->pcc_chan);
>>> +            return ERR_PTR(-ENOMEM);
>>> +        }
>>> +
>>> +        mutex_init(&msc->pcc_chan_lock);
>>>       } else {
>>>           return ERR_PTR(-EINVAL);
>>>       }
>>
> 


