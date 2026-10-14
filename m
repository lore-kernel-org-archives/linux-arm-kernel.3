Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07B9CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8A/v1ScPhnPL3wg2XzmpvQmBVh7gCGcc/ddSXg+qT8=; b=w0IugUKCxC7ffvTYoLv79OKcy0
	QMR6vB6FZMiwhkun5SFl5xQiBGx2bkwMLS06XLCc2Wtf5dJd/VPADsXDRKU6qtHLJhKNunqfTDt58
	1j7H6ciw94ltC2MEhm7zqjm+I2gX0iMGfCW7ZUS86Sohvmn4bZ3iQHWB/YyjuYMocsLaaXa/PV9x1
	hUoyRMjv1I7k0Pqs8BxvQNhnEUkCIUdZGN6tMYVKZ4WeU6CmLQJtWVKhc7rH6UL9YAZstxN0dzv6U
	z0KMwyogahrXZWY+6EPMOwCWG4jpJafAUeiCd7qksN/wX5Oz1EVPIopSPvWbrIvPzoElfHMtxa/BC
	vOpt3xHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtBc-0000000EhQj-0t7Y;
	Wed, 14 Oct 2026 07:14:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtBZ-0000000EhQH-0J6m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:14:02 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E5wro83951474
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 07:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w8A/v1ScPhnPL3wg2XzmpvQmBVh7gCGcc/ddSXg+qT8=; b=JYqvlNGdbSkKupvU
	cb9t1+dgmj0aiWB8a2Q+KhxcX7UtsV2RF4XYYtqTeVyH7245e8ixc3jS0i9N1mLC
	PQAiYJLDbjKWxc7GI8tLpVUGeKmDnHw5LRDFTuHSAKhfXDfOv6h1MOyXrJ5PdsuW
	64uclrpTFrYt58BP3CC7Lw4BY2xsUUynJA4ivW6cgtlMefqAp43hWiDFly8OxTyL
	9Ka9yZdOxceJAK8tVY7DdLPbdZ2eGzUeisEE3Lx5hzBuhCpv/srikxNGhF/2hpiP
	QiT/PBqHVSPYUy7AUZMPnjjvLKun4z9pOX5Il7S51Ey+lH7Bb2YJFN7tbloGtEcz
	JM9Q9g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p09pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 07:13:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3abb4c24125so3378198a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791962038; x=1792566838; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w8A/v1ScPhnPL3wg2XzmpvQmBVh7gCGcc/ddSXg+qT8=;
        b=EhwDChigWE6yBmAZmVnBpEQXylWe6hcCPXwCCDb+FvJYVrLzRfUAEjFxpOV/IT6CN0
         lf7c2fHp9mAHUva0TCGjhmRNkisF9SlL61s+32PAuLTjbWHouURGxE230jEasz8LMsZL
         MY2ms/jj760YkrJuGC+WrtaAqhzYS8ueAjkGMEBir1FFjzcLgKW5GomfuCZz1s9wclLn
         xj6pcgqO4FHPCpbJUfV4TBoXhKt6CPzKpaxwAmhX0hSKTWxqmrTamzhXUKFVrP0YyERw
         Fe1nDwfYpA0mHmD5TAcAR53bTDqw9XlGkgzIutg4j6tsa9PrZm5QVKfBII1MlGe4vkOy
         O4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962038; x=1792566838;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w8A/v1ScPhnPL3wg2XzmpvQmBVh7gCGcc/ddSXg+qT8=;
        b=QZG7ZUIL4ik86h/915+CCOVtzRyDqXkMGbFPIP2hOGO7A2Jk+DWuZIQ04M7Es7yBex
         itewv/gqH4cPRPwKqNBZPSAeLfHNDRJBEYWC+BWdijSNEd3uvEKu/CZ0Xw/gA7vANAFn
         W2QL29R5prnmidAUQPOl6AlbnIB0DwGOcgrsj2NwbxsCVmosaboZBhP7roKGcH2PLdaM
         tz6LWKwXNU0Q7tDE8JMe95kG+MdxKDLYwMmjJBgalabdi3RRWCYzJs8w4PMc4yPDEMn7
         bIz7UKUKHfuOuH1Th8mVQUgyQicIv7TvNMc/6BO0o/wS+Wf7unoH1sDsFu99yRLmlK/w
         Upeg==
