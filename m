Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A951AD46621
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 20:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gKJRgKC6AD8prIn+wfw8vk84T968p8SO329dfTkrQU=; b=ss8mecwYQancZb9DHCvHxB7EYT
	6u1yCFlk7tZYGKgLk6cvkwNuYTVvDmiL/rRfF5XtxnA1+iyglmsIroo3/A3p6wj7FX8hMxL6CM0FB
	JlgqjzPy7hs44sVwZnLGbOFo9SXgsHtWODqXkF0ofRksgfsEoRE1j6Jv2MewdgtSBkAx2B6QFprZ2
	I9MZ9X7r68/2wVRUmBvF+5sFNOUnyq3u3PNhBvN+Ooo/fhmEImQTkp+sWjlAdRhqYU8C9e3qx23tF
	j8TBKjqUyf0LXdrVdk5TMtTJnsr7b65AtdU0CUv05PJIiWmtACbQuHmkhtiNU+QXVWwN1R6IsEtqK
	ArJ4iYeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgTtZ-0000000D8UQ-33ia;
	Thu, 15 Jan 2026 20:24:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgTtY-0000000D8UI-2EdW
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Jan 2026 20:24:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3gKJRgKC6AD8prIn+wfw8vk84T968p8SO329dfTkrQU=; b=Bon0NjeWSwDH/16cfhCMEJVv/d
	sooJzY/BfIIiWq7QzxzCVG0gEZffTALfoZ9K3HQStpINsWtWxdug9fEhDp2y06cps70lCCm3KGC7J
	bUpeC7+QWg8vTT4QG+i5pDItdvi9R4CH+3Wp/FTRId5Om1kxmv7IJYbUeDh3AgxxsY3Wb+dF9LAWJ
	YlQQcXaTsWuk1s7prQWjQ/gxEXpj/bqU0pvEYiDJNn9hxf02nTjsAC4KclliLdls+vSIS5ZN+eUU6
	ztKT0/a4DdMejO4MeM3sNtLDVNVQfGOFY7i7QMgr7t/Kgx+ltT08CMrAErygaFuEAXAUOI+bvvYP3
	4bUpiO2Q==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgTtU-00000007b9S-2vi0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 20:24:39 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFY9TK2817381
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 20:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3gKJRgKC6AD8prIn+wfw8vk84T968p8SO329dfTkrQU=; b=GSH/yxzUuSAlfv7w
	XlNRF/ZTUud0Ic/j0QMjTeXO/4FatoX18CeV6ekzMoNgbgT3B4wOMusycPJjf8wN
	q1HYZMwcP/tSm0csb2tn6liwlVjZ99eXtH4alkfQkScVgRinHiQCVRkvZ5QA/U5Q
	iv7Ztq16v2IS+VtulJq3vwwSAgLZJx6PgjV6LWW4FxUUvtPUwAcLUm9KZ+HNybrW
	TlDGvDcg7c0UfWmA6ZvK8p+NUlMlhIe7cWooDRyIF7wOjyaE5yw+FKCTHEnGldp9
	SIOXE5AIyvnA4lEHS916Qa+rn1Fd1jtgszjzIIOTGPcWKnALM7HD70VwiBmDzXQx
	oZ4tlA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpwpxhxj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 20:24:30 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-11b21dfe918so749314c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 12:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768508670; x=1769113470; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3gKJRgKC6AD8prIn+wfw8vk84T968p8SO329dfTkrQU=;
        b=J+T0Cn8ZCPnmfFFTCMb5oy15Y6QRPSgkYHq0glwKTsx9HahWqJi94Lyd7XiqUhsSYc
         e6TSo9PK9yYwuksbuiU3z/pxxzALAWEh/XtbIL+05HVmbfyXUnp/EB6FsuZ0oMzjlNeO
         1J3rhBUZTNU7cm0Vuuwhpo7DNeaXzJCuQxl65qLj5U88WgPIQkO99TtRuzqfTykF5vJl
         pJ0QBhMziSXVjgLDK/LJOfV3aJBO8Q4fLgltuWt8nmPy8KKR6hxUV/hnlEoZd4GJuKeJ
         tW+HrF6YLz+5T/uocKob4GJdSMumjfb+TZNW674UzhprERVEJeKbQIghHvExPkUY8Adv
         M3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768508670; x=1769113470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3gKJRgKC6AD8prIn+wfw8vk84T968p8SO329dfTkrQU=;
        b=pMXdnedsJ3OZshegxLHUBWDmLrSYcgdpvkRdzUeezlt3GAxndncEmTCJCJah1Gq6li
         u1Vw/sVy6HHUaspJ+jLXNmJ3eRUEjeSHUlmURQM11spdoB9ks2tVyAnHSwL/gBDX2Tqx
         Z/dgZiNZbz+AaUmJgm385VakXWQsS/krylbYJ0hG2fb1DGHd93sCywX0IfvoMlGkZej7
         /NUMnvHXZbr5qj1eDnZNiNtblEzQMxQn42H75rMxSO1HjAogqnHYfwu6pFxUYOzLFzNe
         0y2B4e4S+pCa9eV+TJoGb+BTP4ffmt23h4TTfixlniDD2lxGW2MaQmXBItBKGMObUR+1
         uFhg==
