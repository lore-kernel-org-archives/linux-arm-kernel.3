Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53175CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 13:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YpSW+RdExvXXCJu4VHHaBvyDL2XvnqWHchu+ATAltQ=; b=24l0Q+G2SL/HCVXW/Itu7oyaKw
	/HrvqLTjuQa1K8J8ykzNT4kZtoxAem9TXpdcq0zWWAINT6Fg0m2r7RTgX1vztqvL2wbupnWTtEbBs
	YZKOSIi467zwzG+W+dusrCrWTRXiRD34MOw98glA2T2VCCd/M2rZ5gBbPGZ1hVpfrgIoXacFWZ2qL
	x6lc/NHMSvZJeNiStZXZelPn0GrlShziJ+WxJ3Xq6cbPdWpK4zq9poJzcOHjUqgcmCXefe1ugOMTR
	8a0lbfg8G6ftLqXQ/2u+EibuSfDXb6lNL0ABuOZB90ruSWLvK/4Ltxj/kLwgrXqKYPWRfzW55Ager
	W0i7Oolg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRVBc-0000000HIBS-0YA4;
	Mon, 25 May 2026 13:17:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRVBZ-0000000HIA0-2iAg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 13:17:39 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PA4c8x2146016
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 13:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6YpSW+RdExvXXCJu4VHHaBvyDL2XvnqWHchu+ATAltQ=; b=CAXMu66OZf071LgC
	mAj0pN7deuiUnEEYCgHFnnxGA6imAymF8QrdphCf7JTNmT8mZXgSX81kKEIRlyIm
	obDMJcuMfrbW6vwNBKRiPeYiemosKgY7QHRMJCKAiSY8/BTjxEaNAXqwzzFzxb55
	w6nYOtst2TwFFxcUNCSoELFXAnub+6CVdj+VEvdP1gfI33ol0Kn11rBP6TXTw6Uy
	6dIgB0TGjsr8dR/oFpg8T/YZXL9kjcVnALaqsmcW0YHXiAymULQkKRWC0EpIk5sc
	yPLE3/ONYgBFGkFBFUmen3o3HxF2zxBkT4cA66PhDS0DkawlX9bD6Q7RVc4xk+g0
	Z+yuAw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv0kmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 13:17:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36641fe4aedso18448883a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 06:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779715056; x=1780319856; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6YpSW+RdExvXXCJu4VHHaBvyDL2XvnqWHchu+ATAltQ=;
        b=boQgrFK0ZZJkve0G/jZxSvboZSqrQ07FwTQkBADPlR9kgIXXK29URdZCqeh00BLiz6
         WzQYRjxv+/gdZakslU//LT79b/QKbIdhRmeDNnEAnXxQcZpTvOAJ5IcmNFsMCglXLk/h
         7q4YJFH7gOQK7xkP2O3k2yXH6cO7eccU/oTSsFBi3Isvptjgt4gaTqoSH5dXzE6nSeE2
         +3bA+cJNkXkZJ5d4Fmpiz1g9xePM2uwWslvYcm705AFFx9DV8UVRKxyZrFJRyazj+n/1
         RPO/W9TNv0SEbKcap1axsIEZ/Aqv9qsUwBI24bC/JQMULe17gCNmSOhdaXbmGcrNnAvw
         WE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779715056; x=1780319856;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6YpSW+RdExvXXCJu4VHHaBvyDL2XvnqWHchu+ATAltQ=;
        b=Rn4LHx802Mlf/Y19VFV/tdxxB46VMEGzAZAc8dOWXg+Fd877eUyiGznnwY30I0IqGQ
         ZkZqUZ/84bo7DayitBai5JLSWO0j6GokEDkOMaJRP8cF1Ohr3vSHJyJSFjwggi8Su9dr
         rAgVCYABKkdHYpzL2/leK8/EX71Djo2Yq/PqCc9YnCkJ5QKwq2col8Nbpu/nG12c/851
         u7dhB6nDtP8NwUuEMNOlIr3yQ9FLieduSgQCCEeW048mG7Hk2OR2k1uHfYgk8T3UJwkK
         llKiVV2icD2MbzRe5vmbIUZ25bLrtI4dbFBf7OzICN+1Yl3oziWXg9TvsFiktJt7TzHV
         3eOw==
