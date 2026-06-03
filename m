Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CD0CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 09:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9AerHmbjV83y9A55r5tKc0QfFhPXJXRVsUh6a0eEv+0=; b=4YPH0eiwaLSEGX3U9snWcx4GBB
	Wsj/P0MZEHoUeylTHz/kVSred4l6efKogsFNQSZN3Z5oGcRyoIP3N6MRc+zJH6PkZKEc/XpiI6CZU
	SDQsq1rldlTQOFuYVTE2a1BnXkt3GUvPwFOeHZEjJlgiiAbYp2azLyGWQrcoIn/9AiLyUAqD8GsSt
	l3sk8u3QmZHQRyiICPXwwKehDkST+3ckKwIdd01wFSh32HqpmbEIk1bgNklSYXk3PTy7f5dCG9gZ7
	U2jFDQSa00HUTu2VEiJk9+H12DFkgv4hDxspPtaeVthPpFnKB2l8wrCPxBw0V8t/H3eP53JzBiezD
	c13t8fKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhwN-0000000EiB1-0HiV;
	Wed, 03 Jun 2026 09:31:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhwL-0000000EiAl-1Yy3
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 09:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9AerHmbjV83y9A55r5tKc0QfFhPXJXRVsUh6a0eEv+0=; b=UxnM/YgK9Pq2gZiX/bgUV+25SL
	GhS+atkcSfezMBa5P67CSS4G9bFMCwndIe5nwO11KBs5sT5UImuyhcJe4dC79PYjnzmyppkIVLEH9
	VjfFnhKjyHDmz6eF8NtbCI+QX4g/3NkO4qiy7Mc1khvR4jB51yik/obcyYyvmFhQjbP6irNMM9Hqu
	kbJm2tdPG2JqV8kCo4xXWfgzXipk881DHrMQvFnRsN/AkOSJAmm/tIYRoVboVDWkmUovm6dupTp/9
	B3CJv+Kqbc5u9s6YNM36bd/uvwihtMb803zvLv1AviaNLjkJ3Vqc7z9cSvs0g2jaUs1rIj6paHa4N
	Fy0zyh5A==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUhwI-0000000Bihn-1cl3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 09:31:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 54EB741919;
	Wed,  3 Jun 2026 09:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63BFD1F00893;
	Wed,  3 Jun 2026 09:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780479063;
	bh=9AerHmbjV83y9A55r5tKc0QfFhPXJXRVsUh6a0eEv+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gKLZwikIl6VoRszNhPOK/+zp4BVbh6zVW6r8nz2fnlagc02qK642z4MrYzSbbssSw
	 e7JRRtsWorSrBHsqNO4xQhZX12YvUZbRJbVTQ2g2v0dWqWlV7FcMsFv/gwZ1YbvAz0
	 +vUddHj3B1Vt+6On03NYjYrOLTNGii7X2GDulHv8wWBGP1eMar/AVYvKii2fLfKfrm
	 0lkbEmJx1jNscxT8WjJBtidHIfJBhvcIAVXKh6fs6J0R4qn80HyhT5CqDeW90HtbMU
	 qGIcCmuNydBim+RvY5zxFR24oGjQ8AdFIwPqZNwo0cswOM4hMbD0viAWZ5Pj1Y6t2d
	 hnbSm0QXnB0Yg==
Date: Wed, 3 Jun 2026 10:30:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com
Subject: Re: [PATCH 2/2] spi: Add Nuvoton MA35D1 QSPI controller support
Message-ID: <d32634eb-4eed-46e6-b378-d42df0b1c75e@sirena.org.uk>
References: <20260603043551.1062112-1-cwweng.linux@gmail.com>
 <20260603043551.1062112-3-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UGarUI9v4pCN0SBM"
Content-Disposition: inline
In-Reply-To: <20260603043551.1062112-3-cwweng.linux@gmail.com>
X-Cookie: micro:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_103106_796103_642EFCB2 
X-CRM114-Status: GOOD (  20.48  )
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


--UGarUI9v4pCN0SBM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 03, 2026 at 12:35:51PM +0800, Chi-Wen Weng wrote:

> +config SPI_MA35D1_QSPI
> +	tristate "Nuvoton MA35D1 QSPI Controller"
> +	help
> +	  This driver provides support for Nuvoton MA35D1
> +	  QSPI controller in master mode.
> +

Other drivers for this SoC seem to have ARCH_MA35 || COMPILE_TEST?

> @@ -0,0 +1,579 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Nuvoton MA35D1 QSPI controller driver
> + *
> + * Copyright (c) 2026 Nuvoton Technology Corp.
> + * Author: Chi-Wen Weng <cwweng@nuvoton.com>
> + */

Please make the entire comment a C++ one so things look more
intentional.

> +static void nuvoton_qspi_set_cs(struct spi_device *spi, bool enable)
> +{
> +	struct nuvoton_qspi *qspi = spi_controller_get_devdata(spi->controller);
> +	unsigned int cs = spi_get_chipselect(spi, 0);
> +	u32 mask;
> +	u32 val;
> +
> +	if (cs == 0)
> +		mask = NUVOTON_QSPI_SSCTL_SS0_MASK;
> +	else
> +		mask = NUVOTON_QSPI_SSCTL_SS1_MASK;
> +
> +	val = nuvoton_qspi_read(qspi, NUVOTON_QSPI_SSCTL_OFFSET);
> +
> +	/* SPI core passes enable=true when CS is asserted (typically active-low) */
> +	if (enable)
> +		val |= mask;
> +	else
> +		val &= ~mask;
> +
> +	nuvoton_qspi_write(qspi, val, NUVOTON_QSPI_SSCTL_OFFSET);
> +}

Note that the core deals with SPI_CS_HIGH, the driver doesn't need to...

> +static int nuvoton_qspi_mem_exec_op(struct spi_mem *mem,
> +				    const struct spi_mem_op *op)
> +{
> +	struct spi_device *spi = mem->spi;
> +	struct nuvoton_qspi *qspi = spi_controller_get_devdata(spi->controller);
> +	u8 addr[4];
> +	int ret;
> +	int i;
> +
> +	ret = nuvoton_qspi_setup_transfer(spi, NULL);
> +	if (ret)
> +		return ret;

This uses spi->max_speed_hz but spi_mem configures p->max_freq which you
should use (it might be lower).

> +
> +	nuvoton_qspi_set_cs(spi, true);

...except where you're calling in directly at which point the driver
needs to figure this out.

--UGarUI9v4pCN0SBM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmof9FEACgkQJNaLcl1U
h9AGigf+PXAtexduRP/S5ai2U1yA1oOZHH5GxgE1+Oyoyq8Z+QkGmkVCjl4ru80E
7R1XMoIB0CB46+Pkd4+3bvwxfWTqLtrdknVUatHO/QcvWOezFdEk3sPF3XOyEfdH
S/u1vxPWFi+L6ywy2OdG0gFt7aYJIZAc7l1SZNe5C7Ck0HLpY1O5sajk+Gu08tY5
UeskE7hA23JmD14+jzbM8yMVyVHVYNwpIq9Y2cfA7I8Hxe+wkLVGnN46FIgzXrsI
ZwHk1Y48hGsKqqHjLdkiYvv5kHAKI+3uoJNicUuhycLo9980PDh999clA/7+RPUL
Uzf+IFtyZ0vuj1TsWQ90yUArWSfLLw==
=PW/z
-----END PGP SIGNATURE-----

--UGarUI9v4pCN0SBM--

