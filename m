Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731B1C44512
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 00:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4gq93nDWMHOeVQGnXcHpqoGzD9LIBQdwZhTDM+lfGk=; b=WkAEf2nhAwS8pd5oBjifss+dfh
	mK3pWDhZcouedA4yRwIvn7TIokYRZjg3ZwvgGGg2GKyfe3A4lOJhpE3uD7lxkJENnemxSsFB4pMB2
	YBqGzGdtFUtCEBFlqjauev4e/eHEZ2lW0Wskhj/T1nDo+5YsoR+rqeKp8baCKZl+yizmSjf+8xGOs
	X5LSYXarea+f76KYh948v/la45BP3DY/KbnfyQjSqpsuB0XoKGKSZQRwDTgAHFqJ8JXq8mknOBpx0
	/Go3Mt52A5Lf0MCgwjYrEEcRnOPLE00Bjnw4BsKc8fiRKa88TKjHrIxg3RLyqBPEEALE8emcMwIOB
	XUT1J4Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkWnd-00000000r8z-3P2p;
	Fri, 17 Jul 2026 00:51:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkWnb-00000000r8b-0Oue
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 00:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784249489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A4gq93nDWMHOeVQGnXcHpqoGzD9LIBQdwZhTDM+lfGk=;
	b=Ddvg44Uzgvv42g6iFzeXjqnB7I3HMcjmhSppCEbiX5uXBKxx093MwBvBeDAxIVPpMuZTUj
	i2EbzsY6u7yr0x8Jx96hT1P8wxRflmDPe8csdU4sEO5SByjPxyO/3uSNV45xT0e2uKr0iR
	eps6f2fxyooKh69DDPygIFx+o2v7P1k=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-SV9GFroFNpuNf8MyCPyTsg-1; Thu, 16 Jul 2026 20:51:27 -0400
X-MC-Unique: SV9GFroFNpuNf8MyCPyTsg-1
X-Mimecast-MFC-AGG-ID: SV9GFroFNpuNf8MyCPyTsg_1784249486
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cec4226c70so97113665ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 17:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784249486; x=1784854286;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A4gq93nDWMHOeVQGnXcHpqoGzD9LIBQdwZhTDM+lfGk=;
        b=Et/eXg58y9UJrV6UduJ3q6inJowVgiP+0Xf5ljE6KbcHP/kecWBZ8NK0Ka6PzhcpKW
         cxknvhqWPQYUxDQZblYMCFI3cl+2PMRdc5SxHojbUTdYU99UjuJpdNuJR7XRJqDZcBZT
         DF3uxVM4BTope8/YlcjHuJdco3iSaVmbr9mnhgQFLkPL/3S8NRnB0Nr+My3znq7TkAru
         PPZ7I3cgObmaTMEKjx027wn+lkvXJfyK7PU568OCoEAtGuxKRx7AF6HGc+/53RUM27eZ
         TSNg/fPBMkA/xF7zKYcp1dYw0FY0mJW68lQNT0wwNnXGvX//ie1v8kMWK93sEPibD/0T
         pFtQ==
X-Forwarded-Encrypted: i=1; AHgh+RoAigmf1uO5zGwYAqixMB21ljGhNpwvxiRSDurGxwjHbsf9IZuYgbey28nsgjpbNJTFZhOuQLfGV/lvEnnBkT0v@lists.infradead.org
X-Gm-Message-State: AOJu0YyCSstB53k7hIKnmQjKSmuH6amV2UdJSD0+yolhA75GKfjmswG4
	6HL+GNhOCqAJegGE/zIhSxSDCPd5wBSi3VXvcfejd6X0+XR6Tl5RDIuXB/2SO7zrk3AsaQHYHek
	EoQ/KVzqvJD6pvk0vyFlOXLxhyybOzjy3OxyYibLgNSPXnip0paCxqH/k2LX0cUmRJAL0w735nN
	EL
X-Gm-Gg: AfdE7cl9wt9CQSOgUdIaUoQ92Y6lf3CAWxYzQVQWbi+/dV8CQdSQByAch49oSp5zhSR
	cb4ikkItMxgnbmY0CP/H5WIKSh8Wa+9XxMNOnsEQb5hJKfuodwk2VK34BBDcghI2OWbwtotx022
	jbwwwEH5VMbTOjb290aLGO9oqB28xwbl+8fCV8C1crz8auYLmUDJLjSeMoWet33Z22WWmxI+uIg
	Yc1aSyEVlxV5efzL7f8Z5VbFRY2aZe1XThx0srMbHpsbji7AmqIlmRH1gArQKpN9xzaz+mD1t6q
	qcIVXofEl85E7MrMUuS/iAQqix9vqTSJ17pctsZXQOCFekF7WVk6+HbbVjF3RvEIl8XQIeZ4BY7
	yyVZjber8Bz7cfENaUVTz3L23k1RJXhn+/T1DclfSgk0=
