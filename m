Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C55CF55451
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 06:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BeHB229LAHK62S/IYU9XzvqGNdRbg1JR9qdKYw6/ls4=; b=s4+rb4CIRk1QP6MOhcUuJtkQgd
	GiU+4m81DHYYcKd7uJAQNn/+D62WWs9vYBX9zIB4FtJ2XFGPRXfCvRxMdt8y91FGaMMolq5mUeZLQ
	wK6kKcpdPtzDLTAQ2BqaiQQ2V5T759XyDmEtaMy38VQI4NHAjKicQmrO8geZbduoc83wfi5AsZ+Tz
	ghuesbxdW7oAc4/KrF9oiXqLaCbHhbHuSEuKKBlhHqAL9MTt58D5mx6JPNgdgBbRaa+T5QQ+vYiTU
	G5zyBMgOtJGxGv46tBnn5AfgQhKz9ztqdPCnPjiACIknFnMGthsFBwDxehxOCei7tZNtQYlNQmZsz
	S7aYzRNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvUXG-00000005T41-0PwF;
	Thu, 26 Feb 2026 06:07:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvUXD-00000005T3c-18EW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 06:07:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4V8cP918920
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 06:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BeHB229LAHK62S/IYU9XzvqGNdRbg1JR9qdKYw6/ls4=; b=mRpRAsCUzV5g29KJ
	MVEUWokgEgo+PlA2MbaGHY8a4G9XVYQu0ptG6vHSUzodF62jMErizfog+bGJBN8g
	eHKKEHT2ec9ZOYrwRGWBJyVWnaKE33f2cl9uDmCHw9ZnWkqpLgc69gijSDkpgBvQ
	oHFELGHm3CAPHTXEfXSiOKrDyBs0d1rP/nyDLY5wqAW8bzxpjbjBBnOVwBu84bBY
	Lg01IV+vUCp9dYcjYYcX04xZgviAN72bCErWZ1Mj2VV1guqKaoyfq1cae/ewtrVM
	yjAby7CdCJfYsyVPyGxDB0Y6mA4b/sioR/uATNkcBV7wEWFO1mejBDV60htGGEIy
	AJEU4g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj4w4t2nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 06:07:37 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c70b6a624bfso306956a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 22:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772086056; x=1772690856; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BeHB229LAHK62S/IYU9XzvqGNdRbg1JR9qdKYw6/ls4=;
        b=Hj0Sf9b68ZZqFrAydqpmd0OLkBies/GQu+JIgAyTGfjJeWvFNbrueyIqIOekr2E3Ts
         OCrABBlb9TT2JHcpfwJ6GvuEiLxGRi6e8fnMfcy6MFzhDpWBDwhkuSTO+zlYs5bDBfwx
         EWZos/ARM06b9hfd8CR+o+WNxjruovL9b9HX32Ym2muADF/JA4tJPC8tWxheItml72qB
         bMSQZ7uWsWUDuATWX6yMrK1UiblNQMW8EFvJKUtYRdU5jbmTflCTPhjp1xTElXXYNM2a
         gNUR0IIHDwD8EePoa/YatW2tz49z1oRlvefhjvcCpzGIjIvQVcJ2Y7e5faP/URsJRa7T
         cXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772086056; x=1772690856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BeHB229LAHK62S/IYU9XzvqGNdRbg1JR9qdKYw6/ls4=;
        b=Rl234bc94wHv3prkij2y2EL57f9crsrcCnkGLP/5nXt35K8m4sy5QU34Pn7Jxngkj/
         X0dMlprkaDizlCfKp75DnhU8QjpnFk+qDn4ebVvO5Gp/3r/zTNSn4ZRNBFf0iSff7itO
         IZtbJKJqUdjhvlQKlTHoGKQp6iDbXaI/fNQrbXFdrSTX3aXC5Avu1HBL22ggoCBGKqpH
         WCRqFnYGoT2bZItIysYAOoVbeaqX2ZcNndLCOHsag1UcNG2HID6jz17R63q06x8RD21z
         l18pfD7StAvnMo0yCwLmt31HqVf4VYYxzdBi82BC7HgIi2waHdUMWUeCofmbvc4EKTFU
         yZUA==
