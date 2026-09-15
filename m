Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF7FC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 02:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N5L/sut4FAKbjGdymDCKaX2hkXlq96ynrY1kfZ9pBAY=; b=CPaKB2uZjc+L0/KaVjQ50TAifJ
	I3udjFo2UBMHlugKO1W48944siX7neUuxExp9DbgQfNpvMq1zTb5aRlKe1wwc3HCExGf8u5ktPKBk
	Dzj/1V3ku/WsFw/H7ZRHO7ORpMdoHEF+f6diFyQHSN1EvtHrH7mZYHTIa5+aTNp+zphVNufgi6egw
	3IW6z8Jz8O9QSHacrZ1yfbNUrbSS1P7wgSCuVTz36NkL/8IU5VTDkHFeeMyeLWB9RUjnAW90a8dtg
	zFl2gp/xpXQopTDCzVjezPHUX2CcroGIq+f12qVfyj8Z6Nzd4Oc1GHN7IZvBeJDFnTCW19FmHGGrG
	7yRh8V+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6JEn-000000054gO-2HIo;
	Tue, 15 Sep 2026 02:49:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6JEk-000000054fn-1yQL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 02:49:36 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F2nR8V1758277
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 02:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N5L/sut4FAKbjGdymDCKaX2hkXlq96ynrY1kfZ9pBAY=; b=Fl7YelN818eUZTu1
	0Kzflq90g7OCnKCWBJgKVz0EOsFkpXAHATYPPJoWI0f7W8CmKsdS6gTpcz9DneIg
	H5zVO+yu/8JQmTB5p/6nzQrXcv5DvdTTl8tw9+QDpWvIsCzXKVrNHWwCrn/8n7h6
	eMUyFXWcU76o/b0O901lhOAqp3q7HdV6UYg0Ep8hRicHAyG9X84o9JV/zV7ejPYq
	Q/pYa13wA5453I2eMTN8Q/zL19Ma0jiriEc4REQk1P7H6EwZvPNbbTuCS1QfBH+v
	QP5jZ3UVK7yPcf2WxRPk+Nl/WYlVEFHBO5RvFq3hVhXC+t4QBuU3MNj3xiH+uko1
	ZVFF/Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f42b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 02:49:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-396901263b6so7852260a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 19:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789440572; x=1790045372; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N5L/sut4FAKbjGdymDCKaX2hkXlq96ynrY1kfZ9pBAY=;
        b=YlosGS99J17FxCyQTKz94wJdCipQycZ+FXTo99oP175HcGgLROAuEkcT4miGNa7jjf
         cVEf/+hieBdcW92SjQFdvcssii6IxUeBPtbes5ZdIaIg4fScd+PsiF+5aFudefXqdNDa
         6h3c7nViLtAXjjWSJ3vGmGUV/71ZkKmaiwcsu+Z+hdJtqUCTf9Anv/29Dt21ardtd0/5
         0Hx9pY8wVgCmtDav2WZx5rmQSkkXWN6A7AnLczSsfzOOw774oCwvUH34HqFV9n1lnNEW
         vfRg1aaw+5HUCOJr/LjudegfNsErI9Hsu2Kz3YX5Wnfyd4t0wyS+hxfy66HTkvI5t1Pq
         xpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789440572; x=1790045372;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N5L/sut4FAKbjGdymDCKaX2hkXlq96ynrY1kfZ9pBAY=;
        b=bR59wQ3XfXKhlPL7zAmhQFPWR/etNyj85CfKrEkqlWZcgR0MpI0vjp27RlNAVHVAuu
         FchAcuEDH8NwemxSFJz/QAO1iMRFRNSrOn4MqkBuA8112yloR0KWykUayCq1e659vm84
         Qf6X10obTs2iELi+GHxD6vv0ClrLt0RADQf+NcSYY38YkrEQOAL9dWIff71o3h3odyS2
         /89pqa7qLTEvu0/2fSlyqOynit3wmMBJmyKvnz60dQXNMKWtc357jA36yjInkURtRU2Q
         6p/t+DSyPmeq/13Nm71zxFGA9DeLndll3hUj9Wa6XabrSqhyiYRePhMWEdbIWt9hdUM3
         JYjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaSW3OKZUjVwc+cj/1+eA3oZNxMWjYHV63mtWZdCh9PuygK+Wj5/6RhkgeaRw1ApKEOwX3Gz+7n4CdxBnBst6u@lists.infradead.org
