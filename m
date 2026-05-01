Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F23FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 00:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1jV3oIczrDJyGMvfyxi52kkbMNJPpELkjWyt0g489X4=; b=rwkCXmbrMRpmU8kXN+tvAGFfgA
	RzEuHuSWWV2cJvmnRcwds/4JpNw4RKleruD+OH5Ha9kJ/KiH+nZaxFyC6b+lu2iMCjmSh/A2f1vkx
	jbfaunu+tILRGwVH4lP+Y75xc9Sd5MK4JxwSYY4ZZBlvXjYjxkVPHrS3bLBX4Je714WATmxzDMvjF
	Ohiw4hxyd+JxYS8IzrbgfLSSaPOF+bxRFsDnwGRTV7tM4kWRPfaDeKsGUKkrBsthxXixB61LZfnN2
	8HPpIWl0ch01XbO4NM9pypIDxb4NI6dBZyA+f90+guxJyDRD86OpCg/xscMYWO8FWqMIoV7LeJINg
	gNTcWvNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIc7f-00000006C3r-15zU;
	Fri, 01 May 2026 00:52:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIc7c-00000006C3F-1BsE;
	Fri, 01 May 2026 00:52:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C3D3760142;
	Fri,  1 May 2026 00:52:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D5CC2BCB3;
	Fri,  1 May 2026 00:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777596765;
	bh=EOOhMWkdwXNe+cgIqAYVnr7cBZIq3XZI0KMFnUqE0CQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ib244CtwJUUvN8KWPb5lMj+V3cAt3pp8wwvKUMag+XKg5JDHMOtEYwLvQIdp6xLw/
	 SuAEUvevA4tChXEj+76ZFA/OYARODzVt5oLc08jwP7CWYVINfkFlfn/5fQF1dXOICq
	 XH3ZGXBE5C1EzeAAbLsIqR6XNrOdIiqTiYDHBPynlH4tO5XIsERzAYehSDAckiWfyH
	 Mc1EvcAPlvHoibwjKqQ5VSbMK5PyhZS9FjazSC5rqaUXH9aIm4X+O31INX1YSot854
	 hUO/IAoikN02Dv1EcKbWhUZ0WyGsG4SDiLRwIjHIpSkBbLLWtyDxab80brTW95TtSG
	 mOibVax7L7wlA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 1290F1AC5860; Fri, 01 May 2026 01:52:43 +0100 (BST)
Date: Fri, 1 May 2026 09:52:42 +0900
From: Mark Brown <broonie@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: sunny.luo@amlogic.com, xianwei.zhao@amlogic.com,
	neil.armstrong@linaro.org, khilman@baylibre.com, han.xu@nxp.com,
	haibo.chen@nxp.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, lhjeff911@gmail.com,
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 03/10] spi: cadence-xspi: Use FIELD_MODIFY()
Message-ID: <afP5Wlzt-dTvnzii@sirena.co.uk>
References: <20260430155456.36998-1-18255117159@163.com>
 <20260430155456.36998-4-18255117159@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JFs5EhvgRVT+vvgO"
Content-Disposition: inline
In-Reply-To: <20260430155456.36998-4-18255117159@163.com>
X-Cookie: 667:
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


--JFs5EhvgRVT+vvgO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 30, 2026 at 11:54:49PM +0800, Hans Zhang wrote:
>  		writel(clk_reg,
>  		       cdns_xspi->auxbase + MRVL_XSPI_CLK_CTRL_AUX_REG);
>  		clk_reg = FIELD_PREP(MRVL_XSPI_CLK_DIV, i);
> -		clk_reg &= ~MRVL_XSPI_CLK_DIV;
> -		clk_reg |= FIELD_PREP(MRVL_XSPI_CLK_DIV, i);
> +		FIELD_MODIFY(MRVL_XSPI_CLK_DIV, &clk_reg, i);
>  		clk_reg |= MRVL_XSPI_CLK_ENABLE;
>  		clk_reg |= MRVL_XSPI_IRQ_ENABLE;
>  		update_clk = true;

The existing code is a bit weird here, we could just delete the
modification entirely AFAICT.

--JFs5EhvgRVT+vvgO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnz+VoACgkQJNaLcl1U
h9DEnQf/VAnw03Dnq8NVXT8eelt6wkRf2zJKsMEPrCCYPKzeWXivCbUy9eykDun+
0JMG0iLP/LpWGz4qpUWkbR2Kz8aA0BehHcrEQ56Du8lygGmGeFUNtTcr3KL8API3
DEQrtR2rOyvQ5gxfbyX9NN12jKoVi+SQ6E/W2FFwRY9o2Akuj+NK2rRSYcSmiIBO
b5oZbhABu4P6LiXAtHZ1LK+Yf7NhvgSiFch1chrm/dk225txoJfTFn5BSn14cC+8
FWtjbKtDpupiD1C94wsXHfoUDT2hOtJqxnQLE63hNAKIMqkU3raORVOemHKqcB+M
0qK9zAkxfGtf5GZdQ3rD7/lt2v0bCg==
=Ca6l
-----END PGP SIGNATURE-----

--JFs5EhvgRVT+vvgO--

