Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C93D0EE0A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 16:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=60dAgbfAKLlq2/w22BlWIRXR2dMC8m4WEnzUlnhaXuA=; b=lltsHOhfnfKqdigr5KgAKLEM8p
	Kah4crUkOVmVRSpl1JTizM9gHB9uLh1GB3eiZvYFTqPO2MbDroeiZKgohfCWM/XAqGcnSl/S2vtZY
	+cywrodS2Zq+Bwa8IO54EILkT3nvxRk3WAEQZCNqOoH3qWmxI8twa3aGzOkh4SfYlTWxjuPLqMD7d
	pmArBa6aX5nq15xwbRWDqBKSsV8mzfcwRoZGSmnx4CG2jmB4H4UxYcrfrkBq7yNZ2TWEBgewelUbG
	j/yfL5HWUWm58Qp6vBvgl4lTWXqmch9XyaMyxNH77w8ep0ksZxl+Zi1YXamxjvonI/OQUXuId/Oj9
	IhgHOItw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNwFL-0000000DcRA-33mP;
	Tue, 25 Nov 2025 16:50:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNwFJ-0000000DcQl-0OJh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 16:50:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 069A0168F;
	Tue, 25 Nov 2025 08:50:18 -0800 (PST)
Received: from [10.1.39.33] (unknown [10.1.39.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D21C03F6A8;
	Tue, 25 Nov 2025 08:50:23 -0800 (PST)
Message-ID: <f78cf081-c4c4-43d9-90a1-e32eecb9e889@arm.com>
Date: Tue, 25 Nov 2025 16:50:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] cpuidle: Warn instead of bailing out if target
 residency check fails
To: "Rafael J. Wysocki" <rafael@kernel.org>, Val Packett <val@packett.cool>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251121010756.6687-1-val@packett.cool>
 <CAJZ5v0h1VTozCKweKvma3dQiUCz8KkR88Hue1cL_jDaKiP+BEw@mail.gmail.com>
 <2808566.mvXUDI8C0e@rafael.j.wysocki>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <2808566.mvXUDI8C0e@rafael.j.wysocki>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_085029_245625_CD51CA4E 
X-CRM114-Status: GOOD (  35.06  )
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

On 11/25/25 16:23, Rafael J. Wysocki wrote:
> On Friday, November 21, 2025 2:10:57 PM CET Rafael J. Wysocki wrote:
>> On Fri, Nov 21, 2025 at 2:08 AM Val Packett <val@packett.cool> wrote:
>>>
>>> On Device Tree platforms, the latency and target residency values come
>>> directly from device trees, which are numerous and weren't all written
>>> with cpuidle invariants in mind. For example, qcom/hamoa.dtsi currently
>>> trips this check: exit latency 680000 > residency 600000.
>>
>> So this breaks cpuidle expectations and it doesn't work correctly on
>> the affected platforms.
>>
>>> Instead of harshly rejecting the entire cpuidle driver with a mysterious
>>> error message, print a warning and set the target residency value to be
>>> equal to the exit latency.
>>
>> This generally doesn't work because the new target residency may be
>> greater than the target residency of the next state.
>>
>>> Fixes: 76934e495cdc ("cpuidle: Add sanity check for exit latency and target residency")
>>> Signed-off-by: Val Packett <val@packett.cool>
>>> ---
>>>  drivers/cpuidle/driver.c | 7 +++++--
>>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/cpuidle/driver.c b/drivers/cpuidle/driver.c
>>> index 1c295a93d582..06aeb59c1017 100644
>>> --- a/drivers/cpuidle/driver.c
>>> +++ b/drivers/cpuidle/driver.c
>>> @@ -199,8 +199,11 @@ static int __cpuidle_driver_init(struct cpuidle_driver *drv)
>>>                  * exceed its target residency which is assumed in cpuidle in
>>>                  * multiple places.
>>>                  */
>>> -               if (s->exit_latency_ns > s->target_residency_ns)
>>> -                       return -EINVAL;
>>> +               if (s->exit_latency_ns > s->target_residency_ns) {
>>> +                       pr_warn("cpuidle: state %d: exit latency %lld > residency %lld (fixing)\n",
>>> +                               i, s->exit_latency_ns, s->target_residency_ns);
>>> +                       s->target_residency_ns = s->exit_latency_ns;
>>
>> And you also need to update s->target_residency.
>>
>> Moreover, that needs to be done when all of the target residency and
>> exit latency values have been computed and full sanitization of all
>> the states would need to be done (including the ordering checks), but
>> the kernel has insufficient information to do that (for instance, if
>> the ordering is not as expected, it is not clear how to fix it up).
>> Even the above sanitization is unlikely to result in the intended
>> behavior.
>>
>> So if returning the error code doesn't work, printing a warning is as
>> much as can be done, like in the attached patch.
>>
>> If this works for you, I'll submit it properly later.
>>
> 
> No response, so I assume no objections.
> 
> ---
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> It turns out that the change in commit 76934e495cdc ("cpuidle: Add
> sanity check for exit latency and target residency") goes too far
> because there are systems in the field on which the check introduced
> by that commit does not pass.
> 
> For this reason, change __cpuidle_driver_init() return type back to void
> and make it print a warning when the check mentioned above does not
> pass.
> 
> Fixes: 76934e495cdc ("cpuidle: Add sanity check for exit latency and target residency")
> Reported-by: Val Packett <val@packett.cool>
> Closes: https://lore.kernel.org/linux-pm/20251121010756.6687-1-val@packett.cool/
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  drivers/cpuidle/driver.c |   18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> --- a/drivers/cpuidle/driver.c
> +++ b/drivers/cpuidle/driver.c
> @@ -8,6 +8,8 @@
>   * This code is licenced under the GPL.
>   */
>  
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
>  #include <linux/mutex.h>
>  #include <linux/module.h>
>  #include <linux/sched.h>
> @@ -152,7 +154,7 @@ static void cpuidle_setup_broadcast_time
>   * __cpuidle_driver_init - initialize the driver's internal data
>   * @drv: a valid pointer to a struct cpuidle_driver
>   */
> -static int __cpuidle_driver_init(struct cpuidle_driver *drv)
> +static void __cpuidle_driver_init(struct cpuidle_driver *drv)
>  {
>  	int i;
>  
> @@ -195,15 +197,13 @@ static int __cpuidle_driver_init(struct
>  			s->exit_latency = div_u64(s->exit_latency_ns, NSEC_PER_USEC);
>  
>  		/*
> -		 * Ensure that the exit latency of a CPU idle state does not
> -		 * exceed its target residency which is assumed in cpuidle in
> -		 * multiple places.
> +		 * Warn if the exit latency of a CPU idle state exceeds its
> +		 * target residency which is assumed to never happen in cpuidle
> +		 * in multiple places.
>  		 */
>  		if (s->exit_latency_ns > s->target_residency_ns)
> -			return -EINVAL;
> +			pr_warn("Idle state %d target residency too low\n", i);
>  	}
> -
> -	return 0;
>  }
>  
>  /**
> @@ -233,9 +233,7 @@ static int __cpuidle_register_driver(str
>  	if (cpuidle_disabled())
>  		return -ENODEV;
>  
> -	ret = __cpuidle_driver_init(drv);
> -	if (ret)
> -		return ret;
> +	__cpuidle_driver_init(drv);
>  
>  	ret = __cpuidle_set_driver(drv);
>  	if (ret)
> 

FWIW I also prefer this to a weird fixing-up-states logic that we would never test!
Reviewed-by: Christian Loehle <christian.loehle@arm.com>

