Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6457ACCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 01:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmKmcgnAzcg6F1fHCkzcngwonJWP7CEwpKltxdD0V9U=; b=z11Q/HRstiXFaL3NZqY1LkazTS
	iZHGIzNrHBDa5R2rfOjbaOEVfN0mor+O65FflkF0Hsc3oNsPsS+yyE9bW9mWpblvjixtaOZ0ZZaAe
	mDN41H1b23twWrG8MkbPSiKeXADDjXREcOAz4uGBhusu4xuGP9tDQoHJufSQF3IdiivgiCKooSIAP
	TntBLohqCVmgrKlv0Jc3CHExc0fUDwUXzx9qRRASVJh6j+YFtb+x60OIfa9nIgMYh2bI+fN4VrTxF
	AHkgtshgy4oWOO/gVIOjtXHsYRBOESwZvHzga4X0hqPuwvF+caatMibvwY88nnskJN00nkMqt1Tzw
	Zp+u2eUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGS6d-0000000CpiI-2rEz;
	Wed, 05 Nov 2025 01:14:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGS6b-0000000Cphu-1k8B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 01:14:34 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4KfewW2927459
	for <linux-arm-kernel@lists.infradead.org>; Wed, 5 Nov 2025 01:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bmKmcgnAzcg6F1fHCkzcngwonJWP7CEwpKltxdD0V9U=; b=I0WzNt1o5RNYEuLn
	clZx1+LqrhIdX+IqGLWSuWPCxcxQDB0iPOuIVHVmmlOaZ7H2pgLpP7IKKNvLRk02
	gLhQgwVb5tggVA7uo9EE4w+78ecKDFWGCtsppRzI0ghHMLbXLXCllU2lReaDeW26
	p8A1nQSB+aJJRuA8Cdt2WlOnXpD3PBYTaI1oqoDbca4ThzDPXTfBapiXI1uop1OI
	KbY226Fyssg+hFq8sq9qv7QLDjegEsxKlCgCi+cLa9kuXpa0xsCIhnR/NtpPMn6W
	KudVgOV1iCc41+szXhjSOXZMpgcA6GtybFk2Z3YlMcBvX38+FEk4UnS0eV5v3tJh
	ZCJKng==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7me5sj5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 01:14:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2958a134514so41258175ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 17:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762305272; x=1762910072; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bmKmcgnAzcg6F1fHCkzcngwonJWP7CEwpKltxdD0V9U=;
        b=aevHAvA4In4jppuryHaXMy/Az+iVgYFIxUDqgJquL9qnvyB4m6wBGXY9sTv1xP+QAP
         o67IqgBZbdQ/W8xZEtbwC+ndQl8ZP7XGDFeWggJj4rhmQQ1C/TOg+e0yQui+Myl7xFg6
         dfOxnoiG7+sGjEBbBcPUl4uT6+5yOWytIYU/X10ZoZbbCGrEu35IwaSjaBxDfEy8yIjA
         CHF2U+/PAVDQQ6En1GT6khWTP2Nh4S7W81+Toty2RLM4v9NLAYPHBGtsNZnNyw92AJAz
         4j2rCWxt2Fjocgfx2nR24zt2EfsmT+8qIKorCt7CMPC9IkKbHqHKrTSufD6qPE6W2Mib
         D1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762305272; x=1762910072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bmKmcgnAzcg6F1fHCkzcngwonJWP7CEwpKltxdD0V9U=;
        b=vSAG8zQDv+EpwvfXqxcksdFo+Tj/m20eay6gabU9jY/OdzADfE23D+Ds9MVcsZ0AzJ
         gW40G4QTB3B4tVWa9awa6ZRAuIG5hEgTMIkLBD45DVL7ihU/CpTEZBphby0qQuK9Ehei
         aByUmNlEvuxix9rkR5BaWL0vDhi75S2bBDCvtH7NX6Hd/wlHRgn3795bUuDawwaMFPQN
         APDNAfeNKBEU/UKR/Q1FR6nYW+e2ozUbdnZgZdhlOtgMQUzXNxknJ/82/vYMvufWMLK9
         zAXJYCn8fyCxLV1oXm/OwFzZa520/vZtzl+6R6cV8F+lMUzyO7VReR4pL7TfqJqfrW9M
         IUGA==
X-Forwarded-Encrypted: i=1; AJvYcCUJzVBwYN4QRT2bpjtgmitpVftMPf7dD6rmYdbKu1y8Pc5z8EaQZe80Hog/SgS22eeMTCGJi3zPYQ8f3jhoddXv@lists.infradead.org
X-Gm-Message-State: AOJu0Yxfu8iKCYO7UtYCA3rUwgqJVLBKyBrJcYiXVr0YQRda+QIBWDc5
	CIrGcn5Jq0oR7h5uU9zxolVC7eVVLPKdZV23TUv/2ME/HtKNZ8wDEnqvMJsb1lJmzxwUX5I06xb
	CUCb29kM7J0JtOGgjyOc4BJ1SHx4mtiZIhY7th/sd9/0Jc9kWtA8bg50x/occluAuv2OnMJoBfc
	r4wWVZ9IO1OmMd
