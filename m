Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11FFCD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 12:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nin2RexOF9iwnmMuFG61q/RqPczDKVNMSIjMs8/E8aM=; b=mr20meqsc18b10rsF1i0FkQl8J
	2s8sX0IzI9b8adQtNiU0iv/4weFBz3+EKThanLevOdE98oAErPoTyHnwkM59eeMEwVostUzateCS+
	sZFyx86jx/kWaPe3THI450+kdOZ9xCASY7Xb1j2xnxfib0W/RNX4aq97yk55/6Bm637trn+9e6Rgl
	4bvfF0h77va38uv3fSxK01UpMNNAdPIDV+bo4wiFQ2STYn0wErB2WH3UM1DcL66V5HvuIq8MYQn3D
	AuhF3nAb2wzLEU1ZDGmSSe3dUUEga8erDEEhDcfboer3OhuZNRXpzVPL6NytSNeW+6iMnDazC5ZnN
	WNYlfIYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTJ4Z-00000008k8v-3yOp;
	Sat, 30 May 2026 12:45:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTJ4X-00000008k8E-3xzG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 12:45:51 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UBMCZL2754532
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 12:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nin2RexOF9iwnmMuFG61q/RqPczDKVNMSIjMs8/E8aM=; b=miv3gCRaRoUeDlx4
	OD4Yfrm+nG9seA4EnIU3oyzrx1uJQ+nnIM5V/WIDWiLMl6+Gu+Y5hT2PFqrmegKE
	XI+YQ5ooCXc3necMfA1qaCBakIp09err41Ut4jvpHwj/BRf14Hr6BK5+bKJZ/sfJ
	RA7Q6K+OU9wKifPgd5ZXfXBWBQ11FcByjkb7o9LILN9XF2cDbZZvyENjGZvAraga
	ak0SVrS9ABLaxJ3tgkDfhjSceupxqeBkPUoNw0s8dpxShf5TvjYZM4IOHJq1Buz3
	4UncoICJyfDZm4JWlEsQGyZcnhx/BOL/9Z3dpLVJ0leVmZ7UptkpwPRsFT1jy22n
	L84Wiw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efxy7r440-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 12:45:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd6aeb3637so329773565ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 05:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780145146; x=1780749946; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nin2RexOF9iwnmMuFG61q/RqPczDKVNMSIjMs8/E8aM=;
        b=D5xGJ/aI4NvqTZ9i7qNN3NWQhOcYI6niC/8/c7L4w57PM9AO1S92ynU+8tg9dUeNys
         bltn1JXXXa9DylOlb38gxUjopqFEn0TNiKRGJ7nG/JRTR2wfL3FAXUo+oqengotIBj2V
         F07m7zDlgEVDtlaT9ZjVTA+LOkqz4UeOzxjKOnRTseR1zbROu4LxWjClxeiWVjBKD6xF
         +j11a6KQR8EIiO6Sj0pgQ6N9l+odeiym+35mzBg3qSyXNi3QdLUx4UwExqvSyVxcskOl
         opyMk08F11v9heiYbuU72u5wQmI2ujnyb+y96vVfKg01BiPJJISF/G3vB+yyd8l+7429
         kMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780145146; x=1780749946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nin2RexOF9iwnmMuFG61q/RqPczDKVNMSIjMs8/E8aM=;
        b=mWvHpWVv/aDjUKv7wVphSZ170xlTFMcu2oUucTFZlg1A657TpSEfS0jrSiI9naoDRR
         kctYDV+CsfKoTCEesv9koAwLQw/FaqiR67CfhzvhIg/+J4yO5xHDfOLhfNXHR6RdfwHz
         hmr7hYeKPbET4lPO1NWMCjcjF2EYEJagI2iy6GwUGYX5yluYifOa3Ua725soQBkIx+St
         r7Ljwm23sSPzheLDp5zsF00l7RM0Z5PHT4pwg3C3tB4I39eD4diuYCL1APweOcKXR/3W
         GTQPE5hRYCQxnVYElYR8m+s9FDHCTLjqiY1kVczVCjVIL5SMnviEpk8jWXUcBM/0vv1t
         5DMg==
