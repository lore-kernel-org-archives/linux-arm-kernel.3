Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C624C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 21:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2ietRUbMDbJ4mE4kCJF5gt9v+ZI/BJHpjh+AfLfssc=; b=nB4uzpltUZgW6+k4C3A50We/Hg
	a/BN0QVRaVrqts0xnT7JLDZ1RrhQMda6IgGuXtK2VJI5862sj2pb5C23Ezh4B8PpfsN9YhUZ5Vvf9
	Bom2vx0e7wdsSGAvuGVyTGYLsmtI7C/e5FdVBpdwLxWx9OAtGxHtBYrQxV1oS61MHMDAH1OUBT+On
	6Y30NhsqmYQdAxpEHgk2AnZPeJWVQcJCDxg6WJ4TWOXFA+5zJ6ZxgXniTFZ3R4PjQ5l30zwTyOoEs
	sqJxiQVg1NwWnDRtWOUoUjCzbs/5NfjIqw+Ea1QPkCAR27RKBc7+eFraC5c36IC26oAHufsHhPNKH
	R8H2XLJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZcoX-00000009y2E-2tlj;
	Wed, 09 Jul 2025 21:58:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZZ9t-00000009VNg-3myY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 18:04:43 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569CopjK011520
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Jul 2025 18:04:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A2ietRUbMDbJ4mE4kCJF5gt9v+ZI/BJHpjh+AfLfssc=; b=VkHrX/iB1owUSxld
	0k+fbo6IcOvwtEYGSSRlKjHpAinC0RiWd73EPPUC6SOM4iBvvYejo9Hir/sSs1M+
	BimAHnZ5h1Bm7K6EukFdGpofuYt4/4mVpL2Pvk1zuKqdOPMAEA0hUXCuPSLOmkJI
	uxhP+dVMdAmPY42H33WwyFKvhLTjLI7hykoi46pR/kn5Hgzte68IRcBVaBSbbEgM
	cHTfSuCq3FFJOsKCluYO73ZuMuweN68F4RZKBYnZjt9JHLQRIPG83VqGx6D6sB7x
	NYtuDq+MO3CE2+WCNg0do2owYKfya9Fs8n2UT5JIvD2kgG7SZnFYVVqX1VOzqctq
	+OrFUw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smafj1a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 18:04:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d097083cc3so2786985a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 11:04:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752084280; x=1752689080;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A2ietRUbMDbJ4mE4kCJF5gt9v+ZI/BJHpjh+AfLfssc=;
        b=o81LCdBdi8dG9idp5CQLDOX01VoHuDA4vr5fcnMJcbhmRiABM9NDSWHySIP0LPUVGQ
         09uve/oK4tIv4rSBw/mmrC5qyNGAL5mcoOzs6Uamunv4fJzrhhs1SwyX0w6t9hoxAUMt
         ttDt9ymLLClwzO69wdOcPwnJInI6QuJDQGO/aIj7h8ajOJQhQTMcKwLfZ7oYYJHug200
         ta8CaMVPKO4Ea7uhvCp+xhYynzNOmQqwj7mIcYPxK2brjkODzyZAxZKpbKpKA+sXFj3f
         bK8v5FMdlaEkSGp8aep4uIg0TQzdNW9Stm+LsDOnE+xoW3bqp2hyyGuhz7Caz+3UO/Ie
         psQA==
X-Forwarded-Encrypted: i=1; AJvYcCWTElrJHzMQI98tWSfcKG75DfbtuzoW8nMRNLs707uNcIioZEL9++A15wnxFIQKIxGo1WEwPkZhVfNUd4bSWqcj@lists.infradead.org
X-Gm-Message-State: AOJu0YzK33rdyZxuf3UtOv66PJe+/m4+CUmthLmmhMXSMr+mum6eUpz7
	y4fXi/iWnHF8109KgBhPHrODyJBK3NOqgisoPE4W81SY9pd1gtF8VuulSFoUkjS4FthUQr01Ov3
	CVLwJlCilqLlfXPVR6T8MUAQcx2mOL7YkpT7wTEXPlwqjWJL5L+EZL0dHbWQouP3Aoe89kstdx3
	iJVA==
