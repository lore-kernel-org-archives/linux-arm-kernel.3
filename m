Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7C8F327B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 07:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRiTo12BdDvwLAp8x610f1HuZUrz/WqZhS+sKP93ieY=; b=ATPCUQWFZziX8Zy8m1fLetNl8n
	H7hLYfCTM1TeVLqDRgT7KATZawmBGXpTnwCoyqrXwbU5ICb2JRC8WRcEk0JqKEJ/+siVgGOxEwYk5
	zZlbiz8YOh2zvSPFZ9zOz7zjbMtMx/JkrJynypFodEHNIxX1gjYq/+gLpwYpAV/oRYJ/o3VYaOvkW
	DQqb99l772m3ynzxq5p3xPE+fR9VHGcoAj90TeIWNc/BBVhW3vL/anQt8PJLxsj2tTRxdZND4rP93
	WrwTfb73xKA0sLdr1boYe/2fjz970EF28YyDvQOAHrIPJ59N/H5TNJeC1OrMFb5qaurwZbJNBc8c3
	+/nLKPOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5q2-00000008D2M-48Gi;
	Tue, 21 Apr 2026 07:48:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5q0-00000008D1b-0Bh5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 07:48:05 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L5dgce1011924
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 07:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LRiTo12BdDvwLAp8x610f1HuZUrz/WqZhS+sKP93ieY=; b=Kfbh7Q+4HjjJvoKj
	9/CpJeHcTEAZmL0h8kY0d77/Iw3u9jQcVoai3Ubx53eIOX5ZWb8qCVGx9atdCy4C
	fp6VG6prt0/bezE7s03PXPqMyNaJPjovSwauOoA5ltxNGMoaEmWB1xo56rrx6X1F
	w6MkLQc6uQXeB9Ofp+D6iV2TUI5uIiQe7nibZc4+kaPpXhZSuXMEjySOK49bG6Ip
	RDVAcf6Da04jPLp4limSiWIz9QmMgCDgxDmWvV0wFKcybPl8d7OFbKk090o8Gdeu
	MA5fUU5OIWIc0T203R0ekiUWd4ldHPSfMQPCMXCrgqG8Wahl0yQ+rRilGqAMMjPk
	W9RzHg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnt9024td-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 07:48:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b454cac322so37574495ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 00:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776757682; x=1777362482; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LRiTo12BdDvwLAp8x610f1HuZUrz/WqZhS+sKP93ieY=;
        b=cvHCvxeIpK/Y55VqDoiFfMcbDkSxM7QPnQJTlphl8pB5zthiT75cKeg4ovAyRYcBHY
         J0uWMY3/Nh6DO8PHwo2VERkOuf06m+zmWUFHbqbMBUzQz3n7xzM3TZCmdup6NGejo03M
         bH6URVFcOURmzVTkUeXaMeBvGuU9SYxmYXh1YGSauHVvr+SLtnUbqLRpjTFmUcG5pVwe
         7ao1mM/CpojNy2ht4Is2SZPZXrvLtMOlNA8dgTzFZE3a9ONVqnGplNuZ7tdhcTaLUqx1
         GsmYpQCYPAwaDVDZtrzTZDTgq8mlM43xVTnZ+Nr7FXIgG0xoEZ3DedBqDkJzGNhOJrdk
         Nqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776757682; x=1777362482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRiTo12BdDvwLAp8x610f1HuZUrz/WqZhS+sKP93ieY=;
        b=fGIlIwWJ6vro7SqO7QmDPm1/MEY8yfWQrWq3OVW+k+PZZ2okDsCMOe4JcQ3Hlv1rV6
         0s5q7wnCbgWtQtqMFxYph90p7SvTPwpQPj2Hd90SgdKI5Fbfe+iTJqAd3eBYlT19NZeH
         QtxnaIK2QBJSkCXfFbZPwmJ8RMcaEOYdzslyOVc+ShCLYUPZ3Zqqw4iUWZjI+yOloOmt
         8NJgyHnBtinGvav3pVZsiXn84OSg+4BpSUyDEb07iQbs2JjP62NC2SPaKazBFpNurUhv
         XDT6+qAZs+gtyR5rM3U4wNjgn7x/eiEuVNlHAldyAm9RHotB/+l8MN3KsppEffhD4ezB
         M+dg==
