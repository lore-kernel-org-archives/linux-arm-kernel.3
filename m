Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32785D74969
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 09:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXa1wpOZ6Opsob0n9U9T/fxIsidLw8VhioEMzPmcCMU=; b=1GB88Bl91+KsiXoZCllhLkSiCf
	heacZPwNPQufFRzFIsCI0gI1vo4eJtqRmga7kSKvMpBunofafDgRUcINTwgjn+w8//DgLORER7TFT
	BTzSoaQkLfh9I+lAH/YGgTMg5gyeTZW6ERWoPwHrAudp368W0wa1A7kL1BZ7c+V+wrep7uh1Za8al
	lr8NLnTuoQP6WzQ1FRmnESEk1YjL+FwLeEM80H3kQarJaUh2F3N/F/+PNF9oakSRb7ymEOeWHucXj
	YgIL11TUHb4oOapCrpQFzeny3CtLcrDyd6De5Dx53q9ZpLP50N38v6g/8Q89N6A2TfEpFW0D48fDK
	M22Jjb3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWTl-00000009uc9-3ZVf;
	Fri, 19 Dec 2025 09:08:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWTi-00000009ubf-2sAc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 09:08:51 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cele1772078
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 09:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gXa1wpOZ6Opsob0n9U9T/fxIsidLw8VhioEMzPmcCMU=; b=nalN/Mu38iLsFkws
	k774DhFtwi6qpkwlbTFCRVd9xWeErtajIC5nGkySTAGYZWAAFeO5GTyVF19e3nJn
	G/EUny5xF1+OhEEJmG3Yd2YWs0NHmepk+U3idNmu/CVZvjJJ0Y+WAzDWwElDdu6I
	sTES0euCRunW8Xpmmpsulbg/7fwrQ22u8iL9jmLmYn1D+XhXuJnZPIYMFc/XS1Ih
	664TGNyfzYNRXKHkbAxqzgmahXCPdX0duHoVdJBmcvmHEXiNMYisfBacu+js5xBU
	iFR2zhrDybjBeCoidKnGtneXVmP4UOigumM3JOGlnaXRaXm+mYrY8FON98OKBuBH
	y59XQQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2bj0yb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 09:08:49 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b4933bc4aeso1687011b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 01:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766135328; x=1766740128; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gXa1wpOZ6Opsob0n9U9T/fxIsidLw8VhioEMzPmcCMU=;
        b=A1rt4f4bZKdlrif8jpSrzo9LNGDnHnXT982x21Gf+boiZDy404VDELprgEqKrZPt2X
         wqIV8JpI4AURjg/MAA2i4pkFBi4fZ8Qv4pqqpV+8gQLwP0iR8Q/f9dVRKAnqyi3OMYeW
         n7TIXxBBaXJwjV0ROYE8qzcfGFwBW7ukc9MCG0Wp94EnjchdoSlZVBzceoiFakKO9gAs
         WkPXtfdlC0KwEV11g0oukx+8Rex1fTc9YzP2uabFBgoMAhgNDfbhc67LlfM+9vPJQjU7
         BF6nuMWaKdOMMhWROz+v3tKX84bJTAypn2MzRYj9n+tQmYcoVWSDfI/ks1wHd1Q2AIXW
         YEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766135328; x=1766740128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gXa1wpOZ6Opsob0n9U9T/fxIsidLw8VhioEMzPmcCMU=;
        b=Gr2JYVrZ9OzwX1YW5tUS05tVN5M5+5xqiv/T7TqmoC67j5KkJjz8GomW+u5dzxOXuv
         qEuFo9NoLSniHujB99URD/R+SFNzwy4+UkUVd2o2bUTaMfJQjWXMJAfoOKIGwQwSWVNu
         aZwli6d97V0JZhknqACI7Xa4Lob8JNYBZAPTD0Qz7fIYDhRXv//4Gq1SCBM+9yg8ONPr
         r/gQkmXahjZm9Z6Z9DrgiEpfODe2iadPv2KdriIwYtKmcFHPrm4QsJXHtpyDyk1u8vZ5
         QRAhjMX0mSAkFR643UABjIu5NlaOLJmQaDng1ndGY7NjUVDkX8sIwHH733p61yrMErnZ
         RRhQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5dpM1X9r099kz1+Qsq+8pDdUKIawAyJ4LusEJZEtvtN1KVBcl2HHnc3agBuE3RWxXVgNn6x+L1fFci90lOzck@lists.infradead.org
X-Gm-Message-State: AOJu0YwedFVcajQ6iP57JLhgK4OOpFpC9OvlgD1HdFpewim35u7so3A7
	ITPZLBCZJvX3KC4udlus/nkaJXDMZA5oSGWyN4h/2LnYshazwPsV+Qw8jfMrGb+oCUhEfKXfrZI
	IPnecbMqTfK/MZlpfi98GIpoEOne0daXorvCv3nBpcL/aio4s4dE6D4Sqz9rikdhliX8Ni/Wed6
	r/Vg==
