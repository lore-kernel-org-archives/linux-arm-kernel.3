Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720D1C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 09:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tgKoLmuCFkyudsO+uSw17e0plXs6RB1iSrnaKVMcAlE=; b=by9965RZSJcYxXLvSvMHJno1zb
	LS7JI9o+PXe5vTa9iixDIsUA+O3u7jnPZ1Yyb7HGDkP1EOQmjQ9XIUTVh0PUg+qzMyq9TLd70HA0h
	LFJqbzWtPMnOOp8SyK2UR39H3KSDHvjI9Lu9luSt6xBIjKTZRKWXlUm6dhplPoTUCv9TVRWuQg4FR
	Uj4xen6smnVbCdYVM1Q8DrcaLYjESVOgrOkNRIwJojs4+vXAgNgifbxRymf+ZwK5AGL2rHAVKGIbz
	ymSJSQe7nY7jVIDRDfQz8ZvjNZqceP6cyzN2sLY9DiuHyxe5He2NDu1cUZTvRmvXG7zLi2kp1j9rJ
	HnW26x0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV5KT-0000000E6tI-1eBD;
	Fri, 27 Jun 2025 09:25:05 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV5G4-0000000E5zX-34n8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 09:20:34 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a522224582so925993f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 02:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751016031; x=1751620831; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tgKoLmuCFkyudsO+uSw17e0plXs6RB1iSrnaKVMcAlE=;
        b=fJQrVl8QJP9WmsnqtBQdY8TCOa2d9TO8XIKl37y+K3uHWVwkW/qqeiXluV59M66wa/
         kMEIR9b3ctx1xfnF72Tb9oC/YvOh57EkirALYyLDXoL1AzmhdbBoDkPR7EOSGe/GZ9jl
         4JDFhoNfJhBxwN4iN03aNkLjDwWLb6dzkzf1MfdMR6/lACRqm38QbH2Kl0P2UqrveaUL
         VikW5w04SZqYoeKvIbK9JiFeJvbVk7l36NM+iCpx9g6Rk3dHBeqEGMiSt+MGbEM5z0f+
         uqu35IAgH5YPKJzke0j/e0juxNF42GX/vlpYg+7U92TbsTRSQNNDox/LC8AQQq0s1MAs
         cFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751016031; x=1751620831;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tgKoLmuCFkyudsO+uSw17e0plXs6RB1iSrnaKVMcAlE=;
        b=i7za5++rs6ABbPryc74WLBt//0lGqEAWkcMpgsFeGFxtYqBJW7yRoG4nwJ+8Fbvug9
         pqmNAG8rCjuAKu3vKaEEsFbbGBQOmsQdije/vqyQ0BmRe0zZkSaH6DwwbRZ5Z1XtQY3Y
         zV/RVhMh9W3zvkV+IH5yqOnxxIVyYLHq6XGS5Pb57WldyNfiTaXndbeSuBD8XIq1bi9G
         0vpkHFTsE9bMAxM2qwEE50F0UHe0a0xHdpg1WW05pzPLWFliljeU161THDBC1nyEyT+p
         J6oqODWTj67R83uuZHXgTa9qhDMaPt3DU8P9qdPZSquFMSpJLXchIbfE0hhNP7IoIHEl
         W5lw==
X-Forwarded-Encrypted: i=1; AJvYcCV0coqUoFbLHN0oXBLt7DDkbLSX6RlkKCwz1bGsugml66T9Z+WuCaB9dmovrzAYKYTnUR3du+Ofu9anib9h4A5O@lists.infradead.org
X-Gm-Message-State: AOJu0YznXCCJeOIPttXJBvRRz8pHwN5FiM17w5v1ariInhBQ/NLg3Vus
	TuFcosiDp2a/ZUwDoB+dRP0URRNO44QCMID+gtA1CuYl3hp6Eijze431xC7ugWfCA7Y=
X-Gm-Gg: ASbGncuZioXyb8Z8uB9KPZ2UiVUtA2kjQ4tDv2nikvbhPJ5nKFNt98+9WaZWe0yFtk4
	XNRo1xmzVdqnT8WmOdbjtRrfXf9++SgGrCHEdy3yA1fJY5tmsRVHpBgxpEHH3BiHtG3ulus1mO5
	TsMnDRdf23iZiZKNy+s/wHUCvOGmeUeQUAuNakt9+kSetw2yqsKV1GflkGP7A9gYR4fGaMW7tuS
	HgrRTrhhPaolYzQ2Wko2gpzFL5LNEKm/QxoqIPVVzORyWX38samOlaFCWYFj08IVwwXVt5OxFX5
	buhZMFHJm6NRoFlHKI0aC3/0Z97L7IxLj9Hsd4+9CGGghsF0G6AD/CLRWUSR5u58nUc=
