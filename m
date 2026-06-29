Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3845BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 05:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lL5g0SOp837txyx/JxxlugcmGgZ4G3nCFab4QeyhW8M=; b=LrHSAawLkG0fDeFugaAUl2scN3
	XLczXtJrv/1X3YZG5mg2pp/0aYlIA3hHvOXZG89mG2agsbibz0bbO0KPADC99WABkWoD9nvd5kd0M
	mOQfxMiFyMqX92+5bbNNXawWUjql2Lc8fq7yXvyAtA9QWBb0ZuQCQ02tep6DQPAa/RERGz90AoagL
	wJxLgAX0oc+JM3LBU2VRHYzNCtUqoR/P6dyadEkbNFGyaRAM13yUkpfoMy+ZosW+SYdKW1vMR+7xt
	cZXwfSUv/h98LQ+/R41QD1GcuoZVzWzXRe4/+rnp9TGXzz5qBsGlx2zuWeWuVhpWhwjkHzrU7qZEy
	FUf8mCvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we4yY-0000000DjKU-2GPh;
	Mon, 29 Jun 2026 05:56:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we4yU-0000000DjJh-49h5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 05:56:09 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NEH51729584
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 05:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lL5g0SOp837txyx/JxxlugcmGgZ4G3nCFab4QeyhW8M=; b=kQXHEg9a+fNPuipS
	9V91IUJn87aFL9Q9DdGquiQbvqkba4Lfm1qHDtd+5xCCLQUTeI2df28pwJWYZnMR
	oAOvV2juObyQl6Ali1aFka1AbQjULowB1dhywLLhhAhvNN9uZ0qgIPoZ+RpzWNL5
	XRPs94u5j472OvvX/spwsS8DzqqW12bDPa8wi6Loaiph6ZNcQqH+azrjtbPoQQU7
	Uh1jy3PQajJ0A/iFjxlAmppQQqd6BgTujNwu+s8tklgYSIZ4yNf8ToL6roeda64K
	rrrQMIRolZtLDkl7v8UqIEpDbA2czyJ98zgIs2pYCYMd9HvuEE8pRPEzZh3tPcJc
	WIRGDw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27t7vn6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 05:56:05 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37fb9d7b524so1387546a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 22:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782712565; x=1783317365; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lL5g0SOp837txyx/JxxlugcmGgZ4G3nCFab4QeyhW8M=;
        b=HrzptUhoQS/SJrpUNWbgzL1insJldcmw5ldCv8n0FIUK/vXHjGwsdPoZc3TB/FL4pG
         xPPZYYptXe43bxpjA+iJ6EeaEM6MozqRJbKnkk6ZljV2kvfVqRkpcVWQEtS7SYGRzgJI
         P4Ah3fcdUTmBtQfS/ltG+Uyr0auPMl4C4ieTBW4pdssh+G1txqp5yO1eMc3wd6qi4lBA
         J/9TAOXR0/HlHaqP3ZIiRII2TBZrENx3um/MxSTdjezpBy5d90hcR+zwtQm1NdSWoz7A
         9Kee2XG9NVn7iJI50ZpigJukade0ffKAbvofemzAUeOJhQpSYastL8CQqjtHlaPspKwb
         fTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782712565; x=1783317365;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lL5g0SOp837txyx/JxxlugcmGgZ4G3nCFab4QeyhW8M=;
        b=rTs69OrDt+gbzzxALg810ioiJeILHjgXmZGR9fWK3F9jDuMK518HMOmGSpG2CpLg7O
         uSZbKTIN+HIaonB863Gln/ZFg98Q+jPb9YcvlemOfj2wsfgtZP/mwRLroIGZYGKWKMTV
         1rNaRfRtKtrmAS3nXX9X5PAdtRT5TZBKNJvXX3zk0+HmX2lXLe24DTLGLGr8cMGohgOX
         SEPfC3BoNoF96QJtQTp04EqBRX2OqZegbGzBG1hNWsFRdvdGh8s3y0BUkmHzgYpTRxTG
         0Insxp3TgTSAOcMKOUfdiIN6KkPGuQCD8hUthLbe05eZ8BNyFm/xD15+S9OzAw2dGMB3
         FiWg==