X-Forwarded-Encrypted: i=1; AFNElJ9SZLkzuTxdJtCVl6RW309xXHhS2gw8Fexg70r2AW2Uywz5OwtRovdbRnuNPYs9UsJpd8Yj+3pNaO5uDzBi73zJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzmFXbZwqwocE005fct/7eRH13K8Eg8mx+2u5sWq+CIgcFWnmPM
	EEPk3MtiZ6fgvRkWGbE1srhDLpVdqtW3nLWcKTUKQQtsXN9rTOoaVPxPUggPjyci+OwfxSGBG1c
	15+OOSae+j9hI/38Adqfp+McRwMY62oakTdvit4UufS3L1A4qYunaNqNy9WIggbD+0K6+kCyUHj
	QT8g==
X-Gm-Gg: AeBDievV6TUq8RrgLEJM4+/4VnkFwj19tlLVlnCDeEnAbJFjE/OtwQR2AlEGds//lqF
	52F7+eAYKQfQjeQhGSyJTAwukZ7ZLk2Fg21pOvET7YeB4yhGI7mg3XKDOZX+F0TT5oU8ooeOa08
	T++/YFNywGsu0ncEePOwzQoEnBQ6GzsEtVM4RsgObrHSTPZh2TFA5KKEL1ayHfCoV9ap9uo1g2J
	lWKan7q3xSpyZHQsjnAeH/Pdum6BW9mU7KwnAkn2fnyQ/GwAJep/ZAV5nK3U/HqXyuxdBh58AvN
	uY/YiT0WfzYrk43gsTPEihpoudNYuHcPBu/A/askyYojrzMImiUwSH7GKFkPgyMk3It1sPdToNB
	x/XOHqkYxijZfhK1B55X2aOSfLmjDdiZUak331axvkFUIfMCxsGZecBIo57k41Q==
X-Received: by 2002:a17:902:f54d:b0:2b4:5b1a:d09c with SMTP id d9443c01a7336-2b5f9edb4cbmr183222065ad.15.1776757681944;
        Tue, 21 Apr 2026 00:48:01 -0700 (PDT)
X-Received: by 2002:a17:902:f54d:b0:2b4:5b1a:d09c with SMTP id d9443c01a7336-2b5f9edb4cbmr183221615ad.15.1776757681364;
        Tue, 21 Apr 2026 00:48:01 -0700 (PDT)
Received: from [10.219.57.87] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cb92sm121375995ad.50.2026.04.21.00.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 00:48:00 -0700 (PDT)
Message-ID: <ee552fdc-e35b-4132-b8c5-35bf409adec0@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 13:17:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu/arm-smmu: Use pm_runtime in fault handlers
To: Pranjal Shrivastava <praan@google.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
References: <20260313-smmu-rpm-v2-1-8c2236b402b0@oss.qualcomm.com>
 <ac8j1jlFNxgZWzzK@google.com>
Content-Language: en-US
From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
In-Reply-To: <ac8j1jlFNxgZWzzK@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KfbidwYD c=1 sm=1 tr=0 ts=69e72bb2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=X3pBVciGceusgIsGFAAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: cr43TUVvSk3JjSwidAGhdc75dRfAbYHg
X-Proofpoint-GUID: cr43TUVvSk3JjSwidAGhdc75dRfAbYHg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA3NCBTYWx0ZWRfXy4wE5PkPk5q0
 Wb2yEsuv5J2K893T+eEE7pzsSuEgbc6hRqq6puXbXS/7O4+h9jUJVxCiTRJTPcSKjNdHroN0G/x
 UiHzX9UAQk9bw6w81nCnb+LXBmYem219/a2IczfcCO3N/sK78/DbYz3Q9xOKZy0S1jUfzTgCDVc
 /Sh90+bprBIBtIMNWPUMgSCe9Bz3ZkumBmvO7iRv0d1y5vAJH1i2GqJIZxEbAZnVjWtt+MVvXYW
 Nb49geNm6B8DCJv5prZpQ0asW6ESA/22D46xiz3OTa86TYa1cmZOWza+c77UQrtEBoK748D2GMr
 IuaFaXOOnHIXZdHRCgL3P3eLRJDslYwoE/CUUb2MVDkCCUvRVPc+9ILkq9g2gV639JRrVrOu0sX
 ZhCJ79qHGLU5Tun62Lsiv+ou7hvD1rFN9b4C6kTj5iEZxVO+AwuBY58Eicyeaj1E38lZASmugF5
 Ir0V6pEYmS6injA5IqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_004804_096988_E8CAB30C 
X-CRM114-Status: GOOD (  42.99  )
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



