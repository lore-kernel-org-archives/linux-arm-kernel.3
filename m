Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB23C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 19:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fcRR+5EcSH2NnZRiq+ktBDbPi2pbVrwiv1JAzpr30/g=; b=aUNju1+MYDFh/RPSusrpW2mvHt
	o92zYi0Jek31Z0F57yqmhTth7YkHYDAc9p7R0nMbdp4Xi4lP7jfPmrqaaR059pkhF1sVqZ2aa6iXg
	Yn+jVXNJu0oWmR3dDb09CBNcs1+PrRsh55qBje3XJHNgsoEhuchVKpsWsXtNnUBy4CUAk/Xb70FZP
	a2FXZxCYub47v+yGhyR5t0PU3RE6H7foWThqrwoMSS3ZxQZVSs9uBkDFsYTLAtZi7yOTMK/+HQqzA
	cl0BfjXRw2z83o0TjI/v5g6RfsL9tOMygamQbF3KY7fvH193YKXKNQGKUzAcw/085RIyW31RUbwkb
	CaAKkvxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH6as-0000000AJAi-2gs1;
	Mon, 19 May 2025 19:56:14 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH5iH-0000000ACLi-25gT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 18:59:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=fcRR
	+5EcSH2NnZRiq+ktBDbPi2pbVrwiv1JAzpr30/g=; b=N7zmZOKr6XTLjOmlTya8
	qpS/cZfFj9/bODuxKLEJ0emekgGh3jPw9pOF397y0bUXwKq7buAu1QvQwc0Ye7pj
	8Sg5Ek5BHup+uxJLXeECcFaJ3tBYFXP0Z7U0+WzcV+G45hE8si/ZvSwQzbd8PvXU
	ez0V5Q1qRYZ/6m+t45zGmwhPeFGpKwxSVKGIzpPUQUuB1oYYaHaaHxKoDUFBaRtt
	aUxFSbFudm8BI9U6TNjYQG4xO7UTn4oxHl1H/UQJ7hULuBuFfFdzeTqzDkoQ1j4k
	zr4wKw8rRbwma44sPE0nF+jt3FaAI0IJhr0ezollsXBQEK7JMrLfnwLTzudUTIzg
	hw==
Received: (qmail 2605808 invoked from network); 19 May 2025 20:59:41 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 20:59:41 +0200
X-UD-Smtp-Session: l3s3148p1@gd37u4E1qNdZz6uL
Date: Mon, 19 May 2025 20:59:41 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	loongarch@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>,
	WANG Xuerui <kernel@xen0n.name>
Subject: Re: [PATCH 0/7] archs: use proper node names for GPIO based I2C
 busses
Message-ID: <aCt_nTLapk0XdI4E@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	loongarch@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>,
	WANG Xuerui <kernel@xen0n.name>
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Miw4moGlT/mH/7E/"
Content-Disposition: inline
In-Reply-To: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_115949_806944_5B20A83B 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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


--Miw4moGlT/mH/7E/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 19, 2025 at 02:15:00PM +0200, Wolfram Sang wrote:
> A lot of boards across various archs have a superfluous '-' in their
> node name for GPIO based I2C busses. 'dtbs_check' complains, so fix
> them.

Please drop this series. We found out that upstream dt-schema is broken
instead. I sent a fix.


--Miw4moGlT/mH/7E/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgrf5wACgkQFA3kzBSg
Kba0/w/8DghRfAlopqU9war5gwpE26Ihxt5Q+oMhY5xMtWaQFNqTEc66w4HdQr3/
29RR7JJnOaX3VKQ/WpSYysrZxG185wIlaNA8jb8NRcvdI5N0p06SVBaJbnFh2e05
q3Y/EL5RCfyagvTQjCtTSZQPW0LjKIFM+EsxgWtZU2GgD8dQJMylLMgkgruViB95
8nFoBB+wxTKUcOixJxztDXAmeGOBh5J7XnpKVU8rH7Uqp4YePBIXDtN761U4Mf5S
PGHndrQ6+96AfztgD+X/jOLw3udkj8jM/PjkXRm00LRqk7bkC9C33WXIC4yk0G/X
KLFBh6KOP8JB0VqUC4v3ijbxaeVnPQIEFbFwGtY/XRBftELqN9vMNIEQixTPciB/
uBMbD2XacAwyCcmeDSEv2nqKm7oSuJ+mN5Zk6k1PnDbRFsrkq+fp+uWEyhoyybLD
1viuWAWh/rzsPwfixjyPKy0zd9aHaV3hNT4sSzrqhCrZikEmcusq1LqLPlGLsYbx
Mm1U9EU/JtSvJwQyUX8ZUWN5w1ndA/fzR9UDSZ9oE+cZCvnfV0PaSfuNZYH/ehVH
UzwSkZrjklNhZ/RQQCZGxce7bCbMUbSg6UdYDn+qW+UHqXyzp7b9Uk6PDWtUtla0
3GHameu2L+C947A6uzLxX0OJWCYJKdRqaghannzZwZibP0E5sxY=
=J0Ho
-----END PGP SIGNATURE-----

--Miw4moGlT/mH/7E/--

