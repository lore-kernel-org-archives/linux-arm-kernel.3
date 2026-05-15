Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C26CCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 11:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6u7L0Q9dnsKKK3HvrGHppxM7smIumAyVg/mpzy/UTJw=; b=ZWPhlZP6lRJ0I/LjTqNku33csY
	GC2Im/wDQmx0y35sSsHghq6D9i7vy7IQOi9Ww/2Wr9d+YSxeB3J3NrtlTHWaZNaIXc6is2sSVyu4x
	ajgdNG/lKFdcj9QE7ylSnRgneSidKEnT0ALmk4aqs1hf3jhkRsGMYMYWwFDBmFJvlVQRwBVYYgweR
	KvnZjFs+odVqKtV62r393vBIHlLgZ9WEqbcfigtRTbVD+BVFF3WTA8YlKqrQbcg2I6sRlZgU/vUk/
	BIuWOraytaDLjKGcM/HfM4NrXv6pESdjm4lPmfKWsP9WSnSB9ojQd0TnVRWXDV0j48slW/jo8lFhB
	UsecAQYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqSg-000000088yx-0R22;
	Fri, 15 May 2026 11:12:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqSd-000000088yI-1eTu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 11:12:08 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5TCl83220018
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 11:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6u7L0Q9dnsKKK3HvrGHppxM7smIumAyVg/mpzy/UTJw=; b=cgE/jV7t8xMKnFVH
	YZkEnvtWnrlbERrnipBi40loNRNCzgU42CBGR/YE3+jUfwcqfus1M++99vnj2BYW
	rocamrHtTAmMpzAmf6ufWQ5xAcKFcvszWmtTMzfG9Yyhd/nzuPC/WgfU4Iu1qkhh
	pkwfqZgfxahzxbVur8CTMjloITWevR/9r//hC+V9Q7HvGlY/kmEmpHgRx+Qx6y+Y
	F1LsWLVIXXfTSxj/TWVZnzKM062ChV5ROaixzujS+O9j1PBC+8QQ/BnJu1plmNU8
	2WAr9F2r8E5fP8bsRcxeNIJvqWqjqGs2tBmlOzZpOJJPg0vrubRFY/aSYzYfzbl3
	oWq6eA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s2yag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 11:12:06 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-63126f42441so636434137.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 04:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778843525; x=1779448325; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6u7L0Q9dnsKKK3HvrGHppxM7smIumAyVg/mpzy/UTJw=;
        b=h69nWzP2RBpClwgZOJi56h2SMHlfws0bPPi2/z90YB3Cfv8gOYPgXP23D3tkyjJnIN
         xlBaI0ow/drwZQGvSO9/1KgnR8QvwRrDqs5+zjAVoGclxOUFHrvlVVT5I+tglY4AMrMv
         KJEb2GCdnMmKeSPZ/lXEjhQnPEAp0fYMOo/3sZlyNb+j5ER3IGzc5VQJHwUA6JOCmHAP
         FV+xhxLSU80X05rzJuR5a7zbZe/RG4Y47qRgnsou8IJiXu6lO9PbTds5jS6bE5WJELxX
         CgeJOd3Dqv8yfHrQC9SSmRMspTt0PJ7y5fDqAYtHfgXZuitmaxQ1NkXZA1JS3DNX/jMV
         Y6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778843525; x=1779448325;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6u7L0Q9dnsKKK3HvrGHppxM7smIumAyVg/mpzy/UTJw=;
        b=AKhbbPOv4AUqjrXtIPsBO58MKw2+bPjBzNoWgvQACdpmuE50ND/d+eeFKYuVMm0kvk
         zs6fh+nFJN+9PzbtYR7UXEOftnpdBoi5Rq95/l7rkNObTT/HnmqvnfXm/AJgeTCMLabT
         exe65dKQzSbrcAvMdNKYc34bxWv2GMgWo7PBF7oCoB0Fcu6vLOYZKa0MCETiCBgGo3dv
         YU7/T/bMJZDxDw1wQICJMJKQgFuCNvCtvi4Ooxj0pX8CIZtsyxaJWLmupT3MdTqd4ipf
         nmV+HxElCJuIMqmHBdkkau3UAhwhCaVUNZy4KTG4DXxcFii0r5VgYFpxpPN+MsXgjQdp
         somw==
X-Forwarded-Encrypted: i=1; AFNElJ/736vi+GlRM7uWGo0aLvFS79b6vDtdNsIo45JQc+T0sGd0LLAKsKhlIoWXD15DTE/4Si7N1oiWj/cQio+h5yDg@lists.infradead.org
X-Gm-Message-State: AOJu0YwMlzGHar3rRk3vd5aIy6AdLXKfEC9UjPxTctnbaYnqxoR0LxMT
	pPKbOTnJlWc8XeRJvLuFm9MKEP+st/B4FxMGWHMTPWuMygVsORUgI9Kabks6rx4hxAQtrykEpLx
	6vSKew4OFHcktFuI7RIQsaHMBJGC9+usKmH24aShQj6j/7Ri8UOeoPA48sNKGcgvzyPtiqpzVMh
	/OYg==
