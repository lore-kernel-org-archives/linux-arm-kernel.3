Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CF0D116F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 15:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dvI4jnmIBSLqBzEmGJJZVq3e4u/zHX94LqpdnMLiDQ=; b=PL0cQWa9wYMq+s/UQUfzuElUa9
	OerIvJnpM1UX95umwfUWP3s8OIm4GzLdHZHtvxVvLi0SZeexnCEV3iEj9wG6InGCjoIvm5CS7DhWh
	29HVTdvUdFR3hvkAqRS+EpS/TKI+7pEwyXXKDE1gLWnJU16Z6ZZz/AV3ikUCFRYQFNoTVm1DFZ9lL
	xjiRUQkuRErZh/LJcL25B1FFSLVeNret5EcmvjLLFBXmpgKo0sY+9vIBkwoXDv+DOZHYtyNV2wo+d
	9Mhk2mFqiXZKbQVze1gNdT9ZSOeIdGJEUbmIH3uLlUbuJOas/5aKBf1qcpjFwrBp5cRZgIF4Yktg/
	FoWuZrWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQSRK-00000005YxO-0yqi;
	Tue, 02 Dec 2025 15:37:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQSRH-00000005Ywx-3LSQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 15:37:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2Dis5f2821344
	for <linux-arm-kernel@lists.infradead.org>; Tue, 2 Dec 2025 15:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7dvI4jnmIBSLqBzEmGJJZVq3e4u/zHX94LqpdnMLiDQ=; b=MNymD01fnkARBFE8
	f30Xj0Twb7f0JXMlzRlh1AWQmjzx6HXA4kbWVbK+kojTuHMCdOgSwJC7x3FlFDhe
	p1ESF91lcGvnoxNH0/gj4x7PtME5E7FoImmhRbx5eW/g0vIOxoTCLH9055hEy/fh
	0AiWHa+CYoT3drJcb7auPKuIH7TSlsk13BkfeZIC+MrPgsThZ1UDNEwxPEvSVc0p
	34TPvYZFldyEZiLjuYPBJ6yxT5ZfovBKNWWImGCGPXG0srgNI5VlMaZo6F05W3/m
	5BPOlySCNw8R4I3UFXUQzibHm7/xDr6VU/tKzbnSdqEFXbP/wyn+lxIquSuqBPHe
	pAjkiQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4astjghra7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 15:37:13 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-93ceb095d13so198491241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 07:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764689833; x=1765294633; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7dvI4jnmIBSLqBzEmGJJZVq3e4u/zHX94LqpdnMLiDQ=;
        b=VjPKrvIEi5wWRDxgMLCBkcJjtesT35qP3/HhYU6lAsjBkrkO0F/sdljoDOS2UDKA+x
         B8tZQ0A7ghYGX329VQ5QME+JfvVuIPq6R7FgfC/nVvwZMvNmKtl7kJil0AGU6GBmfAXh
         hKxFLRIFRZehSumayMP6pofmMh3p8hnSXMb6HnLzusYuU6aTxzTS0ibjFMpng3jnrlMM
         zPj7qJJxAjGWRW6D9n/57zTHaW1RWXR9U29RR7r4ze5N4cBytT9HXY/r3gEmEcjY6YzO
         zr2wzsDHj4QHH58RnaaKy265bOydVNZdRJqiBXsi+ONgHJtJZPIM8jdtHZDBjiUN1kjG
         +mag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764689833; x=1765294633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dvI4jnmIBSLqBzEmGJJZVq3e4u/zHX94LqpdnMLiDQ=;
        b=F6lMNDosSoPfTr5TaYIEQF6mXFLZUeLtLBmJwzMR+Q4YLqC7fW0zS6oDNGzby6xEUV
         zEUxYgEng0IocqvzQbDkbkOBjnEMcv5aXdDz+Fka8xudmN0Q+hX2e9uC+1SNreCgqamK
         8p5FGaXNGilaQ2VPssJQR25H9C0Ekv0F6dAPps9iohDGfleT6+n1Bg8hzm8SEwg5dBLd
         u1VDDthisI0X9Rca7yE4aGI4PDpTF0yXYpfER00o/XPo46fPvNLoNMA1pBnSARM/Cafm
         BLWbw7RWb1fOfz/a75/Ttju9aih2v0MQ9ABt/WLbCPWx0lpBqnmHwGbQyuhRpNf+Km2R
         1Mpg==
