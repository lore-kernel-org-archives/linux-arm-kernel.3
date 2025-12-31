Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AF2EE57D7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 15:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QzVSYweQj11hd6fs/gbMsc1XDMFllelUQ/hmQuDpYw=; b=KRpULe+hH7docxDUg8e70MfX4e
	A4i2zj1Q9XAPVCitR615F7ZCa+z1ow9wSzfPCPyksUumyZFRxoRQx01AtXSidn73dCobL5awWPfUh
	T6oMAYi1AZkqma+2BV4PNEjLOCjEVw6ZpjYCQW8B3AEvi1Y2SB7rUkV/1AwWuLJbCllXedrmoB+33
	EpyH8aEuAjyvQTL9eHJL6UoDoYQxxckcEUpPnof2z02J2M9RMUdrrEDILGcWO1cBMARiszVstRUDj
	eOZXOkp+W0O3vdN8O9x167azvsKanKSRX9OQB13jJHkXsUeZAZ/HjXReHLNDmgJVYjzKazVhoJbZv
	otUzSKnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vay9v-000000065Ln-0Tt7;
	Wed, 31 Dec 2025 15:30:47 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vay9r-000000065LG-3vmb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 15:30:45 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7c75b829eb6so6911666a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 07:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1767195042; x=1767799842; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7QzVSYweQj11hd6fs/gbMsc1XDMFllelUQ/hmQuDpYw=;
        b=A/BPz229lblMeneb0Ua+JlRfoY1PVhmnpcOtGr/hv4kwNiGbMur60Gump93AGkHeMe
         G/LTFioMtrvyLGHHFAraW0urUgtdjKmS6uJ1k0Bfjpy+EuXYBsvrO9+aIZOQNy5ela2Y
         MhO8nh6U8BgTWvusPbYhnEb3GYm4u1lWR5bf1F/TCq1NZsOnCZlzMeRbnZwR3maTQr5O
         vXepyq6BNVT9LVFfwc1sR6hKs4lHdBrqhvuc+hVhf+4wMVvJqNjzhEm0/kDMxe/1KEuF
         uISTzwAb4LCpzdMo5uWnEXCGnEcWpF10XxaSxv55XQ7n980F8cTIp2YSRgt2erVSbwc/
         nw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767195042; x=1767799842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7QzVSYweQj11hd6fs/gbMsc1XDMFllelUQ/hmQuDpYw=;
        b=mfT87QDUocK4DrCx2UO5QPIZfM5UEi/5Gyrpz9gQ4Th6hbBz1zvbp7ajWwQxjRWEmz
         w/IIKaI35496CI45dRgBWqAn4w8VfQ/vbH0fpecbS25F2ZEsGGDda+adWujyEKhBPqY7
         +hSIz+Gj5OoWNsT3cPMCOkMOIoiOnmxQSvT1bQL6t3VZHmD+D+VcbLJsVQHGpMln4kin
         +Kp7dsVIlChV/v4YOYeWvhgZplGenvVMkJRD1LoqEvza8M3g1EQWs41SPshtzNf5QxTT
         +hW5l3VHrEXkE0nfOSCcx1zGyEveklNf7SJTMP8HwyL2gfwOnHHzbwiTY+SF9UoxlNog
         4p9A==
X-Forwarded-Encrypted: i=1; AJvYcCWlC4ixKUwuxyt7nF/XnADa2c+xGCCJDpQKSzs6lCz1Rd72KuelqXLDdZ/z89+Hrm5Acu2GqRqipe2mnFqMkpJX@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0c20LjxNYC/8zD91JJ3mNjMr2BQq3ef/MKlTqebI9BR9pAgaA
	SVX1GjZabE8Akz1h4L/K5TO6oWjaXQMjX7a/IRccQK8JkrysJsJWNT2Q8X5ixvkSn3s=
X-Gm-Gg: AY/fxX51yNBbNxQu/wE6MarWADo9hgSzjh7bb6HcP5twsnXFkaSbjJnS7UdQbcGEu+2
	eqX0vNl0o3Uc6mFnlVbG6x/w6OQJ4D28y5c4UxhECxMrBI1e0133B3skFVuOLEYDAzGHh/IXJA7
	VsFj5QapUdJDnc4WFf7UsKDRe0gQNhbgu6h24Mr+odxOAwjxSdT73eEVhX0415K8EoxDhcQAacF
	rH9WdMJlLel4Zmu/zamnCdpFM2FyOxg1WyHZvEjn0HZNUzCej3Qjhtf1kDxOPvSEP8OBV3Mzw46
	QzO7H/Ifz3wnl5cs84ko8dMQz7ElWe9hky1HuRb0utmOqLfhBDtSPHmiX8NgXWjBAYo44L92Nhw
	nwUrYmIcBwwc9tVmnyqFlh8vHOfY77W2MVSDTpvR0rhUirXYLRM417/ZeR7zhJ6y6OaN1WxPWhO
	9rnu+mnKys
