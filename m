Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5BECD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 10:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJASCICmhbYbPbzCDWKXXIRnLLMfhiemH7GJWmQ/H1Q=; b=UU9Yb39m3ntimz1aTuVtDt3YNw
	QLKjTUsqApeVat/Lb2mOkTHWVaj7U5BPnK9oStXLWWxGqhMz9pVm8S5cCRs2qqUqcdwoKZHI2huik
	3JYMlvNSI4beYZH+VfJe31WyI8Z619ZFZUi/shZqeNYW4OymS/IOVdVIxbMMEGIIF1tvZvmKDBmjU
	qN6mm8+HqwYXsf+Aflx1fpcjDSD+NsoQ4a+eGTnNeswZM3dP/j7BiX0zQJ1fWQsiIMaxLF1nlou+O
	RsK9xszbDa22j5iniuWKyXxC6RTKF0mvxvvndHE+DOXFnKoJqbk8iAhL7eu50fNHBK7YlEjYcQdZW
	mH3wr7ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWrz-00000002JMa-3Klc;
	Fri, 19 Jun 2026 10:54:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWrw-00000002JLi-0THG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 10:54:41 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J7QFUn4185253
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 10:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uJASCICmhbYbPbzCDWKXXIRnLLMfhiemH7GJWmQ/H1Q=; b=OhNHN0biDYyFQwgk
	nXOC7uj4+hu8ejH3kmNt1s+lrUg4ZL23JpqdrV/OMVC+JLAuBLfE+xPm8V78s9iQ
	IF1mOiz1CV6CNDvSWeOueLa/qfC3FSSmq3Sk5+jbseiurHfL7elTbL+aX8zcQja/
	rDCmev4XPuahHfjOj/pDvSk4eXqC9a4WyYRwiD0MBk1RRNXmUXy5eWUudBDff8vp
	IaBJVLBpM2FBEPicbmK6K9qtCNsOlaQRO/HBzQ4qcICcRHme43QtTpf2XhAIqjaO
	FUCW16qOUCJnr4sifm6l+WTi8bbLHcVZil3qZQUudtHxiiVFW4A0sVMWm60wTmuW
	P9ZVgA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp6sb0fy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 10:54:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c272e532so19461625ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 03:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781866478; x=1782471278; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uJASCICmhbYbPbzCDWKXXIRnLLMfhiemH7GJWmQ/H1Q=;
        b=DfuyI94499JqyUE5gcPY8U8FNFawp947T+Ia7d6ebSaEVXHS8wayMYNU5qPo2BWSv3
         zxwZ5Rf2CN/mCNTyuTaBhbN5WgBuLt/a5J2P5E3voWM18u86dsbE4Re8H0CmOdXJXhsr
         aXUYK73h0iWEDUgSeaZF29KnZESGJeJS2kOgKJUWG3YZ0g/krzL9jIys2yABLTKAxTD1
         yJDs8iEr2kDSayEKcXWOjGcHh8sdaXTL7x8U1KzMxo6JsC/KVmYsJ+Hgp6IA/m9jgOJz
         CL0ZnGyjq3rMN8nPwYXzYdqDdVyotZuMIwvV89qKCuBgHiRcT252sgAiXH817J98ViZ5
         vMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781866478; x=1782471278;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJASCICmhbYbPbzCDWKXXIRnLLMfhiemH7GJWmQ/H1Q=;
        b=s4r3FaH64D2Nnp0IS+TqMw+X8htl0sDzzqBBozIiiMowbNS9j/MwCO2ch0CIbK3mQV
         EQjBKznDSG4ha0ELNaxZSTbbJ21al9GzRnCdwvIKV0cINca9LgWtsFqyxf49N+Pqy4DB
         P8L75ogM6lKf6r/v7Tiqt+HTCa1nYpj6fGsE79lqyUXcVDqfQL7Q7iJM8c/ZAtlHIEOc
         2resbyHLBpzEPP8AktHpg+gdFSKbRZo2MCGNYHmvnlo6+cFCPFF++HU5X5njpQwIodst
         tLnDnAD7QEs2oTCe8GtfLH5Ddjy0m2ctpGTh5pcpXsVM1JUjEkyZvtAEafDeI0cBUg6E
         uQeA==
X-Forwarded-Encrypted: i=1; AFNElJ/STDSbHD65xT2uYLaVWECwBxsWfL4uBhhGJRO3uSYxwkVWZiKNfziDc6SU6AJlo/klhk4fDA2wCXntPputDXLR@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg8gKJ8VPOn/VYSOURTUTTxGwRnfZlCGHskTn9yzuOPdhKDyzs
	v2v0QWINuDXhUG9feMlOiA8zWax9K/8eo55gNZYKGAFxxoyPIVHbH+U51caOpgB10lSDHmkGkie
	aiLjYzq3khjSvCR5VbYaDhn54/IZV4y9H7LPOOMmM3qnlqtFVep6AyDMFuy+o0AH+6QSr4v5lnA
	w13w==
