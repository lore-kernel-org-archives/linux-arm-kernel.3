Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD690C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 10:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EyyU/Qc9UyahVBWmmJxyG2aqScYM6OzoucwPCiZaUtg=; b=s6+1EvVZ+7hr5dUXrfjYV7uM8r
	UQ2TKCUKbh4CXt1G3cMT7fDMXFYxqtClzxVYjVXMt2rARpcc5rZi/1YKwGk6dOzsF1K1jT+HfaKaJ
	2WC7t5i13tNdsga9cXfKOxRan+kauYgebC/QKlgQ0puFC5niP7udDZ9r+Pd8jW4xAu/LpDwoh8OlW
	BE/fNoqdpQqitDzlOa7Rdce6gbSwHZwLsgPQYfSiX/J9DpvgtUhZxqtnK6YaxMX0vedC9kDRapdii
	J4bncw+MBeqNbfckYAef0jTuQ/p4cFUPaaGzfG6kISjDVvFz4vTYtOzycuyQG0RR+osbGQ/cUezO7
	wmQ8tfIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkg3l-000000021IS-30oG;
	Fri, 17 Jul 2026 10:44:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkg3i-000000021Hp-1cg3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 10:44:48 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HASiRS1515699
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 10:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EyyU/Qc9UyahVBWmmJxyG2aqScYM6OzoucwPCiZaUtg=; b=CL9HPBVufsgj7Mf+
	oBxm9fcpuQr6aXOSmJCIb9wyxDI5P4YYG5ojVIQpyPEMdVHXMCu4i/gMAGEc4CDM
	CwRPVO2lxBjMTbfXQB6BFCF06vIzOXlCg9A8WnDS/JJmQIHlVXrOiCsDu8806lFZ
	mv8fJqMwSnXBde+0FE4E1coba4YNJ63FXbxFHGLC9OdnlXwgOcXwv8qnI7n4eUMt
	NA57JsHJtNX6k3NZJ9BynNgVn3EG/3BtRGwC1dsTdyX98TfRc7OMTAH3tg/F8hNg
	Dxp1vaHMaAgt6G0nfIlcLyRF9NrjnoAV3+IlJthSQvfIqvfY6j4mabzGVaTWM5vs
	KR68aQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9grx8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 10:44:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8488ac68185so14145986b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 03:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784285084; x=1784889884; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EyyU/Qc9UyahVBWmmJxyG2aqScYM6OzoucwPCiZaUtg=;
        b=Vn9xdeL2XTkCi9I2hdZZ1oOpVLmCD+Z2q398xUH723XzvUgCC1PpqwmeL4LO0DbTcC
         Bl1olL17wuLxT/0eMPK+HId9J+ypqERa+vCZfqdYzFDuTDXM1HSMingH4cCtJftfJJsT
         mTqM9gL+76l/TQ/4vFvnHjYl/NfezQa9Bb6OZ+NHf+jZ+kcTt/ymChSYqEal0ZoFVIk3
         TOx9fiuUquaxfJv1EVylFPVUXnqgOcZ1TDxvyAlR4kCHSUPNRgJ5nTuGPfgp6npO6w0o
         /kHUVNAVNNO4t2r1ohALmIJyjq9cvcTpSXLtfLdIlzIV1ff0cdgW7UQxNca5VCBdQNKP
         4ocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784285084; x=1784889884;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EyyU/Qc9UyahVBWmmJxyG2aqScYM6OzoucwPCiZaUtg=;
        b=Y486lJTrI3UClVI6K/MjHKJFDuS5bHMUIWT1oFrTek4P7ZyfF7GtgtGw65UcEkT5De
         ar0eY2B3WQntqdNkUFNFbcSuTiarUJbCjLZf2t/+ZA84kPH64n4Hf8x5297ffdAtGMWw
         CwqjdCHcWNkdiC3RTNu0Tk1eqO3kQXaJ5lRj6KGb9J4AgRa3/2pyQ5ZQboCwgjngf9Zx
         F8NHa/AYw+hEPcTUv3viqDE6dypSfoUa0RvDptBj5EgAuBzdD1smYYMU/rOcxO/+qGD6
         UHr2ZmQhCUi6Xuuzb0qnp2iKoxEe1QDcnwy+ufew+pdZh2Ho0FL7JkFN4G98+84bMvEb
         NsPg==