X-Forwarded-Encrypted: i=1; AJvYcCW6GdjSTLMyQ1H26WY9I48V3WIP6vMISkqtGGkZzPRE8HCik3dcxAvy7efmMLomhgeE9bRNsTrUWrqaWg/qJufj@lists.infradead.org
X-Gm-Message-State: AOJu0YzX+wE22jMYCTFDCjD0yOQQ8vJKPDv2sIEN1l4f1sVriV+92t/f
	JfdwO7boP+ExHcxx+6zJc7I4id0Ls/hsPKou2DfDERKwU2/qh1eX1HM6Om9p/RRvNdIb+wp+JMT
	mUe8kPP/qkBJDLFaZ3gSvaySF5Hh2kE2tu89MYy7qyptf0RpRsVev92IOzgn6e21VtIG8u2R3mp
	l6xg==
X-Gm-Gg: AY/fxX6BczwAnv5kvFVJDmOwIlCft2ufZ0yAkgjcYMDwfhQrgEgGTrR6nqY0oSn4uCr
	zMHmsYt4zkPzlkDoTJqZExzAssVIUk2r2IFuPjLNMJzJXLLzielaD9c/pZTo5tUDQwKmerJOobC
	MD9IiO+v3GsW+3APq0oG7qU43HASEM13BJ7UqSiMggAmCltPYgRMkPqic5Bs8AXmt1xHo0Y7/Ms
	eXA+jBOBKqoF1NpVtBKYxGtWGPydyxWIELv3IkHj39m/EWmn5V8butSofeAV7odxWur+AZ8TAA0
	s1vceKNP2xTj8PHo/9k+7dqrsJq3fbW0VzgPVfCX3bImbCCEU5+3d+IMpGKYiH9flzpAkG6Wkym
	rvKLfhNycSCT2xCYdJFRIzw7kZvACcgvwFkVnyfxC/m6kRn3P0ot+dUM7RhFm
X-Received: by 2002:a05:7022:2486:b0:119:e569:f865 with SMTP id a92af1059eb24-1244a923b8fmr748799c88.2.1768508669537;
        Thu, 15 Jan 2026 12:24:29 -0800 (PST)
X-Received: by 2002:a05:7022:2486:b0:119:e569:f865 with SMTP id a92af1059eb24-1244a923b8fmr748767c88.2.1768508668948;
        Thu, 15 Jan 2026 12:24:28 -0800 (PST)
Received: from [10.73.212.179] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244aefab3fsm414971c88.12.2026.01.15.12.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 12:24:28 -0800 (PST)
Message-ID: <62a0b363-653e-4bcd-9f17-840d5f276390@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 12:24:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <d153103d-4b9a-4380-b5cf-1f07dcbcedb8@linaro.org>
Content-Language: en-US
From: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
In-Reply-To: <d153103d-4b9a-4380-b5cf-1f07dcbcedb8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=69694cfe cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KxcOn-WUK91iGqjPL20A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: jiXF6SuiGqgWsAxE2bBllylH40Yojt7C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE1OSBTYWx0ZWRfX8JVcZvN20O85
 KYLQb2i7XBsP66JbdDr2yOL9jd3/HTme6mmeJ3e/mcNjmlUL+dFGpC7BZ17b24lMARHK/jzV2R/
 grM7MvVy5ajPUzFIfYCSGgbZ24buTXmDIIJpAksG+XpbRK43H/fgzU5ISv24FAhE77flWu5tHh6
 gIkmOcJQj1JsKK28SgPOl2u4GCJ1BQziTqdH8QT+SDAh2gr9gt3PmjLigLeXR4v1/iZ+pxbG0Cs
 nLjlHsdF7hUoT/Aw2loa6gQlf41/8xiwpmYdR4JX4wqVp5GdTXHVHgAXDFH6K4URxTkYeJeJBdV
 GAeV2yAWR7lNUkR85gHlrL6V66+nVrr40IGNcrMpTxMrXVSoFVUvMaCCa6nyXNupITBI5LqkYZn
 Vm5cHQSSqKpEopkAU5D/PZ79pow1fRwgNrSd2yGKbu4i1lkhC+5Q5w9ODp2fDwAa2jCMzxUz4vx
 fwCebdDsB5yAirI+UuQ==
