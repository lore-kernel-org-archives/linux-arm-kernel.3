Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97FEEB28FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 09:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHcOD9pDSPOBKmWPMOHD8g7QnZvvQliE20szaOYrjF8=; b=K4hub4MGxHYLkH+9X3fXoqvBnE
	bneujgZjS2lB5Ej17R5MLQuEAp/9EOpqtqA89gg47RcDZ8Ryg69t0RpROV+pRpy6D0Pdk7eaQta47
	ZVNqI0FTXChxuDOOuKv/Rnub0qedxU6uYKMSjicMTGqkiUm4QYhzc20MIcw7YMah80R4l+7vmcFDS
	VFJjLEmo+8qYHRlhMWn0khMF3MV2JO9ZhJ2z0hNfV/Kj1csqpc1IWZ6wislHtYE/oktYy2/I1SJSg
	t1hdVyqxKbK3+v1TzlYsQtVsz9PyiwOEP1MQGHnRWrPoV0zB1YzH38NdDVmx7ZgNrY7M/aDzWum7b
	iCfAOrbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voI1y-0000000B66x-0St6;
	Fri, 06 Feb 2026 09:21:38 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voI1v-0000000B66C-3F1y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 09:21:36 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-82318b640beso1102201b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 01:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770369695; x=1770974495; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DHcOD9pDSPOBKmWPMOHD8g7QnZvvQliE20szaOYrjF8=;
        b=lvR62XyjkA/5kJUdFP7gMoIzbbgDF/jeqnYCbnztgFRIO6Kt1ZdOKelpxFEP86CLWd
         qqi6PrWtA4DXgC9+OQeyfyU2DGqAOSp0AmN4m2EE02zHYyrTIhPe3CNKtZ46bPG2ziOr
         r/2WoBfbcNepPK+JqpJp8AmuV5yeyptSrVum/xeueDO5G6IJrBpRVEhkmx9OCnCzL/im
         bBO9D5/dXIpKJoiEPh53TNb90I4wFznfRSi8mPDPA9qWexTU01MxpOcdZc/6JvPu9eoV
         skYuw6Mc/b7ri+cQEgOk4hPCg5GvneuLoCNKfL+clWuyZ3fuCtZrl4pZpdgXgUeyifp1
         3ezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770369695; x=1770974495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DHcOD9pDSPOBKmWPMOHD8g7QnZvvQliE20szaOYrjF8=;
        b=jyNYK9GT6sHWa3RAob0azGkuVbBv4pQ5nlw8MYqElPq66Nxoayeu/V+nmy2elBkGzk
         FbJpAa4+yc811QbvLtfYK0IohKQxV5K10nRywF376N12amp7bDlYUL0Vdrp/3gd+HTRu
         DFQXokv1cZ2YEYFSX3pAtpUDcXeBlqRiUiKSQ5Vpq5h31e2bNflctiGo+vF1e6s1ZDZV
         LTAhUW3JOn05lpN3lrbVErPKFVNoG29rcTD/Y0g8Pwu4vd0iPTf13+WVvyXSXZykmiM4
         Sh+5rguHL1wPjm4DPYQf6hnaKBu20Wn9xbpzgNAkMRMxILPu+u7vvc4NcjYbrGtkOXPy
         SLhA==
X-Forwarded-Encrypted: i=1; AJvYcCWRAE8Aj66f4XMiPM62N9QmhKMGiWpZ3L2MarBa6S27ne7qCvRt4ggxLBr/aSd19euu8hlaX3KL9WbJJrfeGzT+@lists.infradead.org
X-Gm-Message-State: AOJu0YyzJ4eO2x/1ilkHmDV88rDPqPZA2ZQkb6puHm/3+E5RKWHI7RXP
	cF9vX6urKGFXY/7bIWQg+SBqLHEsMEnxjhtjC4wJfV7wAz4XOKja37X4
