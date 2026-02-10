Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8FDEA3F3E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 11:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xrae0P7gUt75AhWHmiemIgjk6vnyOpZYcSvfCh7M7I8=; b=CMhU5aEa0Mlv2l/PKqKcTlGWi/
	UqiFIy+vhF/QEGjCO+g8CX3s88pdeKHr3bqI3iFHqFfqEEYc7nsyiIiIvMFz8R/PulQI7V//lbf0k
	jSZFIr+qy/Fux9h+sMYWHQ5fP4CjRh09aGnEOOAzHgjE7BaFB09IKYHHt4/qV/95lGVdGNqhN9Rxq
	NTJ3bMTmSmThcuqdHHDJUcTdhcgKNsOWFHhbuFuqXlpGptWlRDojrMueGQheDjod2sy8uYQPAnpcM
	jJ966eWWpTP9a7Cf7LfzTQ49bIW6MdRoIeTQLfKH45DqdcbzieBGJ6PtKn3/14ElCaKBj9ekcVsXI
	Dp3ulZLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpldA-0000000GsBx-3pfQ;
	Tue, 10 Feb 2026 11:10:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpld8-0000000GsBZ-0utj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 11:10:07 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A6gl6b3437085
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 11:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xrae0P7gUt75AhWHmiemIgjk6vnyOpZYcSvfCh7M7I8=; b=fZnNimaSKkGrjM+X
	Gnc4PGcLsrm8DHUPlSFUV0qwPyDXk7f6PPirnHgGqnfP2SD2x5YMkuRx7VIA9GBR
	OlkaSRO3lNHD0wNrCOBB4vFSs8IC7x+e7YGSy8nVmHJtCMRypxNJ6MEBMCap+5PR
	NDJtny7fF+sAf4Bv5Pqt2lv4Kb7QD4yByniRjC9nC7f/i80iWcMq8cz9YZ2MiQc+
	np+J6/vHvu5RtO7/SGu2wC1IQu2ls6hTZV5CT40k7ULgU/VayzkZbikDnmYnCFZQ
	Gjfbz7+MgHAWaqdmMkjS+2ImOWlP8a7+VQzw656j/LBuMOeLS4lwV43l6jmaokdu
	RMk3fw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7fevc4cd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 11:10:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a946c0e441so10003115ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 03:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770721804; x=1771326604; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xrae0P7gUt75AhWHmiemIgjk6vnyOpZYcSvfCh7M7I8=;
        b=SkBkHIGuJNMP8qIhXrdOA3iHdR2/jZSiyUpbvbL2BWqoB2i92LfzWXvf5PsmeeUIeS
         kjcz9u3zw87Vyl2LU66POIFGI222OfZufmhuVrQWKisv6xKZp+PP3Ymww7KCwrSm4tBX
         IMrdAehMJVpYLvgWI6F5jOk87kO+HldQUhjpS0i02VAbGrVJgJ1nnnnlE6bu0o8MiHgP
         qAfNxGTpJUP3DSNdT+C5rR+4SE3Qwnqi9XBA+UeW14ui4rTOGnXSnwjp31NiFPPY43qc
         Cj0r4U9DzUL093oAHmF1NI5cfGwSBl3iTxAuXsIEq11HMuC05NPyn/Aea6cP8abWZtn1
         SvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770721804; x=1771326604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xrae0P7gUt75AhWHmiemIgjk6vnyOpZYcSvfCh7M7I8=;
        b=w3N9SRwV18HOWhNIKjQ1Uzbw+Uxs5yrCjz+lGXFgr2mF/Wa9lqd/UpJlZaJfhNe+cx
         OEeOuO73RoKWo7b4hPF5r6QLVf8M6oAGHW9idrOCmNb1mXeLmL7Zygw18YQcGG7Ok6Cv
         aCrAzN029idQzkLmn5+c56sXxytqzvSD4DemM0xp6/VQ++wEh5+N4+25FXVO1hmhuiEK
         QWTTAKD1U2+b9iKpHVJSvdyNtkRO+9UgnxdX3cnl48mLgXdJ+Ua9fGUS6yOqdEb8X7Om
         lPE1Njgiecxce4M+eSCL7GxU3ZxOBTDv13IikYnZDr/pLyXLZjwuxeCrm9muqCQFQiKH
         RIvg==
X-Forwarded-Encrypted: i=1; AJvYcCUd6mSE9zyeDANj/daQ6X4Syasospa21ztPFMD3hUWts2HjjgKL6jQfuqvAL2IaGjbZPL7qE/ndbHfmqFT4v//1@lists.infradead.org
X-Gm-Message-State: AOJu0YwC93MsSmVRvB1CSqHyrTS7qyhWzBxNmwAE9hZwm+dk9od3e67T
	wQaw03pLcUl8SCqbZYSFRMSRNhaLYZeXAPEM2phDmows55IXojNEdpq46a7C27257QSOe3bYJes
	fl2J28VaM3tne04L+ahAvfSVVpImgCed+/5enAU7Ixkya11LWE1MdYcbOJgYtnulDRwN8I2U+c0
	x7Pg==
