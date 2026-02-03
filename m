Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0DDE8305D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 09:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rukF0i9oSB43jxeOhCrzD1uPcESef8W7GSXb7mIQH4o=; b=DZRa721cvKNz10R7FjF55eSsX6
	bTz5F0hYt71FTn5sWL1xW5R/zaL7ViPxdTbumEt7m3twecEguvtHpKChRGzs/I0TdU2Ey6wQedhPM
	nd6nLxj/dcwDE011c57+U7a3VDUNRL3/cxce4NOJHwOrocc3f9FyKQHBK0kQ0Xazjz/wac+lcTBWB
	ApOOM9g/0qwMziB1zgjMjij4xIs9hYHrqLCCCCA8LqDb0BM2/WkePEMl2B5Mz1FSbYGezmN2kcTVc
	ufvDQ4mQDhM6quUCdHVlq5rd+NBXAkQEcWuKgYMmxFwl+Il8pP10FlHnSjlz33RmOHEDHfTTcAK/S
	3SqN3G9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCHl-00000006LVJ-2T8n;
	Tue, 03 Feb 2026 09:01:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCHj-00000006LUZ-0luS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 09:01:24 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613545SN2106939
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Feb 2026 09:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rukF0i9oSB43jxeOhCrzD1uPcESef8W7GSXb7mIQH4o=; b=Z9+QyQ/3S3K8/dIy
	C9a89ohyzFOmlOTkvQsZ54ZF49OxAhMZ0ti171mXCwQH5bGRA2MUBE/M3+kgh2/j
	fcQURBzhtyBrzl/+gSqnfhOnYB0Z4GmBebZlsyWCGHjN4iBYe+Skq2VbcpgZhRlX
	nxV4dZ+asu3q2QNBSQPqOr31cTzj96p8q+zPvqsXp3eJozUOk7Grb45owd2HrerY
	eORTdg14AWN2VUC8q4NQTcXUSdEhCcuup1gm+wZu+smmEqh6qqj09ghSnt0L5QRH
	S6Ie/3kRqRXo2enNHt0gU0gA2y/fX5USTKTuXlU6ZC8+7sDTsWO9tXCpuRJe6POO
	ZEpi6g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2t5ebtr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 09:01:22 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c68b97c0adeso533969a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 01:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770109282; x=1770714082; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rukF0i9oSB43jxeOhCrzD1uPcESef8W7GSXb7mIQH4o=;
        b=EZxPwi2PRQ0ax2Bp5+k+UdT4EEZxvmFsBqCRD1hQEpflJRIMkDvgvoyOAM7Ax6oFQA
         XGSX4qd4ZoTiJyu1u//8f8vDZSLj1nfNRxGCXTXRXT1Jt9kyySJrcPtYtRyQlBoOV/Uw
         8N2sTG/DVlTMlbbK5fxVFKGJfSaa433njRF5SjF1bWHtpUiL6e/dXGJUY8C9SjbGg0Se
         4reqOguGLdDqYMjwgW6NYId0wkLtHMUnUZhfIDhtEhxDHwvdX+OsRxKpcE5RxjWOnqrT
         aVW1DJlW1orCDF2mNHHS5FVthBMSVjWRmAS9kcONSLULX41BmNDOar/EYZVcRbAC4TTm
         qhDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770109282; x=1770714082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rukF0i9oSB43jxeOhCrzD1uPcESef8W7GSXb7mIQH4o=;
        b=UFTp6JY04U2xKkqktrF26JgyGzzlMcDBJCQiLneHq0XWiCKW33D6g7OjTMTgK4EuAB
         xn7CYNe7JV/z5nzLGN+sc+kJTHgSwhOCc4WhnwrJZIh3QyqJKvOZLEmR50v7uvsA3Swd
         eqDYLdTxnHccb5MTxYt+BJm7DfcYXUXiHGis/IXSo/FSXOIYRoOjrV3ThPaspxCEblLx
         kdeTyBoC0annmG98GYA+EWVBVYKW33s2aHZSMleTSrvn2hKIsFiuLehkn5QHiSNg4Yuk
         7sKldWcyl2nauFkampcFOxWdj17Zo7CBLD7yylzWcQqcxxI4vM6mi0Bhho4JkH57i9Hp
         MXtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlrnpN8Oqdq9A21x9Jhm07W9NTK5tQSozIlswW4jrJuCq/bYazvXqrUFv4poz/G4qkrI0r1P1t4ka2jnmo8Y3c@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn5mwlSX8GRemkJET9tv2mYROHfruoH5YopWwK0UYAeHmjWqPI
	5B0ctH2WYZSCW9T0Da5TZmG65Buelc9/I9eSn5LshPCMilzlklJhdb1nL15XQNHHwNy/zS7Kjso
	NzQbDlHu9wnWauvaROIPxJKmEXNubNuZqGtXBaiRdJDf2E/MhL0cOqyWu0rTY+cyEI9RPcYd+85
	gnhQ==
