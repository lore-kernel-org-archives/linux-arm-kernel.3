Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E52CE7AD40
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 06:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+L36TQdaYvG5NZA7PWJObkpQ1NZJPN35UUoghloEMWo=; b=Prd0Qzz9Vs0o2gDijppCLt90dL
	Y80AYwOZ7mnf9b99L4Cawl8kese43REaumuRB0rW4MFFtPK7fBwg8zlE9dq9nmjdi81AUVxVdfN+j
	z7wgZzwQnBPwxTBrZ/AoPVIZ1RtrBbGP8OR6BwSNrWN4uz9lfn9SgS7uZNQMOrzk3qataFiXtjocY
	/VI7IvCdEgh5H8B5TLNls2l30qjxc6rtkPGsA3nCkdy1wN37UTRLPf4nsj+n3/UW65UFYg4Bm9GWT
	8QYEIHhSlen4ZfZanXQiqkrsf8zjRqy7GfIbIOBgIMJ/SZNLBSOqUSXMMKd12eFT3IlIdAugXBWNw
	o1gPA1gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYeq9-000000008FR-19Ie;
	Thu, 25 Dec 2025 06:28:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYeq5-000000008Et-2wQU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 06:28:47 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BP59iGR1748444
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 06:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+L36TQdaYvG5NZA7PWJObkpQ1NZJPN35UUoghloEMWo=; b=CY9CkMrVBrJjATGB
	EY07dhZWXj1xTWafccrY8WBrB///JnACfVz+DyctHdV3HEHcmkl0h+7fGabGaFJP
	0cLCRdyXc0mh9c0eIalou5wT/kVE8VIQsNTid2mTjKeGmAeejPcW6TJThYRDPDr1
	Xa6KcoNLjWLA/kcFcStThxAFmPaJG21i/PxN5/vVy+erzNXQw/IqbDojr21UDv0X
	7oI4poxkcznni6IswIgdkhdOz7MF3r3A2sFp0yHgl3IneA7VYMhneV1zGXC9HcMg
	9m+IzJ3Tg2e4Xq2+WM+ObRdWIi44vLXZmCkqWuuBCIOTlyiwOBGtr7xy/pA+Tdtg
	m+/AZA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8xvc83jx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 06:28:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a07fa318fdso118398285ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 22:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766644125; x=1767248925; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+L36TQdaYvG5NZA7PWJObkpQ1NZJPN35UUoghloEMWo=;
        b=R8CyTCdcAbOPdht9Ow6GiLpXmeLnJZeIr+xbF6Auh7fZr3d9M4LbaBb4iX3N0PPx7/
         F7nQwTt3KNDJgTQ4aTPweXy+A2odA/nJ5UAFYqkWMQJ9HHtyFjbvMKh2DFzBChr85jgL
         jhWoes1PT9JKb+2sTpDEBa9sdXddKR5JNAmNOmqN8lWkgcIk7MUldxOrPmfc390oU6Lp
         +kmRf15JEJxfYs7YlGyqqq++Jj2+zbxtfCKaXfvUqFWru9GzRQiYMmetnsGc936E4nCD
         vsOfiMx3xjqE2Jmlaqv+6lh7m3dxm2x2t9gZeVOEfqShA3EqrkQfv4QArdrF4Q4bxVXN
         x2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766644125; x=1767248925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+L36TQdaYvG5NZA7PWJObkpQ1NZJPN35UUoghloEMWo=;
        b=EO7WVcwaVPyxPt9yXZI4JHy1WEgbXzdfBieGBOxY8TImCrXPVIX1OfWl92+qb3EB1L
         Q6z9df8kGZeDoaYXZMqZDYfXVpei5xA7wsnVmRcyr/dZ5zLfTXURscdPEux4dDIOOp/Y
         vozeSnJIuSjQcl67xNhnQf4jDkjfEiyNtkJoGwFUbmnIHZdqoUQ6C2wU1fcsjeZndqsB
         3pi60Xw8jKclHOXF8tGgfowXyxQnl8LyKa5RRas9c9/JREv8e10v+0hJebpkolXrfgqu
         nRra8ZKGBnoJcxcxsj6e1nE48YmgTSXMAKnCzBr/1uQrll5Q6fjQUX4JyOKlcJmHNSTX
         qMGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVCHuwd+hZM7JyN5EwTlVleWqvQq0QJocEQkbgP/3MoTJEOhD1SgpXLnFYIWYhQ9K7r/sqWkaB+k+K/aOlP4p5@lists.infradead.org