X-Received: by 2002:a17:902:d588:b0:2c9:e86e:a9f5 with SMTP id d9443c01a7336-2cf348669c4mr4415465ad.18.1784249486437;
        Thu, 16 Jul 2026 17:51:26 -0700 (PDT)
X-Received: by 2002:a17:902:d588:b0:2c9:e86e:a9f5 with SMTP id d9443c01a7336-2cf348669c4mr4415235ad.18.1784249486009;
        Thu, 16 Jul 2026 17:51:26 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd428b2d3sm13233307c88.5.2026.07.16.17.51.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 17:51:24 -0700 (PDT)
Message-ID: <589790ee-d5b3-4460-99e0-003ef9903dcd@redhat.com>
Date: Fri, 17 Jul 2026 10:51:18 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/11] arm_mpam: Restore the error interrupt enable
 from mpam_cpu_online()
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260710115546.29644-1-ben.horgan@arm.com>
 <20260710115546.29644-3-ben.horgan@arm.com>
 <519cddd8-d67a-4aef-afdf-97c933b73f82@redhat.com>
 <fdca99b6-3298-4959-a3a4-b4e552322731@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <fdca99b6-3298-4959-a3a4-b4e552322731@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GAouGLyr8sbmR7iTB6C_LWXYGQnfFkHYWfS-b8lwuvU_1784249486
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_175131_210811_72013410 
X-CRM114-Status: GOOD (  23.57  )
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

On 7/16/26 6:59 PM, Ben Horgan wrote:
> On 7/16/26 04:59, Gavin Shan wrote:
>> On 7/10/26 9:55 PM, Ben Horgan wrote:
>>> When all CPUs affine to an MSC are offline the MSC may lose register state
>>> which the driver then restores when an affine CPU comes back online. The
>>> error interrupt enable, MPAMF_ECR.INTEN, is missed.
>>>
>>> Restore MPAMF_ECR at CPU online.
>>>
>>> Fixes: 49aa621c4dca ("arm_mpam: Register and enable IRQs")
>>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>>> ---
>>>    drivers/resctrl/mpam_devices.c | 8 +++++++-
>>>    1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>>> index 82966ca2a631..acfa9a4dc2fc 100644
>>> --- a/drivers/resctrl/mpam_devices.c
>>> +++ b/drivers/resctrl/mpam_devices.c
>>> @@ -1852,8 +1852,14 @@ static int mpam_cpu_online(unsigned int cpu)
>>>            if (msc->reenable_error_ppi)
>>>                _enable_percpu_irq(&msc->reenable_error_ppi);
>>>    -        if (atomic_fetch_inc(&msc->online_refs) == 0)
>>> +        if (atomic_fetch_inc(&msc->online_refs) == 0) {
>>> +            mutex_lock(&msc->error_irq_lock);
>>> +            if (msc->error_irq_hw_enabled)
>>> +                mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
>>> +            mutex_unlock(&msc->error_irq_lock);
>>> +
>>>                mpam_reprogram_msc(msc);
>>> +        }
>>>        }
>>>    
>>
>> I don't understand how this happened that MPAMF_ECR gets lost, but msc->error_irq_hw_enabled
>> is kept as true. mpam_disable_msc_ecr() is triggered in __mpam_irq_handler() or mpam_unregister_irqs().
>> Both are related to mpam_broken_work, which is invoked to disable the driver completely.
>> I don't see how MPAMF_ECR is cleared at CPU offline time.
> 
> The reasoning is the same as to why mpam_reprogram_msc() is already run here. When all the CPUs
> affine to an MSC at a cache are offline then the cache instance and so the MSC might be switched off
> and lose register state. Hence, any registers we rely on need to set when the MSC comes back online.
> For PSCI_CPU_SUSPEND this needs to be handled by the firmware and for PSCI_CPU_OFF the driver
> handles it. Does that make any more sense?
> 

Ok. You mean PSCI_CPU_OFF on the last associated CPU enforces a power-off on the MSC
either? In this case, the commit messages need to be clearer with something below.

   When all the associated CPUs to an MSC are offline, possibly caused by
   PSCI_CPU_OFF, the power supply to the MSC can be cut off and all registers,
   including MPAMF_ECR.INTEN, are lost. Afterwards, we need to explicitly set
   MPAMF_ECR.INTEN when the first associated CPU becomes online and the power
   supply to the MSC is recovered.

   Restore MPAMF_ECR.INTEN in mpam_cpu_online() when the first associated CPU
   of the MSC becomes online

> Thanks,
> 
> Ben
> 
>>
>>>        if (mpam_resctrl_enabled)
>>

Thanks,
Gavin