X-Forwarded-Encrypted: i=1; AKwUvByB+jV9NL2TxBcxb9iOh1TVr0UwD59+ulzObDmExgHGkXnMNOYYBwmJMUuzTH7jVXOfOEZlx7jtJ3mHgbwuP7Fc@lists.infradead.org
X-Gm-Message-State: AFq9FYLDq1VguJNCg5hphBUbXodZt1J4Tdl8t0j9E+Og0Sg6AYhXiWJ8
	FAC4oq1J/lNSqU4KaMQKOEXWM1vH4Jk72e+TnIn4wcEd9DE2MEvd+wJm/c6OH7e+JlsmuvYhH0R
	Zyob5l2qSVyc1VEz6JdbHkpQ/FAzZcKMh+JS77KZ0gELhmBDpyoUc9DLCjulrK0br5fmLlmJbzp
	Legw==
X-Gm-Gg: AYBFou1b2L44r/Ur2tYB3caoxt56hhDimST7jRX7w2folCfm+Lv2GxBJwk4OyO83rz9
	0vlpXsOmPJ56R5HDTgulgY9oI2fwX6zodM3troPiXPzMtF+c7wMPDTk/gG/xnHCa5h0u+UfThfX
	eqK/JdJ9pJ7+Srq9UmrN1wfOPaEXMBNz0kmHWdhZSCTZ3MzMItyOzPrMj7yLy6JCk9NjrzpukwQ
	VztkCBs4REuOMMpHfyRC+wxuoq6ABqTxn3PAF92JYQ8jmdDxvN+RxUT2OeFHaofY5dmdUTx4SMQ
	2REqbcNkQgsFLTEXDZwbxKzn1hCxOucbyVqfoC0yd0aXJQSIVIcqgghZmbBiD7r60HsAy3wUm6u
	oDqI4F2OR5fO0C7DBQM2BcedUsWMUmoVXpVnSt8QLuVylzTgkVHIHAO//SRenHLNW
X-Received: by 2002:a17:90b:35d1:b0:3a7:971:7470 with SMTP id 98e67ed59e1d1-3ab3ab20a3dmr11251813a91.47.1791962037970;
        Wed, 14 Oct 2026 00:13:57 -0700 (PDT)
X-Received: by 2002:a17:90b:35d1:b0:3a7:971:7470 with SMTP id 98e67ed59e1d1-3ab3ab20a3dmr11251780a91.47.1791962037472;
        Wed, 14 Oct 2026 00:13:57 -0700 (PDT)
Received: from [10.133.33.145] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac6006376bsm3136909a91.3.2026.10.14.00.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 00:13:57 -0700 (PDT)
Message-ID: <db1f275e-b97b-4be3-9295-acfb22875afb@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:13:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ben Horgan <ben.horgan@arm.com>, Rob Herring <robh@kernel.org>
Cc: James Morse <james.morse@arm.com>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-8-35196c2b43bf@oss.qualcomm.com>
 <20261008210004.GA1318789-robh@kernel.org>
 <1d764a3d-7935-4e26-b1c2-92537e1d3811@oss.qualcomm.com>
 <893507ca-b956-474c-9124-92fbfc25e9ab@arm.com>
 <f17e31ca-817c-4607-a680-55ceb12169dc@oss.qualcomm.com>
 <21f0c2f7-48a5-466b-9dd3-170a04e3af9c@oss.qualcomm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <21f0c2f7-48a5-466b-9dd3-170a04e3af9c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyOCBTYWx0ZWRfX1aviZf2CmkgC
 spzxcGrNLx+Yjlcol7mbbt4FrU1w7/OvrYGnnaHPBydBze6D/Sbo7kwhUBfv8V//rjhFrmfkyze
 nKof2k995plnCBmlP/jqRtAk81aIZC8=