X-Gm-Gg: AfdE7clfixYe3rYLh9l+Qbz57TAGATuk0dkqzlzJ2JxwOon6Qf3NyAHSs+ScNkDffXT
	nB2Hx/Uo9HuOisaCPvts5hEOY95Sdh0+1UQXGBpnY+BCILqHvOfdwVmpMxqzk/MA4l2ANADjhy3
	WJpsEU5KgPQt3tPM+1rX74ALwA89Kb9Tm5oMHPKBesbtdTcUZ7YsZc8KzRyXb+GGTZEKK8AY1Bf
	OMTvAKEtnQCyQD7IGDR2liUu54KzKzV09jI2h4atD7GvLcP96z6i9JnuVXzPohZQHGMiKyBBq2t
	2ebZNPVANd5mRmcLidoDMlvtHO90Hi6psnekjnPykIYOv/jvPCy2KPy+nQkJ+VwmNxpzdw4AX5h
	rWg7XIlSBpVmNVfCRiD/XvOsJ9A2yP75aHjTe5g==
X-Received: by 2002:a17:903:32c7:b0:2c0:bcb3:86f with SMTP id d9443c01a7336-2c718f1f000mr33930725ad.6.1781866477620;
        Fri, 19 Jun 2026 03:54:37 -0700 (PDT)
X-Received: by 2002:a17:903:32c7:b0:2c0:bcb3:86f with SMTP id d9443c01a7336-2c718f1f000mr33930485ad.6.1781866477173;
        Fri, 19 Jun 2026 03:54:37 -0700 (PDT)
Received: from [10.219.56.41] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c73663cc3bsm4044435ad.76.2026.06.19.03.54.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 03:54:36 -0700 (PDT)
Message-ID: <aaf4daee-4886-4214-a761-80545d2565ee@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 16:24:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
 <7xfxlxfqjcqdzl6gckaoyy2ioefglc7bgi66yv5khrbl6fi2zc@ivtiukdaj4jv>
 <d25f24ca-5bb3-4276-ac8f-8340e8fb4ce8@oss.qualcomm.com>
 <sdm7sqiokmsgczeat2mxch42ois5rwabav6c5fm7abct2xoepf@j3kraqrjvpoc>
 <ea345832-711d-4e32-af0f-bc74d8646aef@oss.qualcomm.com>
 <299d54c5-fb93-47ee-9495-fbf48a3204fd@oss.qualcomm.com>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <299d54c5-fb93-47ee-9495-fbf48a3204fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fnGvjNLN2O6Y5qx9jOS-thgA8wDjmWRM
X-Proofpoint-ORIG-GUID: fnGvjNLN2O6Y5qx9jOS-thgA8wDjmWRM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDEwMSBTYWx0ZWRfX7mssNeHVKqOb
 J9VxE7YCslyP8Jsd7hLnIJ+m53AyRrjs3LQbRROSoh0yorZrm/CTjIa6vTYzzGSN0/e/mK8dA5A
 DCnE9Dlo3GdmjgBezoIlQE7QZTl1FwJfyVIA1MPLrOVBpfQ3FdyzpiS0FaF/5nD85ulTA66EVlH
 oRx7HgE4XnWsKNuL7unVo9sxamiEleWCcclp6cpwE9bVhrpSK8UXxXnMWINwpblDi8waKHQxT4o
 OS9u8Hx+aLtk0rZLqoERUZNwcAY2Fi7wFqySiYjekLatBVvof+mGBAiuzD+/SqHp4ArClG6mm6v
 vczKfhBrM+rvKC4suhisG+K3QByRoNbLSW93lwfXWXufuQrhwmxAGlOWLykmExRIf2dO1C6TlyJ
 lvaZ/zZHb9dF+JC0CqxRuvKfV8MalbXW32gFFgZiTD6GeWmeyi9NhjOd7usrXgjtnV3GkG6JEv3
 OFPFCI/wSj8iXJX2Irw==
X-Authority-Analysis: v=2.4 cv=H6LrBeYi c=1 sm=1 tr=0 ts=6a351fee cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5sB-xfgw_plGXbDTPmIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDEwMSBTYWx0ZWRfXzC9t8KB3l2/u
 RQNpRwYwDjuHAr98HC92kwR1Qc1flKcxEZoUxVcxl8RvjMgz4He/BKvmXlExlLoBQay+s2BV6QN
 Tpe+zWtKiUll0BwiJ5yNddQ3FSJYMCI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_035440_270947_2984390A 
X-CRM114-Status: GOOD (  26.69  )
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



