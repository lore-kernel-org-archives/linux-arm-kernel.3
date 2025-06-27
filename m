Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A71C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 08:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0BS+6uy4su/8ABLs5cJdrouwkh2bvREAZhph1XMTpHE=; b=Zr5Y5oqvNYHz3Y5+r+tmupJA7d
	OyBVLjBDAH3M4W9kC5W1Zbqh98RtB25RKSw4oCDsjdUGRPKhL1g5qFxl8jn/OZ+GoIxAWwFDDQIX7
	Q2pxAsKWpdUWwpW3YvVfRpU2MbY6SBeqGan0mYQSI+qNp2WG+T6JgUyolxLO66teZ5jiJlfBV5QhE
	SVEcWZo2Qmq0ex9Ei3biffdrUUaxiSPHncOFXnEA5cLdbP/ohxxzf7JnD59wx9dMrCwEe7Bx9Qt5I
	ZoKNMLpkIA1+ILJm3718t3294DDHE+Wl2+INQiHClf8giF9agIzS3LN413JoF1aGswxdx+ri/HMDX
	0OZryJ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV4t2-0000000E0z0-3LtH;
	Fri, 27 Jun 2025 08:56:44 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV4qi-0000000E0ih-3Wsa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 08:54:22 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-453643020bdso16658175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 01:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751014459; x=1751619259; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0BS+6uy4su/8ABLs5cJdrouwkh2bvREAZhph1XMTpHE=;
        b=nE73/XJkyPH3EvzKKKSi+X3XrIlTSFsGwrGnQcSnluDTh+Whudci7fngsd1naVNs22
         C/gf+OIdaULB/hNHHtBwxpvdcR34p0jBBHSazCfyBqxAWpLmuRo3wqP2XD4/Wi4UPuC/
         mxFWRTopCG8dhEJZm/q7pZD+XoV+Zq6oisq2vxXWkVGjLRgsCcfdPF2E5IpH+Q5SScED
         bIkc5JNAoCpqGjGX1Y0LV5MxBsux7I8DA+ozqjqKP2Wn0Rjx1zK9Jo6yL5FRQqxt6W6P
         LclexCrdNWAqbby1GicAt1irZ4meYJjzbbR/b8NThOBgipM0N5qXC7K1MeddYYjLz3Dn
         f4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751014459; x=1751619259;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0BS+6uy4su/8ABLs5cJdrouwkh2bvREAZhph1XMTpHE=;
        b=fvvDkbT3iJNTgp99Nsxt1dtQGeDV11YkCMAAKz6kmLKX9jtcEC6lqb5GCJHUlVAtVp
         g9s04bv8SIgjtameB86k1J1D5hFsjcLEjOfBHq255MLSC6V4GtOJL53ZNJLu2xB8RvuE
         M66m4Ju+WtxoK0oF0/5P0ER7B0SY3DDbN+IoglJBJ7fRVAE0aZZz6jBmrZsretmrF9jI
         ryPfat6fyYmzH2k18CpPxbf9qsASXSHWVm88xSKbBgfnr1uPfCTMaL7C6sIkuvsoyWJb
         /6Rln6UamtO3rsgul8BU6ErSr6uGjXI4fG4t15SylFpnM1iAQztIT5lWdrX/uWxB+/yN
         JsqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyVF7SklNEJgJSrKfOZksI5t3P4PW3GN4jQCmhjI9i4Mb1N0sNFUoOtX+nvzcnqVtb5FgF0x0iP2eDfeNDMue7@lists.infradead.org
X-Gm-Message-State: AOJu0YyaYMv2oxfQzjjv3lYJPo+y/rkPdFm0Lk916VBueOax8yV2YT6i
	S2UVAFkSLj1LMk4gry4W+Z8PhPto/KUFcH+rnC6Gk1PnlvI00eQWo79j+5BCorY3b/E=
