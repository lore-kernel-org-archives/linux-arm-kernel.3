Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCBFCAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 07:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VfsAs5yiAxaYFB0ndDb5atfCwLOCQ2a0n9K8ajWXJTQ=; b=UCDAmjNYK2tr/XXldl1jPqJsZI
	daGIJU0p0SafmH50TqoVlO9daiB9KkJUIFW35wz25ifZESgOHcWCcctGZv3F5ssYJVb6QHV5t1qs0
	k83BlKohXJVYfJmPAB9DooMnYVHyavEnbvUnW3j4Jar4lma4ZSGtLJsoSGCqblbY/L+f+MAvuXTnx
	1TtvO9GjW3XhY+Bo1IkfJ3t4kH1gK82e2w3yu9kv/mYTz2JXfBox/f6qAMObjz6eDa2wnjVG3ioIW
	c+h+2x+FWDOpgsM0ykdpW5t+KRx01DAfuqxDGPzF1SHE8UsYCVJss9moD1iIZ9Ck3McRMQnQ9pVCC
	MV1EJKIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v22XS-0000000GcqF-28VT;
	Fri, 26 Sep 2025 07:06:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v22XP-0000000Gcob-3xxb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 07:06:41 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q7527s015909
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 07:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VfsAs5yiAxaYFB0ndDb5atfCwLOCQ2a0n9K8ajWXJTQ=; b=VdeGhIFrddl8aPhy
	qwsCpJ0VEXQf1zHy+ga7hXD6MLL/w6G4dRe6p7UminlE04zS6DC6yTcxT3v12YRE
	87lKfuGlSqUUy02HNh1b9G4IyIwdscIAjXsuWqZW//RycZpSMHjYyn+Adm1a9ofW
	TNuVzuUJrkO+h/lQjCmdCU2xwdrXxpEtP10ftclb0jcpQ9kZfnG2zGDWEPgq/I04
	hIKva8agjYhyqIUiiI3Weyi8f1JfymXvOdGaJ2hCQu0SWImyU/IlZrtRp1mqiZVQ
	SOyDWo6Ec5S4X2UXU1YJkHM3PqObcitwJ5t6NnzJPXMbbHo3JQUAjBQq1ObVCaIk
	8EQ9vA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0t9t9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 07:06:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-268149e1c28so17796715ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 00:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758870397; x=1759475197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VfsAs5yiAxaYFB0ndDb5atfCwLOCQ2a0n9K8ajWXJTQ=;
        b=PdL+5+BBa/9ilfqtUVC7spiEex9MdSckakgYSivQMHoAzVGJAMo9h0lEWuXjYrEBDq
         zRl+SLcwVZCgLRwDilNsHvV7kC0kRyIGMpv9J/AnwW9ft/8DBhFhBmKZWgc6g9P9eoo5
         Y3AV0sFt6YBGLt7DKpWYi7BmAJL4QU0wX4D53JR1eeDUdbcXz8qkf1TGAzE+xlOs0iRq
         AmyDbx8qtbX2A8PpGcHZgZlHk8+rEGTrGdaFdKwXo9k3tsofSV79+f9y/iIj74aGDPBI
         eLWxamL6QC7+gfBcuUdxGhRP7BnTiNNgI/VO+egcD8z2pRlqW9IXXksMX0iOfZkIokhs
         YOlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWg/PGikW+ZzM6xG6x4Zx93MzRNn+JEjLDokJjnX7y3KN1zMz4+45jmNOLjJAb7PIWhJsLJWwO3wWAJ+9OJqm0@lists.infradead.org
X-Gm-Message-State: AOJu0YzLDDbKhz5IlY1xsHkGsW9d63KYzV547xphHBdJGs0Nd/Cth3G7
	Dq52NGPBkJ6Z31nFh86RPWglVKODMLyaZNfe728zCPE08rVYMR9S++5aECJvMJeKeQ8c0fqjukj
	omHESsRseeKUf9kemXkvEGQwdDZ64TH4z71hcz1zB6USCZBYAZV2RU9F4RYQ32qkEG4tS41XJ29
	z6aQ==
X-Gm-Gg: ASbGncsSrvo9Ibj5v0clNpPoKRHTmt8qBtdoBefDQH29cfWNr/xBGRBBd4AYx6MzJS4
	jB9MWTBItP6M4K3sSWVHV9z6RObtb1XssbqqsE2Dz9DKbrbxdKu4FLDBY7hTQm1b0EBNqYsDCUk
	x2w/6BdzR8aHY4+5kTFJwYIr29vvgBI5AtKsPZ6MzeYdaaLqSTEac42Vd1kWbuRQwmKDN+zeXjb
	O+bSwGe+wIKk/uTpc+i6eZoCf+ZfkOnxQGrbvzxLLqKr59Jjn6J1Vp6qyEP319FCrvoVKf9Ptus
	/xzNq1Fv9EzelB9tX3TMhBDWOYXkmosTLM1drTTdnUR7ovU+9qmc4oVLuoH7iYZ+UC88
X-Received: by 2002:a17:902:f611:b0:271:fead:9930 with SMTP id d9443c01a7336-27ed4a78d72mr67605185ad.59.1758870397170;
        Fri, 26 Sep 2025 00:06:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkrMZxqylZt6nJiE1ocYHpxscY4Q1brp546AbBdNAbAkmq0vd5XGrBNZjqUvbPQf9USLOYyw==
X-Received: by 2002:a17:902:f611:b0:271:fead:9930 with SMTP id d9443c01a7336-27ed4a78d72mr67604775ad.59.1758870396700;
        Fri, 26 Sep 2025 00:06:36 -0700 (PDT)
Received: from [10.217.216.188] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed68821desm45499775ad.91.2025.09.26.00.06.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 00:06:36 -0700 (PDT)
Message-ID: <5aa92e19-bb80-4628-baf8-887199ba2ec1@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 12:36:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: clock: sm8450-camcc: Remove sc8280xp
 camcc to from sm8450 camcc
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
 <34esqueoush5gnawnzl7hmnpwr77vip2iqf2w7eiac7jqyghvl@nquuefkyjive>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <34esqueoush5gnawnzl7hmnpwr77vip2iqf2w7eiac7jqyghvl@nquuefkyjive>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -qf_nGWtMnOYRN4Pbaf20Lef4Pl87P-b
X-Proofpoint-GUID: -qf_nGWtMnOYRN4Pbaf20Lef4Pl87P-b
X-Authority-Analysis: v=2.4 cv=Jvz8bc4C c=1 sm=1 tr=0 ts=68d63b7e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=0pmg7TuxG_D_0s_mfB8A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX7FjXroZUwYgL
 Cd6RLBncZGajlswv0y4AGKnxmFWsAWKVheNG1HuzAGd7WjOsFvAJBvNLYRtWEjLa7Ea0jnwW0lm
 Bkk9T/zXyJ6f9+pDPjj67esH3mvYgAY7Mp+t+EgiUgeXZ/gQwmCzarlGNd/WtdXBn6Lbj6c085f
 /Kwfd7eCgkGvoqekILHqNVIETixYq8BZwDOWdgjhEbJr5NA/we2AB99z/dRLH1s9nQxMbF+z7Hf
 bMji8SEZhLPIExW/UbCDXSovsT/TVdpQgvQzgz/KeoxonyELXfFU7vq/knWtIYfNvEwcdA8sT2Z
 6GDf6HwCyRnDj9EKta5K9JVPPVEg/oDTu+WsukFriPpdaCPUEBjLHVFGDCO+XygsJyf0bU9luTS
 Yli3iEhqyf7qSUivNQamkKlDNY1DgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_000640_108501_96B9B30E 
X-CRM114-Status: GOOD (  17.24  )
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



On 9/26/2025 2:50 AM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 04:56:43PM -0700, Jingyi Wang wrote:
>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>
>> SC8280XP camcc only requires the MMCX power domain, unlike SM8450 camcc
>> which now supports both MMCX and MXC power domains. Hence move SC8280XP
>> camcc from SM8450.
> 
> The commit message needs to be change to describe this change instead of
> the generic facts about SC8280XP and SM8450.
> 
>>

Sure, Dmitry, I will update it.

>> Fixes: 842fa7482915 ("dt-bindings: clock: qcom,sm8450-camcc: Move sc8280xp camcc to sa8775p camcc")
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> index c1e06f39431e..dbfcc399f10b 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> @@ -63,7 +63,6 @@ allOf:
>>          compatible:
>>            contains:
>>              enum:
>> -              - qcom,sc8280xp-camcc
>>                - qcom,sm8450-camcc
>>                - qcom,sm8550-camcc
>>      then:
>>
>> -- 
>> 2.25.1
>>
> 

-- 
Thanks,
Taniya Das


