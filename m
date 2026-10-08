Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B5ACA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 09:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3sTNTjoZI3yr2Mv8Xvms1V7V9EOCR4IuljjYgHchvNQ=; b=3RB4m+dXItK22V1nA6D4u70skf
	Np6B5TyjdBC1r2VPjkFXfnYg+AcZIfkKHxgModiuH+3mBwwHUSNOB0/hx0fDwX5p+8BMDrnEZAIe9
	4oAIRa3BwxqBHOMTW31wit4prcSKim/myiM4euln05t2j3mjiPBWXmqliq9iYS804K8RfRq0RJ+2y
	8Y3RGp8PE1Ih6CrepXvbV6zVEOux+JQ3l463mYg/l/orpbztSDuf6m6ged2oDHVkFU90gEMsq5b13
	aoRTgk4yB/h7l5ra7M3kiDzrZnE/uDTp0rCSCmcDDgNOaNUj56ygX6dXVcR/vc3jNGkuMEZPX8aFc
	XiTTUxGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEkRW-000000040MX-2XSW;
	Thu, 08 Oct 2026 09:29:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEkRT-000000040Ll-49hR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 09:29:37 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K3aY2189814
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 Oct 2026 09:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3sTNTjoZI3yr2Mv8Xvms1V7V9EOCR4IuljjYgHchvNQ=; b=ffMQqqlrngRc9MV9
	3LljFSL01DDjGEACnX59qfF16x6zKB+5G67wXlhJ4wUv4zv8rwm2FOzyOtnbG2Bv
	YiC1BE1yWYDxH8tALMOCUoES5FGood7IUrEQkeNZeznK0x3Xto0q9/bydUAPSyUe
	ZB15fNOF58GzTRGUTkqpNMobZk0TenZxxmkAlnUtnhmsTfx6txntq00BGf6W5/WJ
	CsQ/lEOJOkZgU4BCNSkNEtjO1zEauOqElYaKLf0K9r1xsVavJJO2poM+sauiLGp5
	75/kHFny8Ap6JQT1DTgCNgSXVwqR3mvgd+m2fjvqpoA5NbGVhMYVKmTLoZJfDeXc
	QwHcCg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3a5a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 09:29:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso3473072a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 02:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791451773; x=1792056573; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3sTNTjoZI3yr2Mv8Xvms1V7V9EOCR4IuljjYgHchvNQ=;
        b=khCgPeNT7H9CEdQY28VN3JywrS7krQRrS3vuVKu3lO0nU4UGyUvt534qk4XP4NyrMb
         KQ/r4bMmp9tw5j8rKXO24P3BBmh8ijGNu3fCzDqvOtQZ7FrjyL6WbpafER+uQA3zZtK6
         4I+qBzp2BCW+ENC7LGypZx6w0l9UrobGl1zv6Ehw/Jkgdrga6W8+E6yf9eq/Quf2NxYw
         +gPE7NpfLuQhvPeBdEegpFrYQHF0AgctqhlIEp1KA0AFQoylJVvJ7Nb50bDG4/A8KSpz
         N7AVMDZazHMJKKmV7KgBOFuWRTYyR8Lo431+guJqN29/oaqJJYr37DqLpMXSUKlC2Xr9
         wuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791451773; x=1792056573;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3sTNTjoZI3yr2Mv8Xvms1V7V9EOCR4IuljjYgHchvNQ=;
        b=jcgd1dgNi/a7NAnAadSrSBc1BlCToiAP0WXzF04o7swvTD98a6oBXPJMEa7pOIrRw5
         8G74Sg2suIfF+Ge7rELuyUhPzuydh0R1q0jI678Gdtz/kuFPyvRUmNpHQiUYQ2HpiG3E
         6I7oj1lxMS3dKhjhpv8bUIgYE613SvcegPEmCb2eyy9GRBjq981x+PT6dSIV+kdzAVky
         8LPEG8lv3i5FAH9km+oSyJQQccXZRcxLZDXumHbpohTeQuERVES8zPc/8Itc4Iwjdqht
         rDrk5DXucudEaWoLxQ+8IPq/cyTpr+oYAPUaF0LDtPsap9lE/iqBNMriwtSBc4GOISFi
         R8MA==