X-Gm-Gg: ASbGncs4NKdLjn+ftf9ZIpGI9Bs26g3so4O+7vshOr0OneZblGjVyasn8WBlsc2CBwG
	t9UGuWhvYDiqzWOjCECqxBrII3Cu3ZfrecE09ZM10CZqdsYR6l80Hrc958qQQPxfWCssKEdaGr7
	8OUgANg0fiB4NGEOGCks2+LJOzeP7H9kpKa61qtIH1dGBX6R2g7NYDwTsbLxhCnIaG5lCmgkFTg
	D3ewwAjdJ5YiZgb3TgqO/pnYE3lydKtMJoJnl+OrDJ1af1RPk2kqEYiX9bA1PfSaVkeUMaB6gat
	cHLo+g7IiXjZxDOm9LC34t/p5FQEaV+QdViqsqcrj/haPzwvXpCl1tRYDpMzNnzH39s=
X-Google-Smtp-Source: AGHT+IE4X30M79feYa1B4IoJp+P/zoAnkDqF1pqfPyj589N4UXNvVInq2V7VnCmuiR3hct5W2E2d9A==
X-Received: by 2002:a05:600c:1c87:b0:442:c993:6f94 with SMTP id 5b1f17b1804b1-4538ee59148mr23355875e9.12.1751014458664;
        Fri, 27 Jun 2025 01:54:18 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4537c6e2f64sm51190205e9.2.2025.06.27.01.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 01:54:18 -0700 (PDT)
Message-ID: <b2c3b78d60f3dc3e4576e8b79298e22ea46567c6.camel@linaro.org>
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
Date: Fri, 27 Jun 2025 09:54:16 +0100
In-Reply-To: <2c491166-d8ae-4fb6-a4f7-74e823e1205d@kernel.org>
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
	 <20250524-b4-max77759-mfd-dts-v2-2-b479542eb97d@linaro.org>
	 <2c491166-d8ae-4fb6-a4f7-74e823e1205d@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_015420_879226_41916BAA 
X-CRM114-Status: GOOD (  11.46  )
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

Hi Krzysztof,

On Thu, 2025-06-26 at 21:49 +0200, Krzysztof Kozlowski wrote:
> On 24/05/2025 07:21, Andr=C3=A9 Draszik wrote:
> > +
> > +		gpio {
> > +			compatible =3D "maxim,max77759-gpio";
> > +
> > +			gpio-controller;
> > +			#gpio-cells =3D <2>;
> > +			/*
> > +			 * "Human-readable name [SIGNAL_LABEL]" where the
> > +			 * latter comes from the schematic
> > +			 */
> > +			gpio-line-names =3D "OTG boost [OTG_BOOST_EN]",
> > +					=C2=A0 "max20339 IRQ [MW_OVP_INT_L]";
> > +
> > +			interrupt-controller;
> > +			#interrupt-cells =3D <2>;
> > +		};
> > +
> > +		nvmem-0 {
>=20
> Why is this called nvmem-0, not nvmem? Is there nvmem-1? I see binding
> does it, but why?

'nvmem' is used/declared by nvmem-consumer.yaml as a phandle array
already so using just 'nvmem' fails validation:

Documentation/devicetree/bindings/mfd/maxim,max77759.example.dtb: pmic@66: =
nvmem: {'compatible': ['maxim,max77759-nvmem'], 'nvmem-
layout': {'compatible': ['fixed-layout'], '#address-cells': 1, '#size-cells=
': 1, 'reboot-mode@0': {'reg': [[0, 4]]}, 'boot-reason@4':
{'reg': [[4, 4]]}, 'shutdown-user-flag@8': {'reg': [[8, 1]]}, 'rsoc@10': {'=
reg': [[10, 2]]}}} is not of type 'array'
	from schema $id: http://devicetree.org/schemas/nvmem/nvmem-consumer.yaml#

https://lore.kernel.org/all/20250226-max77759-mfd-v2-3-a65ebe2bc0a9@linaro.=
org/

Cheers,
Andre'

