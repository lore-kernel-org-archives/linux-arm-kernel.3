Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC687CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 13:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyfGzEjL9T0vealm6OZP5o97m37ViNP+EY8gC06YbN0=; b=jUpJMcKZAT9YMl207KBJ+7uZ0w
	q4AsAQ0TalpOLNhymw9lUpapM+wjbq118lAZ09nmTkj29c0i87bwv8illJDaSw3YalI2S5M8BJB+o
	HCYJopRbTWpPuwixukPQfxsk7iMzmkaLOGibxKZPIeaHTl7VE26wCdcbueLtDsJSyqOwc/ke+hLx5
	/Soqq6cqiy54QtgT+CQJ0sX61GgeHpjjJbb/A/dK/q0Qn8YD73JekojtngxhK94qs07i8B/HLzoTg
	LYTeRbKPTn4vmaO362yYVYTa5VcOJXNfrymZtyBknUUx4Or+/YuKLVYyCahvVKTmSzhhE8Uuotshv
	5XHcUx+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKCO-00000008mOw-25tq;
	Sat, 30 May 2026 13:58:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKCL-00000008mNg-3cHl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 13:57:59 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64U2XqhX1401112
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 13:57:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wyfGzEjL9T0vealm6OZP5o97m37ViNP+EY8gC06YbN0=; b=bzxEthrpwQ2pHhnC
	mXbdLD543QfAL0YPQACuqoLErzbiPmGmLK1F83dQzicPXablwtcUpB0CmOzQ4/Ej
	/o85P/EnhUT5Jr72fA92EBsbLovboI69RstSVEjSaYjawP5owiUfpEqtVP3itFkT
	bwBpdTqIm/sCLD+ffq0iAdOe4fjaOmdL6j6iGg3NZAgKGtvVQ0GQxgd++r2ArBKY
	Uu6FNeoStb52siXH9bVGNIGAltQwkfIIjzwD+Sdr63BrQtsanHiQEoi9AEA1OP9H
	5AxM50aPa4JS8+ibUZgElClEFOpcel7BFu9ssKSsSfgRmMGN/zMl7yJEcWhpTRs7
	TjYPAA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efq7f96ng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 13:57:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36781927b4dso9793501a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 06:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780149475; x=1780754275; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wyfGzEjL9T0vealm6OZP5o97m37ViNP+EY8gC06YbN0=;
        b=JU/ydrsbdSOrzp0V5SN8nvtNrlN2ngGxd1kE/cwnuBsnCgBWLZkzQBHvCZlsKtV92W
         cuw4Wj5QvG6QcJIMojOdrusWB7nx1mYLWQrCGP7RSNlBRSiclwJcMF12Fuh2u80PWEDT
         nGPiu5tja4stmv34Y9IsRW9HxjiCWlR0DJDTfb1YE+5kKtBA6r3rDP1LLK/fCsYCs52E
         IdlrGzCltOhiU+KLi4msHkEZja0rikUU8Uiv/4WtQHZfRyFrbX5WpCngUxrZOD9cNfgo
         hUsGcDCZ0GeQoQglIaU83oPD8kDfNPVtcbbjTt6XryI03/PLQzV7M2EQoSpsq/TTTbCi
         CmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780149475; x=1780754275;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wyfGzEjL9T0vealm6OZP5o97m37ViNP+EY8gC06YbN0=;
        b=KTFLKrc6S2uyNLNiq8sI1daAkB60hwjCl87LTmX5HRY6NvSLephkvc4b4DiknjK/Rm
         VsiPL3RPX1kFEDiCFVyr00vMWUq+PwMHHdWjYX4N1PX2pcLkS44UyzQx9KkgXsQtjul+
         2VKTw4YbT78hCs3iSTYPCAcISSHELKuJcdxg6qGC/y64THbR0FTRWG8Mm/ki+ChlvZ1C
         SSFLT21hGNK4fsw0XKdz3019NyFXTTgdmmoM9BI9pN3zo6nuzOLlri/LMkiIwsHVFJrB
         D36Ts/SOt7Aepn8/9T6iKfqQrKkU+SPZoFhwdBIvDGEJHsbgboNlNXICNrIlj7ohsLaZ
         4qAQ==
