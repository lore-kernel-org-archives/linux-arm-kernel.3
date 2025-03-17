Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74632C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 18:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=im+lzt/l8oUZkwx4sSdHAnZN7RYYo3yZ6X9EY0kQmFc=; b=NUgJFmzUO5x3kG0JAzBoxEdkNw
	VynDA2fiHy7d4fir4Cnz7yu5UPRehkl54yNW1noSnuA67OK6XljSrk6hc2JAbHWEmuJxtKbD/Go9g
	FBujgfCdL534/2+nckN0qoXtzEsFRVi/nZo+tdHhAIx4K0c1Ir0jqYTGkgyz5KlAA6CLQ4Zp0H6dG
	9b3FZ6ZPWWLGODiCpWMIyyuxsSDSQ1fTSTTWY7se6QxzPn6xBduYGL0+M3C6Y/udOHPsH3JESu11X
	Dq8luF1bfKsZ7yRpnDlougD/VGE82VfXA5w9n09fSJ29+fQKGqalUpjNxdWBRnIIBvTBqhNT972Lj
	yqUIFc1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEzz-00000003eyJ-386x;
	Mon, 17 Mar 2025 18:15:39 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuExO-00000003eXR-1agL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 18:12:59 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3912622c9c0so729364f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 11:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742235177; x=1742839977; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=im+lzt/l8oUZkwx4sSdHAnZN7RYYo3yZ6X9EY0kQmFc=;
        b=F/+Gb5/j3w14kimExsh+zQgtfo1wrbvkNgu7JYSkwA37J2I5PlsVu6ohLS/vokvsNt
         rVz7ss8dkIZ4w2NN0mVYXEYSPgJmS0U2W0lwEKxpGLqW6iZDmQ4+Uc/em55Ti2w3qQSV
         XT5JeWyRRFYa3RdyI8HyE1fOrzakJDlEa0W6Owzl3qQ7oEu2+tGvMP1eR977Ok5My+r2
         p9OVG7zZFIwof24ZeSb1hTyXRBcYM/hHF7aKDh4MbypUuzGQXaIPIAKu1/uIS8Z2eoL7
         KorfByhF2bJsnrJqvrCmQszH5SfAn/HoKtLJIabKM9MhrGeNChxlDKRxrJ2Phl23z7+o
         vYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742235177; x=1742839977;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=im+lzt/l8oUZkwx4sSdHAnZN7RYYo3yZ6X9EY0kQmFc=;
        b=Pg61EWyznZEkZ7u2ePwp84PDPJUCDWACauWEa7wi3KEGZgbFAwqvdYykvt26Xnd9Nc
         iH+/5mxGFtKHN6LEGIjJDgoR6eAKV8nOy9xZizYtj3H/0FOsP9XUjNbNsuZdZq71g0+D
         cv1RCsiD6VK+kkgkB2mj5m9AEHoa8oN2SAz8DKUgAVYRpJRtQWRsJdlTD6JRNgoDpKqb
         GxRchILWvBENpMLo1fieBImyiCCBCZNnh4AHZX4Xw4Lu+y/7FGVPOi+xSe5ygC2CZ/Lw
         5MUm+eK0hiYmtxLoMmsf0/8CMYNCqUz0DvdSGr8nLwiMIDkTcmwii5GgEmLb4fWHYQWK
         vi7w==
X-Forwarded-Encrypted: i=1; AJvYcCUudN+rQ3DVvJ8UrEBrAA9K9mPyCW72uOHxHwP2uaxm4h+SN3eMPnqfIqoEt8Cc8stAOU3+7s4qKXxX7vNFDX/x@lists.infradead.org
X-Gm-Message-State: AOJu0YxoByMoFzOzvkwPvXOTGdOb10Vd1UpCaV6W200esjdge2cvVq0e
	4htmvcXIV8Jjgamvo4eDUZMProhmSi4kmdNzOe3aDRKp2rjB/Atq1DVKArsvp6cUg1uVKfN1ukz
	U
