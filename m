Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA64DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 00:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uNehC+LYZqsx3fEVijuvFUAX4NEjwm4VUVbbO3e9BFY=; b=3goTamcRc/tEWM4BFI0uWdz5JP
	I3KMymaeKnYldGsFQnZbjrk394SDKYa87wkbcsdoflSHDXOIjqIm3UVOUuCdy8h30Eyk5QmzrHvuR
	oC8gADTD83+W5YVSdrlabFjnZjbAvBGnp7UTnCi3BMJLg4X0HxEl/WuqgtCgnVVbXGZcVvzxeK0NQ
	KqFjbGU/pzcXWEl8lTLcF5Z9vD+kHkPr0vJlaiNx5VWh2wZxyq72u1/LpvQ5yAUup4jsxmRTwil2l
	B9zDUp651/X1EQESdCCnwzkwJBupTC8Btf9JYwMKBZy8vgSwIXjJruQRGVQ9zv0yBQ8hEibVjEGfL
	h+D5ndTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf5eE-00000003JXg-3wnm;
	Thu, 02 Jul 2026 00:51:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf5eC-00000003JXL-0kga
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 00:51:21 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661LhbtA2491071
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Jul 2026 00:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uNehC+LYZqsx3fEVijuvFUAX4NEjwm4VUVbbO3e9BFY=; b=Yp+RXgMF+TW3nZYF
	6aFZ9BdeYbGRhu2uF+Nwm8yZAkaQgi3eRxMwJ889F+WLgpbmwJ9L1GQ6d1yWAS9H
	FCTBcX4pksrFnfCIufdtPiMx+gjo+44ORXJRybGh9jiGH7VKCBSM1bcOTAGxT2lm
	RPgAbbOXH5nm/xhjkKzVgRFJ3E/vKBFGmoMuSq1+EtHdCojYO0kw9cR7tCGICaug
	VGssj8Z/nKf3qhyZEsndh/yORjD+Xa1KJQFoFNMpaUdOIreF1gg75/WYQYiKdUFS
	mHu9TlKtUrv4rrwBGvRLZSDrCByPWeeyj92ZLwYS8XzP3ZsycJzAFeOZnB2Pb7eJ
	29QgUg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sd3b6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 00:51:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so1667046a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 17:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782953477; x=1783558277; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uNehC+LYZqsx3fEVijuvFUAX4NEjwm4VUVbbO3e9BFY=;
        b=hWyBExP+SX48l3NNvfHk8PZs/E7gxip7rPdoNIgu+/vCe8mikVnwW3PzxPamMFzt27
         7+yDiB39uzzvf1vCPB+PIUt9Ay7b3BbBOmka0uVE32afRrng8LxLeE7xxJDUDzKj/tl4
         rbKko7obKsaJ2tO7Na7Od78Hw9c1sou6fqC7d7WfWAALRUGZK0SRtXtW8cpLyt9oRgwa
         Z9pkBhB6y5XghL5rI7lcsyLthu96i/qhuND1shcHKNXpl6ln108UIWZfdAWqPYqsDa/Z
         fWYVE5SBcQMc7mFY2a5jHNdOIFJbcL225gkVfpg51r0WUe0mOgEKPHcd3G7EgHR8LZhN
         aBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782953477; x=1783558277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uNehC+LYZqsx3fEVijuvFUAX4NEjwm4VUVbbO3e9BFY=;
        b=DMLLiWwwkKBA1zW0Sb7vKXqtlPm+7YY5GcM3/WnmZP+/NwJDF+xJi6Bxq2xWkHqY6n
         X6TS0unfHIgX6g2x3SiRz2QdK6BAWQjfGL6Pl1GL1qwvM/uWJpm+Y1I0TRtOI9EBXKUf
         +2x/JjHKEZqmCyqblVFDrEmdC34Ghr+EKb5XVR+doQEVLZDIexNEg5tZIm1C38XXtPgJ
         kEFfaTRaxOU8pv9PNYf4Lw0TudXS4tmHtVZ2DjGXPT4YCoJDtYSiqDwy8+wf6RMOBOB5
         esBhga3ytyYEynE9VFd3QtRB/YluRkrALf16iyT7er3egx6IRbt3usCcLrhw6KHR0/IH
         aF+g==