X-Forwarded-Encrypted: i=1; AFNElJ/VIo1KFUZ2l6l1DOxDdP/t/pOVuiTBCBN5ZFwfIJmfpjsClZeT/4ebIsBW4vRhNV62sryEOFrquvn/+gtWGkoL@lists.infradead.org
X-Gm-Message-State: AOJu0Yyelyewo5hSQcBaDRKL3Iy7Vt2blR6Adhz7irf2m761HP9DfU5O
	svxtwQCV3afRETRENzfxQ+zBISOOGA6BuYlNc5fOdHyN43VSGtFkKQzVXWZax9ZrAu3wsm6PXEc
	Vq1MHTKcImxOAMJWq5Bok0BNoDvDZRExsSPHdV3p260oZYRyl+bZ40uH/ru2lF1nOxt+s9be1d1
	EdmQ==
X-Gm-Gg: Acq92OH10qQBnV8VU8b27mYJnYm9vG66IiJsD5toYK9Yykz3Rzux5REmyKaMf7bV9sI
	kCn6bVPeNlZMpPKfKeobCR1d8DtjxnEjDtmRIK9La6NpKShFvVhSn9Zbde149SkodTh58PTXOur
	VJpdIjDwIL2DPY+B6+1FaXmPpXMYXnJQsKwzp6O21JjAgCJ7FwkGXLRUwvIrVRedcdtBz3Zd771
	eZABZ6g6zlnoc0oAJPrnA1mdTi9pB8Ip9cgMPwkKdvkdxjvXOJJmn6iutiVJceOrXw8lw1pAAqS
	tuy8oR13i4NV62ypTMQwyjG7LV5RvuNVbcdqj4WRG0IUYOhtdPlp1GB7Sj60FU5WdseRmSWp5ie
	Z3nxl6Juo+yEhs2HSUiMSstbrX/CH7V3TA7N424TzBuQUkBtyHUA=
X-Received: by 2002:a17:90b:4ac4:b0:368:b724:6d53 with SMTP id 98e67ed59e1d1-36a67403d54mr12966347a91.4.1779715055943;
        Mon, 25 May 2026 06:17:35 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac4:b0:368:b724:6d53 with SMTP id 98e67ed59e1d1-36a67403d54mr12966301a91.4.1779715055267;
        Mon, 25 May 2026 06:17:35 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72674492sm9226806a91.8.2026.05.25.06.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 06:17:34 -0700 (PDT)
Message-ID: <11a01108-63da-4317-a547-5977a469a7dc@oss.qualcomm.com>
Date: Mon, 25 May 2026 18:47:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/12] coresight: Add CPU cluster funnel/replicator/tmc
 support
To: Sudeep Holla <sudeep.holla@arm.com>,
        yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>, ulfh@kernel.org
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
 <20251218-careful-ruby-wildebeest-a8babd@sudeepholla>
 <d0ce8306-84e0-4940-98aa-dbc356d87593@oss.qualcomm.com>
 <20251219-hysterical-sparkling-meerkat-59c5eb@sudeepholla>
