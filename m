Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870AFC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 13:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TFsv3UfKcQEUe4LWmZy8joE4lsGXNnzFnSR4/jdYIys=; b=WaxXhRqFPXttwnAcJ8N/3AirG7
	dMn246f9zIM+L8qCIrZri0oHWBLli0MW+hKKNOj8tobASsLHPL9Fto2315IlalY5Rg2pVah6LH/co
	vdZWareFU5ReLoNPaM0dgVOMIzeBFJX2CUK6ZZ3S+/73fdY2IK72U0ejUdK1zCX7j0S94CqC285nD
	AC/krVVSUJr/Tfh3zHrqfxC7caF+wRLg+7betUru+8ptoDTQhJl5ZAr1fxBuUlKTbItZhVuw8/BJp
	7GHuHnBqz846XjyxGmDXg5sFQ/gf2uIoXLsWiP99m6RszJgfc6wVeJjU7c7UZnBhVh4VoPUyvBYJH
	YY0Y4lEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbJrb-0000000El2p-1J7d;
	Fri, 24 Jan 2025 13:36:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbJqG-0000000Ekti-3ADt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 13:35:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 68AA75C5E71;
	Fri, 24 Jan 2025 13:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59869C4CEE0;
	Fri, 24 Jan 2025 13:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737725723;
	bh=TFsv3UfKcQEUe4LWmZy8joE4lsGXNnzFnSR4/jdYIys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VTJp66NbwqsqB1XJ7zHZLaZXKg9oppm5xJfJAH4QCuyr/X87rCiPyEoc3lb6+nZ+r
	 1CDAZ2ivTmLGmmmcx3mRqcI4wUs9JyVOiisZxS1thOMPu4n0IoD24apM+fbtDkfeIL
	 SFDFdQhdal2g4MZosJX69gh7BYs83RF27p1Ki9U7O8hQLMqwYA2kQneUAJjpfGenNe
	 0SFV7/m5GtN1rKeMU6o6cgsecWpufiYP+KuqKUIQ/yWJLot6shH4INjcxZy2Kaz4YU
	 79VTQe1LJ7tVXkCJyH6IpTkjuL3R+W6FgWfcB1/Ibh08iPQeLDzFjPmbSq06V0J4Y6
	 WZhBhAbB/5HYA==
Date: Fri, 24 Jan 2025 13:35:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: David Lechner <dlechner@baylibre.com>,
	Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Subject: Re: [PATCH 1/7] dt-bindings: spi: zynqmp-qspi: Split the bus
Message-ID: <ecac5293-ae70-4575-b706-58f877bacc92@sirena.org.uk>
References: <20250116232118.2694169-1-sean.anderson@linux.dev>
 <20250116232118.2694169-2-sean.anderson@linux.dev>
 <9f40295b-484a-48e8-b053-ff8550e589d7@baylibre.com>
 <46a7eba6-a705-4543-b967-e83ccc89e7d4@linux.dev>
 <6afc379a-2f9f-4462-ae30-ef6945a83236@baylibre.com>
 <2784cc3b-0b8f-4116-b34d-0de4ff56cf92@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Pkerz/Ef+rgcHpyv"
Content-Disposition: inline
In-Reply-To: <2784cc3b-0b8f-4116-b34d-0de4ff56cf92@linux.dev>
X-Cookie: Earth is a beta site.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_053524_835125_2EAD6417 
X-CRM114-Status: UNSURE (   9.50  )
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


--Pkerz/Ef+rgcHpyv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 23, 2025 at 05:37:16PM -0500, Sean Anderson wrote:

> Your patches LGTM. I will use them for v2. Mark do you have any comments on this
> approach?

It looks fine.

--Pkerz/Ef+rgcHpyv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeTlxQACgkQJNaLcl1U
h9A/1wf+LwQC6JmRuJILYtffqfOtSDabDTmR6snmnjAjefCBKxfO/hAcNc2Q7Pex
z5hBWE5wI8Jospu0Z7tLTxnMTss99sjFPY8eVjqmNNxTqaT9hi6XbA7v6ZyRCRcs
In3EdL438Uqrs9m79GE4fqgSzniu+eKpo1gUnLDLP7cl2FgKs0VHPuaZzYFZ+PUj
X056bLr6i0jiwp5nMGKfWIG2CPtu3DkqtNNhlJNfmDwhe5hCEHGu/eimVFcxFXw5
W81T1KHx52bmeUWbhnDLaAsP99WaCgwt4VarQxGBRIF1wEvTxKvig3Vvd+7rMV9E
ZY/0pvaRX8141lF0IY4P9VBE1AddWw==
=3e6Y
-----END PGP SIGNATURE-----

--Pkerz/Ef+rgcHpyv--

