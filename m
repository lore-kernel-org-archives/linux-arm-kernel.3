Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD879E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 14:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbArVg6/eRJ5CBY3wlWkBQa8h4VvimPAbHJu1V1shmY=; b=dW/H1kKmNI2a0g9hLfoeJvYOIv
	WpnFRIWvhD4IUDQyvANBjKunTmm3uwyQnQlATGGCX1DhiEumHfw3NyM8CucLNufjG3DhQp3qSl5/Y
	Ph+3XVfYnKsT8zy2ikTEKC5dx4dHy4AU9A/zOI7IY7WD0hcvx5OCV27HlDeMBe3mAgJfMn0jRcM17
	2C/UG5rIPNKIkKK4CM4bPSovSCUog/eESJpTrp58r4Hj5NYOfkY7iN/dDocppoUgq0RQ7eX2YaCgS
	wyJTori4Nd08ZsCPQ0r119qAVd7Vr4GV5lymoVORz6IWNUCVNkJbDPencvRgjE4aizr9YCFk7sNSm
	Jb8ATTbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVtCg-0000000CAfC-0qmE;
	Thu, 09 Jan 2025 14:08:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVtBS-0000000CANH-3p0g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 14:06:52 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509D7XJe009333
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Jan 2025 14:06:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mbArVg6/eRJ5CBY3wlWkBQa8h4VvimPAbHJu1V1shmY=; b=YP8Kfpq2GiAcqEuu
	4uw9kQUSA199doBDfgyDTaI0jtv1L5zH8Xob4H96CzcFs7qsjjdxizFqfkbw6NjL
	vI67GCbr+XTjxVdHXh9uaIbFq30dJCo+Ts9S1HLk47Gyv1bBcpYr9ZFWoweSxSP5
	rdJX8T8ANC2Wl7WWLlWtpm7waEKPzw94i8OjtLZtr7NhXzkHl7HZaVvhqQf96pbL
	thh0GdRTHJFWdTbVwxNCXVuipcJ63EgyR0yIh2IvRTeyqQ/SLTjq+3g+DtIyH51m
	Wmj2wm1+p3qcw6BoaBKZt8c0zZm5z2OgH4tVMv2k8V2rLHYR2DePUSddXSR+/JpS
	KhNR2A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442f2kr4dk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 14:06:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4679af4d6b7so2316241cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 06:06:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736431609; x=1737036409;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mbArVg6/eRJ5CBY3wlWkBQa8h4VvimPAbHJu1V1shmY=;
        b=CGbhKsZ7VQ6EaJ3u7l4HVV2L7ZOAhB4rFbkeyMn0h6mMDyOFNh8ZJ84gywjA4i/pFV
         ChPiLJ/9c9jdi7QUbP56w5P8LGyNANbtE6yhANPMwGJFoTrV4BqQATETfHMiumZHPTrw
         fUBgumlNVLzngqw5EzEVUSWr0K2HGp7nLwcUPQnY7kE5Tq0kj+E7GY4eKdb4oYniWHyC
         icE0zj46FMzg/4Yi2yvgkAy3BDFXrGcnaImXEBSDfMo+M2lpt9kC2vk/i9ZoZVlftJ9f
         i31R96sLG/JPs0eYkExQnNQj8A+b4YCkILYhxFDlwGGVEfT6fQe/iHJfzPBUiPMM2Z8O
         7duw==
X-Forwarded-Encrypted: i=1; AJvYcCXwmZ+0D2x2+d/zYZHjgd7uYw4Y+mkcREwSB7MruvLm2+0pib70ncAvTY/CAfGos0xNd14gZVS79QBrmHKLq7QN@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh3kip4EebCjdb6kmQy6nXw4u8yMbj8pr6r3S6LY8HvbZaPaBJ
	EyY+llZR2qb9/nGX8w/YUZB/EE6iNcXbV072k7krC+uQzET2wNFOsgZ7a5rG0rocdMFsdkr0IOH
	vu5L4167iqLcd0gBB/hgo5J3Rt9vw9MS/ezCh78lYND2gOqYR8I+0h8KLzvS9u5c6xS3ljNGf3A
	==
