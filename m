Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAAAC43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 19:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1JUyIG3DwbeOPJPxX3RcLVRRPcM09xsVDoLHi5o4rk=; b=Pc8bjQZ9AdZf1gmAsVcVKh/OcJ
	N3h818Li3DB7lGNGClyUxKIMig4XJ7eTInVx9v86oX5RQAxMfjaOgbyAzAZqhRz75xypnrmYEzZvw
	7RO8LnLMQUCWFbTqPS5nZ3m8/xcEOA4X03oiUbrgg8etHiF+kn2PC9DqIsYW0fKEXK5q10j8t27j0
	hOERc3Y13E1J7rECI06jJrizV4FVtdMMNZYttc4YfSI4rRUGtO7MdnFR18xsMH0gHF83KrMhEXok5
	JFvZFKu/zSs5UrEPo9zZ77iJg10tMcs/hllJ3ycC3T2e9uPrF6CUoDpZDa7snYVwTOiv53s9OACgR
	MTjFYSrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfN40-00000005MWF-3106;
	Thu, 02 Jul 2026 19:27:08 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfN3z-00000005MVn-0m6l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 19:27:08 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so7971935e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 12:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783020425; x=1783625225; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1JUyIG3DwbeOPJPxX3RcLVRRPcM09xsVDoLHi5o4rk=;
        b=LYvztyiKH8ffAFKsJ5iWseA2P6eiIOKSwrBGZ3gZc2UhZUYalJCt4jqXBS45esMbxe
         oBVnsCnZiWey2AiRt/5qzOmXjDaL7phawZVr9G6ncVZVPyZKd/7PTJg2xlRkvgp2tsvV
         +YVyLzFGPohkNi4E+/ntvLPr4FuR+ERtYoFvqFt6ZQxTB6idalrTfq/t0y5TGpzhYphV
         Ry+tEbmdZ8Dm5zwFRLkbXQxeblk/cdREodmPMOWZEn2/5jgb76N/s/GKver4png2IdCJ
         8/SSmyB6oiR+KMANEJb+PI28r7PXkt+/SxFpNTaTDSPjYCr6je0sKWHq34VePXx/V0zQ
         wl3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783020425; x=1783625225;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1JUyIG3DwbeOPJPxX3RcLVRRPcM09xsVDoLHi5o4rk=;
        b=ghKcqsk3Nv2vJ/zyxYQONligNDDRsk3SjqgsgzozGFvypeTsoog+tKhVkEWlsv/M6b
         8u2Y7jiDUFTSOkFJeneWu6bsWMfqqH5Rw86/5W9kYSagNpmPjHBrcj37SUyN8Q8P+c/H
         hocH6ywSC9OF3g2KWPfn8Da/Os/mh4x3cjvJTxiVgEQsciKsnjIZWZNX2zscVfjl2Zr2
         84uWNRpBEFZ4H+hrcbmfhT0dY6wZZGUmhPJXnhSQiiMA3q8Y80ihvCV5BUm8c0vyoBTG
         tHq1MVnHP+cavYaADSFmtYEvHLCvJ45/nEJMhXNbIZ/22GQ3Y5LESs0AxZFgayOJ4yMw
         CTFA==
X-Forwarded-Encrypted: i=1; AFNElJ+SIgDyM2DwruNYWVgJY5duW1R7aTZDqlJruEnxNoRFJUZIP87tgZvfw2vFX4sfZtPyQYUHvXICPWSjqEeRDjL9@lists.infradead.org
X-Gm-Message-State: AOJu0YwYEBB5gDMInToPv0qLrV719aPNaCBfWGUPC1n0y280Wwu22CC/
	9InioMoFzB2fIbvVT9xrddShyqawfVs7U2fNoakSGyz1huMHvBpSYWWt
X-Gm-Gg: AfdE7ckjburioSQI6lBDnzTrTJzKfWTuocpFChQmToJkiYtiyBtHC/Ufvo1b1bcW6vR
	0ogj8mZmzzn0EcyuFWaPpr2qpcGPnsnrTb7D0QLaTPQnVRGWnX6n+PQt3aWNuOJDcSS9ziMzHXv
	TYLVM2zSGLrLUgFxjZxr12Ilt0nAidgXhbKbINM6xFGSOCED5kJnM1RulOEzHhsm++FaLd9Mka0
	WnUDxeeLqukTVsgmAwXSuLqPpXmE4XGTkEIuYIvu0gNnwH6CeVqpvbE+iWjufV80M7pbrg11uO6
	kDfL4cEcKRBF8v6Go90H4X/6Ah2s+hI3CHjIzdaLAul/trIM59qTraNtrILcaDsXre4OmkN/aJj
	/E57tsH2i1srO70+d/VJUxaP1dNPtRhS9kiDh6krOP2OBGm/Hk5iGkMG2Dd4op/1vtbqude6c2Y
	3QW26/TkJxBlG6Ul5ODRce+p8t
