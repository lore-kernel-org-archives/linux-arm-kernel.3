Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EE4C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 13:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1faCMgze9p8XUDYZgawC40ARuZzb777TUs53Av6Blw=; b=H3Hu40wqUC2A79h7xZicrCUvOU
	oA+33bKh22LJo4E3a5X0hGFVz7RbeeudLsaLJD5QOAqCiCJhJ6bfxeo1tBfy0vHGA2mOX/a0lRH+Z
	pPbMu63Uxn5XH5imb7htOK+OnwyUdKNcaDY9fYbSV+d5IFhmS0qha/b02zqJOGAHxh8y7YHCUQoFx
	PAvJmIXTLHFKTPSUneInF+FSrLM/2E8cyPK4Ba3ae53LG4bgYhwx6KWDVabqnz/xn7c0nR5r091hl
	HGQiIFKUUE9l2Zq4u9XpFsIhoEs1MqbHOgFuh9Gqjf3FbxgtjkkkPwz7WbLQSzNYD8i6EQCrkVRDQ
	EHsTV18w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4mj-00000008Bfq-2i4Q;
	Wed, 29 Jul 2026 13:57:25 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4mg-00000008BfA-0L95
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 13:57:23 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-6aa9606ddadso791697eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 06:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785333441; x=1785938241; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1faCMgze9p8XUDYZgawC40ARuZzb777TUs53Av6Blw=;
        b=WAgJaR2cu/fdtGTlW32NNb8x8pHhKJbHJhpsDC+PdTK2xw1GPZ3SGNeaBdxKzBFV8s
         3ppdyhSvquqc1MI4KJAJywDrRkLw5XmI/u58JnsfcAYKNUeHq7tokwYhI2/Kqhgg/gJj
         sdT4i44kJxDyk6zPqUHmXpD06VP7pndKi2fyqz182u0t5TK4mHcj+1mg8fyOvNNvmuG/
         16DZQMdG1WwURNB6YdTDFXZhmA4FiniqjHxEyOXmEi+ojpk+CTOWjXJ2oZ4PclgQL+E2
         n+UPRgMsptDtmY77FcooN4GhALcAdS3U2QIFsNw+VdvZuP5PSFj6gXNuAfpPNrsmFnPU
         eeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785333441; x=1785938241;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1faCMgze9p8XUDYZgawC40ARuZzb777TUs53Av6Blw=;
        b=PeT6sugDvkGpDUJ8CAsJnBL2G37sU83cNTHfv3HfGv7fqzJyGaH+VU8RTPQMwlY2iz
         5TwhzUasJC2xHLNYtCsF9LQmePNfYbOVqNmXl4j3S7Qp3wO6Pz4fOt13eFylfHnuENHD
         +kNO14qc7Vz83Udcku6WRZMl/ogeFxYxbFhyq2kTTGu3oNuS6MvSN0tx0d22a2kPI6vo
         6+okLUmjrjXhzT2EA2qqmbd/cpaBglko40pMWbE3M99nk+pdvwDgMA2h7RA4beoCPQxR
         yR0cuajtIAYsQZ/CfrmWgsutEVlzuG2fDtBtRxN0YfYbyQ4WEANKbkn3O+qNOc/jzNN0
         6q5A==
X-Forwarded-Encrypted: i=1; AHgh+RruikaS8rNlzs6CvrVuYZAfhQ0jMGvidd0ErjhQ9VTT2RxkDgteYNygYknyEOvEtYMco50KBDL49JAyX+eXjjs+@lists.infradead.org
X-Gm-Message-State: AOJu0YzJzPRdTlCY7BEgc7rRDVmwvR8WIvVEgE0UEhI3SZQWkTiGSkWx
	HHxXmIrR+gaxGLt79Hu2jQcg5foaIitNGhLJnYgX4kifG2xSEretn/Sw9mZGKhpCKrw=
X-Gm-Gg: AR+sD11NTK4I7aJV6GhPqkZ3QrK3wH9byoUv7iISW8hDwkDG3EQfYz/JsZ0LSq0zwB+
	ORqrgMuMCj9zwjyvieKz4R5wr8Z3zMa+1TMgCk/9l8qQ+LXowLMUl/y6kjG8C5h8xniLFUEZ6j1
	NCZjP8AggA9EUE+FCPkqt4UXZWczB+N//u81RRC4hk/R0LwipVXgeVE+z2XPmnyaLLxzmJm+wLd
	PrgqJJdCqfHt0jYCT2lFwdAQ6ymNT+dcQpFk/BA4448tAk+GIWcIn0QjNKvCDp1Rd6qPLofimb9
	3ukhm9IWmT5jiFD3N2eFPVU+QkSPO566VDiS5h2tvRQp6yQFBKvuHxL9NHfKtgWFn8mg81Zyswr
	T9oX5AxSTQb4YnsY+coVC37YyVsiv41AqD7exFHQhBdTxMj6x4p4JC97plGgp0Lr/DOgBFIdkhz
	VYN7XUv/TnyV0UDgHf1zB3MeKUUbvMw9i1PrPBs+U8iqzUvTh4NsrcZRFvlwJs9jspdFW4LEI7x
	/u51ZzQANczVi0ZC8LsH8MId5Yaoq/s17bcFgo=
X-Received: by 2002:a05:6820:168b:b0:6a4:cf9:9a74 with SMTP id 006d021491bc7-6ac969bce4cmr3382658eaf.1.1785333441212;
        Wed, 29 Jul 2026 06:57:21 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3096:ee5f:6f57:afe1? ([2600:8803:e7e4:500:3096:ee5f:6f57:afe1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45886924321sm2551708fac.17.2026.07.29.06.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 06:57:20 -0700 (PDT)
Message-ID: <02b159ad-42d3-4d1b-a73e-13612d9f2845@baylibre.com>
Date: Wed, 29 Jul 2026 08:57:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: ti: k3-am67a-beagley-ai: GPIO
 improvements
To: Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Robert Nelson <robertcnelson@gmail.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260728-arm-dts-beagleyai-gpio-info-v1-0-783ec90d54da@baylibre.com>
 <7ee50408-aa33-4d16-b8ff-f5e2dc59104b@ti.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <7ee50408-aa33-4d16-b8ff-f5e2dc59104b@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_065722_151196_9BFED3B2 
X-CRM114-Status: GOOD (  11.37  )
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

On 7/29/26 4:57 AM, Vignesh Raghavendra wrote:
> Hi David,
> 
> On 29/07/26 01:14, David Lechner (TI) wrote:
>> This is picking up a few downstream changes from [1] to make GPIOs
>> easier to use that I missed when using the BeagleY-AI with a mainline
>> kernel.
>>
>> [1]: https://openbeagle.org/beagleboard/linux/-/blob/v6.6.58-ti-arm64-r35/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-pinmux.dtsi?ref_type=heads
>>
> Above had to be reverted due to reasons mentioned here:
> https://lore.kernel.org/all/20250221091447.595199-2-mwalle@kernel.org/
Thanks. I was starting to suspect something like that.

Is PATCH 2/2 still acceptable?


