Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B24E784BD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 02:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFPd58wm8mYS/zmIQEJmpXYiwDFADj86sZNP3r9GaCg=; b=LmN3xXQAHcBXKIt8J9CH6kNw7l
	5OsrSBS/qB1T40bsIn2SJhiPXe2vh03KdbHczoQ6rAUhreEUhpm+6J2temeNfyiaosw1EA6MdKSiv
	plVliAYXgXeqtVo/PxjdvdG+eKfMj6pFWqNF1UftwNKQUEkrf0PQA30KIprxomjdeK+SE6MZGqTHq
	OqoXwsEMEH9eEtjpjUDKESP5ItMF1DbrG/KDTEDgGxbPmyYTPmtdLkrZssdIwsFuSegjNTgm5vxmu
	nFunRKK6aZ4pfK+8tL8ePKDdcFWbhbUR9QIfdzkaJ2KeQ0CUDHPcKKydRW4b9lbYBxh38uot5WBzy
	XxGspVkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYbY7-000000001DQ-1WeP;
	Thu, 25 Dec 2025 02:57:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYbY5-000000001D0-0usN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 02:57:58 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BP0h8tH455346
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 02:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JFPd58wm8mYS/zmIQEJmpXYiwDFADj86sZNP3r9GaCg=; b=igQhehDdGSSON/N/
	vllBXNcIvUCNMvNUHJENXu1zcBzVMZSJbgr8ccXJqGo2nK2jfXXmwiEKR5wNIsKc
	ripR3ysblcrQ8RLdKzQebhMK7cUm3hqfJI2nXt4OL5Ot9QWuNuMnnii0jM90qGV9
	DgX6Xh4/kCiyFbz+fe2c4J+vL3okVVfPU32ucGmU29ihuTpdzt7ZPc2ZiAiH4m3a
	qoj2qIuSg9rlY6QUNFKMUGpI0lXA0QrlFkSfSumPj8Ng7PYrBmuF/1iax6FzuJ+g
	+z2cXYiX74JW8Z33LrNT/OO0k7B3Vbdg4wM+ufRz7jXwPgsfu2+rh6egvMzaIzY6
	MKu8pg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r3f0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 02:57:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c5d6193daso12598631a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 18:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766631473; x=1767236273; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JFPd58wm8mYS/zmIQEJmpXYiwDFADj86sZNP3r9GaCg=;
        b=EwVBBoRiZhTEo4Pb2IUzNTCaaa4xbuUquUU/h1Vap31GkFVO+JM9Hr4HQ2O5rd33UX
         Rc/LW/oS7sb3kcZDrst/h5prVclWeHRUCFLP4H+vEt7Vtn62ZiEiR+D5/tZBztpGLrhS
         iX4F9twyOYAVjez8Sdv2WaeKF0Wyt74ZlpbUDHk5qKItHr1xcnhyzAjUR/52nSZg+YEo
         kF7Rn64Ym3VILiiwLS2mRkke/7hG5t+wgAgeD4jDFxjgrqDihiNk7yYgUgpkEcC5RGdp
         3KEa1/LvAz/gz6Eg2dRpapPuByNS3sY+3MjWC9pM/fcWRIUltHwcWLgKu2qBJ4KV1lA4
         BLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766631473; x=1767236273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JFPd58wm8mYS/zmIQEJmpXYiwDFADj86sZNP3r9GaCg=;
        b=L+/abwkAMmrOpWLmuAlDxlWz9DLYdYOT9u7lA0OXgEfPW5XZwb/XDSW1vxsN0H4J8H
         tjEY/l3vLKE2teiVRejolW9tStUrQ+rcjClRm1NPJBbt4Kyqjt7pPpOURA/QyKo8FQZE
         JjT+P8Zt6r4EQSTYnJebJTxpMkJVdLcSvo5oaROn3z0Cyr4XUYqUCQr14gIFWApkO4Vi
         jkAPudlSfFLlHDOsv5SxNQiGso8ShPsfb0b66g+Dw0zuZsOVmW7RHlBXd/2iDAyONyUM
         5tP4mJIjeoTqX1mBq6U7xUMRe+CFHRa1r5R8lVeV7sUD2WYwqD8qrcJMvwXF+RyNqBls
         RHPg==