X-Received: by 2002:a05:600c:4eca:b0:493:c600:e1a6 with SMTP id 5b1f17b1804b1-493c9b5da18mr16908965e9.12.1783020424838;
        Thu, 02 Jul 2026 12:27:04 -0700 (PDT)
Received: from strix.localnet ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm107245475e9.13.2026.07.02.12.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 12:27:03 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v5 00/12] ZTE zx297520v3 clock bindings and driver
Date: Thu, 02 Jul 2026 22:26:54 +0300
Message-ID: <-YnKrFIxSsqt7IlbKzex9w@gmail.com>
In-Reply-To: <20260702-frequent-refreeze-9850982156cb@spud>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
 <ihPM7P2dSn-oiyaL8fageA@gmail.com>
 <20260702-frequent-refreeze-9850982156cb@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartCXp0dzo7QVWFrQBb7b6M4w";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_122707_247203_B0055819 
X-CRM114-Status: GOOD (  16.50  )
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

--nextPartCXp0dzo7QVWFrQBb7b6M4w
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH RFC v5 00/12] ZTE zx297520v3 clock bindings and driver
Date: Thu, 02 Jul 2026 22:26:54 +0300
Message-ID: <-YnKrFIxSsqt7IlbKzex9w@gmail.com>
In-Reply-To: <20260702-frequent-refreeze-9850982156cb@spud>
MIME-Version: 1.0

Am Donnerstag, 2. Juli 2026, 22:05:14 Ostafrikanische Zeit schrieben Sie:
> > I am not aware of any IO region to configure the PHY, although one may
> > exist. topcrm + 0x84 has two status bits reporting if USB and HSIC are
> > powered and out of reset. Nevertheless, the PHY feels distinct enough
> > from topcrm that it should have its own binding. The phy driver would
> > merely deassert the reset
> This is the sort of thing that should be a child node of the syscon,
> rather than integrated into the parent, given it consumes resources from
> another feature of the syscon.
Ok, I'll go that route then

I think I can add the phy child to the binding later without breaking the ABI 
if I make it an optional member of the binding.
--nextPartCXp0dzo7QVWFrQBb7b6M4w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmpGu34bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiPQMP/1oytiyuDough6TAKI1g
pyPuNyWA1l0TbqIZQujcStqcihL5JOYZo7eK/Z5amGdaD0EMEfB4eWYwsapRjRlj
hihS2WiWMGoowwNEvDsUAlxraWTwlDXpANEJtXNMPrVvOOPGin6OHFPquo3v+4vB
vgmM1r2MMacaCuuFEFn/m7NRHBuXA1QJzNXuyzCdHxwQEamNKV0SEVWp6mMnvypn
1wzXqXJjcyzbinxUBA42WiUaK8xfvna5CQAzqnqMVeS16C+Salhv41WhEDN3kMag
xjMXR6L4g04Su0MdhmssQGfE185ULucGWxSR+FZyqCvUuTOZnL1keHMtETLbQ2C0
Hafwvn0IUJiCzNhGjSzPgbzWIhe9xV7DLw9CxOjW07IVenrRoeZQr4G9/8f9ICYA
n7Zy8REW5Clmm2VfDSpsF2YLPuA39xv7TAopwUWmf+X4XqhxJvZIZVHL0B2lXQrH
CkKtc6AgRWV0Tb4wz66UK8QJCeJubNwYlHHkD7xbKt9NG+ZorwuIFxSoReT0+UVV
R77MUxXv618CXy2iN8UwCjFJ/hEl2Ffkw4c07QrqMG7HJNFkOtKBvYuvDGeseSTa
5GVk0b9cADBbSdwPkP1juTnjgYheY26U5Ru8lI5O+7zoAIrdzYik8OKkutQjbtus
ZycegPP8luJaanrjrM6flc+9
=zmEp
-----END PGP SIGNATURE-----

--nextPartCXp0dzo7QVWFrQBb7b6M4w--