Content-Language: en-US
In-Reply-To: <20251219-hysterical-sparkling-meerkat-59c5eb@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzNyBTYWx0ZWRfX/bYb66Q5jzO/
 QgOvs3DGI2NYA0kLHiN0JmAKWQnf07RshMIVu6NnqCt62AjqV+zCVwrAfeclE3XY1nB3UrCO1y6
 LK8f2AzHNajsUuhlpou36IIWptIviqdCQ/fqDEOJbquAoe5vPlLi96534SjPlS5gGUrSK/9oyBn
 QJJiKyMx8lK49rAL4gePb5+BadmpVGltfxixfg7EZa01O7i0nGjKZtfNWDMOat9r52fgAJZKTmq
 lnQcykWtjM2Yp47zrCHM8PWwpWSwuTyABqaNEc5GsmlttBXqAr+uDAMNmUUirj1UdICd9mBHnOP
 k0GUTHTQrvqUnXj9SxPjiVvt5RPo65zN/4g2uSSkDgIMZ9xZfkd1IP198TyCn8WFsttru+CdGtT
 zTJcSqQNBeqr2bHphCE1IvHPJKwTyZjjoXcuJidLwFcECRnz1GW1xKbSXYzZBmT3xWee8MOGJ72
 BkMh/ENLrAAJRejUXuA==
X-Proofpoint-GUID: sHgqwRWb7uvGbAs82wKzLTEFQSevw5MP
X-Proofpoint-ORIG-GUID: sHgqwRWb7uvGbAs82wKzLTEFQSevw5MP
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a144bf0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=lBx55hxn-Rfz2RAIWSEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_061737_697751_AF7B5540 
X-CRM114-Status: GOOD (  44.99  )
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



On 12/19/2025 3:51 PM, Sudeep Holla wrote:
> On Fri, Dec 19, 2025 at 10:13:14AM +0800, yuanfang zhang wrote:
>>
>>
>> On 12/18/2025 7:33 PM, Sudeep Holla wrote:
>>> On Thu, Dec 18, 2025 at 12:09:40AM -0800, Yuanfang Zhang wrote:
>>>> This patch series adds support for CoreSight components local to CPU clusters,
>>>> including funnel, replicator, and TMC, which reside within CPU cluster power
>>>> domains. These components require special handling due to power domain
>>>> constraints.
>>>>
>>>
>>> Could you clarify why PSCI-based power domains associated with clusters in
>>> domain-idle-states cannot address these requirements, given that PSCI CPU-idle
>>> OSI mode was originally intended to support them? My understanding of this
>>> patch series is that OSI mode is unable to do so, which, if accurate, appears
>>> to be a flaw that should be corrected.
>>
>> It is due to the particular characteristics of the CPU cluster power
>> domain.Runtime PM for CPU devices works little different, it is mostly used
>> to manage hierarchicalCPU topology (PSCI OSI mode) to talk with genpd
>> framework to manage the last CPU handling in cluster.
> 
> That is indeed the intended design. Could you clarify which specific
> characteristics differentiate it here?

Sorry for coming very late on this.

This series is intended to handle coresight components which resides within CPU cluster.
For the cases where cluster is in deepest idle low power mode or all CPUs belonging to cluster
are hotplugged off, access to coresight components can not be done.

The implementation tried to address in two parts,
1. Using cluster power-domain to know which coresight component belongs to which cluster/CPUs
2. Schedule the task on intended cluster's CPU to make sure the CPU (and cluster) power is
ON while coresight component of the cluster is being accessed (using smp_call_function_single()).

The use of power-domains in (1) will limit this to PSCI OS-Initiated mode,
to have this support on PSCI Platform-Coordinated mode too, probably instead of power-domains,
cpu-maps (which also defines the clusters) from device tree is a better choice which will give
the information on which CPU belongs to which cluster.

(2) ensured that scheduling happened on intended CPU and while the access is in progress, CPU (and
cluster) will not enter power down in between.

> 
>> It doesn’t really send IPI to wakeup CPU device (It don’t have
>> .power_on/.power_off) callback implemented which gets invoked from
>> .runtime_resume callback. This behavior is aligned with the upstream Kernel.
>>
> 
> I am quite lost here. Why is it necessary to wake up the CPU? If I understand
> correctly, all of this complexity is meant to ensure that the cluster power
> domain is enabled before any of the funnel registers are accessed. Is that
> correct?

Yes, This is to ensure that CPU (and cluster) power is ON while coresight components
for same cluster are being accessed.

