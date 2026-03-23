Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E464EC01A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLTDXBuMarjLK9bkndtm90sNFItNPmFhARTRwjr7SxU=; b=UEc8qZvraHq4cizitwumcleLI5
	zbS3A+4VWdZdg34DBUVz6R2c+APtlP/f+MBtQBY2LcJeyb1xBIa52E8XNBSstUyc7+eaPRS73/l50
	L+GczJhqFOOLgz0V+sj7thMAYp/nSVqFD98LJyQworpxEe/bimOSFDJ090ZKbier7fEQTlbVy4nCk
	f1xf0BmV90LUDHinqS6mcqLfcfsbYFECxgzojvWBL/EQfmUb1vyKTEK7YjpoxYimCqLjX50F7dSRM
	P/rPl6rBT11OnLWRF6uExQryaUev0AXzS1Gp1CdtpVq8WRndV3Gkp5K94XmNAZKoXmoFf/FgRwkpb
	9YyUPyRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bS6-0000000GMeM-1SX2;
	Mon, 23 Mar 2026 09:20:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bS4-0000000GMcr-0fFs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 09:20:01 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tM8A2291969
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 09:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PLTDXBuMarjLK9bkndtm90sNFItNPmFhARTRwjr7SxU=; b=bd3tzLgw2XKHW0eB
	ipSduEB3ZjuxRqg1bj9diqyAor3UB33obLEN6gWa3cIp07r6YIKdw6171CHLRca5
	cORQuDA1RnO+3jbWwjR06l/8yfE31+aPs7khvqvo+8tIUO84PF1OYpGDqKXVD32N
	UeHiZcXrVHbRVfA8+Rc9ggry02Vbz276rzEKr3HM06G2s5AZbpkcJ30VFJ/Ap/N2
	isjZCUN/U5kbKCDocWgca30YCAyNyGC8BrrevJ5HbETS5mr7htzx/CRG3Zsc9k6+
	3n14lR8EMd3ElgtAo2oSO5KUCko9dZUWeHZPqTwoz0/OEOs6I7qGpeqUvvZdYeNU
	uQBSlA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31j7099j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 09:19:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6097ca315bso19887880a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 02:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774257598; x=1774862398; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PLTDXBuMarjLK9bkndtm90sNFItNPmFhARTRwjr7SxU=;
        b=GVeBgSB5Y8/kin0mJAw57nCpG/1vbUhOpjnKyQIA7J36vKzZCCmNin4xyY7xi0w3pT
         mwkSfUnmrDacsqnKENdN4do6Yh6KlGDC4VcnGJimreXzsRXN2bw/Ea1K9OeBlmUNDcnx
         CFcsBLegArGMBDme/0biUNeuV08NtgAJqsnSKKC1DHdqAKD5HCn/ypTe82fSwQhuJuKO
         yITCHbRsJSF4gX5IHjCjIYCJiFDBQLDd7nXwfHfyolPJ9hd30+EOxhZ8jV3dg60SapMk
         1hOIsToNrvJnSaY3iERvQ4erODdMDJJ5jdqnUZhR84pAtvw+s8Uwr9ps37U+BDm8+3JF
         q13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774257598; x=1774862398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PLTDXBuMarjLK9bkndtm90sNFItNPmFhARTRwjr7SxU=;
        b=bIcwLFega7bnjqnkYYW0XKSzRA5sXewgXirNkh6BZ8RVeI1tLY/R2A+ECdYnJSzQlD
         /BwLAN+rolgCy4knJ2HA1HO+Vo3vbRPYmq/gVQJ/lKQscxJgQvLSUNupwqkzEiWjKdGe
         8xPnLrSf3DIsbr6VrRtJdQ1FIKXE3bWJ2gE6QOMFGEnlnC4ZirRE//+s14oPZz470vCl
         zyHTZkyiDIGZj9qjMrUkRIVQwK+0SJNOrg9T4+X2Ivcx6udsAx1RK/6q+uJuw/Wiqho8
         24HPFbpNzJUAk3petnjKLp6ckgdKfTWvPXewa4ixC1Tte6WY35y0hxTa0fgUKlQ5XbKD
         5aLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV43kcUmzw6AFWuowb0sE+/dI8O0jG3ETolB6bogaKlVEDd656dFecfA4++Q1Dry9sGOFikVSr1Mmo2DOBbzrdE@lists.infradead.org