X-Gm-Gg: ASbGncs33wTpxmA/G9vYzPYRixlRcNZ5Z7V/phVjSc3Z7vTEWeBoCoqH6ULkxETs+96
	LgOpReKWl1b49icpY3315a8OchNrl79XFH4Lv4J4xcDIrfWdBQoE0D7r8MrIR/VeOaiZGz2RxrK
	MjHJyaZzULuUIlOwSLWJ+L3fJoFEESQ9dxrMINu6yYWH3+5aIGfLbv/hdzuzbIfYvOPuGe5IMh3
	kVVqjqTajogcfhZ2c6Gm5ZL3HTE/FcgUun9OHla06KBLFq4z2IsAr40TbRPWSjM8xAacBnZLYSn
	689TIqMQRzrbffXBPfmnz8b4u4GP878s/KY=
X-Received: by 2002:a05:622a:110c:b0:464:9463:7475 with SMTP id d75a77b69052e-46c7107797emr38702531cf.2.1736431608977;
        Thu, 09 Jan 2025 06:06:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHie2b0u8nYDuEHN0u3Cf6+ivLeBSXYRoFjZINs6QXJq5w2Zszg8fYJRiSalrgy7pO1187gXg==
X-Received: by 2002:a05:622a:110c:b0:464:9463:7475 with SMTP id d75a77b69052e-46c7107797emr38702361cf.2.1736431608551;
        Thu, 09 Jan 2025 06:06:48 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95aee31sm74856766b.133.2025.01.09.06.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 06:06:48 -0800 (PST)
Message-ID: <308cd9f5-109c-4530-94c4-dd32eecf9ec3@oss.qualcomm.com>
Date: Thu, 9 Jan 2025 15:06:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/6] of: Extract alloc/add functions from
 of_platform_device_create_pdata()
To: Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20250108012846.3275443-1-swboyd@chromium.org>
 <20250108012846.3275443-5-swboyd@chromium.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250108012846.3275443-5-swboyd@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2s4slFzCO_ZpW5I7bdO0T5PXFGRBPmRj
X-Proofpoint-ORIG-GUID: 2s4slFzCO_ZpW5I7bdO0T5PXFGRBPmRj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxlogscore=999 clxscore=1015 lowpriorityscore=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_060650_970594_5D1595CE 
X-CRM114-Status: GOOD (  21.58  )
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

On 8.01.2025 2:28 AM, Stephen Boyd wrote:
> Allow drivers to modify the 'struct device' for a device node by
> splitting of_platform_device_create_pdata() into two functions. The
> first function, of_platform_device_alloc(), allocates the platform
> device and the second function, of_platform_device_add(), adds the
> platform device to the platform bus. SoC power management drivers can
> use these APIs to allocate a platform device for a node underneath the
> soc node, attach pmdomains and/or set the device as runtime PM active,
> and finally add the platform device to the platform bus.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: <devicetree@vger.kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: <linux-arm-msm@vger.kernel.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---

[...]

> +/**
> + * of_platform_device_add - Add an of_device to the platform bus
> + * @ofdev: of_device to add
> + *
> + * Return: 0 on success, negative errno on failure.
> + */
> +int of_platform_device_add(struct platform_device *ofdev)
> +{
> +	struct device_node *np = ofdev->dev.of_node;
> +	int ret;
> +
> +	pr_debug("adding platform device: %pOF\n", np);
> +
> +	ret = of_device_add(ofdev);
> +	if (ret) {
> +		platform_device_put(ofdev);
> +		of_node_clear_flag(np, OF_POPULATED);
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(of_platform_device_add);
> +
>  /**
>   * of_platform_device_create_pdata - Alloc, initialize and register an of_device
>   * @np: pointer to node to create device for
> @@ -154,29 +214,19 @@ static struct platform_device *of_platform_device_create_pdata(
>  					void *platform_data,
>  					struct device *parent)
>  {
> +	int ret;
>  	struct platform_device *dev;

ultranit: you kept the reverse order above, please keep ret last too

Konrad

