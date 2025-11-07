Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3136ECCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 08:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgS5hwRfj2mxPLEmin/RQvyBPkehj/tTh/N9o3Q2CaE=; b=ksNq/NzRkWuZmjWQ6s4JMOAYtQ
	+gC+oO2tF1pveI9zx6tuTUR5nmJ9ZYghX7sL9BF6vEeqXon7smTbXD5wn9GCG1qxnYdF32wexKeW/
	EPJ7dzujNASwd8V5CkmJRlkgBWZbQX7V3CESnboSjvyki4vlVBVh4F82X3avpIFNpjTHH8rVh6m9H
	Q9qIo7FzGtCVpW+5PHIMbIvfLYGsYbairIbUPGU3t26ebIZ1csNOWEYXIuNmZEn0SXiTO3THHCUH5
	A/fofU3fdow2zR2mLKieE8QuALPjZAoxPfsVIrSbeiVAFAEqAyGa4YOpciu5t1ADeBT9LldrWchvj
	jIp2edmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHI6G-0000000GuOR-0hxa;
	Fri, 07 Nov 2025 08:45:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHI6E-0000000GuNW-11GJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 08:45:39 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7451xu583731
	for <linux-arm-kernel@lists.infradead.org>; Fri, 7 Nov 2025 08:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QgS5hwRfj2mxPLEmin/RQvyBPkehj/tTh/N9o3Q2CaE=; b=j9VKSGL5ldNhCJw0
	IDsem0Fzr4SZuyQvM/h+H2DD1w1AXbGzSR3pIfo38NsMeard3DiozlihvbgOA8mk
	E6iXrhmwPw+FvmJt6QIA33bRR//xSA+t/4krdqjLlTv+Ktsev+bV4kYprelpwNdF
	GRGMArQuSTUJWlqAla3WFLSuaGWvjhBrDvToC7CMXn0vN+J1xQZllcYOCXarce4g
	qBJRGRQBgZLrKak5prqU40NrNsbZbzxGb2YBYOhfRhU9EAFl2akC7pCJS1EFpvvT
	BJycTnz7G1RABrBE0q3f8B1E86f9WqOUQCb0IEp4y1Fp73PNUYDuiP/x9QZmB2cp
	h7FEuw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8yktjcxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 08:45:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b23452ec2bso12411585a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 00:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762505136; x=1763109936; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QgS5hwRfj2mxPLEmin/RQvyBPkehj/tTh/N9o3Q2CaE=;
        b=NVc/l6DYalY32PluePuz/Q9mZTflZWFWyqarMmMazbN2m5VgwK6WFAfcrJWFuopauA
         SfV9qDTFeVuiIm2hN4UJXiAcabYZbKvOGm1zEXIfnIH6Owsrff1qpqmatGa6A70S+YrE
         m/dO+9B8+WKbFFVtQgURBtguYrBD4pN9AUO5NyV68TxA9FhSPKAyIJawvBvQhAtRuW5I
         YN+MzmHViez7PJC+hxHUgBNc77P+qV+UctVgDkLMCCoElvU6NwOTpR+UCEPG6ckMvGc5
         pbWCCIap3jjLg8UDVGVBQHT26tpa2fEyVMxN+ns5cZbtMnv3CPI8SAWVtIkRcE91JuVR
         d7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762505136; x=1763109936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QgS5hwRfj2mxPLEmin/RQvyBPkehj/tTh/N9o3Q2CaE=;
        b=aNs+6KhTEy+4mTnl8MsIij96hMWQVwKOivSVfzh1pYKgPh1wH60ccoAGX3R6C0LCy+
         5/PRrnV5vfQy2A17y9QS4cx/yw/tr/hAHGiA9ZZ+pWL/Bl7lYVWKrACByi2Z2eF3dglv
         ydNmOW4uk1ZJV+K05zal70FuQ1ynrYu8/16mnUBqh3jnDmAcH9xCAapvnbdZYqu/RtCb
         sNguvcTn2w+qrcqEgsUpYG4R8LB5WE0Y42q+i8kbnFFnwGXQpbLl/0qa2JzqrQOkVcQA
         9gGBZa9+RKztSxeLcQGoDvkkWEmjB1KZo0a8vIsuTRMTJOXGDaksBVlegVd9WxwwHkCy
         3rkw==
