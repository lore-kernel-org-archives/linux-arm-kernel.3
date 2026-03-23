Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6C7EC01BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 10:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MROAkRZjcjP9sLd0z9fFYejUCc43AxH+rYW0uoDAsCo=; b=cS0hJP3IUDipVwYJmcFhR8d6Ki
	J9G8jyDWGVt0hc30HVwCnQk2cgxzSxkh5wsaJoFZuDOdBqjwf70ivU3Ey71FYViJn5b2tTpW1d61d
	1m+tA+o61/zddaA02pgHukQbi/fz/n76RWEQHKCm99Kg0lQ0inV9TB32z2cVX+XvADmPw0QQBPRb3
	vR6kAEA8It5ArwBALQt69uT80DBArTrPYcBzpXk2mfBrmxcyXjDLHk5R+BHbOsLC5Pp/F1qZSXaq5
	YlNVajDu7G0A9XH4A6yOAbQlF9F07Bq1FpzV7SoZgLlguYUFfLNelHW3O7kwcTA2qpPCwFzJklwrM
	LyOVvhVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cYU-0000000GWCY-44rz;
	Mon, 23 Mar 2026 10:30:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cYR-0000000GWBx-2PoH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 10:30:40 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N83iKB1364063
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 10:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MROAkRZjcjP9sLd0z9fFYejUCc43AxH+rYW0uoDAsCo=; b=o8QyRy+c+UA/P3tO
	V5+b6c5PN7REtH9pSlnDcTkehbuhGo85D5G55B8c0S2boGM0Nj1xDBAq5rJPfk9O
	VhqhBLCE1KG2SaV6Qv9rIZmyx+EzaguCPjoJlB2ndwUFtr41KRuhRrKiMO6Tp3r9
	3cqXmR/UljsklQAe/RBAbm4vqPtRu4TP26MQvuwimq++1MTxAhcd4CYo+cRfya/x
	D3lcBUBYu4iA1jOBWmBqq0I5TqrYKvEIehYMNSo2HIXhRIO9KC2F+RWQtqT7+ZJp
	/3xtHSn+eQA2va2JafD9ouL9RZ7USemFDG6iKIgm1VJh7Nch4kB+WF7bEFUAFQoQ
	rDPXqg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p78hsm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 10:30:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c4664f75fso636876b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 03:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774261837; x=1774866637; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MROAkRZjcjP9sLd0z9fFYejUCc43AxH+rYW0uoDAsCo=;
        b=dGeGj+gb+hdIvPc0qhlg02NcmOBMMBJvfjZ/eYPHyX6+c8rm2rdDX0O2ngQrlHndS7
         kVEJwN5KK4P9IBVr8DRPfkWgPO+1fEfKOW80Y/2zY8qjoWDBgXR/az8KhnwlT4/yCja6
         a16GSDWG2VvabIw7F9su/KN4sCN1MlW4PX0xbn/JDHA/zYReFk9D6s867r78a0l481g1
         jnnDGsglwhP211PnzzdrlhZdR7PHresfXDaERSEOSECnEYV83pJ+hU5dmN+YOerehdtk
         R6SlHlt2CZPYzo0MCRLC0FHfifgLdWNVgOfhHEwVLDaaVqITFBTlUElU2f/m05tr29DI
         aljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261837; x=1774866637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MROAkRZjcjP9sLd0z9fFYejUCc43AxH+rYW0uoDAsCo=;
        b=fmgQagJ3NsG46OW6p8W7ewBf6tOQUig00D51swoj0/daMpK58qUGeLqo2j1nsVtEA+
         UYm4AXfmv9Jsec2rSVXoJr1AHGXlpmNph1Jf9wnmcLUmiVx9Mewf8h/Qufdw+FbC6iXB
         5w9TSbN8ArWYnQofgHenkYYleCDQJWRJLcF6Ycw4Bz4iKMvRndw0ipmKY2ElcD3vz09U
         X4pA09h5VA9meC1ArECzSiH2NwZMMA2OU1no2MA06lHaHflMKz8x6rUnQRh88xe25WAw
         LSCxGoF2Y4fv/EoxnH0jJxQtdUaeDPCU8jPCQvQQVCvmyeyx23K2lFBj0zlhGNwOVo4p
         NC/g==
