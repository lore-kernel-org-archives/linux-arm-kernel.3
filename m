Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36974C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 15:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vyx3xVvWQDVKiKfZUlkZQl+55/TqlPifg4DigWt7F3M=; b=oAkgY+js5uVY0SRCZCyujqo/cs
	sITIsKS0bXMJrA02SMmoAx+rzFb1tFxejQmuAjg4orsouc3hzZyr1ciTZskKToGOq0L5xGOGLoXH1
	UF/2VeO9Imc+I8w4NmKk4U7dXkdLXattPKYykeAfyb1cVTlHTphQZh57G+8lzjnhV2QwW+s9PDv53
	RfxYF8wTs2zY6TZzO0rZi/T3neyydPlL+/s6CMnSkUmFYU/cvMKjaSgVsO7fXnf8Hu++ElXrp27q1
	Md3l30SuLqlBFKwcOEQ6TUNn5tsvvLSofkMsiDdQGGM2zgWdrIO/IhslQP5a9YKn/EGzrVH9AtkmM
	5OJ6o8uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92oF-00000005xCx-1REl;
	Tue, 22 Sep 2026 15:53:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92oB-00000005x8N-1lQI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 15:53:29 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjQCc705795
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 15:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vyx3xVvWQDVKiKfZUlkZQl+55/TqlPifg4DigWt7F3M=; b=EBnaACdN35LR0TSm
	uT7siCIIr5YiLkdMaOTc9tROU7tlR1y1s+UzHutqFfBbi8+Ch3QYxsUyHahLSxvC
	ejOgaI3Do89ZrKpZB87X3Y7Vvk+nsf7Mu0rGc5bgpdfLblnByGMve4+u6tTf8P2x
	x2BHtRANSr0XizjIT+lSyqYeD6brKrPMxeih3imdpakpN4v3BE5cu/vHNEvLa4z6
	oCLQ4vZmTHpwv4QgHFjVD8MdQku3ZmQyyREBT4JyPXbSHk4i9oUYH0p9KM+SxUjw
	JaLMj4gMa70WzUgdXcZkwAIKBh79nbkbR/r7yzNQcreW6va/2xOQ/ga3dXCr4NjR
	f70nsw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufbaumfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 15:53:26 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c97957d83bso169e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 08:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092406; x=1790697206; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vyx3xVvWQDVKiKfZUlkZQl+55/TqlPifg4DigWt7F3M=;
        b=b0Swn4gx/bhL4paxzn7xaAFkDKYejL1FTbEWabU5tNlpiMokDGtOpHLDJNp9yQUsak
         RkyKT68t7Os5VOVFQbXHraow0UvTDINPyL1gF/9NVC5kc/JhLcEJzcDA4R0r9/BOCNkT
         4HF1dRvY8PeDdH7NeWPgZ++fKgwzSqv6uKaUZiWNDCREzlW+l4q/UqUXxCcbybNhMQrz
         eVYFtNQBa+wTLP50KJDIjg8Dnxdkb23Cy+z0/c2B51vJkvNJSZXYeDr9tdIiaNvdJgnZ
         DV2cRpsuDzCGyZC99yanJv4A3+hNt3pG0PuXG6PzQog+v3jmWaJszFK1yPj7Q4ovESh3
         QbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092406; x=1790697206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vyx3xVvWQDVKiKfZUlkZQl+55/TqlPifg4DigWt7F3M=;
        b=a8jaUwApyHpYiwp5ukqpqiL9WX0I2D54iM1s4fPNbZT28MgRFhxbSzmS8Uqmv0EvwL
         Z5CJ/p9LZxrmxPYIQCjXXV+5lCQo6hlmKRVvm4gN9p8HrqAB3hHEwM93+DkIrbTMjLj+
         ASAQKWGK0WxjFVv5jWO+e81V8QN5WtkFZU/8bYI+nWIZyfc9MulueebfhQzTAxaeLYKs
         QMia7WpsbuTMoAs3FtrS5O4/JTw9xWo+itKyKX96isIHJhGMWimS7InwdnG4691F9l6P
         p+voyba7N2gh8YX00V/plOGUgAZAtGoHQa0MZ0WiadXcbtfnvEj7oi+29xt0HuStFTey
         4aQw==
X-Forwarded-Encrypted: i=1; AKwUvByo66AX/9ZDrRY/UqWaIfBCAsT5W3TMndCgDM9tMd25FnXq4PYCRgPl6faeX0KGUOso+OkXt3+MWo7DQvyAj0aM@lists.infradead.org
X-Gm-Message-State: AFuF++lFfHMX4bOBz1PFjMjNd78Roqc5LGkKJnurCBrVQMoUVhkVTXJE
	UTlzFUVz43VWRp2cNveyMHUFJPrKzozgVZd9cZb7yynMr2hMeF3SWwQOA8hU8uw2EJVdMPtp4oh
	zfJffJjuHpM27uW3+uOLcWdcAQ1W/b+z/XZ50X+umwGfoEFHSw0e9YUGakIfrL4T6dcEnIP3fgz
	N6GA==
