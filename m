Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD2BCA6002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 18:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xcOII1yaaxjPXRPocOIPIwuUNH/5UAtstICER0t6wfI=; b=FX80PikjjxHt7Sm180rRVzIrEa
	5CylI9DcXifJ3uMJsz0p28eA8TiGr6e6RKI177PRiYQuj78E3ceTJluV4DECayfvViGAPBkCoVt9v
	LLtYDUUEvLFxvD6LBZW7VlqRbPz9pTka88BKUtppFXPigjua6pPP1L/Z8IMakdSEb/oVZnbAG6AmY
	PH7H3XZzQSVUry4xoY/bBbHdm1wCn9/+bhu35RsF2+GFuXF3WK1DvJJpueKt4Vq4GIOO12WJcgrDp
	lYI69BJYkxwsC0oCJaymLnQRUrIAk/YU4hBn/3J0JlkhF65WiO5egHHVgdkB8jVIw6M8rOMP3LPBu
	IGVNvWSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEWRw-00000002xSN-2OB1;
	Wed, 07 Oct 2026 18:33:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEWRu-00000002xRb-1hSZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 18:33:07 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697IBISX503358
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Oct 2026 18:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xcOII1yaaxjPXRPocOIPIwuUNH/5UAtstICER0t6wfI=; b=giuqBmir98/FhzyO
	dF+rAIA5MY4G3hqnIvHGreVP2UFZtipw8mb61SjqW8gP1lmzOCSY47CEgIT5uWKv
	zVe/xNuv+/SV5+pXhPMrDqPyDFgi5t+de6lLLO1jLy/DCAKJU+WoWDcnk9iKRcPs
	I9KonsWQh8sZEvbeOnxNbCG/VfbgJktbnI2ptL7JS2d7fIH7vvoFwbk5XqhcSgNq
	MhsAldLT6LkShz4FH85UQsut4p2NNynrySR1UCa/yw9c8RBOrtbLlBoHxkv51x0l
	CIaXfxA/FR/ThnN92VpijtJYR5mnMhqUaitsaWgteHtIKv8v3709N9YkIwPkYumU
	mpXYYA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5pv719y1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 18:33:05 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso8474547eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 11:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791397985; x=1792002785; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xcOII1yaaxjPXRPocOIPIwuUNH/5UAtstICER0t6wfI=;
        b=MsqJKU/DbOMrjAg8Ux9XbuihW9GPK+2TDwgD+gSojFB0iKw9wX1abCKkAocjYJpkfB
         h8BaUY8Vn4aHvul1/74XHS4PuZa/eAfrXRkHfKw+5xYskE4tHZhO9VDBV3wUEf9XjDMd
         D3+/n8xoBSDwnVzlySax8eU/QS2jej9+NUgv+aFEBss/OKNHVynmA0/7Xfjse5R8zVb2
         zWcldPYuCfHkuJYQSvj/ummM8UYtoeyFef/Uyv+GFJ+w8I/sMIMmMOmyvLcVMxeKmrNj
         8Bo9kdKL6zEKYRMoWqPExH4VnGsUu2o2sEH33LVmGnt2BO+IoF6iN474PIi4Ka9xx+aq
         no8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791397985; x=1792002785;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xcOII1yaaxjPXRPocOIPIwuUNH/5UAtstICER0t6wfI=;
        b=hElb3iPDPX7FbWQzBzaI2+pKHrOUf5PI0IVQvV/cfCvugbqlhhuLji4TYntQOY8eEa
         d6hBKxTom1T6kKMkcPvsizdHSXEQbOFIv72v9dfpFw6iBtqrl2q/ryLUtvk2g/LSMgD3
         8jkVGVaCRy2oLj3EIAjb2r7yfTQrk8K0JNtUQG3DCcPn9uk4GgbeSEhg8Q0pfmGoDMll
         k8g04n9vFBK8P3lunf6cEn8X6UlimbGUJ65k5guZUMjA1KokBxqVscUS1kDmvLsjnr58
         lHHzKHibZJULGC0kJC6fYydrifgSzZXim4zhLVrOffiapp+sHhCOXNbtd5yzYsyAHCqQ
         pa1A==
X-Forwarded-Encrypted: i=1; AKwUvBywGFi7r6zj/BFjm8d+UgWNOqon8q2oU6ANXCQCWm54ykBaDoAcl3IAbfvQyu2/YKLLWjoUuWW6KLxVT2GzGQTp@lists.infradead.org
X-Gm-Message-State: AFuF++nIq9wm1aUHl4R4o/A1851TKXUX+Y3ILEdeI2op/BXWyOGmud3N
	9xAtwDj0pS26bQ6GZBuB9lz2bSEAwkJ9nLs6C5t+v+t6DhXVHbOnMh/hswRlhq9vCHItN0h8b0l
	6gGlEX/ssrcXIqs2lnD52QQ39Bfxu8nksCr1ntieOPZ9O07JUfwen3mu3Dnn0oDBVjk69Pq+NzC
	xftA==
X-Gm-Gg: AYBFou3NL6S0Wo9R5WoeNvvaUd6lyvPJRi1lzskRW80kH+zbh8n1XH1VEoR4/Re8qvr
	eO3nHphBHOKccH2XDCsdx/MvSsp8Du2LBkjJ6H28AZ6xTolpPDi5PYpEJgb+mhRoOdr6wSuZ6TN
	9JmBsGRw3pDl3vOyh+5n2wyllVBTBKp9fRhhfKyX+Cia6aAory7tG8YvAfeJ5ubmw4BRs1H2cwd
	WNMKbT89lusbYqEi+8j5UvK69yvhiPB5xuskk+d9nHP6gW9fmPXDz6/nT8sm3+IxWdotEufxKXw
	/2T9wrlHMcbTLciVYUxEl2TZ6zQPr91zTZnecI3YsPCPvrysjlRwt84hxQPh2PC8NCbmjUe4AFe
	/BYi+74gCrVeOqcNybNv6kwl/dy6N