X-Gm-Message-State: AFuF++nfPOL+hYLKnQCjhkn3MN42ohZs4qGwr+o1Q7GObwWx0ypC3egr
	ZYAphoM9g3tionKh2wVMmWC+1d96v03OOGJZst3Os3GRggIjt20ZS2mAt07TYwfhTAvLuarbUwi
	9DbjKFaAvYi4idWkt9SevczpgWoOju17IrFoO05RIxvjXCLeI1BnSOk7QHe2+zELoMcZjhdxG4E
	O8fg==
X-Gm-Gg: AYBFou3JR1fB3jdu/yxIssB7UFYIIXra54XGcUm3MA9h1hSkl7YARR3lAS7KPVdC/XR
	M57mNOAhUU5NhwsllVFqz6wwInDLZ2QgiF0tUVhek6NE1HF8iXe4+HRgkkdYGJk1zCvxRhGDSyl
	2PEY0TpdoY+ncr1oUtRtN1aLde1ummez7F4UQ2Etm9slADNWTwLvbzWjVLPbrZjj9SiSySZ3Xcc
	5gDftM6+i6CAfavxgfcXzSosvNt+sTQUafEBeptK8+tncckQZzx+RocelLkzP+A0sM57OEN2uRq
	nGQK5GYF8ZzkAwsOfN9Grh1ebPPY+0tDNfq21fsnASR3FvCXSOX6qIHhEUGh/Tg9ttSfAQ0EZre
	FXhK3Fpxg1+gcVIn3OWqAvkc8zE2zVQQmebvSKPebLFApKgAwTKY23QkWCnRtrbw=
X-Received: by 2002:a17:90b:1c83:b0:39e:27e:21b3 with SMTP id 98e67ed59e1d1-39e027e229fmr2339996a91.9.1789440572248;
        Mon, 14 Sep 2026 19:49:32 -0700 (PDT)
X-Received: by 2002:a17:90b:1c83:b0:39e:27e:21b3 with SMTP id 98e67ed59e1d1-39e027e229fmr2339934a91.9.1789440571725;
        Mon, 14 Sep 2026 19:49:31 -0700 (PDT)
Received: from [10.133.33.86] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfda39eb4sm2127854a91.8.2026.09.14.19.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 19:49:31 -0700 (PDT)
Message-ID: <38215e79-34b6-4731-9853-d7f529861162@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:49:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 03/10] dt-bindings: arm: Add MPAM MSC binding
To: Andre Przywara <andre.przywara@arm.com>,
        James Morse
 <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan
 <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Drew Fustini <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
 <20260914-mpam-resctrl-dt-knp-support-v2-3-bf6645bb2f65@oss.qualcomm.com>
 <f71cfbcc-2e53-4e37-bb98-693996542396@arm.com>
 <07d32b4c-1f00-45e5-b318-0f28bbb46f33@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <07d32b4c-1f00-45e5-b318-0f28bbb46f33@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: u0CsAnMfKvAW7TFg1dG8X7OO-wbK9Ktz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAzNiBTYWx0ZWRfXxXhOt+t5TnMa
 Mkx15syV5URKs9S9nkESTS4i0rweWaQ/dq4Opx4VzqiOUf2rObeLKDeRxBL7ZRagSZRTdf9mWQ+
 bYoSP5ljO/q8tb+XZf1gKocHWlbBUcM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAzNiBTYWx0ZWRfXzCAgWszW2P5C
 mdIuJbw4/Ytq8bZOChqlnNNrKDjsAGUgvZcgoZK6d99bHLiAIPkFt1SeiUGSydv7sNdbOTSp2ID
 RvIVKDwvUN6AjQwvfVBXbKBlTWKUQ+9+rZK2r3acV4mEPkZWUns03bpCbPhs6DAo63OKhp29O1k
 M0R6BUC0ohvj2jOL06FICPDNe7sDyXLGg87SRUQxAIcNx/85rb5yFLXQEengkl6tnBzgPByyImc
 q8djhDoQF9j2TqC865rIb+ZorkWk99l0EMNaOZJxDXMF9PlvEmtwjZH2f73GF1yLWIbASsRme46
 wIy9y3l5jhaMXv9PzvqcIB91nnKzyIy6yLByDJiCz9HU3nRVoqt29RSyuWqundq3IAA63NydiQQ
 VeliK/PMHOQ/hZyKk3iTbaKANr3wK7ILI0vqV3afZrRvc9mvPiyS/tf7pcb3zfNQCyfMKNObXKK
 nNuuonNlgTwM0jbQ3gg==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa8b23d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=uI_jzqnufFvfmlbxwmcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: u0CsAnMfKvAW7TFg1dG8X7OO-wbK9Ktz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_01,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_194934_642627_D52F2C24 
