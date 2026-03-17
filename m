Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB070F33807
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 07:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BzWYXwMubvF2D4wEFZJl0atkOVu62kLiijZp17n0pHI=; b=QpLnGTdYexu2zEDCd86A2eDxeH
	fSBEU9ovloBRv+Q9cO3FcETR5WxIcb7btnedPOAsf4v9L3Su1zY5xBY/8BcCioMqZrjW/60EuovZu
	r5Le7YJ3UpWr5Ufr9XtwsNjOu5lH9I9g4gejou4XiF/jRNAtZA5g+eKknE47MEt/5iJSA3zsciQYe
	FirOtT5vhj/VUG1z8v/4v9Zz6Jig7rTBzFS/0XWW6pPcRRaL/Huj44Sln/BCfUcRgZ/Yfn5k9a2kf
	zLa4/xzZXX3VddPvUnges9zmah0AOlVMGG4Q2ZVtv5TW1a0tf43wpXrK9dDMp/52GIpXckIV3Nu5O
	t0d0bGAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2OVU-00000005Xo9-0zEI;
	Tue, 17 Mar 2026 07:06:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2OVR-00000005Xnn-3MgV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 07:06:23 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H2m8Dt3124513
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 07:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BzWYXwMubvF2D4wEFZJl0atkOVu62kLiijZp17n0pHI=; b=H4TiClbu+IkFuIvY
	0jo+RtQI07jDMh1Ifas9IhyEAbvdsAwx0Kl4B6XFlX6R7T1V8WlDRMVKlPUfhrya
	Oj/BNBO4q2vcPJT3oVRfoGX5G5hUcuuJsZhetKe6t6c7V0Bd5ad0v8Ojym4wmyOy
	0GU8hAf2HEHYCUb0mmEBx0CQw6ZHctQWoubpFvsCMpP7Mr5qNKHvCrU+b6yWgQJG
	DA6xZGsmiQlg5DoCtkc/4jsLTz+LgoMpFwolS/rzWP3JYNIxb+u0asFLHf0MfVOZ
	AqHnhBXCu7mFwnY4wHQOvpYW1UHEQfW/2aTM7+lKenM16KLm+m4F9byZKjbW25lo
	6GP1xQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxfsmkxgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 07:06:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c741572a998so65557a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 00:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773731180; x=1774335980; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BzWYXwMubvF2D4wEFZJl0atkOVu62kLiijZp17n0pHI=;
        b=hudtuThi/tLOSZo9dR5EGytQpwpGuSNBB1mCKLH2bszwB6Yj33V+ulyQ0cD7FZd9Mi
         hRnqpKcCO9F2OS4Fr+jInivZIAukMm8ZcfM2lVjPOhTsQQ//Xicu4nwduXcz/7Bmn6fg
         POrw6jXkhJZFAUzyuwtHY3r15NHSm9c1LHmOQiBOGO6tKBvgnVbzgP6OGOgXyDnX5hrM
         toYXvfQm7r6LOS3+iylX9CZeokIe/+z29hw/HCe+4MZGO6SLH91RP3sOFFoSu0osnv4B
         /8Mcbe0uTWeBP4eyzM4fhfyOvQCKrjy7ydl4A1ILr9FJ/HHug2lhrWNN8yW4EowctFrG
         f6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773731180; x=1774335980;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BzWYXwMubvF2D4wEFZJl0atkOVu62kLiijZp17n0pHI=;
        b=L5YdeXWyRjmHbQy9yp/C/Tug4tXg1PCtTgjdtQ3ODPjRwsQUawTF4MUaI9NLBBJdda
         7iwDf5zZXxJqTzvm+R2dQS4EUBmDs8N6DqIr2aQ5ofGQo6nI3YzcsNhVce56+5giN2v4
         pijA3saq4a1YhVmKKtn+q3w6WB3S/2Go7sUjGtAm+EXck/Y1LyjyVp3XF2YNqcssBSp4
         JnFTvN+5yFvhZfZ9efJMTxZmHRxrpf8tKGG3n9v9nybsDgz/e4IY9qOX39tYK+cPCsnr
         Qbgazt9y/ac+in0HMysbn3HB1nd8W14i0oPNQ99EyXBKIioCrGRPYnqvNMoBzV//GjiJ
         Py2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUicxgjlpW1HthovOPojc4x02DUBseqnwAIXfpnE7BWHxR6rIgAJr5F2yCqPHfGEdhhPysfHszsW3ZKF5joovkw@lists.infradead.org