X-Google-Smtp-Source: AGHT+IF5bV6mT3bv7iCEja7u7RBHkEVwKldtXgIAv6BJdG93VXVqYj/0JSIpoX8i21kmQ29S6VbX7g==
X-Received: by 2002:a05:6000:2013:b0:3a4:f7dc:8a62 with SMTP id ffacd0b85a97d-3a8f2f34f7cmr2365868f8f.0.1751016031058;
        Fri, 27 Jun 2025 02:20:31 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a390bf8sm45349135e9.4.2025.06.27.02.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:20:30 -0700 (PDT)
Message-ID: <508b60bf64d060fb48395366b8377927d248b60b.camel@linaro.org>
Subject: Re: [PATCH v2 2/4] arm64: dts: exynos: gs101-pixel-common: add
 Maxim MAX77759 PMIC
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Catalin Marinas	
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Peter Griffin	
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Date: Fri, 27 Jun 2025 10:20:29 +0100
In-Reply-To: <4cbc691e-c725-48eb-9932-4549381fa55b@kernel.org>
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
	 <20250524-b4-max77759-mfd-dts-v2-2-b479542eb97d@linaro.org>
	 <2c491166-d8ae-4fb6-a4f7-74e823e1205d@kernel.org>
	 <b2c3b78d60f3dc3e4576e8b79298e22ea46567c6.camel@linaro.org>
	 <4cbc691e-c725-48eb-9932-4549381fa55b@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_022032_778761_628721F1 
X-CRM114-Status: GOOD (  16.00  )
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

On Fri, 2025-06-27 at 11:12 +0200, Krzysztof Kozlowski wrote:
> On 27/06/2025 10:54, Andr=C3=A9 Draszik wrote:
> > Hi Krzysztof,
> >=20
> > On Thu, 2025-06-26 at 21:49 +0200, Krzysztof Kozlowski wrote:
> > > On 24/05/2025 07:21, Andr=C3=A9 Draszik wrote:
> > > > +
> > > > +		gpio {
> > > > +			compatible =3D "maxim,max77759-gpio";
> > > > +
> > > > +			gpio-controller;
> > > > +			#gpio-cells =3D <2>;
> > > > +			/*
> > > > +			 * "Human-readable name [SIGNAL_LABEL]" where the
> > > > +			 * latter comes from the schematic
> > > > +			 */
> > > > +			gpio-line-names =3D "OTG boost [OTG_BOOST_EN]",
> > > > +					=C2=A0 "max20339 IRQ [MW_OVP_INT_L]";
> > > > +
> > > > +			interrupt-controller;
> > > > +			#interrupt-cells =3D <2>;
> > > > +		};
> > > > +
> > > > +		nvmem-0 {
> > >=20
> > > Why is this called nvmem-0, not nvmem? Is there nvmem-1? I see bindin=
g
> > > does it, but why?
> >=20
> > 'nvmem' is used/declared by nvmem-consumer.yaml as a phandle array
> > already so using just 'nvmem' fails validation:
> >=20
> > Documentation/devicetree/bindings/mfd/maxim,max77759.example.dtb: pmic@=
66: nvmem: {'compatible': ['maxim,max77759-nvmem'], 'nvmem-
> > layout': {'compatible': ['fixed-layout'], '#address-cells': 1, '#size-c=
ells': 1, 'reboot-mode@0': {'reg': [[0, 4]]},
> > 'boot-reason@4':
> > {'reg': [[4, 4]]}, 'shutdown-user-flag@8': {'reg': [[8, 1]]}, 'rsoc@10'=
: {'reg': [[10, 2]]}}} is not of type 'array'
> > 	from schema $id: http://devicetree.org/schemas/nvmem/nvmem-consumer.ya=
ml#
> >=20
> > https://lore.kernel.org/all/20250226-max77759-mfd-v2-3-a65ebe2bc0a9@lin=
aro.org/
> Heh, this should have been just folded into the parent as Rob suggested
> during v2

AFAICS and remember, the other discussion was about gpio properties only,
nothing about nvmem. And I addressed all gpio related comments I believe.

> Well, let's just merge it.

Thanks Krzysztof.

Cheers,
Andre'

