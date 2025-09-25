Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698B7CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 08:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBT7rTwERo8BHIfakro0N3iM5Q9lW3mzacSjwxIquI8=; b=orvapCaxU+SD5MRlAYK4ABFad5
	nTPhu3XjVHxCYi3ctL2c3ejFkriCz+ieJAKjTSpW7uHz8VuOrLj807Bk71ShDyqYaa9YFD4aM4kC2
	zQ11S7NWbZ3yiKhzzpEzghmdyRdUGlWrMAA0ctR05FUzbsT4SeHmmkSofQn3YzF26oakPcKEhNRZ9
	949th9/nScAh8vIejNOhBsoAuGNL0rVqBIKqZLKhl2Krz0CO0B/UxiD2ns+r9nmBIRvC+meesptoF
	/S/koMXFOaqxS8nj3gjycQWChMw+lrZ/5WXWtM1YwD/ikW74VFY9KWUjjGGPmL3dce1GmysfAHN0I
	ToBLKOzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1haL-00000007FDo-0ASR;
	Thu, 25 Sep 2025 08:44:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1haI-00000007FBT-04Cy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 08:44:15 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0EvNf021670
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 08:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dBT7rTwERo8BHIfakro0N3iM5Q9lW3mzacSjwxIquI8=; b=j6pEScOBZmPw3Rxn
	FdJp3S6HavZlYMK9KkSaGAAgDXJrHL9ucgZw5atdyBSCGtsPElGKT/B+IaJfZEvy
	t0S7L/GjBW+MhJBcDSr27Kr9h9AtfZzRks/Jc4uJg29As3uHgHgZBKszqFCBh2hO
	HdXHYTM6ZlJvuGq4g+GSqnhaPTtyIInJCRexcZm8hI/u7aqDqo7Ho714TSvWDyC/
	GFJ7Fx+54g5vlEJONe+K36IHU9FL11MAf0d6EMELCU/Eum4DsIQhAWMfGn7MLMzl
	3gsDU8/hggDZa/6oeXVu6H3WlQmPlAUem22OCLGxr4DRyF1269b23UgcToAIsMBt
	H9G9NA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budaeyqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 08:44:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24458345f5dso10406725ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 01:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758789851; x=1759394651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dBT7rTwERo8BHIfakro0N3iM5Q9lW3mzacSjwxIquI8=;
        b=jz3qWNc4BaxXutqOcdSVSy1+8bwcxYsqyg/8IcuB4qoTm1dWiyFf7XYMK6LvqUIIbB
         aOJ5iXZJEsad9skGoT9TaqBcsboyKCiqWFA8KV9ZmmVFNDoiCopDTZ7HrRgRS4i5KXvb
         6Hip4Dv8E+yiRiI6XA+LZP8In2i+wxwARV5/ewOphvcccfpMfqSdbuBRHRmBioJPH626
         2DCAZWUImVJbRLRZGtkAJWeY6edZuLWrClwiodFPhiUZt+caxvlJiTjXbmj2q1qF07Os
         e9DD8t0fkQZEhQUBRACv6cfP3jemsg8ADmdpfqn1awySp4UlQVETdeeG/o7P4Of4f2p3
         gggA==
X-Forwarded-Encrypted: i=1; AJvYcCVGQ8i239b+oGZuNJ0zKY+YxIx43nTJGHoucSZ9/0k/JZqfpWdslrxjwYa+nzd8v/9n8Y43Fmm1aUY/0Vm8izeP@lists.infradead.org
X-Gm-Message-State: AOJu0YwcjKm0aD/U9nURmeUAWyyWAD1Bv4Y/UDDQt7+M3ChiwMuGy7Xa
	8W/DBSrQSPEA3OIHJL16PzEtTE9Ga/kc0mcaNbrFkmQbDfpaXei3LWk8oJsiBtDbz2FjWL0dm2J
	M0vjo1/yAQ5dkFZGc7uav+GMhqCjqTS81YV6KWQV3ONq+IH5/8Oxa0cU6FGnZBa1JCRcpkWs65d
	5ASg==