X-Forwarded-Encrypted: i=1; AHgh+RqSo9yh2v1r+Z7ms6PlklW2uriM5WBQAZYcViUQl5J+HQzzIL2zAY5vYwz74Tbx1LBN16Suz85nzb37LosTkZbS@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi/6Nr74dVQlpQpKoO4VYHz2j/1CI9OQoGnGW2LGE2k/rvh2W0
	5dfN46VBVZJjc7+OHzwjUzDJ8pQxl7J5+omX4D91k0sDPgG1l3qMTfCIJbS8XAIA+HIJhLkmo46
	6COXGxrRUX1m6Jws7XpoJHxeH0i51NcWRmnZwSsg0WpF+ScWSpCxrpWwYk2EyOFa8/6W9Qgirs5
	/qGQ==
X-Gm-Gg: AfdE7clotZzS6aebHDmrBhPo+VyelelXOtIVkDSfSYRuRjaBLD5Bvs5YXowOgEXW5cy
	tu3wSvkM1yV2YFE0dG+wX8uKLt8hFNm+6sa/ZXKU7FWiDnl7b6/ZPG+xagna1/DwPvbQqEyp3mN
	vSvjTjqbP53w7f1qKiv3NeZRdXppJZjNbmMKNlBQFESp5dYd0W77h43rS/B6++E22ZpxfwctapT
	WVuTN2VWVXwkJwtuh/diiAtEl/IfWJBeYpoDBoMRogX10TjT6dajc+ZTMk900y6BaItR3Og8JVl
	fxcwfZzNyXGsWEiWbgjNMJ6DPkUjW71aDnRhVc8Hemv0LMexufESo81/PrKtXN3pWbRqOPPSw3Y
	NyB86KfTKO5v0vqp5GXuWmJHh/3s5+rutycGrxAeIEdp/iSHdzWt3OnCb21WZEDfVa2k6Fx8pXX
	qF
X-Received: by 2002:a17:90b:3c03:b0:37f:9ce3:ca96 with SMTP id 98e67ed59e1d1-380aa20dab8mr3313990a91.31.1782953477409;
        Wed, 01 Jul 2026 17:51:17 -0700 (PDT)
X-Received: by 2002:a17:90b:3c03:b0:37f:9ce3:ca96 with SMTP id 98e67ed59e1d1-380aa20dab8mr3313940a91.31.1782953476867;
        Wed, 01 Jul 2026 17:51:16 -0700 (PDT)
Received: from [10.133.33.125] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e146f003sm84699a91.0.2026.07.01.17.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 17:51:16 -0700 (PDT)
Message-ID: <6b789ea4-e06e-4f47-9a35-a2b58994f433@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 08:51:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: coresight-tnoc: Add standalone
 qcom,coresight-agtnoc compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
 <20260701-fix-tracenoc-probe-issue-v4-1-aefab449a470@oss.qualcomm.com>
 <20260701-stirring-piculet-of-vastness-a361e5@quoll>
 <4117c406-0d75-4eb1-842e-1d346b7fbf99@oss.qualcomm.com>
 <9aa63427-ba41-436d-ab19-a533082d336a@kernel.org>
 <62ac6887-1551-490b-b42b-2661d7152734@oss.qualcomm.com>
 <7838f7c3-0f38-4e93-a9c1-88f387e78ca9@oss.qualcomm.com>
 <d4669b9e-bf07-42dd-95c5-792e358c505e@oss.qualcomm.com>
 <12709ff6-bb42-4d3b-9f9d-e327cd8d89cb@oss.qualcomm.com>
 <0f05e07a-57ab-4ae6-8274-c9c496ca60c2@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <0f05e07a-57ab-4ae6-8274-c9c496ca60c2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a45b606 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=hEVlawO-5ZV4_H5CQOwA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: YVVQxaFU24YGME5pqEjTK0B8DF7IIUAQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDAwNSBTYWx0ZWRfX3PAwWCEnel94
 6dMMuDv8WRsOxikSGWTtj4bKzBac8lDaZIYrmH0hMC6HyAm5C2KTiTc2inoGPKI2+ym86ZwPdds
 k8di4MAP7fObLd694zku0QwsgzcTA8Q=
