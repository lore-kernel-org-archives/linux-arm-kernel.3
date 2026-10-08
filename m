Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E702DCA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 06:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RLa/JHNXfr18gNmyy6T2VPCPOXnWuKMxuMPJcaRk978=; b=LxpiYm1aCXFnQMl+AjFqzkaMUk
	KsuaEgE9qywKbM3XttzsMJll6xpV7O38BAj/VoRdWeQP4tbpKj2sRr/wxxZfb4LnhygMEYyVBalKr
	1No3Tg4z6aI7qiovKpOma4a7j8cdsc8cuoax2BwgaRo4hJ2neF2+XELcH+fI57kb/Q4pIOKlbNtBr
	HQ+xqF0zl0ajyY4IDhWzFaT6vDSctFkZmhvoQWerbruNFx+gv/+EF5CyOMpEVpkNFM15WUHLctXlV
	lTTNHtMQnar6ljUpMg7ZNHCQ3KQYTnPnuB6WJRDi8bsLeJeY8N6dBWOk3Fg+reTFO14keiOfsths8
	MBy7thlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhT3-00000003d0I-2az3;
	Thu, 08 Oct 2026 06:19:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhT0-00000003czf-3MBi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 06:18:59 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BUDm2774937
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 Oct 2026 06:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RLa/JHNXfr18gNmyy6T2VPCPOXnWuKMxuMPJcaRk978=; b=gW2v5S5e5sa5Yb41
	tkhYl/JefCzIgByxIoWKayWoEjlGs+o7BxGfrdi5I7/DQBHO9fG/857kGsp/r1YG
	3dcOPYIdnm9yYD2D+CYaipsNYW5Wd6uz3BsA1OyD8k4iR63P7/QXLahXZFslPUif
	njCLrDG6P92+PnIhXv5A12ld6WEU1WbDSOL6kpb024dAZWUVl/UCdIh3h6o58+bh
	xPVyr1w2O5hzt4QBVMektOkw201yAfcWMR0otA3TeQJv73CghMsXwfKgh+ZYMZJA
	X/2hKzAhZXUj728/QTUQzACXEP9sl3gQLK4qqHr/n8Qg025FhQ2/TO8PE86Vq4Y+
	sUrjgA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe69ebh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 06:18:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e617b5e9b3so8310865ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 23:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791440335; x=1792045135; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLa/JHNXfr18gNmyy6T2VPCPOXnWuKMxuMPJcaRk978=;
        b=RTsGNeDas70t/AKXx9V2ELmJX01/loUsQyBFRip/IcvqzP9LYmV6y/AHDDdraBnWJQ
         m+UrosrSMHyReoYpSDUwY9s2MbDXf7y5Pkgm9Wv1cxiNeTMY7mAhUE73mvsiLoBOqBR1
         DKQPYD0FgTmGWud6Kcw+aCRUODLKWVNvqXq/q8FWgSsq7Gci2DzOQm/vFpsQ8/15brmc
         PDsir5WdcXZFE4wjN7TfaTbtRrSPHenRKlp6dStcGFMmSLU2rCT0XZueurR3k+T/NhMe
         cY0Cf1qUnu/o3rATrwoxyhmM9RlE4JNIYQHtNLVEh1BySF0g92fRFXs+ECUqIeFOTVik
         6sAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791440335; x=1792045135;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLa/JHNXfr18gNmyy6T2VPCPOXnWuKMxuMPJcaRk978=;
        b=VrEZAaCwgYWmoIxfwY3QFNGsjppltVYmmJsd+7dpqM2S4seOOKao3mM/Exb4ook3Ju
         4tPZvEF3yymCfJtf0sKatcxfvjTKlNeMx9vBCJST53Qs38G3PwR4ggwhhCx25hp+LNCi
         /dfmEmAtQGIu6Q7hGqimLvTojoacm5Jfg4FK12JmRByXFR+mKBKd93IBmb6oKLlsGAC+
         fba+U199on3rFH469tmWUfiKa0/LjWwiHKIC/Zqbae3LH/91FWGYklW5dA9WkrC+7j4O
         2DXF5pSYPE/+DCpbCzDxwEvpgG+WQDI5Cd7QbtLVMy2Zxdt/UL88h5oom48dock0K8MA
         iT8g==
X-Forwarded-Encrypted: i=1; AKwUvBzLjUEy56rOnakYcn8v8E/DbyRfyCirrE30hmYsDG/pHd2znrlcuzet5yKwDN4lhf2FDtOZZNcjHtJ963WGKaBM@lists.infradead.org
X-Gm-Message-State: AFq9FYLq2hHTidJsYKoUCMSV189GtchY78jP/vldXMY+dOgQeTfoXk85
	d6PDd47FwMA5+qf0s7MfO69HJnB8inEFALQPenseMv4LhCV0Nu2EjdFnw36P0MFE7Sp4vtOaiH6
	6Q9VdledTi1FWgLOtZ9j/9yftJ7JN4a9TU/sXtkhzDOxmVLi9TjyXD1aReRncE9HDovOxiZ4VlK
	oVzQ==
X-Gm-Gg: AYBFou35SdmVHycGKfgjilAy5Kc3wz88zLdgkmBhBOgcTG8NUwEWYFkwFtgMHJma/iA
	d20apU5QWI7ZNPNEbnptHw0NIjItciO09+UgjRl/HTHzZsA/ubpzV3/2LJJAqVMviz4l13m6NUL
	IARA53HeByd1dtnNFCWb4+Eio6b+tKRxB7E9g4nkDFKCTvoL7uuGBkfhuPxATdElHGKYXXlYkLB
	gQ92qOOmaWCaLXjTYnsNY4vOqfcnxADGh31IRB4eIiN36lSlxJjxQ3w1D/8bFDMdz34CmXLPvVb
	bJcGKnC3ByoP5sBqwdV48Xr73KghFQf4hdqo8VVrXrlP454tQ8/5RFdcEzJPQoTB+uGj4W9bAN8
	8VnJuStGCtwUu+x7B8ZArXVPrTKg=
