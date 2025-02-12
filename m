Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFD0C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 19:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5n7rB0wdq5vMXsxf8BJiZz2GQf3El+y7mHlJDy65vBI=; b=rdOYipVj6jqwiTC7pNog3ISeZu
	VlefHXs76iT7/MfU5Yu9cJP0vhynNnrn79CSUVTg8HCUyc10BUtFdFiXqup4+KaNMu+0ZH5F6FsUa
	NLT4R17DwsZTIzYGYMDHEWzM89z6DfmF9xtgno7IQ2/lqS6IZkCXTwohR/mzlN61mE7QlHk47cmy3
	FQ+VaeeFObK0wGQxT77216+TEwUMYP6zGMuNmxzffgOMrwIlnmLAUOfraEnhJA7+AAHbqiPk+Zs3T
	TfDrOnqH0mxX1Kcre/hGYz7ch0yNCYFTK74B4uZYxeeHbcQ7j9EntqnUotZHrNU5eAuSJBd0eq856
	3VOmjh6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiI4n-00000008aMu-2TzU;
	Wed, 12 Feb 2025 19:07:13 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiI2X-00000008ZxO-1xMA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 19:04:54 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5deb0ea1129so1814497a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 11:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739387092; x=1739991892; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5n7rB0wdq5vMXsxf8BJiZz2GQf3El+y7mHlJDy65vBI=;
        b=ND51JYu/BYYnr72xFnC1bApkiyC1RzYx3hBWJ5Yb/vxmm6P1UKIozV98qnWW9845xh
         vsVt0nwFMOboZcgcU4iAnsn4S7Q432BGOw4BJ1Kn5jM51dSD2SJCzQaLC9VCIFjcLK1K
         2hvTQDiP70ROQWYFRpwfsvcz5Ki//RbQhqDnfULKvfkOYXbsh9NrWBLGnlBw5/tdr7fg
         dYyFqrC7hFoYo6tXX4cAaVPczSIxR1NljNW8E/2TOpFIJwBI5Gx5vM9VzBqk99uarsTa
         5v4omCU831q5Wzb75SCw+S8JQu9R2duCzLHCvxGg5U6A2wCAtwNpt8ZMh6J7Wjx87ltK
         u+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739387092; x=1739991892;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5n7rB0wdq5vMXsxf8BJiZz2GQf3El+y7mHlJDy65vBI=;
        b=NNv5h2Vim4jqeppalp++fZMplmFyVtyfOmQr70OxFMUXEKxBf4abA9cFYDRVB63wZn
         xKlMVyxLEA9PxD4clEJOmKNni2s9XooaXcuU8UXLgWfUISEZg7Ap81HI0vz9bRhuXV2N
         oH7F0xJSqJNCS8G3waIJtD9p+fw+PSNjl+SOCJUcC8G0M+wzyFhLhMbWue9zHBowMfPh
         CA0V2lNbLhuaABIrIXOZELHUViZmFTD3qpWE/28s5pB4WSg2LpJVDEb0nqCi56M5WjXN
         T8LMEWF9cKWrA7lP3XrrkYJ/a2qEdOtPB+K+AGbURcLq/zshfKcmhlun16ihp72Ei1NK
         TLVw==
X-Forwarded-Encrypted: i=1; AJvYcCWOjZijLJ00cmYZONDHu12VNOEBXvviM6Brk0SP7eKc+7oXwfvvEFSUwUoO6ivDvO4Hz6M0wmJqvvdCOCMhUJEB@lists.infradead.org
X-Gm-Message-State: AOJu0YxlyUzwfZOnqOc7B3RONsT3rMx5RFEJFsAbUhuMwQ3ABpVBccem
	UqhYiRRz7dCMsHvsmGPsVDDnWkVwwT2ueOPqw40y7lvgvlaMLABH
X-Gm-Gg: ASbGnctWi+tqStR1cwZXh/EMDb7q/7fz9R5s3LxByG5cLxvt/12QS0Q3X6QW/IH517B
	zXaEfdYg6DZvYkL2Q/tjpBcRh3sr9BFNrVHTW8GcTY+WTpMlpTFwIgIXOwaajFY7Yp+NLyc/2mU
	EjdBSXb+b99Ux1CINqYFDlsCzlf+XIrWs/PaxsnWjGDTT6qAJbiUJgUNF+TZqWXmWARYmQWSqXp
	rpcnsRCrg+1GqNnSwKfAWK9CE32MFXsYqw/E59/1hsdTIfRhwWJLwsQFuy87pMXPutroRiwocAf
	LOzJwIeE7GotDAny+cVx594Ob9ky6Ja1tYjW6EQZ9PBT