X-Gm-Gg: AZuq6aLCR+olkhtLi9DIFAMZlk6V7hHOT5V6IvSvUqbGBXJEcZOG4AO/3vm7s4PjJrI
	ESBXTu31YT7BCDMkbKAxkzeNytdLdwu4btDGtRWrqzrj1aaLT7euDm2GczxFPCCRSRLTiIUbsXx
	P7BB4xVtOPN1Lybkc9LwwVNlAwgOqRacI5OSBX6YIh+ARDPCQ+xE+OWhoZVXgVMp53ldshbn/fQ
	CLHJ8SKy2B8bNQH1RRnokpUtCHSr8WqHpeLMIhI91B71mQNnpp8djJeAG/6FlY/vayYf1Qb9cGc
	kL4Yl6NOMYdUYXv5yDNsovONsOsot1m+rhFXgH55lRihXcznNOSxlRgshXuT/Elysx6KI4pC2cQ
	wDiLwQ9A+MK0GMMnJr81cmeIYV0kkrugCOaqFkY4nTXVqm7eDIXbR2R3bw+GK4yCbi0Pf0QBaFA
	==
X-Received: by 2002:a05:6a20:6a0a:b0:38e:6774:382d with SMTP id adf61e73a8af0-3935610a947mr2372401637.8.1770109281800;
        Tue, 03 Feb 2026 01:01:21 -0800 (PST)
X-Received: by 2002:a05:6a20:6a0a:b0:38e:6774:382d with SMTP id adf61e73a8af0-3935610a947mr2372348637.8.1770109281221;
        Tue, 03 Feb 2026 01:01:21 -0800 (PST)
Received: from [10.133.33.29] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4173a2sm174617025ad.30.2026.02.03.01.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 01:01:20 -0800 (PST)
Message-ID: <4c2c3578-867a-4a1c-9f3a-fa7506371795@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 17:01:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: pakala: enable ETR and CTCU devices
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com>
 <20260203-enable-ctcu-and-etr-v1-3-a5371a2ec2b8@oss.qualcomm.com>
 <d91d62ce-8d85-4182-a0e6-9253f07bd002@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <d91d62ce-8d85-4182-a0e6-9253f07bd002@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3MSBTYWx0ZWRfX4I3eIy9YvgCR
 G4iPGWSAlBXooi06N22ojhkZw91PUtV4185GrFt1wtM0Xf5TmF7Ffk5Wty6H+eH+Foo/bryVKVS
 oxXia30VGY7hOaVzzmtiuR0lpnXZebsvNCISlGy148ML2gbwLUEVB9PghpDiIoEHk8gIHQQc02z
 5+ooOHtXeb0H91Jvl5ytBYWWiznDcJzPxWQPzUaJzqGECIHHwcG5CfLRKiKjfMx3HzBMxgqqDSp
 SA5W3hv7hC3bwZ1i8doggZ5e/2OcKnyGeq4EfSMTbERsPBc/x5J8UZylm/P7KZNDp33M/wn5U07
 hZZyESN2Lur0KzXnzlmdDNC+TtP3yMHeosCyjWzo5c0Hotnwsga+oThmjp8xb/wNfCT4WW+AurV
 2b4AhK77GNtPKIhvwGGd/pxuHJ/peFNhQy7wyma8hDW2i3L+ke0kuoObHYMlN8RCYnqonskKbtJ
 Di8BuvLnJvfnshE92Lg==
X-Proofpoint-GUID: SWQwI7uPV4B2ZDOfj6P8e8QIsuonz0HN
X-Authority-Analysis: v=2.4 cv=NOfYOk6g c=1 sm=1 tr=0 ts=6981b962 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6DexCDkPx0JeSCrEoRYA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: SWQwI7uPV4B2ZDOfj6P8e8QIsuonz0HN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_010123_233471_F04E6C1A 
X-CRM114-Status: GOOD (  15.18  )
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



On 2/3/2026 4:56 PM, Konrad Dybcio wrote:
> On 2/3/26 9:08 AM, Jie Gan wrote:
>> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
>> tracing data from source device and the CTCU device serves as the
>> control unit for the ETR device.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8750.dtsi | 177 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 177 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> index f56b1f889b85..1e39503360ef 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> @@ -3574,6 +3574,35 @@ tcsrcc: clock-controller@f204008 {
>>   			#reset-cells = <1>;
>>   		};
>>   
>> +		ctcu@10001000 {
>> +			compatible = "qcom,pakala-ctcu", "qcom,sa8775p-ctcu";
> 
> With "sm8750" in the compatible:

will fix it.

Thanks,
Jie

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad


