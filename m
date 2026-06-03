Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B773BCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 20:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=358Mtgqr9PnThHflx8oLv1DNt6BNQTRALDH0kJnXh6k=; b=RY19QQA19GAj53blKQW2S9OmU7
	skywmTfRJQFrYfpx6FDUkfuepbcM0ruTvyB1gK/Gg65eLZvvGVyfL9cabxJ9ftb3y+c5M2lxgR2ux
	CFLrXiKqdM9XkmpEC11eoeOccgiEk7dZyq0z/gbrwO3IfMHFH0IQ2aaMc2hbsiFyYQnpU1xq2vYsn
	jBwU9766wpXXgYgr+NJMaelmnWjAof1Pu1UvOk7FNDCaQwmZ+qUfkEEFlNvNaxAwHpWHDEkq1DNvS
	QNc8/XjVZf9gyQ/3bGMPSe7RRjYyQtoqcQVUZZZloq3uPUYLOTKos0Olry/gBcXU5aUOWuBsq4jFB
	KebubmVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUsX4-0000000FoqL-39kf;
	Wed, 03 Jun 2026 20:49:46 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUsX2-0000000Foq0-2qcI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 20:49:45 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490b3e03939so10861545e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 13:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780519782; x=1781124582; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=358Mtgqr9PnThHflx8oLv1DNt6BNQTRALDH0kJnXh6k=;
        b=g3IjvoCkhm0YfVABfKcxFWaW5u0HHMriMJN/OquggaELKfUZ2OAyd0LvcSvPUBPVWm
         YC+AcBoTuNe3yQzLhQd+HHVqzhHB7qzPTSORdVmW7BU+/phiJP32dB1sZobuhhsYEPB6
         MuCT3ypvMTvwvfqbo6ESsTcJcnViRuJ8/7jALZxHS9LihmN7GiRc62xIz6TjaTMywxcM
         lJx09F3mkrVmmsNsf1Z6kwfvYzTJcLhPdUsE0FROL+aAsvurrs7hEfBmq0T+9POis5T9
         znA24JO59ovT/ZMXgT65Q7qY4OqqrFAedbY5bt3eigZj2BLHgXdV8EXWV6nmF2YFf9ea
         jEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780519782; x=1781124582;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=358Mtgqr9PnThHflx8oLv1DNt6BNQTRALDH0kJnXh6k=;
        b=dkJandRIroI66PK3fPrZswjL9e5x8OLyLL7s5QWdM3dU+watqooD2WygTUaC1nKADC
         Xz+zWR/uiUZb0eI1qKfIlQLA82mIfya1M3NFve8bnqhNg5In2c2SjeiIgB9FHQ1vGRIr
         eanHCp6s2wk58wo4QW+4ia/dzrynwFQuLfL7gPGD/sLoa9Pq76YdMdC6sMxsUdRhkI5U
         EhNBPM1pP82mmbgF7PqTibASyHpn/7BkT06hnpitCMIPFvrHBBIdUJv+M9PPZKIHC14M
         y9/YSEikXKau+PCsnaYXMiUF8nRt28jLPhii07gpnMqPObP4DJ6cfj7b+jo7uL50lcR9
         Lwdg==
X-Forwarded-Encrypted: i=1; AFNElJ97HfY+XsdAR0UttySzptd8GODAWdcwBKmCr5OmEqNLOJhfJpmocvdgfa0DA1imEnU453Svzfh9NiB62ZLZDJGG@lists.infradead.org
X-Gm-Message-State: AOJu0YykYJml/5HdFEArRDubCQUoaw+TtqGDoP5XBQtFt5DImKttzTMe
	pFUXEIzgpulo57WzD2Klfj1XR9xGA5JH+PPJlvXn3VRkYM1dNjGhAC/M