X-Gm-Gg: Acq92OHAotMcLFCPq6I5oWUImFuB8aKCOu2IMhy2h0JpjcvqMYeKcD90zGH0cNgJxIi
	1sbLbQA1nCv8D1+S0wyPLSTppWuDKbV3KBdopTdltVpLbt185lrAbiG5GKie6ojsf38iPIrcSSP
	b33Vqd/RHB4pqdeBTHw+H/LeaOY8La2p9P0ZW5AHY5zTb83t+RTapeP3p+sa31SmHYUoIKhzCyt
	1DT+yusjYUKRuHvS5QVheeDVcmqTw8RGjkzWy1CqR/lrUDNY2idtPSf/FIK+PrSO35F7D9H+aqk
	Laaqz6A6aJuSjdaEusIu1YzNORD8kaHEi6o97w8j5pTUWZGfj4RHYnfFIg1s9r48uxKNk6yT3Rd
	+iaWumttZXv4kXpXYmxeSFVWKl80+Gt8+nX6A7ywOJlbGgNrE3yN3TIJehCVVrXLTUKH5SDx8RG
	95xRs=
X-Received: by 2002:a05:6102:30ab:b0:637:30f8:5cd5 with SMTP id ada2fe7eead31-63a40dc920cmr389925137.8.1778843525597;
        Fri, 15 May 2026 04:12:05 -0700 (PDT)
X-Received: by 2002:a05:6102:30ab:b0:637:30f8:5cd5 with SMTP id ada2fe7eead31-63a40dc920cmr389918137.8.1778843525034;
        Fri, 15 May 2026 04:12:05 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4eac613sm206295666b.56.2026.05.15.04.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:12:04 -0700 (PDT)
Message-ID: <62f6c5fd-c952-4bcf-9125-c5fe92fca1dc@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:12:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] interconnect: qcom: Make important drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com>
 <20260428-interconnect-qcom-clean-arm64-v1-3-e6bc3f7832db@oss.qualcomm.com>
 <bb02291a-1579-4069-b6b1-757a0b5fb7e6@oss.qualcomm.com>
 <ca6c656c-07a1-466c-9c1f-a2efbf1498d0@oss.qualcomm.com>
 <02578386-a492-4342-95aa-9cfb00c8bacd@oss.qualcomm.com>
 <720715a0-eb4f-4083-a67f-aa380e130d6c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <720715a0-eb4f-4083-a67f-aa380e130d6c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMyBTYWx0ZWRfX6AzSK6D9uRLF
 qNraIYAymV1aKCZqMSApyFaOCxHTSjOPPe2lxY7AxQXLrAgBMCiyqrocUTdA9uGmZzhZH8HSy+3
 YpTUmIL4JwYgeLZ/wRnO/iligxqDrGPc2hMffECzmWM/50TYuYCvSobD2rsLw48UsEOTRY9SxyC
 IenG3+wJ+AFjoPJXFYVgYuHh9ne3wG9Y2I9XAAZPHFaU1ojE+MysHR3rs9gCkuuTx4nsnOyy6p7
 657iK6xHFBwSvtKxrYwbT9Shtg6CQ4cSe5i5wcglNEhH2eDehKZjr+602Y1lrIukqp6Qtse+u9T
 axnHkd5YeP/9tjF+ullrD7hVKUW6E1CDLLU4hF2a61/m6jcqn3IhFi/FzA42/M6EdeD4HDVkoKE
 SvCOGNC/xBnSkJsMYwbGwkDfcMJxY8qp4v/tLXJYVpo1mK1P00UGWu+c/YBmLdTFFSWKm4RwHtc
 v1y82RPJYSE0vL1PN2g==
X-Proofpoint-GUID: MrzxurJHMmos35b2R1j6xSOvVsGpMJEj
X-Proofpoint-ORIG-GUID: MrzxurJHMmos35b2R1j6xSOvVsGpMJEj
X-Authority-Analysis: v=2.4 cv=HJ7z0Itv c=1 sm=1 tr=0 ts=6a06ff86 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=uUpgVYKiIJP92WW26QwA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_041207_556543_1E1531B1 
X-CRM114-Status: GOOD (  15.61  )
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

On 5/15/26 1:11 PM, Krzysztof Kozlowski wrote:
> On 15/05/2026 12:54, Konrad Dybcio wrote:
>> On 4/29/26 5:09 PM, Krzysztof Kozlowski wrote:
>>> On 29/04/2026 11:23, Konrad Dybcio wrote:
>>>> On 4/28/26 7:32 PM, Krzysztof Kozlowski wrote:
>>>>> The interconnect drivers for Qualcomm SoC Network-on-Chip are covering a
>>>>> basic or fundamental SoC feature: bandwidth management between internal
>>>>> SoC blocks.  SoC can boot without these, but power management or
>>>>> performance will be affected.  These drivers do not represent any sort
>>>>> of buses visible to the board designers/configurators, thus they should
>>>>> be always enabled, regardless how SoC is used in the final board.
>>>>>
>>>>> Kernel configuration should not ask users choice of drivers when that
>>>>> choice is obvious and known to the developers that answer should be
>>>>> 'yes' or 'module'.
>>>>
>>>> I'd say let's make them all `default ARCH_QCOM` - all of these drivers
>>>> are required to boot (minus the OSM_L3 driver which is "only" highly
>>>> desired, so that your CPU's bus isn't heavily bottlenecked)
>>>
>>> So the few of them should not be a module? That's what you want to say?
>>
>> I'm saying that if you only want to shoot yourself in the foot and not
>> in the face, you can make them modules
>>
>> But the L3 driver is required to make the caches run at a reasonable
>> speed, so that they don't bottleneck the rest of the system's mem
>> bandwidth
> 
> okidoki, so I will mark all as default built-in as you said, including
> the OSM_L3, based on your explanation.

Thanks!

Konrad

