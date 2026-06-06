Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B99CD8C85
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 12:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CACWQZmD4R6XLQ6GUpqLrmsNjTowQtAT8WsqwDHWPdg=; b=UHFLbORmMpNZVYnDkINvTOnoE0
	9wm9n/JrhEpwKhOiKsjHGgLmXwDwQEQ4YOCfGgDD3lK9aDA9yZkltWqlPZqdAbBttInFX3AIcNDGi
	TGzbJCpNepDpwhMKqMExFc2JrnguVNff1PZZEJrT1P271krfmZcJLd0+zoXIw2k2qSjHyosCF0oJB
	LrL6UiM4eX65JgAXGZI3KKsk/pAU51RYkSS3DHxEuJ3pTQdZ9OWTH1HsAqU0NE46oecayLmpo1jkO
	wYToJTZ4m7uGq4Jt4RoR2c3+8igFy58QPG7w42d6WV25NCHWO36IBEkJVQx54G2GrMnu3H9HJXWRq
	u+V6dstg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVq3U-00000001aqZ-2rQd;
	Sat, 06 Jun 2026 12:23:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVq3S-00000001aqE-1cbl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Jun 2026 12:23:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BEFX71258193
	for <linux-arm-kernel@lists.infradead.org>; Sat, 6 Jun 2026 12:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CACWQZmD4R6XLQ6GUpqLrmsN
	jTowQtAT8WsqwDHWPdg=; b=WBmeTuPIOwbj+d1qhz3dLCw/DxKcDzYN36fVQCa7
	MzqzyPGZ5yNuJvDk5V7qEnXnGW0mtIM33IIH6w0A80MLFDoP2KoMDxG/l07B6D6n
	NH10gHN7+BCOTTtMiI/B85/yLHwOeAKr68Q4KZF4NmrZD0wS2fI/5uP01yVK6l/x
	xm+ijz0lWyd0LYGdJHgtH9sMH6KVCa04fgsRQeWGOsor9btSqR4eLuP8qYVA4opQ
	iMj7pKTJIeyS+LW9wR3Tn2awb6DgOJ7+I0/POtGuYVOQ9QNoMujVAUB3zV/rEn7F
	9WcInIola8DuFHFAuMWEQlDy5jt1WYnSwrJICXSxLS7wKA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadrupf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Jun 2026 12:23:09 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963c12f125aso3210435241.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Jun 2026 05:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780748589; x=1781353389; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CACWQZmD4R6XLQ6GUpqLrmsNjTowQtAT8WsqwDHWPdg=;
        b=YcKH9X/NTLayf7RRL5sG3QJibuysHYM9NCYqc5lkW9NnL+oDkbzkZY8iYVvamNvsEt
         tlvw4G4hMn68dm49kEa4yGvpVMmFIQm3t4CgOf77cb9F9y1/22DHB35D1/IKpu5kY1n/
         WCXajAyx3ThZelEQ32Nz+MD6Ii0AybDso1ktd2w7cZKh+jvXNHWygiKlmBX35+vSoObg
         +zQl7PBG39HiMWOXPv72rNveeImAIGpcirMLc7HLpGT8T1HwRqDLXI/GNgwxnaYwGm/B
         pbYms3djLvACqS9Nvkukq3i5tIOCjQUtip8/HbTXuloZNhDnz/J0QQKgSkuccrhlLVcD
         NnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780748589; x=1781353389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CACWQZmD4R6XLQ6GUpqLrmsNjTowQtAT8WsqwDHWPdg=;
        b=PjaMOXBqIkRWQA4b6zuqkxSRRWWizmTM1jlfEcXcHc9RmeD1+2Z32cBKYHAgH78eSB
         jxULLpz/bM5AN57oEXlEYdueXCA87GmBhdwqXT6EK9uaUoC2l7IiHH1VrMScv/JiYNf0
         IsauMNVaCgadKeXj1xkVMzGr01UXw6mGFG43jLjxRrehdKvxvvSqNOyzRqP5/5y3KU+6
         7wP11VWbg6Z8+Ldd/ZEG2uHLciCTuvQ+qmcnNBgDaUSbzivRYsoSLxIc3NMFNiJKewmI
         M9fGQM0/9EAE4TjF0xwy4z+9aNlAKQT6OjbQsCYOWUr3godwKbAiovfys5BASVpvxMx+
         n4mA==