X-Forwarded-Encrypted: i=1; AJvYcCUQn3qmv5m/CpN5lQoQpEosHVYcaOaAomCNwW9VVvCnYcqhC9Be0IbXtKe+3Dj4Nh7myFdZdA9Dm8vf7vm35P9Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0oVu/Lf6hXp9ADDg8uak5Er8WODx23XjeB0mWJ+yK4zWXgfhw
	Kes9PgJeOyCg2uidfhsjXiCtgzdQh0edsf4f9JYuemsn45laOtGdWVJ9KUdnBhRtasvStT+CcZR
	RwNLxZz/2lms+/O5z/L/1hOfttknQOj3PJpGg9qgIjAI16i2hu20HkLZap83QR16ANP8VQUsFJP
	eUvQ==
X-Gm-Gg: ASbGncuEPlPRAkvEuOKX4X1K7vSJ1xscNsGlUc0Uy5FPsViBJ/DKU10inbcJOPKyMhN
	J6kPn/M8rQbGafRQ7D2Atjk07RIfaclsX6KUASo7HNHFv4GQKGCecKZWr6mqRjeL7Y+g4xwWG0I
	MPuH3n7bmQPYGwA8pS52nmQzjmoWkIPgnBABDYVGR0aaA/kTSQzDSdU11JJOw7lQ2ud5xRwSd7Y
	COXmbC7f6I0msUWBMzuLGrD/olQZbbMckootr7d/Jb7Z1Htm5/ux0yZKofBCmmgxghNM7CRq4YL
	l1eKKAc5ncT9GvIxJ8BuU1+6QtNWpu2xY5SdT0U6MsH+ZUwdkkRIh8QSHWnw9kdlj1UhkvOYMCa
	Mx6mADdATr00zbOloRWNO5azqFqcHQjoZ2CLiaOgDEMbC9AGjsJn4t0sEoSIyXQzBgg==
X-Received: by 2002:a05:6102:5ccc:b0:5db:d7a5:ba2e with SMTP id ada2fe7eead31-5e1de57c9c5mr9556599137.8.1764689832988;
        Tue, 02 Dec 2025 07:37:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvD45845hdbmhM+YS7Wjjhg3RBweI2ZE3krzHTkcYizMtoYHA/7UWe6Faae0ZvkArgVzbYoA==
X-Received: by 2002:a05:6102:5ccc:b0:5db:d7a5:ba2e with SMTP id ada2fe7eead31-5e1de57c9c5mr9556563137.8.1764689832343;
        Tue, 02 Dec 2025 07:37:12 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a4b926sm1544786066b.68.2025.12.02.07.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 07:37:11 -0800 (PST)
Message-ID: <f7609d19-5254-4419-a600-d0904d92d525@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 16:37:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] clk: qcom: clk-alpha-pll: Add support for Rivian ELU
 PLL
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
 <20251202-sm8750_camcc-v1-1-b3f7ef6723f1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251202-sm8750_camcc-v1-1-b3f7ef6723f1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: j_hzsoguOo6MWDk_EKLK288AHM7U9SzZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDEyNSBTYWx0ZWRfX0JYbnnqhFsWV
 c0rAIcTUaaZKk75moA/8Os1eDesj70/NhVkIvEYCp0DIb5mMbb8wY6oIQEplB5DBiQssG1Bh6gq
 AqnEECkvMQ4Cf0sxHmiNErEirBBnSPYF4cZ4sKfwsY/7s0jNuENtOk26hdC2AGYzgLwkuOExxbL
 ncAe1uZzBm6XNMmYOMeiaCBf32x0+shFeK/7BST9V24vrI/5taOGHI5A24EkW0z9jqpHgIThfGi
 6SOc/6BJRlHa2kOxOacINlMoCWzJUAuBMofEuZh8brYevJU27XaycEXdK9fYOQKZewhA3xxozY3
 /s2BdGNpN0RaOYAb/CPt9tdzYA3zV+KlNxozZpMi+mHHbrrCsXRWcrHuHuKQFq34PaiI20Yj5vM
 sVLjWqDePpVYssnp7qwWDFRm8HUN9Q==
X-Proofpoint-GUID: j_hzsoguOo6MWDk_EKLK288AHM7U9SzZ
X-Authority-Analysis: v=2.4 cv=EbfFgfmC c=1 sm=1 tr=0 ts=692f07a9 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5mhmk1EvtyQYLrneLBIA:9
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_073715_985902_C9196C00 
X-CRM114-Status: GOOD (  11.60  )
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

On 12/2/25 11:26 AM, Taniya Das wrote:
> Add clock ops for Rivian ELU PLL, add the register offsets for supporting
> the PLL.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Matches downstream

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

