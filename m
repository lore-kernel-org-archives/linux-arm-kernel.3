Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60125C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6ytuslCG0pq1HL4h8Lyr149/N2ytTGcDm3j8uDWkuQ=; b=quT/cwgQGZSaJ2z05QHrSJNLMZ
	wYfW8/ZyCbbN4xXWDGA3BirCNX32QZIOSxZhwWAwUhWBtI5RoA7CK1dfIl39k3DxjBsF6gqI7TEEG
	CxYleoSqpK0wzkM7HScHpH8kzSUNCxFFFXuEvEoZpo5K19kihkKH+w1R4KO6Yw8EC2ud3rv7fNC0T
	FB8B6L4aRH20BhWYIx/zpit7HwWC5cTzX09rN2K0yhgP9LaEPXYnHhpfvvpIKaNFjOEL2VLhZjgv/
	jAWdPubpJn2iiwpLBQTr+LqJiWG+r5prviuoDnV5OxXIto6RuN/d6X0y5VAnXspXhEiPJq78S0wmh
	0kUVa1uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogZd-00000005CF0-31B5;
	Tue, 28 Jul 2026 12:06:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogZa-00000005CEa-3NTj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 12:06:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBHOmt2367400
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 12:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F6ytuslCG0pq1HL4h8Lyr149/N2ytTGcDm3j8uDWkuQ=; b=MjUUPzTzjv1KiOP6
	Y3by7YgCgd8kY2oL7V+QmWTVqSeey8SNO0gAlL0D+r2X+m03cUtFF8wH8qJxMp73
	BOgG/sEnJeQh8RmX+EkkNVws2rAHTkctc+5K23imjm/XHAuPd8f0N+A6cVYuYwOz
	VXv9j6k/ndmMtliDkCyfDjBC6DTk40SttqSiUH0RUamuKtOxb2bYH7hByMgdhk7Z
	tBt29KUvsN7kepcyh5AFutK7wuA3zP+v9XpB0uL4hiNeiScgN688bb9oFIIafL/e
	qMKZmXn84eTF1q6n35enCul3Vcyx3v9Qx5iV8ODk+nrC9hZw1BVSVl7DmYac8C2k
	omohWw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp8c71j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 12:06:14 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9775a8105d6so42921241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 05:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785240373; x=1785845173; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6ytuslCG0pq1HL4h8Lyr149/N2ytTGcDm3j8uDWkuQ=;
        b=L3DG9J93WT7T7iKOcvlmzfQuMQGWR/ONt9t32ajA/Nl1rqKTgca+SmihjBQzhGsbem
         orjNXM8//cka9bjFEYCTWRLCcJAe0gSQXv1DqfuLdvRWGAgQJD/QAoF2Pmp/ebhQ7prG
         6VTTX+z7+DUeihjtGgL2apXqtfp8fTMYMQZ9c3yL82sXfpCA+VXOCEUx3GDvDSafLBp+
         e/DHeoq7O2GPm13GX1W0nNTZ8JT6UZ/GFuVTVbnvBG28ibZlt3PLZOsl4KS7ewGBnOYo
         4XNUUKXNCtTUKxfTIAK2EUEeOZ6LWQWzkK97JqmuhOEPt6M4Y/Jw0xu9Wp8FO0Jgy+Xc
         lfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785240373; x=1785845173;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F6ytuslCG0pq1HL4h8Lyr149/N2ytTGcDm3j8uDWkuQ=;
        b=Wfiyhumy6z7KS8hnpW7FtmNUdYkGlqi3Qhe8pB57JEakZ2Q5MNz/rnw3Xs4eeVitHS
         xW/4GUzat22Pnzl27Aet6NT02dKzUxA/P1iSM2jnfN3yHq81ZoUG9JEtfeX3Dgd3CJ2R
         bbOAEGB8pxBNKt/6c6IJ229rWP9WBqvs+UMme0HHXsO80kZGLhAHk0jJwZgZt4fBws8B
         K5BRcSm44hTwpZk2YbMGjoFtRq9ihBoPiND/W+i9c8isLOSSYosPOfDEkJnhgoYaNSxt
         Z056LzHYRJ2roP6kK+5bMTrWsf6W8xsRd0GCVuS7Ebqh3xOr8qjkoUUVKra9nxgJoHkh
         k8bg==
X-Forwarded-Encrypted: i=1; AHgh+RooBxTplDV8/lUe/f2UAq/Z6w8jcwU9nRSK8WHlMZUmEym+x04owiqU8CFNx5peBFdP+kQaxnEPk1mH6fao510n@lists.infradead.org
X-Gm-Message-State: AOJu0YwFQ6eJTnTSZ2AARtVRdslzzMIXMS5rA7SkmoItT6gXo7qe88AZ
	jbgUQpGTge2G2D4j1raC/3A6C46+Gw6EYA25SczwhrA32SShShHyWvE9VdiMDjspRQMOZUWj28y
	NXHrfzayeFTgSHTPhRIOHF0fMJlHMidojWYhTrhxe1WgXvaw4lR8JxBbybDr0YnyXkBKBHo2lR1
	Aghg==