On 4/3/2026 7:50 AM, Pranjal Shrivastava wrote:
> On Fri, Mar 13, 2026 at 03:53:53PM +0530, Prakash Gupta wrote:
>> Commit d4a44f0750bb ("iommu/arm-smmu: Invoke pm_runtime across the driver")
>> enabled pm_runtime for the arm-smmu device. On systems where the SMMU
>> sits in a power domain, all register accesses must be done while the
>> device is runtime active to avoid unclocked register reads and
>> potential NoC errors.
>>
>> So far, this has not been an issue for most SMMU clients because
>> stall-on-fault is enabled by default. While a translation fault is
>> being handled, the SMMU stalls further translations for that context
>> bank, so the fault handler would not race with a powered-down
>> SMMU.
>>
>> Adreno SMMU now disables stall-on-fault in the presence of fault
>> storms to avoid saturating SMMU resources and hanging the GMU. With
>> stall-on-fault disabled, the SMMU can generate faults while its power
>> domain may no longer be enabled, which makes unclocked accesses to
>> fault-status registers in the SMMU fault handlers possible.
>>
>> Guard the context and global fault handlers with pm_runtime_get_if_active()
>> and pm_runtime_put_autosuspend() so that all SMMU fault register accesses
>> are done with the SMMU powered. In case pm_runtime is not active we can
>> safely ignore the fault as for pm runtime resume the smmu device is
>> reset and fault registers are cleared.
>>
>> Fixes: b13044092c1e ("drm/msm: Temporarily disable stall-on-fault after a page fault")
>> Co-developed-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
>> Signed-off-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
>> Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Switched from arm_smmu_rpm_get()/arm_smmu_rpm_put() wrappers to
>>   pm_runtime_get_if_active()/pm_runtime_put_autosuspend() APIs
>> - Added support for smmu->impl->global_fault callback in global fault handler
>> - Remove threaded irq context fault restriction to allow modifying stall
>>   mode for adreno smmu
>> - Link to v1: https://patch.msgid.link/20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com
>> ---
>>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 60 +++++++++++++++++++++++------------
>>  1 file changed, 39 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> index 5e690cf85ec9..f4c46491a03d 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> @@ -462,10 +462,20 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>>  	int idx = smmu_domain->cfg.cbndx;
>>  	int ret;
>>  
>> +	if (!pm_runtime_get_if_active(smmu->dev))
> 
> Note that the pm_runtime_get_if_active(dev) only returns a positive
> value if the device state is exactly RPM_ACTIVE. If the device is in the
> middle of its runtime_suspend callback, its state is RPM_SUSPENDING.
> 
> Thus, if a fault races with the suspend callback, we'll return IRQ_NONE
> and the suspend callback doesn't seem to be disabling interrupts.
> 
> This isn't any better if we're in a fault-storm caused by
> level-triggered interrupts, we'd simply keep entering this handler and
> return.
> 
> I believe we should clear / handle any pending faults/interrupts or
> atleast mask interrupt in the suspend handler to avoid this situation.
> 

Sorry for late response.

Thanks for feedback, I see the issue with level trigger causing
interrupt storm here.

I don't see how we can meaningfully handle all context bank faults in
suspend path. We can clear it, but the idea was that smmu device is
going to be suspended, and shouldn't have any active transactions at
this point. Any remaining fault is expected to be stale, which will be
cleared in resume. I think it would be better to just mask the
interrupts in suspend path to avoid interrupt storm.

Will address this in next patch.

>> +		return IRQ_NONE;
>> +
> 
> Maybe we could add another wrapped-helper to maintain consistency:
> 
> static inline int arm_smmu_rpm_get_if_active(struct arm_smmu_device *smmu)
> {
>      if (!pm_runtime_enabled(smmu->dev))
>          return 1; // Assume active/powered if RPM is not used
>      return pm_runtime_get_if_active(smmu->dev);
> }
> 
> This returns -EINVAL otherwise which isn't a problem for the if
> condition but slightly cleaner.
> 
>> +	if (smmu->impl && smmu->impl->context_fault) {
>> +		ret = smmu->impl->context_fault(irq, dev);
>> +		goto out_power_off;
>> +	}
>> +
> 

Ack. Will update in next patch.

> We've moved impl-specific handlers here, I don't see a functional change.
> This looks fine.
> 
>>  	arm_smmu_read_context_fault_info(smmu, idx, &cfi);
>>  
>> -	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
>> -		return IRQ_NONE;
>> +	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT)) {
>> +		ret = IRQ_NONE;
>> +		goto out_power_off;
>> +	}
>>  
>>  	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
>>  		cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
>> @@ -480,7 +490,12 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>>  				  ret == -EAGAIN ? 0 : ARM_SMMU_RESUME_TERMINATE);
>>  	}
>>  
>> -	return IRQ_HANDLED;
>> +	ret = IRQ_HANDLED;
>> +
>> +out_power_off:
>> +	pm_runtime_put_autosuspend(smmu->dev);
> 
> Nit: Please use arm_smmu_rpm_put() here.. while at it, I guess we can
> also bring back pm_runtime_put_autosuspend() in arm_smmu_rpm_put() since
> it is updated now to also mark last busy.