X-Gm-Gg: ASbGncujBCDb/kv2SYSKwRd2DtUXFi6XsxzJhQiRrCdhHqDGzv2zRnzbt+N2D2jjTPe
	VVLfTgLmdzIm8pl/nhmzfw+RVNOrDY598Myd1b7zsfQzvKNplHIsXs8ZMXS6o7e7euoZJInxsPo
	BAVT9i17OUm5pKvu+B/PmOrW669iC7P1TnLtSYoVlZQSH7A8L+DqeYnL2RmFFHuzjxAX3s1SqvE
	+12mFIJJVhKefKR8LPUuDKw4qYu+AkmgDWm8P6BHhV6Jr/Cvc99kEZCyq376N2Z7GUVXp+jEWJa
	GqENi2cnmIEK/ZFKI4Ya46Xgm7ZbCDMJxyITUPNGvDYZ7NPrNiSKuvHEcWBhRXHTDxTvkNwm9m6
	FXPQ=
X-Received: by 2002:a05:620a:2681:b0:7db:3fbc:d71f with SMTP id af79cd13be357-7db8b3307c8mr183721485a.0.1752084279992;
        Wed, 09 Jul 2025 11:04:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRdyICFCZxRrKtqyaPtAi/LxAqDz5IEHfkpkf3qpn9haIG2NUFS9hpsW2SKi6yjsOjwAtEOw==
X-Received: by 2002:a05:620a:2681:b0:7db:3fbc:d71f with SMTP id af79cd13be357-7db8b3307c8mr183718485a.0.1752084279403;
        Wed, 09 Jul 2025 11:04:39 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f692f555sm1156700766b.60.2025.07.09.11.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 11:04:38 -0700 (PDT)
Message-ID: <256e01fc-fdba-4006-be8b-236fbbdf9f25@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 20:04:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] pinctrl: qcom: add infrastructure for marking
 pin functions as GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-10-b6135149c0d9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-10-b6135149c0d9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZJ/XmW7b c=1 sm=1 tr=0 ts=686eaf39 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=NA2ShB3TTlD8ZNnRZVMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: oMYitYoWK7GteUzgeQCmIqh_3Heei2Fu
X-Proofpoint-GUID: oMYitYoWK7GteUzgeQCmIqh_3Heei2Fu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDE2MyBTYWx0ZWRfXw/HUzYQFj7f5
 OfFixDv6Xf/julzOb4u1tabXSSuaWbnhnxY0gPhw+WjcAkRD5i9QWzu97eb+yeHqSM1lIa6oMCT
 zqcJ4UsGd+2zLntxmPCiNR1jXJuRNupt2B0+N3ZPk3+h0ck//04jkh3tKQCmKzHX07yVxaQl/At
 9DHnW5muTXydrSdlLWmm3FvdeNCD+nawlUUluwpupIycWYfhssYlcaMLZ1Uf/+zI0XlyB8e5DMr
 BIVW3thVoBqJxF7jzof4m0wJv/cmJCp5e4DIzTl1V67Y6pY2ZVjs7aOsx4eRQ88U5Hz90lCV71N
 dzHfQSqdapwqJOPIx8mUcWboRlC28U3mbxwSs+iqnT6kOe61Dw7pHj6hvdIPgPX09STBMnWOLhj
 tbNzC7DvX1pHzlfRrcJNXhvWi6qvQto0Q9VHEK1542qK7wkpPD6AEBbgWdpDhX15dlGwmHeP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_110442_062530_7C64A6F3 
X-CRM114-Status: GOOD (  10.79  )
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

On 7/9/25 4:39 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add a helper macro that wraps PINCTRL_GPIO_PINFUNCTION() for pinctrl-msm
> pin functions and assign the .function_is_gpio() callback in pinmux_ops.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

