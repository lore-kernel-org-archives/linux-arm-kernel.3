Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1381C4452A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 14:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFbXZVYlpWFB+86AR3x1jH6JDJM2yKuesn95gcq6Bt8=; b=LsCZIT4xNa9FRAIoNp6ciTtPz1
	12zdRqaP8kBcAvoVEKYUepF2/Xi2xQTp1Lyu7UG8wYShUi+yZJWfhaRc9KBKEA+hWjaeLaAUum279
	1IZSGZdfx6Wemu9eU/69VZqkhrk201R9q9TokfV2ppwlJRKfUkNwkiV5zljCcpcKB+G+rPGqL4tl4
	mTzmpkObApQnQ5sxuD/7ciAR1o6XOsLyUBtwwB46axRExaCMAWcobf8rqIbUsDmhI7EqutVOPOUTp
	fgD+R6YMnum7l+ZIn7LrI8CKxCYGL4a2pT5ONXuOaky7fUuAHURgqudsb4FIJz6NZK9MdrjWU9QiH
	v1kBUazA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloj1-00000006vUr-0zTV;
	Mon, 20 Jul 2026 14:12:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloiz-00000006vUB-1rqk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 14:12:06 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDqkux2746904
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 14:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IFbXZVYlpWFB+86AR3x1jH6JDJM2yKuesn95gcq6Bt8=; b=MgerdfAGT8P4AsIY
	Bb7+lF6ar+WGa3Xv8UPRLAtbfgAI/6Ay7vu4wY8upS/JK5Sa4OIcHGWZO/LmPp0k
	PADPqEm1K7t+R5eprqmKKggHeDeSa53LKG2MLyxAs0/FUqGMOCsuYtxn4FkbrXzI
	zmiICvyIcNsfmP6ZlurHvwAOL4qtRJobKmZRaS1f9yLlpu3CrZpcasDVXaIiCTfK
	6EfQNPZFVKokSQ7lcV9W5Ok46nfJaXR7ADHgw4qM5OmhoYwIx6FuzhrK1raFem3J
	TzKdTl6gu/FyBHhh2CR6PO9dZ+0Rf9UkFaBg3yU2yHJLFjoNkvwdwYnB2VZlm/3Z
	R3ul/Q==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhk2f8kt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 14:12:03 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a416619e8dso6995118b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 07:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784556723; x=1785161523; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IFbXZVYlpWFB+86AR3x1jH6JDJM2yKuesn95gcq6Bt8=;
        b=auzPElUc6T1LiBSUtxjt1a21ELq2NjgikCOq1oBntcHk++UkOp2Nw+2KuANTXxIdVd
         ofxadF+dVAqvQcyhSA3jMf260DOG7nRm2dPmFh4oDT8fDxbfJNc5nQn9wA45BDLplfrw
         LCYLqaXdSwY6oO/PlM63eJdxWd9ozpYhPpLute4Sc9cNJErKZmxZsJEBA6hxa5SqDtGa
         ddHwR9DQ7g8M2RxZOfsS83fRGv+q+vi9zF2CGuG8P6v8TJ4bG9vpxcrhZVmIn9oX2ChX
         Gbc9q9Gki1lB+mV2b9QDYBG2lqUAmr0dhKODM6wlWdJ2JJWT7F2Knritq/NNz9DymKvT
         IOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784556723; x=1785161523;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IFbXZVYlpWFB+86AR3x1jH6JDJM2yKuesn95gcq6Bt8=;
        b=byDgW5KlGujY/cox6aYeadv9/GzVvhEWvhWd7m8MmLLfKkgtVSvObs3dxNfLRoCEyQ
         HiU7UarySknb1EzDefW2WIrH3UjOUTQgxfxthFEGrPiWzKXI96B8H6weW5icF9aGMOPR
         yAAZchGiyrEQR4TpHokGV11cXh1ZQY0t8nULBq+gdnkmqaXsXy0LveRAJP79kG5ZXgOe
         jYVXIvrhF8Y4BZlw5XGA3VausDmSNUHmHjVb4B7lpnKNlYdAdR80bbgCi+hucCQHvhQg
         llmbW4YbDNbdvSP8HO0rTS+NNFMcSUEqjF2fTckakr+Lnja97D4d6lZPJTKxFrIfbT+6
         7TyQ==
