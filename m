Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E22CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 21:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9OkpCSXm5G+5kJ5oftsEKt+9Cndebe3Oy1eyFj4LhU=; b=OrO5CBWhnk7c5n1r7r6Da+cJZV
	E/JGXU0A6WKJsmGw8Tok6jLv6fn/9YfkXiXRi/e2w9Z2jPQ4oE5sLm/Kaul7/VuZ2uw9xu1PLfSiC
	7mfOsN1cgNFPO2V7EOfS/MJSTZeBUhT3BRK/M8evI/RJIWyfFGoamuUyS1MsfpcLQOcN5Kwr9djQT
	r3OApybexpC1FYtdaj4RK9YScSSL9Qu97ec9gTHibGwFjhhig5zaxs4I4nZ3pkSv5EkbHO4vvWkua
	d4MRTHN/0+Xn7bDvBJoJF6QGXjrYxZ2UDGu3F1Sfc9YFlr22YTzJN8l52/0wmPMBWeSepKHL1OJsu
	lvAwRFKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKkbK-0000000F8fb-2S1C;
	Sun, 16 Nov 2025 21:48:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKkbG-0000000F8fA-3Ss7;
	Sun, 16 Nov 2025 21:48:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A5F8340223;
	Sun, 16 Nov 2025 21:47:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E12EC2BCB3;
	Sun, 16 Nov 2025 21:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763329676;
	bh=pWYF/le3Qm/HubEQE1Ds+oFzfoE/9PrQTt+2HHhwDxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ILn1eG2GIfhzddilwyMY53H3eTd+v6fsSyeUw8F1O/HAxBcnkLPn0og6f4TAr82uM
	 iUeiQm0+sMmujTVpiLZ4Ft1LrRJuiUSlnseR+KKiwnE6YFdxcuQDD3n37BXTAw8npN
	 //7HQNGVI9qzv51Ma4nxZdN/PJnvglleQHx5eqINJDcln+RomKZXkyWDYGzc/JqXR+
	 EavK9h4BzP7xwSO2rfYnkrHQN8OmykyNVOhkuFDtVXCeyaxhhchEr4bye3eomkR/vX
	 K+vYNiem75+HCJ1PfUdaIUsBB6fzeMXJPcCxWW+5RWxymWXQHx+KBmBMX9EeyemBQi
	 Fhil+lQVQsqHw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0F9841ACCC98; Sun, 16 Nov 2025 21:47:53 +0000 (GMT)
Date: Sun, 16 Nov 2025 21:47:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: Re: [PATCH v2 1/3] spi: airoha-snfi: en7523: workaround flash
 damaging if UART_TXD was short to GND
Message-ID: <aRpGidWIakkclJTz@sirena.co.uk>
References: <20251116120038.672178-1-mikhail.kshevetskiy@iopsys.eu>
 <20251116120038.672178-2-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HRdJb4bqzkeBOF7F"
Content-Disposition: inline
In-Reply-To: <20251116120038.672178-2-mikhail.kshevetskiy@iopsys.eu>
X-Cookie: marriage, n.:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_134759_277390_00F22443 
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


--HRdJb4bqzkeBOF7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Nov 16, 2025 at 03:00:36PM +0300, Mikhail Kshevetskiy wrote:

> +				"==================================================================\n"
> +				"Detected booting in RESERVED mode (UART_TXD was short to GND).\n"
> +				"This mode is known for incorrect DMA reading of some flashes.\n"
> +				"Usage of DMA for flash operations will be disabled to prevent data\n"
> +				"damage. Unplug your serial console and power cycle the board\n"
> +				"to boot with full performance.\n"
> +				"==================================================================\n");

Multi-line prints aren't idiomatic for the kernel, we usually have just
one line per print.  If you want multiple lines use multiple prints
(like the trace_printk() warning).

--HRdJb4bqzkeBOF7F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkaRogACgkQJNaLcl1U
h9D9Nwf9GJmi40PrVoWCgwvdveggyr3o6bLdQm18NZ1RaW6oocbyUMtURrM3jG9W
mUnxJSemDZyVRAkCAp9yun0ua+O+YLzIKVli6pV0TTv9Y6g6LBcIWDS6qI1KC77r
n2WBDwxhYzG8ZtvmCzCUb73qBdLSEZPGi6QBnrdskcsSlnyWm8fJiM7voTf/0wwD
qUqgcEvPBSK91uxNPnoTedAnKnn0SvJHOzlNbh/bEpTUeXnNQkvcz13phACo4Cb5
/VhF2xyDMqQAJltFnpmSw6LhBx5d3OJXurxTZNhfHvY79/bU0qzIfeyjpyOxtyRP
aI37YjjZM/CNW2oupnvUQ1P505auzw==
=wx4p
-----END PGP SIGNATURE-----

--HRdJb4bqzkeBOF7F--