X-Forwarded-Encrypted: i=1; AJvYcCUZlTd3tcFDIRzauwot5xTLhFd5Mp23uuUaePqKJ9+nUCzmMRS4KiIPnF3NX0y+yWmJxHXFZXqKnwitdnBtHWKF@lists.infradead.org
X-Gm-Message-State: AOJu0YzNdHT45QGtCUL/W2OD4xvP6EzjtlaYZkkPWkO23hSwBLRMCcaK
	S8sWUa2ySEvVbamGrqOwDjw0sqzJXyDHNMpQ6kbnOfUTLmZ6j1QA8hBF8yKrndZejWv+bgPHV/a
	tgHqcAQm1ZSNLKhy2FySx74xnwzAuHk/QWPqhPiHV58395n42+3NqN34yTZCxoYIPB2vqXMOG6s
	co2A==
X-Gm-Gg: AY/fxX5L4ebUe43Zx1GniWrgHJJyrspbtzxiOCyJo3GAmXnrCvWfIFwtCEqdOxEcD2S
	mtj44b45Gz/4QHm3nS7+TOvzslVUhewUGE6mfp5hwSrbX+8BNAiJ5DmLRGHL3ZGZ5OY+bwnq7SD
	4Pe7gZTDcwM4dZTQf+1f5BoaVifRu2oqovILQ6Ci4ybfsgOoSwykwU6L4k3u8Hyn0Yk7yohkJ1G
	WkOsmSO0wFWVdVCTejGDNyYLOn/ifW6CCkpmVrNgdwavReKYBrFVWdXTg6Nu/BBpXj4+Wg4+NdF
	L6fbd14ZuNv+g5QFxRpUMxTaQmnlazh57uVTequc1O0XsVQA/XJBbc1gxlHpoMjlTgA6g9wIwao
	myXvZ5hO18u09Rr5lG6Srs/bGgHtcmI89ZlrjOjO+a/78tR3LlmkFiHQ9aUlF7WwPaGZBgE/HoD
	0=
X-Received: by 2002:a17:90b:4d8c:b0:34c:904a:d92 with SMTP id 98e67ed59e1d1-34e921cc22emr18964669a91.26.1766631473567;
        Wed, 24 Dec 2025 18:57:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLS4MIGJ0LuIKRIK72qiNNG01ippH6Yq5aw5IQOoDuFbYRE35g705XC+ROfIHK9ZC5xSBxaw==
X-Received: by 2002:a17:90b:4d8c:b0:34c:904a:d92 with SMTP id 98e67ed59e1d1-34e921cc22emr18964646a91.26.1766631472999;
        Wed, 24 Dec 2025 18:57:52 -0800 (PST)
Received: from [10.133.33.250] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34ed530475bsm3298572a91.8.2025.12.24.18.57.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 18:57:52 -0800 (PST)
Message-ID: <5c67a270-dc9e-4ada-af56-e97d4a925e47@oss.qualcomm.com>
Date: Thu, 25 Dec 2025 10:57:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/7] dt-bindings: arm: Add support for Qualcomm TGU
 trace
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        Rob Herring <robh@kernel.org>
References: <20251219065902.2296896-1-songwei.chai@oss.qualcomm.com>
 <20251219065902.2296896-2-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251219065902.2296896-2-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: W24vR8DA3HpCPsvH0E-r-EHb0psONwSW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI1MDAyNiBTYWx0ZWRfX7Q5L9YlWhMlr
 n5rarUMI1QWrIzNhzawR+V/TjQWjMaKWh4GkIu6dpn6MjPhGEvn0WKlKPc5xkHHQ2XDQ6Ij/+Vl
 itSUMgO6MNFxJpLe3deo436kH285G7yXrKbsYuqN0LGe49cWggm8LERgoJA6cTGROg4WsunTbn+
 InsRdB+iO/THX4CPLPeJps8QQ5WhWHvbo0ExmPBYOmnqI1/AZUT++PHLYumIxrp+6XAUYYcr18k
 PIcwwO6DiJTUe6ZvpAxzoUCGBS+i9Ja9dFPXF6dbGC3KjMt/aWkHvPqcNYLNE2RbaHs+2xdQ3cS
 X8j6WAI9HYXVqhYKveP8ghzDEkoTqrVfn2bqTUEqO1FQLGWqpq7dZVUJNSiJxYwbHE3jnMScgtv
 vZQaXpcCGB6oa9A4+RFp8K9So6UDSjMq0Bmd7S1GrVx4e/YCDk1VaRadjNjrCyfopIVDg2UA6cv
 QN6GxWUgaYkhSx1STIA==
X-Proofpoint-GUID: W24vR8DA3HpCPsvH0E-r-EHb0psONwSW
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694ca832 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=IwjJGIUIzvyStixYlZUA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512250026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_185757_400960_A31D206A 
X-CRM114-Status: GOOD (  29.99  )
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



On 12/19/2025 2:58 PM, Songwei Chai wrote:
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

Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

Thanks,
Jie

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