X-Gm-Message-State: AOJu0YxpG76/OV0fL43ZqK/F/5Op/J/t162bQ9j43YN4veBN/w8EvrYm
	1sT+Z0faefGM1GChLarIh9DDN4b9S6KW80g7ngsPrPfWPtLKnWETNQVpgc6d6M00gId5FZD8yLl
	bRvzbBTar3DXqRzA6JKUW2No1QPcepJYMzOb0JL1aLzmVeBCkm8zajecNBhFc6DD5PXw0quTVAD
	eUKQ==
X-Gm-Gg: ATEYQzyR99kOFLymwLJi51Y7q5ZUZ+XRxvzVY4G1bCFnPwBS3G3CtFHZf57MzeEF+LK
	gHDIJdpul+MWrMXSO6mmIR/t+HD3zci+47CQGtLWLls40sJnG2VdbSighiUprnRYNpGJOQr6KEj
	ylKmdES3ADf+ilorQfioUNRC8wKsnnLj/wfZ9ThLnvRms4XYRLSjUZ2iWzD/75mBCLQADuleISF
	SoOFIrtV2lBChqwkTE6p3xORj6Y4H2oh5l66mB0OcFYKpxaKCLpnkS7UQ/BAlGjrThN8R+epBhj
	B2JCK2n+f+sBohL0YEMP/f6swQhVgLuFFNCmLrR3NpV7ZznUnTX5JC1MgMx5BCTYw/8MSlW43CJ
	7Hku88Zm1J2TF6myXvPIJZGkw9WduPbZVV6M50m24u5H18UJjkRs=
X-Received: by 2002:a05:6a20:430c:b0:39c:1f90:2867 with SMTP id adf61e73a8af0-39c1f903186mr1629756637.59.1774257597939;
        Mon, 23 Mar 2026 02:19:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:430c:b0:39c:1f90:2867 with SMTP id adf61e73a8af0-39c1f903186mr1629732637.59.1774257597418;
        Mon, 23 Mar 2026 02:19:57 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74453295a8sm7783715a12.28.2026.03.23.02.19.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 02:19:57 -0700 (PDT)
Message-ID: <9bd9e5c2-fe9a-4329-bf5a-4971ee94faa6@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:49:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: suspend: Remove forcing error from suspend
 finisher
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260316-suspend_ret-v1-1-1a30b110bb7d@oss.qualcomm.com>
 <20260319-tiny-coucal-of-tranquility-ce0bd4@sudeepholla>
 <20260319-ruddy-fierce-honeybee-8fc7b9@sudeepholla>
 <ab0dtAC+bPtc9gdT@lpieralisi>
 <20260320-spirited-gentle-swift-86f50e@sudeepholla>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <20260320-spirited-gentle-swift-86f50e@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ArXjHe9P c=1 sm=1 tr=0 ts=69c105be cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=OBOuRWtVn1CyCTqyaKYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: tOTfccrso9rbdyDTLw6GgthnsByFHLxg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3MSBTYWx0ZWRfX4MgIF8t+YPQA
 u6Ls0oH8LUP5XsdGtrrVMTHjzew4aX1i8DSopAwt/BCEg9N+JYEafneeOlif1XqNEUcsOLfDqgJ
 TJkOVX3tYq1ivAHmYSIsdJvPVLp3wyUHETGvh1ldwRYtA4vybF9aavYEMAHYEqdFRU32TKfJySI
 yhuCV+ipc14FPmK6iSYv0RecYIe/UJJnm8UJZWiGaQpOZ0ydJKBFJJhROrLUGy29AFEsZMccogO
 0cBBnDy4xOX03V5ybYBVgo988QVh+u+Y9XUqs6phYOfxUlRAaoR7B4an3xpjo1eXirdJsjng8C6
 gMWE3Z+wMAaG7zxoq4/ry/bZp0gHM1hJE2vyzzEKPkTuEKZ+H0qzlncS+oCPmjmWGTMxa4QKAlF
 omx8DOc6v4kTr7scfTXONoCpEV/MF287yr0mDUHrXbFqlTEc/25+fA855z8TNjb7pIIDkUurlCI
 y5Sov6cp1Djy5zHXVSw==