X-Gm-Gg: AY/fxX6pdKLFdWHF0mwNdmbsGqgR3gfxvBI/cYDbrUIHXbHQXh7Stc+stiA3qbglGc2
	vv/EA+B/cbmoKAeftBlYCb/6hIxk4ihBprTRUP4jrgGqYfAr2TIa4GXZOb9jb34nmNFiGfR/HbW
	XJ1RqO38gGzzxiKSnYX28dT7MCYl3QOHpk2fbNO9eQ2GT4V+uiw9JAWO7GvqiY2dvupdWEVCq7C
	K6FP7tfGfZ0NCPJzsDTd9V3MYlk02ck0ecnimc/MRE73EsbtKmV72aaSVHkD7LZ7d8nor00Dm/U
	BbdRQSlwJWEedWqvr2td5acZlbpEpi2S2xFh0lOttRX5vuYpBque3QQlE/BXVT4LkU0YXB5y9dz
	zdut+9o3wOGx45r+/F9peaK0CMdtEnGOqpiLlwV5bAPSASx5N7X+m4zjbPFcmslqimxq6bq+eBn
	w=
X-Received: by 2002:a05:6a00:90a9:b0:7e8:43f5:bd53 with SMTP id d2e1a72fcca58-7ff6775a108mr2031745b3a.63.1766135328312;
        Fri, 19 Dec 2025 01:08:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYhdhSA25dW78AxDFhfOSqctQebu3ghrLU5jc5WmQr/SGJkXWUVcnKcjF7zT0SVfuW/UmMSg==
X-Received: by 2002:a05:6a00:90a9:b0:7e8:43f5:bd53 with SMTP id d2e1a72fcca58-7ff6775a108mr2031714b3a.63.1766135327725;
        Fri, 19 Dec 2025 01:08:47 -0800 (PST)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e88cd71sm1753931b3a.64.2025.12.19.01.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 01:08:47 -0800 (PST)
Message-ID: <c6a75ea4-a36c-4f99-ae36-75f062937a66@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 17:08:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: add CTCU device for monaco
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20251103-enable-ctcu-for-monaco-v4-0-92ff83201584@oss.qualcomm.com>
 <20251103-enable-ctcu-for-monaco-v4-1-92ff83201584@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251103-enable-ctcu-for-monaco-v4-1-92ff83201584@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xA8PKPvk71ido2o4SQH_ZusuSoZJIpLF
X-Proofpoint-ORIG-GUID: xA8PKPvk71ido2o4SQH_ZusuSoZJIpLF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA3NCBTYWx0ZWRfX7JrOI7a1fHJ0
 M8IY8dp1RLRyhe4Iy4doEoT8wcLDL3ZPRKdr433Pe4ST6Ss7zKwynQmUNw3YdmKrmmEsS0w8hGk
 Dqe7tUBqblrYxbtjzciLP3a3FLB/h1+hrnXejYOkcNiLLeCtOfIWv83P4ch7UTchaUI/Gfqq1Fh
 GoEYtYFLP7Yz0urg50qvAv3JcCn6ywbPettBNWNdWwrF6VGYMuw33UJOomEMMrV87b1d5N6uxgT
 unwfkI83d+tC52np86faxHUZqQuW9LjsCxjCaYAhVXaGgcxHj5kS+N1zW2hvpdo/QKwDvXqP79T
 Ou1JkhHjaT9b9ysHEa3O/SETNhqrityv4TFlS/iqzrkyAa0JMWudHCoWavPRtE4BDQ2WltM9Hhm
 S/k/ljrp4PRVjWe2AqgvHDW8w7PIMJDSJWx9lCjxljBPRtP/FMwKN0sAHF6NB5ailjTyfqxs6rl
 9qMblxjRsk9nZSbtS8g==
X-Authority-Analysis: v=2.4 cv=WYwBqkhX c=1 sm=1 tr=0 ts=69451621 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=51A4gIhVuH9znBGuUk4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_010850_730607_14E718A1 
X-CRM114-Status: GOOD (  15.81  )
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



On 11/3/2025 3:06 PM, Jie Gan wrote:
> The CTCU device for monaco shares the same configurations as SA8775p. Add
> a fallback to enable the CTCU for monaco to utilize the compitable of the
> SA8775p.
> 

Gentle reminder.

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> index c969c16c21ef..460f38ddbd73 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> @@ -26,8 +26,13 @@ description: |
>   
>   properties:
>     compatible:
> -    enum:
> -      - qcom,sa8775p-ctcu
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,qcs8300-ctcu
> +          - const: qcom,sa8775p-ctcu
> +      - enum:
> +          - qcom,sa8775p-ctcu
>   
>     reg:
>       maxItems: 1
> 