X-Forwarded-Encrypted: i=1; AJvYcCV5dvN4RquzctBwWJWHz+Nr3l5DaqC8gmi6yzFq/es8HC1i05b5/xCQT3cpY90yhf6fjJ31otPlm65e9LGUoTUg@lists.infradead.org
X-Gm-Message-State: AOJu0YzfooBAlTwqv02kRyub4BfhWMa+25V5xEwVn9yfH9lqbkWL8maX
	EkVYjMKZisOzE+p/onkvWT4w4FpJq6Ix+jdrRp6SBHmig7YOkgyjS6hD+rQeb9p7E0qy2tECoRn
	K9q9tmMqe+38iaVirKIFHW9ZDmDL/cUeee1PEjpOiLqTqDucaW9OeeEMcyfGNyJuYUDtUDlVy6s
	Sc5Q==
X-Gm-Gg: ATEYQzzIOh44tmN9U9aBbgRLPuDsvEPpfjDK+AS7ZG93PxhhuflFoRe3ObgyoogmjL9
	XWTL1QVDKCw3PZdFXAPPe6ivbS47tsMvHvbxnFkgJ4T5Y5NWk87FkiKJbzS55y+rdJFFVfqHtPM
	VAJ8TmS03aWF72gQE0jXBhOkfwuaqCoaKRgTJfIBkZiR6cs6ngqP2U9wD0f2yEZElCqVTohLVbi
	9XwO3RdUNiBEr7pdG0n48bPuIwpKbVFdCiPe3uIqeFj8EERWtAzmIcb0PNzLgqQh84xYkZmWAsN
	y7OePwglDPrse6rdGtZoEuTWbUu0ezVZbojEDZE2HnosmGlUYPpNsJN7CVXGFg/e/9lF72EFrXn
	h6xQ64oXQF62bt7yDFnJJ+0kjZHf59ytjC5nSuf7GncqEDrHKISPOipHz+FOwA8r3iEuKdXOUEP
	yQKxXNBtWW2w==
X-Received: by 2002:a05:6a00:cc8:b0:827:2b7f:e1d0 with SMTP id d2e1a72fcca58-82739827658mr1697784b3a.24.1772086056044;
        Wed, 25 Feb 2026 22:07:36 -0800 (PST)
X-Received: by 2002:a05:6a00:cc8:b0:827:2b7f:e1d0 with SMTP id d2e1a72fcca58-82739827658mr1697755b3a.24.1772086055513;
        Wed, 25 Feb 2026 22:07:35 -0800 (PST)
Received: from [10.133.33.67] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739dabd43sm1290899b3a.25.2026.02.25.22.07.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 22:07:35 -0800 (PST)
Message-ID: <32309e19-e193-4f56-80c4-39b028f05876@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 14:07:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/7] dt-bindings: arm: Add support for Qualcomm TGU
 trace
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        Rob Herring <robh@kernel.org>
References: <20260226020454.3210149-1-songwei.chai@oss.qualcomm.com>
 <20260226020454.3210149-2-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260226020454.3210149-2-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nqN2rEe-asamlBHNOy38iO9UxdtzuVwj
X-Authority-Analysis: v=2.4 cv=IqMTsb/g c=1 sm=1 tr=0 ts=699fe329 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IwjJGIUIzvyStixYlZUA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA1MSBTYWx0ZWRfX2nsCo3V9oFDP
 JGTFTsugnQgXCyttLCmWXfsdMndJUBEmqEXc1wCgXT3LJ0FOr4r3rdqIlutIMpV7QXDxkq+N+gG
 wZivKc9GPGPAcny8LIgaXGRJxQxWG6DoHnO+s21aJkqxDA01WJczU3amORQy2YgHj4TkvU0zhxh
 95PmzUPXpsGQ+Hyj/VyKiEShfTVWDMxuwfvAVwdoq8GOiKo9LiycV3u1cS0CSf740LRE2ou/hgm
 SANJieu/rm/AP8X5XZblsNnIgkH9Z2NN4zCM2KCnq0in/JyTPIDz4tEF7yudh9wmOrDvSdd8KCm
 GCsQl/UkmF5E+xTsGkTfipweEWTPYu9pHo6s0ZhNthePMSw0jxuGkKSPvXzaHtHiIVpXkz2sxku
 Ino4vQ5VWVTwnBE+Rpd0shdN3JdqjSlAQD5WNvYfUlxnn6qn+XSt8HssP6Mx/UJUOxU3iUNhKBz
 zw6C+G2++YwohJfpoMQ==