X-Google-Smtp-Source: AGHT+IEZn0+ju/iW8MyZm8pcKU9jLpSB3rBPfVfpKrwdB6064zci1oEw5mVOcdEw7A8E0QsKoeQlTA==
X-Received: by 2002:a05:6402:348d:b0:5dc:882f:74b7 with SMTP id 4fb4d7f45d1cf-5deade1c945mr4021549a12.30.1739387091464;
        Wed, 12 Feb 2025 11:04:51 -0800 (PST)
Received: from [192.168.1.130] ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de59f893ebsm9343226a12.45.2025.02.12.11.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 11:04:50 -0800 (PST)
Message-ID: <da63fc79-76f6-443f-b1fe-c4242cb45328@gmail.com>
Date: Wed, 12 Feb 2025 21:04:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] arm64: dts: imx8mp: Add fsl,dsp-ctrl property for
 dsp
Content-Language: en-US
To: Frank Li <Frank.li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: shawnguo@kernel.org, robh@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, krzk+dt@kernel.org, conor+dt@kernel.org,
 festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 aisheng.dong@nxp.com, daniel.baluta@gmail.com, laurentiu.mihalcea@nxp.com,
 shengjiu.wang@nxp.com, iuliana.prodan@nxp.com, a.fatoum@pengutronix.de,
 Peng Fan <peng.fan@nxp.com>
References: <20250212085222.107102-1-daniel.baluta@nxp.com>
 <20250212085222.107102-6-daniel.baluta@nxp.com>
 <Z6zGLn3B6SVXhTV1@lizhi-Precision-Tower-5810>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <Z6zGLn3B6SVXhTV1@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_110453_511089_313E901B 
X-CRM114-Status: GOOD (  24.19  )
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

On 2/12/2025 6:02 PM, Frank Li wrote:
> On Wed, Feb 12, 2025 at 10:52:21AM +0200, Daniel Baluta wrote:
>> Audio block control contains a set of registers and some of them used for
>> DSP configuration.
>>
>> Drivers (rproc, SOF) are using fsl,dsp-ctrl property in order to control
>> the DSP, particularly for Run/Stall bit.
>>
>> Note that audio block control doesn't offer the functionality to reset
>> thte DSP. Reset is done via DAP interface.
>>
>> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
>> Reviewed-by: Peng Fan <peng.fan@nxp.com>
>> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>> ---
>>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>> index 14cfbd228b45..46b33fbb9bd1 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>> @@ -1609,7 +1609,7 @@ sdma2: dma-controller@30e10000 {
>>  			};
>>
>>  			audio_blk_ctrl: clock-controller@30e20000 {
>> -				compatible = "fsl,imx8mp-audio-blk-ctrl";
>> +				compatible = "fsl,imx8mp-audio-blk-ctrl", "syscon";
>>  				reg = <0x30e20000 0x10000>;
>>  				#clock-cells = <1>;
>>  				#reset-cells = <1>;
>> @@ -2425,6 +2425,7 @@ dsp: dsp@3b6e8000 {
>>  			mboxes = <&mu2 0 0>, <&mu2 1 0>, <&mu2 3 0>;
>>  			firmware-name = "imx/dsp/hifi4.bin";
>>  			memory-region = <&dsp_reserved>;
>> +			fsl,dsp-ctrl = <&audio_blk_ctrl>;
> I think kk's comments in v3
>
> "This should have been implemented as reset controller, not syscon. It's
> really poor choice to call everything syscon. It does not scale, does
> not provide you runtime PM or probe ordering (device links). Quick look
> at your drivers suggest that you have exacvtly that problems."
>
> The above is quite good suggestion.
>
> Your reply "But for Run/Stall bits we need to use a syscon.",
>
> Run/Stall actually is reset, Most system, release reset signal means dsp/core
> RUN.
>
> Frank

RESET and STALL are quite different signals w/ different purposes so
calling them both RESET is confusing and inaccurate.

The syscon is used here to control the STALL signal (name of the bit we're using is RunStall)
and has nothing to do with the RESET signal, which is why it's implemented as a syscon rather
than a reset controller.

While Krzysztof's comment does make sense, I still find it odd to have this implemented as a
reset controller despite it not having anything to do with the RESET signal.

Also, do note that the two nodes are in clock provider-consumer relationship
so unless I'm gravely mistaken this should at least guarantee the probe order.