X-Proofpoint-ORIG-GUID: jiXF6SuiGqgWsAxE2bBllylH40Yojt7C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_202437_165082_06DD51FB 
X-CRM114-Status: GOOD (  25.34  )
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

Hello Neil,

On 1/14/2026 9:12 AM, Neil Armstrong wrote:
> On 1/13/26 07:24, Satya Durga Srinivasu Prabhala wrote:
>> The ARM SMCCC SoC ID driver is currently enabled by default and 
>> publishes
>> SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
>>
>> On platforms where a vendor SoC driver already exposes widely-consumed
>> attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver 
>> changes
>> the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
>> of a vendor logical ID like "519") and breaks existing userspace 
>> consumers.
>>
>> Flip the default of CONFIG_ARM_SMCCC_SOC_ID from y to n. Platforms that
>> prefer SMCCC over a vendor driver can explicitly enable it.
>>
>> This avoids unexpected format changes and keeps the generic SoC sysfs
>> stable on systems that rely on vendor-specific identification.
>>
>> [1]
>> Link: 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/qcom/socinfo.c
>>
>> Signed-off-by: Satya Durga Srinivasu Prabhala 
>> <satya.prabhala@oss.qualcomm.com>
>> ---
>>   drivers/firmware/smccc/Kconfig | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/smccc/Kconfig 
>> b/drivers/firmware/smccc/Kconfig
>> index 15e7466179a6..f830d11ebdca 100644
>> --- a/drivers/firmware/smccc/Kconfig
>> +++ b/drivers/firmware/smccc/Kconfig
>> @@ -18,8 +18,11 @@ config HAVE_ARM_SMCCC_DISCOVERY
>>   config ARM_SMCCC_SOC_ID
>>       bool "SoC bus device for the ARM SMCCC SOC_ID"
>>       depends on HAVE_ARM_SMCCC_DISCOVERY
>> -    default y
>> +    default n
>>       select SOC_BUS
>>       help
>>         Include support for the SoC bus on the ARM SMCCC firmware based
>>         platforms providing some sysfs information about the SoC 
>> variant.
>> +      Note: Several vendor platforms provide their own SoC information
>> +      drivers under drivers/soc/*. To avoid conflicting sysfs attribute
>> +      formats in /sys/devices/socX/*, this driver defaults to disabled.
>>
>> ---
>> base-commit: b71e635feefc852405b14620a7fc58c4c80c0f73
>> change-id: 20260112-disable_smccc_soc_id-ed09ef4d777f
>>
>> Best regards,
>
> Disabling it by default impacts other platforms, the arm64 kernel is 
> designed
> to be generic and run on any platform with defconfig and from the same 
> build,
> please don't forget that.

Thanks.

> If you want to ship an arm64 kernel tailored for Qualcomm platforms, 
> you're
> allowed, and you're also allowed to disable ARM_SMCCC_SOC_ID.

Not entirely true. Say in case of Android / GKI, ARM_SMCCC_SOC_ID gets 
enabled
by default and we do not have a way to disable it.

> The soc sysfs interface is designed to support multiple source of 
> information,
> from vendor (like qcom socinfo) and smccc ID. And this is well 
> documented,
> and pretty obvious...

Yes, it is indeed obvious. The point to note is vendor interface existed
from long time and unfortunately user space had made certain assumptions.
All, we need is a way for vendor to choose which interface to be provided
to user space to make sure user space isn't broken.

> Neil

