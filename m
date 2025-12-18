Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90107D68BF4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 08:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ksxqoIpdRbVVOvr7sIw8thdMYg/F82UJczT1uvG5tPI=; b=cPNkVKNqttNWHbNY3G3v6WEWJE
	T68VRx+z0AJnyd8RGgipDJQVsX5YePoYyo7L7Msw/ACUWeKZOJT2yspTLIzyhkUbS7DUTWomBJSIu
	jzFmhUR+oblxGVUf7YPNlKDhZNYMui3GWgIRzoOcoxECxzJBxgUUU+fWm6T/nd/s1n/H0mZU8cBc+
	9Ts3Yib4lZmq1a7ZHoGal03DUVc7r2cmdYGOe1hXs4YsjYl9TjVpwCGbl2FEbnAmgtkBY0LCusgJ6
	1D0m299ZRrHdClSkZBEGP8F5jjHGwV/iZeea9PtBXoTfaTLD8U3/8Aie14HeWR2CBH/DVN/6X1rnH
	HgSrQcZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9pP-000000086Ri-4Bga;
	Thu, 18 Dec 2025 08:57:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9pO-000000086RS-1JEX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 08:57:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 725DD600BB;
	Thu, 18 Dec 2025 08:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C19C4CEFB;
	Thu, 18 Dec 2025 08:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766048261;
	bh=ksxqoIpdRbVVOvr7sIw8thdMYg/F82UJczT1uvG5tPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rbpAqrezzp8uuA2ZOZDduDt+vMbOJUBBZbkTqRAjEFQALTpWw+lt5pwId+qr1w2p5
	 JmlAxpLrWHymWA+CC9rrgxPsHXV+BdkE+kkkJ+xSj01np0plzIOjeNYvOFex1jkoTL
	 NIkM8vRJJHMchwQ1usAci5W+FALJgxX1JshGGBOJzf31ZAkLw1RswHsa19dwYIJynm
	 PnADjA5oeizDVvhses5PaZ7llu9wZe1YY2pAZLtGySr9aDOT+UXzK8ACdiuZFlLQvG
	 21HjjbUrGy/6svePzpAkMDjSNohf3ioqVzKny9zwTftZ1M6DAUJRCYmcwVPevfgCQl
	 iHL1P/MmCW8nw==
Date: Thu, 18 Dec 2025 08:57:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] spi: stm32: properly fail on dma_request_chan error
Message-ID: <6c153ddd-a586-4138-b3c4-793278d93305@sirena.org.uk>
References: <20251217-stm32-spi-enhancements-v1-0-943348b8ff66@foss.st.com>
 <20251217-stm32-spi-enhancements-v1-3-943348b8ff66@foss.st.com>
 <129a4deb-ec9c-41f0-910c-57cd43d17fcd@sirena.org.uk>
 <20251218083840.GA1530150@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dFnOC0IiRVMkfwqs"
Content-Disposition: inline
In-Reply-To: <20251218083840.GA1530150@gnbcxd0016.gnb.st.com>
X-Cookie: Close cover before striking.
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


--dFnOC0IiRVMkfwqs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 18, 2025 at 09:38:40AM +0100, Alain Volmat wrote:
> On Thu, Dec 18, 2025 at 08:00:57AM +0000, Mark Brown wrote:

> > Bug fixes should go at the start of serieses to avoid spurious
> > dependencies on new or cleanup changes.

> Actually I wasn't thinking about requiring this commit to go into
> stable branches. Without commit, the driver will still work even if
> there is an issue to request a dma channel since it will fallback to
> interrupt based transfers.
> This commit makes the error visible now, ensuring that if the
> device-tree indicates that a DMA should be used, it will either be used
> or probe will fail.

I'd not send it to stable either (admittedly I generally stopped tagging
stuff for stable entirely) but I will apply it for v6.19.

--dFnOC0IiRVMkfwqs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlDwf8ACgkQJNaLcl1U
h9BLLQf/WR5nHoveAuyhE2UOKgmFpx1YKda7i+ruawoOM0V7DPsliCaVggh/eF5m
/uZhfiWjK8bhx5ag6iz650iYXBTmfL7J6joyuVeazhRgkVSdS6c4ht08aUTR/OUv
rNcwH8Zg4/yXYy7i/PheBof1pLD3O1RFIiMy4cl4TRswYGf+u98VZI+2EbQ+TcoE
WWqspzdkwoluh3pf918qQL8q4A6OOiM3fRDx6ca+R9xAjWhHAtSGyq25Oj8H8gcO
gNQ1zBaIfrKbFg8TUHzPS2uvORvxBD5pDrkvVeti4HTjv2QiqHgwmNL3fuwqBx0g
EJfAbZsL8053B8Pig7u3A24gWYwFiQ==
=JC2D
-----END PGP SIGNATURE-----

--dFnOC0IiRVMkfwqs--

