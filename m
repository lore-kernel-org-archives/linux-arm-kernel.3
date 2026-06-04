Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780EECD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 12:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XgEAN0/+gM+54F4VHBCxD3vDG/6RjDY/mUjZmgXTXkY=; b=l7kfmI8KHwYlUt6mjk51+zxnyX
	oPa9BhoboBshD43eHZ2SjpdBfLuZpfai3zfz56+zssM4QECEPvJewm+S8NaitRz28B/1huAqPEhoC
	P9VGU7InstU6+Ef5q48bSfG4ytEvd341//QOeENeWYsNqh1Xk1wa2Vhy/iHc34xTg0Q2cVr3Roq+8
	uvlsVp/xZHVZzfZX83uLxyZg0u3YcKKV5EAfNEyMuylA0RWzP/gJmKl7EngB8ruMzdzCEdYXZftDD
	Xg36tf3rZ4UjXIYIvGr9/15aO8dD4Mnk3QgQAcuwydfQxjVzEg/9kzZz4n7DWrA4uSqhGTkLaP4u7
	9uHkOIrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV7YP-0000000GkBg-1VSD;
	Thu, 04 Jun 2026 12:52:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV7YM-0000000GkAn-15mZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 12:52:07 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654A2NtG1993488
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Jun 2026 12:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XgEAN0/+gM+54F4VHBCxD3vD
	G/6RjDY/mUjZmgXTXkY=; b=cv7szaifabc9i/rBVu+6yJCIPhf9YS5ZWrXb0Cn2
	WIZxxHuFffeW3CqWnz6oVEgffx9RksYyxCgYtl1wi83p+8KZqsl2ajf+MGJDds6t
	Y9vH6qhtIuAauLC+PVKPktU7jFgIfO1H6tI1BBhbjy7L2mjiPbFYIrK0yR9NQ+lL
	xUZ6EnwHKMKrg/HcpMv4ENmcCc5ahfI2kXTgKTVt0a2Cvx+uFXJit3AQ2PZ0ak6O
	LPpjneRJQv4MqX7nz0nGvwQJxx2ETr/WXfaQhyThKwLufFQ6oFdYiUH155WezWZM
	8tEW0AIKTlAxcymhWO9hn6lmlcJS61WxmaVvRybeHHeL+A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs8puqxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 12:52:04 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c152655acfso84175137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 05:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780577524; x=1781182324; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XgEAN0/+gM+54F4VHBCxD3vDG/6RjDY/mUjZmgXTXkY=;
        b=LRSYUFs90ltS1k5oi8OBeBVNeu2C9m++YjSri76jBCGd7em0jjhoD5+YMt5+UUnVXc
         8Qvnym2mlkZbEKZyPwzpFU3xCxvq5rJNjIWadDwyZdzFEXNuAfK8gvwwKz2x+2iCbyhO
         nx8pwf8v19MjCmgHAouQOufXknxdz4pPo4l5T79qq3DVfwbmX7U0UpHTgn9YOUs/vtpC
         7/s608lyHHP3YKxGO1bNdg4TD2RounQQNJph/QWkqcydRfhykAyEQIV/RpcD/auwSPDy
         xaP+M7JLbOad3bxKwZtLRmVEgWgVeRALomXMMeHuZB41PQfKuFXs4ydk9PD9yyx43Cbf
         hwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780577524; x=1781182324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgEAN0/+gM+54F4VHBCxD3vDG/6RjDY/mUjZmgXTXkY=;
        b=OgSVqy6Brs5p4v+K1jE6zfoc4N3JMueTnaNuOc5TCsPkI3gWS4vA1cx/3mef78KL9V
         jn3VeP++gAB4NVWx5L8cjGY1xlG0hNXHDl3wKbUZq85IqxsoE/b/OpcU95twCCRtMx0Q
         zXMt03Cnohqm685lS8OkxffqUgLvDoGEaa8Iw9ZKAhYCeoihEo5eV2wz53gpgDtb2M40
         Cn+GHeo1sZ3j3ws1zUY9FMizKIb2gUCYwZ1NjLy9zvuCSadNeY9AIrn4sHb+hfehW7l5
         l67+SNnWulOzNkjseLU49Zl/amNIxbRqk6AIZfYoqvNvVsIrFHfZe/++Tqn0DXIGdCKX
         dgQQ==