X-Forwarded-Encrypted: i=1; AFNElJ85dbxfU+C9V37ndLgQ1PlblCJSMzkPr1rM0Ax8TSYZ45Sus++GQ9Ejs8IbGskuURQzaaBo2iGAzAtBLx7ZbATm@lists.infradead.org
X-Gm-Message-State: AOJu0YwBmoZvZREik+3A/rPdmLpcipix9EoFaC8lRDXOYDxUCEKv6Qet
	U6bAbZqe1djn9oQ8t0VsnZz0z3haWyh+s0S+4U3bnupORZfkZ17hBkPS8WfrZlOxd3NqSIcoQdE
	noQTmvgmFcVG2AAkuRUdEtwcTzUHLVqeZOckseeA5m/jfqh6fzS8n8S9bx/9JQPXU3OZh6wS9Hh
	o7vw==
X-Gm-Gg: Acq92OHdpyYbe2qTYxYMmerDOzaHxXtY6WMZ2ohKOLoRXpmflA0Zl7FFF5ywQs+xabE
	DMBXtxEqGb7GR/feeSkvcKZNq1rzN4ei9WmagHxYbrPI0z1SgRNnzgwpIcUzeeTwMLJvzEb4IPK
	HpgYKVfAbxWdwZgG5/DRlFVazXnfhbQpHCDm+dgm/SIorFmv+Hpur+fZzhwzHxj6MHi1F8ui/0u
	+E9PYf/S8USbkjk/Xk2CDWaxv7yQVuzUPwjVvh8MJlSIya4t/49pK1N0NlyepQgcEKgDkJYnliP
	o7lroXkpzf66my5xTZPanU/F17stdpuVNlZbFIOQfMXdJNCDthLFxHMcCLHe6r33PW1aMyicz+2
	CEDxDFqhnet0le5jhPMwVC+up4Za0O+Jv99sC4iWq9HEXcrkOPScUvxJObcARKzyFJ1qHk25hTr
	vnmruRm4IlOtzMhofPoYbv78LMTDU+830OGroskNSIJaNwDA==
X-Received: by 2002:a05:6102:f14:b0:631:4c79:b1e8 with SMTP id ada2fe7eead31-6ff0afefe3dmr3974196137.22.1780748588666;
        Sat, 06 Jun 2026 05:23:08 -0700 (PDT)
X-Received: by 2002:a05:6102:f14:b0:631:4c79:b1e8 with SMTP id ada2fe7eead31-6ff0afefe3dmr3974174137.22.1780748588296;
        Sat, 06 Jun 2026 05:23:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97ac34sm2444082e87.39.2026.06.06.05.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:23:07 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:23:05 +0300
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
Subject: Re: [PATCH v3 1/3] dt-bindings: display: msm: qcm2290: Add Shikra
 MDSS
Message-ID: <fphua2bsw36libxqkrfubnaybvdtwncplddhexx26dtbjir7ov@jvmu4avug54z>
References: <20260605-shikra-display-v3-0-9846ba5fe635@oss.qualcomm.com>
 <20260605-shikra-display-v3-1-9846ba5fe635@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-shikra-display-v3-1-9846ba5fe635@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a24112d cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=jtPkKwLRCkpF2dlEjY4A:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Wl2YaWLJLKJ8tJMYJngXG4Z5b-HwTVLJ