X-Gm-Gg: AZuq6aIkLiK2i3yiNUnQW3rIz7dCPWjhxruUFPaYYxfiZGZ7zn1TwqXdiP6+mKDgaZG
	/ZuOaOkNW8HUK9ymvYoowPyH5JrGyjYXGFJC3leDlgxds0pVKVFg0EsnTKx7uS2oKIHd0FdSQef
	Xh11RhUskDvlTv9GRlrTJx+lkb2y7W/ZXuG0m12TtpLyae/+shjgP2Z2La4FhTW+1RX2cAviOrn
	hTwq2TCpekT/HyY41Lh/8AxkJ8CzFuYdEC4dHOSOB9soby1YqNKQC9LhSBMdv9P14XXb4TFK+z3
	5RY8KNJxitN2dnN4DBfszLhiFhDLsic8Smq46nbRF4/FVpW2+Irz7Ew3C/EU5JtTnQkktNpLjKd
	OsbdQyyMTXJZZpxYHZYx3ABoAHJ1rdhJ2/bx6HwWgNfwdp0E58KMCkGjn9XFHKuabPXFbllz12W
	4896cjMMXlHhZVJj9GBGUfRF7VeBWxhmKjbcbtYeMhVZy3F6nJA93v6epA6PiLwyUz
X-Received: by 2002:a05:6a00:158e:b0:81f:4c37:7647 with SMTP id d2e1a72fcca58-824417a9046mr1511837b3a.68.1770369694600;
        Fri, 06 Feb 2026 01:21:34 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824416cb967sm1632051b3a.30.2026.02.06.01.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 01:21:34 -0800 (PST)
Message-ID: <1a82e38f-2009-47b0-bfb5-c2624bb06719@gmail.com>
Date: Fri, 6 Feb 2026 17:21:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: nuvoton: ma35d1: add display
 controller support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260129040532.382693-1-a0987203069@gmail.com>
 <20260129040532.382693-3-a0987203069@gmail.com>
 <20260205-tactful-warm-chicken-50bdc8@quoll>
 <a0910eb7-4597-45a7-b538-f2feb021f389@gmail.com>
 <7c29f46c-aa27-4569-9170-53538785e029@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <7c29f46c-aa27-4569-9170-53538785e029@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_012135_816599_67F4FE50 
X-CRM114-Status: GOOD (  15.73  )
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


On 2/6/2026 4:56 PM, Krzysztof Kozlowski wrote:
> On 06/02/2026 08:12, Joey Lu wrote:
>> On 2/5/2026 9:23 PM, Krzysztof Kozlowski wrote:
>>> On Thu, Jan 29, 2026 at 12:05:31PM +0800, Joey Lu wrote:
>>>>    &uart0 {
>>>> @@ -129,3 +165,23 @@ &uart16 {
>>>>    	pinctrl-0 = <&pinctrl_uart16>;
>>>>    	status = "okay";
>>>>    };
>>>> +
>>>> +&panel {
>>>> +	port {
>>>> +		panel_in: endpoint@0 {
>>>> +			remote-endpoint = <&dpi_out>;
>>>> +		};
>>>> +	};
>>>> +};
>>>> +
>>>> +&display {
>>> What sort of ordering rule is followed in Nuvoton? Why is it different
>>> than DTS coding style? Why do you choose other style?
>>>
>>>> +	pinctrl-names = "default";
>>>> +	pinctrl-0 = <&pinctrl_display>;
>>>> +	status = "okay";
>>>> +
>>>> +	port {
>>>> +		dpi_out: endpoint@0 {
>>>> +			remote-endpoint = <&panel_in>;
>>>> +		};
>>>> +	};
>>>> +};
>>>> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
>>>> index e51b98f5bdce..7d9d077f12b2 100644
>>>> --- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
>>>> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
>>>> @@ -379,5 +379,19 @@ uart16: serial@40880000 {
>>>>    			clocks = <&clk UART16_GATE>;
>>>>    			status = "disabled";
>>>>    		};
>>>> +
>>>> +		panel: panel {
>>> No, there is no way your SoC has a panel.
>>>
>>> Don't add fake stuff to your DTS.
>>>
>>> Best regards,
>>> Krzysztof
>> I'll move panel nodes out of dtsi into board dts.
> You did not respond to several comments in total, it's fine, but if you
> just ignored them, then it would not be fine.
>
>
> Best regards,
> Krzysztof
Thanks for the review. I've gone through all comments carefully.

Some points were addressed directly in the next revision,so I grouped a 
few replies together since the original code will no longer appear after 
the update.

I will also restructure the DTS so the panel is defined under the root 
node to follow the standard hierarchy and ordering conventions.

For remaining items that need discussion, I'll reply inline one by one.

Joey