X-Forwarded-Encrypted: i=1; AFNElJ85HxJV6RI5/0LKEwP5vFwgDhqVdQHyZF2DpHtPFW5Xpxl4BoX4haXpCLYIzhJuCddpijICn1dXvg0wwhlfYPR1@lists.infradead.org
X-Gm-Message-State: AOJu0YwdcFapQzqqdRCJXHEmKEF+xrPNeXRA+65OFKTbETSyFTe4SoBw
	cb0CCJ+uj5MZGWR71hzLpGLPV3c0cmg4UnlAZSo3B07i0rPSy5KXDpZ/WQEmKLzZcfi4V3q3uj0
	qggTHWE4EJ2SZU8/S9yiXnHbNlmo9zb5TpTYNIatcCs1bm4anKvlZMaluTHluterKON98UjsCOY
	WxjA==
X-Gm-Gg: Acq92OFWUlLYnClLwKwZDPfUHOQQ/cPwL1JJGTaawFE3nNY2SRF4uqq2HFL7WIsln2J
	Aon54Je61uNfxIR64t9CVVJUa6ahuD/jMFj5M/mOS3P/MskxILSmGZ9mNWTRvcdtuGOUQSIN3jR
	bFWhDQBbVz0nuRrPe+w8ILjhHDcRcfEflCOkbm9DyeVaZ0IPq6Ymg1mbQqD7PSsoSn6pD93Ll37
	EuV6NlE3065Z7YANQHZASFRtCbyZh0ttVeNKshvlakQ/CVa6Fmjdnv/6IyQ3w7N/TgB2I0lTQ2g
	zW76hbxHo/+1Canc6fyGD3C4IjW6Tjul+QQcpANzwWhnYo4SGYw4+cN6/z12ux4SIOBHa9l0xgr
	x9AueDWww/tELoucMPznD3GdJECKAXZ2b+S3cy9oAKoL/6dHpq35BoVty1L2LqdpPHZ5++4YPWh
	uCgygCQbO2hKCfTx6a6ALKVMc6aFFWOr/BVec5UVwWgdpWkw==
X-Received: by 2002:a05:6102:8027:b0:6a2:cfe7:20b3 with SMTP id ada2fe7eead31-6ec278d65d9mr4057241137.2.1780577523496;
        Thu, 04 Jun 2026 05:52:03 -0700 (PDT)
X-Received: by 2002:a05:6102:8027:b0:6a2:cfe7:20b3 with SMTP id ada2fe7eead31-6ec278d65d9mr4057200137.2.1780577522595;
        Thu, 04 Jun 2026 05:52:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99c74esm1188940e87.81.2026.06.04.05.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:52:01 -0700 (PDT)
Date: Thu, 4 Jun 2026 15:51:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: display: msm: qcm2290: Add Shikra
 MDSS
Message-ID: <elb6gc36lkxdbvukretqx5widqozg4tw3wbg3o7ma3fsckjueu@sruvhflcy2sm>
References: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
 <20260604-shikra-display-v2-1-b3c1b2b67edc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-display-v2-1-b3c1b2b67edc@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: aGj5X---dOt-oYOrxR7zRwVLC7AgC-uM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyNCBTYWx0ZWRfX4nxDZeUAdFAB
 ran2AIzg7Ea4Mteui6TwmQx3lT5N/FfY4X3fFcrSFlK6wKp4gGla3AVij4DF/oveUijV+cc1Cs3
 F2yRYdDUzt+RAD76cejaZP/0AL3C3elaioWLe3tgBiDXeR089p4RgoM0N/0oj7yRtintWQZYtRB
 gj3ibtsGorsTZsaxddiohZ4NNnqA76deG/aOC0vbGYYsfYgtRmk3uoitnvJCxcGEO6fuHonbvP1
 59qhqi6jYC8NXooqtFT4kfjw5uS5vJjre5stKYwYwGBr1FvrJQYN2mp2NkJHYsCNP8315/ODcmH
 3INu0xSkIGJD9iW8ofhFhD4Z9fyhtuOYLa3cl6jcm4N8gJby82HTsPUDS2BVd90/c1SaLWpm8yj
 oOP591SY0FHk33wskVAB22mUUvxZLsrbclKlXsBxv3tgof7xuKV50GG3RW69riTDvHAbP1bkQGs
 V6RFWByCiprvgIY3eDg==
X-Authority-Analysis: v=2.4 cv=E779Y6dl c=1 sm=1 tr=0 ts=6a2174f4 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=VFkWRHED51hAbpIxpgQA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: aGj5X---dOt-oYOrxR7zRwVLC7AgC-uM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_055206_431347_F24CB4AF 
X-CRM114-Status: GOOD (  23.94  )
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

