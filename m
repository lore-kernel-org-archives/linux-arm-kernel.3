Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC568CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 06:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iKDfblzDNT46YZA30uGR6v1f2o7XXcul3XVrMddX/YY=; b=Z866maMTBxrLEZik8KsQrtdxcZ
	lXeKd0bq88t4NfnyNMD/wBGHaJ82h7Ma/8bZarRb6/yWDbBtvoNX6WVae1Dwp0bEHmZZ2FzMXKCtA
	oVmZmCw5QAUBJaKA52IZZAevn5qkgVtEQjgzcpbku1oa8lAeEFDrcY5dTl7ElCXNQYbMJAJmlE4Kl
	+1CcycAhI2DJPz5pJcKVWGq8/CVYdegD4WGVtRU1XQ0+ddV6ecMAvdSRMDZQO0m9Lu6r7D3F47Nzn
	fSIKkZhTWke+FQ9GXevn21ChsxJXeREijyQICdX/Yzaw7RXl5OqSm7dXMq2ljsASBvj4w+K/g/Yew
	7r6Q0viw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uocIP-0000000CV8m-3svj;
	Wed, 20 Aug 2025 06:27:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uocFV-0000000CUkS-3iKb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 06:24:43 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1oYRF010752
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 06:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iKDfblzDNT46YZA30uGR6v1f2o7XXcul3XVrMddX/YY=; b=WTvN35Q6cki4NjFv
	C5dybd5+82zGxiD4rcGhPQQ1avtwaO98mO6sOW4g2DKVdKj79cZ1fsyUW7j7xaLI
	h/c1+tEUyDS7uhXswB2G7bJASsZ5Psoy8OQVE3ZnoHIcHtrNbLUffcNf5helDQam
	602iIpsi0r6yM/Tctw6FZsq6jG8WnQr8NlKffGAjz8H7jADQu8xYN+Ojon8BnIvd
	jszcof3gc6JGkTuOGskFg6VtkzL2x22p/umtw5L/ks1f26fSmu9cEGWKZIWV5WYV
	sEngmni5ywi1I9QSwofXUHzgE0YqSTPEt5WYKPzaaIsqrewX2toB2hIZtgfxrOWl
	MIGg1A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528rmse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 06:24:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e2eb787f2so6111548b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 23:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755671079; x=1756275879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iKDfblzDNT46YZA30uGR6v1f2o7XXcul3XVrMddX/YY=;
        b=lepCu4rxqBSkzTZkK8CES4FK9N0zRxHTZsh/sVTUwCkVMPxSSBFTkV4CGp80OfNuxP
         yhe4I5BL+46WSt0CdpLay6fLQNzdVMWI1ahSzK3UTp/tDloUxyjxEDP539sT0Q+grFFM
         md3PpzMvjZ1vD0vCmFELg86TNRsbzPQczrB4iN+pMHaSZisE1KVptFGse53e6CyqCn/f
         2c74W40KfAt87tOl8QGQGrMDreQaHIazWSnErGOVtD5PS3KMpzbwNZYmvLzmlMEnkEWr
         p6a/h2EBBG2ReTwz723AHjQyDAieqmKoZM+Zi3aAwwlj6U3jtM7CBOgVbBoFjO1rKlyo
         +35A==
X-Forwarded-Encrypted: i=1; AJvYcCXBK7/iF38NjBKPbGA/ooxWUfGTsoqB6FAV9K6SxHoMAXSYEgdpUkQRzoS93pGCPiPag02pybaallraj8kRGJYZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxsnhEEuDD2l0RbO+cMTN8+p1wYyDEJoPFig3Kob61fHixyGR5N
	2sRt5DsTlgEARwr3RPBTmF1upDVheoZxBl0jnjHuze4xiBSimqXssfEu+SxwgHig3cUlJzBNtXu
	qFTygqh+NDzkuCaQOusUzkdxUaYuczT33SaLMDQfwE6CQjJCbN0aHyhU4/H6qWPoYZkewpJc0tJ
	0Fyw==
X-Gm-Gg: ASbGncvHEezv4BAoWztyJar5aL9EBkkMaXzoEVhneJdd8ogbs+iyrDyNlOQx4sQkjhv
	q5juRA5XjfEPvmaH1e6/tYO3ps3nP1bgwVLRCr6c2e6PgJkEJfpYoWWenWue23Nri0tSrV4iB4t
	iHqmFwuhGDfdWaBCKjBgLdpwqg0jLaGMTzRIzWKaM1z+ej1rU1kcj3oSHQXFUp9wCfGCwCeUSAW
	bocw0ryQ/xWsPJW1qMrBO39vDJv4WmW0rIAtg0Jrcr8BRf8VumlkCAvGXi/DEHqCyeEwR9U62pS
	NkZ/o+VArvq5C8lIPvgUZnB7Z1X/rUkCml7wV0fWa5QKgWNC0t2+pZZSVYfrE11h8Famonwcr9B
	xMIKxCcK8e7G8Cc+CBaBzqQgILjzczBnW