X-Proofpoint-GUID: YVVQxaFU24YGME5pqEjTK0B8DF7IIUAQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDAwNSBTYWx0ZWRfX08nJGVT3wTF/
 MvDv98SlwwrCnmQH1WsZe5VgPrxuvK29qSsFGcfBIN4gin3vlNGnwrn7cpSBF1Vvwx7H0vsOnPZ
 A/yQg8T2PVkmOx3bbs8SgWnvHX9bpEB3vGf4hmYtmyguL2ER3BKaC4PNN92tFcyEFtdQ0xosu0K
 3OiHVcejf3YUJcMAAzp9mwUIhPl9hshpLZgHfRfGi2XtUPVugPBL+Nka6wNvi26CoWj3VBQkp1C
 ImgsgEJYWI4jsPimVETaFMnxPwAfs+A3uqnnLUb9NcVJU49EPNYO5w39cvybnPQA3ErC4Uyo1Bh
 5aKWLPDnWpYRkbP5wbi0IBv7UdlHDjImU2i8zkqdbW7CH0UewFDIbVWZ0ndAzV8AAC5jOGCNKvm
 tZ/MCa78V4E8GbibQaQfUgvm3/nnP77a/vMkqqx0V78U/P6TforT6f7HS2s/DSJTujZg/PlhCxK
 VlgIEbGmK3YbpdZ6oEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_175120_342629_9E717F68 
X-CRM114-Status: GOOD (  20.45  )
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



On 7/1/2026 9:30 PM, Krzysztof Kozlowski wrote:
> On 01/07/2026 15:09, Konrad Dybcio wrote:
>> On 7/1/26 2:54 PM, Jie Gan wrote:
>>>
>>>
>>> On 7/1/2026 7:02 PM, Konrad Dybcio wrote:
>>>> On 7/1/26 9:31 AM, Jie Gan wrote:
>>>>>
>>>>>
>>>>> On 7/1/2026 3:26 PM, Krzysztof Kozlowski wrote:
>>>>>> On 01/07/2026 09:16, Jie Gan wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 7/1/2026 2:57 PM, Krzysztof Kozlowski wrote:
>>>>>>>> On Wed, Jul 01, 2026 at 09:53:41AM +0800, Jie Gan wrote:
>>>>>>>>> The TNOC compatible previously only allowed the two-string AMBA form
>>>>>>>>> "qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
>>>>>>>>> AMBA bus.
>>>>>>>>>
>>>>>>>>> Convert the compatible to a oneOf and add a standalone
>>>>>>>>> "qcom,coresight-agtnoc" compatible alongside the existing AMBA form. The
>>>>>>>>> standalone string carries no "arm,primecell" entry, so the device is
>>>>>>>>> created on the platform bus instead of the AMBA bus.
>>>>
>>>> [...]
>>>>
>>>>>>> AMBA primecell identification. The purpose of the new compatible is to
>>>>>>> clearly distinguish this platform-specific case from the standard
>>>>>>> AMBA-based implementation. Or shall I re-use the existing compatible
>>>>>>> "qcom,coresight-tnoc" as platform standalone compatible?
>>>>>>>
>>>>>>> We already have a similar pattern for the interconnect TraceNoC device,
>>>>>>> which uses the platform-specific compatible string qcom,coresight-itnoc.
>>>>>> I do not see there a fake, duplicated compatible for the same device.
>>>>>> Can you elaborate how is that relevant?
>>>>>
>>>>> Will fix it by removing AMBA related description.
>>>>>
>>>>> Shall I update the clock name from apb_pclk to apb as a platform device?
>>>>
>>>> Why?
>>>
>>> For the previous platform devices, we got comments to add the clock-name with "apb" instead of "apb_pclk".
>>>
>>> Please check the qcom,coresight-ctcu.yaml and qcom,coresight-itnoc.yaml
>>
>> Well, if you need to break the bindings already, might as well on
>> the grounds of choosing a saner ("clock names shouldn't include _clk")
>> name.. Not sure if Krzysztof will like it
> 
> I miss the rationale for doing the change, why exactly this binding
> should have clocks corrected.

Thanks for confirming.

Jie

> 
> Best regards,
> Krzysztof


