Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7A21090221
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 12:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xq8qSCuxSPb5ID8fPVBkFPObIcD/LQU/bYddZ14Kvyo=; b=noKkddcP86AaiMgjhJfaayQuPb
	EhYIHhLEVNxtAIdpaqxvELrieLH5mADtyb2wq6KBrttmCDB6BCrbfb9FOM9RYwST5m76WUw7Gp90c
	wBoG0IzQtzGMvKxe9N3tgu40I3CUF7tEA5/ZYVqsKxqOhUPPh7nADpoKnwJVKMKO6odX8S1rFzn3a
	wvkZHrN/n7ytLhj9TqZfa7/UzjU2Pp0eMpB8RAL2LxBwmec4xN11kHidMxVT51teFqRy8fSaeUTsF
	EEyPa148qHNuZlNw6ZjGanfpkewry39BptZ5/W4UWRAVm29JRuIulEeAP70+G1+5xGHMeP7waRW1p
	hkjKi24Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3CuC-0000000Adwr-1azv;
	Thu, 19 Mar 2026 12:55:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Cu9-0000000AdwR-33kX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 12:55:15 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J7404c2883726
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 12:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xq8qSCuxSPb5ID8fPVBkFPObIcD/LQU/bYddZ14Kvyo=; b=WeFGKZvJNHRH2mpg
	CW7azge42SSmeF3rypJ0G3AlZIGINudzu3IvoLqoha94UeAKkg8SDvkgcLxVZ8X+
	YSkd7dD+aAhaExmLBbdI6KInbsv/6KTgH/CPqQRb67VYRup4osrtm13QSC9UpZEG
	QoEXKjI+Cvoci+LnBdvw9IkEdCpaEGZWl3Fetw0VAqOm8skak2ofgFwsBDUeuGix
	a1fZW3yIjUhFaK4nOc8EKYg67QJMnukjIyf5JmWAeMyB2DS+7i1ggokPdoahWd0U
	PNr4V6dcR+ALM3UzlJpUW66nxxKEwgaEx3FW6+zDqPbJPGZU2BWcTNSAmGAfNtnc
	2s/83w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyvfnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 12:55:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50947db2e97so6982631cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 05:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773924912; x=1774529712; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xq8qSCuxSPb5ID8fPVBkFPObIcD/LQU/bYddZ14Kvyo=;
        b=LJzwgjZaMmovyKzglPRAbuVGAEYgINWed5f1wMB5YNISHH3xVUTbma2N8b8HghSdpk
         Xb6iXgwmtJklE/+iAW1f1/X6dc/+a+ThBS/ZQH6e2CSRgkjgngx8YMaSeyU2Tf8ADSeo
         hvgXccLst2F1rtNaTuC56nD7Whs775pJ4mmyaNpMHZAb3EltUw/DC+I9IvQNGAh6gNM0
         4AL7PJymbPbiNXl9YFj8XztyrCVl/xvbQFUU1V1gEp3bYQ+yE5AX9d+5ZQjGISoIZmXb
         5W9Wnz1aRJYwsDFzmrMrc2v4pim/XH49ZcIQt2Ad4Jp6SkmzmzXGpsQjaCp+0Aj6uUSd
         o7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773924912; x=1774529712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xq8qSCuxSPb5ID8fPVBkFPObIcD/LQU/bYddZ14Kvyo=;
        b=EAdGFyLZUDiiS92IBXrjYlj5X/H15wNKR4PSSkajFD8ojvSEm5vZNPozx9u9L/CT+K
         JQKj1A7/qnlnLOelMXmTZUZjbfG0WCuxWv0qY89k3avDjyCkbuN+YoAG/nYakcJArqSi
         Ev4wPnO7W++fhc5yolB9VkwMqOt28LjTUTs8Us0W3EHRgXznxR88Nma0MVnSuqlOsJHU
         Yyn70UEVDhUSB1fgrJnpsHyM/aDqzeGsdh6TnpVBNklyY6YjWNF8Z/pxA0ptdXINXOsO
         9DhI4xp/2yRktimza7Xc/eQZn4AC+xlSngIHom1OY5F9DUDtFGCZ+S6HjVnya3OmZas/
         LPXg==
X-Forwarded-Encrypted: i=1; AJvYcCVbjAf2XCdRdcfm7AER7IBMYXUvxRmC135dvslHw/FTGn4/HX32sIIjLSVVmdpiYYGpBrCPcBsTE2bi+bN8jKgy@lists.infradead.org
X-Gm-Message-State: AOJu0YyPHxdnN2qcI1U19seTwXLNmBns8xfl8RxGRfuhax5P8DmiWrAf
	1KTWCWhBuOHrgUcIg+3O0yV9l/JajPKiK3O0zCzSVYU0uXgQ2MDsemQWEw8nb5Lpi1zvMoCVYSu
	MgZHn2ZsTYa94NppyruApwaiRuSg6mGIoSF9tMqr1zEW7ynS/syV3nlAV4oYRRcVC6K6zM7Epe1
	wsy9fwYYGkNA==