X-Forwarded-Encrypted: i=1; AKwUvByTX6pwtoJsjuUEehNNr8BIulMW+KhhNd8dBP+AZaYMDwo9Yoor/jnoM2EeZPhmd5/NQADzA1RTCNhi81U7Cwxn@lists.infradead.org
X-Gm-Message-State: AFq9FYKU3LnCJEy4qTUF2TsLE6tQ4S0FwNTJzExoCXaaDX2leS7bT0+0
	T/Hb0JR7386dtk6EhQmspvrWluO7gntc1GpYFk+GPDKvESub42IVbvOavV8yjEo61n9L3XTOxtG
	fQqbOLRUCUNcbvVT82m3gFi2gT70kCtehPXylhzPpZun2PEBjCjWdnfMZI6QtsYD1rD02rEMDKj
	zqvg==
X-Gm-Gg: AYBFou1L5CPKIXiUPRJvIxuk7nmo1GuGlDDykvCy60sDXJUA6aPHRrB7a4UfKLeCuPm
	HCJfx3gG8WJb9N/kdfo0ktESn83UnshxkSQCoscVQGxz66uSOTqcgqq2f8GSzk2ShL5bXJAzT2Z
	2OwrECnWELHTu0TaZE8MzoIWJsvSQeukUWPCNmNaIwvDWzyIEDndVwL8K7ZXrgXSydNrTWvaGo1
	4wKmBAPirz2UTVsg+bBSvxusRjZHl9YMQylDNVNjKGFbPcoAu/aRiXUY7wZAEMoG9W4w6zNAScf
	QDC7+W9E/qQAHpPHpP0MIHtZJdFmu8RO/OrRwGOyvs39zHtyuxvh1TDxTT5v/VSbWVp7x9+30eU
	hosncjrF0XEAN5UqATkoBbJvl5Z4=
X-Received: by 2002:a17:90b:4a41:b0:3ab:c80:9362 with SMTP id 98e67ed59e1d1-3ab0c809861mr582625a91.35.1791451773158;
        Thu, 08 Oct 2026 02:29:33 -0700 (PDT)
X-Received: by 2002:a17:90b:4a41:b0:3ab:c80:9362 with SMTP id 98e67ed59e1d1-3ab0c809861mr582594a91.35.1791451772573;
        Thu, 08 Oct 2026 02:29:32 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a79babsm3415638a91.6.2026.10.08.02.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 02:29:32 -0700 (PDT)
Message-ID: <dd8a9faa-9d6b-4846-b38b-711df8c2d6a8@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 14:59:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/21] arm64: dts: apple: t602x-j47x: Add
 speaker/headset jack nodes
To: James Calligeros <jcalligeros99@gmail.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, ajay.nandam@oss.qualcomm.com
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-21-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261004-macaudio-v2-21-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac7627d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=oNl7twi5fxIAqsTzne0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNyBTYWx0ZWRfXwnnb70xHMcm/
 uXZ0r7ZcZzhXZ6VGNy8BBy3GxAsOSdipKW5oUhY7oSTPe9qEPxu7gheZYfSAsFpVkqwrgWrRf7i
 VJVBfnPt7AFOdea4iyj4L9HM+fSUCL8=
