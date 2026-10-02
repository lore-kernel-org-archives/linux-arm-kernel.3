Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B9ECA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 10:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9l+Exz40ANsrUtRFRKe6jrUDrI2HVCuixopJvkWLVPo=; b=R73cZEL/obr1m5QJlrQwVbD1zb
	USfZzDOtKIASuvvb+FJ6AohFNg38rVoBGPccD9FYkmeYYXvGmNV8P0oglVWkK4ZO9gBV0kyLgQG5b
	NYbcfjtHl5o14WJ9HVDQ1pCnIdjhR1GlSPRyWMrWkONDk3TAiibMkFQ0B9Htp8v8XruP0QQtvGYaR
	por/J6byCjjqPualW+208BdHBx75s6bWZw+oUwvUfqY1OKqdm1uveLYOSHwIlXmx04TaYyuvd/Ght
	TvhxDiMSh8GUkgIOD9xMr/MLIQBJOaH074ec8AHbR2NzSMIbWBxRh6YbttO6TKlUMFVboXLuRue68
	3LgHcQgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaNo-0000000BI9l-2uW6;
	Fri, 02 Oct 2026 10:20:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaNm-0000000BI9C-229C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 10:20:51 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nbk9207339
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Oct 2026 10:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9l+Exz40ANsrUtRFRKe6jrUDrI2HVCuixopJvkWLVPo=; b=HA7If939ccg+rm7+
	jt5jIaoYeOIil3SZQA07KlvWVCheRUztDDzidlD5EpjfTj+XdffICUwMuH7B5O8G
	2xGUdWWXIq8DQAKE7shxBua+F4sTbanyMRrWyJEp/dUOit202Lcehdq26hDriPeh
	QXXBuJJVyJN3/9IdTghxn2hkcsAcxHRwktQXT4blRECE2mHvZCrs5yF/Y1aRk2iN
	0TWNS5x6JnCFHVKVtgt5PusibJmNenGul5WUR2OCXwphHKm1AjeTZC//UcgAM/TX
	93q2XAu6Xlb+DIoPEGY91Lglu/pFvwdEaCA8y7fHNRxbPvf0p4L+6lzIZB5iz8GP
	eNbQew==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1v03328y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 10:20:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39512608fb1so11959782a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 03:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790936447; x=1791541247; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9l+Exz40ANsrUtRFRKe6jrUDrI2HVCuixopJvkWLVPo=;
        b=FiY9RH9dnpN0DBa3sh7hpeseamo145oUu+WWCpU89jCJWhnC3aNInO/NeNFqzc/+95
         GOOLVH5WSvQSgdTgnRAgvYZk+vDuDUQh5s2RMq8cNjJAi7G0gb6U0ZsLXH9Sdkj8llOH
         9TK0fpilRbt8PO9E2aAt+TCCHj3jaHV/tKtEr6h+5cXzwXe2iV2bzjgMQsSLDImbc0Uk
         XiCEuhit6EqudB5IaH0hpG8x+vkRnRaDNlxZZbCUO8KRozaJYviB9lYYcy5U09doBfFj
         isgjVxfsJTbYyGQtO70NuQETIsQYGyvwfM8AunMuBPHD3xI8vAIeRMU+GMwxFkdJvEDZ
         gdlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790936447; x=1791541247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9l+Exz40ANsrUtRFRKe6jrUDrI2HVCuixopJvkWLVPo=;
        b=0q6awg/Ua9Fq2it89fWDCAcgf+o28eJyQ9MmDijyG8wF4jogDPsA04Ey8eZbcui3Bw
         O5+c7XUu31WRInGxtC4Q3PD946eiqsOK3fJqy2FnURXdBLv9IBykMIu2ppOtraDa7TLP
         4Q/D9sfSP08aeD4TDcFISkqYF++Andn345Fvw7g9xytZoCh6Q9udFeZLzLGjsafIU4bo
         0j4wT7yG/b0jMAM5WSCtkcbqXD/nddcrp3w9gi588i2k0AR99ZZZmP/5xUxTh73u0nk1
         PJABkxaTfJM7UJXc+jWzmY+ectTxYTVD2gRgoeEmtvTiK40NTkvpPzpV0bjfHlTWJOco
         QlZA==