X-Gm-Gg: AZuq6aJkIgA+mYtm4Xtc9vRZ+5imlg+NdtG1vis4DYBaoMAmDjIJKwf8XxcKbHULnam
	I2J22AG7749W7u6skbtGoq288m7QKjikpkwAuRe5ov4JS6LFjKaOLjVYDMkRnw99x58QQ25+ExJ
	eU1lFDlGXXhJhQOvJVPkoXeYnPU0Ry7hwUCyN4WVQtJSpiTO4oYI6+eMqbOyT0V5kj7VxBLIPBp
	HD2QF+ZLgF0yL6HB7lyMBjDYf4oqMCAPDoOe0+ebsRpk11ifx6DioIdIYbdkqUmrFKUxzF62AL5
	0ukZgQ/Jy7baNHCn0nc/yOfRo7vst459ktRhutcSUsHwMuCnv3pANcL3lqnUC6zWUi5181Bk/wn
	L7kJlnRHbi9pzrV+hThg6j83hAqyFIpqawPTD9cLpZWtHf1AoEZhy
X-Received: by 2002:a17:903:985:b0:2a9:cb10:42d with SMTP id d9443c01a7336-2a9cb100bcemr94582625ad.61.1770721802915;
        Tue, 10 Feb 2026 03:10:02 -0800 (PST)
X-Received: by 2002:a17:903:985:b0:2a9:cb10:42d with SMTP id d9443c01a7336-2a9cb100bcemr94582105ad.61.1770721802081;
        Tue, 10 Feb 2026 03:10:02 -0800 (PST)
Received: from [10.219.57.215] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a95dce24f0sm119367945ad.32.2026.02.10.03.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 03:10:01 -0800 (PST)
Message-ID: <7720d215-9f92-4f0f-83af-c992e1cbe531@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 16:39:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu: Use pm_runtime in fault handlers
To: Pranjal Shrivastava <praan@google.com>,
        Robin Murphy <robin.murphy@arm.com>
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Connor Abbott
 <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
References: <20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com>
 <9fb8f661-a235-4f86-bc10-f80a21a8fa9d@arm.com>
 <00fcbcf2-3f48-410d-88a3-88dc834c1ed7@oss.qualcomm.com>
 <d6bc7f38-b41d-4e89-b484-0e699981b8b4@arm.com> <aYEFop8CJiLYzhLw@google.com>
Content-Language: en-US
From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
In-Reply-To: <aYEFop8CJiLYzhLw@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qe-XonHVCfVcBteMTz2UUH9RPMZdRRZm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA5MiBTYWx0ZWRfX8psggqNBsyGk
 51rY9AhzOV1dkyvfcTwtgzzvshHNSbiW40SK7Mdpw5+c7uTywhx9yDkqD1t8DabLrpchZdAeuH6
 rJE9rG0x7lTWGeOJo4x7bb5XFZ/0rWoNDoDmQLl0UrfEvE5pSEFaJfE+wSlPHnjbej2MfJ+D9wF
 IbRfXSn54G1mNJWqTtmVygOwdSMkOxEeXh5cEm2SjIYp/LU8NWwi2YrCZxeyGKhwbrdlby95EEW
 lzJS/IxCiG0T7aNcUBnzEyr6RF0NyX+MXGOhi41rDATff82f9iVheA14LvL7/28u6vAPuXEA1Et
 sF5bFln/P/GtRYiLBWKLRuHJXY8XcSceSu9ZbI/QDPjQZRreQ4vh6fDEmd4qHz5OrivLWWdSalW
 aqpmDuKzkZQ/AenibaucLEN1/xtBWRbF7Mmj/JJTfSg7ZayFQTHq2lkqO/d0w/mUwa+q1PcL3oM
 VKwfx4V2YI2gWA5Hifw==
X-Authority-Analysis: v=2.4 cv=F6Rat6hN c=1 sm=1 tr=0 ts=698b120d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=oqkVm95N0dxC-dYrnX4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: qe-XonHVCfVcBteMTz2UUH9RPMZdRRZm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_031006_300862_B384AE10 
X-CRM114-Status: GOOD (  18.00  )
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



On 2/3/2026 1:44 AM, Pranjal Shrivastava wrote:
> On Wed, Jan 28, 2026 at 06:44:35PM +0000, Robin Murphy wrote:
>> [ +Pranjal as this might matter for v3 too... ]
>>
> 
> Hi Robin,
> 
> To weigh in from the arm-smmu-v3 side, we’ve attempted to address the
> "can of worms" regarding power races by leaning on these differences:
> 
>  - Threaded IRQs for PRI/Events: In the recent series[1], the PRI and
>    event handlers are fully threaded. This allows us to call 
>    arm_smmu_rpm_get() safely, as the handler can sleep while waiting for
>    the hardware to resume.
> 
>  - GERROR Handling: Since GERROR remains a hard IRQ, we handle any
>    pending gerrors in the suspend callback before the SMMU actually
>    powers down. Any GERROR interrupts received while the device was
>    suspended are treated as spurious and ignored.
> 
> Thanks,
> Praan

[1] refer to case where SMMU state is not retained during smmu device
power down, this I think is equally applicable for both context and
global faults.

Since the ARM SMMU runtime resume triggers a device reset, any pending
faults would be cleared during resume. Here the solution can be to
handle both global and context faults before allowing the SMMU device to
suspend.
With this approach, any hard or threaded IRQ scheduled after the SMMU
device has suspended can be safely ignored.
One concern I see is iommu fault reporting to clients while handling
fault during smmu device suspend.

Thanks,
Prakash

[1] https://lore.kernel.org/all/20260126151157.3418145-9-praan@google.com/