X-Forwarded-Encrypted: i=1; AFNElJ8i1cmDnVmxacTKXQKVsZVaUVPz5drQ4y70omKobpAP9ZVrmBZ+LH0m5kfcwt4gDyiPJDHRBdiq0TkkvAW4EfQW@lists.infradead.org
X-Gm-Message-State: AOJu0YyTGf7bWnFIoQZ8E6xGb9FUyeAnj5hVPvTjBcD/Ua635CTVLMxj
	GeHrmFlRfqr6hAA9vQ91Tw//vWG5wk59V84DCAuX7/ELNSxx3WnjG4HbUsLJiKY5qiQtX9v5YoM
	UZWNJo7v2d/UlGC97l1nOlJLlfEIrcFSK8tnKBVDDLIJEF4dFWZYYIWsjMqWdSkOsAVy5fbqQwM
	7/Xw==
X-Gm-Gg: Acq92OEUuaGEAJVmUIfST3NKb6S7xsMIL8eJQf4ZCJNR3lgBoBIjI5P71pQ508oVnkK
	YOKob+RtSqigQShFh3q2skkWsJcTiwC3J/4cayPPMeEasGYN7YPitdAOnWlc+iDG7EE6o7lthh7
	HEKs1UJNZjpMC666SkjS0sswg1wj90NBeXL1rbizbISSE7Nd+bWKaZ7tBOmC/Zw4/5UE4DL6zSg
	QOvExzHpSgNNBFrIXwhyON6UUZfU/vOxbyq5wNLJyOn7DYkUxi0g/jpZB8ID4CzueFZISLjJXrO
	tX40V2sn5dgl83xNryqUIEsuei4EGmd4L6JSueufHt5LAJi8jrvnfbUkdZ2XmbpTsiQgFK6U+x7
	A6BXCgNWAkePH40StAGc5F3QY7sncPxcXuNCIeeG22Ui/en2bOwJTwaf6D6niDe9RCpx2PG/IMO
	JkqVKP1JOZeJm5N+LzHPaL
X-Received: by 2002:a17:902:cf12:b0:2b0:52b7:e82 with SMTP id d9443c01a7336-2bf367d0043mr46268775ad.16.1780145146410;
        Sat, 30 May 2026 05:45:46 -0700 (PDT)
X-Received: by 2002:a17:902:cf12:b0:2b0:52b7:e82 with SMTP id d9443c01a7336-2bf367d0043mr46268355ad.16.1780145145817;
        Sat, 30 May 2026 05:45:45 -0700 (PDT)
Received: from [10.133.33.28] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e6f57sm49204365ad.13.2026.05.30.05.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 05:45:45 -0700 (PDT)
Message-ID: <ada65ce2-6736-44fe-9396-d3ed632274ce@oss.qualcomm.com>
Date: Sat, 30 May 2026 20:45:27 +0800
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
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <20260529-neat-bright-shellfish-eab5e8@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=POg/P/qC c=1 sm=1 tr=0 ts=6a1adbfb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=PY6Zn8H8AAAA:8 a=mpaa-ttXAAAA:8 a=EUspDBNiAAAA:8
 a=pYZB3BhZI7Cztb0yzh8A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=ySS05r0LPNlNiX1MMvNp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDEzNyBTYWx0ZWRfXxU9Nctb5fKUv
 Sycndj+E748MQs+o8rrzOJY09KcvFc/LOggoiOorjoeNE2rUN6kseWJ5EJFbhhcmnDvAZUFJRwe
 BRWJDKKXeJ/K8kZwnaMIF4VYuNNIbNoj2Q7H9qwtLj3Tju998dxT9KCOaSfA4G6UQ2/8haulvIj
 lKtyvbsAXyT03WYTA0ilHY61ykUnYMudA4fasJpw7pJliGjikuO98vyB0YEJX+1lGimJ4d6YV6X
 h2bKNJU28OBMope+vQ/SXl5TLSNzsPSXtCKWRbKTkohE1QjE8naDh3pVk7BZW3a6Z5FyJYsqUBN
 JWWF+FnqZXVq9o16ksXw0+A90XL5d70XSsZ8QK0pjvG7NXk56ledEni5xoui5EZgLHmqBx6tLYk
 F3g1hVtn58HzAOlh1lN3a0Z2+RGKwmIzHlSo4q62UrFUGLmIx3XGD/Wu82an6hNWuef1FlnyW/i
 mSvF/gd5SJlneT7Q6Iw==
