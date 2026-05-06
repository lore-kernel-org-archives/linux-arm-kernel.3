Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4318ECD3442
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 16:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vl6gtDEwP/WGqP4XGKgcHTsYq0tg7ZJDq6KWRqpyQPY=; b=CigB9RgTyL7frEuVYYyWKjQQ9m
	l3nG1aiptTJl1lvWjPQEiichfdR8jlsKg4GWlsXul28YiSXPwdx0H6fxhmECD3RBok/tlm71nMvza
	LZDFVrdCZMdwfc1ag55rdCP6Q9eAVdteE2P6Oupq/AA7lrMbi7rf3NCs0c+au1gHNIvEyxSI8cKkv
	SozU3xGNli+gCOmjdse419ejhdISvViLTQicyzqYjruDAG6+41Ye+i1Nxcv8gkw88Nf3DG46FnM1i
	OU/BbAlqetEfogH6hRucmJDXZysDOCVyv/xAYgVvuMdRAL9doXyuBvTs28UWQR7BZdwTseUCeBTDe
	xx8S7V1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKewN-00000001UBn-3zmo;
	Wed, 06 May 2026 16:17:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKewN-00000001UBU-1fIr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 16:17:39 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646EGBxq3309059
	for <linux-arm-kernel@lists.infradead.org>; Wed, 6 May 2026 16:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vl6gtDEwP/WGqP4XGKgcHTsYq0tg7ZJDq6KWRqpyQPY=; b=f4hebraPSXWso2xB
	ZVPODWHYJbqc3TcCB42zbDmh25VHSdrAzg8ksAJxrehsSfknt8AJiTyZlX2fQc2I
	RrIWQz+LLUrdBF/iEkdFr1oas3qykbOLqYaYEqFEOGxofcMzbDduREJH9y8gkmhb
	EFj2lNsg1jiKixua3ZCuwkin7hPgn89sbV1uMqspGI1Kr+RliKkx8eYOuGTOisbA
	Re2F/bnXgehXejg1JUoKj8DrOxLdVjotiBCBnLG+/7cTVo5nh6GVdZaEAz0nzNMO
	+oYBELy/9yLHek0rBE/FVICz1PsvlXge5e+KYvwb4d22kiAQacqe0mC3Za8j8RmA
	H62Dsg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e078sgghp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 16:17:38 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95cf2f6a8d6so2746255241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 09:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778084258; x=1778689058; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vl6gtDEwP/WGqP4XGKgcHTsYq0tg7ZJDq6KWRqpyQPY=;
        b=b/5FOlNW6FEbjPD2E/ghFspflCkQATJ8EL3sWtyzJVjOrWR1zyM2xmnHFUgxrjy645
         C4XNMHiE11qnJtvvJV8ApQU8fyVLvAR6Q2IDGKtD8+vPBpbj8ptlYhzKOhuSGPzIA7MJ
         L1lZhP2saZQJhv4yF/ajTVPI5oQFXSiztRIaVx/5JUQM8diFZ4uQlwK3qHnOJeJj4wpG
         5Llu9n2FB4aAQYOClOVlwcLetxVAnkZD2SEN+WAga7ltXqOZLmQYObDrx71Gs1MLXcJS
         cQvy4wdGXIMaqb0yO/d1ulH0x9Cx2qFG2jtxsFca/D36S36U+ewCrxnagjVGwSM2Aehb
         VF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778084258; x=1778689058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vl6gtDEwP/WGqP4XGKgcHTsYq0tg7ZJDq6KWRqpyQPY=;
        b=h+IYMFk+5NFhcwT8xXzKVTNfAJR70W8ZiGoD9eQhoBYIdjZjvt7JUX9LuAFQmWxy9a
         UaSNxVQxvCco0RK2P3qjII07T957Nd1ILFioB8FAUK+4+44BfVIOeyTK3IvjHF03QNDx
         d6ldFWZmvOdBMgoKqDj/1Ejwi1EhJ80Q6XkPiLy4qijppxGOLskTxnXwSxMXAxFEY/u7
         llqhzvMNLsIGR6EdQjJLPz2KgRVj3UHZlICeprv6zvpgghzStbf0GXoH+wi53mHKfzef
         jpmfPIUzCc9gfT4hox9/VsOBJy3hKUY4zv4L/5FQojG2WMZ8R1BbV9MK5WeWWcox7+9b
         2T8w==
X-Forwarded-Encrypted: i=1; AFNElJ/y0Ri80Uy10KVBTF02Xk9np7vdFLuLROhAnlJ/YpvKoCWP7N4dsPmQ0r2DRu8eBCUCvt1Z42UW4cai5+1sc9YP@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8NUVez76B9bcJeU3lRzNwYK0Ihw6dG4SWDeNFYchfnj53teM7
	RFrsH0Yi+9MlN1mftxcT6G87EIJj+JVwsU1FZFG7f5wd2IPM5gWHFwj1RlDRF6/4OSrD/p2xJ//
	fVzVtOAzRcDt4hGiaL5TFrNoOzq2Lci/i6zUcqQAxtpUwp6Pk6lwtfvhMaHH5lIhjgAzclh7Fwt
	r6Bw==
