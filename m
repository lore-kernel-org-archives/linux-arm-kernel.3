Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8B5CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 12:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1OQBcJjNvMdiwaszp4KDFRPLfNnLBhAgYvcBECQKgE=; b=F0vTeBELTklm9y7lMaNVg6YAhH
	JS0OaH7cEIVUHc6yXlPwfGXdVLODjSsxc7dWkH4oeRmwBwedMdJLNYEXoEiBPgfDhslaehJ5ci8CV
	cz6ZZ7q0Z5XxMGHbP1+JTNWRiTnhe+fNgMdJ/2b3GzUF2m5SE17bekNJUDFe/MftDZUyzh2fCJ2em
	rWM0eN3j0OAkK4v08q05W5WhgK9d2bjgJuVDNT9DeELTvzKHS+OIrOBzn+XCkvIaI1SHF4DgLwkaa
	W/RYytAjEnGw44lffr088yWi7PM2VFzWyb+Ez78xgCEYAcgkfwLjifYaoqdJBFOlJPyqjIOT8ZdbN
	U6WCznLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9jG0-00000007lri-3sv5;
	Fri, 17 Oct 2025 12:08:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9jG0-00000007lrT-0KPU
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 12:08:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=D1OQBcJjNvMdiwaszp4KDFRPLfNnLBhAgYvcBECQKgE=; b=Zb2ax8ObCId/HoQDA/npNNdy2M
	3xlV9fzm/390h8PV4Hz+UaPtgG/QizavNS0qqCor4SrKLSokBlr0cznwWVcyFJs9XTZg/LDdi8TBn
	MTynKwuAVNYEvqEyaeyrEVObXAP8OpEQOLnpJHKfkAoXdPYBnXsesUH8VwRUhlkx7oQOiQPhi0nFv
	T3326v/wct/IYwSuhikIdG97m/2fr8vGxcpyMIW1u5QZtsHtMj4u2SvtQo67KXqCjH4LNL2D0U9M/
	kUlDP0/xn4OIvX6CL2PcXC3SHghyhB+4gIhg2MH5LoFOAo/i0R5VWDBY/ShHB6dVAD5PvtR9cE9Bi
	c1x644+w==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9jFk-00000007Ypt-335D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 12:08:25 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-290dc630a07so4249245ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 05:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760702888; x=1761307688; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1OQBcJjNvMdiwaszp4KDFRPLfNnLBhAgYvcBECQKgE=;
        b=Y9VIIvIV7fnlwiV8fTJNoPUeJTHJAmcz0mA0mWfCEyyM9r6fKmv1nTxWQgr3Ta+NpL
         DyObLMHrESO24JWlfCvs4FmFpMAnnWtqNWUjnFvUOBNDcyWM0kv31LtE32dqRWcyAPGW
         rBK50OV0u4TiS1ofT5qLFxIOQsR1IC3VFsU/U2JO8JtAjNUvNlAgF30JIHY3/6TudmqM
         iJDoh7M+BtRcmeLrjLor0gWvzFo4IqkYBuZYIz+nAf7QE44Ou3yB41b05Q2PsPZ/cm5b
         p/ScvJmNtQZfRV2XRfxHzHlE1b4g8yHKmMiAJD6vAAyS+PNsP91r0T567sC8+KZnNI/H
         PSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760702888; x=1761307688;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D1OQBcJjNvMdiwaszp4KDFRPLfNnLBhAgYvcBECQKgE=;
        b=XzqguEuvUZ7Q8yD9Z75ZmePBnArP1j7H4DQiMWFjRwCftkQ9OIF2+PSRs3/KdaxyeX
         DRePSnAA8pv3xDpvOK+qHptABkwMf0zm9WYp+qWZY7hp/n4/ZR7VazDUYDcgNQ2Mgq5p
         D6bQVzzVpwxO26dzgi3g1xdUS2J4/I9qia2kE6YLWYjPPRActbeT8PKNSbvfI2D319eQ
         Fo5g0UBtUGv2tLtdEfKJK4UW6Cd+GCX5eGg1AHqLMlKTIVRUdO/Sx9Is/DlwwnqXACiL
         bcjDdze4EA07heahpuq8Dqzbl1z6nS3stdg/E4/2OcT1aovR2fN3Kma6nvaCFpSSagJ5
         4OEA==
X-Forwarded-Encrypted: i=1; AJvYcCWigYTwJsjfciRtctiX+LohHOpOp2HrVUclXJg3TCs4b7SBZIJXvCnIh7x+nk2/CpDMwnxTQi7qgVX8q3lN/xjm@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz+rLAwBnWx9tDpvvqIpzqqLfD+hKvTSVokxW8zKu9Ii18InOD
	C8P/Wz/iq8W6ZgnqQhwbgPoUqE1uGYbh6wbSwejsaZDJFKn0o0hpN3bj