X-Forwarded-Encrypted: i=1; AKwUvBy1xPi0UX7v7jou2cJh7Ch5oPbX4pJVpGGzxvdWG1szugGBGP398xoYn0d+/fNFJCxu5JwCkidC8J2RUUtB14Iu@lists.infradead.org
X-Gm-Message-State: AFq9FYIgyQi4tDMa1KORc+xdABb0r8iNrVGUmpx4TGZkLikFxEWRGqeg
	JcZPg+EAhtd5IFG7xvcZLx2CI+9nDQ0QgjByv41fT9aM0MeMoIzqokwFKNEF1ogDujqhFKfHpbB
	VBZVGOB9D7VVdIp/9NJMncqHcBqhg8uPqQimSLlz2WQCWBni98tdGrZR4CCP5kJQkVcvTEGVrua
	Rr5cbNeq8x3w==
X-Gm-Gg: AYBFou28jYNRW2Gz03QytxwcdwcNebVqx7LoEqxY11zovd0qBNvm1tEwjhVeJsg0Zh2
	4+wg5NftxNCBBOrV+vTPcSMvTPf+ekrt0o9tiEtZBFtqkxq1WNhYm2Hqy9O7dfe9a20DTV9wQJf
	JxNrxB4Hsl0sKxcgvlZeM0FeMN1WUDpi4cdkzt5yvO1PQsIdR15cs/Cj3Q9bB1FrlpHB13vP8yq
	AsQ2yMLZ822jqyI1zxcgjiTExlD8qSvkhhPpIvZanuzP23O4xtUZ1EL5nt2Fm8bruCC575wIKX2
	q9zWCtHAgSVgCQwZYgyIi/Ref25tSLD+UkjIQKU0btzFciGxc1fxDublC+7/3C/4XuRT3XS4Grd
	kZckyqHR1ZTbA7YESh3XP0yEXgrmEU/F3t6yBYahTnQXwKHCDj4Pkcz4GlOZjhhnbQU7enQ==
X-Received: by 2002:a17:90b:548d:b0:39d:e213:9dd3 with SMTP id 98e67ed59e1d1-3a6ce647e67mr2326311a91.1.1790936447181;
        Fri, 02 Oct 2026 03:20:47 -0700 (PDT)
X-Received: by 2002:a17:90b:548d:b0:39d:e213:9dd3 with SMTP id 98e67ed59e1d1-3a6ce647e67mr2326271a91.1.1790936446628;
        Fri, 02 Oct 2026 03:20:46 -0700 (PDT)
Received: from [10.133.33.14] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6ccc96ac0sm3407857a91.2.2026.10.02.03.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 03:20:46 -0700 (PDT)
Message-ID: <d718da43-0efa-49ea-9081-8d395ee013e6@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 18:20:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] cpufreq: Add a driver frequency resolution callback
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
 <20260929102957.2591657-2-christian.loehle@arm.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260929102957.2591657-2-christian.loehle@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0MSBTYWx0ZWRfX81c0AVIorgCe
 /j+SmXIRNIdxx/mifG8sJgXJl6qcRXvb9v+98BZ57771wPCVfkaZpBLmTmm8PxeeZs3dkovb/EX
 DFy9DD9MS7C+htrwA7dk7m7hCulyC4s=