X-CRM114-Status: GOOD (  30.20  )
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



On 9/14/2026 10:50 PM, Andre Przywara wrote:
> Hi,
> 
> On 9/14/26 16:41, Andre Przywara wrote:
>> Hi,
>>
>> On 9/14/26 11:37, Yin Li wrote:
>>> From: Rob Herring <robh@kernel.org>
>>>
>>> The binding is designed around the assumption that an MSC will be a
>>> sub-block of something else such as a memory controller, cache 
>>> controller,
>>> or IOMMU. However, it's certainly possible a design does not have that
>>> association or has a mixture of both, so the binding illustrates how 
>>> we can
>>> support that with RIS child nodes.
>>>
>>> A key part of MPAM is we need to know about all of the MSCs in the 
>>> system
>>> before it can be enabled. This drives the need for the genericish
>>> 'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
>>> until a h/w specific driver potentially enables the h/w.
>>>
>>> Cc: James Morse <james.morse@arm.com>
>>> Signed-off-by: Rob Herring <robh@kernel.org>
>>> Signed-off-by: James Morse <james.morse@arm.com>
>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>> ---
>>>   .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 199 ++++++++++ 
>>> + ++++++++++
>>>   1 file changed, 199 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml 
>>> b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
>>> new file mode 100644
>>> index 000000000000..53a6fdbbf05f
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
>>> @@ -0,0 +1,199 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
>>> +
>>> +description: |
>>> +  The Arm MPAM specification can be found here:
>>> +
>>> +  https://developer.arm.com/documentation/ddi0598/latest
>>> +
>>> +maintainers:
>>> +  - Rob Herring <robh@kernel.org>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - const: arm,mpam-msc                   # Further details are 
>>> discoverable
>>> +      - const: arm,mpam-memory-controller-msc
>>
>> But that doesn't match the examples below, does it? Don't we want to 
>> allow just "arm,mpam-msc", but also the memory controller string, with 
>> "arm,mpam-msc" as a fallback?
>> I guess the pattern should then look similar to interrupt-names below?
> 
> Just seeing that you fix this and other things up in patch 08/10 later.
> I think it's confusing to have this split now for a v2 still. I wouldn't 
> be aware of previous review of this original patch, so it doesn't really 
> matter. Please squash them.
> 
> So I think you should merge 07/10 and 08/10 into their original patches, 
> otherwise reviewers might just get confused.
> 
> But you might wait for a bit with a repost, to see if there are more 
> generic comments on DT support.
> 

Hi Andre,

Good catch on the compatible issue in 03/10: you're right, "items" 
requires both strings to be present, whereas we want to allow standalone 
"arm,mpam-msc" or the two-item combination. This is fixed in 08/10 using 
"oneOf"; the iommu example with the TODO is also fixed there.

On squashing: sorry for the confusion and agreed on both points. Since 
this is still an RFC and the original authors haven't commented yet, 
I've kept the fixes as separate patches to make it easier for them to 
review. I'll squash them in the next version.

Thanks for your quick review!

Yin

> Cheers,
> Andre
> 
> 

-- 
Thx and BRs,
Yin