X-Forwarded-Encrypted: i=1; AFNElJ82XyXADS7QKMIteF9HjGBUxWoG4sCGnATQXQehLL6YZSXJ9IYByz6KAdg/kZhGIPzpcuqx+XVcmeAULtA10wkq@lists.infradead.org
X-Gm-Message-State: AOJu0YxSYSidkmnvbUWG5aD1IlSleJEmcP3Q616Uet6tVYShRchbYtt/
	2F+6u2sFP7JLG4SOSn6i2L0YeqN3z17RjfxQeTeihzDtrzkSuUiUZP9MPwjRex7QN1QpSmOFitR
	dqPf9lmuOvZ9XDUbX22JlAF57iJlTZq1jpSImlzhpzg61gDerc1FfBfxhYCJj6aUnAUzp9VfMDM
	Dw6A==
X-Gm-Gg: AfdE7cmIt9H5+jtkGBKZCzEgk1QkxlgBvXihHAZsPaj3QEhPxQv2ExBASosjkNJE89A
	RFov+kQeohlR8Ub4z1NXlKkGVdBfeQwoOnWSTmAI4adWzEerCf56Jx0x65IEE4sy/rTaiHu3sWh
	BbknXfLqndoPZKVMICujFKsVprvGdz3e7p6lummsfsjvPD1yBej6wa8oAycgK98gb1Df2jwH/xW
	4ebq0V5eisv0DFAdCoglv/g3BXW7pH/JfGvmyhGSP44l1U5tqVJK73JwUV3vETEm3mWYBoZdzoH
	psXbuUjojA0eqRtTwQjPP/K0iaRRm8Lag2b5zMjarWN3r2KGbQMRZIwnJkmGFcb56sgMtTcC9ZR
	9P8luJAmyrIaCc8bMHkHaa/CJbZc17VAoJmQS4RRuNqtT9yKg5DnOb8Xp5ExDGOV1k2ksjl+hTY
	7a+kinFspt
X-Received: by 2002:a05:6300:220d:b0:3bf:a698:ce4d with SMTP id adf61e73a8af0-3bfa69914ccmr1239037637.54.1782712565067;
        Sun, 28 Jun 2026 22:56:05 -0700 (PDT)
X-Received: by 2002:a05:6300:220d:b0:3bf:a698:ce4d with SMTP id adf61e73a8af0-3bfa69914ccmr1239006637.54.1782712564508;
        Sun, 28 Jun 2026 22:56:04 -0700 (PDT)
Received: from [10.133.33.33] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bcc91f6dsm7072662a12.27.2026.06.28.22.55.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:56:04 -0700 (PDT)
Message-ID: <1714ad84-18cf-48d4-973d-b5e454d27c6c@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:55:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] coresight: Add CPU cluster funnel/replicator/tmc
 support
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
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <11a01108-63da-4317-a547-5977a469a7dc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0OCBTYWx0ZWRfX7+Zi4J934btO
 17zZWTnzsXGGtZTx77bXyuqA8AzBr7FyxXD3g+f3NSldcH1XWxNnRIPWxtry0rpiZhDJQYmuQu+
 p2VZh0MzZ1Org+afu6/6bWHV0vU9HKIbyFfgeCd13riyxVY2N2D2m3IWJZq4FUyfW13aNtxyXHT
 BP4DgAGVomfuIBv7XUCG3RcI+8r124gxamu1j3DaptDCTa/eFhh4ut162SrxVDFiPax4Silquyw
 MK9cl7W2dFjVPSaT1r70594AUDxXGRsYFpWswptJXTMlzVhdsn6UpJIGSRRK1Vs+LBn+f5LJxJ+
 +ECc8QnLVczBwAm4Qgpnasekd7IKHTnr3NfpIOV05/ulteJmgIqkSmTpR3eQ/d6zXZWyLM2by/Y
 tlV21qq2j8enbL4KnVG3ulhH2qmMGSPTS7AO1njMY6+R+M1QXJ+OJdxZcHsNXKRUXNkS8kEBfB2
 geFphKslv9voW1dfVCA==