X-Gm-Gg: ASbGncuArp5ipSX71LJ/HB/yjmbjUZRxAe5ZaVH/CNdY/kU0rpagJ7lSNCKNi/oHS7t
	Av3t0b27XeQBGQbJXcbADOzyo5OlrQSpwTb/+gQsP7r5dwdIpbGEccVmWyoQxvIo6Kmtdr0p8bw
	gQAvKiAu/goB3P0pnpZV/p3hfj4nZR9f8fBOSyUGs9XSAYQIbwLcXSZJCrw+UYDbu+Oxk4B810r
	W4EwETcGbriYDrOR70JBH3g05IwBlDeKC218/DL17fzCWcgscoVaGgUfzI1KM3h+PxqMjD2jj7j
	+13SIo8c27W4YKvDArq4q96Q7Aj6eF39H3nQvVa2p7ri9jJTEsBgjYXgjmVszjCgJcd0xpIxg0G
	z8Y3kTUV5Z2szoG2Nrx8OSwpHt1k/JRbghxI2eMVTpKt0yR3RmmA87BIjt6eFnA==
X-Google-Smtp-Source: AGHT+IFnsq6kZGk/fHm/e4FGVx4CFf8u3uhudH43GQxU6NT4qAtaZrIavqrUcVzL980LCDRQymv9AQ==
X-Received: by 2002:a17:902:d50a:b0:27d:339c:4b0 with SMTP id d9443c01a7336-290cba4efb1mr43185145ad.35.1760702887862;
        Fri, 17 Oct 2025 05:08:07 -0700 (PDT)
Received: from CNSZTL-PC.lan ([2401:b60:5:2::a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a228a5b5csm5822966a12.13.2025.10.17.05.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 05:08:07 -0700 (PDT)
Message-ID: <d9d14ce2-2e65-422e-95fb-eb30b128ad90@gmail.com>
Date: Fri, 17 Oct 2025 20:08:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: fix eMMC corruption on NanoPC-T6
 with A3A444 chips
To: Dragan Simic <dsimic@manjaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Grzegorz Sterniczuk <grzegorz@sternicz.uk>, Jonas Karlman <jonas@kwiboo.se>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251017073954.130710-1-cnsztl@gmail.com>
 <7f0b1747-87eb-0b0b-6fb0-304811a4be21@manjaro.org>
From: Tianling Shen <cnsztl@gmail.com>
In-Reply-To: <7f0b1747-87eb-0b0b-6fb0-304811a4be21@manjaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_130823_672197_E13CCD1B 
X-CRM114-Status: GOOD (  21.86  )
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

Hi Dragan,

On 2025/10/17 18:25, Dragan Simic wrote:
> Hello Tianling,
> 
> On Friday, October 17, 2025 09:39 CEST, Tianling Shen <cnsztl@gmail.com> wrote:
>> From: Grzegorz Sterniczuk <grzegorz@sternicz.uk>
>>
>> Some NanoPC-T6 boards with A3A444 eMMC chips experience I/O errors and
>> corruption when using HS400 mode. Downgrade to HS200 mode to ensure
>> stable operation.
> 
> Could you, please, provide more details about the troublesome eMMC
> chip that gets identified as A3A444, i.e. what's the actual brand
> and model?  Maybe you could send a picture of it?  It might also
> help if you'd send the contents of "/sys/class/block/mmcblkX/device
> /manfid" from your board (where "X" should equal two).

Unfortunately I don't have this board nor this eMMC chip.
I got the chip model from my friend, it's FORESEE FEMDNN256G-A3A44, 
manfid is 0x0000d6.

> 
> I'm asking for that because I'd like to research it a bit further,
> if possible, because some other eMMC chips that are also found on
> the NanoPc-T6 seem to work fine in HS400 mode. [1]  It may be that
> the A3A444 chip has some issues with the HS400 mode on its own,
> i.e. the observed issues may not be caused by the board.

Yes, it should be caused by this eMMC chip.

Thanks,
Tianling.

> 
> [1] https://github.com/openwrt/openwrt/issues/18844
> 
>> Signed-off-by: Grzegorz Sterniczuk <grzegorz@sternicz.uk>
>> Signed-off-by: Tianling Shen <cnsztl@gmail.com>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>> index fafeabe9adf9..5f63f38f7326 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>> @@ -717,8 +717,7 @@ &sdhci {
>>   	no-sd;
>>   	non-removable;
>>   	max-frequency = <200000000>;
>> -	mmc-hs400-1_8v;
>> -	mmc-hs400-enhanced-strobe;
>> +	mmc-hs200-1_8v;
>>   	status = "okay";
>>   };
> 