X-Forwarded-Encrypted: i=1; AHgh+RrDHa9WIRe33v1+hvSkihSFzZj5f4eKu2MUzPQCWRHvAx1nOn4Jobz/Q+PESYNsL8mlS4b9nXgu+Af/Md2NYjG5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5Ersn7/F8N7LPSNVYyebuQNMqTn1NhdAivu0oWukWmaIJuXPG
	QcWitxy9b9Huvw2X6/LB8LAuMCdeynJf8sMyNONYo5+c1Tv3Lfq2/EvtB0NKH8eHkG9seFu/TCt
	xKP51BCGc5jWqE92qClD5rCAOCRbpN1khTH2V4wyuN9uuaLxzo6hkooPIPuszBAA1k5GwqoAWCa
	uiOA==
X-Gm-Gg: AfdE7ck2SdljLA85IG/ZEfgKSK/wRRHNTJqYc3T84T64rGSmqJBp60/Yhatqszt8TA6
	4rIlYCw4hP6XbDwNQl0O4MAXwZYxtG553zzgPY9gsuooWRyAE9nsQhoFEf2OeJeRl014VIMKyyg
	R4gITPuzMw9ZidbWBy/y2cOx1CEVsTXY3RStW9J1tYRQfAEkn24U53UVGohGUNPuglalpku39+C
	xyItsuLyWigh3wrES3tj4YSn6TRu2eRoz9aO+TgIaMLn3XyLqaNe84Xq/q1wHP0yEmel49R4AgL
	mMefRXxaVS5BM8L91ROn4qVDOQRmLEQe4cQoukvgrBMHVoFlgFOLpQygqhrmw1s+VbIbyRMukoD
	eUdLB2vzn4TenU/Zpn2k0w5y6Ln1O
X-Received: by 2002:a05:6808:c3cb:b0:495:fa67:7496 with SMTP id 5614622812f47-4a4cf26bb93mr7248859b6e.14.1784556722680;
        Mon, 20 Jul 2026 07:12:02 -0700 (PDT)
X-Received: by 2002:a05:6808:c3cb:b0:495:fa67:7496 with SMTP id 5614622812f47-4a4cf26bb93mr7248832b6e.14.1784556722182;
        Mon, 20 Jul 2026 07:12:02 -0700 (PDT)
Received: from [10.218.33.224] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a4d3d36340sm7497247b6e.16.2026.07.20.07.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 07:12:01 -0700 (PDT)
Message-ID: <9f31bf3d-3c7d-45ba-bc25-e6349f689b70@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 19:41:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
To: Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-1-afdca0125a65@oss.qualcomm.com>
 <nrht4irqtvt2vk3lrqvljonarc4kanht2nrwjt7pppsfhozffv@o4xei47l6gcj>
 <e8b247d9-d60d-497f-a831-a9772d27481a@oss.qualcomm.com>
 <phlk6zsxr7szdadsvgoecf7ewcqjkuaj5aeqmfqa4uvvvvnsmj@57u2pofxewuh>
 <4e266d45-ee88-42f8-91da-6253927686ae@oss.qualcomm.com>
 <ak5pC_meP8KRc3wJ@baldur>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <ak5pC_meP8KRc3wJ@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KhdMjYeZCTKhYN2QhiUrO97zp9PnuCP1
X-Authority-Analysis: v=2.4 cv=X8xi7mTe c=1 sm=1 tr=0 ts=6a5e2cb3 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=fPhLyPd3YuFPpQYp6doA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE1OCBTYWx0ZWRfX+8zV8eC3ugw0
 YBbaqBvkBCe+hMHuHLQ/L1H0Dwf/Eak07XO90yzjRX4pFsGhKFioSaxt3aqloZmsLx1byzZA1Kn
 D3Qaj4qxLYcQkYZy/70vIo2xw8PJtRQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE1OCBTYWx0ZWRfX9kv2id1nJrkH
 Hr8aO1WKLYVToTrBQIUfgVJoHaI2ssuuGDxRoTRfBFcn2ZLbUFx4jIp8cb8tie9OozoDojvLH3J
 llTgxUG6OhVITGiLfKB1NdKyHN/1NlxkRAxXpct4RmWnuE/EkG77Le4lFzUP9Nwb5daptP+0Efy
 X86oPQHnTe9l9QChyyk9vOeJlODzfzIy2X7IeZrJbL2AhH++lu2bt76soV4bJ11Zkt0kY/cmf8f
 URyT6ynB6LVw5ZbQ27doC5IZSzSMWCo8q78/HmPcx76tbu4CqFdNL/m6Y/s+bXkC/813XkeFVuu
 1G/vB4z4attBsQGgCVLU4fGw56eE/i/w7GAKgE/uBS/rN/xCVHfgFz+WnaFvbWHjE/s5gu+UFpM
 U2rMg382Px0UnhRVrDjKDyDs874oZqi8gDsIYFsao/3XE165P8ALklG6iXzgF1y9yz2L08IhDdh
 J/Npn/XUJFisB3aXIEQ==