X-Proofpoint-GUID: z6FNNP9wL_vsBxiRvNRaRj2hRTW8QSPY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0OCBTYWx0ZWRfXw3+xr5VsFB1l
 R/tk9TI40XTYUi+14GMG5u+xzBMNt2kwj1RSYCV7tV/UdWkKWRt6OzwUdzzHDZj39dDuu2jPzyf
 LrwjRZ2l5ggNYVLNU+zK4WgLbAh0qvY=
X-Proofpoint-ORIG-GUID: z6FNNP9wL_vsBxiRvNRaRj2hRTW8QSPY
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a4208f5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=-HkNxc-VA3X1G4HRPRMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1011 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_225607_040012_B2900D67 
X-CRM114-Status: GOOD (  51.85  )
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

Gentle reminder on this patch. Any feedback would be appreciated.

Thanks,
Yuanfang.

On 5/25/2026 9:17 PM, Maulik Shah (mkshah) wrote:
> 
> 
> On 12/19/2025 3:51 PM, Sudeep Holla wrote:
>> On Fri, Dec 19, 2025 at 10:13:14AM +0800, yuanfang zhang wrote:
>>>
>>>
>>> On 12/18/2025 7:33 PM, Sudeep Holla wrote:
>>>> On Thu, Dec 18, 2025 at 12:09:40AM -0800, Yuanfang Zhang wrote:
>>>>> This patch series adds support for CoreSight components local to CPU clusters,
>>>>> including funnel, replicator, and TMC, which reside within CPU cluster power
>>>>> domains. These components require special handling due to power domain
>>>>> constraints.
>>>>>
>>>>
>>>> Could you clarify why PSCI-based power domains associated with clusters in
>>>> domain-idle-states cannot address these requirements, given that PSCI CPU-idle
>>>> OSI mode was originally intended to support them? My understanding of this
>>>> patch series is that OSI mode is unable to do so, which, if accurate, appears
>>>> to be a flaw that should be corrected.
>>>
>>> It is due to the particular characteristics of the CPU cluster power
>>> domain.Runtime PM for CPU devices works little different, it is mostly used
>>> to manage hierarchicalCPU topology (PSCI OSI mode) to talk with genpd
>>> framework to manage the last CPU handling in cluster.
>>
>> That is indeed the intended design. Could you clarify which specific
>> characteristics differentiate it here?
> 
> Sorry for coming very late on this.
> 
> This series is intended to handle coresight components which resides within CPU cluster.
> For the cases where cluster is in deepest idle low power mode or all CPUs belonging to cluster
> are hotplugged off, access to coresight components can not be done.
> 
> The implementation tried to address in two parts,
> 1. Using cluster power-domain to know which coresight component belongs to which cluster/CPUs
> 2. Schedule the task on intended cluster's CPU to make sure the CPU (and cluster) power is
> ON while coresight component of the cluster is being accessed (using smp_call_function_single()).
> 
> The use of power-domains in (1) will limit this to PSCI OS-Initiated mode,
> to have this support on PSCI Platform-Coordinated mode too, probably instead of power-domains,
> cpu-maps (which also defines the clusters) from device tree is a better choice which will give
> the information on which CPU belongs to which cluster.
> 
> (2) ensured that scheduling happened on intended CPU and while the access is in progress, CPU (and
> cluster) will not enter power down in between.
> 
>>
>>> It doesn’t really send IPI to wakeup CPU device (It don’t have
>>> .power_on/.power_off) callback implemented which gets invoked from
>>> .runtime_resume callback. This behavior is aligned with the upstream Kernel.
>>>
>>
>> I am quite lost here. Why is it necessary to wake up the CPU? If I understand
>> correctly, all of this complexity is meant to ensure that the cluster power
>> domain is enabled before any of the funnel registers are accessed. Is that
>> correct?
> 
> Yes, This is to ensure that CPU (and cluster) power is ON while coresight components
> for same cluster are being accessed.
> 
>>
>> If so, and if the cluster domains are already defined as the power domains for
>> these funnel devices, then they should be requested to power on automatically
>> before any register access occurs. Is that not the case?
> 
> Cluster power-domains will be only available for PSCI OS-initiated mode but also
> will not help for cases where all CPUs in cluster are hotplugged off as hotplugs are
> platform coordinated.
> 
> After discussion with our HW team to automatically request power on for coresight
> component GPR [1] can be used but they seems not working as intended on the existing
> SoCs and will be available on next generation SoC.
> 
> [1] https://developer.arm.com/documentation/ddi0480/d/Functional-Overview/Granular-Power-Requestor
> 
>>
>> What am I missing in this reasoning?
>>
>> The only explanation I can see is that the firmware does not properly honor
>> power-domain requests coming directly from the OS. I believe that may be the
>> case, but I would be glad to be proven wrong.
>>
> 
> please see below comment for more details, This seems not a firmware issue.
> 
>>>>
>>>>> Unlike system-level CoreSight devices, these components share the CPU cluster's
>>>>> power domain. When the cluster enters low-power mode (LPM), their registers
>>>>> become inaccessible. Notably, `pm_runtime_get` alone cannot bring the cluster
>>>>> out of LPM, making standard register access unreliable.
>>>>>
>>>>
>>>> Are these devices the only ones on the system that are uniquely bound to
>>>> cluster-level power domains? If not, what additional devices share this
>>>> dependency so that we can understand how they are managed in comparison?
>>>>
>>>
>>> Yes, devices like ETM and TRBE also share this power domain and access constraint.
>>> Their drivers naturally handle enablement/disablement on the specific CPU they
>>> belong to (e.g., via hotplug callbacks or existing smp_call_function paths).
>>
>> I understand many things are possible to implement, but the key question
>> remains: why doesn’t the existing OSI mechanism - added specifically to cover
>> cases like this solve the problem today?
>>
>> Especially on platforms with OSI enabled, what concrete limitation forces us
>> into this additional “wake-up” path instead of relying on OSI to manage the
>> dependency/power sequencing?
> 
> + Ulf in loop.
> 
> Current platforms with OSI enabled, Linux PSCI do not implement the power_on/power_off
> requests, as far as i know, runtime PM was never meant to implement this part and
> pm_runtime_get_sync() (from drivers/cpuidle/cpuidle-psci.c) call is only used to convey
> to cluster power domains about a child CPU/ sub domain being on after it has already
> been landed in Linux.
> 
> The standalone invoke of pm_runtime_get_sync() from another CPU do not really turn on/get
> the CPU (and cluster), as the CPUs either use CPUidle / CPU hotplug paths to enter/exit
> low power mode.
> 
> To put it other way,
> For a hot-plugged off CPU, invoking a pm_runtime_get_sync() won't get the CPU (and make
> its cluster power domain) ON. In order to turn on the CPU, one has to still request
> the online of the CPU, say via sysfs command echo 1 > /sys/devices/system/cpu/cpuX/online
> which would invoke PSCI CPU_ON function and the power domain for CPU gets marked as ON
> only after CPU already landed in Linux via psci_idle_cpuhp_up() invoking pm_runtime_get_sync().
> 
> I used specific hotplug example but same applies to idle powered down CPU (or Cluster) too.
> 
>>
>>>>> To address this, the series introduces:
>>>>> - Identifying cluster-bound devices via a new `qcom,cpu-bound-components`
>>>>>   device tree property.
>>>>
>>>> Really, no please.
>>>>
>>>
>>> Our objective is to determine which CoreSight components are physically locate
>>> within the CPU cluster power domain.
>>>
>>> Would it be acceptable to derive this relationship from the existing
>>> power-domains binding?
>>
>> In my opinion, this is not merely a possibility but an explicit expectation.
>>
>>> For example, if a Funnel or Replicator node is linked to a power-domains
>>> entry that specifies a cpumask, the driver could recognize this shared
>>> dependency and automatically apply the appropriate cluster-aware behavior.
>>>
>>
>> Sure, but for the driver to use that information, we need clear explanation
>> for all the questions above. In short, why it is not working with the existing
>> PSCI domain idle support.
>>
> 
> Explained above.
> 
> Thanks,
> Maulik


