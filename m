Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3284CA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 13:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDgr6XrfEk+tHBIit6qYaX89Ra33y3srxMrizd6STSg=; b=uFaC48QRqxO5mbbqqL9Ud7S6fi
	VLx/i5jo0jgAHVA5F88G1F3H88/vf4IyvLSAhVN8YF5S73pDhiNdUjNFcLfFJPFAdayAjnEU9VM6Z
	h9vdwgwXLYvteFuOo8A9E/cdEUOKdXEALPGMhL4xZacw/Li03IjPSoCbynkplzzeigF+iZRuqpDXs
	jpPivXw1SyoDUfIV6cOzBjCUNO9kSviDB+Usb0Diw/SezMhSpUIm8jtG9UyzFTFED+Pm5JGfVt4Oy
	9GZGux/GkF1GC6BYaApJGLs93wdKwsYCtu+NHcEo38yzKrAJO5j4NxfZAljgFWkZ3L0LuFV6mJ59j
	YN7/vv5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDMgr-0000000EsNk-3X6u;
	Sun, 04 Oct 2026 13:55:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDMgo-0000000EsNG-3RRX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 13:55:44 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 694BP1KH2638230
	for <linux-arm-kernel@lists.infradead.org>; Sun, 4 Oct 2026 13:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bDgr6XrfEk+tHBIit6qYaX89Ra33y3srxMrizd6STSg=; b=He5WOmT2Pt/TnK7Q
	uMbWKDihEcLm77n2XR/ri2+uLSJc+ECngldGo1nytdO33piAYoxfq5VrzjhemLgj
	1OqBMrsKDCT8bA3kIYJRQouo9Jxj8KnnEUBVsC0I4/bNmE/m8xLBuBqkW7XGP9tA
	YgmyOlY9ISzKFk3u2iCYBhavffTnCmTPLbeE0P9eM2/KDkAxbxwhbe+jfFa202we
	5nGT20vIxuQToV6Btuzy1o1W6jGIMy7D5gQpGyo3DSmJSF0RCIfd8M4NgXuYP9Ns
	NaTIWLhbNXcYE59PG8dihBMKlqoKaqquWL+k/gCjnYvwsMB6F4GFOb1IakJUOuvY
	TLY7Kw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssu34vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 13:55:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7d2ff0087so610729a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 06:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791122139; x=1791726939; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bDgr6XrfEk+tHBIit6qYaX89Ra33y3srxMrizd6STSg=;
        b=ANhuc15Xecv8AbRdZX02dpEKFOUR2+KS2DRSU+EF9pf1NT/eeuMM4o/kXnHSXw7Eww
         S4migICYNv3n9L590fhJZHV8GXSt+WzJ8WBgDHt1UniTwqO/pwc3Vqk08ze3BGM0KOU/
         rIW70FeuJh5afHmQvO+NloBqu2J+34t0ilVcZTLgW6xHZsfS1Zj+wwTCb+KZRUlnXPuD
         wyg0ARi8f0TaaaYE7SBZkRYxC9StdtMoLPcSlNUfrxHbYjjXWyiUwOYcP2bYzaXMtLeQ
         n9muDQULyhpEx5FvTvaRnMmFmUIN0uq1/P8hy+CNtDa2MIcUxcif8fbdD12T341jn2yH
         wPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791122139; x=1791726939;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bDgr6XrfEk+tHBIit6qYaX89Ra33y3srxMrizd6STSg=;
        b=b3SI7tKJ2bwPkE3v9T+XO33XLl/z2JPBiHKcE8o3Baw+wjtqN+NP7Y4Z8r2A3J8A3r
         KNECMVBsARA1GpdGigQQ0Z3A/BfUjF4uLJKKQbW9XrqSAYWjUYS2Eabbm6LMsleWA6u8
         ER/qCQATfsvoqfFrLS/OoTyq1sWwF0SfgOM1EC54Hd5KPdeiQKv0qNCVI3dstk2J15U3
         6tUvFD4vh+B/WoN2/QSOKjYxfzNdivNsUQwk+rsnt4Hn6WyUE8U0RAAPU/IgghbGh/QO
         6i0H6BtkX7ULIfwuCW5vZj5SvXmrSZ3QnsIaR+uYtqJTRfo5V83xbnOBDaYUBBIvf3TL
         7atw==