On Thu, Jun 04, 2026 at 06:00:47PM +0530, Nabige Aala wrote:
> Shikra SoC uses the same MDSS/DPU/DSI hardware as QCM2290 (DPU 6.5),
> sharing the same register layout, DSI controller and 14nm DSI PHY.
> Add qcom,shikra-mdss to the qcm2290-mdss binding compatible enum
> rather than introducing a separate binding file.
> 
> Register qcom,shikra-dsi-ctrl in dsi-controller-main.yaml alongside
> qcom,qcm2290-dsi-ctrl, and update the qcm2290-mdss patternProperties
> to accept both SoC-specific DPU and DSI controller compatibles.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml  |  1 +
>  .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  7 ++--
>  .../bindings/display/msm/qcom,qcm2290-mdss.yaml    | 38 ++++++++++++++++++----
>  3 files changed, 37 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index dbc0613e427e..a2f3e91104af 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -33,6 +33,7 @@ properties:
>                - qcom,sdm660-dsi-ctrl
>                - qcom,sdm670-dsi-ctrl
>                - qcom,sdm845-dsi-ctrl
> +              - qcom,shikra-dsi-ctrl

It is the same as QCM2290. Why didn't you follow the pattern and add it
using qcm2290 one as a fallback?

>                - qcom,sm6115-dsi-ctrl
>                - qcom,sm6125-dsi-ctrl
>                - qcom,sm6150-dsi-ctrl
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
> index be6cd8adb3b6..e166a73651df 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
> @@ -13,8 +13,11 @@ $ref: /schemas/display/msm/dpu-common.yaml#
>  
>  properties:
>    compatible:
> -    const: qcom,qcm2290-dpu
> -
> +    oneOf:
> +      - const: qcom,qcm2290-dpu
> +      - items:
> +          - const: qcom,shikra-dpu
> +          - const: qcom,qcm2290-dpu
>    reg:
>      items:
>        - description: Address offset and size for mdp register set
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> index bb09ecd1a5b4..7184b09a8774 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> @@ -4,21 +4,36 @@
>  $id: http://devicetree.org/schemas/display/msm/qcom,qcm2290-mdss.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Qualcomm QCM220 Display MDSS
> +title: Qualcomm QCM2290 and Shikra Display MDSS
>  
>  maintainers:
>    - Loic Poulain <loic.poulain@linaro.org>
> +  - Nabige Aala <nabige.aala@oss.qualcomm.com>

Nope.

>  
>  description:
>    Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
>    sub-blocks like DPU display controller and DSI. Device tree bindings of MDSS
> -  are mentioned for QCM2290 target.
> +  are mentioned for QCM2290 and Shikra targets. Shikra uses the same MDSS/DPU/DSI
> +  hardware as QCM2290 (DPU 6.5) and shares the same register layout.
>  
>  $ref: /schemas/display/msm/mdss-common.yaml#
>  
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - qcom,qcm2290-mdss
> +  required:
> +    - compatible

Why do you need this?

> +
>  properties:
>    compatible:
> -    const: qcom,qcm2290-mdss
> +    oneOf:
> +      - const: qcom,qcm2290-mdss
> +      - items:
> +          - const: qcom,shikra-mdss
> +          - const: qcom,qcm2290-mdss
>  
>    clocks:
>      items:
> @@ -52,7 +67,11 @@ patternProperties:
>  
>      properties:
>        compatible:
> -        const: qcom,qcm2290-dpu
> +        oneOf:
> +          - const: qcom,qcm2290-dpu
> +          - items:
> +              - const: qcom,shikra-dpu
> +              - const: qcom,qcm2290-dpu
>  
>    "^dsi@[0-9a-f]+$":
>      type: object
> @@ -60,9 +79,14 @@ patternProperties:
>  
>      properties:
>        compatible:
> -        items:
> -          - const: qcom,qcm2290-dsi-ctrl
> -          - const: qcom,mdss-dsi-ctrl
> +        oneOf:
> +          - items:
> +              - const: qcom,qcm2290-dsi-ctrl
> +              - const: qcom,mdss-dsi-ctrl
> +          - items:
> +              - const: qcom,shikra-dsi-ctrl
> +              - const: qcom,qcm2290-dsi-ctrl
> +              - const: qcom,mdss-dsi-ctrl

Change this to contains:qcom,qcm2290-dsi-ctrl

>  
>    "^phy@[0-9a-f]+$":
>      type: object
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