Ack. Will update in next patch.

> 
>> +
>> +	return ret;
>>  }
>>  
>>  static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
>> @@ -489,14 +504,25 @@ static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
>>  	struct arm_smmu_device *smmu = dev;
>>  	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
>>  				      DEFAULT_RATELIMIT_BURST);
>> +	int ret;
>> +
>> +	if (!pm_runtime_get_if_active(smmu->dev))
>> +		return IRQ_NONE;
>> +
> 
> Same here.
> 
>> +	if (smmu->impl && smmu->impl->global_fault) {
>> +		ret = smmu->impl->global_fault(irq, dev);
>> +		goto out_power_off;
>> +	}
>>  
>>  	gfsr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSR);
>>  	gfsynr0 = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSYNR0);
>>  	gfsynr1 = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSYNR1);
>>  	gfsynr2 = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSYNR2);
>>  
>> -	if (!gfsr)
>> -		return IRQ_NONE;
>> +	if (!gfsr) {
>> +		ret = IRQ_NONE;
>> +		goto out_power_off;
>> +	}
>>  
>>  	if (__ratelimit(&rs)) {
>>  		if (IS_ENABLED(CONFIG_ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT) &&
>> @@ -513,7 +539,11 @@ static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
>>  	}
>>  
>>  	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_sGFSR, gfsr);
>> -	return IRQ_HANDLED;
>> +	ret = IRQ_HANDLED;
>> +
>> +out_power_off:
>> +	pm_runtime_put_autosuspend(smmu->dev);
>> +	return ret;
>>  }
>>  
>>  static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
>> @@ -683,7 +713,6 @@ static int arm_smmu_init_domain_context(struct arm_smmu_domain *smmu_domain,
>>  	enum io_pgtable_fmt fmt;
>>  	struct iommu_domain *domain = &smmu_domain->domain;
>>  	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>> -	irqreturn_t (*context_fault)(int irq, void *dev);
>>  
>>  	mutex_lock(&smmu_domain->init_mutex);
>>  	if (smmu_domain->smmu)
>> @@ -850,19 +879,14 @@ static int arm_smmu_init_domain_context(struct arm_smmu_domain *smmu_domain,
>>  	 */
>>  	irq = smmu->irqs[cfg->irptndx];
>>  
>> -	if (smmu->impl && smmu->impl->context_fault)
>> -		context_fault = smmu->impl->context_fault;
>> -	else
>> -		context_fault = arm_smmu_context_fault;
>> -
>>  	if (smmu->impl && smmu->impl->context_fault_needs_threaded_irq)
>>  		ret = devm_request_threaded_irq(smmu->dev, irq, NULL,
>> -						context_fault,
>> +						arm_smmu_context_fault,
>>  						IRQF_ONESHOT | IRQF_SHARED,
>>  						"arm-smmu-context-fault",
>>  						smmu_domain);
>>  	else
>> -		ret = devm_request_irq(smmu->dev, irq, context_fault, IRQF_SHARED,
>> +		ret = devm_request_irq(smmu->dev, irq, arm_smmu_context_fault, IRQF_SHARED,
>>  				       "arm-smmu-context-fault", smmu_domain);
>>  
>>  	if (ret < 0) {
>> @@ -2125,7 +2149,6 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>  	struct device *dev = &pdev->dev;
>>  	int num_irqs, i, err;
>>  	u32 global_irqs, pmu_irqs;
>> -	irqreturn_t (*global_fault)(int irq, void *dev);
>>  
>>  	smmu = devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
>>  	if (!smmu) {
>> @@ -2205,18 +2228,13 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>  		smmu->num_context_irqs = smmu->num_context_banks;
>>  	}
>>  
>> -	if (smmu->impl && smmu->impl->global_fault)
>> -		global_fault = smmu->impl->global_fault;
>> -	else
>> -		global_fault = arm_smmu_global_fault;
>> -
>>  	for (i = 0; i < global_irqs; i++) {
>>  		int irq = platform_get_irq(pdev, i);
>>  
>>  		if (irq < 0)
>>  			return irq;
>>  
>> -		err = devm_request_irq(dev, irq, global_fault, IRQF_SHARED,
>> +		err = devm_request_irq(dev, irq, arm_smmu_global_fault, IRQF_SHARED,
>>  				       "arm-smmu global fault", smmu);
>>  		if (err)
>>  			return dev_err_probe(dev, err,
>>
> 
> Thanks,
> Praan