X-Forwarded-Encrypted: i=1; AJvYcCX2Wbl8zEwwse1hq13h3fzqJTYqH6WPE95ePjyHGvyge3kNZXmtVcKkcYXviK6YnGb87BswpZrkw77PDP4qbZ2o@lists.infradead.org
X-Gm-Message-State: AOJu0YzMkFUHL8lUVtfIym5HKQBFXa5Cwvo50ZY9bjCxWEwfyva12zKh
	n1ku2Y25dGS+i7LOuqVrOKKsvJ1bHaKZ4+7BrbaD14FhHDdobqa9R4tyXH1t19io7xfDew9eZV1
	mYX1ha9f4ImLVwk8liER41/6TvJfn3NnAS8Ly9P/85WUlOdeWYrj8Di05qTTbTp4f9yXESLd9SA
	eW9A==
X-Gm-Gg: ATEYQzydrInBOCQtSGOVaAp21hGa2DscDEAZpYFO/QOWG6+WxCwOG+p7UINmJB/qJks
	LH8E1nhXiZlVpY+MfSrJulsOji+1W3ZW/bCKlixzKdwifxnm8RIHYvgxxW4NKb+j1N6CNjS5o4x
	oxsfTbPUq3KquHLjxB6h949QQY+tNtod2RgZDppK3EXtZumbwzvaPmkGiwPZqlSTHDcYMNU8cF3
	ZVF6qmmsr9O45vGA7vmngkofeChK1gfQFm1owI+1U8kfgj5+axuKMpLB0TT8bXoGKqWCNBUQ9IO
	51GFQ3hWC7INLzM7SN0hW0WIovG1OPECKOCwVXNUgmSR6tRjY2EsScqoubSVmhopZolHI5lnzKj
	dn3NAGCARgtQEWqx5wZZZkDeqVEOXjZ/ycg7L++lLR8biRvXvWTs=
X-Received: by 2002:a05:6a00:90a9:b0:829:7d1c:29ff with SMTP id d2e1a72fcca58-82a8c3bbe78mr8823401b3a.57.1774261837372;
        Mon, 23 Mar 2026 03:30:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:90a9:b0:829:7d1c:29ff with SMTP id d2e1a72fcca58-82a8c3bbe78mr8823381b3a.57.1774261836829;
        Mon, 23 Mar 2026 03:30:36 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b04222f42sm10764014b3a.61.2026.03.23.03.30.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:30:36 -0700 (PDT)
Message-ID: <0226804b-daea-4d8c-8b68-d3894a5f323e@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:00:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: suspend: Remove forcing error from suspend
 finisher
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260316-suspend_ret-v1-1-1a30b110bb7d@oss.qualcomm.com>
 <20260319-tiny-coucal-of-tranquility-ce0bd4@sudeepholla>
 <20260319-ruddy-fierce-honeybee-8fc7b9@sudeepholla>
 <ab0dtAC+bPtc9gdT@lpieralisi>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <ab0dtAC+bPtc9gdT@lpieralisi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c1164e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=xgOq5MlI_ZTffzCLE8EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: yNyFmkBu66KVrk3QHadUBp2snYZMP7VP
