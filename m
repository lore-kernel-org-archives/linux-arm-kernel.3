Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6F4C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jM/+uArTKgpdGhUTPlg4cPmPaBK1j/KlvkGVBLZ83tA=; b=2mY6ANyxf0XhpAcHMjdDtlzqka
	Qfi+2lpGtu0hQ5Zv2+H4bekGAVOjk4g5wo6xWYPgPmHneBYHhhDAiHbZVqevCIkYt36lKPBVr0YzH
	uL1HUbmnYx1HhOOzsdRTpznajbxdCLsrm7gwxWnj6Fh4fekrI2etE+VJreNSp9t5m2sRoD5U1r1jH
	8r8CFl8m5JOOdZZfjcSIV3uQmrlM7ZcEBA+Q338Dxu6TB94zOAWBZR+/sorLE+pn6NoJIDl/du5YZ
	Kp92WFyEvvt2yZwEDe2vBVuoGnLvMJedp3q5Ev6dm5WWs2CMS0ESiM02CesNT9xtp5Xu09INncKtr
	nEAyFPJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cWq-00000007Owr-0kGY;
	Mon, 07 Sep 2026 16:49:08 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cWn-00000007Ow1-19jG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:49:06 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687E1akT281370;
	Mon, 7 Sep 2026 16:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=jM/+uA
	rTKgpdGhUTPlg4cPmPaBK1j/KlvkGVBLZ83tA=; b=hVne2bbrBy/ZNfPuEJe9Dz
	cG53AnJMoxQqDUUVP0TRST/49VyUTB+OqQPjbIZydquLyoY+hg8T+mWZRMjDC5zM
	VzJ/OFBs9LKA1mrJshK3c5NRuVW+UK5iu73yZ/8YPlzQSpWNDm42nO+3WBSezccO
	LjcThWvdLFmtTwauZGYAWnNgEA/SlWOc328ICP1STenoiM12IECuxKxdaoxvnla4
	qRlmVaPdcIeKj91aNtdJ9DsEo/cEKLk8JFXtbQIqOtOFLh7Zs5nsZ6/o661jgKfn
	7SnbmV0NfSRM134xhnPihXOYdqA8dEStDfMH7vK/AhzJE+TxQoSKW6s7JH7Yyn5A
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ggbqjstyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Sep 2026 16:48:34 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 687GfFdX015395;
	Mon, 7 Sep 2026 16:48:33 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ggwdq74v0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Sep 2026 16:48:33 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 687GmVfS49414522
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Sep 2026 16:48:31 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3023920043;
	Mon,  7 Sep 2026 16:48:31 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BDA4520040;
	Mon,  7 Sep 2026 16:48:26 +0000 (GMT)
Received: from [9.39.28.108] (unknown [9.39.28.108])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Sep 2026 16:48:26 +0000 (GMT)
Message-ID: <d75f3181-868b-442d-9f2a-b979af0833d4@linux.ibm.com>
Date: Mon, 7 Sep 2026 22:18:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] sched/fair: Honor asymmetric SMT priority in idle
 selection
To: K Prateek Nayak <kprateek.nayak@amd.com>,
        Andrea Righi
 <arighi@nvidia.com>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Christian Loehle <christian.loehle@arm.com>,
        Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Srikar Dronamraju <srikar@linux.ibm.com>
References: <20260904091838.3617894-1-arighi@nvidia.com>
 <20260904091838.3617894-3-arighi@nvidia.com>
 <ff6763c9-f279-47d2-a279-58c54ab37ee6@amd.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <ff6763c9-f279-47d2-a279-58c54ab37ee6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: Ig_bLfcZP3b0rvEnBBy7_fx1pyx9IDfU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE4MyBTYWx0ZWRfX8Qxx9fldxEgX
 hlzGybwluK6NJlSO5lsojvR45ECneV3h9jKKuJlgfR8vjdUK3X+ZK7QChUBM30+z1s4wpREsMFu
 bM3Y2izCOM3QPILcq1k7GYq1E/GaFes=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE4MyBTYWx0ZWRfX0Hx25IFASrSq
 HXDyaXtGQPLNDtIoDk2a22Fv9YOZL3L1km8Vh6MXBvXDyY97Pl92/qH982u5L79y9/u1fQeuqot
 qfaUWwUd7NUldZCYswsIgvHgf8ygNtNNyib9UI3ELokI2UD68GQLBmpGqZGzAO6FRDzNI4ZdSRe
 ebD++WZpmmnd0cu2TxrEWglo0cfSKMV6TUpzpr6pC+WzOgl/tYZWSZuND+Xdoyw7qhlnkeb7Pf6
 Cx+NTjZIoXAQAI32v3RgxiOUaX9BVdKnmNAxHg4O/OoCLEypVJThA2c5vMr6zOis6EVSmUM34FB
 7B6zgT6rRJjV5WijhHPK81U8l1e0qYv4/AhN9reM/i1HIGltnxvYYcIKnm+FJq2Ubp6rA0Azg6X
 y9XWFkQQdT+k4Kw5Qb791AhgGPxF+xRgmpMbRWAgEy/OdoEXdoZ+NcnaQo02iGack+Yn6JmsHYu
 /dzTz43fl0C5KTjAN7g==
