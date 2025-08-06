Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45279C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 14:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHzr4MA8aqHB6jajAWjKyzRf2MPIdZd6EmOAFNAHckc=; b=td133SwDQoKSme9SDQh5nO9h4O
	UTyxdFZmf+nMfn8lKr6SKOEqc1fshM8SLU3kajOMj2XD4lrcyIXmE3Rnhh52M7qzKGhZ9yQIaX4x9
	otwpPi5zwXDc17KYgGyChHDMK63pbiUEv0DD0CqhDXNCgim6A1HPf2lyH2oH+l1lsL+m49typMJac
	AcxAuRnHmDVIKReqbaM18ZpLb5D50c0WN7A9S1gREiLJRiKG0sjvyke07gQJ7I+z66Idjl9KGF+b1
	w1wTn587AjayfIGgcWYBO+fRTTwgzXIa7F2uOoytTdFo21H/f1irxZi66DtKYmlGlKIrTiczAXPbD
	F850hJrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujekl-0000000FNe6-3D63;
	Wed, 06 Aug 2025 14:04:27 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujeeK-0000000FMQP-03Zd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 13:57:49 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-af93c3bac8fso790265066b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 06:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754488665; x=1755093465; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nHzr4MA8aqHB6jajAWjKyzRf2MPIdZd6EmOAFNAHckc=;
        b=FsgcBqCqmwDXX244WTtAHGnEHqxl1WQWUYIu1OzcSPdYBKie9r4iBJPFsQAkjrhTig
         LSNIpr+UheOs+SJYeLc1sXcC2fLKy6qOnNoilW37ozLiQNZiTEvZEaqYmjjXUKJ9nAJY
         MZHde/+FMFvhnG4PljqKuMjIBdBjgB/kj6di52okjKtFTW1vejhfM7rMcmcaX9biMV9j
         PoAIvtv24CBYL+dc0YyT38lgtxV5yQ2qEBYlq8vjRjSpIgH7DZvDq1LNqJUm29gR4WIX
         02qiT6sCXkw+II9ebcp9K9YvAbOi6dETe/ojw2IBXAX1DNvUAP3uAwc621wAMupvY60W
         2g+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754488665; x=1755093465;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nHzr4MA8aqHB6jajAWjKyzRf2MPIdZd6EmOAFNAHckc=;
        b=rLSCR3KtV8CsWnrL4Jg8Xz7IAOTMSggmx+qQrIPnueTk6oebleta/tKiy7PGiyp1B/
         qHaHtujZyYohYzdrQzLuzpJlf8qX5gTyCIvN/f94DUeJVxPRGPs2iE2Jnep2w70UTg2a
         fK2IIpWjoxdIrU3/1hnDDOCdWq+5scT1M4RYlqroEumhB81v7nvgaYflVeygnGBMF0ay
         AAX7ORpKawkDtG6vYcMnAKxC6OKEgXhmxRPns38AWwJGOmGNqyextAvLpTLtSwa2ZqS6
         DwkSh44d5Kj+hEfJr9SQmV103RWia41TrtLWMzzl6NanH3OTNM5MQ6vkBeUVErFTn9dk
         P2dg==
X-Forwarded-Encrypted: i=1; AJvYcCW+9aLsyvn0Gik6yoCSGyuAmkpEKUw9bW3sxOtdV81FCe91sxrCH1Tvp0GKeIDXocWGK7YkfdJugHcH6Q0+tVis@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp78L42AXYjesRPajfoD9DEeaJ4t9qolm+QmlxhQ9TfawRaoO0
	/02BIlFt44r6duBP6K66Tm5hQ5C2JxosO98nlkTCOB59RseMU72lSGko
X-Gm-Gg: ASbGncvn0P/2mtp9GlvpGu+V+F4BGN1OIbkDhMlzzEZOmzjWhIEGNki7Deu14hMwmL1
	iasS+S4cUuWae4ruFM90Mf75T4uhywsnUpdw5YYHM4Shy9HYVt0vzPLNB91OAr5PonUQ9R09chR
	BdfAMN09+N+iYxI/QUsm/hxZRrsGnzhQVMwGE2AYEaPkA1yQMZCPtVp4PhRh5Bo1B7Tyl0A4FM2
	TjbuIBUBEqFZD6BWhTYd+6BIcMIpOy3ovpwTYOup00IFzaGu7Fpq7+d7ZP7SvvA6ANEshZrP+wT
	1ZiifKUgpdZbMfwi1+vQpCGQT0Nnss+pKrab6FDtsz4rBVEqW7Zrd+xXU09yBvf3+6mFmYXYG+q
	pnWy6B9ZqTMqmexZ1IJ0QnvD0d1U39dYR6d/eXQfBOnfYRdJPfQA2G0XGGY016BR78NtwKeIq/D
	wfpVVmtkpCOUs=
X-Google-Smtp-Source: AGHT+IGQ3QZUaLC8+topY1n9SlLxxAbYjEO2ebSd3f+30oUx/XN3GCsmaSZCHF1ta/LFIKgiqEA7eQ==
X-Received: by 2002:a17:907:7f18:b0:af9:2502:7772 with SMTP id a640c23a62f3a-af992bc37femr270882566b.54.1754488664645;
        Wed, 06 Aug 2025 06:57:44 -0700 (PDT)
