Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADA5D3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 03:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CS1U9kbXClTn3ClPyOJkBE6Q0JxlFOFOmyrM4XYp2Bs=; b=YK2G9g8l+jIbuesKJBNZXaIijp
	qrnzXMhugtG/wybV8pCmnc5SvJFH00UFyomPlKZXm4EK0U5zftSV2BARBSYLWbi42xOWKgKjELZUl
	w8YCfdjY8HBJBZrkYFWmxoVkqQhMNPwj+Ywh3r0qeCZlayN9iQirKZ1uZ7R4nncrF+nJBFde/eE0D
	fndwMzN+iRkPgAfWQ3npLB+OwNq34lWMSZUdhT69CWNlcCg6WEsqVfBuYb54nc6H6G8XgswiH2FDb
	trRR42lw7nej8e58AmVSGICiajjbLmTyh0o4LCa0cafqMD9eC73M2/SmufdB/2qHTId12hxE9SGPF
	z1OuOdLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va4Kb-00000003IgY-2RtC;
	Mon, 29 Dec 2025 03:54:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va4KX-00000003Ifv-33jq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 03:54:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766980439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CS1U9kbXClTn3ClPyOJkBE6Q0JxlFOFOmyrM4XYp2Bs=;
	b=bHxGPZK8uY9B+oZzcnIuGnenTpDh7lwb3MLMQHD8B4/4bEBs6gYBcgrMfEZ9jZRnJQLUnZ
	VY+oVuyAUKMkO3SFxeWLt96LcxcSNdS0bGO3kXBOX18nue5NTcPnwsk+CjGB3djHe+tzvR
	FqNmV6Il8roVx9V4rjbqWjQ5YDouUNk=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-8R_agG4yN4qjfqbp_Jl44A-1; Sun, 28 Dec 2025 22:53:56 -0500
X-MC-Unique: 8R_agG4yN4qjfqbp_Jl44A-1
X-Mimecast-MFC-AGG-ID: 8R_agG4yN4qjfqbp_Jl44A_1766980435
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b9d73d57328so9065382a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 19:53:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766980435; x=1767585235;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CS1U9kbXClTn3ClPyOJkBE6Q0JxlFOFOmyrM4XYp2Bs=;
        b=pjjjwrXc3HtRKjddEwG+uWykUXWKl5LQNkWQDJDXBNV90FPOCAr/u8tOgmX1og5+zF
         6b7G8ZSiAOnfBPnATxp62S6MeiLohPbDbw8eGtLS5OdaGGz+J1o6e0G2rK53XAv1BI9Y
         7EsLUY145cLGV23fZKFD5LRGCR2iJLjjTaKvAEl30p4t9ZxBVRP3h8FjUjfciN+61H7a
         qIgFjTiHhGR3gD/8KM94dmS4cEX7zL/WnCfnMAyo9kRClnDZN7cP9MgiMhVjNkUfGCUz
         ceyCd7ppE4HwwAYEvgjdPiXyeE1ZVxcuEQyxsbgFDsL49l74tyj0QVRSOI6iDoDMK5sM
         Pieg==
X-Forwarded-Encrypted: i=1; AJvYcCVYLOFisRLz9hZ1CqlHd9WFpMnIaEPVqVJ6ry9tG9SgZNkb9Qvxe1qgKM9HEY9ofV4/4Zriw2vfxbAJ4dJQ14LK@lists.infradead.org
X-Gm-Message-State: AOJu0Yzru6cOhamJv5zD3xRumHzNxXa+0C5rGXrstdc9/Yi1Kn0jBebV
	hvei4SpwvkkS0OXwwD2sNbLZBjfqJwjsLoS7CODAYX+AwMXxmlSdemc4mpf1OfxpHFi4xzdHStE
	MZnhRWAA5gqpjhKF8ldNSIx8mBaIP+TV6KapU6yL6bwoFrCOcblel6FEyhi1CA9xxaJqtsqeMd7
	X+