X-Gm-Gg: Acq92OGJ/xqgKQh+rBhqwtFrrUWyfF1ns81RK01TkC31e0IWCKCiUeCHeSJYPE9ME5s
	AyK83vMV7OUjsp7/y2udQNWTvAmLoBzVmWfGtWpxrtUG9Yfx5BhRQpD45pYkXX8wokn/QyjioEv
	5bdU+unYgjHK4FLH7Ww/hRo1MSlAFTdY1vzn5tXbqF+bJOiimyquKKR/TVNsvdqxIdbRPOnBgo0
	9VJgXVOD6TxYoZ9k6ETrgHAwj74i9o4gXudBlB5Wxx+unXQe/YYix2EjGD6cVTSxxrB6owdVtBw
	Moudh3rcYMUckqz+v+b7Cpk924QUlHqJ3udwsPmezcG2lu1UDeQRrZJO/ocl9ga1r1MpeJDVONm
	hRRTZ/foPXmvUrOlbG2Bg1o+0kDJwyUyE2REtS/j2gWtyrnyyO6XRplumifv0cwlcH93pus7lvi
	3NLuZnscU30KoygACGRJj8ZaaB+MllnxGILMR0gO8naaVbDss4vidxXaFCaQ==
X-Received: by 2002:a05:600c:6095:b0:490:bb60:68ca with SMTP id 5b1f17b1804b1-490bc4b54b4mr11734085e9.3.1780519782401;
        Wed, 03 Jun 2026 13:49:42 -0700 (PDT)
Received: from strix.localnet ([197.250.226.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413adbsm18512815e9.15.2026.06.03.13.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 13:49:41 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v3 0/5] ZTE zx297520v3 clock bindings and driver
Date: Wed, 03 Jun 2026 23:49:26 +0300
Message-ID: <2062167.PYKUYFuaPT@strix>
In-Reply-To: <5620a8969da87612a2d89578be656b5d00662635.camel@pengutronix.de>
References: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
 <5620a8969da87612a2d89578be656b5d00662635.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart23148593.EfDdHjke4D";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_134944_739701_E18772F5 
X-CRM114-Status: GOOD (  12.06  )
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

--nextPart23148593.EfDdHjke4D
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Wed, 03 Jun 2026 23:49:26 +0300
Message-ID: <2062167.PYKUYFuaPT@strix>
MIME-Version: 1.0

Hi Philipp,

Am Mittwoch, 3. Juni 2026, 11:50:14 Ostafrikanische Zeit schrieben Sie:
> When there is no interaction required when operating the clk/reset
> bits, I prefer the reset driver sitting in drivers/reset as an aux
> device, especially when register access can be abstracted via a shared
> regmap. Some of the reset drivers under drivers/clk just predate the
> aux bus.

There are two interactions:

The register lock because all LSP and at least one TOP register contains both 
clocks and resets.

Shared register definition: in the case of the LSP clocks breaking up the 
composite definition would sacrifice readability.

Neither of them are insurmountable and I can certainly arrange a separation if 
asked to - but my preference is to keep them together.

--nextPart23148593.EfDdHjke4D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmogk1YbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiV0kP/jAXJ2XwCEk6Ov9f/83t
331cAIqbxbBmPnF9O4P3A0w41ADMtcz4NQVXn8vKymp2NdUgz85g6j9Dl21OvH5h
bOE3+Y3lJUNYN7g7Xq/bH0xgcpVRk3QPi0mDZ8k6RMYWIN8KMXpDyNyqUFbIomO9
8QVbtS8/oSAXydX/jkUWT0/YKKNDNAnFEZfTnKNe4y/HLxPsHi9Xulm94HWFmcR8
A4BMIyFKYFbEadZ/a61HdyM3QidwgnmEaMIbWB2zLEW+3X/GEfM8v2sc6qp9cPDX
mMQzi7d3ns3K4H8JD6VUveo2id2EhJX3IThs/RH9e4araNBdrM7f2huSt0GjNqeE
0JsQBTw/ypRHyzIgG74xlHRonnEZJZI67oDSe7IyLTa9KfTvqpwQH259eRvApZFh
zhdbljzFDiaaW+mGl+T5kXZHQxzIfpUaGDjYbYG8hDPmX2lUf+M6A6tPmvHgo1hD
VB733fUWH95J74asXaZqZKDegV6QF12zgDPIS2lFCOQSgw00FvIRnTvYJqVmFexI
4TR3b/Igs9FQ7VbDsk+mvFOKvOQZIRKi6TBho62Rs1KflnRQd0NlIKAD1Alqd7Wt
GZBVFaQNh/1L960YYzJvio1cuhVi5t1nlgzC5OYawX8+dKcBo2+gffcgBshm7pIx
51DdNXFu6LWbBbozN4tsiovJ
=zIPc
-----END PGP SIGNATURE-----

--nextPart23148593.EfDdHjke4D--