X-Received: by 2002:a05:7300:ac94:b0:343:4a95:f120 with SMTP id 5a478bee46e88-3515dddaea8mr3997305eec.25.1791397984870;
        Wed, 07 Oct 2026 11:33:04 -0700 (PDT)
X-Received: by 2002:a05:7300:ac94:b0:343:4a95:f120 with SMTP id 5a478bee46e88-3515dddaea8mr3997250eec.25.1791397983841;
        Wed, 07 Oct 2026 11:33:03 -0700 (PDT)
Received: from [192.168.1.12] ([223.230.93.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af90521sm16456444eec.19.2026.10.07.11.32.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 11:33:03 -0700 (PDT)
Message-ID: <31d91f44-3f16-4a4c-916c-f4d8107d371e@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 00:02:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/21] arm64: dts: apple: t8103-j313: Add
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
 <20261004-macaudio-v2-11-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261004-macaudio-v2-11-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA3MyBTYWx0ZWRfX5Q95WxuLHYV+
 JhEPYW+Ri+g6WCr/NyRNDvDM0SzXo3B4BhF/GoHYcdAzwgvhMtazRYsFDJU2cVnoToLteO+xxnk
 9gqEfQnocQ47HKvXnaX82PW19onXetk=
X-Authority-Analysis: v=2.4 cv=J4I/fwnS c=1 sm=1 tr=0 ts=6ac69061 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZXy6yrx+fn+bJIgs5eQ1WQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=KKRqKo6ZSQ7ryDd2x_cA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: Q1RI7Sm0nBQS4IMQhAOvoou-WkZ7QWEb
X-Proofpoint-GUID: Q1RI7Sm0nBQS4IMQhAOvoou-WkZ7QWEb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA3MyBTYWx0ZWRfX7qn+K/5V3w3J
 usZz4R4/9NWcqB+BtRsrY1YndhTEfDonoCPsPo85pzmcXngbspGIFPmW6BeeoktuokOFZ+sFiWY
 pdw+4GiayOCttJsnUPVETbMdwyYPj0Qqz+/84NiHTMNrevzqHUMfUttOF8XKQ05xVB9mdzdvmlR
 a/Wa+5StIiyabZ9TINGqiS15sBANBGGWmp/F5lor4UMqyqWp5KDQKLnRsl8q5WLJ0n6gYkj+Gbp
 hleDdIs6ctkSa/M8s+5GLpjgxveaTIy1g9feI1CkG1VH8p00fjBw0dJNEjhap6FPhAqQFYh4J6h
 IMaMvkXewyIElxRQrhwTfaHQakdBfff47L7j4nt74zdnr8FZsPLzfw34gMmBMslTKUMALb9sD3Y
 KxtkLYWZAJvDyc9C8MCQ65ixQMYNHqPAXKbN7TYl+mKrz2Z2gbLVG0mSOL1Tmr+Vi+3OTRdVAp6
 3n1WPZoyZbMEDtgCs3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_06,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_113306_456501_A8212692 
X-CRM114-Status: GOOD (  21.52  )
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
> The M1 MacBook Air integrates Apple-specific variants of the TI TAS2770
> and Cirrus CS42L42. Add these nodes and advertise them to the machine
> driver via the sound node.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>   arch/arm64/boot/dts/apple/t8103-j313.dts | 82 +++++++++++++++++++++++++
>   1 file changed, 82 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
> index f8b2b1637b9d..cdda63ca8b34 100644
> --- a/arch/arm64/boot/dts/apple/t8103-j313.dts
> +++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
> @@ -55,4 +55,86 @@ &typec1 {
>   	label = "USB-C Left-front";
>   };
>   
> +/* Audio codecs */
> +&i2c1 {
> +	status = "okay";
> +
> +	speaker_left: codec@31 {
> +		compatible = "ti,tas5770l";
> +		reg = <0x31>;
> +		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
> +		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;
> +		sound-name-prefix = "Left";
> +		ti,imon-slot-no = <0>;
> +		ti,vmon-slot-no = <2>;
> +	};
> +};
> +
> +&i2c3 {
> +	status = "okay";
> +
> +	speaker_right: codec@34 {
> +		compatible = "ti,tas5770l";
> +		reg = <0x34>;
> +		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
> +		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells = <0>;

Both speaker codec nodes reference the same shutdown GPIO. Is that
intentional for this board?

The TAS2770 driver requests 'shutdown-gpios' per codec instance, and 
GPIO requests are exclusive by default. So I would expect only one codec 
instance to own this line, while the other appears to fall back to the 
register-only path after the GPIO request fails.

If GPIO181 is a shared physical shutdown line for both amps, how is the
power/reset ordering expected to work across probe, suspend, and resume 
when only one of the two codec driver instances controls that line?

Thanks
Ajay Kumar Nandam

> +		sound-name-prefix = "Right";
> +		ti,imon-slot-no = <4>;
> +		ti,vmon-slot-no = <6>;
> +	};
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
> +		compatible = "apple,j313-macaudio";
> +		model = "MacBook Air J313";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		dai-link@0 {
> +			reg = <0>;
> +
> +			dai-tdm-idle-mode-0 = "zero";
> +			dai-tdm-idle-mode-1 = "zero";
> +
> +			link-name = "Speakers";
> +
> +			codec {
> +				sound-dai = <&speaker_left>, <&speaker_right>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&mca 0>, <&mca 1>;
> +			};
> +		};
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
> +
>   #include "hwmon-laptop.dtsi"
> 