X-Proofpoint-GUID: KhdMjYeZCTKhYN2QhiUrO97zp9PnuCP1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_071205_603730_141CD708 
X-CRM114-Status: GOOD (  34.11  )
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



On 7/8/2026 8:48 PM, Bjorn Andersson wrote:
> On Wed, Jul 08, 2026 at 08:22:00PM +0530, Bibek Kumar Patro wrote:
>>
>>
>> On 7/7/2026 10:12 PM, Dmitry Baryshkov wrote:
>>> On Tue, Jul 07, 2026 at 06:06:59PM +0530, Bibek Kumar Patro wrote:
>>>>
>>>>
>>>> On 7/6/2026 11:09 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, Jul 06, 2026 at 10:26:34PM +0530, Bibek Kumar Patro wrote:
>>>>>> Some SoC implementations require a bandwidth vote on an interconnect
>>>>>> path before the SMMU register space is accessible. Add the optional
>>>>>
>>>>> Why is it limited only to those SoCs? Is it also applicable to other
>>>>> Qualcomm SoCs?
>>>>>
>>>>
>>>> I was hoping to keep this series focused on the core infrastructure
>>>> changes: the bindings, base ICC bandwidth-voting support, and DT
>>>> interconnect properties for the platforms currently supported on
>>>> Qualcomm Linux and have been validated so far.
>>>>
>>>> The additional targets have not been tested yet, so I'd prefer
>>>> to add their support in a separate follow-up series once validation
>>>> is complete, rather than growing this series further. WDYT?
>>>
>>> Then it should be a part of the commit message. All SoCs since SDM12345
>>> need to vote on the interconnect (and then, in the cover letter mention
>>> that you convert only a few of the SoCs). We possibly can help with
>>> testing on other platforms.
>>>
>>
>> Ack, sounds reasonable.
>> I'll add the first platform onwards which interconnect voting is required in
>> commit description.
> 
> But to what degree is this related to a specific set of platforms? If we
> look ahead, aren't we expecting the list to grow to include all
> platforms in the end - resulting in a lot of noise and churn.
> 

We have seen this issue consistently on SM8750 and later platforms, 
along with at least one customer-reported instance on SM8550. As a 
result, downstream Android implementations already vote for the required 
interconnect bandwidth explicitly on these platforms.

On Qualcomm Linux targets, we have observed similar issues on Kodiak, 
with a few occurrences on Talos as well.

My understanding is that the interconnects property remains optional, 
but in practice it is needed for Adreno SMMU operation on these platforms.

> Can you give an example of a platform where there is no interconnect
> path to vote for here or where it would be harmful to do so?
> 

I do not anticipate any functional issues or side effects from
explicitly voting for the interconnect on Qualcomm platforms where the 
path exists.


>> And update the cover letter to clarify that this series adds
>> support for the Qualcomm Linux-supported targets available today, and
>> the list will be expanded in follow-up series as additional platforms
>> are enabled.
>>
> 
> The binding should not reflect what has been implemented and verified in
> Linux, it defines the contract between DeviceTree and the OS.
> 

Since the property is optional, would it be necessary to add in AllOf
the list of compatible for which the property hasn't been added yet, or 
for the compatibles where it is added?

Thanks & regards,
Bibek

> Regards,
> Bjorn
> 
>> Thanks & regards,
>> Bibek
>>
>>>>>> 'interconnects' property to the binding to allow platform DT nodes
>>>>>> to describe this path.
>>>>>>
>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>>>> ---
>>>>>>     .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
>>>>>>     1 file changed, 27 insertions(+)
>>>>>>
>>>
>>