X-Proofpoint-GUID: tOTfccrso9rbdyDTLw6GgthnsByFHLxg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_022000_240358_6EB93490 
X-CRM114-Status: GOOD (  40.67  )
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



On 3/20/2026 4:40 PM, Sudeep Holla wrote:
> On Fri, Mar 20, 2026 at 11:13:08AM +0100, Lorenzo Pieralisi wrote:
>> On Thu, Mar 19, 2026 at 04:52:18PM +0000, Sudeep Holla wrote:
>>> On Thu, Mar 19, 2026 at 03:14:01PM +0000, Sudeep Holla wrote:
>>>> On Mon, Mar 16, 2026 at 02:18:18PM +0530, Maulik Shah wrote:
>>>>> Successful cpu_suspend() may not always want to return to cpu_resume() to
>>>>> save the work and latency involved.
>>>>>
>>>>> consider a scenario,
>>>>>
>>>>> when single physical CPU (pCPU) is used on different virtual machines (VMs)
>>>>> as virtual CPUs (vCPUs). VM-x's vCPU can request a powerdown state after
>>>>> saving the context by invoking __cpu_suspend_enter() whereas VM-y's vCPU is
>>>>> requesting a shallower than powerdown state. The hypervisor aggregates to a
>>>>> non powerdown state for pCPU. A wakeup event for VM-x's vCPU may want to
>>>>> resume the execution at the same place instead of jumping to cpu_resume()
>>>>> as the HW never reached till powerdown state which would have lost the
>>>>> context.
>>>>>
>>>>
>>>> Though I don't fully understand the intention/use-case for presenting the
>>>> VMs with powerdown states ....
>>>>
>>>>> While the vCPU of VM-x had latency impact of saving the context in suspend
>>>>> entry path but having the return to same place saves the latency to restore
>>>>> the context in resume path.
>>>>>
>>>>
>>>> I understand the exit-latency aspect, though the register set involved is not
>>>> very large unless the driver notifier list is sizable on some platforms. This
>>>> is typically the case in Platform Coordinated mode.
>>>>
>>>>> consider another scenario,
>>>>>
>>>>> Newer CPUs include a feature called “powerdown abandon”. The feature is
>>>>> based on the observation that events like GIC wakeups have a high
>>>>> likelihood of happening while the CPU is in the middle of its powerdown
>>>>> sequence (at wfi). Older CPUs will powerdown and immediately power back
>>>>> up when this happens. The newer CPUs will “give up” mid way through if
>>>>> no context has been lost yet. This is possible as the powerdown operation
>>>>> is lengthy and a large part of it does not lose context [1].
>>>>>
>>>>
>>>> When you say "large part" above, do you mean that none of the CPU context, as
>>>> visible to software, is lost? Otherwise, we would need to discuss that "large
>>>> part" in more detail. From the kernel point of view, this is a simple boolean:
>>>> context is either lost or retained. Anything in between is not valid, as we do
>>>> not support partial context loss.
>>>>
>>>>> As the wakeup arrived after SW powerdown is done but before HW is fully
>>>>> powered down. From SW view this is still a successful entry to suspend
>>>>> and since the HW did not loose the context there is no reason to return at
>>>>> entry address cpu_resume() to restore the context.
>>>>>
>>>>
>>>> Yes, that may be worth considering from an optimization perspective. However,
>>>> if the hardware aborts the transition, then returning success regardless of the
>>>> software state should still be counted as a failure. That would keep the
>>>> cpuidle entry statistics more accurate than returning success. And it is
>>>> a failure as the OS expected to enter that powerdown state but there was
>>>> as H/W abort.
>>>>
>>>>> Remove forcing the failure at kernel if the execution does not resume at
>>>>> cpu_resume() as kernel has no reason to treat such returns as failures
>>>>> when the firmware has already filled in return as success.
>>>>>
>>>>
>>>> This is not possible with the current PSCI spec:
>>>> "Powerdown states do not return on success because restart is through the
>>>> entry point address at wakeup."
>>>>
>>>
>>> OK, my bad. Sorry for that.
>>> For some reason, I read "do not return" as "must not return".
>>>
>>> The spec allows this:
>>>   |  The caller must not assume that a powerdown request will return using the
>>>   |  specified entry point address. The powerdown request might not complete due,
>>>   |  for example, to pending interrupts. It is also possible that, because of
>>>   |  coordination with other cores, the actual state entered is shallower
>>>   |  than the one requested. Because of this it is possible for an
>>>   |  implementation to downgrade the powerdown state request to a standby
>>>   |  state. In the case of a downgrade to standby, the implementation
>>>   |  returns at the instruction following the PSCI call, at the Exception
>>>   |  level of the caller, instead of returning by the specified entry point
>>>   |  address. The return code in this case is SUCCESS. In the case of an
>>>   |  early return due to a pending wakeup event, the implementation can
>>>   |  return at the next instruction, with a return code of SUCCESS, or
>>>   |  resume at the specified entry point address
>>>
>>> So we need to dig and check if there was any reason for returning "NOT
>>> SUPPORTED" when the call returned success.
>>
>> Because we have no clue whatsoever about what happened. We need to get
>> back to the cpu_suspend() caller and either say "we entered state X instead
>> of Y" or report a failure (because an interrupted power down sequence *is* a
>> failure for Linux - unless we want to make things up), we just can't know so
>> to me the code seems good as it is (we can debate about the error code, yes
>> but the gist does not change).
>>
> 
> Completely agreed. The current code clearly survives a successful return, so,
> in my opinion, nothing is broken. It is really just a matter of exploring
> whether there is a better way to express this error condition. I doubt that is
> possible, since it is either success or error; it cannot be both.
> 
> Just to clarify, my earlier comment was purely about the error code, not about
> success versus error.
> 
>> Is that we want to tell CPUidle that entering the state was successful even if
>> the power down sequence was interrupted or the state demoted ?
> 
> That sounds like the ask to me, but that would be incorrect.
> 
>> That's tantamount to lying IMO and would skew the power stats, no ?
>>
> 
> Yes, I agree.
> 
>> Let me know, I am just trying to understand this patch's goal.
>>
> 
> I will let Maulik present his opinion, as I am aligned with you, Lorenzo.
> 

Thank you for the review.

The goal is to optimize the exit latency even if register set involved to restore
may not be of considerable size, saving scales up with multiple CPUs and multiple
VMs running.

This is achieved when the cpu resumes the execution at the same place,
however with this, i am seeing that idle states are rejected because of forcing the
error from Linux.

Consider an example scenario listed in commit text for multiple virtual machines,

VM‑X: Power‑Down ─┐
                  ├─ Hypervisor Aggregation to Retention
VM‑Y: Retention ──┘

A resume to the same place is today treated as failure in VM-X's cpuidle statistics,
A cpuidle governor may then become less aggressive towards next entry to power down state
as it has seen a error for the previously entered mode.

Such a scenario should not impact VM-X to re-select a power down state for CPU,
for this reason the VM-X need to treat the resume at the same place as "success",
when the firmware says so.

Thanks,
Maulik