X-Google-Smtp-Source: AGHT+IFQ7Da3Vy7sb0sZ+gCFV6iNdLzjxsj+GHoPQqPF4ECDqs6GBYGgCjzmLYkOn7cGzscuabT/Ag==
X-Received: by 2002:a4a:e252:0:b0:659:9a49:8fcc with SMTP id 006d021491bc7-65d0ebdd6e8mr11816060eaf.69.1767195042368;
        Wed, 31 Dec 2025 07:30:42 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65d0f4cd66csm20954575eaf.7.2025.12.31.07.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 07:30:41 -0800 (PST)
Message-ID: <4156bbde-754b-470e-9dfb-a1e45bee81fb@kernel.dk>
Date: Wed, 31 Dec 2025 08:30:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/33] block: Protect against concurrent isolated cpuset
 change
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Chen Ridong <chenridong@huawei.com>, Danilo Krummrich <dakr@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Gabriele Monaco <gmonaco@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
 Paolo Abeni <pabeni@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Phil Auld <pauld@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Simon Horman <horms@kernel.org>,
 Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
 Will Deacon <will@kernel.org>, cgroups@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org, netdev@vger.kernel.org
References: <20251224134520.33231-1-frederic@kernel.org>
 <20251224134520.33231-10-frederic@kernel.org>
 <0f65c4fe-8b10-403d-b5b6-ed33fc4eb69c@kernel.dk>
 <aVUs-mFYCO2qGmqT@localhost.localdomain>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <aVUs-mFYCO2qGmqT@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_073043_992784_2C7D05B4 
X-CRM114-Status: GOOD (  19.11  )
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

On 12/31/25 7:02 AM, Frederic Weisbecker wrote:
> Le Mon, Dec 29, 2025 at 05:37:29PM -0700, Jens Axboe a ?crit :
>> On 12/24/25 6:44 AM, Frederic Weisbecker wrote:
>>> The block subsystem prevents running the workqueue to isolated CPUs,
>>> including those defined by cpuset isolated partitions. Since
>>> HK_TYPE_DOMAIN will soon contain both and be subject to runtime
>>> modifications, synchronize against housekeeping using the relevant lock.
>>>
>>> For full support of cpuset changes, the block subsystem may need to
>>> propagate changes to isolated cpumask through the workqueue in the
>>> future.
>>>
>>> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
>>> ---
>>>  block/blk-mq.c | 6 +++++-
>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/block/blk-mq.c b/block/blk-mq.c
>>> index 1978eef95dca..0037af1216f3 100644
>>> --- a/block/blk-mq.c
>>> +++ b/block/blk-mq.c
>>> @@ -4257,12 +4257,16 @@ static void blk_mq_map_swqueue(struct request_queue *q)
>>>  
>>>  		/*
>>>  		 * Rule out isolated CPUs from hctx->cpumask to avoid
>>> -		 * running block kworker on isolated CPUs
>>> +		 * running block kworker on isolated CPUs.
>>> +		 * FIXME: cpuset should propagate further changes to isolated CPUs
>>> +		 * here.
>>>  		 */
>>> +		rcu_read_lock();
>>>  		for_each_cpu(cpu, hctx->cpumask) {
>>>  			if (cpu_is_isolated(cpu))
>>>  				cpumask_clear_cpu(cpu, hctx->cpumask);
>>>  		}
>>> +		rcu_read_unlock();
>>
>> Want me to just take this one separately and get it out of your hair?
>> Doesn't seem to have any dependencies.
> 
> The patch could be applied alone but the rest of the patchset needs it,
> otherwise it may dereference freed memory. So I fear it needs to stay
> within the lot.
> 
> I appreciate the offer though. But an ack would help, even if I must admit
> this single patch (which doesn't change current behaviour) leaves a
> bitter taste because complete handling of cpuset isolated partition change
> will require more work.

That's fine too:

Acked-by: Jens Axboe <axboe@kernel.dk>

> Speaking of, is there a way that I missed to define/overwrite the above
> hctx->cpumask on runtime?

Only spot where it's set/manipulated right now is as part of setting up
the hctx <-> ctx queue mappings, when the queue is configured (or
reconfigured).

-- 
Jens Axboe