X-Forwarded-Encrypted: i=1; AKwUvBygJ3M/wm/djrTlbncfd2JztKzjei/Andr2IyE5K/NPvB9481heYQPCztrosMGXfnw47Iu6ecC3opZzi5hmW2Xg@lists.infradead.org
X-Gm-Message-State: AFq9FYKNoYTKTuymtdff+c4obK2Vh8TteKGBqu15Q4XkYLtw3XNJXWfL
	ZehXrK4tHdW/q3vdCFmxrWVfT7xFRUUJFmIgOe6UzW4q5vRaoU4iofngDMaZw3MzkdtLcG2fWir
	7vP0TJn2HcjniQKwVFWhkOBkLD0w0RVfVJFl3ZTgcyq6pff+sh7wDhDX13Xaxbzazga6V9jxds/
	wC3w==
X-Gm-Gg: AYBFou0pp1etIYIA1Y89GiIWKSd3MVu+XyzF8zvRAvHveJdRFafPzkuiZ4aXSOXn5c3
	UirwZlcrcOMvDVBkdpi4ypdeqY8NYTjB+r0Pc3av+27Z4p+zQFprom51II2BmTi7tyn5j7PAhRf
	wyIbCnvt+JoGCQuojrtvf8ugIIDMkDEkQ2dzaBfHWj1zKEL5RNkwJ0Grcos1yhhFTAZ3xgI2Ju6
	lQYe0vd03rWPg+u2FBrKv+FuGSZEllRycJ/GPY3AKPJf2OfluAtZcBeJw9Po/BY4/qfdmrRxAIx
	M8ort4bDArtqvpCyUXDi+okqmqudA7/XwXiLGBg/KlspILQ1STx4S0MQ1HKXouTjO/rSBopUeXg
	WwgZ1LNCGCAxIBg6c5tv1LvI65mABjvYLN/ontmIpNuLtgBI8DtI7LJ/pJgkjHKUDCRYYzoU5
X-Received: by 2002:a17:90b:2782:b0:39e:6c69:34d3 with SMTP id 98e67ed59e1d1-3a6ce85582fmr6027704a91.55.1791122138858;
        Sun, 04 Oct 2026 06:55:38 -0700 (PDT)
X-Received: by 2002:a17:90b:2782:b0:39e:6c69:34d3 with SMTP id 98e67ed59e1d1-3a6ce85582fmr6027688a91.55.1791122138284;
        Sun, 04 Oct 2026 06:55:38 -0700 (PDT)
Received: from [10.133.33.211] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dcbdd97fsm5274335a91.0.2026.10.04.06.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 06:55:36 -0700 (PDT)
Message-ID: <c6948769-1050-4211-b93c-b72f51c32dd4@oss.qualcomm.com>
Date: Sun, 4 Oct 2026 21:55:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] cpufreq: CPPC: Resolve frequencies to performance
 levels
To: Christian Loehle <christian.loehle@arm.com>, rafael@kernel.org
Cc: zhenglifeng1@huawei.com, viresh.kumar@linaro.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        Mario Limonciello <mario.limonciello@amd.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        Huang Rui <ray.huang@amd.com>, Perry Yuan <perry.yuan@amd.com>,
        "Gautham R . Shenoy"
 <gautham.shenoy@amd.com>,
        Vanshidhar Konda <vanshikonda@os.amperecomputing.com>,
        Shubhang Kaushik <sh@gentwo.org>,
        Pierre Gondois <pierre.gondois@arm.com>,
        Beata Michalska <beata.michalska@arm.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ionela Voinescu <ionela.voinescu@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Jeremy Linton <jeremy.linton@arm.com>,
        Peter Zijlstra
 <peterz@infradead.org>, jonathanh@nvidia.com,
        zhanjie9@hisilicon.com, Vincent Guittot <vincent.guittot@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, zhongqiu.han@oss.qualcomm.com
