Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C607106ACCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 16:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1pAuYDK8sre9nhu6GxcwknUeONHyMaKI9ugJiqJNXA=; b=O4NzucgUrmB5QwcBu05ISoYmOR
	IG92cIrxTVWyihjaO9y56pfMnh0w+XeBdGGv+pExdCZli/WSpitx6DKlOfCyvFROpQpHQToSd6211
	4QT0cYRhyEKExoqve5QaqoCzKNFIb5VU1Mn/3+BEpWnAqwQOKVBUGdR2tqKkq+9KsPtQsUnIs7VZa
	Ocy0sF0kFhvilE/C8la2dMGR0lWgLDKRneNLhn70dtQC0vozKU5X47k/keYEdwT4lrXaikI2viWIW
	j3x9EBZ5OR0SdG98EDJ61pqudR9moAhXkzgRRWTK3IDQokKq4gS3EaQoh9e5ke5fKI2xd2F4u8VnM
	Wi84CdVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iuk-0000000EYL5-059B;
	Thu, 12 Mar 2026 16:29:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iuh-0000000EYKK-1spI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 16:29:32 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CA4lro1756251
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 16:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z1pAuYDK8sre9nhu6GxcwknUeONHyMaKI9ugJiqJNXA=; b=pudbPVFV0/hXzm3n
	JNYF1RDINA8xCAOMBHUbxF5PHAqERkuY8xxN260r+gJl+cswCNtAUkHrnuQnjq9g
	rLWy+pqXcZctLV+VcBy1jcdzaRHlsod8TBMC9v715Kn58+Fk1QCTd48YdMy99dY1
	BtY7DET58QNbUF28ixDJ/zXtLCE9CvFrmy0x0sz8V5ZhitvwREyTapjbJ1UGidrs
	YHQf64blDjaL7d7nVUwg1SD0XWb4bsB0g4InLoc+NeDvpS4tz9g6qGrXZt3jNITk
	MawKJ7mCIiSPAPNjs/YWSP2CoO5ANKLsFjL2Rxrr+hpuniBaqttnyJblebhNuTeB
	wVt5Xg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh53jsxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 16:29:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd77bc8186so1129483985a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 09:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773332969; x=1773937769; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z1pAuYDK8sre9nhu6GxcwknUeONHyMaKI9ugJiqJNXA=;
        b=YzIN112hjGb05KlRL8b/0IWVk/cng9hgBvSmQFgMcTuVK7aQeJ3Qw9RWrlafHLB+dE
         PFcqoxycicXFolZNFj/vfZKekl/OnE5+1dMOLZK2QYR9UFbCtnIEafYs5/VMFDibX0cU
         4t868NXkZI1WxjPuGDO/WObLP9laF+x2VvNu0qD0usgApA/tAmhcSeXwU7Yv4e+lRdM6
         8VhK8kCmz4wiPZRpKQouR8SwOlc4NO3JDTpQdRyEJjZGroAGFOuOLJqBhVTxHD9dXZ4J
         T9Hz5oOe6/xqlb0f87jUg6nseVUPqBRGdkoeKbh9FZbSEoDytbX3nX4bJUlspCaWVeMX
         NrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773332969; x=1773937769;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1pAuYDK8sre9nhu6GxcwknUeONHyMaKI9ugJiqJNXA=;
        b=kjpsONF3WeMCChGTeThSCN4ro325MK1jDdsDKNpio+312cPQmqwRFNQe3Zh/7r/c4C
         rl/IF+Mu9RmgxRYDwp7rsvHNJ5j90jphYM8T2umX+H/9VdLNTNNJFJVuYG6Y24S/8piv
         GuZKEp/oLgmwi24o6np++6vRQ4v4YiyeREjvCABdeVE5n3RZiZ1oVoJMoJ14CJLRkVgr
         y+TqRqywILn7H1B4tw3WliogieN6XLJIFa5GZODYgk+A44kQ08CNoSCOSEdCKTQkdDvL
         LBOo/hdGnFTrOUQzfsRTaPmWQPU8Hzzf2u5ISu/0V65Ju+/lGcp2Gz00mBas77g/pky0
         ZE2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVqTqBGba+AqLDlnuBKyWWNPoM/5m+Teoa/KvlWk7YPO503U5+Z24QSUJdjuv6bXTGWSPDsoEmP/P6PUqvwPJGA@lists.infradead.org
X-Gm-Message-State: AOJu0YzKyvFr8f4T6g5KqgKltoNMy0VylHpIduzpQHlkkCOOOI7zIO9Y
	CmuzOb8zbU9iGkRbJ7VhUrRRw/WsTpI8AuGRDOzq3ARmbcn+7XrxTN32uIUmJJSjNkxskBnXnFb
	HT2HVVzOrQUk+vM7cbCYyOdbzMFs2qh9z3sbYE4ct8YxhyP++oiZp59ss6hxnHQkq+XJezkMmYW
	KTcg==