X-Gm-Gg: ASbGncvShDgguL8E6si2BAuXkLoqZ+oUkTbPbRtJbTnVFfsTwLy9lOkDf0y+Dg3i+BK
	U27srvia5EHYGKDKK/T0fCl22MsF9tad8DSGce95KGDD6t0SfJTqtGpgzK8KTa3fvHgskTQPgaL
	XAI9B/jTRNtwIU+o3aVE9mBzdHcbybiHtDVdDjxDmNJVk3VAjW68d11e/hRQmAUOjZTByqO3a4u
	pHqYlKqSrn74Uxgr0RpOPjBFPJjf+ajgbGdu7kdn1rw64ZO7YF44SRS952Ia1JNcjzC7+Le40eY
	6EIcitNUdC7oCoFAQavqv0TD/nqZGTUp1pA2V+V0fpJiNr5VIAGioOkUwVEIM8y6BdLm0+RFCI4
	pJQ+PEl8cDO27jTI1LMIARGrrpXFrRiYxb4GlGszMly1uIXVfclvh4pKUfXqpBY7u
X-Received: by 2002:a17:902:f607:b0:290:29ba:340f with SMTP id d9443c01a7336-2962ae671a1mr18399815ad.42.1762305272188;
        Tue, 04 Nov 2025 17:14:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEED/fTV83G2ZG7/CS+zuzRag4nZh2Fw/C150/51l7Zurc95Tng0uT8OYLPRpC5Vpxhxx6R4Q==
X-Received: by 2002:a17:902:f607:b0:290:29ba:340f with SMTP id d9443c01a7336-2962ae671a1mr18399265ad.42.1762305271615;
        Tue, 04 Nov 2025 17:14:31 -0800 (PST)
Received: from [10.133.33.139] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601998893sm41616145ad.40.2025.11.04.17.14.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 17:14:31 -0800 (PST)
Message-ID: <8a7dd1b4-505a-4507-8cc1-75d955c706eb@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 09:14:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: hamoa: enable ETR and CTCU devices
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251104-enable-etr-and-ctcu-for-hamoa-v1-0-af552cfb902c@oss.qualcomm.com>
 <20251104-enable-etr-and-ctcu-for-hamoa-v1-2-af552cfb902c@oss.qualcomm.com>
 <25b7abfe-1881-41e5-914b-ee16ce63ed3e@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <25b7abfe-1881-41e5-914b-ee16ce63ed3e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NBQ3X5BDLH3x0phMoRrBtol0OXUR3tI1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAwOCBTYWx0ZWRfX+LJrWoKWcZ7K
 jdXG/B64I9i4I6mC0Hfhm+O78VaoPVdWgqCjcHqs3evHs3Hjuwa15LF0Z8iFQ0GtOoRF42ibQ0r
 D+Qg9ntabJprLcrMYswIQcFRIcPU6/FusijXhivipQ5nm51h74ZKpzH1NN42jSYZ1/5lIM9Jq/H
 vmr1OqOQljk8lGiJxu/rAm7NWOa4oDU2u7Go6l+i7rYhDujWVf91FY6z4MBqs1Mv4S7FfuVgCo2
 rtejTaF3wMjTOsubKQkiF02Qmk/u0xYtY7CZjH4Dhlq4+TvJK9VWCNi4rUZMcL2NAKgRCcKyKkq
 rvL2l7xgSM+12iAQbBi79P8y3CPqpTiKlZNFNvr3J3dbMw7uu38eEulh37w/OO9V5jbu7BHQWFP
 3KpbrGZdoTwMh9uvHS9wW4ZREhU3sA==
X-Proofpoint-ORIG-GUID: NBQ3X5BDLH3x0phMoRrBtol0OXUR3tI1
X-Authority-Analysis: v=2.4 cv=IpsTsb/g c=1 sm=1 tr=0 ts=690aa4f9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=DRhC30DjRFB-TwiKtc8A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_171433_480965_E7AD4E10 
X-CRM114-Status: GOOD (  16.07  )
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



On 11/4/2025 8:47 PM, Konrad Dybcio wrote:
> On 11/4/25 9:10 AM, Jie Gan wrote:
>> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
>> tracing data from source device.
>>
>> The CTCU serves as the control unit for the ETR device, managing its
>> behavior to determine how trace data is collected.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 160 +++++++++++++++++++++++++++++++++++-
>>   1 file changed, 159 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> index a17900eacb20..ca4a473614ee 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> @@ -6713,6 +6713,35 @@ data-pins {
>>   			};
>>   		};
>>   
>> +		ctcu@10001000 {
>> +			compatible = "qcom,hamoa-ctcu","qcom,sa8775p-ctcu";
> 
> Missing space between after the comma
> 
> no issues otherwise

sorry for the mistake. Do I need send a new version to fix it?

Thanks,
Jie

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad


