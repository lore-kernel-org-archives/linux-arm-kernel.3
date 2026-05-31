Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E88CD6E4C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 01:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QP/YmQQpucJZRAia0geXRt1bwULI4Tj+5E1XuSKtbHk=; b=jy5aWEJKa6bE5oTdtYxyz7Vdh4
	sJUag3znNqkJ/v4SjRXBtwCrbMmbDqnx6GVJSHSoret+tJ1XgR+LYZjLQIezGKPVqgfWeozwYMs6k
	ssDOOyM2yY6DfUmtpeHYfKia5HbTP33wZ6Sti4oriR1U4MTUN5m54C7vYmu95+Pgs8zhSn+Jz6lXW
	JZyJM/4iAjvE5EXnnXVZWfD+4hb3znbJ5hXOLneTfgC+WAznnBdkDrcJqku+Hrrx7G+eFiJg1VSiY
	uxnKqUxSHnKHHfJg0dFf9D4FHnGJkAvupi+62VypKvFNdrdXYG832J4dIeM0Mc/vJeGRaY65v36j8
	mPdJrRxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTVB5-000000099nr-1dfE;
	Sun, 31 May 2026 01:41:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTVB2-000000099n1-3IDl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 01:41:22 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64V0meA63509356
	for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 01:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QP/YmQQpucJZRAia0geXRt1bwULI4Tj+5E1XuSKtbHk=; b=SBld4c93EtHDw6FZ
	iqp3saJCFfg4PS1UlsS4Appqch9UUYlIFoFt/om5A4Jr/Lmvp6b8Lu/DmUCESLEF
	3efpNJgwOhXNh5R6NbIfU1sRLlAC6rvqWpZIPpZt88etreWRicCyI5/PzgafEGFa
	GuxUA+qEiWR7+XWXbJBaDzHIBVHw0ZRtTt0Rpxk3tUNB/iktz6nJEoYjWIyp3q/y
	MfH8ElRHS3fZUb/49fiKauF/hYVrbCK7mdYKmEmbuqYrkooTOQgbrMCqM35psAth
	pSQlgCX2nfOnh3Doa61hu0AKgD3bgqvsNf7O0XCFj3jylvbgPHQXMe/oP9Rnw0+p
	Xf72Ng==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efs66t901-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 01:41:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36bc54005a7so2429034a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 18:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780191678; x=1780796478; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QP/YmQQpucJZRAia0geXRt1bwULI4Tj+5E1XuSKtbHk=;
        b=GeI786vw+fq0ZtQS2BRY6emA0VtRQEXJTn04ibg9R3PYxXULmn1iaS32ifvDA+KWmJ
         348ERr8fAiK4vzI0cYApULK8xHjRrW9y7uIkzwmoRb8hGYhy2fyUOWhFYWK7tAyffFQX
         5kJeobf9bU4q9Q8ROGUoOOiEUf7+fj5jgbLaj/athv7pkSDaXzCuJBpv1R2z9lF1TKOO
         MQfA+X+By9WcLZEbqaYq8r+Y0/dIhjZFU8XiZyV9YydgvFycxvx5t4yPjXB+BO+1O5sw
         hnbuEnJVTpFwZsuza9mEd6dWl1dqMYpxaD7zfqEIpoRjeo+i0ihwKJQ2oNVJ4tyNH6K1
         fX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780191678; x=1780796478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QP/YmQQpucJZRAia0geXRt1bwULI4Tj+5E1XuSKtbHk=;
        b=CBvtJcXkAfKv3RKMRKFuxSH9smrb7aUz3J5rHXMMyJsddxFFqttWFCmMd9QaPvrj+0
         PJk+DOpbX9D+vQgS/lM1pEWzfV9aWI29cMqC26GawnQFSRbsW0+UOBqVHSz9K/HO6f1+
         TkFFx6w1gqJWny3laEAPzSLRx3WFW1+YO0DKfTEFedID7W/A9Kp+ljtn5lpr1PmU1TRv
         LqMn5p8UZACPgedJISY4FZUpKSGQIWCWejlmIqvnhOwZZl/QJ53QnkonaL0WSKR/N71j
         H8yEkrwg48ErIWBdVD2S09i5wpv6OdGYYxVhtN7L82cCTcPAtkxPgjKH+ta3u91HOBWu
         TJkg==
X-Forwarded-Encrypted: i=1; AFNElJ/UFjk+6zD1g6Oq30LzgBKs9q2sai5tJYBK/JWomvh28unbPiwnjFkD06GuU2DrR60mklPjIpH0pnvJU2xa4G1o@lists.infradead.org
X-Gm-Message-State: AOJu0YzcpQTY21gSftKFKbGtDJBOWZarssGeUEnf78e3pSlffAz0/nd4
	ExWtBrU8c+97SLL5lMugEIzzHnBINU6uqk2+lwuzRaw81JkRkVQcrkUDWevgULavB3/BpNn5rKU
	1EAhu6/sFgOiEWSxbnoc8BN5Wul03zPsZndIE/M29bK+/bRUs8I3a4lldqmDH5mBC2TRUwgTdMo
	Cp1A==