X-Gm-Gg: ASbGnctFFJJXPRCqobm+DewP8bZNa51ZlCHGsUd5qrIhZZBWFbS83AYL9uYZsh8bhxe
	8BjQPpe6z6DlAEnefz1ix9jFDRUp8I/43ViiGf5S9XnJv/SJasx1hBl/DQaYUGawDZYBXJyoQlU
	r/6xULxjFqObq18yyylZcl19cY9RexP3438KP1ZOFY3FmWUClYS8w5l0tNGRAD6EERpSNOI0Jk5
	/buLiGqSRAzKPUhxEb60n2CYWSVrkOUuKaQ/3LFTHzaQKjTEU5BwORBF62mvzonnHaCZ9mE4btd
	qYaJgVakAiieGBmUPmOZwWZwKN6PExDCSXgDx17ACzH64p0VgbeH1kHAwF2T3dxi0rg=
X-Received: by 2002:a17:902:cecb:b0:269:8d85:2249 with SMTP id d9443c01a7336-27ed4a0b73fmr29763295ad.22.1758789850667;
        Thu, 25 Sep 2025 01:44:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEteYAh52n1ZK6YfsOt/78cpYQ1O0vITDWQG8F1u35YkHePDlHA6DTWb9y/kavs8tH2Xnef9g==
X-Received: by 2002:a17:902:cecb:b0:269:8d85:2249 with SMTP id d9443c01a7336-27ed4a0b73fmr29762945ad.22.1758789850210;
        Thu, 25 Sep 2025 01:44:10 -0700 (PDT)
Received: from [10.217.216.93] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53db8d2sm1528142a12.24.2025.09.25.01.44.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 01:44:09 -0700 (PDT)
Message-ID: <1c90a127-4b39-4cad-9805-d4449990baa7@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 14:14:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: clock: sm8450-camcc: Remove sc8280xp
 camcc to from sm8450 camcc
To: Bryan O'Donoghue <bod@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
 <a8ebec72-eee2-4a02-ac6b-57678aa7c50f@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <a8ebec72-eee2-4a02-ac6b-57678aa7c50f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CieX5TjEa1gKDeZ0zOZNNBIosNV-d9xA
X-Proofpoint-ORIG-GUID: CieX5TjEa1gKDeZ0zOZNNBIosNV-d9xA
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d500db cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=-DM4tyH-3wswODK-JwcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfX5VrxQl1HcUck
 wVOHOjwAP9iOgzcbHNUtWiPGdIpjATN4KB+7vNhqdGEAOmPywlY00759nneMEJc+Pd85fmdRB/h
 wqSci/B89VcxyzTK4UFWPimclLx5cqPRjHgA5/xAz30WVVCTsfnMG/KHJd0VmsmNfzrK56XN7s5
 dl9emTpRoR+0asVoVmNx3TILb68m0r0KJSryrwx/oiijEGjwIbmnTopjbEXmz4c3U+zDEbwxDcS
 pIkgY+7YBpVyCw1vh7rNujV36Dv2DvyBzy2650bSAbfPpxdTj3wX6v5q7uY4HmyCyXXHFsRQtMK
 6YUTPuOZUQ08dgavyCWA661nh+cM+BlmtQuNjZSSi4hAs/XRLk+QsScABFyQq+56R3PG60P/N2O
 iu2NtcGi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_014414_170994_F3314182 
X-CRM114-Status: GOOD (  22.24  )
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



On 9/25/2025 1:59 PM, Bryan O'Donoghue wrote:
> On 25/09/2025 00:56, Jingyi Wang wrote:
>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>
>> SC8280XP camcc only requires the MMCX power domain, unlike SM8450 camcc
>> which now supports both MMCX and MXC power domains. Hence move SC8280XP
>> camcc from SM8450.
>>
>> Fixes: 842fa7482915 ("dt-bindings: clock: qcom,sm8450-camcc: Move
>> sc8280xp camcc to sa8775p camcc")
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-
>> camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-
>> camcc.yaml
>> index c1e06f39431e..dbfcc399f10b 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> @@ -63,7 +63,6 @@ allOf:
>>           compatible:
>>             contains:
>>               enum:
>> -              - qcom,sc8280xp-camcc
>>                 - qcom,sm8450-camcc
>>                 - qcom,sm8550-camcc
>>       then:
>>
> 
> This is not a revert.
> 
> Where does the compat string go ?
> 

The compat is now part of
Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml as part
of this commit "842fa7482915".

> You are missing the part where you move the compat string to where you
> think it should be...
> 

It was already moved as mentioned above.

> Also why is this patch appearing in a series about _adding_ Kanaapali to
> CAMCC ?
> 

This was to reduce less dependency on the series.

> NAK
> 
> ---
> bod
> 

-- 
Thanks,
Taniya Das


