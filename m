Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99C4CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 10:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugaYhQMdHgCLc3ycLRJE+Z8L0hEpvpeq9twMKBH/jdM=; b=jRBiBnnfRY1k9chPNsdT/XNePv
	U3UEEue+ksjWGM63Z6R1YavB9siAQecFEQPW9D7OvwOsVQCufWcWco5ReGggCinnpEiuSsh6+632L
	Yrgui4sMHfiISrckxxuuDsPa+NnJWOaw8vxGv90T4Q7kkX79Pk8eAM6q7puEROjOdfnIx9OP1MTqZ
	iCD7Isk75x+JePNZODteqAWzeX8aZAegZi6nJXisr6XajMPcH+RtXHi8VZiLliI8BKKK53ji4WWaF
	mp+uBRCYgwl7kKbM8gVSex6ZXuf1GD+jAx/8+Y4R12FXbhC3K6BpZk0EmrtK6QbKVr6Q8s8aw1LYI
	lOZcf3yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNTlu-00000005GCQ-2tzQ;
	Thu, 14 May 2026 10:58:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNTlr-00000005GBq-1sl7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 10:58:29 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9kAOP2305162
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 10:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ugaYhQMdHgCLc3ycLRJE+Z8L0hEpvpeq9twMKBH/jdM=; b=TfBg2xmAmNv6MCNo
	3ULu9CR4Fl+XS607s+gfLtb0P2kwgxHhbZI/Xt8PrQJHyLHCG/YkcWABtlWJDEd7
	STKXpUYOllfCydBOqNjBeyBDopdbYK5eEIkXbBguUL0QGCN0tB3ehaxmzPzn6ciU
	swp05WR1fTcm89FPZ9VaQtvFslC+PiUBatmncQUbIdzenyp9l5IdNacaI0ahrHt+
	H9UhwXK5pG1riIokxOJabMlJvle+B600rjee9p4UuDih/7tN00aziiUVFAmqq6HB
	F5CUb7z4qB1O0rneqUPEPnJUAwkvYnXiC5MkEdYVDaxM2pxSs5fq49VOnW7leeaS
	l7EpDQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5b0brfbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 10:58:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-90cced2eecaso79297885a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 03:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778756305; x=1779361105; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ugaYhQMdHgCLc3ycLRJE+Z8L0hEpvpeq9twMKBH/jdM=;
        b=KRdpn/2jhF/iDi6KlI9LsvmGAe0YZaPx3FkfXuwJzdd0XAbHgpo2qxe7MBvn5wO/4m
         V9Ht38cv1vqLtgmfEN6heqEGPbS2jrnzsaBQQoItipV20u5RgPqSV0aDRJQCgSy1uxlq
         OELEM8vXRq+yCTPIWNfGuKTYIkCFLiULpK5V09GvP3ZDKf3WE/33AiX+fSCysaZ2KxEL
         4/Hz1LvKFNJyUbpS2idHmmLF4NNTllYXu44VD31PIi/uEl3B7xMHUe7SCQaIHuyTW9oh
         wHiM7FFk32tsdsqt/9EtbJhqZOtB4PusafJufxoK74VJUG6kVaS0SD4v8+dmQTnjTc5O
         1hWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778756305; x=1779361105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugaYhQMdHgCLc3ycLRJE+Z8L0hEpvpeq9twMKBH/jdM=;
        b=aP877E6YTo5jZ4oXGQYc43McLQxjmy1QXHMcfiM7Jptrb/a72MJpVp6MWJxMp3QceU
         5RkXF91F3E8+U4hxIeA38eQa6H8OZFRVGasVDJfHEM9ATr5iGaOGGdwEu8h9/DJJxkQa
         jDgwc9IaNptife2m7HtbQYJ9dThydmp8DOeWKIpMcy7t6kMbCFamwz1zgrePrTeIwa1A
         7JE3oxk0w00OnyyAMU18evbPf/NV3cH/TigNfREk/NSlCr9DFFHbW3RyPqw5uIcEpnXi
         Tio6/5mDs9aywQ8R3Fbwnnfd4EJ90d9GYsvaHxhQsXYDGefUTbxU6W/meNkfonvBBZQJ
         oAEA==
X-Forwarded-Encrypted: i=1; AFNElJ8MBWZ3oU5zOlPzw872PNq9+7I0u58jDLvVEZSe2S7PxM1+baVp+w89FSjkyrFoR0rS6+9nsC/l8wG0RG9a7O/k@lists.infradead.org
X-Gm-Message-State: AOJu0YxcNsRdqinblRF2d549qoYIr0rw9c1H2xipjOOmAynCI6Cyp3lS
	n6x63+Kr9nCSJBaFgHP4w6P39qVy/1PpzoO6QNVGKRGbTRscnM8lALokVrcdwDMRljbgxgvO5Up
	9DouySji3mkU+10u5wkawjOj3/4Zp3gm2b+VstP2A7IwLqxckQILCficcRWkol4NIX5G1SWrxSx
	TS+A==
