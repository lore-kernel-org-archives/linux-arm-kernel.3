Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E18E7BDA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 11:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIclpm9YAFgNaTOb1aVxFMRktPn4/nx7W1GhU742dSg=; b=PpwxsdfDja69dO3Q62rY+2kbu6
	SD+hR9GieYZVEa1cV8aiR/xhR6IFNX7Jdcn3ssB1eOgECoWgDMjTNniVoqdhAGEyNuX653aqD3bth
	5aB6Tca4NTvUlGh7aNGlILivQeJp6x9OO//YcXwW+R55DHwVj1oUEfTEygtXmdNuPNrVKEnJXy0Sq
	1KA1Gcp2LH3U8YGbJNdWGZ7vYApM1DOi39YzGi/NrEr7vEOx8ZpA6nLoucd1+/5TCERm5kkcfRZ/y
	WRS1BIkPNCZZpedOvjovu7aQjyLhticmSmeRvNMWuNFDQt0OHD6AynWPrzfPZwCJSe0pK/c5b/zPv
	HAElpjCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwqp-00000006SJf-3FJM;
	Mon, 16 Feb 2026 11:33:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwqm-00000006SIS-2bjY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 11:33:13 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GBKfEO3659155
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 11:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pIclpm9YAFgNaTOb1aVxFMRktPn4/nx7W1GhU742dSg=; b=gF0EyuMcIE47Mw+D
	5SsIFmu/a6w1MJc6tKppvNuMefoloiTrD0GQC5JAfPmjO7dEZrSm1ejwqZbEB+p+
	2ncCfF8pluKv8rN9KIXS7bPkyP5VXQmrVnCVAtIDj6l0LCK8qAgFWmGOIqD2sm20
	uRnj2Ox83ZuuuAGpo9WIiUkVGBWorX8CBZB3I5q0TfaGZSA4HWrR1ug2cpLpB1pT
	ZfZexHwe+APs4id/nkySL5qb5uqitU3/ytlU+WIbzNVslL6b6MTKzOnBHwLbzART
	owjHnCdxj3NGAzlwM0mfxl7Gglqv7jjKhIUme+YvqMNUBfXPMx22DuXCVdUz1K9m
	El1TVg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cag24ce8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 11:33:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb50dfd542so143677885a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 03:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771241589; x=1771846389; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pIclpm9YAFgNaTOb1aVxFMRktPn4/nx7W1GhU742dSg=;
        b=WcGIkoqra7l3Yk/OsigLiv3E+sabhXjEI7pkqTD3EOeHDDAR8bJb7+GEMZQf7fjSc2
         JL1CL20+kvzGhS0MNw6C2nTBCxXcmSoofmm/K0g5bHnp1FPZwGP3WkUwVA6x8URT7fR9
         UXCBD+6A9mN6/9MjanbSQKC74SYYsHw+LYfNxKEVF8l46+YsE844XKWDlW0HDKwug8Cq
         tYVpaS8x3vjpIXIVi3aLt2o0hjWTsQpzja8mDYrGRqDTZkRrIHHOmMkk0ulHPwTJXA05
         tKPUhE1mqsyvDng2AVnOYpKtYH+hnvk85Ww3VMlqJNPJ4FrHrRvuFiI6IEYfzwhd9yTV
         qXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771241589; x=1771846389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pIclpm9YAFgNaTOb1aVxFMRktPn4/nx7W1GhU742dSg=;
        b=fuFm9JhKQ4wFTLmB9prdtecqRzfmMIY/OtKZgetvNvTDoOk2JhdSzBtNq7QEMTNYJN
         8h/KPW/F+H/fcPpGu1lvSgfcmwPLmNV55Lnu9MWy5pNDZNbJbZJcSrd2LakEUAUiDdZG
         m2jYBSo8I4O3BzdMs0y9SySes0YBFrys+9TaUlCpRa7u7/bcfjy8eR/8Wj0g5lDFpi6g
         IrYe2JFyzIfT/Obv7ib2J+VLrpEADj5Z8TAkT5RH4xBrglR3AtTfJc8geTenFGbZNsnh
         l08X+R4RW2kF3f6+O/5nPAne8lPz+g4bIOCrY77YMIeW89SJNqFYOKaS8yw+96ZWYd/I
         VRTw==