X-Authority-Analysis: v=2.4 cv=GqfXaU1C c=1 sm=1 tr=0 ts=6abf8580 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=XS8obbLTPcTq88lrOBEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: QROLpR9w5qK4wxwKyKHqLZhDND81NZRc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0MSBTYWx0ZWRfX2J1Y4+9m2bI5
 w5wIfCC/mMngJrprVZxJ4Jxd4RVHJke8eH3o1miC9Tp0YRo3YYukD+uWv8hmg/xUF1Wjg4c1GxO
 NElRy5XzOJ1XZwQRSX9I/WuJM9N3iZZKFL/A95Qp6seLGL9ZEwVLWF0LTYMXs6F9v4/ALNBlBZ+
 F9rN9C58FpWgVt6XRNWY8IzIrrXwnmZMk/aVAUUepqNNzXXlaoBJd+8Mb0/ZK25Xxpt2Qn2PGvt
 JCtL1VGIjRd2rpP1aeh0JDhp1OOdCZR7bRUzjK6ztREXo4Ki33YIUyj3KHutMnTS+O8u5E8E2/z
 Ymt/7nPETFQYVlKWHioOiv+twI044m81IpS9vN9vJv/y53JDVZlffQdmyRY1i5EABq8FziHeOpa
 A87TEuuWslrG71hc7WcsZTOwhytIeDGBrQcetfcmmHpKg+8NjW2MFQb4CDMj0Q9w3S2MXUIj5Nt
 gGamHM0yFgDS2FRPjaQ==
X-Proofpoint-ORIG-GUID: QROLpR9w5qK4wxwKyKHqLZhDND81NZRc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_032050_656426_C5ADEED6 
X-CRM114-Status: GOOD (  37.20  )
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

On 9/29/2026 6:29 PM, Christian Loehle wrote:
> Without a frequency table, cpufreq treats the policy range as continuous
> even when the driver selects discrete performance levels. Governors can
> then issue different kHz requests for the same driver setting.
> 
> Add ->resolve_freq() for table-less ->target() drivers to canonicalize
> requests within the supplied limits using CPUFREQ_RELATION_{L,H,C}.
> Document the callback and verification contracts so callers can safely
> cache resolved requests.
> 
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