X-Gm-Gg: Acq92OHguDSg3r4KMc5/CpBjIIeX2W1blxhnAR0a2jgi5Roc5o/jFC6LGBPcHKlb2L8
	GJc0DENGPJGYixNYZKkfr/5In+xrPwo/SjJ2bCtq6rZop/fYiwKQ/RyTOpewf3yhs01bonImPsC
	hSHkezXmH9sF8KOUjjtr1q8XiVAkOe1VdXe+52pt5lQ17pzlZc7nybbjYZ9zeoh9VEaAU3XIAJz
	+TlBAs1m5I/sIcwn8TFJfJjRMylWsar6aeSwQSJ5t6v/2dv7yQB7MXylJyvOq3/9qrhi9nvpP/z
	t5+Z28MQxZdhEOQtQbnSBMsmJK00RJTuv2klQGa0IFmn2TyD74SWmNrOVR2QHoJi1zRpLGlC/wq
	1JD6ilq84cSL2UNnItYR4+7CNwtmqJmxKhi1b+sbJkzrR9Hntj/zlU1xWl72GbCslfV7LEapuxp
	hjcO0=
X-Received: by 2002:a05:622a:156:b0:509:39b5:a977 with SMTP id d75a77b69052e-5162f64a2b5mr72360071cf.5.1778756305317;
        Thu, 14 May 2026 03:58:25 -0700 (PDT)
X-Received: by 2002:a05:622a:156:b0:509:39b5:a977 with SMTP id d75a77b69052e-5162f64a2b5mr72359701cf.5.1778756304841;
        Thu, 14 May 2026 03:58:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b3e8e5sm612419a12.4.2026.05.14.03.58.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 03:58:23 -0700 (PDT)
Message-ID: <c892df0c-1fb1-4cb5-ba17-4b75aa52b214@oss.qualcomm.com>
Date: Thu, 14 May 2026 12:58:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: msm8916-alcatel-idol347: Fix sn3190
 shutdown GPIO polarity
To: Jun Yan <jerrysteve1101@gmail.com>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vincent Knecht <vincent.knecht@mailoo.org>, Grant Feng <von81@163.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Romain Perier <romain.perier@gmail.com>,
        Paul Barker <paul.barker@sancloud.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Robert Marko <robert.marko@sartura.hr>
Cc: Pavel Machek <pavel@ucw.cz>, Krzysztof Kozlowski <krzk@kernel.org>,
        Jesper Nilsson <jesper.nilsson@axis.com>,
        Peter Rosin <peda@axentia.se>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260508152435.21389-1-jerrysteve1101@gmail.com>
 <20260508152435.21389-4-jerrysteve1101@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508152435.21389-4-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwOSBTYWx0ZWRfX/vzPfN1nSoFq
 rSDJVuK2oFCVRVZo5poxBov5Ps+8Gll9r2zatvWQY4p/o9GzXqUs0ImU1VBZIJ8Ti7Vx1kq/L6j
 ZPNlCgXRf+2/2DMI1pQuDBR6K/kyO3IHCvEU+YfD9axLM77Y13q5kcCFuOaOYzlmOX7XT2ocgfU
 Do2IvNW/eZUihy6x6fHMWPKXDCy0XuFx4COO5ZSefImaPV7R3Oo05Jm5Cuo9LYLG4OJC8RZst7u
 1g3n4Urwe6Kkwa7/S9sfDiU8n4S6xW6H7pZZu/ayTX4VUn4wr7DgKddRHXbry9r8ESCsig21AgK
 ds0nDqYxL2mTNo6bQujcHZX2xQlw4BhHt1E6o3amgJemDo/vPGc+0RX6UmDQO3jjjB9PJF4c0CN
 ix/AyRCGpA8rlkUDEBwebdMiRkAkY2fzfhUyUKvRwtiD1iSO8P30fRw9cAfKjxiZE/a3lPePwM8
 YAjFIjDFawOdhTsAmIg==
X-Authority-Analysis: v=2.4 cv=b+2CJNGx c=1 sm=1 tr=0 ts=6a05aad2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Ffu13P_rAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ZVWV2uAXYixwFVVeF7MA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=PkESTBlHdS-WH8rZy7fl:22
X-Proofpoint-GUID: cfIgN2jZ18JBT8lD_3qwa4eC73pT-nxa
X-Proofpoint-ORIG-GUID: cfIgN2jZ18JBT8lD_3qwa4eC73pT-nxa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_035827_616571_2A836DAF 
X-CRM114-Status: GOOD (  11.63  )
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

On 5/8/26 5:24 PM, Jun Yan wrote:
> The sn3190 shutdown pin is active-low [1]. Correct the GPIO flags
> from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW to match the hardware.
> 
> [1] https://lumissil.com/assets/pdf/core/IS31FL3190_DS.pdf
> 
> Fixes: 1c8cc183d070 ("arm64: dts: qcom: msm8916-alcatel-idol347: add LED indicator")
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---

Assuming you get the other backwards compat pieces in:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

