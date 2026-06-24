Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6D3CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 20:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ou7sRiViO9r41tx6wwdMLvYt+1RgLBADg7cisaocX2c=; b=H+DuFKaHjXI6q1WbskLj/qpAk2
	iOJou0QVhtO4lobDbWPBoTgAK9MtG0Rtx/t+q9xqJ7e2xr3P0Gi/CZQqv42A9a/mR1sMTkX+wX3Ra
	PFuFazotUB1nydTtD9uFrUmIZyi2MqbHfq6FyMfArc6qaMY+hWFO4eXejSe1ufv/8KDj0oGKhPVua
	IjYQ+eGbD0HP7nthsqkgY+DUlcpcxqae25oG48QVJQ2pZ86RH2sdW0eLhINuOg4vw1PJBgVeggZmH
	OrYcFBMfFCS89NdFmvkERMb8aQdeTQuTw006rUBLe0P7QsTTsKQaP4OgBL2XqRDgv/g0skdngiaWR
	WIrzlopg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcTmD-00000008IsC-0Gem;
	Wed, 24 Jun 2026 20:00:49 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcTmA-00000008IrW-22RT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 20:00:47 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4924f8db066so8629655e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 13:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782331244; x=1782936044; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ou7sRiViO9r41tx6wwdMLvYt+1RgLBADg7cisaocX2c=;
        b=Erbp8szSjhiw6ozruXR971J1V0Svw8Z6YX/LeuLEvda1ZMgvFu35Od+Q6HqYMpLcF5
         UkVKHTeTzEupgr15+9emC0NWZhHtMZWp1mDRQBOsHvFK/4qycHyG97Ep4mEyh7cm7+9i
         xe0pRJyw9TXALuYKI3QNK/Jf71fyg1BlJp2JzmOPdxC1REI4d+Yq8XatMCSbKw0n5CYx
         R92P1LauDF4Z84rGTy2HIWdFMBSgFlEwLrr6wCn4G/e+PPtg1Hf1zFTyPi49hKDLr0Ge
         39oKTiQtLhnh0G1/vXNomTcqTnTnU+BF2Gxb1JsE6gMX/u0BWrjhO+j2F/nghQDEUWv1
         QIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782331244; x=1782936044;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ou7sRiViO9r41tx6wwdMLvYt+1RgLBADg7cisaocX2c=;
        b=HepJiXVK9RgjZ13zSRVBq4oZhLeEsoQ5D15Bu1MvgeYn0WT0zA1SRJncOBZDqxbYIE
         6cD+FKOXHvpXuEpowa1W3F6RfqmNFlOGm6W5IliOj8wo5Tv7feF/gpGFdwSAnvzXnQvc
         NNKoCgSoXbFc3r0hEMw4KgYFA2Z66fHjmc0rq6c2+owSNxM7LbwHl3byUV7MwVF0iuqC
         ZltqxG2vWXrvO9vDf0H0G+EPnJqUQDk66CcBsaOUJP1dWkNHelc0CVAaVwmrhWqaFsf3
         6rfFHd16CGB/hKrwXpzQxucxflxytjNUmxvrUZJwmsr5ZoonozWf4kyAVYh1O7+8OD1c
         nwlQ==
X-Forwarded-Encrypted: i=1; AFNElJ9sgQCaBWAlMPNyrXXo7mcW9d4DeuYfcHolmRxXEZD7qNJYxRa1QtJYaqeITQyYZLVoasK4jBwWGaSCc6omQjbm@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+GNbCx0DKWepf6rA1jONBl+ChuIQfb4G961Pm2GW1jKPlx5qm
	OUxnkPcadWBcUjISgrbrKtz4BUey8B81MYn2PmE5h5kYw9v5H2SWp87F
X-Gm-Gg: AfdE7cntskLN4yRpvj2xHpKtg8k6i/EMPtBxSc/Nm4sO/VQNN19D6f1p/eVfKHiersv
	nTn5EEjXNqm6d1YavFEoD6NNjggPb+RYeR9eOrvim9MDEl2yTF56MHGkq3puRFOQAyw6rYtJ8Ir
	ZTY8lC5T2qhZUS/C1oW6eWINHmYvzMpIetOrnGRny0cCCQDxIorjRkDoGke2/kQl3DFkSgv8NhM
	6/t//Ez5ZI9p3n1zl4nsCAUTZp6rX7+jUPGnfh1itOftAv+EmNTVR5t0MTGW6NL6X1V/U09zI+J
	aZ32HmJ29/aVh/jMFn5BoXvrYY/jGZyQA4Z9Y29iexoNJ0OiahM+8msbYvcAcjC4oJkPeM8qWIH
	z8L+09d1o5WQVpfN97ifkVB3rnzBwsJ4a/uF6owlyp3zwavIugleIOMFqQOVTW/dYXhcdWSDsEd
	gg4N11MOIWvgyx6iNByQVOzugh2Q==