X-Forwarded-Encrypted: i=1; AFNElJ915Wr7mNLXGwxhp2On+dQrJQL+NBBJpeBW+2LC0gcfBqtrDz1EelGU1TUFEWd43S+glMdutpQCpnP7Lgpc3iaV@lists.infradead.org
X-Gm-Message-State: AOJu0YxNhk6Go/Na5vXKivsA4E5ZOCOPeYCFY6EMlkDsg6Yl6oEprwZC
	0HUEDNId+pZNGfLE4u1JRaOug+ty05OMOLvKdOk6RxEybQY+AiF35WNwYMedHx8pmmOAPHsllLR
	IJetTvRQKLmt0Duo9HHvSdffEXL3Cjs/aqjgfnPT9QSUSW5fNW4ZMY0Cvgb4wFg4mb1Rv8uhyOh
	DSRg==
X-Gm-Gg: Acq92OGSevF3YTyx8bI2oZSXE/mH+SuwktyIvd4L0pOL3xzYsck8LbToB6T+R7E9f8d
	x9dqXnQxwmIPkirQWghCPbbyGl8/mFCzRVvc7dv/04KlHi2ZJkmMiLoYJUKmFqYZ3xRbgVYGSvq
	Yzw9VZQb+CPjWdjoq81DkxTyFt3NO3zlzVF763r/ws3r5Cx7QKtAHXn6d2cu7S3Fe9upWZxgyg9
	vDq0RWOJyOmVp+v6T69AjfDQsc721Ps6mgewBuBeu/OcEGWl4AtBVAfIuQVWks1uFvGG1wa9xgd
	VJHv3lHFwDhUHlabF+Y2F/9E/b0ll72R9iFhfbU4Ss76ePtQ6vDG72APLKD0+mLWshCGDIsZRSt
	KEVFGj9B7CmwMiRkRLk8Nv6QEc9WzZlx/nOO+yXnZnGGye02Dh6ygJ4KCqTZ4B5m4vmSKVhffXp
	5sG8yDtvNHw3w+VpWFqkQ8
X-Received: by 2002:a17:90b:5704:b0:36b:9c4a:e05d with SMTP id 98e67ed59e1d1-36c501ce691mr3673536a91.17.1780149475473;
        Sat, 30 May 2026 06:57:55 -0700 (PDT)
X-Received: by 2002:a17:90b:5704:b0:36b:9c4a:e05d with SMTP id 98e67ed59e1d1-36c501ce691mr3673524a91.17.1780149474988;
        Sat, 30 May 2026 06:57:54 -0700 (PDT)
Received: from [10.133.33.28] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbffc1879sm5653053a91.5.2026.05.30.06.57.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 06:57:54 -0700 (PDT)
Message-ID: <dff3c74f-0c46-4ac1-914a-9ea8bd40316c@oss.qualcomm.com>
Date: Sat, 30 May 2026 21:57:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: ufs: Document static TX Equalization
 settings properties
From: Can Guo <can.guo@oss.qualcomm.com>
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
Content-Language: en-US
In-Reply-To: <ada65ce2-6736-44fe-9396-d3ed632274ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ENuAb7XThL2ZKhQPwXw7hbUQCZo3LGBc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE1MSBTYWx0ZWRfX729s5YysR6bM
 Q60lwSxQqG+4tPsTudsVwoAwHqCiSsC84LC9dcLluvlRAK1NZNyQaQ9yJuZrIoAoOTz4Dcc4weI
 mYvgXUELVuWVFrG8WAF/VhkSdyB6f/RgTBZ2IEeG/UypYsDp2Lg2WfzWccU1Paae4XB6I6iFBtg
 epMv6qfYCSExH4PT1Z0BkcC0omiPYqIY3kdusN+D0o8AXJrhFqRMCWDuF/TqBJyva+ghZl4StH9
 IQzGz9oeAYWCIMh4v5zUcMzy09ZYMb5ubGEanMcXS1cXYA65wzBfXuLeI3u/LCbHCFNhx0rFL6N
 /gLwlnwIAujXD6VXJkFtYY8de0OfTtihRmZVO9zFIc0TUEPHak/CqfsnYf6JqmzkoTLf0IUB3DM
 Tt0IoNWKCSDQVDI8Iv0zHoi/6aLlIgdAdsNjKjcZXnCsdpNWeHYewov2rQzZmNFkyl1VDE8BABt
 0QW2GkeS4i2Fk75hZAw==
X-Proofpoint-GUID: ENuAb7XThL2ZKhQPwXw7hbUQCZo3LGBc
X-Authority-Analysis: v=2.4 cv=XqzK/1F9 c=1 sm=1 tr=0 ts=6a1aece4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=PY6Zn8H8AAAA:8 a=mpaa-ttXAAAA:8 a=EUspDBNiAAAA:8
 a=LJiSo-RwSUm5TJ8LWggA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=ySS05r0LPNlNiX1MMvNp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605300151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_065758_028036_17CA7CD3 
X-CRM114-Status: GOOD (  25.96  )
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



