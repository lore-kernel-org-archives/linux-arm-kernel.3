Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F504C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 08:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+bCUXw24EZY1K4A4XHY6/ihELt7ZoTu1yafnTeOtpIw=; b=mL9QZp56M6fxHu4h2oJYI6Vf/O
	+8+eAFZ9FCH6u7NeuFafRHm0TTXLquYiy7SdJsrM+EiF3CcVpugoAcZItp3Y+/yJfYZ316o34sxJP
	Sf8V09/yccOQjqdSEiemk0Ww6RkWsOHZcGEa1WryEuD6wsmtOP5XRngpApULTWvuordlAmgt3+z4o
	Usau0hwyj5lCRSBL/8+0Uz1AywJWAAPi9zm6RGeRF7nXyRWyUoOdoDvTc4u20pG2eFlLwD7FZLavV
	HtWSuYi7LuM+0qfz3p4yP2UwqQV+/zHl5DbgWIDjXO7fo0HRpaY1q4sbtUIDp2UW198jHANdbeaNx
	itMIQCSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1giD-0000000E9Vf-3NKU;
	Wed, 02 Sep 2026 08:52:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1giB-0000000E9V4-00Gt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 08:52:52 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826W7021205594
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 08:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+bCUXw24EZY1K4A4XHY6/ihELt7ZoTu1yafnTeOtpIw=; b=HBia1EH/LROF3Ldp
	TqYLTOWgOzzU77WgC5zRDL3434yBU9+CEM34cZhfl2FG8iaRnq+hD+YdrjcwiAP5
	0TtS8CAP4z5JPS7uz+Hbe1PcxiH6tqtn2Genh+qZSZ7z5g9HQ/lqff/CH0lPCkkR
	VoltKTFOQmgnJm+hGjbKqQkX7XPy9Hg/wyRGxxQ0SHvbKZGR9Zo/O2EIakZrHT/9
	c3F4eEZuQh2HGoY50UYqI6ogeknog1PIJxa1b1NUrKiRTNTJocVWDoT1VgzslesE
	EB5wjwbjtWvc99Uo5IxNjmDSwdEM+aCvI6WFR0gSVNew02UBb1DZxBODJNkFTboz
	+7+qZA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdynt4by9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 08:52:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so1105367a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 01:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788339168; x=1788943968; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+bCUXw24EZY1K4A4XHY6/ihELt7ZoTu1yafnTeOtpIw=;
        b=ga+Q0Ebs3e4iJQ0IQmRzFde+KCIf0jCkVtq6zY/Xyyhl0rGzPmYgOBpzJCsi9/NTRT
         MMeQHgv6MO0N9c/+NngVCkg/4uSDAXKR+PmjyCnfi2QbNUV1T8f8zvalKML2tc+DZ4Gf
         W+t04ELjk4euT1p5Ev2NT9sjisHNZlTeuYpCExLqpIt3Q8sY0vQ/TJ9i+UOfn9Mvchla
         rjvb9JR9elOdYknLOZP3ehZbgMK0YGogGD9+PZyjAXOPwJB2BesQA0UG9RKGIoxaXXPI
         gRvnbHVEU9zprVMV1h4GOaoAD6vpyyElYhHZGLfwxy4MuNVdgdwcy9oroD0VO97dSujp
         mjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339168; x=1788943968;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+bCUXw24EZY1K4A4XHY6/ihELt7ZoTu1yafnTeOtpIw=;
        b=rEmQD5WFpeZiiBmuPd7vqI9ulTtZSOaARrv8Tgz3aKdIOucDZDEdgppy63D15dGGw7
         tlOxzHofiOIH9zEW5o3aJRYXK5APj4H13XquDq4W9D1SaP02w1F44Q+AdIuUldsH8Zlc
         eVnRIEPx0OwiuXhiVzOeiqhA9wDxmC4ENNWHYq2kI5+CBCtp4xB2Uh2J4hIojakOVQSd
         a/u8d8pEBpw56iIheVCPSWxdhNTTPPgMoWZraHcdAtfCHQGgwJib9peDtiRYUmZfRflW
         fjmg6tx9j+UEw2bpwEdS3lSKCuPCAQXij5RejD3meugBon8qACHgGV6MJb9Z4bJSMz1k
         yCKA==
X-Forwarded-Encrypted: i=1; AKwUvBwZZ+k3NB1zzHn3arJx3eXHDsjYDCumPRZmjCO8vfgxOD1J4P3dX/VNA1VTUWWa/n76lVURkujb+OCavaTVuxyB@lists.infradead.org
X-Gm-Message-State: AFuF++nEDk7v2HQL4v/wwL0LmceUYYx/y6I4ItsnTFzc9mawOhpvmg3k
	SD0q6dNtIovwpuO9h1yX0TeVi60bQ/vTmDPaVkSg2bKELoQrldqceM2hQPSMmd30+B/fqMjA5tH
	/jCvLajk3G7uZ5ai2tdJke4I8hjyRaDX6V+X/9kJRNXLp8k3fMGt6RfGwERWy4DahyOhVq0eZAO
	PGBw==