X-Gm-Gg: Acq92OEPEUx6u4pct0OU+fVM5HJ7h/Gt4ZEbZUJaK+NxoAulQsFdsonLLXZx3RyozkM
	Qm4gZxEDL/hbVbJjnj3h5Gut6i697V5gYYtiOo3JQrTA0hher8ZUzkErryxr9yHIUqW1Y06btPF
	1QANq0yknMl+0fxmzMJG6w7J3qGJD6uWpAL4kHjmkxh0VNe4eoOH10sdiusxyORbt8bBG9u5H0s
	nYWIZU0JktoIGQ8W5X/e/vT3oa7Wymc7Ey1ZqZH4agMVDVC4cydAerbAMMaEOXPLxqfUlF1PI4A
	V21I3wcX3z2FDjr50NXtdFPMTJG77a3t1V3SQ28aZQvE6WHFga3gDtIZFSSCq/LDJmyK0TASgqT
	iLng7ez2UANiVhZBsMw1SIQOK/TldU6Ipm3073OD6YtFhgCwooQxSsCrspwQ5wMZOZII+jxtsvS
	CijdDbm2mgR6pm/nXqYPhb
X-Received: by 2002:a17:90b:4d0f:b0:368:7c0f:ebf7 with SMTP id 98e67ed59e1d1-36c501b8fbdmr4902597a91.16.1780191678398;
        Sat, 30 May 2026 18:41:18 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0f:b0:368:7c0f:ebf7 with SMTP id 98e67ed59e1d1-36c501b8fbdmr4902580a91.16.1780191677869;
        Sat, 30 May 2026 18:41:17 -0700 (PDT)
Received: from [10.133.33.28] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbdcd0a2dsm3670713a91.2.2026.05.30.18.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 18:41:17 -0700 (PDT)
Message-ID: <7d49742a-7602-4f58-8dce-7e02664b783c@oss.qualcomm.com>
Date: Sun, 31 May 2026 09:41:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: ufs: Document static TX Equalization
 settings properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: bvanassche@acm.org, beanhuo@micron.com, peter.wang@mediatek.com,
        martin.petersen@oracle.com, mani@kernel.org,
        linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Zhaoming Luo <zhml@posteo.com>,
        Ram Kumar Dwivedi
 <quic_rdwivedi@quicinc.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-mediatek@lists.infradead.org>
References: <20260529113338.984301-1-can.guo@oss.qualcomm.com>
 <20260529113338.984301-2-can.guo@oss.qualcomm.com>
 <20260529-neat-bright-shellfish-eab5e8@quoll>
 <ada65ce2-6736-44fe-9396-d3ed632274ce@oss.qualcomm.com>
 <b445e9e3-dfda-45d6-bafb-a2deb3357144@kernel.org>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <b445e9e3-dfda-45d6-bafb-a2deb3357144@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDAxNSBTYWx0ZWRfX+H/4dW5BGmKH
 RFVP8Cm9QE7O0lZQ8ePGH+P/iK0HKdv9odQfXzk5j+RQgPwsTnbGIZE3eff+ZBLnkeX4MlNZLv0
 s4xoWzlQLFrPgpgNp2r5FpNOxJc5Wbb5t0zSqnvSrAUMN8HtqtnxscUPtar2jwW8ax+Pa1xXr2m
 6nQTUDxhzcQdCimqnFVjtjEIftM2as3rdYnL9+8daiRxjlqHY2y0wGqY0ERDQFt5Z+Hzq1GaIEt
 pY8AaUChnER4sXwscEbYrX6mRCoZm9pMosrx/bo9hkBZSf573ubzD8j/RoGkH0sIhJ4XBlVosoK
 70C8rOjD7XSx4QulB/nFPIa741Q3txw3qI+jtQryz7GSwvN/f8kFSdFyrvKbB0RGpu7MqpeiPs+
 2kwxqQHGgm4lhopTSfIn5NCPQenNK9Pugqj5pTb/+eFc/WOUOvyMUZ3xQXEBXOQcGeUn1pMjv7D
 VNNXIwdEsHiG6GBhqfw==
X-Authority-Analysis: v=2.4 cv=X8di7mTe c=1 sm=1 tr=0 ts=6a1b91bf cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=PY6Zn8H8AAAA:8 a=mpaa-ttXAAAA:8 a=EUspDBNiAAAA:8
 a=7_JFPPHlOpLMAyv0mBMA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=ySS05r0LPNlNiX1MMvNp:22
