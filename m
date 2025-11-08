Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A64CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 14:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KopGgc9wNhXNv6aUy2iwWzPGcUR7Lrgc7BISJyQ8M9c=; b=YArbr+n+0IHuenbA1s0juD0bdZ
	m/W8aCeUGQLluItX7+la8wKpMYO+d7xF6kEDjbL/YMo8Fixi1UIBfOIegnVwCTNgkZ1GonPu3zmbA
	uzNZXIhjJBXt5QSbOlwrXLVW4SjDZfznJ0QQGpd5KZqiBAeOMKnlndH0juqRbqWeUu0cyTevc+Emu
	G7JdpXNkMv41a5//Ly/87IsmPurh34XEQK94n67tyRGuGvIL7t5Wk/4xUYTk3u3cv+zHXpK9+jTfL
	gxAUtfP34bnbEFlaLYwgxzXWFekqJ0lRO4MlDoO4qJvH6ej68Ra5s9OvduG5JIq7B5Bouuxel5yV3
	so9ic4OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHkDu-00000003CbF-21kQ;
	Sat, 08 Nov 2025 14:47:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHkDs-00000003Cb2-1tcn;
	Sat, 08 Nov 2025 14:47:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E09A760052;
	Sat,  8 Nov 2025 14:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE16C4CEFB;
	Sat,  8 Nov 2025 14:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762613242;
	bh=seiWAXWA40Itm0WaQziqNpXmGAyxL/tF/QM25Q9yPaE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W7dvfHhKNsU2mj3j+TrfjRX13sG7PZgOKWXoqyHVzmFjOfSxG4gU7KsPOiXMfgXV+
	 AJH5lZFoupvkTfXhrp8dRruIYrtm5ZQ3xSpMJIQeQRR0+N6wzC7t9VpsJ1ZFusIW2v
	 cW+tm6YfbFbWIFHr9bMWroKU/WgzeYm18BkDEdk6oiAst/kT7D76HvAgPK7iFPa18d
	 x3OquFQ3LvWgGKiJOuSD1fxykDRiXNVK5wJw+8Lf9cAiXJzPFWoyO1P243A91bXLuy
	 +6xYwJVXNo92+1XTdLO3u+2bQnZ2Lg7P2lzrdJ7eb9pWs4S96T535g3thIXSOzJpvx
	 zJpp/RItwSa/A==
Message-ID: <287444fa-120c-42b4-9919-2f05ab1a2ab7@kernel.org>
Date: Sat, 8 Nov 2025 15:47:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] riscv: soc: re-organized allwinner menu
To: revy <gaohan@iscas.ac.cn>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Rob Herring <robh@kernel.org>, krzk+dt@kernel.org, conor+dt@kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Yixun Lan <dlan@gentoo.org>,
 Drew Fustini <fustini@kernel.org>, geert+renesas@glider.be,
 Guodong Xu <guodong@riscstar.com>, Haylen Chu <heylenay@4d2.org>,
 Joel Stanley <joel@jms.id.au>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Han Gao <rabenda.cn@gmail.com>
References: <cover.1762588494.git.gaohan@iscas.ac.cn>
 <d17a3a01e2b1297538c419b51953f9613426ba42.1762588494.git.gaohan@iscas.ac.cn>
 <e98a1e59-f3ff-4e9f-a180-79aea9943236@kernel.org>
 <43109A90-8447-4006-8E29-2D2C0866758F@iscas.ac.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <43109A90-8447-4006-8E29-2D2C0866758F@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 08/11/2025 14:59, revy wrote:
> 
> 
> 
>> -----Original Messages-----
>> From: "Krzysztof Kozlowski" <krzk@kernel.org>
>> Sent Time: 2025-11-08 19:29:07 (Saturday)
>> To: gaohan@iscas.ac.cn, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Chen-Yu Tsai" <wens@csie.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>, "Yixun Lan" <dlan@gentoo.org>, "Drew Fustini" <fustini@kernel.org>, "Geert Uytterhoeven" <geert+renesas@glider.be>, "Guodong Xu" <guodong@riscstar.com>, "Haylen Chu" <heylenay@4d2.org>, "Joel Stanley" <joel@jms.id.au>
>> Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, "Han Gao" <rabenda.cn@gmail.com>
>> Subject: Re: [PATCH 1/3] riscv: soc: re-organized allwinner menu
>>
>> On 08/11/2025 09:20, gaohan@iscas.ac.cn wrote:
>>> From: Han Gao <gaohan@iscas.ac.cn>
>>>
>>> Allwinner currently offers d1(s)/v821/v861/v881 on RISC-V,
>>> using different IPs.
>>>
>>> d1(s): Xuantie C906
>>> v821: Andes A27 + XuanTie E907
>>> v861/v881: XuanTie C907
>>>
>>> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
>>> ---
>>> arch/riscv/Kconfig.socs | 22 +++++++++++++++++-----
>>> 1 file changed, 17 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>>> index 848e7149e443..7cba5d6ec4c3 100644
>>> --- a/arch/riscv/Kconfig.socs
>>> +++ b/arch/riscv/Kconfig.socs
>>> @@ -54,14 +54,26 @@ config SOC_STARFIVE
>>> 	help
>>> 	  This enables support for StarFive SoC platform hardware.
>>>
>>> -config ARCH_SUNXI
>>> -	bool "Allwinner sun20i SoCs"
>>> +menuconfig ARCH_SUNXI
>>> +	bool "Allwinner RISC-V SoCs"
>>> +
>>> +if ARCH_SUNXI
>>> +
>>> +config ARCH_SUNXI_XUANTIE
>>
>>
>> You should not get multiple ARCHs. ARCH is only one. There is also not
>> much rationale in commit msg for that.
> 
> The main goal is to avoid choosing multiple IP addresses for erreta. 
> If using Andes IPs, I don't want to choose XuanTIe (T-Head) ERRETA.

Not explained in commit msg but anyway not a good argument. It is some
sort of micro optimization and you completely miss the point we target
multiarch kernels.

Best regards,
Krzysztof

