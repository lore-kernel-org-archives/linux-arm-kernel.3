Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D26C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 10:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGkgFjKkiVrSJKm5JgSkg1YSBxlYKQdt2nuUWNPynVc=; b=uuon9g0m20/MOwZFjZ1roZsDC6
	6U1U1+N/YcH9b2MDqSprLc9hKHVYXORa/MxaEcMykBbvTu9FAIyHtAf+XKb76cDzmzQ86WihC+V+W
	uoxNJE/GgYx8FXspnKTRt7C9XTZjEWtFOuqH/h1YAWVVi+whvx5olUxgK0HTOf1Zs37A3hL+++QCX
	coQHWAgHTVxKASd7fTN1IsYhwLaOQyMZyS6D36T6xPEWFdOjN8QbPgB2vWpOMgRLWBERcIFkw6i6H
	LZFrSSuuJwBLL+ePEicWiWtfOaQUjWUQoneAlQN3XKUQ7hvbIel2TLipQ7t8nW7Xct3EsLdetLaCo
	LQrxloaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRTe4-00000006vyu-2r0W;
	Tue, 17 Jun 2025 10:34:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRTS9-00000006tqY-2JNB;
	Tue, 17 Jun 2025 10:22:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dGkgFjKkiVrSJKm5JgSkg1YSBxlYKQdt2nuUWNPynVc=; b=UlWxWXkPBIG29iI+85cBu4qJar
	ZBpNgWKSkgpzLjG5PspgEbdWLcXLOPvfOA5ZUutt7t0n5eIy5cDC0hacmCUevKv6SHSJTZaee35f3
	xyh4Vy3YDdW5JBSfNbA77ssAm9NZf/ia0ghYrDWiDm/2e7JM3C95z5fh8hOeCEAA/Zjwr7sCXpA9c
	YTi4KRcYLwdWe8OCR9WKS/nOAWFg1OL72sAuaXEY8V/IrURdqRB55EwpBexhwOxO/8XH4H9WH4c/x
	liCqi0Hh2XDThp67xrq5pcAKAHEuthD0yugl1luHAdIM9yiJvch6Gw+9qgzPk56vjml0rbW2SU4gS
	eaLrC+Ow==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRTS6-00000003m4I-39vz;
	Tue, 17 Jun 2025 10:22:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0356440D5;
	Tue, 17 Jun 2025 10:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EC44C4CEE3;
	Tue, 17 Jun 2025 10:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750155717;
	bh=vHcf4VFbrCSFj347QsP8KTvvWwno+mCruZnJ7njeA4M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lHAq2dRxzfPR/f4Y/bT3gv50k7gbevCTDpCjdFaZah/itIoTTzs0NrQfljos3bGU6
	 rqUvwhe1ml6wJI7K9G0RoZ2VF9kCG/HZpO/fsw4gtAMJVRWX9ngSDJO+eNiFxIOfrY
	 XAVcVUXz0AnaUA7N78TM2/FQ08lQEUML7rLyOGRaOvRKWzYJCgBhF3oNKO/8K7Rx9x
	 V175pq8Txvg54WKgdcK2sLJEXHe4q/kDYXIOOF5Bv2eFOILfKILRZtMhAhypR4aQVQ
	 mFE0UO5IOZgL1dQW78ZHYcJ1HeSM3omvp0ANomXwdhE2xAwSy+fUzd3zDim1IRPGPd
	 vokZv3tsCGdDg==
Message-ID: <704d75df-a484-4da3-9bcb-85b480e2ecf0@kernel.org>
Date: Tue, 17 Jun 2025 12:21:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: mfd: rk806: allow to customize PMIC
 reset mode
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Quentin Schulz <foss+kernel@0leil.net>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
 Daniel Semkowicz <dse@thaumatec.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250605-rk8xx-rst-fun-v2-0-143d190596dd@cherry.de>
 <20250605-rk8xx-rst-fun-v2-1-143d190596dd@cherry.de>
 <20250617-small-vivacious-labrador-7f0eb0@kuoka>
 <b079fc14-8692-4521-bd81-fe2fca713f2f@cherry.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <b079fc14-8692-4521-bd81-fe2fca713f2f@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_112203_236017_4227F688 