X-Gm-Gg: AY/fxX79nnFW/PLggrUQTFyG1hddgbqq44fTq+dZ3nsiQHEohP2389mKAmDhBFXAD9w
	p5XJLLG3BuZnPh4kG4XeRslB2YVyneZLu22MExFE9vYITUzfjpb/qRZ8i1Ms7ZDnIkUOHCVH35L
	zZ9mHsdaL1K9FAaPft10NC2JkEVHjpN8eWPTE5wXmdbUh3LTUr1ZpK2bHcOCpfgY69uHnSQy7K9
	T6AIwl2KjeodNL3mv+iSkutKWRrxy/a5/3x6I3PdNKt8ao8ZO7XSTZiNgYEr++fZIqqcdKz2S6H
	Gzdxf26HgoTMlR7JiVCk0dP3HsZZR30lHE9omV+7IudmJksv7Iw7DM0+52A+3viUvGfj3360lNE
	n4ul4DA/ldeH138XQJs7OTZO+qugoAeCIxreVcYTLR3BnI8nYK2kRZahy
X-Received: by 2002:a05:7301:508a:b0:2af:7429:e53d with SMTP id 5a478bee46e88-2b05ebf88e5mr14193609eec.10.1766980435148;
        Sun, 28 Dec 2025 19:53:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwUgAvkgKwyfAg/XY7OmY8/35HtixZhtufU5RpA+DoSNpJWPgIxTe0gLEz02J7RhXsL5qbsA==
X-Received: by 2002:a05:7301:508a:b0:2af:7429:e53d with SMTP id 5a478bee46e88-2b05ebf88e5mr14193600eec.10.1766980434676;
        Sun, 28 Dec 2025 19:53:54 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05ff8634csm69342683eec.3.2025.12.28.19.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 19:53:54 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <81f201cc-395a-48d7-a1b0-db8c62b93c9e@redhat.com>
Date: Sun, 28 Dec 2025 22:53:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/33] PCI: Prepare to protect against concurrent isolated
 cpuset change
To: Zhang Qiao <zhangqiao22@huawei.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Cc: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Chen Ridong <chenridong@huawei.com>, Danilo Krummrich <dakr@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Gabriele Monaco <gmonaco@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Marco Crivellari <marco.crivellari@suse.com>, Michal Hocko
 <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
 Paolo Abeni <pabeni@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Phil Auld <pauld@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Simon Horman <horms@kernel.org>,
 Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-block@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org,
 netdev@vger.kernel.org
References: <20251224134520.33231-1-frederic@kernel.org>
 <20251224134520.33231-2-frederic@kernel.org>
 <e01189e1-d8ef-2791-632c-90d4d897859b@huawei.com>
In-Reply-To: <e01189e1-d8ef-2791-632c-90d4d897859b@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0K0gDWKAvDDPJdggGSvlRGff4mTkYbgqYNq4bJQXX0g_1766980435
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_195401_858987_95912A95 
X-CRM114-Status: GOOD (  23.53  )
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