X-Received: by 2002:a05:6a00:1486:b0:75f:8239:5c2b with SMTP id d2e1a72fcca58-76e8dd255ccmr2038340b3a.23.1755671079374;
        Tue, 19 Aug 2025 23:24:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfH/JRqULP7unNKt/bNqp2cJbEU4cxpppDZWazMbkq05YCUx/tWuR3V1ofH2rijz+Dk6oT6g==
X-Received: by 2002:a05:6a00:1486:b0:75f:8239:5c2b with SMTP id d2e1a72fcca58-76e8dd255ccmr2038315b3a.23.1755671078900;
        Tue, 19 Aug 2025 23:24:38 -0700 (PDT)
Received: from [10.133.33.73] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d0d9438sm4271920b3a.21.2025.08.19.23.24.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 23:24:38 -0700 (PDT)
Message-ID: <60628e3d-0a59-453e-acb3-acfc6dfe62af@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 14:24:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: Add Coresight Interconnect
 TNOC
To: Rob Herring <robh@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com>
 <20250819-itnoc-v2-1-2d0e6be44e2f@oss.qualcomm.com>
 <20250819194538.GA1214644-robh@kernel.org>
Content-Language: en-US
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <20250819194538.GA1214644-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a56a28 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=q2rpgh4P1k-zP0bRiPwA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: SZKsE6W2rfo95CUl5yo17Rx_sw6UCoRV
X-Proofpoint-ORIG-GUID: SZKsE6W2rfo95CUl5yo17Rx_sw6UCoRV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX8duWGaYegN0a
 KHmgM8AiW60URc7P8BLvpN4gRj2COG2Bzl4x7ud7ZBthNCY22TuVOtD6VPRlafYPS0Ow6L2S6JA
 6vcSexBzTewr9frg1xOVLAm1vOsRTLzz81ST22T3R4zQwwC9B1A1ioVJu0ETXWp7FxoJjgZeEFd
 EIG0rvNsY6tXPGfKFdY0S7WNyVRJBDHDxUeVUTDP1NdBXIdi8UBRHfZUtFVBAEAkfqsHjx0g5Z3
 BNP8b/7VekfPA/TyK1p4dN7zbg2MDIzepervK8Iz/o/XMdVuidrbqkQNmQ71Wn6gO9Nrg7mTr+h
 jCDAFof95EBN8vPZgAYD9ZhTaayaq4cKaDpCZGB9ACDmYgfn6d2YiEISAkvo6CIOQcRY6MoB9l+
 0+74L6CXzAEy6n7Ml3JvUAG82Dj16w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_232442_047328_B70C5608 
X-CRM114-Status: GOOD (  19.91  )
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



On 8/20/2025 3:45 AM, Rob Herring wrote:
> On Tue, Aug 19, 2025 at 03:27:43AM -0700, Yuanfang Zhang wrote:
>> Add device tree binding for Qualcomm Coresight Interconnect Trace
>> Network On Chip (ITNOC). This TNOC acts as a CoreSight
>> graph link that forwards trace data from a subsystem to the
>> Aggregator TNOC, without aggregation or ATID functionality.
>>
>> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
>> ---
>>  .../bindings/arm/qcom,coresight-itnoc.yaml         | 96 ++++++++++++++++++++++
>>  1 file changed, 96 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..a3b5f2b949f69617a014d0ae2831c9c767178f8c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml
>> @@ -0,0 +1,96 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/qcom,coresight-itnoc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Interconnect Trace Network On Chip - ITNOC
>> +
>> +maintainers:
>> +  - Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
>> +
>> +description:
>> +  The Interconnect TNOC is a CoreSight graph link that forwards trace data
>> +  from a subsystem to the Aggregator TNOC. Compared to Aggregator TNOC, it
>> +  does not have aggregation and ATID functionality.
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^itnoc(@[0-9a-f]+)?$"
>> +
>> +  compatible:
>> +    const: qcom,coresight-itnoc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: apb
>> +
>> +  in-ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
> 
>> +    properties:
>> +      '#address-cells':
>> +        const: 1
>> +      '#size-cells':
>> +        const: 0
> 
> Drop these. Already defined by the above ref.
> 
sure, will update.
>> +
>> +    patternProperties:
>> +      '^port(@[0-9a-f]{1,2})?$':
>> +        description: Input connections from CoreSight Trace Bus
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +
>> +  out-ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +    additionalProperties: false
>> +
>> +    properties:
>> +      port:
>> +        description: out connections to aggregator TNOC
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - in-ports
>> +  - out-ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    itnoc@109ac000 {
>> +        compatible = "qcom,coresight-itnoc";
>> +        reg = <0x109ac000 0x1000>;
>> +
>> +        clocks = <&aoss_qmp>;
>> +        clock-names = "apb";
>> +
>> +        in-ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +            port@0 {
>> +                reg = <0>;
>> +                tn_ic_in_tpdm_dcc: endpoint {
>> +                    remote-endpoint = <&tpdm_dcc_out_tn_ic>;
>> +                };
>> +            };
>> +        };
>> +
>> +        out-ports {
>> +            port {
>> +                tn_ic_out_tnoc_aggr: endpoint {
>> +                    /* to Aggregator TNOC input */
>> +                    remote-endpoint = <&tn_ag_in_tn_ic>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +...
>>
>> -- 
>> 2.34.1
>>