X-Authority-Analysis: v=2.4 cv=JaKMa0KV c=1 sm=1 tr=0 ts=6a9eeae2 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=ymv76A7DTVYo3Bxe0W4A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: p6wm1HcT5W1KB4yP91ykiofNbMmWrqgu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_094905_338231_E6CC1A35 
X-CRM114-Status: GOOD (  37.09  )
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



On 9/7/26 9:27 AM, K Prateek Nayak wrote:
> Hello Andrea,
> 
> On 9/4/2026 2:48 PM, Andrea Righi wrote:
>> +/*
>> + * Return true when @cpu has a higher asymmetric-packing priority than
>> + * @other in their shared SMT scheduling domain.
>> + */
>> +static bool sched_smt_asym_prefer(int cpu, int other)
>> +{
>> +	struct sched_domain *sd = rcu_dereference_all(cpu_rq(cpu)->sd);
>> +
>> +	if (!sd)
>> +		return false;
>> +
>> +	if (!(sd->flags & SD_SHARE_CPUCAPACITY) ||
>> +	    !(sd->flags & SD_ASYM_PACKING))
>> +		return false;
>> +
>> +	if (!cpumask_test_cpu(other, sched_domain_span(sd)))
>> +		return false;
>> +
>> +	return sched_asym_prefer(cpu, other);
>> +}
>> +
>> +/*
>> + * Return the highest-priority available CPU in @cpu's SMT core that is also in @cpus.
>> + */
>> +static int __select_idle_smt_cpu(struct task_struct *p, int cpu, const struct cpumask *cpus)
>> +{
>> +	int best = cpu;
>> +	int sibling;
>> +
>> +	for_each_cpu_and(sibling, cpu_smt_mask(cpu), cpus) {
>> +		if (sibling == best || !choose_idle_cpu(sibling, p))
>> +			continue;
>> +
>> +		if (sched_smt_asym_prefer(sibling, best))
>> +			best = sibling;
> 
> nit. Since sched_smt_asym_prefer() is only used here, and we know rq->sd
> is the one that can have SD_SHARE_CPUCAPACITY | SD_ASYM_PACKING, perhaps
> you can inline the check here do a:
> 
>      sd = rcu_dereference_all(cpu_rq(cpu)->sd);
> 
>      if (!sd)
>           return cpu;
> 
>     if (!(sd->flags & SD_SHARE_CPUCAPACITY) || !(sd->flags & SD_ASYM_PACKING))
>         return cpu;
> 
>     for_each_cpu_and (sibling, sched_domain_span(sd), cpus) {
>         ...
>     }
> 
>    ...
> 
> 
> That way, you don't need to dereference cpu_rq(cpu)->sd every time in
> sched_smt_asym_prefer() and check cpumask_test_cpu(). Both, domain
> span and task affinity will be covered at once.
> 
> Thoughts?
> 
>> +	}
>> +
>> +	return best;
>> +}
>> +
>> +static inline int
>> +select_idle_smt_cpu(struct task_struct *p, int cpu, const struct cpumask *cpus)
>> +{
>> +	if (!sched_smt_asym_active())
>> +		return cpu;
>> +
>> +	return __select_idle_smt_cpu(p, cpu, cpus);
>> +}
>> +
>> +/*
>> + * Redirect an available SMT CPU to a higher-priority available sibling allowed by task affinity.
>> + */
>> +static inline int select_idle_smt_priority(struct task_struct *p, int cpu)
>> +{
>> +	return select_idle_smt_cpu(p, cpu, p->cpus_ptr);
>> +}
>> +
>>   /*
>>    * Scans the local SMT mask to see if the entire core is idle, and records this
>>    * information in sd_balance_shared->has_idle_cores.
>> @@ -8645,7 +8702,7 @@ static int select_idle_core(struct task_struct *p, int core, struct cpumask *cpu
>>   	}
>>   
>>   	if (idle)
>> -		return core;
>> +		return select_idle_smt_cpu(p, core, cpus);
>>   
>>   	cpumask_andnot(cpus, cpus, cpu_smt_mask(core));
>>   	return -1;
>> @@ -8668,7 +8725,7 @@ static int select_idle_smt(struct task_struct *p, struct sched_domain *sd, int t
>>   		if (!cpumask_test_cpu(cpu, sched_domain_span(sd)))
>>   			continue;
>>   		if (choose_idle_cpu(cpu, p))
>> -			return cpu;
>> +			return select_idle_smt_priority(p, cpu);
>>   	}
>>   
>>   	return -1;
>> @@ -8720,7 +8777,7 @@ static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool
>>   						return -1;
>>   					idle_cpu = __select_idle_cpu(cpu, p);
>>   					if ((unsigned int)idle_cpu < nr_cpumask_bits)
>> -						return idle_cpu;
>> +						return select_idle_smt_priority(p, idle_cpu);
> 
> Question for Shrikanth: On larger SMT (SMT-4, SMT-8), does the ranking
> make that big of a difference if the core is already busy?
> 

Only on Power7 we had AYSM PACKING.
There IPC of CPU0 > CPU1 > CPU2 > CPU4 for the four siblings IIRC irrespective of busy
or idle.

PS: I haven't seen the patches in detail yet.

> Does the overehead of additional search get offset by the benefit of
> being placed on a better ranked thread? If not, maybe the paths for
> !has_idle_core can stay as is?
> 
>>   				}
>>   			}
>>   			cpumask_andnot(cpus, cpus, sched_group_span(sg));
>> @@ -8745,7 +8802,8 @@ static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool
>>   	if (has_idle_core)
>>   		set_idle_cores(target, false);
>>   
>> -	return idle_cpu;
>> +	return (unsigned int)idle_cpu < nr_cpumask_bits ?
>> +		select_idle_smt_priority(p, idle_cpu) : idle_cpu;
> 
> Since every path does a select_idle_smt_priority() - be it coming from
> select_idle_core(), the early-return from the cluster scan, or just an
> idle CPU from the LLc scan, can't we simply just do it once in
> select_idle_sibling()?
> 
> Something like:
> 
>    (Only build tested)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index f79fcba4afec..7c97585141dd 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8964,7 +8964,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>   
>   	if (choose_idle_cpu(target, p) &&
>   	    asym_fits_cpu(task_util, util_min, util_max, target))
> -		return target;
> +		goto out;
>   
>   	/*
>   	 * If the previous CPU is cache affine and idle, don't be stupid:
> @@ -8974,8 +8974,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>   	    asym_fits_cpu(task_util, util_min, util_max, prev)) {
>   
>   		if (!static_branch_unlikely(&sched_cluster_active) ||
> -		    cpus_share_resources(prev, target))
> -			return prev;
> +		    cpus_share_resources(prev, target)) {
> +			target = prev;
> +			goto out;
> +		}
>   
>   		prev_aff = prev;
>   	}
> @@ -8993,7 +8995,8 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>   	    prev == smp_processor_id() &&
>   	    this_rq()->nr_running <= 1 &&
>   	    asym_fits_cpu(task_util, util_min, util_max, prev)) {
> -		return prev;
> +		target = prev;
> +		goto out;
>   	}
>   
>   	/* Check a recently used CPU as a potential idle candidate: */
> @@ -9007,8 +9010,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>   	    asym_fits_cpu(task_util, util_min, util_max, recent_used_cpu)) {
>   
>   		if (!static_branch_unlikely(&sched_cluster_active) ||
> -		    cpus_share_resources(recent_used_cpu, target))
> -			return recent_used_cpu;
> +		    cpus_share_resources(recent_used_cpu, target)) {
> +			target = recent_used_cpu;
> +			goto out;
> +		}
>   
>   	} else {
>   		recent_used_cpu = -1;
> @@ -9030,7 +9035,8 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>   		 */
>   		if (sd) {
>   			i = select_idle_capacity(p, sd, target);
> -			return ((unsigned)i < nr_cpumask_bits) ? i : target;
> +			target = ((unsigned)i < nr_cpumask_bits) ? i : target;
> +			goto out;
>   		}
>   	}
>   
> @@ -9043,27 +9049,31 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>   
>   		if (!has_idle_core && cpus_share_cache(prev, target)) {
>   			i = select_idle_smt(p, sd, prev);
> -			if ((unsigned int)i < nr_cpumask_bits)
> -				return i;
> +			if ((unsigned int)i < nr_cpumask_bits) {
> +				target = i;
> +				goto out;
> +			}
>   		}
>   	}
>   
>   	i = select_idle_cpu(p, sd, has_idle_core, target);
>   	if ((unsigned)i < nr_cpumask_bits)
> -		return i;
> -
> +		target = i;
>   	/*
>   	 * For cluster machines which have lower sharing cache like L2 or
>   	 * LLC Tag, we tend to find an idle CPU in the target's cluster
>   	 * first. But prev_cpu or recent_used_cpu may also be a good candidate,
>   	 * use them if possible when no idle CPU found in select_idle_cpu().
>   	 */
> -	if ((unsigned int)prev_aff < nr_cpumask_bits)
> -		return prev_aff;
> -	if ((unsigned int)recent_used_cpu < nr_cpumask_bits)
> -		return recent_used_cpu;
> +	else if ((unsigned int)prev_aff < nr_cpumask_bits)
> +		target = prev_aff;
> +	else if ((unsigned int)recent_used_cpu < nr_cpumask_bits)
> +		target = recent_used_cpu;
> +out:
> +	if (!sched_smt_asym_active())
> +		return target;
>   
> -	return target;
> +	return select_idle_smt_priority(p, target);
>   }
>   
>   /**
> ---
> 
> That way, it lives in a single place, and we don't have to pepper
> select_idle_smt_priority() everywhere. Thoughts?
> 