X-CRM114-Status: GOOD (  28.32  )
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

On 17/06/2025 11:38, Quentin Schulz wrote:
> Hi Krzysztof,
> 
> On 6/17/25 10:08 AM, Krzysztof Kozlowski wrote:
>> On Thu, Jun 05, 2025 at 05:41:06PM GMT, Quentin Schulz wrote:
>>> +  rockchip,reset-mode:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    enum: [0, 1, 2]
>>> +    description:
>>> +      Mode to use when a reset of the PMIC is triggered.
>>> +
>>> +      The reset can be triggered either programmatically, via one of
>>> +      the PWRCTRL pins (provided additional configuration) or
>>> +      asserting RESETB pin low.
>>> +
>>> +      The following modes are supported (see also
>>> +      include/dt-bindings/mfd/rockchip,rk8xx.h)
>>> +
>>> +      - 0 (RK806_RESTART) restart PMU,
>>> +      - 1 (RK806_RESET) reset all power off reset registers and force
>>> +        state to switch to ACTIVE mode,
>>> +      - 2 (RK806_RESET_NOTIFY) same as RK806_RESET and also pull
>>> +        RESETB pin down for 5ms,
>>> +
>>> +      For example, some hardware may require a full restart
>>> +      (RK806_RESTART mode) in order to function properly as regulators
>>> +      are shortly interrupted in this mode.
>>> +
>>
>> This is fine, although now points to missing restart-handler schema and
>> maybe this should be once made common property. But that's just
>> digression, nothing needed here.
>>
>>>     vcc1-supply:
>>>       description:
>>>         The input supply for dcdc-reg1.
>>> diff --git a/include/dt-bindings/mfd/rockchip,rk8xx.h b/include/dt-bindings/mfd/rockchip,rk8xx.h
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..f058ed1ca661185f79738a358aa2d4f04539c590
>>> --- /dev/null
>>> +++ b/include/dt-bindings/mfd/rockchip,rk8xx.h
>>> @@ -0,0 +1,17 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
>>> +/*
>>> + * Device Tree defines for Rockchip RK8xx PMICs
>>> + *
>>> + * Copyright 2025 Cherry Embedded Solutions GmbH
>>> + *
>>> + * Author: Quentin Schulz <quentin.schulz@cherry.de>
>>> + */
>>> +
>>> +#ifndef _DT_BINDINGS_MFD_ROCKCHIP_RK8XX_H
>>> +#define _DT_BINDINGS_MFD_ROCKCHIP_RK8XX_H
>>> +
>>> +#define RK806_RESTART		0
>>> +#define RK806_RESET		1
>>> +#define RK806_RESET_NOTIFY	2
>>
>> I do not see how this is a binding. Where do you use this in the driver
>> (to be a binding because otherwise you just add unused ABI)?
>>
> 
> Explained in the commit log of the driver patch:
> 
> """
> This adds the appropriate logic in the driver to parse the new
> rockchip,reset-mode DT property to pass this information. It just
> happens that the values in the binding match the values to write in the
> bitfield so no mapping is necessary.
> """
> 
> I can add useless mapping in the driver if it's preferred. I had the 

No, I comment and raise questions when you add ABI which is neither ABI
or should not be ABI.

> impression that simply using a hardcoded value in the DT binding and 
> then writing it to the register was not desired, so the constant is now 
> here to make this less obscure from DT perspective though I'm still 
> writing the value directly in the register. If hardcoded values are ok 
> in the binding, then I can remove that header file.

If you want something user readable, make it an enum string or keep the
header within DTS.

If I review it like that, it will be brought to me next time for some
other patch saying that commit was reviewed so I can do the same. [1]
Therefore since I object against unused binding headers in general
(there is no user here technically), I need to object here as well. :(


https://lore.kernel.org/all/0d381ad0-85d4-43de-a050-3b9ed03bf5d8@kernel.org/

Best regards,
Krzysztof