X-Forwarded-Encrypted: i=1; AJvYcCURE7hIExYQlWXfP8VcdT11VDIq/4R4DTv8VBIEJP1x2JqNNQvwQ3mK2ItrtVwjT8KQdhTiR4mTslV7y/F30jQL@lists.infradead.org
X-Gm-Message-State: AOJu0YzcejGA46KekXbP+OSOshhKK4NBIY7+WdFbminClGIciP+oZcgG
	LPzQmlWDjHizOszAxF0H2YTuTlF31+1T8Sa1L2MijnfdT18myv0DqwDv+T1CEOGuArGqHDodAFh
	cWijc0HuGq/ZoLV9xljHbZElQvSLfKukpvq/OibLsiZxgVr9L9iKQ0rqZk4yrsmftZlJHixRrxb
	JRcg==
X-Gm-Gg: ASbGncvOcWim388ZkcecM6UFcxxmjhxqL4CHfw53wQ+X9TvboN1kYPbI1owleg4FiB+
	AILvb4pmy6Fzfi8jeo1f6ACZfcRIqoSIMKQ1PBQ2PfQ4KmITnI03ctU/TBYUpaiXgH7dOF+b47Z
	pssRQ0pi/dvQTl+df44NoQZRrCWa2/n32HQFyzreaWeEwBgHUNfJz9qERl3zBiI3FFBW41kfjXB
	btJyAlJbZ5QczphEmko06w1+M17fOT7o2d98zWkDbI3RlvagNncVT+9tCvJle19BqgFjyz34/qr
	LUWkwiKHm4ijt9JSdudCakqxPQ56FAjqqKbunRaxoCp6AU1pJmfDy2+p0IH3wfVXH615sMYjYgx
	/JE3OOprQ2O/eX4LbN5Lo7cKorLC40Mpgue/Hl8tx0YOQUZBE9fjBPrVl
X-Received: by 2002:a05:620a:29c6:b0:8b2:fea:21ad with SMTP id af79cd13be357-8b245325b1cmr200933485a.9.1762505136029;
        Fri, 07 Nov 2025 00:45:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvBCF3YyaLzOcN+aoUwXSd+qKgBVW+y3iV9o0DDasJiaqAVotNnEsYQ0f5UYACwqcVlSpGpA==
X-Received: by 2002:a05:620a:29c6:b0:8b2:fea:21ad with SMTP id af79cd13be357-8b245325b1cmr200931685a.9.1762505135491;
        Fri, 07 Nov 2025 00:45:35 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97e563sm184419466b.41.2025.11.07.00.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 00:45:34 -0800 (PST)
Message-ID: <c7065cd8-9819-4af1-a346-4daaa4e306e9@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 09:45:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] firmware: qcom: scm: Simplify with
 of_machine_device_match()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thomas Gleixner
 <tglx@linutronix.de>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-7-d780ea1780c2@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-7-d780ea1780c2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bOgb4f+Z c=1 sm=1 tr=0 ts=690db1b1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=TYptV6U4Xydj_hDeH6gA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: SeChImPyNG_T_XIPmsQoXY6oxwc3zi27
X-Proofpoint-GUID: SeChImPyNG_T_XIPmsQoXY6oxwc3zi27
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA2OSBTYWx0ZWRfX3Z2VQOi7/XLj
 hkqj1jfjYoK91NXdpImchKaJaZ6ejHtbpSe7OneI3f5xwuete8kVHUMJp+e0mr4kusM0+oItVHV
 yFNd2312QAJ/46u8fS1AZptL8Ccbd6h6uTJSmMkhv6fiq8s5IMr2NgTVXAp/yxpX8229u5XEIU+
 jasHhP2aSjq2PHbhlCSQtx5XSpybDporKK+FeabzVctt52FkASnsOMGZ4bty2ACtJem0k0AERdq
 QEGS4IV+coo67799D5U7Yfw4Q2HKDBOn9jln6VW/Ihyo3wUgGri2vOk24weLPG4DT8jVVrjNpfj
 lavkQNQgcIrpxRGT91BOY+meMmqYf6SZEcnjgeFOVVkG33Y7jGu6frnZ8EdN7M4Uf5BA8Yxt4aI
 kZKo3fqNbYD7PJS7ihrSrTQu1ndVrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_004538_282016_EFB52D15 
X-CRM114-Status: GOOD (  10.34  )
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

On 11/6/25 8:07 PM, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node and matching against it with
> new of_machine_device_match() helper.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

