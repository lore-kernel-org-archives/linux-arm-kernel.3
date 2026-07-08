Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87EEC43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 13:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bAn5oRAOD1QHpE4ls+17l31BEDS3aVXn/PHrM1rmmKA=; b=zOaYlAwSx1+wrm3EP7lNG/oyKo
	DGBWu4PsJyIQ1A9RSDgDwyMh5kHfY8hIj+r6c2dJsrNwdQuE12aFYhxiRsD91MTmCSl71JLrnqEYW
	RPi99Y6Wn820fpaJllwVo3eVTiayC9Js7iOmDw2bzMDSRBqhFqvJVOlGPCV9hV9yfE+aB2nK5fLh7
	2qK89H6+jJmXaa6x9cnpndL/zLOz7il3dOcs9VIsj8l/s3wCaBqln+FtnKdIypexMaDfa/WEYbu5t
	dzxMrLFs/mm3RfQriH8eZaZz49c+KMJ2ldSFCqVCTDKYRbNJRUprkSPfUNTLXKZfQ2T4X+f4oqXUd
	OLd80kFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whSXQ-0000000HD9L-0vvS;
	Wed, 08 Jul 2026 13:42:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whSXO-0000000HD88-0XNZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 13:42:07 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3Vi72667575
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Jul 2026 13:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bAn5oRAOD1QHpE4ls+17l31BEDS3aVXn/PHrM1rmmKA=; b=mqEpa8npHQGKRky4
	U80gPlXm4mghET5zArMq+7DG1VPZLTGiUEl4bjrkCDaiZHZq5crl0ewMo8yj+N33
	LBVfjba4sEO35K8TYrTMIGRmpyYBBKQRt6bWZXXfJMZaEkAPnAmH0ozlthXT9zNe
	DVp8Oi1r8+gwgf6APV5WonRJCBhZ6B9eq5l5MFIbyOtQ3ZTrmqFPjUz/6DvcgfCT
	UL02NTdgZMRKFVn6YwmoAPkPgSi6G1lppx43zdJO/9sxC2SVMHsFSRTVjAVeNa/l
	klcxCn2GGIdZsHcNj/xxvlIvtgRz0/b7siQyu6u2k1jEy7sm5zVWOuJzXRpXQos2
	USBa8A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hgudgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 13:42:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a23afcbso7298591cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 06:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783518124; x=1784122924; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bAn5oRAOD1QHpE4ls+17l31BEDS3aVXn/PHrM1rmmKA=;
        b=RO272RaHHOd3/jvBjTKx2A2jBPwQpbYe6QrrSmujkGg2+uRmlC3ZWMWk4huSti8Z9t
         1dZsHIrsaHY3E1dRG5dUvV5DEiaTde5LWoJB18iykEshry3hKpr5NRY5LG/zE8fhnB8V
         sZNP2u+GQmbklNgdoEP/XodQgluNBbAFkMuAszVgAwe4g+xuFW62RUM+ax1yPO80UAED
         8KggPlCskDp6YoNQAyNwNtMpMHrgA8PMWbdeWDxpDpbMTIIvHshEzo4SJrYlLgR6glnI
         Gr5tec/QOKQqxJuB6WI9O7rE3AejOO6XGOIDJF9jAddYIXq7RKRfYTmwF9Hm9hVxcNyf
         uLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783518124; x=1784122924;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bAn5oRAOD1QHpE4ls+17l31BEDS3aVXn/PHrM1rmmKA=;
        b=nZ3+u9TZc9/T3zftWMiQgmcVk0f+TW/fCmPK2ZqIMIVwP5hzlMiK6BnBj//ez4qYIt
         hHw38fBIUcPMWKpdxfwL1oojvOm3V2gEvFYFd/QQeDesxZSVxjjIvCHmE0GVC15PEDhy
         G4qfkyCwX6JgszjfE4TeFyCFbKS9t+noEa1PHzwAjqq9wCOaqjdarCRqM3P7/vFbLCTY
         ZwANU1rlAglNiktQaSgucNP0QuWmcIptzaq63L8x/TmyVnxJA83nr8dTccTdjn54kG87
         xuDjg/9VPT3BtpYUGTpQXlhinCGiNKwI7gPtsmtgrXBUbSYbo4EhHGjdajOJUjTbvZXn
         OCkQ==
X-Forwarded-Encrypted: i=1; AHgh+RrczCl9PpBhfQmcVlXJpfCcwzMYtJmuECDLO5gwzNlBfkt0hCbL2QKXiH/0/l4529KSFyhEu3UCfMCflxLMLgnl@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/5HTeEjyUiEMtdPpeFKsk+MIlm8rEQyCYelz6HpgfrgyJLZOP
	6hti2+4wEivu0x1HWsoA1zuzELGVbMSkLuiBomP+I7xrTAKxoRIQ1PN7tORxorRif4c+zphAxkn
	HSkW+QVLOgvinN4CF+J82tQkE62o659dpam17VyyIetCm3eJjT48TaZYFx5aYWIumsW14Ygoc95
	eJ6g==
X-Gm-Gg: AfdE7cmj5aKscatFDfB2F8esoD3D9NeckqUlMS5zxFB3N3dUGB4Nf/cB7lFP0u5VAtp
	RKC68iJZeT2HOI4jhfARKn1g48CnACAoRJFZVQoLj0KB4Lcap6YIuDrvPa8nnR7Gz7jVRo5Hm3M
	hWUsPUxHkgLyg6GVfYlIcuqYxZNHcFKCT+YXKqZatDacYAsUt0W74k+kAuAnsHgCOXBMzra5INt
	f7mes3gXebNqhRXnTe2APhZuJelhwlDzx5YzWA28XoKgS8EA44hi16bWOhJTMsxB6p+DdPGtg1V
	iUz/wUvRj87mRCOz0dVK89RKAbZYXSgiALTg4p/9B16FiaYZZLzlL5Iz80ztl5gXlW5PF4q+mFG
	l8K8+IxORGGkE+KnNS/LUr1gaz88PiejW4fZpTtWqUT9oMDD0kBSX4UEe9bK3q4asVRlny2H7TA
	==
X-Received: by 2002:ac8:6f10:0:b0:51a:8c99:1f0d with SMTP id d75a77b69052e-51c8b41eb83mr26572881cf.60.1783518124488;
        Wed, 08 Jul 2026 06:42:04 -0700 (PDT)
X-Received: by 2002:ac8:6f10:0:b0:51a:8c99:1f0d with SMTP id d75a77b69052e-51c8b41eb83mr26571551cf.60.1783518123041;
        Wed, 08 Jul 2026 06:42:03 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:2110:e352:d7b8:8bf2? ([2a05:6e02:1041:c10:2110:e352:d7b8:8bf2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a58853sm48871385e9.1.2026.07.08.06.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 06:42:02 -0700 (PDT)
Message-ID: <713c728a-f68f-41fa-a64b-09ccecef9157@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 15:42:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/8] Add VIM4 MCU/FAN support
To: linux-kernel-dev@aliel.fr, Neil Armstrong <neil.armstrong@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Beniamino Galvani <b.galvani@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
References: <20260702-add-mcu-fan-khadas-vim4-v8-0-244feee91a36@aliel.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260702-add-mcu-fan-khadas-vim4-v8-0-244feee91a36@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Wg0drux9pN6apehc8tdBWvDPrvnUW7J-
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4e53ad cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=J7wINilrcEgEcG5NXz0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Wg0drux9pN6apehc8tdBWvDPrvnUW7J-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEzNCBTYWx0ZWRfX2HOW/Uo8Y4xh
 BG0Pz5I4uicrKXgNGjDNnhfPn45Ch0pAgojIuelJOZDDCY8leacIo3sk1TnTlDYib02Cfk4kL9k
 qf+AUM60RERxjue5EVAmpftFHo0jWEE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEzNCBTYWx0ZWRfX41isnZUh9LWm
 UJMn85cl300BB1lEjrzeHrzV/fOwdoec5/XDlfxCl3JhKQ/bVzfR+ye1Y2guPmhIHYon7FZ48bp
 E/fhqh6gA6t0YDR4wJKiAJNqHWT+vDZn/EqcGa5UCuve+bBi4PkUc0/gWCcXOTUhaYFqadoIuv3
 BUjsXooPrNHcD/yN/P7sWkQp9igN9yPCYz0yCAjklWPof2Cd/ero8XIiRoJie5Zp07raeeBvmX2
 wdvNsj6UrLDOVrJeyQ4oz9gvlG+MakjrPD9Gku9/O0pId5KBcJ0XoRle2DYcE18dZNgSFzhaVpD
 WRgO8PJLKGBrjbuAwFxcFqzW1HOfTCvVxfaSOzTf+vWsVy3shy4sessyXOgaLLl+7cOso25oB8X
 urVgI8t33vtJu/WV+wX7J2/iH/Pvzn1hlrf+N/0QWU4Epj4oS2PXu2wcqBx3i/sEMAgwLZeqlCl
 PCT4rg1jwYu9ciU4aZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_064206_275367_EE2B8734 
X-CRM114-Status: GOOD (  16.36  )
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

On 7/2/26 11:55, Ronald Claveau via B4 Relay wrote:
> The Khadas VIM4 board features a different MCU variant compared to
> previous VIM boards.
> While it shares the same I2C-based communication model,
> it differs in some ways:
> 
>    - A distinct register map with its own volatile/writeable register set
>    - A fan control with 0–100 levels instead of the 0–3 levels previously

That means for a eg. 100 ms polling, the first one takes 10s to reach 
the max speed, while the second takes 300ms, right ?

>    - A fan power supply gated through a regulator
> 
> This series adds support for this new variant by:
> 
>    1. Refactoring the khadas-mcu MFD driver to use per-variant data
>       structures (regmap config, cells, fan platform data),
>       and adding the khadas,vim4-mcu compatible string.
> 
>    2. Extending the fan thermal driver to retrieve the fan register
>       and maximum level from platform_data,
>       and to optionally manage a power regulator for the fan supply.

Through which tree do you expect patch 5/8 to go ?