X-Proofpoint-GUID: yNyFmkBu66KVrk3QHadUBp2snYZMP7VP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MSBTYWx0ZWRfX+dsTD/xkXl+p
 xezH4BiuXn7Ncy30tdbWctvtayuZ5y1xhuhjif2XAblBCdgk/kRZt6HGC3hSGmoACDZpSyYA0ww
 KeJkDoD8ozFpSmZfF3Hlo/lSYItWqaA8xAObMVL5XMJqlTqn9e0E5ox18k7NAzsJ21gq0dZTPIs
 gb9Q8RfNkPNpQdVE95o7Uea4z0zd8bEgRY8MAVrnaEeEHvQmNl66a7w1xXHTu4fKzM1coAU1FRV
 n0ubz1LZ3h+uVrCDX11I2mYx1g5LgtCa2NzTOdsL3nrySjcUvbnP8QJOyP9lUM69nTBIiBoajFl
 7b5H8txWMApZNZNkssQolbsoKc5Qw+CtF3gRB/KlQrupml3cW2w0yNLtcSVjb/mhDik6CayypYV
 UhCUJ9RpmPcavpZkXl+t7Z/1xjPSAUL1EUHNxgCITK5QH9hA51XL+Y7Y+FY1PtMrQHHLf98qah5
 GJvSOCqwenszH/HhMbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_033039_741703_C15168EB 
X-CRM114-Status: GOOD (  40.85  )
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



On 3/20/2026 3:43 PM, Lorenzo Pieralisi wrote:
> On Thu, Mar 19, 2026 at 04:52:18PM +0000, Sudeep Holla wrote:
>> On Thu, Mar 19, 2026 at 03:14:01PM +0000, Sudeep Holla wrote:
>>> On Mon, Mar 16, 2026 at 02:18:18PM +0530, Maulik Shah wrote:
>>>> Successful cpu_suspend() may not always want to return to cpu_resume() to
>>>> save the work and latency involved.
>>>>
>>>> consider a scenario,
>>>>
>>>> when single physical CPU (pCPU) is used on different virtual machines (VMs)
>>>> as virtual CPUs (vCPUs). VM-x's vCPU can request a powerdown state after
>>>> saving the context by invoking __cpu_suspend_enter() whereas VM-y's vCPU is
>>>> requesting a shallower than powerdown state. The hypervisor aggregates to a
>>>> non powerdown state for pCPU. A wakeup event for VM-x's vCPU may want to
>>>> resume the execution at the same place instead of jumping to cpu_resume()
>>>> as the HW never reached till powerdown state which would have lost the
>>>> context.
>>>>
>>>
>>> Though I don't fully understand the intention/use-case for presenting the
>>> VMs with powerdown states ....
>>>
>>>> While the vCPU of VM-x had latency impact of saving the context in suspend
>>>> entry path but having the return to same place saves the latency to restore
>>>> the context in resume path.
>>>>
>>>
>>> I understand the exit-latency aspect, though the register set involved is not
>>> very large unless the driver notifier list is sizable on some platforms. This
>>> is typically the case in Platform Coordinated mode.
>>>
>>>> consider another scenario,
>>>>
>>>> Newer CPUs include a feature called “powerdown abandon”. The feature is
>>>> based on the observation that events like GIC wakeups have a high
>>>> likelihood of happening while the CPU is in the middle of its powerdown
>>>> sequence (at wfi). Older CPUs will powerdown and immediately power back
>>>> up when this happens. The newer CPUs will “give up” mid way through if
>>>> no context has been lost yet. This is possible as the powerdown operation
>>>> is lengthy and a large part of it does not lose context [1].
>>>>
>>>
>>> When you say "large part" above, do you mean that none of the CPU context, as
>>> visible to software, is lost? Otherwise, we would need to discuss that "large
>>> part" in more detail. From the kernel point of view, this is a simple boolean:
>>> context is either lost or retained. Anything in between is not valid, as we do
>>> not support partial context loss.
>>>
>>>> As the wakeup arrived after SW powerdown is done but before HW is fully
>>>> powered down. From SW view this is still a successful entry to suspend
>>>> and since the HW did not loose the context there is no reason to return at
>>>> entry address cpu_resume() to restore the context.
>>>>
>>>
>>> Yes, that may be worth considering from an optimization perspective. However,
>>> if the hardware aborts the transition, then returning success regardless of the
>>> software state should still be counted as a failure. That would keep the
>>> cpuidle entry statistics more accurate than returning success. And it is
>>> a failure as the OS expected to enter that powerdown state but there was
>>> as H/W abort.
>>>
>>>> Remove forcing the failure at kernel if the execution does not resume at
>>>> cpu_resume() as kernel has no reason to treat such returns as failures
>>>> when the firmware has already filled in return as success.
>>>>
>>>
>>> This is not possible with the current PSCI spec:
>>> "Powerdown states do not return on success because restart is through the
>>> entry point address at wakeup."
>>>
>>
>> OK, my bad. Sorry for that.
>> For some reason, I read "do not return" as "must not return".
>>
>> The spec allows this:
>>   |  The caller must not assume that a powerdown request will return using the
>>   |  specified entry point address. The powerdown request might not complete due,
>>   |  for example, to pending interrupts. It is also possible that, because of
>>   |  coordination with other cores, the actual state entered is shallower
>>   |  than the one requested. Because of this it is possible for an
>>   |  implementation to downgrade the powerdown state request to a standby
>>   |  state. In the case of a downgrade to standby, the implementation
>>   |  returns at the instruction following the PSCI call, at the Exception
>>   |  level of the caller, instead of returning by the specified entry point
>>   |  address. The return code in this case is SUCCESS. In the case of an
>>   |  early return due to a pending wakeup event, the implementation can
>>   |  return at the next instruction, with a return code of SUCCESS, or
>>   |  resume at the specified entry point address
>>
>> So we need to dig and check if there was any reason for returning "NOT
>> SUPPORTED" when the call returned success.
> 
> Because we have no clue whatsoever about what happened. We need to get
> back to the cpu_suspend() caller and either say "we entered state X instead
> of Y" or report a failure (because an interrupted power down sequence *is* a
> failure for Linux - unless we want to make things up), we just can't know so
> to me the code seems good as it is (we can debate about the error code, yes
> but the gist does not change).
> 
> Is that we want to tell CPUidle that entering the state was successful even if
> the power down sequence was interrupted or the state demoted ? That's
> tantamount to lying IMO and would skew the power stats, no ?