On 12/28/25 10:23 PM, Zhang Qiao wrote:
> Hi, Weisbecker，
>
> 在 2025/12/24 21:44, Frederic Weisbecker 写道:
>> HK_TYPE_DOMAIN will soon integrate cpuset isolated partitions and
>> therefore be made modifiable at runtime. Synchronize against the cpumask
>> update using RCU.
>>
>> The RCU locked section includes both the housekeeping CPU target
>> election for the PCI probe work and the work enqueue.
>>
>> This way the housekeeping update side will simply need to flush the
>> pending related works after updating the housekeeping mask in order to
>> make sure that no PCI work ever executes on an isolated CPU. This part
>> will be handled in a subsequent patch.
>>
>> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
>> ---
>>   drivers/pci/pci-driver.c | 47 ++++++++++++++++++++++++++++++++--------
>>   1 file changed, 38 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
>> index 7c2d9d596258..786d6ce40999 100644
>> --- a/drivers/pci/pci-driver.c
>> +++ b/drivers/pci/pci-driver.c
>> @@ -302,9 +302,8 @@ struct drv_dev_and_id {
>>   	const struct pci_device_id *id;
>>   };
>>   
>> -static long local_pci_probe(void *_ddi)
>> +static int local_pci_probe(struct drv_dev_and_id *ddi)
>>   {
>> -	struct drv_dev_and_id *ddi = _ddi;
>>   	struct pci_dev *pci_dev = ddi->dev;
>>   	struct pci_driver *pci_drv = ddi->drv;
>>   	struct device *dev = &pci_dev->dev;
>> @@ -338,6 +337,19 @@ static long local_pci_probe(void *_ddi)
>>   	return 0;
>>   }
>>   
>> +struct pci_probe_arg {
>> +	struct drv_dev_and_id *ddi;
>> +	struct work_struct work;
>> +	int ret;
>> +};
>> +
>> +static void local_pci_probe_callback(struct work_struct *work)
>> +{
>> +	struct pci_probe_arg *arg = container_of(work, struct pci_probe_arg, work);
>> +
>> +	arg->ret = local_pci_probe(arg->ddi);
>> +}
>> +
>>   static bool pci_physfn_is_probed(struct pci_dev *dev)
>>   {
>>   #ifdef CONFIG_PCI_IOV
>> @@ -362,34 +374,51 @@ static int pci_call_probe(struct pci_driver *drv, struct pci_dev *dev,
>>   	dev->is_probed = 1;
>>   
>>   	cpu_hotplug_disable();
>> -
>>   	/*
>>   	 * Prevent nesting work_on_cpu() for the case where a Virtual Function
>>   	 * device is probed from work_on_cpu() of the Physical device.
>>   	 */
>>   	if (node < 0 || node >= MAX_NUMNODES || !node_online(node) ||
>>   	    pci_physfn_is_probed(dev)) {
>> -		cpu = nr_cpu_ids;
>> +		error = local_pci_probe(&ddi);
>>   	} else {
>>   		cpumask_var_t wq_domain_mask;
>> +		struct pci_probe_arg arg = { .ddi = &ddi };
>> +
>> +		INIT_WORK_ONSTACK(&arg.work, local_pci_probe_callback);
>>   
>>   		if (!zalloc_cpumask_var(&wq_domain_mask, GFP_KERNEL)) {
>>   			error = -ENOMEM;
> If we return from here, arg.work will not be destroyed.
>
>
Right. INIT_WORK_ONSTACK() should be called after successful 
cpumask_var_t allocation.

Cheers,
Longman

>>   			goto out;
>>   		}
>> +
>> +		/*
>> +		 * The target election and the enqueue of the work must be within
>> +		 * the same RCU read side section so that when the workqueue pool
>> +		 * is flushed after a housekeeping cpumask update, further readers
>> +		 * are guaranteed to queue the probing work to the appropriate
>> +		 * targets.
>> +		 */
>> +		rcu_read_lock();
>>   		cpumask_and(wq_domain_mask,
>>   			    housekeeping_cpumask(HK_TYPE_WQ),
>>   			    housekeeping_cpumask(HK_TYPE_DOMAIN));
>>   
>>   		cpu = cpumask_any_and(cpumask_of_node(node),
>>   				      wq_domain_mask);
>> +		if (cpu < nr_cpu_ids) {
>> +			schedule_work_on(cpu, &arg.work);
>> +			rcu_read_unlock();
>> +			flush_work(&arg.work);
>> +			error = arg.ret;
>> +		} else {
>> +			rcu_read_unlock();
>> +			error = local_pci_probe(&ddi);
>> +		}
>> +
>>   		free_cpumask_var(wq_domain_mask);
>> +		destroy_work_on_stack(&arg.work);
>>   	}
>> -
>> -	if (cpu < nr_cpu_ids)
>> -		error = work_on_cpu(cpu, local_pci_probe, &ddi);
>> -	else
>> -		error = local_pci_probe(&ddi);
>>   out:
>>   	dev->is_probed = 0;
>>   	cpu_hotplug_enable();
>>