X-Proofpoint-ORIG-GUID: g2-1BcbdQEEOCEDN4xnqfCue6Ufjl4eH
X-Proofpoint-GUID: g2-1BcbdQEEOCEDN4xnqfCue6Ufjl4eH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_054550_024610_19C11A6D 
X-CRM114-Status: GOOD (  23.92  )
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



On 5/30/2026 12:58 AM, Krzysztof Kozlowski wrote:
> On Fri, May 29, 2026 at 04:33:37AM -0700, Can Guo wrote:
>> UFS v5.0/UFSHCI v5.0 add HS-G6 support (46.6 Gbps/lane) via UniPro v3.0
>> and M-PHY v6.0. In these specs, TX Equalization is defined for all High
>> Speed Gears (not only HS-G6) to compensate channel loss and improve signal
>> integrity at high speed operation.
>>
>> For HS-G6, M-PHY uses PAM4 1b1b line coding, Pre-Coding may also be
>> required depending on channel characteristics.
>>
>> Add vendor-neutral DT properties:
>>
>> - patternProperties for txeq-preshoot-g[1-6] and txeq-deemphasis-g[1-6]
>> - fixed property tx-precode-enable-g6
>>
>> Each property is a uint32 array of per-lane tuples:
>> <Host_Lane0 Device_Lane0>, [<Host_Lane1 Device_Lane1>]
>>
>> Accept 2 or 4 values (x1/x2 lane configs). PreShoot and DeEmphasis values
>> are 0..7. Precode enable values are 0/1 and only applicable to HS-G6.
>>
>> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
>> Reviewed-by: Bean Huo <beanhuo@micron.com>
>> Reviewed-by: Peter Wang <peter.wang@mediatek.com>
>> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/ufs/ufs-common.yaml   | 45 +++++++++++++++++++
>>   1 file changed, 45 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/ufs/ufs-common.yaml b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>> index ed97f5682509..d90cf25adfa5 100644
>> --- a/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>> +++ b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>> @@ -105,6 +105,51 @@ properties:
>>         Restricts the UFS controller to rate-a or rate-b for both TX and
>>         RX directions.
>>   
>> +  tx-precode-enable-g6:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    oneOf:
>> +      - minItems: 2
>> +        maxItems: 2
>> +      - minItems: 4
>> +        maxItems: 4
>> +    items:
>> +      enum: [0, 1]
>> +    description: |
>> +      Static TX Precode enable values for HS-G6 only.
>> +      Values are specified as per-lane tuples:
>> +      <Host_Lane0 Device_Lane0>, [<Host_Lane1 Device_Lane1>].
> You need to include them in any of applicable examples, otherwise
> nothing here is validated.
Hi Krzysztof,

Thanks for the review.

Since no UFS5-capable SoC binding exists upstream yet (the target SoC is
still pre-CS), there is no vendor-specific YAML to attach the example to.

Is a synthetic example directly in ufs-common.yaml OK to you?
>
> Why values cannot be on or off? Or even better: why you cannot just list
> all the lanes which has it enabled, assuming disabled is by default?
Thanks for the suggestions.

For the "just list enabled lanes" suggestion: precode must be configured
independently for the Host-side TX and Device-side TX transceivers within
the same physical lane. A lane index list alone cannot capture this
two-dimensional per-lane state. The tuple format <Host_LaneN Device_LaneN>
is the minimal encoding that covers both.

For the "on/off" suggestion: the on/off string pattern is used with
single-value properties (e.g. LED default-state) read via
of_property_read_string(). I am not aware of precedent for on/off as a
string array for per-lane tuples.
>
>> +
>> +patternProperties:
>> +  "^txeq-preshoot-g[1-6]$":
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    oneOf:
>> +      - minItems: 2
>> +        maxItems: 2
>> +      - minItems: 4
>> +        maxItems: 4
>> +    items:
>> +      minimum: 0
>> +      maximum: 7
> What is the meaning of values? Nothing here refers to the spec, so is
> this driver specific?
These are not driver-specific. PreShoot and DeEmphasis are standard
features of the MIPI M-PHY / UniPro stack. The range [0, 7] is defined
in the UniPro specification for the relevant PA layer attributes, and each
value maps to a specific dB level as defined in the M-PHY specification.
I will add the value-to-dB mapping table to the property descriptions in v7.

Thanks,
Can Guo.
>
> Best regards,
> Krzysztof
>


