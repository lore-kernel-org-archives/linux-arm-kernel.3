Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FEFCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 13:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHd/seu6GWeewtLPWuKEX1k3PpnC+gd0X961ojf5+Tc=; b=HKgguryqncAn7QDgFukqL3GPz/
	+WOw5l8gAKak2yQovYA+WTjeo0s/fSO41kFxK8gL0UzVlvBi3kwAodnCZBxUV/B0tfRcTXBIjaGUv
	+oYJH1Q66jdsEkpgslUV7LmztxiZh9mpC/Bv1WtlN/XaVCvOMM4E75IGG1DuekKyPYn1OSUMni6zE
	uKBN5cz9TLZuZk/7wZj2wxx5EBNjA8vpSfUVCIsLWRuljsHiHVJAwIAkZKP7KihHRgM+PnDO8qtPJ
	ZbauG4f5a1gO7cp0zEgy2DxnkS0a3VX0AVmtNgOfVgqb6FhgGcc/z3OB5E8tSxrfFk5z2Plgu1OAl
	4swc799g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKtC-00000001jN2-0YT0;
	Tue, 19 May 2026 13:53:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKt9-00000001jMU-2dQt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 13:53:40 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JCa5D91396708
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SHd/seu6GWeewtLPWuKEX1k3PpnC+gd0X961ojf5+Tc=; b=XBxhJYGQgHoNEFMl
	89KArmF0aZ/h9a2LoUeXhUrYySj9Y1oaF8J8BR7JC1ZWz8QTTHnSksW4EhBh4Jbx
	9OTdEZVwd735yccEBgkFaekYCtS0lESzk8YcOQAQsC/9J39+sSF5e87uI8Wwjj57
	weG/UlD/ZpTD8XudL+6M8ErVvAKzawCgqfi0PMvU7lFe+4+Av3jE/+PvpdH6A6Ce
	IQvAM7Sw8DTDoG63APSaxxA0faWxLTZU7ywBpi8xuezyMq9ggYz3s496JfVfVwsH
	QEchz1Y19grGgFYd87dOHI+0Ji4EMTLBAFW4t5lm/yMpWafVph5RTGdfcZiU5X1J
	Lvag9g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8r0q0axv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:53:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3663d5e9bf4so3153602a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 06:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779198818; x=1779803618; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SHd/seu6GWeewtLPWuKEX1k3PpnC+gd0X961ojf5+Tc=;
        b=EHQf5AW+ESt95Ysfi7P2o7E2NEDR5RxVtd5ZWX+ISKZTiaoY8wtFauvnzHU0b/trpC
         lYO2PtYLrUW6FNz+RRfXZ0idPZ4fkYQxmYlaG/V0NCV8u8z96zxgPBbfnE9Lw2OsJIJw
         P3GUS2b9iCkY36AXrnSL44zx/dfcMZx3vHljerWfZg4WvAgOLXtlx+bhMOdqXBJzeHtA
         +oAirFEq/DXImMk44b3tWxJpIx5hBmS3EGeYo6AfysGsgClYLpfNQNJDz68Yt7MKN3gY
         1+29jqg+UVXifBTyOZpWAJaADTxskMJ2ka8O/r4QrZZmIJnpojStemd1mqeoYL7UWs4Y
         0YTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779198818; x=1779803618;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SHd/seu6GWeewtLPWuKEX1k3PpnC+gd0X961ojf5+Tc=;
        b=TKZzhIBlR9wsgtIU2liSvbD3dBT9b0ZwxQ5u4snH1RD4c6Cl7pNPPGBoQaFKDSopSA
         7YKIc2C9EVfd7DEdjfzmMew4mrDIlfUmNn4mgtF6O0Hg7D4Q2rtCyZ9+7FyTJeAAQ0/Y
         iDRQeWLEPlV1pea++2KJUQqay+qh2V4SI+YPIrwhSItG+Bl5Ueuted0kNDMKaUdcEswY
         4GFZ8so5N6Di0JRY1VY81/AHTrynxBtTjCiO5gABA0x330NQJQXEOvVLYIGoEbVCJFtq
         rpB61OixA9Ocb2QB7QIVQei1mbbwjJkLGc4iOKO1dl9vYgJysoqBa5kdg66LggF6qv5v
         PvGQ==
X-Forwarded-Encrypted: i=1; AFNElJ9atCiP6uvyQZY6P/mWaioDJ0xBa1aFqZlEGIivXAXAMkD57RHP9MlzcnLW9gPDU4XwZSTMzNPha2krOgnMj7kH@lists.infradead.org
X-Gm-Message-State: AOJu0YzVdnZaIx+k6HzdnQhFNjeuyV0kvaEywEGXoqWlyMxW8LwYsdl7
	IiYm8ohrMx1mqfscqVgSZg47xuvXSbS1CHrfaa1VVfOag35fNyYqmtq3EWVBo9Kz1EjOaLBjLh0
	4Lmy0Y2Ot2G+0lCFOCK6NA076N8lwevaE2XMJAjUJmRjS9XZ0LEGr/9HNwGmWicjY4OY2Zpx5rT
	fdeg==
