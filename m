Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85476C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 11:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YrYJ8w60yCUBZigSm+JV9lV/nNFVXOxrB9Gm7xPQC6A=; b=Va7ltyscLzhKkKhn7MxkTKAaC/
	j7Vf0XRq74EGXcULXEHZNGBvj5MhCk0mC0Zwdw3IEjXMkYvYMg79JhiWJb7ShrDpx3xWOpCzuTBOF
	mfb4DWeYXoc4tWusIFNs9AxGnKQxVGFIbCJUWXP7OrfBpm9ew8bYfXZt0+L8DB1dGwZ8jHo/srWlf
	D4fITGm3BNVKEP+EBRAwrGSYUcvgzBjn6EquuCkJUV1mbVemuMdVkKVq3yp5CmBAfxF7F5h9N670+
	u2vecUKIG5no/O+Pw9WA4mMS7jDW4tzSXjI3AQpulaw3UOea1+gBz42HNbXneeb3gdCqpijoGvYNg
	HIXvnF1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDaW-0000000Cueq-00Fz;
	Thu, 19 Jun 2025 11:37:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSCoR-0000000CmyT-13J4;
	Thu, 19 Jun 2025 10:48:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YrYJ8w60yCUBZigSm+JV9lV/nNFVXOxrB9Gm7xPQC6A=; b=BkwmLkYZlnH6bFNcEbVWtwgzGh
	mnQ/CWfvOd8Wx/NaPEYBAB/0x7Jf1o0XPdt3HGj5Pv9zp0l1zoXv8S924e0vUGpfpFBQnjbMS+212
	32yPTUw3+h1V1yCw3PsfIEZJkTNDtiKoPEl6JtWCUCduCwYSYTorUxhmh7TRmqXBUeCsKpWppre0h
	tZYCQdyVl6hYdIdBRq3KwDG1WXmxw2bPl9Op+cu3sfPH8nitJeUYYPVMZpRNziKCQwZrj52m3hSXB
	IBhzl+qOwS/KaoUBNUzJfGPHWah19hgSpMWywTCsCmLIwoyymxNPRzpIs0o5oqbmgtQBvNsOmsqQ0
	0znGK81g==;
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSCoO-00000004Q9O-2N1b;
	Thu, 19 Jun 2025 10:48:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF5F44396F;
	Thu, 19 Jun 2025 10:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750330079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YrYJ8w60yCUBZigSm+JV9lV/nNFVXOxrB9Gm7xPQC6A=;
	b=Fdj0OnyGM/LIKEoR67MIFPtCrbEaBwTFCjHjfXIe2gV/5Q5MdeVZmWL1UAwK+YucK6tESv
	1WPzDuiDlQMae4blgiTIVdGUVGALZJaWeKzzTlv2IaBS0NpVQiMsP7WDy/DlTfCSBX7TWw
	7mXdmJjQ/ER2+q+7oHYIyzoEecykD096ST65HAG6c6lbzw38hVTaNEKKnbRDk6+Xote/rB
	3TzQvUCx+GFM7JZx+sD6k3Nmawn3oHIkyu498nTe1rPNCEv2CI6v5l6sFDlUrro8jtextJ
	jHeePypFVx4xYHK0U7uqG9y3VLi+wk3YVNoMFY4MX2BBz4w97QiKtD998UdXZg==
Message-ID: <c26ce505-343a-4759-90b5-a026c66979c7@bootlin.com>
Date: Thu, 19 Jun 2025 12:47:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: rockchip: Fix the PinePhone Pro DTS' panel
 description
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Diederik de Haas <didi.debian@cknow.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250619-dtb_fixes-v2-1-abd711d11b67@bootlin.com>
 <DAQEX04P5320.CQDU7SL7AV4A@cknow.org> <5461462.0VBMTVartN@phil>
Content-Language: en-US
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
In-Reply-To: <5461462.0VBMTVartN@phil>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehfedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepqfhlihhvihgvrhcuuegvnhhjrghmihhnuceoohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeuieffteevudettdejleejheekkeeftefggedttefhheeikeejgeehveefjeejheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehiedphhgvlhhopeglkffrggeimedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehiegnpdhmrghilhhfrhhomhepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehhvghikhhosehsnhhtvggthhdruggvpdhrt
 ghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughiughirdguvggsihgrnhestghknhhofidrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: olivier.benjamin@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_114804_873859_918DA396 
X-CRM114-Status: GOOD (  20.52  )
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



On 6/19/25 12:31, Heiko Stuebner wrote:
> Am Donnerstag, 19. Juni 2025, 11:46:15 Mitteleuropäische Sommerzeit schrieb Diederik de Haas:
>> Hi,
>>
>> Thanks for working on upstreaming PPP things :-)
>>
My pleasure. I also have 
https://lore.kernel.org/linux-rockchip/20250509-camera-v3-0-dab2772d229a@bootlin.com/ 
pending = )
>> On Thu Jun 19, 2025 at 7:21 AM CEST, Olivier Benjamin wrote:
>>> Fix a few issues in the panel section of the PinePhone Pro DTS:
>>>    - add the second part of the Himax HX8394 LCD panel controller
>>>      compatible
>>>    - as proposed by Diederik de Haas, reuse the mipi_out and ports
>>>      definitions from rk3399-base.dtsi instead of redefining them
>>>    - add a pinctrl for the LCD_RST signal for LCD1, derived from
>>>      LCD1_RST, which is on GPIO4_D1, as documented on pages 11
>>>      and 16 of the PinePhone Pro schematic
>>>
>>> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
> 
>>> +	lcd {
>>> +		lcd_reset_pin: reset-pin {
>>
>> I don't know if there's a 'hard rule' for it, but I'd recommend to use
>> ``lcd1_rst_pin: lcd1-rst-pin {`` as that would match the naming from
>> the schematics. I realize that some but not all (other) pinctrl nodes
>> follow that 'rule', but it helps with traceability.
> 
> not a "hard" rule, but a strong preference.
> I.e. we want people to ideally be able to just hit search in the
> schematics PDFs for the name they saw in the devicetree.
> 
> Sometimes that is not possible, because of naming conventions or
> overly strange schematic-names ... and sometimes things slip through
> as well.
> 
> But following the schematic names, is the general goal.
> 
Very fair. I used "lcd_reset" because even the schematic is not super 
clear: it uses "LCD_RST" on page 16 and LCD1_RST on pages 11 and 16.

> 
> If this stays the only suggestion though, I can fix that when
> applying. Or you can send a v3 - up to you :-)
> 
I'll correct to lcd1_rst_pin and send a v3 (most likely later today)
> 
> Heiko
> 
> 
>>
>>> +			rockchip,pins = <4 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
>>> +		};
>>> +	};
>>> +
>>>   	leds {
>>>   		red_led_pin: red-led-pin {
>>>   			rockchip,pins = <4 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
>>
>> Otherwise,
>>
>> Reviewed-by: Diederik de Haas <didi.debian@cknow.org>
>>
>> Cheers,
>>    Diederik
>>
> 
> 
> 
> 

-- 
Olivier Benjamin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