X-Gm-Gg: ATEYQzxEraT8ArB47kC9mtFu50U/5HbXnfcLHgDQwf+a/noBRKWCk9J7dkLK4tbwG4e
	yaF8q9z3VqGh8rJz8Lt1i0er6zF6xIQFRW49QBVLlbazJpZrS118le99X1XQ3EV8huUmqWXUk5H
	1eCAynHhkHsSvCG8KepJyziadFAjEfqcepNquhw0NTJdF+Je3puezUc395fImOvlbHkoDpNEjT1
	J4kQ0FbUbICUL/YqdLpDuibhF8sPUNvyuIbKAHVEvuRHJbvAeUmxd4wu6/Mj2DklnifyEY799sJ
	y3NiMmjKc+UWcpFxa9Aq9RbsHl4CAVnO/YW9rXgXFfq+i9OUAoHvXapuTIdOOJSm40yM+LtOOfC
	VPIbmPiniX3d3X+6DXrsfsnfk4Hk6uZoT5Or9dIHuJPGWmDfx4h1nO/aQBbDVta5eWig7W33aNo
	XK70U=
X-Received: by 2002:ac8:5f4c:0:b0:509:882:9e7b with SMTP id d75a77b69052e-50b148f4455mr72476151cf.8.1773924911880;
        Thu, 19 Mar 2026 05:55:11 -0700 (PDT)
X-Received: by 2002:ac8:5f4c:0:b0:509:882:9e7b with SMTP id d75a77b69052e-50b148f4455mr72475741cf.8.1773924911450;
        Thu, 19 Mar 2026 05:55:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f1452214sm428778166b.27.2026.03.19.05.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 05:55:10 -0700 (PDT)
Message-ID: <d97237a6-7f3b-4358-8972-5fd4b65d8f27@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 13:55:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] clk: qcom: gpucc: Add GPU Clock Controller driver for
 Eliza
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Akhil P Oommen <akhilpo@qti.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
 <20260317-eliza_mm_clock_controllers_v1-v1-5-4696eeda8cfb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260317-eliza_mm_clock_controllers_v1-v1-5-4696eeda8cfb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uTltVyZLbPzj7R2heve4dv7QQtR8PY5W
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69bbf231 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KlJgg6mcpdonUnbyTwYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEwMSBTYWx0ZWRfX16+yGN687fsh
 6ZwEL5YXjMgzLAsMtJkgcwe6gLdRl0FaIs5AA53/La9qK6d8GVyZwF2+gPkTPFBEKc1LS6vu2bZ
 0s/+JENgrWsKD/7vQZ4wffihHt/3/Lss13VA0ljX7LTvut4K3LSXnRXGQd8zLTSGzYh8S4NR0Hr
 rrAMcoYGwnK/cLhRDY674ZKikWZohfqKhwT4JkmR3uon5iB2RLHSDFOXURhUTReQQ+N0sGHzAjq
 KXXmiRO1TXFxrPvMWRKHBm69LE6xhEZhAptptxd73OXbntJmeWqUhaTNUWd8alUdz5gXAqzAKlP
 RpQK1P7s1crG657KVb9PCKb0Ci8ijoHLXkp2RNWpgpmgI+yTmGVj1QOZp+JP4CUcgk+UlQ/goDJ
 MyqRvxp1SASnA8cbkkPJkzU9km3yBE/5LA2aEmWNQfddCsQpDMbgoMxNOM6EvkCBcj1tAN4V4ma
 91iVIwaoTPkU3dBzWiA==
X-Proofpoint-ORIG-GUID: uTltVyZLbPzj7R2heve4dv7QQtR8PY5W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_055513_777240_5243EE2B 
X-CRM114-Status: GOOD (  13.27  )
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

On 3/17/26 6:14 PM, Taniya Das wrote:
> Add Graphics Clock Controller (GPUCC) support for Eliza platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]

> +static const struct qcom_reset_map gpu_cc_eliza_resets[] = {
> +	[GPU_CC_ACD_BCR] = { 0x939c },
> +	[GPU_CC_CB_BCR] = { 0x93e4 },
> +	[GPU_CC_CX_BCR] = { 0x910c },
> +	[GPU_CC_FAST_HUB_BCR] = { 0x9428 },
> +	[GPU_CC_FF_BCR] = { 0x94b4 },
> +	[GPU_CC_GFX3D_AON_BCR] = { 0x91dc },
> +	[GPU_CC_GMU_BCR] = { 0x9358 },
> +	[GPU_CC_GX_BCR] = { 0x9058 },
> +	[GPU_CC_RBCPR_BCR] = { 0x9224 },
> +	[GPU_CC_XO_BCR] = { 0x9000 },
> +//	[GPU_CC_FREQUENCY_LIMITER_IRQ_CLEAR] = { 0x9538 },

dead code

+Akhil is that useful?

[...]

> +static void clk_eliza_regs_configure(struct device *dev, struct regmap *regmap)
> +{
> +	/* Enable frequency limiter irq */
> +	regmap_clear_bits(regmap, 0x9534, BIT(0));
> +}

..sounds like it

Konrad