X-Gm-Gg: AYBFou3rZ4LfWjbDLkkdI4nxBZFmzsJu7p2L+WKIb8NCO+HBVoM21k6JAUN/3AjU3ha
	GrbbwBz+xz04uPkhdENVv1467Wn3PSWVZUDQ0hIBs3fS7bc/xZZHYF+UeUXy8dqUrXgc9eblAK5
	hkFdR34Gir1Izb/J33xWip6Rawm32zOV1PqP8lxlKKUKgmQnHjx04NEo2PPmKPZbkGe6szkAZcP
	gtRBfdYi6ZfdlXKpUz1WwH9tNgSF/unfoh1TxuNohQVGclrH/zKJS9oN0tWkxbLH2QfSbrYQmOS
	sDeRt1B7a0BziNHqqaN3jjJFxMgB+jDi1JLLAuWYXtFTgma3WjrBUj3nwljFushjYSJsVn4MfTS
	ZsQqVGcxNxNpmfpuaSeJniQ==
X-Received: by 2002:a05:6102:5791:b0:7a7:12b0:fd03 with SMTP id ada2fe7eead31-7a712b10825mr6422306137.0.1790092405825;
        Tue, 22 Sep 2026 08:53:25 -0700 (PDT)
X-Received: by 2002:a05:6102:5791:b0:7a7:12b0:fd03 with SMTP id ada2fe7eead31-7a712b10825mr6422236137.0.1790092405243;
        Tue, 22 Sep 2026 08:53:25 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c583022sm109114066b.29.2026.09.22.08.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:53:24 -0700 (PDT)
Message-ID: <ff798c31-48ef-4882-8ca7-5b4c8bdcf9a0@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:53:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] arm64: dts: qcom:
 shikra-cqm-cqs-evk-imx577-camera: Add DT overlay for Shikra
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-4-9b9596221cfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-shikra-camss-review-v8-4-9b9596221cfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX8vOpWGBuZDGY
 BeL1b28NsXfaYhbTCKZVakg/Q89GonE9ElK81MEmKfzbJqnYl0f9M/xB9NIQ7Em1lVWwymztitK
 gKVgG8baeQnoFEF9oZ9zpC3IHJuiwIqdWUVQNsZkEaE3JWFotcCkCblaDMp0mG4A18mQhRcVIbS
 X5F55pOrFKbmhoHh2/LzZmyHedT1LHW4DcMZIg27iqMjKsYqBUHhUfIdv04InmknJbFFgnB2pDF
 9QRCLstmih76aEBWkkGYMRoDPypB8+8wikzwCuZTJOq0jh2IKZOpZK+rGUP+hVUfdSkecmhLTsD
 /5kGPgp95TZscihR3mWc8jxUb3NIotVSeURr+TnH55t1XWOWmJVPz9dTx2xYwEjZXO0330pYq92
 QjfDRTdDwMk9VBt/qg+noRUsdyMWPZsrTeOq3gPKwG6jpFzhr7LyxkytIjnY5W8CnxbeB8Qe+ED
 qqtGQ3Qm+vpESyLRUhw==
X-Authority-Analysis: v=2.4 cv=IYYSymqa c=1 sm=1 tr=0 ts=6ab2a476 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=EY8lGxjS-5OGnG_HtjIA:9
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfXyn3zVtk5HTV0
 cJKMtTo14Vc4gbdPmTzlvyucSeKA/gz65KPr3Cs052Zejb3CeuWi0aKvgMK45XsfO+t8zdRNGFy
 AhGZBJ+8vF5H4RL2VNkxr+n389yyUA0=
X-Proofpoint-ORIG-GUID: OdEsT0vnuUwS1gq-AqcBB7n2c6inVuyr
X-Proofpoint-GUID: OdEsT0vnuUwS1gq-AqcBB7n2c6inVuyr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220231
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_085327_587601_A3943B65 
X-CRM114-Status: GOOD (  14.65  )
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

On 9/17/26 1:41 PM, Nihal Kumar Gupta wrote:
> Shikra CQM and CQS are retail variants sharing the same PM4125 PMIC
> and identical camera supply rails. The only difference between them
> is the integrated modem on CQM, which does not affect camera hardware.
> 
> Add a shared overlay for optional IMX577 integration via CSIPHY1,
> used by both CQM and CQS EVK boards.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

[...]

> +&camss {
> +	vdd-csiphy-1p2-supply = <&pm4125_l5>;
> +	vdd-csiphy-1p8-supply = <&pm4125_l13>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			csiphy1_ep: endpoint {
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep1>;
> +			};

Please realign this vs the hamoa series - define a port in the SoC
DTSI and reference it here

https://lore.kernel.org/linux-arm-msm/20260917-x1e-camss-csi2-phy-dtsi-v7-6-1a63eb35838b@linaro.org/

Konrad