X-Gm-Gg: AR+sD10xZkJyfj8IOtFf4MTIfKcy8L74Gs6qU2KxUHQ0+aR5yI+dofs4wga1Ccj2XCA
	/I9yX/V3DUEThgCsgoO3c5amBYpzhVHSfiYk4T/PgVdUSK8Jen8RUSrW4wUj7BQEd9Hq6sPEx9T
	msiCbsM4l+NtmUnCcYHNQxItkQf8Lk1SDVXidxmyqZdztKSiSHVNYr/d3yyqMhckT3fdphLthma
	Vhg8I8nKlThIw/EYQRi2dFsDgQn+OPoNA45jadNh0KWI9iYw1ie8LrwcJj4Tp8rcYRpzribJeOn
	R3goPcNSEHzYEk/7i46sj9sb4ThfhJcfmZVh5ZQDqlhGtvmgB+YoyF1H/yzoX7YrTK1UltUEk5R
	lbBwmPEbPQFdTb61V/6CKlPg0
X-Received: by 2002:a05:6102:a49:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-7549f65b2a2mr308541137.1.1785240372998;
        Tue, 28 Jul 2026 05:06:12 -0700 (PDT)
X-Received: by 2002:a05:6102:a49:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-7549f65b2a2mr308523137.1.1785240372533;
        Tue, 28 Jul 2026 05:06:12 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb51c98c5sm3883878a12.11.2026.07.28.05.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 05:06:11 -0700 (PDT)
Message-ID: <ad142a95-ffcd-46fa-8d55-b3328bc00e20@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 14:06:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: qcs6490-rubikpi3: Add 3.3 V
 output supply
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: Roger Shimizu <rosh@debian.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260723-rubikpi-next-20260615-v2-0-47c5add80114@thundersoft.com>
 <20260723-rubikpi-next-20260615-v2-1-47c5add80114@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-rubikpi-next-20260615-v2-1-47c5add80114@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwNiBTYWx0ZWRfX3uTmysL3VWAL
 6Bz7C0LKtMUu23HzDBNDKTV7u3dMHpJqYM/yc4zRQkrElbuE0Kkgb7VMspbL2CTypqvmP0je1j6
 Q4akjtGgqmzlQSHsV+iZpyG9SJjdu/k=
X-Proofpoint-GUID: NPZGyl5XistdIU73TafqBvTkypIyUPH2
X-Proofpoint-ORIG-GUID: NPZGyl5XistdIU73TafqBvTkypIyUPH2
X-Authority-Analysis: v=2.4 cv=KLJqylFo c=1 sm=1 tr=0 ts=6a689b36 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Wdb1h0LgAAAA:8 a=zsjO2eMJKmvGp5MnGoAA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwNiBTYWx0ZWRfX4RWNnwHBhjzZ
 ZjD/ZT1wqtVk2mPrV1obqbGQMfdyxaLHtfrYAQ+lreOTrXjsvUxoLke0mxlDdNPfa0KknZoPjwY
 T3GATElcLG9nDO4c3qvd8LLIBVB+N/LO1CX9Jy5PeDJdn3+/KMfEfWe/mOKxOnI8hc0wSVT+4fM
 ip+2EZGKWv+H5hrbTRKrP8cyL/RRWGsUvYqOkNF8BRwNknpbhf6z6wiW8g2zkuWuvveTLctizkh
 QhUcGNAaLHZUA+SQdnwsGA+GtxWu0A4exX5wNQoOBosVAIzRYm9LK/SFf+FBzAEh6JJrxF2M/zW
 Jib6cDdnha5nuOJJuMjy6LzbDQKkFJAsOP7GKFuQXhws1vxWsK/ojlkxkkZpQM9Dgcy7MqmTfrq
 6ohmtRcbZJszYNcRzbIHF046Ejs+S6f5JLgeHb8Ns5MEulqcvGGTcc9UBGgbCd5qUgXVsCdLEXu
 alO3BYNGs4sQUthG+9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_050614_848406_9B71825F 
X-CRM114-Status: GOOD (  16.19  )
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

On 7/22/26 6:12 PM, Hongyang Zhao wrote:
> Describe the GPIO-controlled VCC3V3_OUTPUT rail. This board-level rail
> supplies the two camera connectors and the 40-pin expansion header.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
>  .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> index d8a9a7e47bdc..45514918562b 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> @@ -214,6 +214,23 @@ vreg_usbhub_rest_1v8: regulator-usbhub-rest-1v8 {
>  		regulator-boot-on;
>  	};
>  
> +	vreg_vcc3v3_output: regulator-vcc3v3-output {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vcc3v3_output";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 14 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&vcc3v3_output_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-always-on;
> +		regulator-boot-on;

Is it really on by default at boot?

Konrad