X-Forwarded-Encrypted: i=1; AHgh+RpIFxYWi7NR8vf0WWZjI1wubaoXzGDc0tbwgvNofqQgylsQVmp/t+XeYpsrkmkQ8nRsx3lJTJ8tguitIclBzC+r@lists.infradead.org
X-Gm-Message-State: AOJu0YyaOj3OyQkbGGKXwlNPhtjwkMCtu6lA2k8StjBKV9d/rhg6kJw1
	YBoT8E6bw8cSvnCik8LSKovCCVUftZCcVFTR+5ozacIGhKqke2+agNTFrxBCa1sKVarN5vk9DXM
	AjeKd/vu5EIfjvINPoynZw796VhOGs7yF6SasFdDiMAtlDfMbEdarX1FZ4Wlassmj387KCz7ySG
	TvlrjhmQCmPQ==
X-Gm-Gg: AfdE7ckirZ6tt6RadQjX6x92OjQkVc7LEScrInLLrktQhH15piW4FdRL4gQ8Pe3dyKQ
	3JVG+efGY1v17x7gGnfYKH6S1nFdSENrjgeIMEJ+WE+hOUY8RbH3o7/CSn8fjK1Gk0lM9fXHE0X
	ASMtYX2cRBG3Fy+aSdBQHAr5L+bmyz/7zZ7siac895PV8XMay+qZ+lj3TB3NCeXZ/wRQfhQuvwe
	h3IhMO0dD7WPrF+0cJr9AWyx4esPKxNH/5P5kt2OccrG0/mGVkpMRRGAkT4Iug+hFK4JYQbvZUe
	bMXO41BzWpQiEJ/Il8HVun0HiBQwdssIaDKg9yooNYQkGKI4TgDb/fb6xiQTxmdDvA4/mCJcpg+
	q1LaKQIzWjJIEL7iDEqNiD/mITXOValNb+/olOrjAYX5lFVGiWqu3u/rMCL85UJlA2U9OUc33vV
	4=
X-Received: by 2002:a05:6a00:4603:b0:848:4810:2b70 with SMTP id d2e1a72fcca58-84c294d4154mr2047682b3a.68.1784285083731;
        Fri, 17 Jul 2026 03:44:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:4603:b0:848:4810:2b70 with SMTP id d2e1a72fcca58-84c294d4154mr2047634b3a.68.1784285083114;
        Fri, 17 Jul 2026 03:44:43 -0700 (PDT)
Received: from [10.133.33.143] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af6e3e0sm806712b3a.43.2026.07.17.03.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 03:44:42 -0700 (PDT)
Message-ID: <a25a09c6-30fe-41de-9e6d-49e07934f263@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 18:44:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] coresight: Add CPU cluster funnel/replicator/tmc
 support
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, ulfh@kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@linux.dev>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
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
 <11a01108-63da-4317-a547-5977a469a7dc@oss.qualcomm.com>
 <1714ad84-18cf-48d4-973d-b5e454d27c6c@oss.qualcomm.com>
In-Reply-To: <1714ad84-18cf-48d4-973d-b5e454d27c6c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEwNyBTYWx0ZWRfX8Z3GIsL2tB3i
 RDuL37SDnPkMzZ4jvbAPv3xLIBYsvtnrUmklfJpNS9/kIC5GigbGwKl+W00+9cFb0ViTRtaSEk4
 1RHQdlQiREYYAa5ZhMHrLJyrgoMd6QA=
X-Proofpoint-ORIG-GUID: -WKP5iVfJ_IJ9nVoDaddzgB2w2kgGwo2
X-Proofpoint-GUID: -WKP5iVfJ_IJ9nVoDaddzgB2w2kgGwo2
X-Authority-Analysis: v=2.4 cv=TaumcxQh c=1 sm=1 tr=0 ts=6a5a079c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=ynM2Uctx98uadF1GduAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEwNyBTYWx0ZWRfX/lvsvpTl3fQd
 ZLhtkPpQfWMHA+Dbn3GCxi3Hg13HV7REuds6gMCqds+xr7eeBhlTN3N5Napea4wcj07Pbdy9uYc
 LxfD2+S4KHg+AfU7OUTejppnotSkGmwsUvbYNY9/TSSV4CN1nwV/wH4VvNCIwm0x5k7qvzydX2Z
 /0zCuPwD9dDVuG/JVmI6Lva5znHqn9jix13BzFNLrDiuys7FhwLNb8XJr1nnoDRZlbvIOJQC2a5
 aAYuIzbxetA9ADVzMGlgHmNVhGG5DrzxezkEtnFyWnVg6wR2+m6x+paW3W5wRjZQ55zyOf0h34x
 FycXNjjocH38pJ1Zpl6unST4SKf7GimU7PIhYiDoo02nH6SliDRw1PwPMmRRC4DqNyi1EJwrF7F
 Yz7Jl95wbrW90/3W/CWec4ABKPgPiPgJGpDPA01+wYKzCK2YkQSnSvQRA41BdpX8cOaYYzvG+tW
 UStdtf7zuwM2t9XvKcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_034446_548305_E1CC806A 