X-Gm-Message-State: AOJu0YzO9gtyTokR6qWgA1DbYD7kLvh6zpsFprSXwoZ/c2avlEltpMxU
	GMOyztHNBVYNN5R10ywDxhpMwsVjFBVr/0S84iLlGeEXwuOok3Qv4gnuNs6dHcORIvOUdCQ9bSw
	/DwYcjws9dBNr1txyKRC3INvEVwXbrOnWDy4qWot0Ta2O2QFwoxT1Vei8wrj3vkb9fumaoZhAaR
	E9sw==
X-Gm-Gg: AY/fxX7a2WfycI+fN+SaTuhdfgnx+7xLFzIN3bp3NcCIpwkQjzUyjneITndeVN8ZZpS
	qjE3qCELkmhyGg8Fy85AcZNz9CqQGPAM74vz4BWCgbI/wjIt1eZLZ9nSR6YwqlSzlLTce/yGJqX
	64E92p5T11GtxO2KGIKWVZR3DpdaHegvCoUcccDbxTPgBHBF3qoi+2RsiI5pV4W/AO+EYrr5vtF
	IuE9f8C97nM0B2JFLFMJQc2r2cUCMo97oyoTPfI40LSWH4reFFt0WNNxrezRQxzJmI3WZQpdqfV
	voSGeUrWJg0W8bUnE/i8eshfjJYslMjInGpOx1VZQVMZg38uQqpwyyWpp2nZTeKJBwnvdWz2rqR
	BLrP+5B+05/FhV8uO9VtH7jtKo3k8d3M4v6yv5QRIlJhb3yHu6ufrC8wgzBvHw2kzHVZWAMuiZr
	k=
X-Received: by 2002:a17:902:c403:b0:297:f527:a38f with SMTP id d9443c01a7336-2a2f2231764mr203723955ad.18.1766644124449;
        Wed, 24 Dec 2025 22:28:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHG0UvxEYhyR8hnGhLzCb3EHJqm+ZgPrd482GH9b3/wTEjNP6sjA3YoUbut5JctCdz7MQ7cA==
X-Received: by 2002:a17:902:c403:b0:297:f527:a38f with SMTP id d9443c01a7336-2a2f2231764mr203723805ad.18.1766644123964;
        Wed, 24 Dec 2025 22:28:43 -0800 (PST)
Received: from [10.133.33.250] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c820b8sm169959365ad.23.2025.12.24.22.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 22:28:43 -0800 (PST)
Message-ID: <ab7d3026-4172-4f8c-942e-e46d984d5f21@oss.qualcomm.com>
Date: Thu, 25 Dec 2025 14:28:38 +0800
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
X-Proofpoint-GUID: Qhjmv4TihdT9SRIGeQB8CwU-zD9Dyz14
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI1MDA1OSBTYWx0ZWRfXxIaY3uGmSK8O
 rB2dvspFpKNLfSVWXku4NedlgCzuxRT7ozlOcJowbirjk95FfZbKO3XKZ5KGYYLN9P8Z9gBqYac
 W8BWwSq6v3fbfXk5ghMlKSSz6vuRvdGehQDRjlKMn1tAHLsnj2yeTJXzP7VwJS4qCHwa68zqyLu
 65/Vg5NutEhNAIopJQrxFNSU9pAO5jn5a0giX3KDFXbupDPGHuKpUwHxygVHbkSECnL51gpQ/fe
 Xtis7pZFIKBeQcvB916SGl94Sn5l3Tj/BmOFwLO16v7O4PZe7IBfrouI+4Rk0Nk+XewADzaqCRW
 DfKzIIJg0IFKCq6MVnOWcSvr5wVXQXiGNMPkJsEM5dDNAbBJ8YNhV2XMUuzQo803MbUnkYykI/B
 +k0mQcZVC8FZGHHGw85VcdUBrcfvBKyrWISp2VQJARF0SDdK3lMugWNME91re1F2LUBIYZPgFaB
 pnoJcwg9L/ESPWAn+rg==
X-Proofpoint-ORIG-GUID: Qhjmv4TihdT9SRIGeQB8CwU-zD9Dyz14
X-Authority-Analysis: v=2.4 cv=M4xA6iws c=1 sm=1 tr=0 ts=694cd99d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=IwjJGIUIzvyStixYlZUA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512250059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_222845_803669_3D034036 
X-CRM114-Status: GOOD (  31.16  )
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

In Coresight driver, the helper device is enabled via enable_path, but 
for TGU, it's enabling via sysfs node manually, so why do we need 
connect the tgu with TPDM device? I didnt see the connection with 
Coresight Core framework.

Thanks,
Jie

> +    };
> +...


