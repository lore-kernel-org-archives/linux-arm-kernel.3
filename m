Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6C2E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 14:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jmyRoYoXdFm3t1ZvxCEQdfjo2p7lHvFyXfwqsSYXeSo=; b=cybFEL293Vh6rc6NCHONPqyiLv
	WKriBWDIymhfv8mH5cXejVJRzzmQk5XwXpn47/475D+xyrfDRezwiNBctAPdmHHB7kd4NsVuBmyNE
	2SYYjf+i843a/P04T/Bskl+3ZqKgxyFlODCyzZz46iKQqn2K1YKJ5xKrxm+6zSFRgP8A1YP5aTh+5
	hhk1qKRMehp2DguK0CiO87sdZ1WX9lZImAW36GdUzuzzMjd1csk3bKJZtLjL5eWwcmEE25fel5ogf
	bW96tBcNRv8qxYK419g/DbULRptyPshqv//glAvZ/m/sm8v8WfBgrWhJ32p5XogTNXq6ZnINkyjmn
	bmWuj93w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVtBF-0000000CAH6-21eH;
	Thu, 09 Jan 2025 14:06:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVtA1-0000000C9mE-2JkY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 14:05:22 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5094go3V018460
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Jan 2025 14:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jmyRoYoXdFm3t1ZvxCEQdfjo2p7lHvFyXfwqsSYXeSo=; b=MTg0GmYchnsOejg/
	uEzwshHY1V54wPpOSWyAYR66okd2iQxP31pQyKyKfHYgg+B25zhz3Si5oWUTNJmZ
	gj2SNZ6Ac7iu1K8AU+RtIlp7DPXIWi7M8Di2hy+nCvPJLUCY1VDplVaLeQr9G+io
	lEzIM75G/w5K1ywG4s7V9QiXR8MGHKSu+yS0pVChb90HK7MRBnnHXfmaJ6YP4rjf
	Ek58ul3tTaa4i5G745NRJJcu0zEeyhnVlhHUC0mBP7J9bchZYS3fQdbiLhhjlSJt
	lhPRy44V5SFXGiL0qHZBrlW2egDtnP5YN5SvkNSK8T/ewZTBjVdEynrsetIeH/5w
	0wr1Jg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4427nws8sj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 14:05:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4679d6f9587so857851cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 06:05:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736431519; x=1737036319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jmyRoYoXdFm3t1ZvxCEQdfjo2p7lHvFyXfwqsSYXeSo=;
        b=QhVoyYALMkW5r5Ofx83e1v5nSkqaZOEOeSkh1THXodm7tj1dS5MFZNNtLKCJ9Ga/55
         ce6XcdgBxVhPLUVfbuGKGLOQjCKEe/+wAb1fPQj2U6nkNOJJMTURWaTSd+hn1gCvkCAT
         lwW6tEdw4tgpRw1SxvOWPZ3xoD25hgd9ECtSDUVGjuuEKDEFuLinrEaOZjggArKeFC2/
         l8E6jxGK2+Hs3Fj7JuUuoxOheYebmdI7mBY8UOHajxtIaYkCOMbbmJjz0YdOL1dn5IHn
         llZR17kY4nIiAa6kJPr+5pb5YGUXoWsUMIZz9xEP7kmtxGUQXK/+oTtP+5Y6lq92vBpx
         7TOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRbUO3/LKWEN0V9CLDDBMXeAHJqlPm2auhGMiurPFKK2ihCrLXXnDQCDRD0/+Cyl7t5oYw8d4N/5MSBrBolNI1@lists.infradead.org
X-Gm-Message-State: AOJu0Yz768PbrBSLhzey/XLFa44yma0uc18h3ihH8dxOiSWXs1pkuFnF
	UnTBsMPTPRACseSRygmUg+KPvnJPmGKwH9zPDMTiqCDqLgUtC3oWHiR8GvBZJ43tvXQNTDoxcbh
	nTwTvWUXxeQMrx5cyVJpla+xM4W0d2Ws0uymal39rxkLcwYfcSk6IYllg/Dpmp652j61oWbyOow
	==
X-Gm-Gg: ASbGncvGb9cRgBTTUgf1LQhLzDVkHDJLiXnwF14yXi27yOGmgK6VQqFmxmbS5XLb50P
	Gg+5jR7A4pZ4JTQeMqoL9KU0aZ+EnC7g/xKp2F1mxbbyjK+mmKNxWE6PnGW+b0dr1qEv+c/v7dw
	qOiylKIReg3eCWlouWl3VuSqB/2GJcQGvXADs8jgQKD8f+EFfA+3y3bZIH0Jp73YOXQtcETdb+z
	XUoxEHP56UNFM5EfQ1upEU0VYZlriq6CzbIGVMc8L1P7pxdgi9YMaYBwuQO4gKUHaCWXn1IRQUr
	NwWU2PgaeGMNxc7N5/le8SXzm7/l6YcbVH8=
X-Received: by 2002:a05:622a:286:b0:467:61c1:df39 with SMTP id d75a77b69052e-46c7107d82cmr39750571cf.11.1736431519527;
        Thu, 09 Jan 2025 06:05:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFh0MWIoJ9XR87ldHHy6FP17ePLNmNh9w1tSS3oyRlv58o5iBDlj+igtuNpR/o9oeGMMDjgVQ==
X-Received: by 2002:a05:622a:286:b0:467:61c1:df39 with SMTP id d75a77b69052e-46c7107d82cmr39750441cf.11.1736431519066;
        Thu, 09 Jan 2025 06:05:19 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9900c45aasm626251a12.28.2025.01.09.06.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 06:05:17 -0800 (PST)
Message-ID: <7a64e927-235b-4d63-af59-f2c80464a9a1@oss.qualcomm.com>
Date: Thu, 9 Jan 2025 15:05:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/6] dt-bindings: bus: Add qcom,soc-sc7180 SoC
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
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20250108012846.3275443-1-swboyd@chromium.org>
 <20250108012846.3275443-3-swboyd@chromium.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250108012846.3275443-3-swboyd@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uiDANlHSnuFifdgDS0yRN76NkqMJJ1Mx
X-Proofpoint-GUID: uiDANlHSnuFifdgDS0yRN76NkqMJJ1Mx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_060521_718748_C4403D6F 
X-CRM114-Status: GOOD (  13.81  )
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
> Document the Qualcomm SC7180 System on a Chip (SoC). This SoC is made up
> of multiple devices that have their own bindings, therefore this binding
> is for a "bus" that is the SoC node.
> 
> TODO: Document all child nodes. This is woefully incomplete but at least
> shows what is involved with describing an SoC node in dt schema.

I'm not sure I'm a fan, because...

[...]

> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,soc-sc7180
> +      - const: simple-bus
> +
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 2
> +
> +  clock-controller@100000:
> +    $ref: /schemas/clock/qcom,gcc-sc7180.yaml#
> +
> +  watchdog@17c10000:
> +    $ref: /schemas/watchdog/qcom-wdt.yaml#
> +
> +required:
> +  - compatible
> +  - '#address-cells'
> +  - '#size-cells'
> +  - clock-controller@100000
> +  - watchdog@17c10000
> +
> +additionalProperties: false

..this approach will make any dt node addition under /soc require
an additional bindings change, which sounds like absolute madness

I think additionalProperties: true would be sufficient here, like in
Documentation/devicetree/bindings/soc/imx/imx8m-soc.yaml

Konrad