X-Proofpoint-GUID: oVjNeO6nrpnW_ndaWGqoL0Qw2b904jfg
X-Proofpoint-ORIG-GUID: oVjNeO6nrpnW_ndaWGqoL0Qw2b904jfg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNyBTYWx0ZWRfXz5UbNUByGvJN
 aGp2RSwu7ymE+ydcGCnSLr2TIdrWrVfzioS+NWDgdRWqQb/8+Hg0d7Q7n4PhqeuVSq21yRP5cJU
 wcZBCrzCovHYD5YO/s3cTi0IS8rGSkhIYUnHuVna1IXxIybqyr51i0KquMHaziM9uVXKsMoYrVZ
 yTxiOY8EZlE3KesxtklQVkFDJoRT0mYBjZ/G5anKlMBpYm2OBqCea+HrSWounWAkplBP1UnH4uq
 ViSBCJIrAkqbrFN63UDxwvUSfUiiA4ZMLz3IGHOc3t4mIQX4Cr6Sx/7bINc9JNnIHEqkJF9a7jh
 NjTrxRdrF8Xxg0BDUanNdbNUM5SchujuW2/ANs8byoaCrh19oYRXDMbsx+PAca8eLBLvNUAiJcn
 grTzyQY+NxU5pppvn25oH503K5iReuUiFx/p9NWinLCK9h+Kpd/0EW9MIRi3w+COipuSvtc62S3
 ZcvNX7mIM+S9N0U3WBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_022936_058169_AAC3B878 
X-CRM114-Status: GOOD (  19.30  )
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



On 10/4/2026 11:33 AM, James Calligeros wrote:
> The M2 Pro/Max/Ultra Mac mini and Mac Studio integrate Apple-specific
> variants of the TI TAS2764 and Cirrus CS42L42. Add these nodes and
> advertise them to the machine driver via the sound node.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>   .../arm64/boot/dts/apple/t6020-j474s.dts |  5 +++++
>   .../arm64/boot/dts/apple/t6021-j475c.dts |  5 +++++
>   .../arm64/boot/dts/apple/t6022-j475d.dts |  5 +++++
>   .../boot/dts/apple/t602x-j474-j475.dtsi  | 10 ++++++++++
>   4 files changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t6020-j474s.dts b/arch/arm64/boot/dts/apple/t6020-j474s.dts
> index e3c2635d84fa..7b4c4ef471be 100644
> --- a/arch/arm64/boot/dts/apple/t6020-j474s.dts
> +++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
> @@ -46,4 +46,9 @@ &pcie0 {
>   			<0x300 &pcie0_dart_3 1 1>;
>   };
>   
> +&sound {
> +	compatible = "apple,j474-macaudio", "apple,j473-macaudio";
> +	model = "Mac mini J473";

Should this be "Mac mini J474"? The board file is t6020-j474s.dts and 
the root node identifies this machine as the M2 Pro Mac mini / J474s.

The fallback compatible to apple,j473-macaudio looks fine, but the sound
card model string should probably describe the actual machine rather 
than the fallback model.

Thanks
Ajay Kumar Nandam

> +};
> +
>   #include "hwmon-mini.dtsi"
> diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/dts/apple/t6021-j475c.dts
> index 9fe17f1f7f59..f8f776f9eb1e 100644
> --- a/arch/arm64/boot/dts/apple/t6021-j475c.dts
> +++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
> @@ -36,4 +36,9 @@ &pcie0_dart_1 {
>   	status = "okay";
>   };
>   
> +&sound {
> +	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
> +	model = "Mac Studio J475";
> +};
> +
>   #include "hwmon-fan-dual.dtsi"
> diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
> index 32938a3bf96a..153899f1569b 100644
> --- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
> +++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
> @@ -73,3 +73,8 @@ &bluetooth0 {
>   	compatible = "pci14e4,5f72";
>   	brcm,board-type = "apple,canary";
>   };
> +
> +&sound {
> +	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
> +	model = "Mac Studio J475";
> +};
> diff --git a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
> index 926bb4ab77af..7f1faefcf9bb 100644
> --- a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
> +++ b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
> @@ -36,3 +36,13 @@ &hpm2 {
>   &hpm3 {
>   	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
>   };
> +
> +&speaker {
> +	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
> +	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&jack_codec {
> +	interrupts-extended = <&pinctrl_ap 59 IRQ_TYPE_LEVEL_LOW>;
> +	reset-gpios = <&pinctrl_nub 8 GPIO_ACTIVE_HIGH>;
> +};
> 