On 6/18/2026 2:58 PM, Konrad Dybcio wrote:
> On 6/17/26 4:26 PM, Bibek Kumar Patro wrote:
>>
>>
>> On 6/16/2026 5:51 AM, Dmitry Baryshkov wrote:
>>> On Mon, Jun 15, 2026 at 06:36:51PM +0530, Bibek Kumar Patro wrote:
>>>>
>>>>
>>>> On 6/8/2026 7:25 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, May 26, 2026 at 08:12:03PM +0530, Bibek Kumar Patro wrote:
>>>>>> On some SoCs the SMMU registers require an active interconnect
>>>>>> bandwidth vote to be accessible. While other clients typically
>>>>>> satisfy this requirement implicitly, certain corner cases (e.g.
>>>>>> during sleep/wakeup transitions) can leave the SMMU without a
>>>>>> vote, causing intermittent register access failures.
>>>>>>
>>>>>> Add support for an optional interconnect path to the arm-smmu
>>>>>> driver and vote for bandwidth while the SMMU is active. The path
>>>>>> is acquired from DT if present and ignored otherwise.
>>>>>>
>>>>>> The bandwidth vote is enabled before accessing SMMU registers
>>>>>> during probe and runtime resume, and released during runtime
>>>>>> suspend and on error paths.
>>>>>>
>>>>>> Generally, from an architectural perspective, GEM_NOC and DDR are
>>>>>> expected to have an active vote whenever the adreno_smmu block is
>>>>>> powered on. In most common use cases, this requirement is implicitly
>>>>>> satisfied because other GPU-related clients (for example, the GMU
>>>>>> device) already hold a GEM_NOC vote when adreno_smmu is enabled.
>>>>>>
>>>>>> However, there are certain corner cases, such as during sleep/wakeup
>>>>>> transitions, where the GEM_NOC vote can be removed before adreno_smmu
>>>>>> is powered down. If adreno_smmu is then accessed while the interconnect
>>>>>> vote is missing, it can lead to the observed failures. Because of the
>>>>>> precise ordering involved, this scenario is difficult to reproduce
>>>>>> consistently.
>>>>>> (also GDSC is involved in adreno usecases can have an independent vote)
>>>>>>
>>>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>>>> ---
>>>>>>     drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
>>>>>>     drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
>>>>>>     2 files changed, 57 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>>> index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>>> @@ -53,6 +53,11 @@
>>>>>>     #define MSI_IOVA_BASE            0x8000000
>>>>>>     #define MSI_IOVA_LENGTH            0x100000
>>>>>> +/* Interconnect bandwidth vote values for the SMMU register access path */
>>>>>> +#define ARM_SMMU_ICC_AVG_BW        0
>>>>>> +#define ARM_SMMU_ICC_PEAK_BW_HIGH    1000
>>>>>
>>>>> totally random numbers, which might be different for non-Qualcomm platform.
>>>>>
>>>>
>>>> Ideally, any non-zero value would be enough to keep the path active.
>>>
>>> This is true for Qualcomm devices. However, you are adding this to a
>>> generic code.
>>>
>>>> Here 1 Would be enough to keep the path active, but might be too small to
>>>> reliably keep the bus active.
>>>> Other is UINT_MAX, which will reliably keep the bus active but might cause a
>>>> power penalty.
>>>>
>>>> #define ARM_SMMU_ICC_PEAK_BW_HIGH    UINT_MAX
>>>>
>>>> seems to be suitable here to reliably keep the bus active by BCM
>>>> for both Qualcomm and non-Qualcomm platforms (with some power penalty).
>>>>
>>>> LMK, if you feel otherwise.
>>>
>>> Shift it to the qcom instance or provide platform-specific values? (My
>>> preference would be towards the first solution).
>>>
>>
>>
>> To support platform-specific values, we may need to introduce a LUT-based approach in the driver. (Bandwidth voting values cannot be placed in device-tree property IIRC ?)
>>
>> Currently, all Qualcomm platforms use 0x1000 for SMMU ICC voting. I
> 
> (you used decimal 1000)
> 

It's my bad, i meant 1000 only
(I'll check on the icc_bw calculation to get clarity on the values)

>> can evaluate if this could be moved to a Qualcomm-specific
>> implementation.
> 
> Add a vendor hook to arm_smmu_runtime_suspend/resume and handle it within
> the QC driver
> 

Just curious, wouldn't this apply for all the arm-smmu users in addition 
to Qualcomm devices as i mentioned here [1].
Vendor hook would make it Qualcomm specific.

[1]: 
https://lore.kernel.org/all/984ff9c7-3eef-463c-a330-bf7acd063667@oss.qualcomm.com/

Thanks & regards,
Bibek

> Konrad