References: <20260929102957.2591657-1-christian.loehle@arm.com>
 <20260929102957.2591657-3-christian.loehle@arm.com>
 <0a4a28b8-0b26-41df-bd55-c809177a9909@oss.qualcomm.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <0a4a28b8-0b26-41df-bd55-c809177a9909@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA0MDA1NSBTYWx0ZWRfXxK0mkYm5Q0vm
 FIgNOlI2BbDjHNpOVKRny/XlHAeXptGYqcxKpGQKKKW2ZyrwVrrXxAsNr1bFSeMlmT/q68ClWY1
 WkN7HAZ4u+0QeiVs8kJb9BVPUrssfhJ/6QF/pt6CU/VlNycq0XK8gDfrHB8BValqudqfnSMQ3wn
 EaKD1brydzaUD5xvCn+QkENypcZi0G1WzFvOvDKTOuE3tcLZI4Pl9SOcOGBMtO9TSLGmUQTcn6H
 Pcl2f0mpCRNdrd/o0MHDv9y8Nr4ZXgUTgs9HB/HeAGBJgvvOobu/V7yTjdaNp5W3qOHSdvGvNZu
 OVvy7/b3A+V4j397n4uR1Hs8WhV+RwD/Y/AWZXWEdcpTp9OdIXP7BBSUM6BiZPqjaw4aQL/TNOA
 ty2ZGKh5Suo6zJd5OcVES168nc6z3LbH2OZnQLEbRAn/lSTwjYWyXuCj1Sgyyyuc0yaUo8+qBOJ
 etzpSnoEGgnfbh4BBNw==
X-Proofpoint-ORIG-GUID: XJ7QIm_BxZvg9MytqISTq6vbFCEBoDjh
X-Proofpoint-GUID: XJ7QIm_BxZvg9MytqISTq6vbFCEBoDjh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA0MDA1NSBTYWx0ZWRfX0h5CAm8qDJJW
 qLr3h+q9rJz3G1aKp4zj/w9lbeNp7DAaUjL3eLc1sY0yno4fu5+xk8W4xdeaPzrdlXX9H/4NORM
 EmT2RVYAG8LEH3TUjq1lr4Ua6cshSwk=
X-Authority-Analysis: v=2.4 cv=XPSl2ghE c=1 sm=1 tr=0 ts=6ac25adc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=D87R-bVDKfKZu3bz7LUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-04_03,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610040055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_065543_023925_A826EC62 
X-CRM114-Status: GOOD (  24.57  )
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

