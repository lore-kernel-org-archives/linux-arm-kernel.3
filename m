Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97033C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 17:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1LYRnKYALBxstxnY8N2VWmQJbh99uAes3RlQszC65LE=; b=f0ONOWM+YtPwF/YX6jCq8OjI+t
	lUE6bUtIl8ZhwZK+rhV2rQfpd4PvlpiSVVtzORlP8QfPdDCpjgQi9HZ0C+zFqgJ41DnbPjBb8fBEj
	Seeegc03dWAsM7TSio4B8Q8t6HSVdEGewMQvUimnIscKkcom3pUrpf2vgSaNJX30WY+qHVrR/7j1H
	6KwbMwF7Y7u25w1W1kXef+J9025GWlGjvOfQykUffxevE5S55rWwsiQuw707IVcLAFrwEh4zzjmhI
	1oiuEHAmP6tdgwnYI8KZgvGgmOvOGuXnsARbGtGFSlD7+twrFgxG9WZPMDkIUHSFuWuSnfexCJK0Q
	1CBaw9xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vnk-0000000BOZW-2Nof;
	Thu, 10 Apr 2025 17:34:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ult-0000000BCMj-1UGA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 16:28:58 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFi9wV018361
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 16:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1LYRnKYALBxstxnY8N2VWmQJbh99uAes3RlQszC65LE=; b=I3oNWYh1pmIWvoPZ
	YNXyQcTQxr0qCuCP3bjsX+gmUikLAOUHnI6M4W+4Z4iCmhJ4jauoG7R79DGyQaLR
	YRg9knFf18wr6BTpxnRr7MDWGcXkpgDZ6L3jPmbmd+HiMfbN6yDQEicmhQrqIlUX
	6tKvOV9Uxt33c/nVKz/ytYL+Cfqev0ynqT33WnoH5sMTx/klmCsJH6nt16qnTTKk
	FbbNhDcICoxYKKsdCJB0uOG6LJESAY06eXDPKphKszieSBsl+wgoSWCG3sGXfwYr
	C1KFDE1eKkHJg396QkFwC0ipB7VU3cyb3KnFUyklTldtsojJLNB71CsKoR+exSMO
	BvPqKw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtb7ns9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 16:28:56 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8f9c5af3dso359556d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 09:28:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302535; x=1744907335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1LYRnKYALBxstxnY8N2VWmQJbh99uAes3RlQszC65LE=;
        b=nICyKh+A/x4Rbq2AQI0WSxYhgFwS8NplCvsacWt3WMiWwwOBOIrf+1q8tRk5ilJZih
         vfswfU7AxY2Xlu44sSAH43jX2tzzSSVOWFH21+Im6vDvuub1ALf4Yr6vx5QjOIVKKRI2
         iiEE2XAZLCKQh0NKLYEg12fFi48JKiYgXQsqydmh6+XygF1MqAbaOPwVc5+eiGShXnfw
         Tm/OZY3PAv6qQMNJyeOCWt9oRaaiUOxA8qo7eYGXehAWJjQvUvqzYe6qzrjw/DeGb+AA
         yjoV8xGMECUQ4ckUMUbANIgk1Zjs6erBIgZVxz7wSP3FT93e0agj6VauwMGQIAiGaqvc
         U7Gg==
X-Forwarded-Encrypted: i=1; AJvYcCW66QUeSGymo1IGOWuBBT6wzSlMj/JxPS0LoXWs1Ej4W2OhIL+faO10x17dhWdvTeu8Z1ON8a4eKrr5l9ef30n8@lists.infradead.org
X-Gm-Message-State: AOJu0YwD2B9COWX5Yf4eTEiFG6oB6VLEuY3YKPMWyGrKsaS29KZXls9Y
	z1t4ej2bxzVuapzadwmUvZ1fiZVQrMaQVx5iZkHjLrkf2KlzAyePpuZ17NsCFzF3yItKAZ8RFmg
	gVSI19bGGf8NDUjfN88gUox5yx0GP7yi/BQpUfZ0DzW3xGiiEkNKpw+rvaE0YjDvsWFO+J2Q8LA
	==
X-Gm-Gg: ASbGncuoOtx2gRkfH6aszlS1p6U8FdrW7Onlt//fZieYAR1gWJnyN2A+NINDB5nWq3N
	7DPl/+5beI9F022xJC3nVrt4kdOoisJycVNxTnPyIl19dlE+lUKKP+XkcKHEyEKFVhVcWKeMGOr
	vN59hJyaADKSsk8qo9zuG6YEs1H9IT8UK3zJtuQ7WksPeNkZ9o5MxKMIhsYP9uTt37T6H9A8Hlh
	eOVDMLivv7gUFrm3bWoGqLMNPsTQaUNaZ0dfRuflIhqej9TKkueCNZSobOobiQInOa9ZeWQ+Wbk
	YkFhPUNhZ6tW2OkQHxLIbh+Uf0DUQloUFOwVp18XLOYXO87S8eYUpdpw3dr5UO3VbQ==
X-Received: by 2002:ad4:596f:0:b0:6d8:ae2c:5053 with SMTP id 6a1803df08f44-6f0dbc9abbcmr37086046d6.9.1744302535349;
        Thu, 10 Apr 2025 09:28:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpQTzqEgSGnRGI9+a1gSJgk7i17w0vzyr4OAfVjD6W7x+6Le37QVc7oS6Fu1U4ISRaqoFqsw==
X-Received: by 2002:ad4:596f:0:b0:6d8:ae2c:5053 with SMTP id 6a1803df08f44-6f0dbc9abbcmr37085796d6.9.1744302534993;
        Thu, 10 Apr 2025 09:28:54 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4300sm305662866b.94.2025.04.10.09.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 09:28:54 -0700 (PDT)
Message-ID: <5cf9c47f-089a-4748-b4b5-21637fb7368c@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 18:28:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sa8775p: Add interrupts to CTCU
 device
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
 <20250410013330.3609482-6-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250410013330.3609482-6-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KNArNrVHKOIq3gjUk5ZejUBGXVMZ1Zkz
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f7f1c8 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=jy6vGmKe9HVL-Nowcs4A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: KNArNrVHKOIq3gjUk5ZejUBGXVMZ1Zkz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=778 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_092857_401479_5C210F92 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

On 4/10/25 3:33 AM, Jie Gan wrote:
> Add interrupts to enable byte-cntr function for TMC ETR devices.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