X-Gm-Gg: Acq92OGp0HAtIEXtqNYXUbYYKajn/Pwt71S8dD1rXLBpMlnsDe9ZFovgRcCtVRKvWWx
	++xypC/QG/YCgJtgQ8/JS4VvcwT0YxLavgJy8e+J9w5yRCWsXaFYYnbUHnnUKWR782wUKn5kBS5
	exvtqOqbXdyw1VWdWESDLfx0Wial3Lihc7IOedecrL43CbeK/J9/Fy/WIZ9/C1taJJKOuIoViXj
	xSgjuMVuSbX30O9U3y7+OowXAF8TNa49eN7JIB14k9jzykLQYWGyVSsoy73w+mM45zByCL775Cg
	q8IyEdNt5HVePHkkl9z0C9akAmIh/RIaAqMG8Qr0c0rD8U6tB0axZnldvgb5C3ynLmk573bOk14
	yUKyA6aWP3tJmYONdElw+QrLuetUOPMIwv2sYwObLS0NpXmY1
X-Received: by 2002:a17:90b:3505:b0:368:9da3:c496 with SMTP id 98e67ed59e1d1-36951ca7638mr19545333a91.24.1779198817947;
        Tue, 19 May 2026 06:53:37 -0700 (PDT)
X-Received: by 2002:a17:90b:3505:b0:368:9da3:c496 with SMTP id 98e67ed59e1d1-36951ca7638mr19545289a91.24.1779198817413;
        Tue, 19 May 2026 06:53:37 -0700 (PDT)
Received: from [10.219.56.98] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369c4bb4d4dsm3568780a91.1.2026.05.19.06.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 06:53:37 -0700 (PDT)
Message-ID: <a437f9f9-3560-40f8-85ea-35433e33c428@oss.qualcomm.com>
Date: Tue, 19 May 2026 19:23:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: iommu: arm,smmu: Document optional
 interconnects property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260516-smmu_interconnect_addition-v1-0-f889d933f5c1@oss.qualcomm.com>
 <20260516-smmu_interconnect_addition-v1-1-f889d933f5c1@oss.qualcomm.com>
 <20260518-mellow-robust-caterpillar-93fcaa@quoll>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <20260518-mellow-robust-caterpillar-93fcaa@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzNyBTYWx0ZWRfX3N9mXVdxePiZ
 gj/BIFQ+G2YftYhz7Sne5h6M64W4lbz6gRKdqWieEtMYJXLV+YJLw7w/Et66dtBdXm3MkVQUL+M
 v8gOomFPzFapnZhKQXLeM4f44EJHXvTre52OVMiONRm8K5SC5jAXugm75HccnTpRP8OzrJTIfnh
 9JHG/90Qjg3FTwlNq5rzstXTXr90Ucg65upclazgL0Zlm8a4hXqXz8j7AbQzRs8oeobtv0fau9l
 HWmrLEoq+Q9QOuVXJGUbAva1jdhLiAwTNba6gPbovSbk1rY7K3o3UbKfR/QGukBWTKgxTmomGVM
 vEVQ70zzAoK53sSPQBys0nnnOS0aZuAk0Qrw/J5vn2YeBEPDQYqpVa6IHuswQ7q84e+ea9Z71ou
 8q5AgpT10NzsWoHwWG9Ryfk+AqFrOtRhce6TPAlSTq3vkPdqpyKpNgWR4UIMYFk7+n3Lo2O68xl
 n/zfuRmkCuDPoAQORvA==
X-Proofpoint-GUID: 7ClvCHKsxjD00qVP2XuGIRg4b4Os-VNr
X-Authority-Analysis: v=2.4 cv=Q6/iJY2a c=1 sm=1 tr=0 ts=6a0c6b62 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=E2rNws97cCCTNOQwQB8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 7ClvCHKsxjD00qVP2XuGIRg4b4Os-VNr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_065339_695406_EE640FFF 
X-CRM114-Status: GOOD (  22.19  )
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



On 5/18/2026 6:03 PM, Krzysztof Kozlowski wrote:
> On Sat, May 16, 2026 at 06:04:03PM +0530, Bibek Kumar Patro wrote:
>> Some SoC implementations require a bandwidth vote on an interconnect
> 
> Then this should be disallowed for other devices in "allOf:".
> 

As of now, we still are checking which all SoCs do not need this 
interconnects field. So would we need to add the allOf here for now?

>> path before the SMMU register space is accessible. Add the optional
>> 'interconnects' property to the binding to allow platform DT nodes
>> to describe this path.
>>
>> The arm-smmu driver uses these properties to vote for bandwidth before
>> accessing any SMMU registers and releases the vote on runtime suspend.
>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index 06fb5c8e7547cb7a92823adc2772b94f747376a6..5cbf944f2d3e178b3723d4dbaa19ee0d33446979 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -243,6 +243,15 @@ properties:
>>       minItems: 1
>>       maxItems: 3
>>   
>> +  interconnects:
>> +    maxItems: 1
>> +    description:
>> +      Optional interconnect path to the SMMU register space. On some SoCs
>> +      the SMMU registers are only accessible after a bandwidth vote has been
> 
> Drivers are irrelevant here, drop. Also first sentence is redundant.
> Schema says what is and what is not optional.
> 

Sure, got it. I will remove the "driver" quotation and "optional"
wording from both binding description and commit text.

Thanks & regards,
Bibek

> Best regards,
> Krzysztof
> 