X-Forwarded-Encrypted: i=1; AJvYcCVb5t5IOyrjVG1xqyki9HqoGbebYkaK9UMzYxCaF9wFqDZzHQCtvmByZaRHAzwlbXqlEVH4lFimMeb5Q6Oi5jmg@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3YaFNVfA0lEO2u3+qUvMgdEI8AbFlY+XSxvjDnAZVwg9FRp0n
	18rokxLAFU4i/pc+tTd6UZh27HOFnpd4vSh4NAZoN+JdyTQkj9brZwXQfYS33NeNMW3fUCgm1JW
	W+T+eWT6vywXwrzCFAhJOUHJiw2yeM/X6r9gYqVR/MHXWCnFtl5WC7mtPIk8ZTI9yXoAw5HBBrN
	ag7Q==
X-Gm-Gg: AZuq6aJkoN9JlER2eXyONVW/r5D6EVM1CtuTPVoSYSyKsgpmiBEkKi2s5bzo9ds0W1Z
	+EcR9qKCbONT5ZFyBrhebgP/8bx9HBpdN2jQ91hjBj3qk6HKWiLuQ1oC5m19IWrp962i3LaWCKi
	ERNViozK9z0De0lS/EG1g7rgXjvkz7VvkV5WX3uKUVN0mf/iC/Vk/SWUY7OeB2tnwzflA3556JZ
	C8Qs4LHwyXAV51v6dbxiNM5aZE0F1rJvpAmnMSpVVwZCUeiTXhwpstIdm/06lpntILcLXIPFtuX
	G/8bnvqb3xIpE3ymaYFmNCdLltXol+TnomtL5iOSdW8vyU16XJmRg9eEAGxNov26QBXxKQwEkQ4
	nIHUEQC62mcxmzgi6BJ+DBsGhBpzJv8PILp1tRHppKCGzPGnCwJxY759MgLbiHHoxfLkwMIG+2R
	Xgz3c=
X-Received: by 2002:a05:620a:258f:b0:8c5:3892:a554 with SMTP id af79cd13be357-8cb408477a0mr993926385a.3.1771241588868;
        Mon, 16 Feb 2026 03:33:08 -0800 (PST)
X-Received: by 2002:a05:620a:258f:b0:8c5:3892:a554 with SMTP id af79cd13be357-8cb408477a0mr993924785a.3.1771241588450;
        Mon, 16 Feb 2026 03:33:08 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7626bfesm241879266b.44.2026.02.16.03.33.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 03:33:08 -0800 (PST)
Message-ID: <5647539c-de68-40c8-8dd0-bf078a086696@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:33:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] phy: qcom: qmp-usbc: Simplify check for non-NULL
 pointer
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260216110413.159994-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260216110413.159994-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216110413.159994-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: L01OwKhKF_rO24yo-wT3OQ6sk2PyeTJY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5NyBTYWx0ZWRfX0DYXq0RavBgL
 QGa1MrFDALmPjRS12ocklS1fdOGxwSCi2DvfEiZ4N9zG5q0iwdtd/nRapj4ajLfJnjuSAFCO7MG
 STlnsFI/WEooO0dKBOpMFjUIlxWBnXltIjZsKrJAa7F9wGsp3b0hQDlmRteMHSj9HubVLKEnXxQ
 cjkpTIldtzdWVdAPC09cDPw4jhO6L62v3B5ag7yz7+rD+V3lIAmnxlK/SMCgWCqYM2HEQtEUtyM
 +fnl550NW4o+LM9vf6yggvecny0i1jhv9+0ZPMfJt9IwWlzsZJhMFQc4w3pTSuQMlUMZLk1Usxh
 owPHalS7rnzebhxA8ITmpmD6/ioEC2fD+D6w+iv3wtbI5bjkbtOB6M1+6lVoZ0sqk5mjtY4TE+Q
 Fq8FAlsbJ7XzFik12COWmFMTjAcUdAmjavlt+S1BvWhF4xpee8YrLWloDc2AUDPfT6MlRGhKKIo
 fsUCbX0hUsq1wdB52mQ==
X-Proofpoint-ORIG-GUID: L01OwKhKF_rO24yo-wT3OQ6sk2PyeTJY
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=69930075 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=rQXAbXeZuVbgsyajZegA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_033312_863190_B8AA6455 
X-CRM114-Status: UNSURE (   9.19  )
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

On 2/16/26 12:04 PM, Krzysztof Kozlowski wrote:
> Pointers should not use explicit '0' comparison, so just use standard
> evaluation as non-NULL:
> 
>   phy-qcom-qmp-usbc.c:1682:31: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