In this case, The power down sequence is interrupted in HW, no SW involved here.

when the SW is at "wfi" instruction (last instruction) and the core power down sequence is in progress
in HW, the wakeup interrupt arrives at the this point (before power down is completed).

Older core would power down and immediately power up back, since power down is completed
(without staying at power down state) and resume started from reset vector, firmware makes
jump at entry address and Linux accounted this as "success" and CPUidle increments the "above"
count seeing the less residency in selected state.

Newer cpus with "powerdown abandon" feature, same is today accounted as failure by Linux and
"rejected" count in CPUidle would increment just because core did not finish the power down in HW
and did not resume execution from reset vector / entry address.

In both older/newer cores case, SW reached till last point of execution (wfi() instruction) without
any aborts/wake ups but one is telling CPUidle a success and other is telling a failure.

For the state demoted part, 

The success filled by firmware along with the return to the same place (instead of entry address) is
kind of indication that we entered demoted state-X instead of state-Y.

From the spec, platform-coordinated mode power state parameter point,

 | In platform-coordinated mode, the semantic expressed by the caller through the power state parameter is
 | not a mandatory requirement to enter the specific state. Instead, the power state parameter indicates
 | the deepest state the caller can tolerate.

Assuming CPU requested deepest power down state-Y which got demoted to shallower retention state-X, such
demotion are not really a failure as it was not mandatory to enter state-Y, it was only a indication of
tolerance till state-Y to firmware.

Thanks,
Maulik

> 
> Let me know, I am just trying to understand this patch's goal.
> 
> Thanks,
> Lorenzo


