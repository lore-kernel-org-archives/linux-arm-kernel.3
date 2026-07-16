Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C78C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 08:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pO+BH1r3BCsI/7dCPR09pPEAAkQne9n4brZ2nG1p1co=; b=fkHeL8+fr76ZleyIAwmydMejFw
	B43Kp3pR4YfaZmQ2h08T+G8g1C30tF8WvD3FYhXReF2hBEXKBSUyNOesUfdFWrbHOclcbsx1wRhoB
	0zFimdnHqutl9bd4WU8wU3jy8jtuozkQwUP+3Z3AVM/0a/xlc4kp6IfnlpAhjhxS6m8D9PbVa+nsJ
	wEA+2mxmj3dPIvN08bHPBXDs4ymC+pTS70uYUHTMqoDRHBE1Nzw/R9HU/ufpI6sZUUTfLET4fMQeY
	Re8qfGXjkQY7T3Z5f0GgR2dGobWzZZis3LPILPvxvdfT2bubaByI61KI0ibzaTN0k3/+qcx7JwZf5
	MDFlOjSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkHwZ-0000000GnUZ-1lLH;
	Thu, 16 Jul 2026 08:59:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkHwX-0000000GnU5-1bdL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 08:59:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16CFB339;
	Thu, 16 Jul 2026 01:59:37 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30E2C3F7B4;
	Thu, 16 Jul 2026 01:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784192381; bh=WnqDKuNfddYN/Kaj7opmABEUWn9nytGfiFO4xnHhk8E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EJtDDnN24rHUSiGGmieTFjmFUSvnU0EaaFOmncX1LM1HRJxl2+ZmlmuLToWl5mF8g
	 FOWJYZSzp0p6y1X9coW/PcqIFgH19IpZ10rNVBORtvvWS5fZ28/toesa6lmfZqfEJr
	 Il3gU+qT2RDQzZvwnq6k+UqKqEF7LGOzkEvqrdfA=
Message-ID: <fdca99b6-3298-4959-a3a4-b4e552322731@arm.com>
Date: Thu, 16 Jul 2026 09:59:38 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v1 02/11] arm_mpam: Restore the error interrupt enable
 from mpam_cpu_online()
To: Gavin Shan <gshan@redhat.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260710115546.29644-1-ben.horgan@arm.com>
 <20260710115546.29644-3-ben.horgan@arm.com>
 <519cddd8-d67a-4aef-afdf-97c933b73f82@redhat.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <519cddd8-d67a-4aef-afdf-97c933b73f82@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_015945_491145_D31C09A2 
X-CRM114-Status: GOOD (  21.54  )
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

Hi Gavin,

On 7/16/26 04:59, Gavin Shan wrote:
> Hi Ben,
> 
> On 7/10/26 9:55 PM, Ben Horgan wrote:
>> When all CPUs affine to an MSC are offline the MSC may lose register state
>> which the driver then restores when an affine CPU comes back online. The
>> error interrupt enable, MPAMF_ECR.INTEN, is missed.
>>
>> Restore MPAMF_ECR at CPU online.
>>
>> Fixes: 49aa621c4dca ("arm_mpam: Register and enable IRQs")
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>>   drivers/resctrl/mpam_devices.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 82966ca2a631..acfa9a4dc2fc 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -1852,8 +1852,14 @@ static int mpam_cpu_online(unsigned int cpu)
>>           if (msc->reenable_error_ppi)
>>               _enable_percpu_irq(&msc->reenable_error_ppi);
>>   -        if (atomic_fetch_inc(&msc->online_refs) == 0)
>> +        if (atomic_fetch_inc(&msc->online_refs) == 0) {
>> +            mutex_lock(&msc->error_irq_lock);
>> +            if (msc->error_irq_hw_enabled)
>> +                mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
>> +            mutex_unlock(&msc->error_irq_lock);
>> +
>>               mpam_reprogram_msc(msc);
>> +        }
>>       }
>>   
> 
> I don't understand how this happened that MPAMF_ECR gets lost, but msc->error_irq_hw_enabled
> is kept as true. mpam_disable_msc_ecr() is triggered in __mpam_irq_handler() or mpam_unregister_irqs().
> Both are related to mpam_broken_work, which is invoked to disable the driver completely.
> I don't see how MPAMF_ECR is cleared at CPU offline time.

The reasoning is the same as to why mpam_reprogram_msc() is already run here. When all the CPUs
affine to an MSC at a cache are offline then the cache instance and so the MSC might be switched off
and lose register state. Hence, any registers we rely on need to set when the MSC comes back online.
For PSCI_CPU_SUSPEND this needs to be handled by the firmware and for PSCI_CPU_OFF the driver
handles it. Does that make any more sense?

Thanks,

Ben

> 
>>       if (mpam_resctrl_enabled)
> 
> Thanks,
> Gavin
> 


