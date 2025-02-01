Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAFBC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 12:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0s4c1z7BZ7bSDDIII2Wq8XIoVPljTquKppMciXTq00=; b=yHV8GoSAs2z2bIhu6Kth/jJvbh
	sUqcXZvDxAFyV69y8B2liALkfCFzb1I24v3RZVzMhWQWB9AFEWfS6KGL2HGd3H53r8ZhW/1gBa3m6
	Vy7bx9MXnvzyjdAJkVcFwpPrk3DexbMREkdiD6e4E13got4eKoYPW6Qsc27cUdKmUw6XdehN0ysjh
	Jb6p8aq5U84JCzT9/nsnBgdAMUVfayOgXxXf6c9ZUsGvRODF6JEahGt4XU+kydPD4DRNaPc1KaaaY
	tTOqkkIuI71BCiB+g/W7S2RTrCPcsXIM/OjwnObgDOFq8SOvPRciCWyCHVlY6Fvv7vIt169ngRCuo
	LJfgjZvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teCLN-0000000CGLQ-3AEN;
	Sat, 01 Feb 2025 12:11:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teCK4-0000000CGIq-1arQ;
	Sat, 01 Feb 2025 12:10:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 97CC95C0FE6;
	Sat,  1 Feb 2025 12:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C261DC4CED3;
	Sat,  1 Feb 2025 12:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738411803;
	bh=X0s4c1z7BZ7bSDDIII2Wq8XIoVPljTquKppMciXTq00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cpq9H9wzoeKLys+TJRtugW5oiduKaC/GKF69xFa7GJzYWan0Tbm224z1hSpD4KgcX
	 y9ooIpWAJVP1kUcyMxuJqtwqIDHxJREb50SZjH5L2PbhHZPOtzjTfnIhg2rqR3rklA
	 d28CXTBnN4lDxaa4/HjGCn892eErdhkUHg2iwdWbUPPk+xH6oBczCszx5tQ5JQ+SQ5
	 ecXhK0iQq+8lOZQ3QacSq76jQXWWvDTw58gEf96uN1DKUTe/l0sURAfiOo/dZiYMV3
	 ZZ9dX3fEKtJ9jjc4+5umFoKHODuuZm/llTRC94qapOlo82nUOeCuNxOtGI0TwqawwW
	 g57AtHVZum1aQ==
Date: Sat, 1 Feb 2025 13:10:00 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] PCI: mediatek-gen3: Configure PBUS_CSR registers for
 EN7581 SoC
Message-ID: <Z54PGPz1fJ0yiTJw@lore-desk>
References: <20250115-en7581-pcie-pbus-csr-v1-0-40d8fcb9360f@kernel.org>
 <20250115-en7581-pcie-pbus-csr-v1-2-40d8fcb9360f@kernel.org>
 <20250118-astonishing-ermine-of-painting-4d3eaa@krzk-bin>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LgyfW4RVq7N0GtkC"
Content-Disposition: inline
In-Reply-To: <20250118-astonishing-ermine-of-painting-4d3eaa@krzk-bin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_041004_473085_E316AE69 
X-CRM114-Status: GOOD (  13.12  )
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


--LgyfW4RVq7N0GtkC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, Jan 15, 2025 at 06:32:31PM +0100, Lorenzo Bianconi wrote:

[./.]

>=20
> No, don't sprinkle compatibles in other drivers. It does not scale, does
> not allow reuse and you kind of try to escape ABI break, but you won't.
> This is still clear ABI break without any statement in commit msg and
> without explanation.
>=20
> NAK.
>=20
> Relationship between devices is expressed with phandles. There are
> plenty of examples how to do that with syscon.

ack, I will fix it in v2.

Regards,
Lorenzo

>=20
> Best regards,
> Krzysztof
>=20

--LgyfW4RVq7N0GtkC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ54PGAAKCRA6cBh0uS2t
rJaQAQDvoThUNUgQ9p0u9J7P0D1NUZr6t4u565b4/aq7YCxqJgD+IWQYJyLpBXTv
OTQVwK0TDl9pNcOoMhg3kyCg1i+IWwc=
=uMb3
-----END PGP SIGNATURE-----

--LgyfW4RVq7N0GtkC--

