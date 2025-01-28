Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEF6C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 12:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r2Gwjs/MaO1cS16/WGPahup8X/6ckRyCesC9zc2AXCI=; b=V7d5RifKboTwaLxICG+qcJ7aIK
	ticYPHZ8cEra7You8CsKsRiGIbGQwTs35JGZBUGGdbmjtBqbt73RsOOcgNECMZNmNhtrwXtaFIHmG
	JDzH/Xqc/qKUK983rHi7p5/8xDZJLoqySq9Ry0UkQjPe4bnNylcTUdtl/Ljj5y7umxP5nEEtirrPf
	ORvTJXABhGCGThjza7+pG6cjVNAgbtXJfSA+uRqGh0opIrLSl9tU7Ug0xJh+OHZHm8GgcwdEEN4xM
	muNgHbgvvWmv6oSLwi//jl0s0O/s0SirNHAesCpdeM75Rv55E9kJZ+ltQEkIIQl0/V06Gc8yXnMaD
	pOEm9Lxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tckrg-00000004tV5-3KXY;
	Tue, 28 Jan 2025 12:38:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tckqM-00000004tPW-0KxS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 12:37:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6B3945C5D95;
	Tue, 28 Jan 2025 12:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAA42C4CED3;
	Tue, 28 Jan 2025 12:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738067845;
	bh=qz3e8xDv9vNVbI2kX24dN6HQHDUseqJD3RxrmrJ0cpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KlyH1pdJiKjGn8uLrDGey0+BR7Y1XDI7/k3IOlVaPDd2IG10n7iynKhrIxW1/9+t0
	 QXsyA+5wubDIlfT4qOEvm+6bWHeQ/Dj3KzK8uAcqx7Nd9rFI3i1CZpAFiPdxtjFjlx
	 eFiiDMOHVUGYVSv5ESIkT1Ng18KOneUYiiZKg8gdZRocGojxNST6AkvpiW+oP25sib
	 hVU/b2cKo15dj/AspvsmoUGd6mvuYtpZ88RXutbZXqf+VcZnIGh+dXYe9omIsExEhY
	 Zp6h7VPdoclI/eJSJ4QjzGyAQDHpyvyqaXXGGMyhOcIBk1q7XR6+sQvrrTNdA1HkzL
	 HYBYWWWyjSsAA==
Date: Tue, 28 Jan 2025 12:37:19 +0000
From: Mark Brown <broonie@kernel.org>
To: patrice.chotard@foss.st.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	christophe.kerello@foss.st.com
Subject: Re: [PATCH v2 2/9] spi: stm32: Add OSPI driver
Message-ID: <ec35dbd3-5730-4cc8-8025-d349740d1ba5@sirena.org.uk>
References: <20250128081731.2284457-1-patrice.chotard@foss.st.com>
 <20250128081731.2284457-3-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gwleQ6q+I0YDdApo"
Content-Disposition: inline
In-Reply-To: <20250128081731.2284457-3-patrice.chotard@foss.st.com>
X-Cookie: I never did it that way before.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_043726_203448_A7DB7FF9 
X-CRM114-Status: GOOD (  16.62  )
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


--gwleQ6q+I0YDdApo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 28, 2025 at 09:17:24AM +0100, patrice.chotard@foss.st.com wrote:

> +static int stm32_ospi_tx_poll(struct stm32_ospi *ospi, u8 *buf, u32 len, bool read)
> +{

> +	if (read)
> +		tx_fifo = stm32_ospi_read_fifo;
> +	else
> +		tx_fifo = stm32_ospi_write_fifo;

> +		tx_fifo(buf++, regs_base + OSPI_DR);

It feels like the _tx_poll and tx_fifo naming is a landmine waiting to
surprise people in the future.  The code sharing makes sense but the
naming is just looking to cause surprises, especially with it just being
a bool selecting read or write.

> +static int stm32_ospi_tx(struct stm32_ospi *ospi, const struct spi_mem_op *op)
> +{

> +       return stm32_ospi_tx_poll(ospi, buf, op->data.nbytes,
> +                                op->data.dir == SPI_MEM_DATA_IN);

Though the one caller is also using _tx only naming, it's a bit more
tied in with the op sending though.

> +	ctrl->mode_bits = SPI_RX_DUAL | SPI_RX_QUAD |
> +			  SPI_TX_DUAL | SPI_TX_QUAD |
> +			  SPI_TX_OCTAL | SPI_RX_OCTAL;
> +	ctrl->setup = stm32_ospi_setup;
> +	ctrl->bus_num = -1;
> +	ctrl->mem_ops = &stm32_ospi_mem_ops;
> +	ctrl->use_gpio_descriptors = true;
> +	ctrl->transfer_one_message = stm32_ospi_transfer_one_message;
> +	ctrl->num_chipselect = STM32_OSPI_MAX_NORCHIP;
> +	ctrl->dev.of_node = dev->of_node;

It looks like the controller only does half duplex as well so it should
set SPI_CONTROLLER_HALF_DUPLEX.

--gwleQ6q+I0YDdApo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeYz34ACgkQJNaLcl1U
h9DqGgf9GDpZoVHpFVphDLNJ/mT+2DuKd1ifuBqlhnL1uv3N5P3QycT2pGfzJm1x
rZYo8crCyUHSEEg8gJTFGRLvS4HMZnLiMPXAoO5haFS9MlQhkB9q4ycTO34H9ji9
fGJBMxjfNulkaQDTQCSTLQGLVG9btkfagUgPlT+44DJoJosJpgBxa/jRNV1aY5RV
mLna5fVv+UcrVwHwTcCks6+Zlo0yJLqnUNwO8Su5oJwaMZVgF6FzWHb9rtVmP5dX
Juozjf/iY5Q4GqgaFveLPKpGtdZ3ExFW/PozDcRWMaV0IgXJ050vnIYHjJztITmG
ywanYl7T6WSekQkkXSYYKko0xayygw==
=oZuU
-----END PGP SIGNATURE-----

--gwleQ6q+I0YDdApo--