> 
> If so, and if the cluster domains are already defined as the power domains for
> these funnel devices, then they should be requested to power on automatically
> before any register access occurs. Is that not the case?

Cluster power-domains will be only available for PSCI OS-initiated mode but also
will not help for cases where all CPUs in cluster are hotplugged off as hotplugs are
platform coordinated.

After discussion with our HW team to automatically request power on for coresight
component GPR [1] can be used but they seems not working as intended on the existing
SoCs and will be available on next generation SoC.

[1] https://developer.arm.com/documentation/ddi0480/d/Functional-Overview/Granular-Power-Requestor

> 
> What am I missing in this reasoning?
> 
> The only explanation I can see is that the firmware does not properly honor
> power-domain requests coming directly from the OS. I believe that may be the
> case, but I would be glad to be proven wrong.
> 

please see below comment for more details, This seems not a firmware issue.

>>>
>>>> Unlike system-level CoreSight devices, these components share the CPU cluster's
>>>> power domain. When the cluster enters low-power mode (LPM), their registers
>>>> become inaccessible. Notably, `pm_runtime_get` alone cannot bring the cluster
>>>> out of LPM, making standard register access unreliable.
>>>>
>>>
>>> Are these devices the only ones on the system that are uniquely bound to
>>> cluster-level power domains? If not, what additional devices share this
>>> dependency so that we can understand how they are managed in comparison?
>>>
>>
>> Yes, devices like ETM and TRBE also share this power domain and access constraint.
>> Their drivers naturally handle enablement/disablement on the specific CPU they
>> belong to (e.g., via hotplug callbacks or existing smp_call_function paths).
> 
> I understand many things are possible to implement, but the key question
> remains: why doesn’t the existing OSI mechanism - added specifically to cover
> cases like this solve the problem today?
> 
> Especially on platforms with OSI enabled, what concrete limitation forces us
> into this additional “wake-up” path instead of relying on OSI to manage the
> dependency/power sequencing?

+ Ulf in loop.

Current platforms with OSI enabled, Linux PSCI do not implement the power_on/power_off
requests, as far as i know, runtime PM was never meant to implement this part and
pm_runtime_get_sync() (from drivers/cpuidle/cpuidle-psci.c) call is only used to convey
to cluster power domains about a child CPU/ sub domain being on after it has already
been landed in Linux.

The standalone invoke of pm_runtime_get_sync() from another CPU do not really turn on/get
the CPU (and cluster), as the CPUs either use CPUidle / CPU hotplug paths to enter/exit
low power mode.

To put it other way,
For a hot-plugged off CPU, invoking a pm_runtime_get_sync() won't get the CPU (and make
its cluster power domain) ON. In order to turn on the CPU, one has to still request
the online of the CPU, say via sysfs command echo 1 > /sys/devices/system/cpu/cpuX/online
which would invoke PSCI CPU_ON function and the power domain for CPU gets marked as ON
only after CPU already landed in Linux via psci_idle_cpuhp_up() invoking pm_runtime_get_sync().

I used specific hotplug example but same applies to idle powered down CPU (or Cluster) too.

> 
>>>> To address this, the series introduces:
>>>> - Identifying cluster-bound devices via a new `qcom,cpu-bound-components`
>>>>   device tree property.
>>>
>>> Really, no please.
>>>
>>
>> Our objective is to determine which CoreSight components are physically locate
>> within the CPU cluster power domain.
>>
>> Would it be acceptable to derive this relationship from the existing
>> power-domains binding?
> 
> In my opinion, this is not merely a possibility but an explicit expectation.
> 
>> For example, if a Funnel or Replicator node is linked to a power-domains
>> entry that specifies a cpumask, the driver could recognize this shared
>> dependency and automatically apply the appropriate cluster-aware behavior.
>>
> 
> Sure, but for the driver to use that information, we need clear explanation
> for all the questions above. In short, why it is not working with the existing
> PSCI domain idle support.
> 

Explained above.

Thanks,
Maulik