On 5/30/2026 8:45 PM, Can Guo wrote:
>
>
> On 5/30/2026 12:58 AM, Krzysztof Kozlowski wrote:
>> On Fri, May 29, 2026 at 04:33:37AM -0700, Can Guo wrote:
>>> UFS v5.0/UFSHCI v5.0 add HS-G6 support (46.6 Gbps/lane) via UniPro v3.0
>>> and M-PHY v6.0. In these specs, TX Equalization is defined for all High
>>> Speed Gears (not only HS-G6) to compensate channel loss and improve 
>>> signal
>>> integrity at high speed operation.
>>>
>>> For HS-G6, M-PHY uses PAM4 1b1b line coding, Pre-Coding may also be
>>> required depending on channel characteristics.
>>>
>>> Add vendor-neutral DT properties:
>>>
>>> - patternProperties for txeq-preshoot-g[1-6] and txeq-deemphasis-g[1-6]
>>> - fixed property tx-precode-enable-g6
>>>
>>> Each property is a uint32 array of per-lane tuples:
>>> <Host_Lane0 Device_Lane0>, [<Host_Lane1 Device_Lane1>]
>>>
>>> Accept 2 or 4 values (x1/x2 lane configs). PreShoot and DeEmphasis 
>>> values
>>> are 0..7. Precode enable values are 0/1 and only applicable to HS-G6.
>>>
>>> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
>>> Reviewed-by: Bean Huo <beanhuo@micron.com>
>>> Reviewed-by: Peter Wang <peter.wang@mediatek.com>
>>> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
>>> ---
>>>   .../devicetree/bindings/ufs/ufs-common.yaml   | 45 
>>> +++++++++++++++++++
>>>   1 file changed, 45 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/ufs/ufs-common.yaml 
>>> b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>>> index ed97f5682509..d90cf25adfa5 100644
>>> --- a/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>>> +++ b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>>> @@ -105,6 +105,51 @@ properties:
>>>         Restricts the UFS controller to rate-a or rate-b for both TX 
>>> and
>>>         RX directions.
>>>   +  tx-precode-enable-g6:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +    oneOf:
>>> +      - minItems: 2
>>> +        maxItems: 2
>>> +      - minItems: 4
>>> +        maxItems: 4
>>> +    items:
>>> +      enum: [0, 1]
>>> +    description: |
>>> +      Static TX Precode enable values for HS-G6 only.
>>> +      Values are specified as per-lane tuples:
>>> +      <Host_Lane0 Device_Lane0>, [<Host_Lane1 Device_Lane1>].
>> You need to include them in any of applicable examples, otherwise
>> nothing here is validated.
> Hi Krzysztof,
>
> Thanks for the review.
>
> Since no UFS5-capable SoC binding exists upstream yet (the target SoC is
> still pre-CS), there is no vendor-specific YAML to attach the example to.
>
> Is a synthetic example directly in ufs-common.yaml OK to you?
Let me update qcom,sm8650-ufshc.yaml as it includes sm8650 and others.

Thanks,
Can Guo.
>>
>> Why values cannot be on or off? Or even better: why you cannot just list
>> all the lanes which has it enabled, assuming disabled is by default?
> Thanks for the suggestions.
>
> For the "just list enabled lanes" suggestion: precode must be configured
> independently for the Host-side TX and Device-side TX transceivers within
> the same physical lane. A lane index list alone cannot capture this
> two-dimensional per-lane state. The tuple format <Host_LaneN 
> Device_LaneN>
> is the minimal encoding that covers both.
>
> For the "on/off" suggestion: the on/off string pattern is used with
> single-value properties (e.g. LED default-state) read via
> of_property_read_string(). I am not aware of precedent for on/off as a
> string array for per-lane tuples.
>>
>>> +
>>> +patternProperties:
>>> +  "^txeq-preshoot-g[1-6]$":
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +    oneOf:
>>> +      - minItems: 2
>>> +        maxItems: 2
>>> +      - minItems: 4
>>> +        maxItems: 4
>>> +    items:
>>> +      minimum: 0
>>> +      maximum: 7
>> What is the meaning of values? Nothing here refers to the spec, so is
>> this driver specific?
> These are not driver-specific. PreShoot and DeEmphasis are standard
> features of the MIPI M-PHY / UniPro stack. The range [0, 7] is defined
> in the UniPro specification for the relevant PA layer attributes, and 
> each
> value maps to a specific dB level as defined in the M-PHY specification.
> I will add the value-to-dB mapping table to the property descriptions 
> in v7.
>
> Thanks,
> Can Guo.
>>
>> Best regards,
>> Krzysztof
>>
>


