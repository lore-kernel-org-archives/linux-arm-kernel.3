Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DD5EB28D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 07:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3UW7bwvIJSmR6JD5JewClPLgD/uZ6ndB7iEUdc/rSvY=; b=rX7osWmAAadN31rXAFOLIa6nYu
	N48hyWLxbHbSekA5zfY4A1sUnBBibx88y1YEMQ+OHzrmJhZ5u1tVD+hPzj/I8zWBqKKoA/VApcT1J
	URpvOhSO2A0NPxgrSus8S2tlFOowjReQrdaxDbd0q4Q+bubamJQvCH22bYpfxd9I4jtCb+I5A0LhY
	pi2n3/WM/onvaxnQLacwUn4nWEwqg3vNjyZzq500H/Mjgvlo+gmT/JZ+WefkpIyJHnvpR7CUpw4C7
	xGix8O1kRACE1mLte2xN6UZSHEq+XhmlAGA/mCTVi1tSNcSsGtCYjFCE3XnHoTxnnhnq2bYYSQwpo
	/GBOLfrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voG1X-0000000AyIU-41vf;
	Fri, 06 Feb 2026 07:13:03 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voG1V-0000000AyHV-1hva
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 07:13:02 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3545cf80e1dso200150a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 23:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770361980; x=1770966780; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3UW7bwvIJSmR6JD5JewClPLgD/uZ6ndB7iEUdc/rSvY=;
        b=V0tvNd3S/V4C/J3rrcYTyKv9qSCiRaVOcfuA93vWou0pLnBbl2rWW06WIPBvsCP0ds
         0IKxKRJOVwRsTPnAgQJenUco2M5wGUjOfIDEJzDCnbaiLqE1bHo6Miid7DO2dv0dA/5f
         5bnNuH00pWmbv9aJTtUhUg331gT7rxSblMC7o7ULa03Vza1R+WuXuIX/eKyJ5o5r00vU
         hT38P2+VLxsRtVDkKEpADtD654BrxOrX+K/xEpOeM+Q0c0IQJmIDXhA0tYSu4EgDIjqw
         qcaU5tnM2s+wRJXL40az2riS0Ncxj6JFL8qtwumzjjRBwaJ7OmJ3OwQFFYHwN26CuXPU
         CIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770361980; x=1770966780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3UW7bwvIJSmR6JD5JewClPLgD/uZ6ndB7iEUdc/rSvY=;
        b=awcW2RX2l7arvcBe00PXCVAkv9ZWgYr9jon+Oo6CGzEW/l1pqg1OX0XF9gA0Gq1Nu2
         phr0bZIAIBs/PAmx5t4bRjfNW/jcokOQs7gS8H+2RnFavkdVc2UMp4dgfc2NsLN9ZF33
         uFx8d4xzM0WzebjnKxKiRcLyEAIf1Lc77eqRMtbbsWYm2joqWdyIIXmgPma/XTH6bJZJ
         raMEi+dcd63KqboUtI4uILKqez4FMY4w+JbEp0TuiijiQriM3kje6+k9+YESeFA7FZEp
         hfzBEIl39bpOtVnYrm1ktJQwSkUS/VVsNdMTlrqBS6R5MsPfQltneRFdJGke9VnhdCXb
         UZ6g==
X-Forwarded-Encrypted: i=1; AJvYcCWEiLSSs7mn4eBTU4zGAfdmH+ICKv3XguJ24FBw/hqQhi71kHur47Z/gDGu2d05M6f/XKdhz8pnJNLKa4N6FUpw@lists.infradead.org
X-Gm-Message-State: AOJu0YyrqqEEebdF7PRoSq6nGzAY5kqYzvN7sruODgP5TD2NbatdDRWr
	trOLZUZcfF3eeWOAMOx3SfY0Fja55kwg4/hMxTcHod7sAjKD3wZRoKW+
X-Gm-Gg: AZuq6aJ5OYHiEL6DxdVq7AajVrT/0noNDFao98x4IibT8EVv/GG4pDqIW53kNrf+iSQ
	lkpO36LxuuTCzFh834W4dexItc7z8l3vYvan3HzpQu8A/dZRSBcwqMyArNRqCgzsfSAtmYsxxjS
	5xQDGHv8fp6KzveU3Zr5u3zbXQJry1852VTCbjOe67KYJVtCtmU+Gt4cwhdJpqdj9P2rozjKmVa
	J8/hjg7K4Sh3z9CZ3N2TqCH3p2pGMFk5xdTDRlmEthNYRlUkVm4dGp9mkCF08tbtSnZySX3ES27
	jUDYggJboCZK/mcuLV5eG90/GlXXNWh7qFrQwNa8nd0BVesRbdThaUSrEe2hJ/l61hbS5Q3gvwK
	dTkc1+iCLDZNix6qOZr7LEVFE45byxVhOr7FXPyXGy11r7jKvweh/2rdQj4T+ng8YDnEVV/48on
	vTepzWy8+RKyWwWgPUgzO3p2inh2KRJL1ZmE8n5YLAAf2qSmselFvHIduwA52BlxZb
X-Received: by 2002:a17:90a:dfcb:b0:330:bca5:13d9 with SMTP id 98e67ed59e1d1-354b3e5e993mr1427756a91.32.1770361980362;
        Thu, 05 Feb 2026 23:13:00 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb52494bsm1411203a12.10.2026.02.05.23.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 23:13:00 -0800 (PST)
Message-ID: <a0910eb7-4597-45a7-b538-f2feb021f389@gmail.com>
Date: Fri, 6 Feb 2026 15:12:57 +0800
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
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260205-tactful-warm-chicken-50bdc8@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_231301_459675_D516E48E 
X-CRM114-Status: GOOD (  13.87  )
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


On 2/5/2026 9:23 PM, Krzysztof Kozlowski wrote:
> On Thu, Jan 29, 2026 at 12:05:31PM +0800, Joey Lu wrote:
>>   &uart0 {
>> @@ -129,3 +165,23 @@ &uart16 {
>>   	pinctrl-0 = <&pinctrl_uart16>;
>>   	status = "okay";
>>   };
>> +
>> +&panel {
>> +	port {
>> +		panel_in: endpoint@0 {
>> +			remote-endpoint = <&dpi_out>;
>> +		};
>> +	};
>> +};
>> +
>> +&display {
> What sort of ordering rule is followed in Nuvoton? Why is it different
> than DTS coding style? Why do you choose other style?
>
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_display>;
>> +	status = "okay";
>> +
>> +	port {
>> +		dpi_out: endpoint@0 {
>> +			remote-endpoint = <&panel_in>;
>> +		};
>> +	};
>> +};
>> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
>> index e51b98f5bdce..7d9d077f12b2 100644
>> --- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
>> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
>> @@ -379,5 +379,19 @@ uart16: serial@40880000 {
>>   			clocks = <&clk UART16_GATE>;
>>   			status = "disabled";
>>   		};
>> +
>> +		panel: panel {
> No, there is no way your SoC has a panel.
>
> Don't add fake stuff to your DTS.
>
> Best regards,
> Krzysztof

I'll move panel nodes out of dtsi into board dts.

Joey


