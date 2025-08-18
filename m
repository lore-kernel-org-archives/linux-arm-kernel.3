Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C0DCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DW0VxXLSXGTdFzZpRwKPAVDn88uevWk8bVT728uIol4=; b=YfBA46yjdeQGrwICd3Q90VvR9H
	xDaP3xeZ87RoAkgxd/STBGZrIpJfi8O7DJxz+5IYWWVYjZb8ccRaIeLb7XDSrybydRmjxYA62hXjG
	Rmw9boYICSLDNCwgh4HFfNuQJ/i77hPmONBFreYvYoGzzeFmoMHijVTfXfGGM2R/2xYC9MegtdxPh
	pSrHVEqufVQA4KNslB1J7Ifxq6TLplBQ8ghPn7W2EbtPfrY6SINzjTJYLr+hAr8hPIN5RARHWRGdp
	uZusoUJBFQR3YKPSxJByBp85ggYtF/Xc0vItWmIhSUjixV+1t0uNZyorAbN3pP3o7vVkt/g4EA5gm
	7TYHU9vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1A7-00000007oL3-0Rf1;
	Mon, 18 Aug 2025 14:48:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unwBf-000000073jY-1RoL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 09:29:56 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8ElB4021032
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 09:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DW0VxXLSXGTdFzZpRwKPAVDn88uevWk8bVT728uIol4=; b=CbdLXIElTrpNP7ZY
	rlcKdSqJOnt3J1ZI9BT13rOp14wOvLJgu97zW9A/kZSz0Ahae8arvwVERDPfUqyL
	hW/yyfbOIjCSUyBjv7S1huMk+lOlYIUWi0nuU+ArHs3vkPs/jpcSCaUduiGbRBMc
	eC/h9/A0oW7H7sV4FsCBsRpHue7flZYk4YSQYgb8PCG5HNmkAQv693TekmazwMJy
	C66sRgvG2sDb7j0PQBCK1BN/aXSzWCnC+DYZaoAwkImb9cH6Ba5+bJPl+o8x1cbc
	xzP2oWNHMGfyV/TJnaBJyEIUaK/im7Anl3oSTmFh36rbs8eU7m8jOdbbm9TY74IB
	vK/Q1g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99m0ye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 09:29:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24458067fdeso45925035ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 02:29:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755509392; x=1756114192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DW0VxXLSXGTdFzZpRwKPAVDn88uevWk8bVT728uIol4=;
        b=GGN+fcX0aNcbkHuQyerSpyYjP9cENbT4EMBj/UK1oJ6NuZMbU2Q/c1AAR6nhsyJhPk
         bbrBqepeMEBlawiBW8lPDJnNF9dtYk4YTyneqZ1KP/+chTT27/bdhV7pO5IdeqCepHBB
         YsvCaZxL5q7le27lRBAwjCJZO3Rj0HGDTgjiiuMGnEV3Y0GuLe6aM2EV5OU0DkNAgT1k
         M1Z4MuLx8Gersx2m0YC3cQFMUzSnC/qtg2VDz1A3rV3kmuOcz7Uclq76pGBzqLEwh3Mq
         SKP/I4esWbS5JKwMrlYIQTWgK4Li7GIx0vwk6Oyo4pLQqeu9Wq8oracoq5o2DNbI9Xqu
         R+Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVvz8w8CKpUyHzZxvgoq28KhlR7Fusq7EGe6KF6I7LKXp/MqZKVhNoIn1j3rnO4sxnduUUyhJvKTFpm1cX9A/aw@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0d4hl9mmTgoW/QAK0CnW4R1YvvgFM+XmFiPkoLrjwHtSumTr1
	hve35M4JnCWW7amm76pGVnmBQlza52qivn7h8u732WVTGpaUatpilyFjebN4nS36iU7Ty45rjdb
	iwdUPwgXqtc4Q57CvoH4G7W4edXW3k5Xa9PmljCXe6jGRbpe9e47cSqzv+uC6MDinD3b8PAK1Tp
	fQJA==
X-Gm-Gg: ASbGncvik7tJHoWadWUKZRnaT68cDNVFU4TqKuiHADBamEWZp0D/d7PYogVTrWSP88C
	4DXoXsJNJpnuFIdmUUEoLyqEB7I6xX73QbX82TnnLnONWOrJy4UEH+ZK0NYqfYncQly88UUOZTv
	GybZQXwcOJBlHdeW0Pl/1CxEzGg4c3ipA/uxyyRTEVtE+NOEsCONEt5ZQxOz5AT7SAAY68uiDpu
	0BugIl2Baj1IM1/Zq9WfqFSSxMliCBy2GgVVEWySN/zK0d1A0ecFoCLMhZy6Nr9XTICe+PMSuzL
	HxT5TdH7jt2nzbsYqWUr7P2fNjFc/Vl3APIvvw4J+EQ3eH56IbcKW5zoQNl48myVd58K6UVZAX0
	9orpI4otO51qTRRX9kFE/rH/ACcQoy14T