X-Received: by 2002:a17:903:2445:b0:2e3:1bb4:6121 with SMTP id d9443c01a7336-2e600510556mr38285705ad.49.1791440335504;
        Wed, 07 Oct 2026 23:18:55 -0700 (PDT)
X-Received: by 2002:a17:903:2445:b0:2e3:1bb4:6121 with SMTP id d9443c01a7336-2e600510556mr38285425ad.49.1791440335008;
        Wed, 07 Oct 2026 23:18:55 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e606da8fc6sm19674205ad.58.2026.10.07.23.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:18:54 -0700 (PDT)
Message-ID: <41c5a595-7f40-4505-99a3-5041641fb025@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:48:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/21] arm64: dts: apple: t8103-j45x: Add headset jack
 nodes
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
 <20261004-macaudio-v2-13-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261004-macaudio-v2-13-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8IBzh1ilUqHzrzG6xDOJYXB2JwQ6wHYT
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac735d2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=UesLP-FnXeQSrw_j-0AA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 8IBzh1ilUqHzrzG6xDOJYXB2JwQ6wHYT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfXxTXMDHrIHqUc
 QFG315U87u9GKw8C5axADvArF3qutNNNSG0mtfcC4W+RYLGv+vyYPQmc+jedRUwPxFQLgC0B7ee
 braSEMh3xoi9+Myptkk/EcPYuMqkRA7glHv/oFqmzhV84EYyM/nSwbLdOVxCczr8vVl2Z8OtxDP
 hc51knSS1mPTs2ttw4xVaoTqN6uSwwepgeCbRFULaYpBqxaCfmkaVvfnlTuoO+UFut+ARQlWJjL
 Rvw2oXc+qNnjtZPUMTY71BqMtwB6WCt9Sqv2SxoIQ72QZI3tt/OlsWCYIKWdfwm7Jqii8PMKxDf
 u8HTAu4jtiI9DehaAuyVdWf2iLjgdvP5h+e4J7Kru0UuHExG/SJLyN9ZzPAFRYBCB/m7ee7gVHT
 +BgbNFLOdpQI0+YaiUh7ASeaZe+NKAgDULZhYaTy3Q9PhrJ82KZKD1xBMvhEL1x2ZdrmE4D/RS1
 bqe0ZyoHFSsWQexqeNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX2e3N19cr6UZo
 HJxx2gMZlsDSTzK3OJHxMJs5EHoWz2FvDKtL4Wl1eIkmBDqHhvuameFKPDbLXlsrEFIU3tQR6Eh
 NFGssGIIhCQkJQvHtjZlpWFwBffex0M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_231858_843092_04A182EE 
X-CRM114-Status: GOOD (  20.74  )
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
> The M1 iMacs integrate Apple-specific variants of the TI TAS2770
> and Cirrus CS42L42. Since it is not yet safe to expose the speakers
> on these machines, add the headset jack nodes and advertise them
> to the machine driver via the sound node.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>   arch/arm64/boot/dts/apple/t8103-j456.dts | 38 +++++++++++++++++++++++++
>   arch/arm64/boot/dts/apple/t8103-j457.dts | 38 +++++++++++++++++++++++++
>   2 files changed, 76 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
> index 090c97bb781b..1fc74ebf9ab2 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j456.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
> @@ -88,3 +88,41 @@ &pcie0_dart_1 {
>   &pcie0_dart_2 {
>   	status = "okay";
>   };
> +
> +&i2c1 {
> +	status = "okay";
> +
> +	jack_codec: codec@48 {
> +		compatible = "cirrus,cs42l83";
> +		reg = <0x48>;
> +		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "Jack";
> +		cirrus,ts-inv = <1>;
> +	};
> +};
> +
> +/ {
> +	sound: sound {
> +		compatible = "apple,j456-macaudio";
> +		model = "iMac J456";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		dai-link@1 {
> +			reg = <1>;
> +
> +			link-name = "Headphone Jack";
> +
> +			codec {
> +				sound-dai = <&jack_codec>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&mca 2>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
> index ebddde75455c..d8ea6bb53b3f 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j457.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
> @@ -69,3 +69,41 @@ ethernet0: ethernet@0,0 {
>   &pcie0_dart_2 {
>   	status = "okay";
>   };
> +
> +&i2c1 {
> +	status = "okay";
> +
> +	jack_codec: codec@48 {
> +		compatible = "cirrus,cs42l83";
> +		reg = <0x48>;
> +		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "Jack";
> +		cirrus,ts-inv = <1>;
> +	};
> +};
> +
> +/ {
> +	sound: sound {
> +		compatible = "apple,j457-macaudio";
> +		model = "iMac J457";
> +

I don't see 'apple,j457-macaudio' in the macaudio driver's OF match 
table.The driver comment instead says J457 is compatible with
'apple,j456-macaudio'.

Should this node use a fallback compatible,

e.g.
   compatible = "apple,j457-macaudio", "apple,j456-macaudio";

or should the driver add an explicit `apple,j457-macaudio` match entry?


Thanks
Ajay Kumar Nandam

> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		dai-link@1 {
> +			reg = <1>;
> +
> +			link-name = "Headphone Jack";
> +
> +			codec {
> +				sound-dai = <&jack_codec>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&mca 2>;
> +			};
> +		};
> +	};
> +};
> 