X-Proofpoint-ORIG-GUID: 6RHTsIUlyBKCFP4B8F4opAYkSD9ncaPf
X-Proofpoint-GUID: 6RHTsIUlyBKCFP4B8F4opAYkSD9ncaPf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_184120_909869_DED64ABB 
X-CRM114-Status: GOOD (  20.67  )
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



On 5/31/2026 1:33 AM, Krzysztof Kozlowski wrote:
> On 30/05/2026 14:45, Can Guo wrote:
>>
>> On 5/30/2026 12:58 AM, Krzysztof Kozlowski wrote:
>>> On Fri, May 29, 2026 at 04:33:37AM -0700, Can Guo wrote:
>>>> UFS v5.0/UFSHCI v5.0 add HS-G6 support (46.6 Gbps/lane) via UniPro v3.0
>>>> and M-PHY v6.0. In these specs, TX Equalization is defined for all High
>>>> Speed Gears (not only HS-G6) to compensate channel loss and improve signal
>>>> integrity at high speed operation.
>>>>
>>>> For HS-G6, M-PHY uses PAM4 1b1b line coding, Pre-Coding may also be
>>>> required depending on channel characteristics.
>>>>
>>>> Add vendor-neutral DT properties:
>>>>
>>>> - patternProperties for txeq-preshoot-g[1-6] and txeq-deemphasis-g[1-6]
>>>> - fixed property tx-precode-enable-g6
>>>>
>>>> Each property is a uint32 array of per-lane tuples:
>>>> <Host_Lane0 Device_Lane0>, [<Host_Lane1 Device_Lane1>]
>>>>
>>>> Accept 2 or 4 values (x1/x2 lane configs). PreShoot and DeEmphasis values
>>>> are 0..7. Precode enable values are 0/1 and only applicable to HS-G6.
>>>>
>>>> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
>>>> Reviewed-by: Bean Huo <beanhuo@micron.com>
>>>> Reviewed-by: Peter Wang <peter.wang@mediatek.com>
>>>> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
>>>> ---
>>>>    .../devicetree/bindings/ufs/ufs-common.yaml   | 45 +++++++++++++++++++
>>>>    1 file changed, 45 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/ufs/ufs-common.yaml b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>>>> index ed97f5682509..d90cf25adfa5 100644
>>>> --- a/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>>>> +++ b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>>>> @@ -105,6 +105,51 @@ properties:
>>>>          Restricts the UFS controller to rate-a or rate-b for both TX and
>>>>          RX directions.
>>>>    
>>>> +  tx-precode-enable-g6:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>> +    oneOf:
>>>> +      - minItems: 2
>>>> +        maxItems: 2
>>>> +      - minItems: 4
>>>> +        maxItems: 4
>>>> +    items:
>>>> +      enum: [0, 1]
>>>> +    description: |
>>>> +      Static TX Precode enable values for HS-G6 only.
>>>> +      Values are specified as per-lane tuples:
>>>> +      <Host_Lane0 Device_Lane0>, [<Host_Lane1 Device_Lane1>].
>>> You need to include them in any of applicable examples, otherwise
>>> nothing here is validated.
>> Hi Krzysztof,
>>
>> Thanks for the review.
>>
>> Since no UFS5-capable SoC binding exists upstream yet (the target SoC is
> I would imagine cover letter or commit msg would briefly mention that.
Thanks for the clarification. Will do.
>
>> still pre-CS), there is no vendor-specific YAML to attach the example to.
>>
>> Is a synthetic example directly in ufs-common.yaml OK to you?
> Skip example in such case.
>
>>> Why values cannot be on or off? Or even better: why you cannot just list
>>> all the lanes which has it enabled, assuming disabled is by default?
>> Thanks for the suggestions.
>>
>> For the "just list enabled lanes" suggestion: precode must be configured
>> independently for the Host-side TX and Device-side TX transceivers within
>> the same physical lane. A lane index list alone cannot capture this
>> two-dimensional per-lane state. The tuple format <Host_LaneN Device_LaneN>
>> is the minimal encoding that covers both.
> Again, why do you need to encode '0'?
The tuple is still needed because Precoding is configured per 
transmitter-receiver pair,
so each lane has two independent states:
- Host_TX -> Device_RX
- Device_TX -> Host_RX
A lane-only enabled list cannot represent directional combinations like 
lane0 =
(on, off) vs (off, on).
>
>> For the "on/off" suggestion: the on/off string pattern is used with
>> single-value properties (e.g. LED default-state) read via
>> of_property_read_string(). I am not aware of precedent for on/off as a
>> string array for per-lane tuples.
> git grep string-array. Plenty of precedents.
I will keep the per-lane tuple model but switch tx-precode-enable-g6 
from 0/1 to
"on"/"off" (string array) in v7.

Thanks,
Can Guo.
>
> Best regards,
> Krzysztof