X-Gm-Gg: ATEYQzzIF7CfmRGgm/XwRYd3rUgBV1X6/PIxlqJrNuRU5OvPHPxzetpcRXcFnR2qZ27
	xHNOJ+rndQwa7Mb/HXAppqGbp/bUkS+Y2I887laGi4EbrmrSWEHgxYwZvd9vYCx56szmhTbQIht
	SUfo6mf6TO+ixtceIzJkAUNM7+bfs1+xfctRCcXDQyKz4DUGoHMKvlfHh8Si/RE9tWyg4hGU9d9
	wcMD1cG/dIwM5S1Pyvm5MVOvIuhDahH1Sdh3eUELMSrw5MmRvKsIDoP8pHAT8DcOo5KpYMbIPaD
	zt9wEKeu/1PTdTHNk36usb15HLcPg1NzflZaEZWZZARULPB8WQRyKcmDzfmx43AXhmdsGeu/oci
	yPaDvFeQ0rwm8u6FjOrIXzRVHpOAqjiLUiaqUZC9Zu1lfW9Ti
X-Received: by 2002:a05:620a:2981:b0:8cd:98c1:762e with SMTP id af79cd13be357-8cdb5bb0b34mr40581185a.63.1773332969205;
        Thu, 12 Mar 2026 09:29:29 -0700 (PDT)
X-Received: by 2002:a05:620a:2981:b0:8cd:98c1:762e with SMTP id af79cd13be357-8cdb5bb0b34mr40575185a.63.1773332968636;
        Thu, 12 Mar 2026 09:29:28 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe23afc5sm10571864f8f.39.2026.03.12.09.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 09:29:27 -0700 (PDT)
Message-ID: <800fc82c-1b2f-4330-9a25-e1d067dc83ac@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 17:29:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: PCI: fsl,imx6q-pcie: Switch to
 undeprecated reset-gpios
To: Sherry Sun <sherry.sun@nxp.com>, Hongxing Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>
References: <20260311154955.145120-3-krzysztof.kozlowski@oss.qualcomm.com>
 <VI0PR04MB12114361EE728C74CEE500FED9244A@VI0PR04MB12114.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <VI0PR04MB12114361EE728C74CEE500FED9244A@VI0PR04MB12114.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZN/aWH7b c=1 sm=1 tr=0 ts=69b2e9ea cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=fcfTcuGm4GDwl_1-7aMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEzMyBTYWx0ZWRfX6rtJhC1HUv3N
 eE1eW64fxd5/T9KTndgQw81B6ZFX5NhaBUdljs246E9PreNCxqIYKw6+2PRCvrpe5YEgA8tb/lc
 n1Uw4D4voCGTccYQqMVeKXdHcb/8B75ica7K/QGldf0D4R+gs5w5b6WajKgb3wUAtInxnLTfF/o
 J8SCchlzmgT5RIPNrM9+EPpfTX2XvquMBaATcjuDqIFGM2N0L+22mYr13KJ9+k/XbJymAhBYobj
 enj2TLGkzullIu4QGyFT13n8EF/wBSA4qRgBJv+VbfL2+Y4rC3LhZgbT0OvrOulxboQ2flYsejG
 aJjbhRKv8H0hJUHkA9/ClT6NbWNz+RKiZhAKMd2RWsJ+FZ1Gc+mETiDDnETZyRlATuwb8xLsbYi
 DDVN0vE8ab71NT9XhDrXdDHuJvJ1n/sOj0VxlK22TG2IWFK/RHULwAN+B1HAANV1dUO2ESZQ9/I
 jNe4qC8puveX4oYa/uA==
X-Proofpoint-GUID: _scKJUjNWOJb0iF709cwPHSeXnNPmd__
X-Proofpoint-ORIG-GUID: _scKJUjNWOJb0iF709cwPHSeXnNPmd__
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_092931_641230_7096E706 
X-CRM114-Status: GOOD (  19.98  )
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

On 12/03/2026 10:18, Sherry Sun wrote:
>> Subject: [PATCH 1/2] dt-bindings: PCI: fsl,imx6q-pcie: Switch to undeprecated
>> reset-gpios
>>
>> GPIOs with "gpio" suffix were long time ago deprecated, thus "reset-gpios" should
>> be used.  Linux kernel supports both, referenced schema snps,dw-pcie-
>> common.yaml lists both as well and this schema uses
>> unevaluatedProperties:false, thus change has no impact except code readability
>> and removing deprecated patterns.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml | 5 -----
>>  1 file changed, 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
>> b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
>> index 12a01f7a5744..b9ba938c6239 100644
>> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
>> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
>> @@ -58,11 +58,6 @@ properties:
>>        - const: msi
>>        - const: dma
>>
>> -  reset-gpio:
>> -    description: Should specify the GPIO for controlling the PCI bus device
>> -      reset signal. It's not polarity aware and defaults to active-low reset
>> -      sequence (L=reset state, H=operation state) (optional required).
>> -
> 
> Add Dmitry and Bartosz.
> 
> Hi Krzysztof,
> Seems this property is still handled in gpiolib-of.c, see commit b8b80348c57b
> ("gpiolib: of: add polarity quirk for Freescale PCIe controller").
> Maybe need to change the quirk gpio_propname here too.

Oh, I missed that completely. Thanks for mentioning it.

1. Having this property in drivers/gpio/gpiolib-of.c means we should
keep it in the schema as deprecated, because each ABI should be documented.

2. I can drop reset-gpio-active-high from DTS as well, because
reset-gpios have proper flag.

3. We don't need to update gpiolib-of.c, because standard flag from
reset-gpios will be used.

> 
> 
>>    reset-gpio-active-high:
>>      description: If present then the reset sequence using the GPIO
>>        specified in the "reset-gpio" property is reversed (H=reset state,
> 
>  Also change the "reset-gpio" to "reset-gpios" in this description.
> 

Also here - no need to update, because this will be used only for
reset-gpio.


Best regards,
Krzysztof

