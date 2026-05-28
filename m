Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D551CD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 14:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJ6t2LX8Nf3WHTmQ5lnb3pmaPw0YLr8cKpgF7Dcvu5o=; b=AciWp2j2fNAqCLsL4r0QSsS4dv
	xX+NjhQVnRVrNl5GefKanUWY0zqNTROfljKTDqDbVYnuwZtsFYZVf0akVk90aUzhND1mL3bzZ5tUi
	//6TggJPBsp3FBbfbcJjvjokyrKd5XUk8LSFiynqRqrC3S5RgbBxm9di8XGSZ+jXGuO08cIlow3ZY
	6ohFiu9xzESCl/ueaSijBsdT2xGoNG5+BrY695qSuoA70rEwrTyVDFLodfevyV4KNMfAQ07+Gg8Lr
	gP+W+X2EFhdLUIVLPoEtV+VoeZ3/YaRgZI9363EEGZx67bwiehx2iuYVCwYGefK7HCtHijj/oYUYR
	aKXztiHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSbRq-00000005pJG-3rD5;
	Thu, 28 May 2026 14:10:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSbRo-00000005pIR-1Ndc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 14:10:57 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vRVB4016293
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 14:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iJ6t2LX8Nf3WHTmQ5lnb3pmaPw0YLr8cKpgF7Dcvu5o=; b=D78VVkFjlkuEcyzV
	lA5MQoHG+VL+o//HIRREbJTwdUOSH12gv48aMjCVORR6d88dLvsl3OvOwfBRPrNi
	Q5FA5uGDReErbHRo9RAmcTfVU+qTbRWt3lpZt8WMKkDvHeXKSwtFaV+tGjnthuzQ
	+1eCuA+3k49fs+lXWCknDat69t8FSVMB8OqK50nsgcK2OJWbCiRygTYVD4Pgsnxt
	ZoSlO/awycGLZ505VX2jGI0car+hbc3UlGFUo2X8s7Dd9slO7e7HquBovDRZVSh3
	UosDMuifqT/2UFc4Iu2mf3O08uNizPJUUeh9S6FdRISZY5cByS9PJVh9fIU9QQjF
	5Jtv1A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y5b0q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 14:10:54 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-958a0e94ff9so3634718241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 07:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779977454; x=1780582254; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iJ6t2LX8Nf3WHTmQ5lnb3pmaPw0YLr8cKpgF7Dcvu5o=;
        b=AnhcPXMzIl5i8GMjiIE9QtC861to0PyX1q3t+manmc/84ODXXOIvT5Nimrts35FZjZ
         2b5Ja6LRrOYxqz1YS0FhruDIOS61Cl1MlBCo0R7apwnnK1fH0+nkN93+AAYyxNIf0GdH
         UUMtMib2+d7xhvx9TSFgdcp0vZb1ehFM9/9wDQDQkBEChpFPPnsR1oXqRTiHoE2y2LgC
         eaA8MTC804u66ywhMk2DXI+PmHn7zpffhYROQVPNTTwXoa1w5bNdm3UWbjXvXyPB9reE
         dKyWiEafyJwSzNOSMr/aHYivivX+UbVTBCuSclzuta3bYU5u/gAhRrMaGgXt4danNgFj
         TUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779977454; x=1780582254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJ6t2LX8Nf3WHTmQ5lnb3pmaPw0YLr8cKpgF7Dcvu5o=;
        b=TCRrkgKAAowCsmd8z5kermyU0fQj4d0lRCM1BlUYihZBI6xnAPDPeNtu9OEmPezwew
         OcqU7WoFHa3A7NqiglfxHliBUHHq/kUMfg4ji0jNWUQl+1UtASelD5IniTswJUEPt4RN
         ZGhoAsFeifEnxDKsxQthNSkaCSq3o9R+geAx2L1yxlGAMOxYtO9PlDwEF4r/gtnyfI6D
         j7I0ra7Nl4MFrZOjoXTsaQArILNNKN/NyyZTVbtMtVd0Umz1v+eIadT/k+7jW4DF+O2r
         DYWDGA8Ex5f37UdzZ3Vs88yx1qpT3Y1Dh4b83HRqnTcNKkyK8OpOGCSc/9TIye/U0PEF
         mu0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8BBXJHL8130U3/iwqtWa0/hxgNEbBXYuyMvvpzVVSoxx2rN1ijYO8gYhQGmaFbDMfj1NQXJpo8cu/dl9DXC4Ul@lists.infradead.org
X-Gm-Message-State: AOJu0YwxZvSrRGU4n0F0UjLaH8sJO23oHvXgP/S7qfZeeqbPwIBLrzpq
	+WAVap5kqmW5Uhgj6NMKvLsuvxC3kSUayFAtyWJ+dMfVIHFfDHArIShrFZbmgoWTNIWALyo8FWz
	NCpdbQAnzt7h2f/H7g+xBICgf8fU6a+ka7lbdWDujAMeZIAOgSzhXv4W5YbZG526P8KjMNcCius
	aMoQ==