X-Gm-Message-State: AOJu0YyNxrhTaOgEwuzD4yMpOkRV1uo/XqquV5cA+K7vKWUxM6tgCngl
	Q3sM1RkjHYTMS735deEkYBi9db8o6ynPzYJolaOJP8fLZ/cmNiQQjJimQnd4/g6DZSc+soGjfBm
	AxLF6DldiuuIFDP5Qz2ROo3CDl7ICtEValezVdOVsAD7CcpK5jLxuoltgp9PxErMJsiMqPCBuW7
	t7Gg==
X-Gm-Gg: ATEYQzzk8jaOEJugjklmr7YbMpS9N/JWSiSyKgv9eozHQ0fqX9qRMHxZfErQI60/tZP
	U6Vr5u0aQlNBV6zJD6nrFxK6roHC+mQW0KhNcemomfM2nrmQXX41R8LNLOq4J8aNUJvalrBbumy
	hXkZgixFGcfFXetgP17bxw/BkeqFGUVdj0nZ2RQRDN+tKn+6awvfQU+QpsJX+yRTyu9tlCg8tqu
	bgp68YwpdtcOGu9HGk92HDVPWFBrQTwYYBC1vfjVEw1EtUfy8ybutrvbWohGAVuzvjPMcLlwmza
	xohD41qhE2km8qQFzUSHHSNFA8o4UVRR31HvB61gIFjOO3muWjbVSPpFc9F2es62vTNDceaM6Fd
	Zvc+2+VMgOHH1bX8tvMZZS7hhkBszOanVQDNptCK8Tb3jmW6c3WaS8m9I3lDndbR0HppCWBEDlt
	qYodFSL06FbUPKeRerUA==
X-Received: by 2002:a05:6a21:691:b0:398:7808:10f6 with SMTP id adf61e73a8af0-398ecdd8d89mr14257892637.63.1773731180300;
        Tue, 17 Mar 2026 00:06:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:691:b0:398:7808:10f6 with SMTP id adf61e73a8af0-398ecdd8d89mr14257856637.63.1773731179749;
        Tue, 17 Mar 2026 00:06:19 -0700 (PDT)
Received: from [10.133.33.223] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74029fa6eesm5535805a12.20.2026.03.17.00.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 00:06:19 -0700 (PDT)
Message-ID: <d307bbcf-0fb0-4d13-8372-0bed7fe78d5f@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 15:06:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/7] dt-bindings: arm: Add support for Qualcomm TGU
 trace
To: Jie Gan <jie.gan@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        Rob Herring <robh@kernel.org>
References: <20260226020454.3210149-1-songwei.chai@oss.qualcomm.com>
 <20260226020454.3210149-2-songwei.chai@oss.qualcomm.com>
 <32309e19-e193-4f56-80c4-39b028f05876@oss.qualcomm.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <32309e19-e193-4f56-80c4-39b028f05876@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA2MSBTYWx0ZWRfXxSQBOcodCCLN
 +fSF6P1LHD/8fvOsSmWxzxBjFkz079+W5VAlNE4/THdiO1AWpATMGc6v12WjvY/yit2CKghcMP8
 DHcFBQ8fO/NE7algj/DZVDmMJHilf6PgjeZYg6NWHaE4xXW2lvFPqDgLZnNH2SbHS9w9FnQSPDH
 17B8GHSbb59R2+RlYQOXuZTtaHFK6J43H5EHa+s1DAcGwsP5bxPyXWsX/DbeQiOIEFqVOpNUXF1
 rLwv2B6cXM3ldoD3nWtahzfVoa7NnMKvrMqBCEtfT9O2soeW+LaU4Rz6rxCiWRMuTS2LIJA5raL
 6h00/aujrLloGJDzouvE4gQnctcnJLViPLylN938qH+rlinyp16rs2gW0RpMkkZLlZEMH1pPH0U
 Kt6GTCljf6P1AGR+mNOfmm5qf4Hvx2SkOD2Gvo9NvZg1401D25qrt0M7hsZiaLThv7cVp0136QK
 PDG6l73gxsMlOVIHMxA==
X-Proofpoint-GUID: UU-sjYmYXPEO3GR86ZdxGLsna0qHrGzy
X-Authority-Analysis: v=2.4 cv=V/hwEOni c=1 sm=1 tr=0 ts=69b8fd6d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mofWGhzUb814t78398AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: UU-sjYmYXPEO3GR86ZdxGLsna0qHrGzy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_000621_847043_91CB6A77 
X-CRM114-Status: GOOD (  26.52  )
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