On 10/2/2026 8:29 PM, Zhongqiu Han wrote:
> Hi Christian,
> 
> 
> On 9/29/2026 6:29 PM, Christian Loehle wrote:
>> Different kHz requests can select the same CPPC performance level.
>> Implement ->resolve_freq() so governors such as schedutil can skip
>> redundant writes.
>>
>> Precompute the affine conversion and invert its integer rounding 
>> directly.
>> Share bounded conversions with ->target() and ->fast_switch(), 
>> choosing the
>> first performance level when several share a kHz value. Recompute limits
>> from each policy snapshot to avoid caching sysfs-shared mutable controls.
>>
>> Cap intervals at or below nominal kHz at Nominal Performance, excluding
>> boosted levels that alias it. Unchanged frequency limits then imply
>> unchanged performance limits across boost toggles.
>>
>> After clamping to CPU limits, snap the limits to supported frequencies.
>> If none lies in the interval, collapse both limits to the highest 
>> supported
>> frequency not above its maximum, as frequency-table verification does.
>>
>> Signed-off-by: Christian Loehle <christian.loehle@arm.com>
>> ---
>>   drivers/cpufreq/cppc_cpufreq.c | 257 ++++++++++++++++++++++++++++++---
>>   1 file changed, 239 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/ 
>> cppc_cpufreq.c
>> index 4ea444ff889e..fa85efb9f701 100644
>> --- a/drivers/cpufreq/cppc_cpufreq.c
>> +++ b/drivers/cpufreq/cppc_cpufreq.c
>> @@ -18,8 +18,10 @@
>>   #include <linux/cpufreq.h>
>>   #include <linux/irq_work.h>
>>   #include <linux/kthread.h>
>> +#include <linux/math64.h>
>>   #include <linux/mutex.h>
>>   #include <linux/time.h>
>> +#include <linux/units.h>
>>   #include <linux/vmalloc.h>
>>   #include <uapi/linux/sched/types.h>
>> @@ -29,6 +31,24 @@
>>   static struct cpufreq_driver cppc_cpufreq_driver;
>> +struct cppc_perf_freq_map {
>> +    s64 offset;
>> +    u64 multiplier;
>> +    u32 divisor;
>> +};
>> +
>> +struct cppc_cpufreq_data {
>> +    struct cppc_cpudata cpu_data;
>> +    struct cppc_perf_freq_map map;
>> +    unsigned int nominal_khz;
>> +};
>> +
>> +static struct cppc_cpufreq_data *
>> +cppc_cpufreq_data(struct cppc_cpudata *cpu_data)
>> +{
>> +    return container_of(cpu_data, struct cppc_cpufreq_data, cpu_data);
>> +}
>> +
>>   #ifdef CONFIG_ACPI_CPPC_CPUFREQ_FIE
>>   static enum {
>>       FIE_UNSET = -1,
>> @@ -302,11 +322,159 @@ static inline void cppc_freq_invariance_exit(void)
>>   }
>>   #endif /* CONFIG_ACPI_CPPC_CPUFREQ_FIE */
>> +/* Precompute the affine mapping used by cppc_perf_to_khz(). */
>> +static void cppc_cpufreq_init_perf_map(struct cppc_perf_caps *caps,
>> +                       struct cppc_perf_freq_map *map)
>> +{
>> +    if (caps->lowest_freq && caps->nominal_freq) {
>> +        if (caps->lowest_freq == caps->nominal_freq) {
>> +            map->multiplier = (u64)caps->nominal_freq * KHZ_PER_MHZ;
> 
> This duplicates the perf<->kHz conversion, but cppc_perf_to_khz() rounds
> its offset at MHz granularity before scaling to kHz while the new map
> scales first, so the two can differ by up to 999 kHz. In current patch
> func cppc_cpufreq_perf_limits() the max_freq operand still derives from
> cpuinfo.max_freq (old conversion) while data->nominal_khz uses the new
> one -- with boost off, could the max_freq <= data->nominal_khz test
> still be relied upon? If it goes false, will policy_max_perf become
> highest_perf and max_perf seems to end up above nominal_perf?

Please ignore this comment. I misread cppc_perf_to_khz(). Sorry about
that.

> 
>> +            map->divisor = caps->nominal_perf;
>> +            map->offset = 0;
>> +        } else {
>> +            map->multiplier = (u64)(caps->nominal_freq -
>> +                       caps->lowest_freq) * KHZ_PER_MHZ;
>> +            map->divisor = caps->nominal_perf - caps->lowest_perf;
>> +            map->offset = (s64)caps->nominal_freq * KHZ_PER_MHZ -
>> +                div64_u64(caps->nominal_perf * map->multiplier,
>> +                      map->divisor);
>> +        }
>> +    } else {
>> +        map->multiplier = cppc_get_dmi_max_khz();
>> +        map->divisor = caps->highest_perf;
>> +        map->offset = 0;
>> +    }
>> +}
>> +
>> +static unsigned int
>> +cppc_cpufreq_perf_to_khz(const struct cppc_perf_freq_map *map, u32 perf)
>> +{
>> +    s64 freq = map->offset + div64_u64(perf * map->multiplier,
>> +                        map->divisor);
>> +
>> +    return freq > 0 ? freq : 0;
>> +}
>> +
>> +/*
>> + * Invert integer-kHz rounding: L finds the first level at or above the
>> + * target frequency, H the last at or below it, within the supplied 
>> bounds.
>> + */
>> +static u32 cppc_cpufreq_perf_for_freq(const struct cppc_perf_freq_map 
>> *map,
>> +                      unsigned int target_freq,
>> +                      u32 min_perf, u32 max_perf,
>> +                      unsigned int relation)
>> +{
>> +    s64 scaled_freq = (s64)target_freq - map->offset;
>> +    u64 perf;
>> +
>> +    switch (relation) {
>> +    case CPUFREQ_RELATION_L:
>> +        if (!target_freq || scaled_freq <= 0)
>> +            perf = 0;
>> +        else
>> +            perf = mul_u64_u64_div_u64_roundup(scaled_freq,
>> +                               map->divisor,
>> +                               map->multiplier);
>> +        break;
>> +
>> +    case CPUFREQ_RELATION_H:
>> +        if (scaled_freq < 0) {
>> +            perf = 0;
>> +        } else {
>> +            perf = mul_u64_u64_div_u64_roundup(scaled_freq + 1,
>> +                               map->divisor,
>> +                               map->multiplier);
>> +            perf--;
>> +        }
>> +        break;
>> +
>> +    default:
>> +        WARN_ON_ONCE(1);
>> +        return min_perf;
>> +    }
>> +
>> +    return clamp_t(u64, perf, min_perf, max_perf);
>> +}
>> +
>> +static void cppc_cpufreq_perf_limits(struct cppc_perf_caps *caps,
>> +                     struct cppc_cpufreq_data *data,
>> +                     unsigned int min_freq,
>> +                     unsigned int max_freq,
>> +                     u32 *min_perf, u32 *max_perf)
>> +{
>> +    u32 policy_max_perf;
>> +
>> +    /* Do not include boosted levels that alias the nominal 
>> frequency. */
>> +    policy_max_perf = max_freq <= data->nominal_khz ?
>> +              caps->nominal_perf : caps->highest_perf;
>> +    *min_perf = cppc_cpufreq_perf_for_freq(&data->map, min_freq,
>> +                           caps->lowest_perf,
>> +                           policy_max_perf,
>> +                           CPUFREQ_RELATION_L);
>> +    *max_perf = cppc_cpufreq_perf_for_freq(&data->map, max_freq,
>> +                           caps->lowest_perf,
>> +                           policy_max_perf,
>> +                           CPUFREQ_RELATION_H);
>> +}
>> +
>> +static unsigned int
>> +cppc_cpufreq_resolve_freq(struct cpufreq_policy *policy,
>> +              unsigned int target_freq,
>> +              unsigned int min_freq,
>> +              unsigned int max_freq,
>> +              unsigned int relation)
>> +{
>> +    struct cppc_cpudata *cpu_data = policy->driver_data;
>> +    struct cppc_perf_caps *caps = &cpu_data->perf_caps;
>> +    struct cppc_cpufreq_data *data = cppc_cpufreq_data(cpu_data);
>> +    const struct cppc_perf_freq_map *map = &data->map;
>> +    u32 min_perf, max_perf, perf;
>> +
>> +    cppc_cpufreq_perf_limits(caps, data, min_freq, max_freq,
>> +                 &min_perf, &max_perf);
>> +    if (WARN_ON_ONCE(min_perf > max_perf))
>> +        return cppc_cpufreq_perf_to_khz(map, max_perf);
>> +
>> +    switch (relation) {
>> +    case CPUFREQ_RELATION_L:
>> +    case CPUFREQ_RELATION_H:
>> +        perf = cppc_cpufreq_perf_for_freq(map, target_freq,
>> +                          min_perf, max_perf, relation);
>> +        break;
>> +    case CPUFREQ_RELATION_C: {
>> +        u32 lower = cppc_cpufreq_perf_for_freq(map, target_freq,
>> +                            min_perf, max_perf,
>> +                            CPUFREQ_RELATION_H);
>> +        u32 upper = cppc_cpufreq_perf_for_freq(map, target_freq,
>> +                            min_perf, max_perf,
>> +                            CPUFREQ_RELATION_L);
>> +        unsigned int lower_freq = cppc_cpufreq_perf_to_khz(map, lower);
>> +        unsigned int upper_freq = cppc_cpufreq_perf_to_khz(map, upper);
>> +
>> +        if (lower_freq >= target_freq)
>> +            perf = lower;
>> +        else if (upper_freq <= target_freq)
>> +            perf = upper;
>> +        else if (target_freq - lower_freq < upper_freq - target_freq)
>> +            perf = lower;
>> +        else
>> +            perf = upper;
>> +        break;
>> +    }
>> +    default:
>> +        WARN_ON_ONCE(1);
>> +        return target_freq;
>> +    }
>> +
>> +    return cppc_cpufreq_perf_to_khz(map, perf);
>> +}
>> +
>>   static void cppc_cpufreq_get_perf_limits(struct cppc_cpudata *cpu_data,
>>                        struct cpufreq_policy *policy,
>>                        u32 *min_perf, u32 *max_perf)
>>   {
>>       struct cppc_perf_caps *caps = &cpu_data->perf_caps;
>> +    struct cppc_cpufreq_data *data = cppc_cpufreq_data(cpu_data);
>>       unsigned int min_freq, max_freq;
>>       u32 min, max;
>> @@ -315,11 +483,11 @@ static void cppc_cpufreq_get_perf_limits(struct 
>> cppc_cpudata *cpu_data,
>>       if (unlikely(min_freq > max_freq))
>>           min_freq = max_freq;
>> -    min = cppc_khz_to_perf(caps, min_freq);
>> -    max = cppc_khz_to_perf(caps, max_freq);
>> +    cppc_cpufreq_perf_limits(caps, data, min_freq, max_freq,
>> +                 &min, &max);
>> -    *min_perf = clamp_t(u32, min, caps->lowest_perf, caps- 
>> >highest_perf);
>> -    *max_perf = clamp_t(u32, max, caps->lowest_perf, caps- 
>> >highest_perf);
>> +    *min_perf = min(min, max);
>> +    *max_perf = max;
>>   }
>>   static void cppc_cpufreq_update_perf_limits(struct cppc_cpudata 
>> *cpu_data,
>> @@ -330,6 +498,26 @@ static void 
>> cppc_cpufreq_update_perf_limits(struct cppc_cpudata *cpu_data,
>>                        &cpu_data->perf_ctrls.max_perf);
>>   }
>> +static unsigned int
>> +cppc_cpufreq_update_perf_ctrls(struct cppc_cpudata *cpu_data,
>> +                   struct cpufreq_policy *policy,
>> +                   unsigned int target_freq)
>> +{
>> +    struct cppc_cpufreq_data *data = cppc_cpufreq_data(cpu_data);
>> +    u32 min_perf, max_perf, desired_perf;
>> +
>> +    cppc_cpufreq_get_perf_limits(cpu_data, policy, &min_perf, 
>> &max_perf);
>> +    /* Use the first level when several share the same integer-kHz 
>> value. */
>> +    desired_perf = cppc_cpufreq_perf_for_freq(&data->map, target_freq,
>> +                          min_perf, max_perf,
>> +                          CPUFREQ_RELATION_L);
>> +    cpu_data->perf_ctrls.min_perf = min_perf;
>> +    cpu_data->perf_ctrls.max_perf = max_perf;
>> +    cpu_data->perf_ctrls.desired_perf = desired_perf;
>> +
>> +    return cppc_cpufreq_perf_to_khz(&data->map, desired_perf);
>> +}
>> +
>>   static int cppc_cpufreq_set_target(struct cpufreq_policy *policy,
>>                      unsigned int target_freq,
>>                      unsigned int relation)
>> @@ -339,12 +527,9 @@ static int cppc_cpufreq_set_target(struct 
>> cpufreq_policy *policy,
>>       struct cpufreq_freqs freqs;
>>       int ret = 0;
>> -    cpu_data->perf_ctrls.desired_perf =
>> -            cppc_khz_to_perf(&cpu_data->perf_caps, target_freq);
>> -    cppc_cpufreq_update_perf_limits(cpu_data, policy);
>> -
>>       freqs.old = policy->cur;
>> -    freqs.new = target_freq;
>> +    freqs.new = cppc_cpufreq_update_perf_ctrls(cpu_data, policy,
>> +                           target_freq);
>>       cpufreq_freq_transition_begin(policy, &freqs);
>>       ret = cppc_set_perf(cpu, &cpu_data->perf_ctrls);
>> @@ -361,13 +546,12 @@ static unsigned int 
>> cppc_cpufreq_fast_switch(struct cpufreq_policy *policy,
>>                             unsigned int target_freq)
>>   {
>>       struct cppc_cpudata *cpu_data = policy->driver_data;
>> +    unsigned int resolved_freq;
>>       unsigned int cpu = policy->cpu;
>> -    u32 desired_perf;
>>       int ret;
>> -    desired_perf = cppc_khz_to_perf(&cpu_data->perf_caps, target_freq);
>> -    cpu_data->perf_ctrls.desired_perf = desired_perf;
>> -    cppc_cpufreq_update_perf_limits(cpu_data, policy);
>> +    resolved_freq = cppc_cpufreq_update_perf_ctrls(cpu_data, policy,
>> +                               target_freq);
>>       ret = cppc_set_perf(cpu, &cpu_data->perf_ctrls);
>>       if (ret) {
>> @@ -376,12 +560,39 @@ static unsigned int 
>> cppc_cpufreq_fast_switch(struct cpufreq_policy *policy,
>>           return 0;
>>       }
>> -    return target_freq;
>> +    return resolved_freq;
>>   }
>>   static int cppc_verify_policy(struct cpufreq_policy_data *policy)
>>   {
>> +    struct cpufreq_policy *cur_policy;
>> +    struct cppc_cpudata *cpu_data;
>> +    struct cppc_cpufreq_data *data;
>> +    struct cppc_perf_caps *caps;
>> +    unsigned int min_freq, max_freq;
>> +    u32 min_perf, max_perf;
>> +
>>       cpufreq_verify_within_cpu_limits(policy);
>> +
>> +    cur_policy = cpufreq_cpu_get_raw(policy->cpu);
>> +    if (WARN_ON_ONCE(!cur_policy || !cur_policy->driver_data))
>> +        return -ENODEV;
>> +
>> +    cpu_data = cur_policy->driver_data;
>> +    data = cppc_cpufreq_data(cpu_data);
>> +    caps = &cpu_data->perf_caps;
>> +    cppc_cpufreq_perf_limits(caps, data, policy->min, policy->max,
>> +                 &min_perf, &max_perf);
>> +    min_freq = cppc_cpufreq_perf_to_khz(&data->map, min_perf);
>> +    max_freq = cppc_cpufreq_perf_to_khz(&data->map, max_perf);
>> +
>> +    /* Favor the maximum if no supported frequency lies in the 
>> interval. */
>> +    if (min_perf > max_perf || min_freq > policy->max ||
>> +        max_freq < policy->min)
>> +        min_freq = max_freq;
>> +
>> +    policy->min = min_freq;
>> +    policy->max = max_freq;
>>       return 0;
>>   }
>> @@ -618,12 +829,14 @@ static void populate_efficiency_class(void)
>>   static struct cppc_cpudata *cppc_cpufreq_get_cpu_data(unsigned int cpu)
>>   {
>> +    struct cppc_cpufreq_data *data;
>>       struct cppc_cpudata *cpu_data;
>>       int ret;
>> -    cpu_data = kzalloc_obj(struct cppc_cpudata);
>> -    if (!cpu_data)
>> +    data = kzalloc_obj(struct cppc_cpufreq_data);
>> +    if (!data)
>>           goto out;
>> +    cpu_data = &data->cpu_data;
>>       if (!zalloc_cpumask_var(&cpu_data->shared_cpu_map, GFP_KERNEL))
>>           goto free_cpu;
>> @@ -640,6 +853,10 @@ static struct cppc_cpudata 
>> *cppc_cpufreq_get_cpu_data(unsigned int cpu)
>>           goto free_mask;
>>       }
>> +    cppc_cpufreq_init_perf_map(&cpu_data->perf_caps, &data->map);
>> +    data->nominal_khz = cppc_cpufreq_perf_to_khz(&data->map,
>> +                             cpu_data->perf_caps.nominal_perf);
>> +
>>       ret = cppc_get_perf(cpu, &cpu_data->perf_ctrls);
>>       if (ret) {
>>           pr_debug("Err reading CPU%d perf ctrls: ret:%d\n", cpu, ret);
>> @@ -651,7 +868,7 @@ static struct cppc_cpudata 
>> *cppc_cpufreq_get_cpu_data(unsigned int cpu)
>>   free_mask:
>>       free_cpumask_var(cpu_data->shared_cpu_map);
>>   free_cpu:
>> -    kfree(cpu_data);
>> +    kfree(data);
>>   out:
>>       return NULL;
>>   }
>> @@ -659,9 +876,12 @@ static struct cppc_cpudata 
>> *cppc_cpufreq_get_cpu_data(unsigned int cpu)
>>   static void cppc_cpufreq_put_cpu_data(struct cpufreq_policy *policy)
>>   {
>>       struct cppc_cpudata *cpu_data = policy->driver_data;
>> +    struct cppc_cpufreq_data *data;
>> +
>> +    data = container_of(cpu_data, struct cppc_cpufreq_data, cpu_data);
>>       free_cpumask_var(cpu_data->shared_cpu_map);
>> -    kfree(cpu_data);
>> +    kfree(data);
>>       policy->driver_data = NULL;
>>   }
>> @@ -1056,6 +1276,7 @@ static struct cpufreq_driver cppc_cpufreq_driver 
>> = {
>>       .flags = CPUFREQ_CONST_LOOPS | CPUFREQ_NEED_UPDATE_LIMITS,
>>       .verify = cppc_verify_policy,
>>       .target = cppc_cpufreq_set_target,
>> +    .resolve_freq = cppc_cpufreq_resolve_freq,
>>       .get = cppc_cpufreq_get_rate,
>>       .fast_switch = cppc_cpufreq_fast_switch,
>>       .init = cppc_cpufreq_cpu_init,
> 
> 


-- 
Thx and BRs,
Zhongqiu Han

