Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D06CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 04:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OeHacbZXrsMU4ngrgTltuf0nP+fevY8eP/EXHUfGj+Q=; b=00Ozle385ZRuDmzfpi4Qk7rlO3
	oy6zkThg5EDTzYh2WD63msGHAYSsTQid9dQzL8tri3uWESDwVNb6H8U9Y9K+hUP+JLC15pLyx2ZZ0
	K+H5nmtHRfTxX96ZaUA1Bkmiuc205b5Q816vbPkMuGThq4wznLeLLNvJTVfw8Yl01hseHdy25VnaN
	szBFhIkaXSkbyqgUIjHF+MltnmO/TlAjq1LJgyN24HltvbrDjfAmGGoSH5OIvP6U+MA7roU8DBAc3
	TbDZolU9RcWMpq4uis262gkPyD321t9qhuSogENtf2v66Fv+iMI550++wg4+VHrpNd17lpjI2ua4y
	JE1wcVIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMI9q-0000000CFpS-2Zt6;
	Mon, 11 May 2026 04:22:18 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMI9n-0000000CFoJ-2dIG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 04:22:17 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2baca78cfaaso26122425ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 21:22:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778473334; cv=none;
        d=google.com; s=arc-20240605;
        b=DXFXpJw7Eh2UEboZyJEXiYbFMzW0QBJOw0ITKH8vkIPVNSuJYi4D8zq+d6jSXkEOor
         wT85h+UqZid14RLsfuEuHQY1A9xGpjL5km6ARYECcp0dnkfYnIV2qUkE5qbXSFw1xxWV
         pl8gA0npnxvOU7bPjwtn7Gl1/a/Q6iYPIzHhyNMAQIq+4MxSPgS5+gH2MMg3bqZSTTqo
         ZXyIXRYnTWwElUTRSbV0WQRRhUuyMjXzjJSRi8+HQvhETYvZQFeWfB679rcjjoqP7QHI
         ePedVaBEeKzkxAR3u2tN6mx/fuFKHmkVJNLxnuA5niPNNKibdU868j6omoFWbcGWhJmh
         5SQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OeHacbZXrsMU4ngrgTltuf0nP+fevY8eP/EXHUfGj+Q=;
        fh=19Nssb2gLZqrKwjrJUpf+rth//MkumA5z0rQ1mixKiM=;
        b=SYQJpdxy5JRxkb43N47SXsY43lAGg4Vp+2TRd9T130+dF5XPeioMaJDsEXJUwSiSdB
         16/WtjJba4Jt8Zi5HB5vMC6JZZApqPZQsJJ4tbza0R588KoHQpKCA2buSULKSCe+cgms
         lNfB7aDhXAN359imDv+q/zziCBUKxxGhoAR4VODRi2qQO+tG5w4zYCpLv+U5wQrTc5rS
         JOImFvQO2vu7+U4bNJ7mzkAYSnfztXnLCOzssIx8SujEXRT0KrmwviQ9GLNtdeR/cy3T
         kIgEEx+3QsUziFIur8dKHF4RrhyZVUJa9F1POGiyPKqnTwBOElFt8oKGALlv5mG6URCa
         kNmQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778473334; x=1779078134; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OeHacbZXrsMU4ngrgTltuf0nP+fevY8eP/EXHUfGj+Q=;
        b=Qd6Jl5wwWalIAgYGBUvpTVVF8lZrLrrz300qj/Qg9dGBCVZW3bft2anacsNTLr7WxO
         nMS+NsTjweI371vca8fpXyR34RnfbxFm8kh/pQlmacYo0zVdlMjH3/Q3Q0QpM5XJ7am3
         /P8iAHyEUQxzRA13GnQFKUx+ti7DZ927c6ya5gWs5KTvzrYSf8stUSQGrqsy4RgHgj9T
         i+8xNBAqWsk4C9+Po8qF1IZXLHgbpdJnbwvZoKQn0VhhRghFmZwt5hw1MYRXFi6VvC56
         aIYl8y+7Me96t4+brJWRS1T9mq+nb0fWuksaeBaH5+1At0nVN9uHImKak9qxJhyUu60m
         gu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778473334; x=1779078134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OeHacbZXrsMU4ngrgTltuf0nP+fevY8eP/EXHUfGj+Q=;
        b=M57V9SL362+qsblDauH7V0IomAPWi2y9ifZqcUKD1NtXDvLj1lNISLJ+wpi40PxPfH
         x/v/5oCybl/6TjVJPtgzYTcNmQ3g6cQVco5h62O6kGbJqXxJric8NllN0H26PnF4RK9K
         Vge7DKl5IRk2VPi3cISgIaUGgNuw5BmsVHjFjgIBPOAEc7k6MMadzOG35QG20e8MlfSv
         d857Xmod0n3Rs6Pl8+S1UIjGIXBEV2HrIm/ItCd354/SSBUAJ2KBg8L3ncybuSY9f5ZX
         RE6hvhNz4arnk1zhg73y1B6p53YGIlMBBvGPhaJsRcf+kRr3XYXWr09AGmu3V3rO/BWy
         cJpw==