X-Gm-Gg: Acq92OFi13x1lMJ3vCJwu9+lvbf2w7oy+E7AQFw1WTjI00p9BF1gKAyMHadriim4XIH
	NRkn+mayvYo9c2xOZnYmiy4pRD8zcMieI69u2qhiq2jHFltvk5CA9OJtxiWVyYHqGOtxwk7QzuX
	Khhg8hC3b/mL+af3BbAcK5t2cCeKD5P2m+/PtRxf5/PtQIB8agDGL+64+vWjd4LcRhPXdPebD8E
	sKwBc8TRZHQe5pRY815mHwDizihD575yiaQidjMLXZzRkEqIPgbwh89Y7QbDPbdh6Xqj/b3t+Zv
	Q7ZfK2vp9z/sSIq9X/rQSb0/yq9o6Ou4T6O7XbAS4FueVxP73lPD4J958Oe7bJ40IwxPamz0ILE
	NhtAhwKJytRJEgw8NYCKTGIuZEiKI9mrmpMQrOGiODN91q9AgDM4mAiSMfw/UKXXG2r3V6a96Nj
	3YEPK466/TRHwk/cg6Ok8=
X-Received: by 2002:a05:6102:2c13:b0:62f:4553:7a28 with SMTP id ada2fe7eead31-67c8dbf6c45mr12405605137.21.1779977453678;
        Thu, 28 May 2026 07:10:53 -0700 (PDT)
X-Received: by 2002:a05:6102:2c13:b0:62f:4553:7a28 with SMTP id ada2fe7eead31-67c8dbf6c45mr12405549137.21.1779977453082;
        Thu, 28 May 2026 07:10:53 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5b28absm14324149f8f.27.2026.05.28.07.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 07:10:52 -0700 (PDT)
Message-ID: <14c628b9-0bda-4658-8e60-7781284aaee2@oss.qualcomm.com>
Date: Thu, 28 May 2026 16:10:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: s32g3: Fix SWT8 watchdog address
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Chester Lin <chester62515@gmail.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
        NXP S32 Linux Team <s32@nxp.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20260528120323.46287-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260528120323.46287-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OM4XGyaB c=1 sm=1 tr=0 ts=6a184cee cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RFvq1impTiYap7nS4gAA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: Lx0b540NCuzFhhf-HcEIOJ8aU8mM9ARJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE0MyBTYWx0ZWRfX9026UFJpgusv
 kLtKA5JDGz9EZKZiBxuYJvvyq3ero6nRmv2kM1K0+pOylgDxLfje+vapW75coygrgFddafi6kNr
 rDCH1uMW4Vzx2BDPMm88Yw6s81U1Sxi0hy7He3OMFrXrseHmvNOHaw7t/fKNvL77PnUx2591oHk
 VlZMsQhdnGDmFQJnEBQilO7nV78mNa9EYkbdE+lTpTgYcN9xha/4NA6mDNqe8lb7cjZs9d9WJhz
 XlrLFHkl4TGpTdjfh6wmlUlq8oszhxk1fENG75lqyE1rXe1RI02O1w2mf7f0KbcuzP5SlBz3eTE
 NBiYMYX3KHCK3sJ2pp9wFQKvYLnEAJED8dBut/oId0XG7artikJZ5QylUmYynvtD+NEvHvT5/AM
 bihfjBpPgVcrAkCJFly3nc+JNzrt7hObXe33TL/DYt+JDnS8CI+L7O+vsl9RuLVCFL+CCKs1GOk
 WmQXvvU+WrXS4HJcMHQ==
X-Proofpoint-GUID: Lx0b540NCuzFhhf-HcEIOJ8aU8mM9ARJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_071056_499074_A83BBABA 
X-CRM114-Status: GOOD (  18.69  )
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

On 5/28/26 14:03, Krzysztof Kozlowski wrote:
> Add missing hex annotation to fix the SWT8 watchdog address in 'reg'
> property, as reported by dtc W=1:
> 
>    s32g3.dtsi:863.27-869.5: Warning (simple_bus_reg): /soc@0/watchdog@40500000: simple-bus unit address format error, expected "269fb20"
> 
> Lack of hex '0x' meant address would be interpreted as decimal thus
> completely different value used as this device MMIO.  If device was
> enabled this could lead to corruption of other device address space and
> broken boot.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 6db84f042745 ("arm64: dts: s32g3: Add the Software Timer Watchdog (SWT) nodes")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Thanks for the fix

> ---
>   arch/arm64/boot/dts/freescale/s32g3.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> index e314f3c7d61d..7e28dff53a86 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -862,7 +862,7 @@ gmac0mdio: mdio {
>   
>   		swt8: watchdog@40500000 {
>   			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
> -			reg = <40500000 0x1000>;
> +			reg = <0x40500000 0x1000>;
>   			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
>   			clock-names = "counter", "module", "register";
>   			status = "disabled";