Received: from [192.168.1.106] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91ee3c1f7sm1045900366b.68.2025.08.06.06.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 06:57:44 -0700 (PDT)
Message-ID: <cd17cfb4-5708-4c15-b616-505f669bf2eb@gmail.com>
Date: Wed, 6 Aug 2025 16:57:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: exynos2200: define all usi nodes
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com>
 <20250730074253.1884111-6-ivo.ivanov.ivanov1@gmail.com>
 <CAPLW+4maFxYv4RrvzUXWwteXAVm64ocj2LSAgtM6RMtzbM_p-w@mail.gmail.com>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <CAPLW+4maFxYv4RrvzUXWwteXAVm64ocj2LSAgtM6RMtzbM_p-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_065748_057788_9BBE5D87 
X-CRM114-Status: GOOD (  34.21  )
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

On 8/2/25 03:29, Sam Protsenko wrote:
> On Wed, Jul 30, 2025 at 2:44 AM Ivaylo Ivanov
> <ivo.ivanov.ivanov1@gmail.com> wrote:
>> Universal Serial Interface (USI) supports three types of serial
>> interfaces - uart, i2c and spi. Each protocol can work independently
>> and configured using external configuration inputs.
>>
>> As each USI instance has access to 4 pins, there are multiple possible
>> configurations:
>> - the first 2 and the last 2 pins can be i2c (sda/scl) or uart (rx/tx)
>> - the 4 pins can be used for 4 pin uart or spi
>>
>> Such configuration can be achieved by setting the mode property of usiX
>> and usiX_i2c nodes correctly - if usiX is set to take up 2 pins, then
>> usiX_i2c can be set to take the other 2. If usiX is set for 4 pins, then
>> usiX_i2c should be left disabled.
>>
> The whole naming scheme is a bit confusing: one might think that
> because both usiX and usiX_i2c have the same number (X), they
> represent the same USI block.

Mapped to a different address? Hm, I doubt.

>  I can see how they might share the same
> pins, but it doesn't seem enough to me to justify this convention. If
> I'm missing something, please help me understand why it should be done
> like that?

That's the way it was done by Samsung in downstream, and specifically in
upstream for autov9 [1]. Clocks are already merged and definitions expect
the convention implied by my patch. Iit'll be way more mangled if we use
non-matching node to header-definition names.

>
>> Define all the USI nodes from peric0 (usi4), peric1 (usi7-10), peric2
>> (usi0-6, usi11) and cmgp (usi0-6_cmgp, 2 pin usi7_cmgp) blocks, as well
>> as their respective uart and i2c subnodes. As Samsung, for some reason,
>> has decided to restart the counting of usi instances for cmgp, suffix
>> labels for nodes of such with _cmgp.
>>
> Yeah, they probably meant to number CMGP instances, not USI instances.
> Because CMGP (stands for Common GPIO) is actually a separate IP block
> containing:
>   - 2 x USIs
>   - 1 GPIO controller (8 GPIO lines)
>   - One general purpose ADC
>   - 6 interrupt combiners
>
> So some USI blocks are separate USIs, and some USI blocks are a part
> of bigger CMGP blocks. And instead of using "usi_01_cmgp" for example,
> they should've gone with "usi_cmgp01".

I guess.

>
> Usually it's recommended to follow the naming scheme from the TRM, but
> AFAIU you don't have one.

Yes...

>  And the scheme used in the downstream device
> tree looks like comlete garbage. Anyways, I don't have strong
> preference on the naming scheme. Frankly I'd just do the consecutive
> numbering for all the USI nodes in this case, like: usi0, usi1, etc.
> And add the comments when needed, like "USI from CMGP01 block".

This will mangle stuff way too much for my preference. People will be
way more confused when comparing this to the downstream device tree
too, as the average Jo does not have access to anything apart from kernel
source (like me -_-).

>
>> Spi support will be added later on.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos2200.dtsi | 1361 ++++++++++++++++++++
>>  1 file changed, 1361 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
>> index 22c6da907..f83e6cf24 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
>> @@ -7,6 +7,7 @@
>>
>>  #include <dt-bindings/clock/samsung,exynos2200-cmu.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/soc/samsung,exynos-usi.h>
>>
>>  / {
>>         compatible = "samsung,exynos2200";
>> @@ -314,6 +315,76 @@ pinctrl_peric0: pinctrl@10430000 {
>>                         reg = <0x10430000 0x1000>;
>>                 };
>>
>> +               usi4: usi@105000c0 {
>> +                       compatible = "samsung,exynos2200-usi", "samsung,exynos850-usi";
>> +                       reg = <0x105000c0 0x20>;
>> +                       ranges;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,
>> +                                <&cmu_peric0 CLK_DOUT_PERIC0_USI04>;
>> +                       clock-names = "pclk", "ipclk";
>> +                       samsung,sysreg = <&syscon_peric0 0x1024>;
>> +                       status = "disabled";
>> +
>> +                       hsi2c_8: i2c@10500000 {
> Why not number all the underlying protocol nodes using the same number
> as the USI node?

Same as above, my wild guess is that Samsung ordered them by physical
position.

Best regards,
Ivaylo

[1] https://github.com/torvalds/linux/blob/cca7a0aae8958c9b1cd14116cb8b2f22ace2205e/arch/arm64/boot/dts/exynos/exynosautov9.dtsi#L503

>  Like it's done in gs101.dtsi. And maybe even follow
> USI naming scheme used in gs101 in general? Like, sort all USI nodes
> by unit address, and then number them starting from 0. If some other
> USIs are missing (like I mentioned in my review for the previous
> patch), add those too, first.
>
> [snip]