X-Received: by 2002:a17:903:41c5:b0:240:72bb:db0b with SMTP id d9443c01a7336-24478f539b4mr99029125ad.21.1755509392190;
        Mon, 18 Aug 2025 02:29:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdvgHuSgGPApqix8dgwheTWJ6eX5H3fi4YFMhUp3VuMy+VubG2cky38Pb7ZLmRxY6ZQMfL3g==
X-Received: by 2002:a17:903:41c5:b0:240:72bb:db0b with SMTP id d9443c01a7336-24478f539b4mr99028775ad.21.1755509391723;
        Mon, 18 Aug 2025 02:29:51 -0700 (PDT)
Received: from [10.133.33.73] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d50f71bsm74496835ad.80.2025.08.18.02.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 02:29:51 -0700 (PDT)
Message-ID: <932326f8-8650-44c6-b747-a12664e9e953@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 17:29:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add Coresight Interconnect
 TNOC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250815-itnoc-v1-0-62c8e4f7ad32@oss.qualcomm.com>
 <20250815-itnoc-v1-1-62c8e4f7ad32@oss.qualcomm.com>
 <e82ca132-f312-45b5-bec0-9d83cd3771d4@kernel.org>
Content-Language: en-US
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <e82ca132-f312-45b5-bec0-9d83cd3771d4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3BNwcijlWeqit_puwQzfSuKxS-CnGzUF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfXxIo3Gzypz6yt
 72X0Af94KHO+UmfwvkEEfNDcd0q5MqLdaOge5vMYISjWtDP0rKrt5kY9ys/DtTuAtPZw4S5i1Tz
 PMfLRVT1wL27OPSsUfF6+K+xN7AqB89kWIOhL7NQ9PebFZvh0Yzdhdr+UHvvXgXUKyQ3f35xxXy
 6BgVefpM4K44UPDAcvbW/bMkQHr5CxsRdLF076fvD2JHroMXQim3bi7nOH1gFRQoypyxajMl6N8
 ObrKGUcEtJuQlPbGvQ90DP2G+791B4gKRyA3CnO9X2jxHGOCwqJdau6rQ+zu5RQVZIVOQQz9u+W
 ex4gvE54N4afR+Al4sinsFdrOvBD7Z0moU9S2clr/nRqyeEewjeEVSbgccGV/XKiXzc0hmbqzop
 jhUgc6Oy
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a2f291 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=agCq8VLWhxUVNrkTfPUA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 3BNwcijlWeqit_puwQzfSuKxS-CnGzUF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_022955_392496_8B342AAB 
X-CRM114-Status: GOOD (  20.88  )
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


On 8/16/2025 4:33 PM, Krzysztof Kozlowski wrote:
> On 15/08/2025 15:18, Yuanfang Zhang wrote:
>> Add device tree binding for Qualcomm Coresight Interconnect Trace
>> Netwrok On Chip (ITNOC). This TNOC acts as a CoreSight
>> graph link that forwards trace data from a subsystem to the
>> Aggregator TNOC, without aggregation or ATID functionality.
>>
>> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
>> ---
>>  .../bindings/arm/qcom,coresight-itnoc.yaml         | 108 +++++++++++++++++++++
>>  1 file changed, 108 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..fd224e07ce68918b453210763aacda585d5a5ca2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml
>> @@ -0,0 +1,108 @@
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
>> +description: |
> Do not need '|' unless you need to preserve formatting.
sure, will remove it.
>> +  The Interconnect TNOC is a CoreSight graph link that forwards trace data
>> +  from a subsystem to the Aggregator TNOC. Compared to Aggregator TNOC, it
>> +  does not have aggregation and ATID functionality.
>> +
>> +select:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        enum:
>> +          - qcom,coresight-itnoc
>> +  required:
>> +    - compatible
> Why all this? Drop
sure.
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^tnoc(@[0-9a-f]+)?$"
> Why are you requiring a non-generic name?
will update the name.
>> +
>> +  compatible:
>> +    items:
> No need for items
sure, will remove it.
>> +      - const: qcom,coresight-itnoc
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: Base address and size of the ITNOC registers.
> Drop, redundant
sure, will remove it.
>> +
>> +  clock-names:
>> +    items:
>> +      - const: apb
> Drop clock-names, obvious. Also, odd order - names are never before
> actual property.
sure, will update the order.
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  in-ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      '#address-cells':
>> +        const: 1
>> +      '#size-cells':
>> +        const: 0
>> +
>> +    patternProperties:
>> +      '^port(@[0-9a-f]{1,2})?$':
> Why do you have here 255 ports?
It supports a maximum of 256 input ports, so it is limited to 0-255.
>> +        description: Input connections from CoreSight Trace Bus
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +    additionalProperties: false
> This goes after $ref
sure, will update.
>> +
>> +  out-ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port:
>> +        description: out connections to aggregator TNOC
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +    additionalProperties: false
> This goes after ref
sure, will update.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
> And here different order... Be consistent. See also DTS coding style.
sure, will update the order.
>> +  - in-ports
>> +  - out-ports
>> +
>> +additionalProperties: false
>> +
>
>
> Best regards,
> Krzysztof