X-Received: by 2002:a05:600c:528b:b0:492:58d6:2565 with SMTP id 5b1f17b1804b1-4925b3801c4mr125691855e9.25.1782331244005;
        Wed, 24 Jun 2026 13:00:44 -0700 (PDT)
Received: from strix.localnet ([197.250.227.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49264011d5fsm17039315e9.1.2026.06.24.13.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 13:00:41 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v4 10/12] reset: zte: Add a zx297520v3 reset driver
Date: Wed, 24 Jun 2026 23:00:04 +0300
Message-ID: <7_XKp5ZWTJeJfxJieymOJA@gmail.com>
In-Reply-To: <90c4f50eb23dec06497d46f9c0f522a6b90a918b.camel@pengutronix.de>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
 <20260616-zx29clk-v4-10-ca994bd22e9d@gmail.com>
 <90c4f50eb23dec06497d46f9c0f522a6b90a918b.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextParthVt_moD_RiKok0jux0DKSA";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_130046_551139_C5D2A23B 
X-CRM114-Status: GOOD (  17.27  )
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

--nextParthVt_moD_RiKok0jux0DKSA
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Subject: Re: [PATCH RFC v4 10/12] reset: zte: Add a zx297520v3 reset driver
Date: Wed, 24 Jun 2026 23:00:04 +0300
Message-ID: <7_XKp5ZWTJeJfxJieymOJA@gmail.com>
In-Reply-To: <90c4f50eb23dec06497d46f9c0f522a6b90a918b.camel@pengutronix.de>
MIME-Version: 1.0

Hi Philipp,

Am Donnerstag, 18. Juni 2026, 12:24:26 Ostafrikanische Zeit schrieb Philipp 
Zabel:

> > +	[ZX297520V3_UART0_RESET]     = { .reg = 0x78,  .mask = BIT(6)  | 
BIT(7) 
> > },
> Is this a single reset line controlled by two bits (do you know what
> they are)? Or might these actually be two different reset controls that
> are just always set together?

I suppose I could expose both bits as separate reset controls in the binding. 
The lower bit is usually the one that actually resets the device, while the 
higher one works similarly to PCLK - it disconnects the device from the bus, 
if asserted. Depending on the device it may or may not leave any residual 
effect behind after deassert.

The stumbling block is the dwc2 USB driver. It only takes one reset, so I'd 
have to add another one (or abuse the dwc2-ecc reset) and presumably add a PHY 
driver for the 3rd reset or add a dwc2-phy reset.

The AMBA bus already takes an array of resets, so the pl011 UARTs are fine 
either way. For stmmac I need a glue driver for other reasons anyway. the 
dwc,mmc2 controller on this board seems to have only one reset, so no need to 
extend the driver here.

--nextParthVt_moD_RiKok0jux0DKSA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmo8N0QbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiEogP/R8cmmFdsmQf1KC8sEpC
FHs5LDtbqZiDlTBbyS30EkcQvlrgJiE+Nw4ooyuaXdp/yAsXGx6+PcJa+ts3U7n9
zq47YLFyEbK/eIOiZUL11INgY7fvX+rjmIjUycP/e+QDjZWWwnCylBPS49sy527A
eL8/Rc9Sh2c1YqqqPrdWXEPCYyex16JFem9/dW8rmBJ+wXtHSZpL4Pp0bnnWEFbB
pmFzhiVb9YI4/+zDV91/utODGohYddgEqjrpdqnFnp4PQ3NKlLL+IJPOVWOk2gxf
AWsdTFzbH9KqSeQnCxWw28tUhRdv9FNmL0TLNWzwUIssCxS26glrCoeXAP0G9qzd
08VmDofaWsbFRaDA2JncmPzJmb94sae4luwRCx611c2DfkgQjfT6r9U+jVKMKXIB
ys7km03W9hFCIv4oSqZDDzRXhD1h5m3CJA/OfqswLDTvNzUyQPCq9ofGg/O0Xr5+
7hqx5VO2owAQ1LvQfPuRrjzXdrhFF54Tm8zNxCEszhiJZwBQJ+muvqRtg6Om8KDd
SZ92FKvcPWcKdA1CAra4b9nPJuGviEvaXQpYh+6ja+Nubcfyf2EUIlidSU2EhaVC
192zUu5x+IC1lfvdMXBulb9LgPz6yi9S+71ytaYp+Mhn4I3X+gn0n/sLGEmL75VU
VTD9frYuMZXmnW5169uuFcAU
=/taJ
-----END PGP SIGNATURE-----

--nextParthVt_moD_RiKok0jux0DKSA--