On 2/26/2026 2:07 PM, Jie Gan wrote:
>
>
> On 2/26/2026 10:04 AM, Songwei Chai wrote:
>> The Trigger Generation Unit (TGU) is designed to detect patterns or
>> sequences within a specific region of the System on Chip (SoC). Once
>> configured and activated, it monitors sense inputs and can detect a
>> pre-programmed state or sequence across clock cycles, subsequently
>> producing a trigger.
>>
>>     TGU configuration space
>>          offset table
>>   x-------------------------x
>>   |                         |
>>   |                         |
>>   |                         |                           Step 
>> configuration
>>   |                         |                             space layout
>>   |   coresight management  | x-------------x
>>   |        registers        |                     |---> |             |
>>   |                         |                     |     | reserve    |
>>   |                         |                     | |             |
>>   |-------------------------|                     | |-------------|
>>   |                         |                     |     | priority[3] |
>>   |         step[7]         |<--                  | |-------------|
>>   |-------------------------|   |                 |     | priority[2] |
>>   |                         |   |                 | |-------------|
>>   |           ...           |   |Steps region     |     | priority[1] |
>>   |                         |   |                 | |-------------|
>>   |-------------------------|   |                 |     | priority[0] |
>>   |                         |<--                  | |-------------|
>>   |         step[0]         |--------------------> |             |
>>   |-------------------------|                           | condition  |
>>   |                         | |             |
>>   |     control and status  | x-------------x
>>   |           space         | |             |
>>   x-------------------------x |Timer/Counter|
>> |             |
>>                                x-------------x
>> TGU Configuration in Hardware
>>
>> The TGU provides a step region for user configuration, similar
>> to a flow chart. Each step region consists of three register clusters:
>>
>> 1.Priority Region: Sets the required signals with priority.
>> 2.Condition Region: Defines specific requirements (e.g., signal A
>> reaches three times) and the subsequent action once the requirement is
>> met.
>> 3.Timer/Counter (Optional): Provides timing or counting functionality.
>>
>> Add a new tgu.yaml file to describe the bindings required to
>> define the TGU in the device trees.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/arm/qcom,tgu.yaml     | 92 +++++++++++++++++++
>>   1 file changed, 92 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,tgu.yaml 
>> b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
>> new file mode 100644
>> index 000000000000..5b6a58ebe691
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
>> @@ -0,0 +1,92 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +# Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/qcom,tgu.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Trigger Generation Unit - TGU
>> +
>> +description: |
>> +  The Trigger Generation Unit (TGU) is a Data Engine which can be 
>> utilized
>> +  to sense a plurality of signals and create a trigger into the CTI or
>> +  generate interrupts to processors. The TGU is like the trigger 
>> circuit
>> +  of a Logic Analyzer. The corresponding trigger logic can be 
>> realized by
>> +  configuring the conditions for each step after sensing the signal.
>> +  Once setup and enabled, it will observe sense inputs and based upon
>> +  the activity of those inputs, even over clock cycles, may detect a
>> +  preprogrammed state/sequence and then produce a trigger or interrupt.
>> +
>> +  The primary use case of the TGU is to detect patterns or sequences 
>> on a
>> +  given set of signals within some region to identify the issue in time
>> +  once there is abnormal behavior in the subsystem.
>> +
>> +maintainers:
>> +  - Mao Jinlong <jinlong.mao@oss.qualcomm.com>
>> +  - Songwei Chai <songwei.chai@oss.qualcomm.com>
>> +
>> +# Need a custom select here or 'arm,primecell' will match on lots of 
>> nodes
>> +select:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        enum:
>> +          - qcom,tgu
>> +  required:
>> +    - compatible
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: qcom,tgu
>> +      - const: arm,primecell
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: apb_pclk
>> +
>> +  in-ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +    additionalProperties: false
>> +
>
> The TGU device is no longer a CoreSight device, so I think the 
> in-ports property is no longer needed.
>
> Thanks,
> Jie
>
Thanks Jie,

Your comment has been addressed and updated in V12.

>> +    properties:
>> +      port:
>> +        description:
>> +          The port mechanism here ensures the relationship between 
>> TGU and
>> +          TPDM, as TPDM is one of the inputs for TGU. It will allow 
>> TGU to
>> +          function as TPDM's helper and enable TGU when the connected
>> +          TPDM is enabled.
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    tgu@10b0e000 {
>> +        compatible = "qcom,tgu", "arm,primecell";
>> +        reg = <0x10b0e000 0x1000>;
>> +
>> +        clocks = <&aoss_qmp>;
>> +        clock-names = "apb_pclk";
>> +
>> +        in-ports {
>> +            port {
>> +                tgu_in_tpdm_swao: endpoint{
>> +                    remote-endpoint = <&tpdm_swao_out_tgu>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +...
>