X-CRM114-Status: GOOD (  40.29  )
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

Hi Sudeep & Suzuki,

Gentle reminder on this patch series. Please let me know if you have any concerns or suggestions.

Thanks, Yuanfang

On 6/29/2026 1:55 PM, Yuanfang Zhang wrote:
> Hi Sudeep & Suzuki,
> 
> Gentle reminder on this patch. Any feedback would be appreciated.
> 
> Thanks,
> Yuanfang.
> 
> On 5/25/2026 9:17 PM, Maulik Shah (mkshah) wrote:
>>
>>
>> On 12/19/2025 3:51 PM, Sudeep Holla wrote:
>>> On Fri, Dec 19, 2025 at 10:13:14AM +0800, yuanfang zhang wrote:
>>>>
>>>>
>>>> On 12/18/2025 7:33 PM, Sudeep Holla wrote:
>>>>> On Thu, Dec 18, 2025 at 12:09:40AM -0800, Yuanfang Zhang wrote:
>>>>>> This patch series adds support for CoreSight components local to CPU clusters,
>>>>>> including funnel, replicator, and TMC, which reside within CPU cluster power
>>>>>> domains. These components require special handling due to power domain
>>>>>> constraints.
>>>>>>
>>>>>
>>>>> Could you clarify why PSCI-based power domains associated with clusters in
>>>>> domain-idle-states cannot address these requirements, given that PSCI CPU-idle
>>>>> OSI mode was originally intended to support them? My understanding of this
>>>>> patch series is that OSI mode is unable to do so, which, if accurate, appears
>>>>> to be a flaw that should be corrected.
>>>>
>>>> It is due to the particular characteristics of the CPU cluster power
>>>> domain.Runtime PM for CPU devices works little different, it is mostly used
>>>> to manage hierarchicalCPU topology (PSCI OSI mode) to talk with genpd
>>>> framework to manage the last CPU handling in cluster.
>>>
>>> That is indeed the intended design. Could you clarify which specific
>>> characteristics differentiate it here?
>>
>> Sorry for coming very late on this.
>>
>> This series is intended to handle coresight components which resides within CPU cluster.
>> For the cases where cluster is in deepest idle low power mode or all CPUs belonging to cluster
>> are hotplugged off, access to coresight components can not be done.
>>
>> The implementation tried to address in two parts,
>> 1. Using cluster power-domain to know which coresight component belongs to which cluster/CPUs
>> 2. Schedule the task on intended cluster's CPU to make sure the CPU (and cluster) power is
>> ON while coresight component of the cluster is being accessed (using smp_call_function_single()).
>>
>> The use of power-domains in (1) will limit this to PSCI OS-Initiated mode,
>> to have this support on PSCI Platform-Coordinated mode too, probably instead of power-domains,
>> cpu-maps (which also defines the clusters) from device tree is a better choice which will give
>> the information on which CPU belongs to which cluster.
>>
>> (2) ensured that scheduling happened on intended CPU and while the access is in progress, CPU (and
>> cluster) will not enter power down in between.
>>
>>>
>>>> It doesn’t really send IPI to wakeup CPU device (It don’t have
>>>> .power_on/.power_off) callback implemented which gets invoked from
>>>> .runtime_resume callback. This behavior is aligned with the upstream Kernel.
>>>>
>>>
>>> I am quite lost here. Why is it necessary to wake up the CPU? If I understand
>>> correctly, all of this complexity is meant to ensure that the cluster power
>>> domain is enabled before any of the funnel registers are accessed. Is that
>>> correct?
>>
>> Yes, This is to ensure that CPU (and cluster) power is ON while coresight components
>> for same cluster are being accessed.
>>
>>>
>>> If so, and if the cluster domains are already defined as the power domains for
>>> these funnel devices, then they should be requested to power on automatically
>>> before any register access occurs. Is that not the case?
>>
>> Cluster power-domains will be only available for PSCI OS-initiated mode but also
>> will not help for cases where all CPUs in cluster are hotplugged off as hotplugs are
>> platform coordinated.
>>
>> After discussion with our HW team to automatically request power on for coresight
>> component GPR [1] can be used but they seems not working as intended on the existing
>> SoCs and will be available on next generation SoC.
>>
>> [1] https://developer.arm.com/documentation/ddi0480/d/Functional-Overview/Granular-Power-Requestor
>>
>>>
>>> What am I missing in this reasoning?
>>>
>>> The only explanation I can see is that the firmware does not properly honor
>>> power-domain requests coming directly from the OS. I believe that may be the
>>> case, but I would be glad to be proven wrong.
>>>
>>
>> please see below comment for more details, This seems not a firmware issue.
>>
>>>>>
>>>>>> Unlike system-level CoreSight devices, these components share the CPU cluster's
>>>>>> power domain. When the cluster enters low-power mode (LPM), their registers
>>>>>> become inaccessible. Notably, `pm_runtime_get` alone cannot bring the cluster
>>>>>> out of LPM, making standard register access unreliable.
>>>>>>
>>>>>
>>>>> Are these devices the only ones on the system that are uniquely bound to
>>>>> cluster-level power domains? If not, what additional devices share this
>>>>> dependency so that we can understand how they are managed in comparison?
>>>>>
>>>>
>>>> Yes, devices like ETM and TRBE also share this power domain and access constraint.
>>>> Their drivers naturally handle enablement/disablement on the specific CPU they
>>>> belong to (e.g., via hotplug callbacks or existing smp_call_function paths).
>>>
>>> I understand many things are possible to implement, but the key question
>>> remains: why doesn’t the existing OSI mechanism - added specifically to cover
>>> cases like this solve the problem today?
>>>
>>> Especially on platforms with OSI enabled, what concrete limitation forces us
>>> into this additional “wake-up” path instead of relying on OSI to manage the
>>> dependency/power sequencing?
>>
>> + Ulf in loop.
>>
>> Current platforms with OSI enabled, Linux PSCI do not implement the power_on/power_off
>> requests, as far as i know, runtime PM was never meant to implement this part and
>> pm_runtime_get_sync() (from drivers/cpuidle/cpuidle-psci.c) call is only used to convey
>> to cluster power domains about a child CPU/ sub domain being on after it has already
>> been landed in Linux.
>>
>> The standalone invoke of pm_runtime_get_sync() from another CPU do not really turn on/get
>> the CPU (and cluster), as the CPUs either use CPUidle / CPU hotplug paths to enter/exit
>> low power mode.
>>
>> To put it other way,
>> For a hot-plugged off CPU, invoking a pm_runtime_get_sync() won't get the CPU (and make
>> its cluster power domain) ON. In order to turn on the CPU, one has to still request
>> the online of the CPU, say via sysfs command echo 1 > /sys/devices/system/cpu/cpuX/online
>> which would invoke PSCI CPU_ON function and the power domain for CPU gets marked as ON
>> only after CPU already landed in Linux via psci_idle_cpuhp_up() invoking pm_runtime_get_sync().
>>
>> I used specific hotplug example but same applies to idle powered down CPU (or Cluster) too.
>>
>>>
>>>>>> To address this, the series introduces:
>>>>>> - Identifying cluster-bound devices via a new `qcom,cpu-bound-components`
>>>>>>   device tree property.
>>>>>
>>>>> Really, no please.
>>>>>
>>>>
>>>> Our objective is to determine which CoreSight components are physically locate
>>>> within the CPU cluster power domain.
>>>>
>>>> Would it be acceptable to derive this relationship from the existing
>>>> power-domains binding?
>>>
>>> In my opinion, this is not merely a possibility but an explicit expectation.
>>>
>>>> For example, if a Funnel or Replicator node is linked to a power-domains
>>>> entry that specifies a cpumask, the driver could recognize this shared
>>>> dependency and automatically apply the appropriate cluster-aware behavior.
>>>>
>>>
>>> Sure, but for the driver to use that information, we need clear explanation
>>> for all the questions above. In short, why it is not working with the existing
>>> PSCI domain idle support.
>>>
>>
>> Explained above.
>>
>> Thanks,
>> Maulik
> 


