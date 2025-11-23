Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4F2CFA46B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 20:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSgH1ZaYBrxKmSAB6ChlLxpJ6NUOOuEnqqcyJnSbdbw=; b=tfZ4u2NRe/qOmI7n7D9JCDsJv1
	/BAuBgeub/LdHS01dlXBHG8lz21EDXMtR2+gXq/dRzXP4H/0BqLItTYPPlQq+5/9V0GmjEITdt9D0
	1fwDYxLrYen6ncS3e4QzQWVP0cFQVuqnvscQw3r3eaxF0ws0dGfCggMEHmQ3gUK7wbvMJbwkmz6Ry
	FXhkV1nrPY118jT+3u84UZfalZL52jg8Zndv7ybc0P5UDF9qihrZ+Inx2XJug447UVsnPDqRFHhqU
	TDyv6O7lAbYiqegOXJ+MqBf47NqB26n39ojSRbGNK3BY6PI+maBWqe+e7NVSYw4qU7KXcUw/b8O+Z
	BS8uegcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNGmZ-0000000Agip-1YOq;
	Sun, 23 Nov 2025 20:34:05 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNGmX-0000000AgiR-0VpN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Nov 2025 20:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CSgH1ZaYBrxKmSAB6ChlLxpJ6NUOOuEnqqcyJnSbdbw=; b=EUxLKgZvejQzA83OMk/dgKzdez
	DtjkRGcx3Abo0/ozjfZ8XDtFsuqAclp5UUdY0DkSZ9jO0CXZZVgfDiVTfdLoZZMjREIJZr2qZWKaq
	2c6Ll4p5qKdlEPyekY4XaJ7aDjx1wX3q7O6i5UMewlYPLPk/LelEW4njYFka7R5MX+GqfUWJgi79H
	4J5bhbELxKUXt2CGBSv262saQhAXhF2PRV0uPwuVu8ciyq09Py9qM1ZZIcg1JN9L5SIolg76UWeBc
	F4NCsDmZWODHMum0v8i+R/qBTIA8WVe/vKH+yBrgx+0KgnaoRMM1bA35UBRajWdcY/nalc/zSDXg5
	SCrh9MNQ==;
Received: from authenticated user
	by stravinsky.debian.org with utf8esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <jspricke@debian.org>)
	id 1vNGmL-0022dN-Vb; Sun, 23 Nov 2025 20:33:50 +0000
Date: Sun, 23 Nov 2025 21:33:47 +0100
From: Jochen Sprickerhof <jspricke@debian.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Salvatore Bonaccorso <carnil@debian.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, 1121211@bugs.debian.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, Kees Cook <kees@kernel.org>
Subject: Re: Bug#1121211: UBSAN: array-index-out-of-bounds in
 /build/reproducible-path/linux-6.17.8/drivers/clk/samsung/clk-exynos-clkout.c:178:18
Message-ID: <aSNvq-YjABITPQV5@vis>
References: <176383554642.17713.6408785381758213911.reportbug@vis>
 <aSIYDN5eyKFKoXKL@eldamar.lan>
 <20251122203856.GA1099833@ax162>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="//E4p0t+s0jrCbp/"
Content-Disposition: inline
In-Reply-To: <20251122203856.GA1099833@ax162>
Organization: The Debian Project
X-Debian-User: jspricke
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_123401_176333_A4942284 
X-CRM114-Status: GOOD (  11.49  )
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


--//E4p0t+s0jrCbp/
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Hi Nathan,

* Nathan Chancellor <nathan@kernel.org> [2025-11-22 13:38]:
>I bet it is the same problem as the ones I fixed in
>
>  6dc445c19050 ("clk: bcm: rpi: Assign ->num before accessing ->hws")
>  9368cdf90f52 ("clk: bcm: dvp: Assign ->num before accessing ->hws")
>
>So something like this?
>
>Cheers,
>Nathan
>
>diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
>index 5f1a4f5e2e59..5b21025338bd 100644
>--- a/drivers/clk/samsung/clk-exynos-clkout.c
>+++ b/drivers/clk/samsung/clk-exynos-clkout.c
>@@ -175,6 +175,7 @@ static int exynos_clkout_probe(struct platform_device *pdev)
> 	clkout->mux.shift = EXYNOS_CLKOUT_MUX_SHIFT;
> 	clkout->mux.lock = &clkout->slock;
>
>+	clkout->data.num = EXYNOS_CLKOUT_NR_CLKS;
> 	clkout->data.hws[0] = clk_hw_register_composite(NULL, "clkout",
> 				parent_names, parent_count, &clkout->mux.hw,
> 				&clk_mux_ops, NULL, NULL, &clkout->gate.hw,
>@@ -185,7 +186,6 @@ static int exynos_clkout_probe(struct platform_device *pdev)
> 		goto err_unmap;
> 	}
>
>-	clkout->data.num = EXYNOS_CLKOUT_NR_CLKS;
> 	ret = of_clk_add_hw_provider(clkout->np, of_clk_hw_onecell_get, &clkout->data);
> 	if (ret)
> 		goto err_clk_unreg;
>

This fixes it for me, feel free to add a

Tested-by: Jochen Sprickerhof <jochen@sprickerhof.de>

Thanks!

Jochen

--//E4p0t+s0jrCbp/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEc7KZy9TurdzAF+h6W//cwljmlDMFAmkjb6cACgkQW//cwljm
lDMoDg//WSStBBpXj6C9bzA/OXvHMMCtdAs1iFeSvljh/6z+MJLvZ1b4Vo5zok1/
lbQHn5aM/rYeSKlCM4vEiIJdMEaDD8tYD0TLgGAwDirnB/GStWYVRClBiEyLlhmf
0/9at7smuicoYDM6/5AMglwznd4Dqx8WzNjDfBFe5PzkDd41+/vQ+M9uc8ql9F0A
KI4YpGrwXCo86y213ke/9EALuafdzI0iY3+/DVypdB5sp5dtwhvfY3T0B1Is4Ldh
wBhZqz3f5eOn5U87MHEFmcRDr01z37Oyj8kRFwMPWy7WJ9wn5Xc8o4wC36oRgwBY
5FpvRXTcoZL4V6fnL+9243yz2BOV6ZUtQ5PQEvtHcwGDn/COlU4Ibn6XO1pryRxO
lEksJbWGN5c6wd+NwxaXdb+U3wABQY8r12RwhZHEXAgIdBBHnmJ5NVNQDR+OF/kX
iSpW2QokVWpi/D6U5gjuSC+bkce0XLoKHawDV8eNDnLpW9hQU/1mhhbNZZGzp2Ur
YBul0za2dSfSklh/bH/7PsIiQrKJvYD+14u6ZWOuF2bZLZ/mMr6bjYr6k/x4iC0J
njfvrmxBMq0c8kYBaS+g7mOTGEON7vbnP0JK6BW/MfQjYZO/jKmu1MCUhIgKhwsq
EcGRUeH+NeSuA1DUbVd4t/NbxzzQjhTH1jQFxj8jCHEFdtB/oMM=
=txjC
-----END PGP SIGNATURE-----

--//E4p0t+s0jrCbp/--