X-Proofpoint-GUID: nqN2rEe-asamlBHNOy38iO9UxdtzuVwj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_220739_437263_35890E39 
X-CRM114-Status: GOOD (  30.29  )
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



On 2/26/2026 10:04 AM, Songwei Chai wrote:
> The Trigger Generation Unit (TGU) is designed to detect patterns or
> sequences within a specific region of the System on Chip (SoC). Once
> configured and activated, it monitors sense inputs and can detect a
> pre-programmed state or sequence across clock cycles, subsequently
> producing a trigger.
> 
>     TGU configuration space
>          offset table
>   x-------------------------x
>   |                         |
>   |                         |
>   |                         |                           Step configuration
>   |                         |                             space layout
>   |   coresight management  |                           x-------------x
>   |        registers        |                     |---> |             |
>   |                         |                     |     |  reserve    |
>   |                         |                     |     |             |
>   |-------------------------|                     |     |-------------|
>   |                         |                     |     | priority[3] |
>   |         step[7]         |<--                  |     |-------------|
>   |-------------------------|   |                 |     | priority[2] |
>   |                         |   |                 |     |-------------|
>   |           ...           |   |Steps region     |     | priority[1] |
>   |                         |   |                 |     |-------------|
>   |-------------------------|   |                 |     | priority[0] |
>   |                         |<--                  |     |-------------|
>   |         step[0]         |-------------------->      |             |
>   |-------------------------|                           |  condition  |
>   |                         |                           |             |
>   |     control and status  |                           x-------------x
>   |           space         |                           |             |
>   x-------------------------x                           |Timer/Counter|
>                                                         |             |
> 						       x-------------x
> TGU Configuration in Hardware
> 
> The TGU provides a step region for user configuration, similar
> to a flow chart. Each step region consists of three register clusters:
> 
> 1.Priority Region: Sets the required signals with priority.
> 2.Condition Region: Defines specific requirements (e.g., signal A
> reaches three times) and the subsequent action once the requirement is
> met.
> 3.Timer/Counter (Optional): Provides timing or counting functionality.
> 
> Add a new tgu.yaml file to describe the bindings required to
> define the TGU in the device trees.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/arm/qcom,tgu.yaml     | 92 +++++++++++++++++++
>   1 file changed, 92 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
> new file mode 100644
> index 000000000000..5b6a58ebe691
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +# Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/qcom,tgu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Trigger Generation Unit - TGU
> +
> +description: |
> +  The Trigger Generation Unit (TGU) is a Data Engine which can be utilized
> +  to sense a plurality of signals and create a trigger into the CTI or
> +  generate interrupts to processors. The TGU is like the trigger circuit
> +  of a Logic Analyzer. The corresponding trigger logic can be realized by
> +  configuring the conditions for each step after sensing the signal.
> +  Once setup and enabled, it will observe sense inputs and based upon
> +  the activity of those inputs, even over clock cycles, may detect a
> +  preprogrammed state/sequence and then produce a trigger or interrupt.
> +
> +  The primary use case of the TGU is to detect patterns or sequences on a
> +  given set of signals within some region to identify the issue in time
> +  once there is abnormal behavior in the subsystem.
> +
> +maintainers:
> +  - Mao Jinlong <jinlong.mao@oss.qualcomm.com>
> +  - Songwei Chai <songwei.chai@oss.qualcomm.com>
> +
> +# Need a custom select here or 'arm,primecell' will match on lots of nodes
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - qcom,tgu
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,tgu
> +      - const: arm,primecell
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: apb_pclk
> +
> +  in-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    additionalProperties: false
> +

The TGU device is no longer a CoreSight device, so I think the in-ports 
property is no longer needed.

Thanks,
Jie

> +    properties:
> +      port:
> +        description:
> +          The port mechanism here ensures the relationship between TGU and
> +          TPDM, as TPDM is one of the inputs for TGU. It will allow TGU to
> +          function as TPDM's helper and enable TGU when the connected
> +          TPDM is enabled.
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    tgu@10b0e000 {
> +        compatible = "qcom,tgu", "arm,primecell";
> +        reg = <0x10b0e000 0x1000>;
> +
> +        clocks = <&aoss_qmp>;
> +        clock-names = "apb_pclk";
> +
> +        in-ports {
> +            port {
> +                tgu_in_tpdm_swao: endpoint{
> +                    remote-endpoint = <&tpdm_swao_out_tgu>;
> +                };
> +            };
> +        };
> +    };
> +...