X-Proofpoint-ORIG-GUID: Wl2YaWLJLKJ8tJMYJngXG4Z5b-HwTVLJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEyNCBTYWx0ZWRfX9IjpfzXhpQcD
 WpbrujoCPoJjHN5h4IvcX9uV9pmTBrMTc7kTHQq+Ry66+27rHEw2P7Z0iDeGrY9Cv/x0YdKLyoH
 ueXxiK3UsZ+ebPsNopj4uqKLKgQDZx5yEXkX95mS3Sbzo44GIRtInDfoGu+j+e1hvohFQadZIZp
 JgdSQs1rIisXf5IYKVnHAIHCjIMsE5OdiCx2Gpp2A0+2tJSbKa4USaBrg8Xsr0X0SI55VY4sdTl
 /loCBP4PKOYWXZ333yFduNMdlukPekcgXQ0Hppwo51feGtLC9eEODheawWhCFR8bdEntKL8e7yJ
 T69voaTFoFzz92dvCypnTJ+KxuRLlTwHShsnY6bI11jMKxJ6+mRXOfl/J4/T6tv1NI5QNuVIWx6
 6LrT3tmVXVUWWrLuRGggzv+4feWrBLf7tW+PS7o8jezot55xtnFiWgnMbMnz4bMeEyzvZ6SQp61
 uASnAgELlJ8A1btpJwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606060124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_052310_433166_9C375FDE 
X-CRM114-Status: GOOD (  21.11  )
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

On Fri, Jun 05, 2026 at 03:48:51PM +0530, Nabige Aala wrote:
> Shikra reuses the same MDSS/DPU 6.5 hardware as QCM2290. Extend
> the existing qcm2290 bindings to cover Shikra by adding fallback
> compatible chains for MDSS, DPU and DSI controller nodes rather
> than introducing a separate binding file.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml  |  4 ++++
>  .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  7 +++++--
>  .../bindings/display/msm/qcom,qcm2290-mdss.yaml    | 22 +++++++++++++++-------
>  3 files changed, 24 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index dbc0613e427e..ab2cfd6d6e3e 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -57,6 +57,10 @@ properties:
>            - const: qcom,eliza-dsi-ctrl
>            - const: qcom,sm8750-dsi-ctrl
>            - const: qcom,mdss-dsi-ctrl
> +      - items:
> +          - const: qcom,shikra-dsi-ctrl
> +          - const: qcom,qcm2290-dsi-ctrl
> +          - const: qcom,mdss-dsi-ctrl

Wrong sort order, qcm2290 < sm8750

>        - enum:
>            - qcom,dsi-ctrl-6g-qcm2290
>            - qcom,mdss-dsi-ctrl # This should always come with an SoC-specific compatible
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
> index bb09ecd1a5b4..ef21b2c263f2 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/display/msm/qcom,qcm2290-mdss.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Qualcomm QCM220 Display MDSS
> +title: Qualcomm QCM2290 and Shikra Display MDSS
>  
>  maintainers:
>    - Loic Poulain <loic.poulain@linaro.org>
> @@ -12,13 +12,18 @@ maintainers:
>  description:
>    Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
>    sub-blocks like DPU display controller and DSI. Device tree bindings of MDSS
> -  are mentioned for QCM2290 target.
> +  are mentioned for QCM2290 and Shikra targets. Shikra uses the same MDSS/DPU/DSI
> +  hardware as QCM2290 (DPU 6.5) and shares the same register layout.
>  
>  $ref: /schemas/display/msm/mdss-common.yaml#
>  
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
> @@ -52,7 +57,11 @@ patternProperties:
>  
>      properties:
>        compatible:
> -        const: qcom,qcm2290-dpu
> +        oneOf:
> +          - const: qcom,qcm2290-dpu
> +          - items:
> +              - const: qcom,shikra-dpu
> +              - const: qcom,qcm2290-dpu

Use contains:

>  
>    "^dsi@[0-9a-f]+$":
>      type: object
> @@ -60,9 +69,8 @@ patternProperties:
>  
>      properties:
>        compatible:
> -        items:
> -          - const: qcom,qcm2290-dsi-ctrl
> -          - const: qcom,mdss-dsi-ctrl
> +        contains:
> +          const: qcom,qcm2290-dsi-ctrl
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