X-Gm-Gg: AeBDies80WWbK3H8BKY7eLOgWCbxXf2deJVYBCtjM6P3Clhyc4TNHOiFcOWpzcIh2As
	FrIiuJOEYbNH+xWUdGUv3SwZWNvkFtQ0+ivdI9qyHuH8VfenYFIt6CfV/g7uzW6SyaVPa3PjyBB
	dD3hM12qho+4XgCrCWUBiMtR6/lwEwJ50qyQYacXj/946qYta654Q2/+bHJ3YJ+bFvd8nCMeoDs
	2H0xeGkn8tLVYxBGdUiZhg0iIGI9XMj+8wfcUKB9mG26OzJKOzqd/ZTsGslihLkH1jlCP0zamk6
	TH2tiIKM0zsLtMfChYN80vk6NWsiAmdxj4wMC77fFSlxlKyPVxqnwD5T00WKgetFEQ4gQurbm1X
	L5S7nMIQHBk2Rg86pXrbJiUFtP3zPmmIIMnumzaiAPjvp1t8ahaWQbBG0Ced1loNh0K5w/YmOMk
	i5W8r+8M1fryUmX96dhyI=
X-Received: by 2002:a05:6122:8106:b0:56f:b831:909c with SMTP id 71dfb90a1353d-57544474e1emr3810510e0c.1.1778084257938;
        Wed, 06 May 2026 09:17:37 -0700 (PDT)
X-Received: by 2002:a05:6122:8106:b0:56f:b831:909c with SMTP id 71dfb90a1353d-57544474e1emr3810491e0c.1.1778084257512;
        Wed, 06 May 2026 09:17:37 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a? ([2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53891d62sm95223275e9.1.2026.05.06.09.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 09:17:36 -0700 (PDT)
Message-ID: <2e9dd9fc-a42b-40ea-8393-3bf66955c4f2@oss.qualcomm.com>
Date: Wed, 6 May 2026 18:17:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] thermal: qoriq: add i.MX93 tmu support
To: Jacky Bai <ping.bai@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Frank Li <Frank.Li@nxp.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, Alice Guo <alice.guo@nxp.com>
References: <20260430-imx93_tmu-v6-0-485459d7b54f@nxp.com>
 <20260430-imx93_tmu-v6-2-485459d7b54f@nxp.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260430-imx93_tmu-v6-2-485459d7b54f@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Lc8MLDfi c=1 sm=1 tr=0 ts=69fb69a2 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=8AirrxEcAAAA:8
 a=_0vOcDHEFh9t5MRidCsA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE1OSBTYWx0ZWRfXzETeCoa6hRUD
 PMUqOCpuWBj84YnjvYnZW0ZBLx2Qo7iyUd38C+0ouSqO3Ud8IBHBtQZTIhHZPToEWsvD1EzaqiK
 DBe/Riv82My6+0Pw2jDaPabv88G0wzEWJDNmnQPijVyWTuYiFxR6DiRRcU68Agt2dORZWbiNs0U
 VwpsY/cENa21zX4yD44uvnLzyOOGOnbM67p4eZtv+/WRHUW/SrrgeaTrjRQ2AZsW0q+bgiHPAbD
 PqVbIvpaBJfRf/uY/fe89TqCqxh4VGqZf62+FdJKCvbKTkLYn/EwZc3MDCSXondrPEieYphTMoi
 hthdxOW1J1DL+udorGmvYBQHD+VdNDgP6WVBeWlMm+nh1IHpGkMk+W/lxJkATIVQ89wkC2fVkN5
 PexuTwsKB+zZlAjGY4DrfBVbw119wu+iTtxkL9Ru3XOtAkmw9pLFqpic12WUIh3jVB2ooWnmk7U
 UI7BlQ5DpJ8Hxg0jGAQ==
X-Proofpoint-ORIG-GUID: UCI8XQKH8znEufcMg-dgzohbMmHmaUhb
X-Proofpoint-GUID: UCI8XQKH8znEufcMg-dgzohbMmHmaUhb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_091739_448759_EAE3C3E4 
X-CRM114-Status: GOOD (  18.22  )
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

On 4/30/26 04:53, Jacky Bai wrote:
> For Thermal monitor unit(TMU) used on i.MX93, the HW revision info read
> from the ID register is the same the one used on some of the QorIQ
> platform, but the config has some slight differance. Add i.MX93 compatible
> string and corresponding code for it.
> 
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---

[ ... ]

> +	data->drvdata = of_device_get_match_data(&pdev->dev);
> +	if (!data->drvdata)
> +		return dev_err_probe(dev, -EINVAL, "Failed to get match data\n");

I'm not sure testing the return value is something very accurate because 
it is like the code is testing itself as everything is self-encapsulated 
in the driver.

> +

[ ... ]

>   static const struct of_device_id qoriq_tmu_match[] = {
> -	{ .compatible = "fsl,qoriq-tmu", },
> -	{ .compatible = "fsl,imx8mq-tmu", },
> +	{ .compatible = "fsl,qoriq-tmu", .data = &qoriq_tmu_data },
> +	{ .compatible = "fsl,imx8mq-tmu", .data = &imx8mq_tmu_data },
> +	{ .compatible = "fsl,imx93-tmu", .data = &imx93_data },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, qoriq_tmu_match);