X-Proofpoint-ORIG-GUID: abGmGjFOWtZC5uBpglp2JSKW8qofxQvv
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6acf2bb8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=0BaB_ceHjnLeFdfrkW8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyOCBTYWx0ZWRfXyFjPKgUT1ddt
 0ybsNjl+V/ndvfUIffuoxEB1pKqfIBho2E14vk/0mfJeb7tnMu3K+LfqRh6Azb5pW2oXQs7phGw
 dUaxCvdMTSMar9Kd/DOFYHyDYA3TOKtDqI4oKkJhdrXfz802OY2xK4l0A3xZCofq1Do6tCe7E/n
 gfdD4twXrJM26b0RNF+tVApzqNs7XnThtsV7mclDyng6RD32cag1kzuCqFbrBOmbpJv4J5OeDgd
 Oxth0v91LIBp83IpSpeCd5T1fTLc7RBeZAFl24HWA5dMCK/nsTyjocgkdEi1ap19oWJl8LVyX2W
 KbD1KoKgB2uipJNrbHrvnbC7jejiFzqeSh5nGy5/Pj6BpAGz6x9jSbRmInz1Jdo1jOezhCmNDMl
 MTkxp/ZZRSCfs4ygvU3TgsclBWLmhzJPz5EWlJhAolD4UBw1WcFMtrH9+m6Eg9Gr0Licc5nkyaY
 X3QBuZsRtjVMg1LVwRA==
X-Proofpoint-GUID: abGmGjFOWtZC5uBpglp2JSKW8qofxQvv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_001401_228930_FB56DC7D 
X-CRM114-Status: GOOD (  18.69  )
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



On 10/13/2026 6:54 PM, Konrad Dybcio wrote:
> On 10/13/26 12:13 PM, Yin Li wrote:
>>
>>
>> On 10/12/2026 7:27 PM, Ben Horgan wrote:
>>> Hi Yin,
>>>
>>> On 12/10/2026 11:48, Yin Li wrote:
>>>>
>>>>
>>>> On 10/9/2026 5:00 AM, Rob Herring wrote:
>>>>> On Thu, Oct 08, 2026 at 02:41:17PM +0800, Yin Li wrote:
>>>>>> Add an MPAM MSC device node for each L2 cache. Each MSC is nested
>>>>>> directly under its L2 cache node so that the cache node is the MSC's
>>>>>> parent device and its CPU affinity is derived from that cache.
>>>>>>
>>>>>> The L2 cache nodes are placed directly under the root node. The root is
>>>>>> the root of the physical address space, so each cache node only needs an
>>>>>> identity 'ranges' property for its nested MSC's 'reg' to be resolved to
>>>>>> a physical address. The two caches use distinct node names (l2-cache-0
>>>>>> and l2-cache-1) since a cache node has no MMIO unit-address of its own.
>>>>>>
>>>>>> The nodes are disabled by default. Production firmware does not expose
>>>>>> MSC register access to the OS, so these nodes can only be enabled on a
>>>>>> local test setup where firmware permits direct MMIO access to the MSCs.
>>>>>> This DTS is therefore only an example for other platform DT authors and
>>>>>> is not intended to be merged.
>>>>>>
>>>>>> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>>>> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>>>>> ---
>>>>>>     arch/arm64/boot/dts/qcom/kaanapali.dtsi | 50 +++++++++++++++++++++++++--------
>>>>>>     1 file changed, 38 insertions(+), 12 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>>>> index 131fd2a16c54..b1dcb1e9c570 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>
>>> [...]
>>>
>>>>
>>>>>> +
>>>>>> +        msc@19870000 {
>>>>>> +            compatible = "arm,mpam-msc";
>>>>>> +            reg = <0x0 0x19870000 0x0 0x10000>;
>>>>>
>>>>> The MPAM register length is 0x321C.
>>>>>
>>>>
>>>> You are right, the MPAM register space is 0x321c per the specification.
>>>> Will update accordingly.
> 
> In Qualcomm DTs we tend to use the ""how much register space is allocated
> for this block"" rather than ""what the last used register ends"" approach
> to avoid holes
> 

Hi Konrad,

Thanks for the context.

Thanks,
Yin

> Konrad

-- 
Thx and BRs,
Yin