X-Gm-Gg: AYBFou3+yYMkZJb3d0LZlnBXthpAFXyxN9lgm5x9eV3lPIBxKAkAMVnQt0kEtIBnCXS
	30s6Dm395vx5LasK6tmjlBD4F97dyxnTMfP/ASrASZ+h7gApNApHXISkB5952W/ZHv2Ik8YlwaA
	pLnqNxH+82kvwnL3VL1ScevK91mZo/LGZG6Q3jdFmGheoBHdkyYZ2Iq2+/VIrecPgqukF6zY4qA
	Z+xbaQYGRwzl4r8x3cpar/vCvqKu+LeoakdyOf0XZ1p+anaP8qVaa++hwcUjNp69i64IEt5anmO
	T5lWpJkwF0/hX4JnAOMnWMExS7Bf/dnsUcuiOwCRzkN/zegRs9irg8GX25DTjaP/jlIm/pG1G8E
	fpU+hie00SApPCOuThbPHsyjwMoewfAf/Hr5iq3BK/+tSD0PJD9VjQhf/mc2DDn2YsQ==
X-Received: by 2002:a17:90b:4d08:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39aede9344cmr4202230a91.5.1788339168525;
        Wed, 02 Sep 2026 01:52:48 -0700 (PDT)
X-Received: by 2002:a17:90b:4d08:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39aede9344cmr4202193a91.5.1788339168061;
        Wed, 02 Sep 2026 01:52:48 -0700 (PDT)
Received: from [10.133.33.183] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d75fc49sm10447855a91.12.2026.09.02.01.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:52:47 -0700 (PDT)
Message-ID: <163b2dba-0af9-4594-8067-be9e711bb4b4@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 16:52:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: fix trace ID search skipping pass-through NoC
 devices
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Richard Cheng <icheng@nvidia.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260817-fix-trace-id-assign-issue-v1-1-b2164e33f9fa@oss.qualcomm.com>
 <20260902082209.GT8904@e132581.arm.com>
 <28d5c8bf-87b1-4172-94a8-0e1b7ba1f083@oss.qualcomm.com>
 <20260902084538.GU8904@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260902084538.GU8904@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX0LqJRmsTfIxz
 Nbh7ItzBLTbwLNnwiVjFESfzf7G7eH9R3g7PSzsFvIC0lSSuHEQEQVl1Omfgmp+O+sNiT18w6gi
 03oxnMoUvoX9WUo04k07z7Xw69rYEloApLsvH/0ymOwdjkuRNXeUvS/vPAPPjlaM+teRWYU1kQX
 QL06ZV7otcm+YauB4xw7G/f3E5F7fOjudjJu9l3qHBWve3vfUCabQb+7KkMaaMAqS35AZU/5vck
 G7WPHJFVm42lNMBM6SxEJcrmZNzu3nCH4dzpXneYXZUDILWrKrgSVLO88X9k/BGghn+a6U1csT0
 09YVMWQpc1HANhAagIHLh00IPK8IeXYzCnSnFA43AJ/tbSz2Te2T8ZZH5LzkpNrICd9doQOL/iy
 MzBPe7XEw+oWwHTi+bwG+NmdcDJXGcu7H63cJsUPE6RvF5lvhVLkHe1GFX1jTzncPNcmIYR2m7u
 RK8iHkRJdlLoeVYQZvw==
X-Proofpoint-ORIG-GUID: peB9PT-qk__jUtxIDCTSRE4IYnsCf6NK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX8wlashjsdDyr
 wDeiNfb/xwOfGkLHj55u0PzGLpq8+QyKNktrhCBCcMswtV6ZNjMI0DoW7lkYP3dBskTW55/AStP
 xmQ2inWAx/pn0iGDHPUvTQ4+7RN/kFM=
X-Authority-Analysis: v=2.4 cv=LfkMLDfi c=1 sm=1 tr=0 ts=6a97e3e1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ASdo0e-X16dllrNbtIEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: peB9PT-qk__jUtxIDCTSRE4IYnsCf6NK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_015251_161088_CAE89548 
X-CRM114-Status: GOOD (  24.77  )
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



On 9/2/2026 4:45 PM, Leo Yan wrote:
> On Wed, Sep 02, 2026 at 04:35:11PM +0800, Jie Gan wrote:
> 
> [...]
> 
>> Hi Leo,
>>
>> Thanks for the suggestion.
> 
> You're welcome!
> 
>> I will fix this in the TNOC driver. I agree that there is no need to use
>> additional error codes to report the failure.
>>
>> I will post the new fix patch after below patch[1] to be applied to avoid
>> conflict.
> 
> The patch in the link has no fix tag, but current patch is a simple fix.

I called it as a fix because the TNOC device cannot be probed by the 
AMBA driver unless the PID is manually assigned. This is a hardware 
limitation rather than a driver issue. The problem is resolved by 
switching the device to use a platform driver, so I didnt add a fixes tag.

I will send the simple fix first. Depending on which patch gets applied 
first, I'll respin the other one to avoid conflicts.

Thanks,
Jie

> I'd suggest to give priority this patch - this is friendly for porting
> to stable kernels.
> 
> If there have dependency (based on your local test), you could explictly
> mention the dependency in cover letter and resend the tnoc probe series.
> 
> Thanks,
> Leo
> 
>> [1] https://lore.kernel.org/all/20260710-fix-tracenoc-probe-issue-v6-2-41eb36fef8d9@oss.qualcomm.com/