> ---
>   Documentation/admin-guide/pm/cpufreq.rst |  4 ++++
>   Documentation/cpu-freq/cpu-drivers.rst   | 19 +++++++++++++++++++
>   drivers/cpufreq/cpufreq.c                | 17 +++++++++++++++--
>   include/linux/cpufreq.h                  | 10 ++++++++++
>   4 files changed, 48 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/pm/cpufreq.rst b/Documentation/admin-guide/pm/cpufreq.rst
> index 34baf20cc202..e634b87a62a8 100644
> --- a/Documentation/admin-guide/pm/cpufreq.rst
> +++ b/Documentation/admin-guide/pm/cpufreq.rst
> @@ -144,6 +144,10 @@ that belong to the same policy (including both online and offline CPUs).  That
>   mask is then used by the core to populate the policy pointers for all of the
>   CPUs in it.
>   
> +A table-less driver whose discrete frequencies are derived at runtime can
> +instead provide a ``->resolve_freq()`` callback to map arbitrary requests to
> +deterministic, supported frequencies.
> +
>   The next major initialization step for a new policy object is to attach a
>   scaling governor to it (to begin with, that is the default scaling governor
>   determined by the kernel command line or configuration, but it may be changed
> diff --git a/Documentation/cpu-freq/cpu-drivers.rst b/Documentation/cpu-freq/cpu-drivers.rst
> index 17c69f83691e..4f327760bc04 100644
> --- a/Documentation/cpu-freq/cpu-drivers.rst
> +++ b/Documentation/cpu-freq/cpu-drivers.rst
> @@ -86,6 +86,9 @@ And optionally
>    .set_boost - A pointer to a per-policy function to enable/disable boost
>    frequencies.
>   
> + .resolve_freq - A pointer to a frequency-resolution function for table-less
> + drivers with discrete, runtime-derived frequencies.  See below.
> +
>   
>   1.2 Per-CPU Initialization
>   --------------------------
> @@ -170,6 +173,22 @@ limits on their own. These shall use the ->setpolicy() callback.
>   1.5. target/target_index
>   ------------------------
>   
> +Table-less ``->target()`` drivers may provide ``->resolve_freq()`` to map a
> +clamped target to a supported frequency within the supplied limits.
> +``CPUFREQ_RELATION_L`` selects the lowest frequency at or above the target,
> +H the highest at or below it, and C the closest, choosing higher on ties.
> +If no supported frequency is at or above the target, L returns the highest
> +supported frequency in the interval. If none is at or below the target,
> +H returns the lowest supported frequency in the interval.
> +``CPUFREQ_RELATION_E`` is stripped before the call.
> +
> +Equivalent requests must resolve to the same frequency, which the target
> +callbacks must map to one canonical driver request even if performance levels
> +share a kHz value. This lets callers cache resolved requests. ``->verify()``
> +must leave a supported frequency in every accepted limit interval.
> +The callback must not sleep: it may run in scheduler context.
> +Policies providing both a frequency table and this callback are rejected.
> +
>   The target_index call has two arguments: ``struct cpufreq_policy *policy``,
>   and ``unsigned int`` index (into the exposed frequency table).
>   
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 54dde8419bdc..44bda2f32fcf 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -480,8 +480,12 @@ static unsigned int __resolve_freq(struct cpufreq_policy *policy,
>   
>   	target_freq = clamp_val(target_freq, min, max);
>   
> -	if (!policy->freq_table)
> +	if (!policy->freq_table) {
> +		if (cpufreq_driver->resolve_freq)
> +			return cpufreq_driver->resolve_freq(policy, target_freq, min, max,
> +							    relation & ~CPUFREQ_RELATION_E);
>   		return target_freq;
> +	}
>   
>   	idx = cpufreq_frequency_table_target(policy, target_freq, min, max, relation);
>   	policy->cached_resolved_idx = idx;
> @@ -495,7 +499,10 @@ static unsigned int __resolve_freq(struct cpufreq_policy *policy,
>    * @policy: associated policy to interrogate
>    * @target_freq: target frequency to resolve.
>    *
> - * The target to driver frequency mapping is cached in the policy.
> + * The frequency-table resolution path caches the mapping in the policy.
> + *
> + * Keep the policy active and exclude driver teardown; a policy reference
> + * alone does not protect driver-private data.
>    *
>    * Return: Lowest driver-supported frequency greater than or equal to the
>    * given target_freq, subject to policy (min/max) and driver limitations.
> @@ -1445,6 +1452,11 @@ static int cpufreq_policy_online(struct cpufreq_policy *policy,
>   		 * If there is a problem with its frequency table, take it
>   		 * offline and drop it.
>   		 */
> +		if (policy->freq_table && cpufreq_driver->resolve_freq) {
> +			ret = -EINVAL;
> +			goto out_offline_policy;
> +		}
> +
>   		ret = cpufreq_table_validate_and_sort(policy);
>   		if (ret)
>   			goto out_offline_policy;
> @@ -2925,6 +2937,7 @@ int cpufreq_register_driver(struct cpufreq_driver *driver_data)
>   
>   	if (!driver_data || !driver_data->verify || !driver_data->init ||
>   	     (driver_data->target_index && driver_data->target) ||
> +	     (driver_data->resolve_freq && !driver_data->target) ||
>   	     (!!driver_data->setpolicy == (driver_data->target_index || driver_data->target)) ||
>   	     (!driver_data->get_intermediate != !driver_data->target_intermediate) ||
>   	     (!driver_data->online != !driver_data->offline) ||
> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> index d3d0d9d02aa4..a0a7619d11fd 100644
> --- a/include/linux/cpufreq.h
> +++ b/include/linux/cpufreq.h
> @@ -364,6 +364,16 @@ struct cpufreq_driver {
>   	int		(*target)(struct cpufreq_policy *policy,
>   				  unsigned int target_freq,
>   				  unsigned int relation);	/* Deprecated */
> +	/*
> +	 * Optional for table-less ->target() drivers. Resolve a clamped request
> +	 * within the supplied limits using CPUFREQ_RELATION_{L,H,C}. Must not
> +	 * sleep. See Documentation/cpu-freq/cpu-drivers.rst for the contract.
> +	 */
> +	unsigned int	(*resolve_freq)(struct cpufreq_policy *policy,
> +					unsigned int target_freq,
> +					unsigned int min_freq,
> +					unsigned int max_freq,
> +					unsigned int relation);
>   	int		(*target_index)(struct cpufreq_policy *policy,
>   					unsigned int index);
>   	unsigned int	(*fast_switch)(struct cpufreq_policy *policy,


-- 
Thx and BRs,
Zhongqiu Han