X-Gm-Gg: ASbGncvkNVbMzztmYLtfsteJSJxrUMT7Ga7IxKdNBHdnPgvVfYPmz/3fq8RbNFS6kxT
	RmlzTh5L16TDiQBzv8gXBpdBQAgRGB45b21ehMdkRxAjAHSxrvM/xfRcOBSMkaw6gcnPMm8nXHT
	zVsE28PhgtNDTzVId3HjdVh7xZq09tcCNVrkJX1XLHqLpL89CTVNwyoiXuFAMGjbnj7VfERKCHv
	cTc0FPrZxwLeGaX9vRWBVGmvc5ZJCY5PWluFVnH9f90hU11WHmwzJshMrchuVL6FJXN2pVES5/r
	bgKgm5n4sh6FeRKECm9FlZp2ad/T5zz6uklwtXGIsRvvsBhuYVyDdk2WMjK2Ow4=
X-Google-Smtp-Source: AGHT+IH2rR2rP8fTM7ieRv7JpMuDjG5gkeJQOZupoiDEx9W4lXSbgwq0IEaADu9evSCfumBr8hQMvw==
X-Received: by 2002:a05:6000:4008:b0:38f:2685:8457 with SMTP id ffacd0b85a97d-3971a58a449mr5344443f8f.0.1742235176916;
        Mon, 17 Mar 2025 11:12:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb318a80sm15993744f8f.61.2025.03.17.11.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 11:12:56 -0700 (PDT)
Message-ID: <ef163f08-35f9-4d1d-8082-c826c6cd0aa0@linaro.org>
Date: Mon, 17 Mar 2025 19:12:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: OCOTP and DWMAC builtin modules are needed for imx93-11x11-evk
 kernel dev via TFTP and NFS
To: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
Cc: shawnguo@kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <Z9fhuVltKwqgHdLp@alb3rt0-ThinkPad-P15-Gen-1>
 <935028c6-ce56-46e0-96ff-46fa91c8f66a@linaro.org>
 <Z9hkDqcKG1xOmIB5@alb3rt0-ThinkPad-P15-Gen-1>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <Z9hkDqcKG1xOmIB5@alb3rt0-ThinkPad-P15-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_111258_430854_EB2C878D 
X-CRM114-Status: GOOD (  15.35  )
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

On 17/03/2025 19:03, Alberto Merciai wrote:
> On Mon, Mar 17, 2025 at 05:07:26PM +0100, Krzysztof Kozlowski wrote:
>> On 17/03/2025 09:47, Alberto Merciai wrote:
>>> While playing with linux-next and imx93-11x11-evk via NFS and TFTP
>>> I found that the dwmac-imx, nvmem-imx-ocotp-ele drivers by default are
>>> not builtin then the I was not able to reach userland. 
>>>
>>> The following configs were needed to reach my goal:
>>> CONFIG_DWMAC_IMX8=y
>>> CONFIG_STMMAC_ETH=y
>>> CONFIG_NVMEM_IMX_OCOTP_ELE=y
>>>
>>> is that something expected?
>>
>> You mean they are disabled or you just did not put them inside your
>> initramfs?
>>
>> Best regards,
>> Krzysztof
> 
> Hello,
> 
> By default they are enabled as external modules, then until we don't

So everything is as expected...

> reach userland they are not loaded thus eth and all the mechanism behind
> that are out.
> 
> I'm not using initramfs just tftp and NFS as follows:

All arm64 platforms are supposed to use initramfs on defconfig with
necessary modules.

> setenv loaddtb "tftp 0x80400000 imx93-11x11-evk.dtb"
> setenv loadkernel "tftp 0x83000000 Image"
> setenv netargs "setenv bootargs console=ttyLP0,115200 root=/dev/nfs ip=dhcp nfsroot=192.168.1.3:/tftp/root,v3,tcp"
> setenv bootcmd "run loaddtb; run loadkernel; run netargs; booti 0x83000000 - 0x80400000;"
> 
> Do you think that initramfs can solve that?

Yes, that's the entire point of initramfs.

> 
> To be honest I was expecting to have a builtin driver for eth by

No, why? We built as much as possible as modules in defconfig. Otherwise
it would be impossible to actually boot that image because several arm64
platforms have limitations of boot partition size.

Best regards,
Krzysztof