X-Forwarded-Encrypted: i=1; AFNElJ/XJ1g7EvmYhFV2fN+xQVl5xMCp3xOEnWxtb9dhWaZzFdZKC+FMypCkpP3ELLa7csUIZqrXa2VQz7MALZu97Y4f@lists.infradead.org
X-Gm-Message-State: AOJu0Yzse9JquEPlEbn4/6J4/UGC0W6L7S0Xpq3gUxApYWfoCwYyurru
	ievQ9S4gv9+cXzDdZEPqFgO4W7z5qsv+qzFao2rmPOGUCzhlTncbExm3OXNWKEZGGeyx0jgDV7Y
	JVzSX5ROKCpgEYYgLJvCUydYN99+SDEQ=
X-Gm-Gg: Acq92OFdQJLRtFDVq1HSNhDrRitBSBs+GhZm0VPpuEsg2qgxgiuLeNLFS4luqKAsl/W
	1Jn3Qlb/NQ2wZ0PrPDkFzV3mm0df/U+bR8dwXm2Kgl2k6t8bxRqX9dyeutiPoEl5YZm72519RqW
	fIWWsrHOP5giceWz37dyO11SzULkO/u04YxW0nAO/bpLegb/G+SxDAu782pzmrdArfixyal56Ph
	kFjMVyjqcylXrPjErRNJy+kUcbusBfzFtXkRzpAKQ+cx9szGF3zxYNpFZ6RkwMXyuL5ErfIDeOe
	q87OrQCCIDc3FrjCUwIbqyt3ao6t2Zq7LyMlQ5QFnJ8p+JX2MlXvFnk9AMU=
X-Received: by 2002:a17:903:13ce:b0:2b4:62bd:ee3 with SMTP id
 d9443c01a7336-2ba79c2cfffmr234513675ad.33.1778473334534; Sun, 10 May 2026
 21:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260423042831.21114-1-phucduc.bui@gmail.com> <20260423042831.21114-2-phucduc.bui@gmail.com>
 <20260423-ingenious-psychedelic-jaybird-40bb4d@quoll> <CAABR9nGH4yZcgyzm=wNYVHB2vLhojZJSHKOC6dSeQPm0rbh4KQ@mail.gmail.com>
 <ce219aa2-0bb1-4a74-b40d-bd753f1a22dd@kernel.org> <CAABR9nHaGBU9KAWJZrnBy8HO0Waccp8CCGmBdKJ3QOEb8WZsXA@mail.gmail.com>
 <20260505211006.GA3875657-robh@kernel.org>
In-Reply-To: <20260505211006.GA3875657-robh@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 11 May 2026 11:22:00 +0700
X-Gm-Features: AVHnY4Ilmsly8mVMu2VKK2pF9rv7AIJO9kq9XO5ctET-fhRje978uj2nKP4vMgU
Message-ID: <CAABR9nHEVsS_Tf6Y7AXnLJwsDahwn+o1vS5dd27m4QLQAixL_A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: drop redundant wakeup-source definitions
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Joseph Chen <chenjh@rock-chips.com>, Chris Zhong <zyw@rock-chips.com>, 
	Zhang Qing <zhangqing@rock-chips.com>, David Rau <David.Rau.opensource@dm.renesas.com>, 
	Animesh Agarwal <animeshagarwal28@gmail.com>, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_212215_673669_9F117477 
X-CRM114-Status: GOOD (  25.15  )
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

Hi Rob, Krzysztof,

On Wed, May 6, 2026 at 4:10=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> If this was a problem, then it probably would have been fixed already
> because it generates a warning. An I2C device probably isn't all that
> coupled to SoC power states, so boolean is probably always going to be
> used here. But maybe not.
>
> If we do any cleanup here, I think that should have exactly 1 location
> that reads this property instead of 77. Perhaps the driver core can just
> handle everything and drivers don't have to deal with it.
>

Yes, the I2C core already handles the 'wakeup-source' property centrally;
therefore, individual device drivers do not need to implement their
own handling.

While no I2C devices currently utilize the 'phandle-array' type for
this property,
we should ensure the infrastructure is future-proof. In cases where a
phandle is used,
additional firmware-level handling might be required depending on the
SoC architecture,
similar to how the m_can driver operates on TI SoCs.

References for that implementation can be found here:
Firmware: https://elixir.bootlin.com/linux/v7.1-rc2/source/drivers/firmware=
/ti_sci.c
DTS: https://elixir.bootlin.com/linux/v7.1-rc2/source/arch/arm64/boot/dts/t=
i/k3-am62a7-sk.dts

To address this and align the code with the core schema, I have
previously submitted patches
to transition the I2C core and clean up the m_can driver:

I2C core patch:
https://lore.kernel.org/all/20260505043145.33284-1-phucduc.bui@gmail.com/
m_can patch: https://lore.kernel.org/all/20260504050702.34013-1-phucduc.bui=
@gmail.com/


> It's really outside the scope of a device binding what is used for
> wakeup-source as that depends on the platform. So I think just
> 'wakeup-source: true' in device bindings is fine. I don't think we have
> to change all the existing cases either, but the patches are already
> written so I don't have an issue applying them.

Understood. I will update the commit message wording in the next
version.

Best regards,
Phuc

