Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B95D6ACF0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 15:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WSGkgXaL4N5p2uwRcTTHYvq/3QczX507d7c/2vEeemg=; b=IfRQhM9+EuzLaaBl6jcIZGVUVL
	ZctyInAH4V1Pk6TcsCJ/H7mMasOKByS3ivH2glYM/ir8D3y0fuK9rBL33OhP2PI0pwiNGtqkB7j9L
	je5Mx5dV0dgH0MjLmmgzCcXDHtJABsb89Hej3OXVlbOICb6ZB/ffxxi8/eyVGcq5DDy44eNHkD3oV
	6W+VHuZ/Jd/awGk16J1ko2axH9HcRuWo56Re5XICKQdTU8jlKaDsfFLs2ZqS6bJ+DVAnXDpOU9fP7
	Ixs26TtapKW2fkNVeD/nAYQ9hqwfdyqwGkAgL3Yhgn1nYXgLUKmMudy12LQPaTzY5oPNhS21O7SnC
	S9MgpbXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGKQt-0000000DZXN-2jOk;
	Wed, 27 Nov 2024 15:58:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGKPv-0000000DZKI-06tr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 15:57:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 85F635C551F;
	Wed, 27 Nov 2024 15:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC0EC4CECC;
	Wed, 27 Nov 2024 15:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732723044;
	bh=WSGkgXaL4N5p2uwRcTTHYvq/3QczX507d7c/2vEeemg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XekDxYIgmckQWV1NFhqDy2VJTp7NPCiygIgd3uwhCCLqARbnjTzUNlHeLRJmFVXuu
	 G8BrMiepbHsftZ1ahwYMYEkJda+0ttpBUdNqmA13Fvdb1QQbKp8ir+IjNKtJ7mRzcc
	 H/SP2D8S/UI/yMS52eOF3oH8YkaNFg6rZ5LFYKbMGwnnsviRvcb9LwPb9sGWvOAHQX
	 ceO1zo7F7MyUaVpqYZEza0FGCJLuLJRGhKPujjZDFlAqPCb8akifWpNY6tfdgN4VgH
	 gkMt2mSKVc8zGV2U0lkuIF8m3X20L/9yb4Ssrb7RqHM8q+pwe00W1hih/3nxkNvxIn
	 7jO4tsg9dNP2w==
Date: Wed, 27 Nov 2024 15:57:19 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jagan Sridharan <badhri@google.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Roy Luo <royluo@google.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: usb: max33359: add max77759 flavor
Message-ID: <20241127-chloride-pantyhose-74f3d81e91f8@spud>
References: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
 <20241127-gs101-phy-lanes-orientation-dts-v1-2-5222d8508b71@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YAvHQQ/l8A2Bxt50"
Content-Disposition: inline
In-Reply-To: <20241127-gs101-phy-lanes-orientation-dts-v1-2-5222d8508b71@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_075727_104743_CBEB8873 
X-CRM114-Status: GOOD (  13.14  )
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


--YAvHQQ/l8A2Bxt50
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 11:01:40AM +0000, Andr=E9 Draszik wrote:
> On the surface, Maxim's max77759 appears identical to max33359. It
> should still have a dedicated compatible, though, as it is a different
> IC. This will allow for handling differences in case they are
> discovered in the future.
>=20
> max77759 is used on Google Pixel 6 and Pixel 6 Pro.
>=20
> Add a dedicated compatible to allow for potential differences in the
> future.
>=20
> Signed-off-by: Andr=E9 Draszik <andre.draszik@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--YAvHQQ/l8A2Bxt50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0dBXgAKCRB4tDGHoIJi
0mj5AQCDzK12u7YaMkhu+D9SK/V2jSyYP8eYKIAjoZDcb9CwkQD/YdlfFSRpxyel
DUeDcV6Z54WafX5zftL10U6v86kzHgQ=
=vXaV
-----END PGP SIGNATURE-----

--YAvHQQ/l8A2Bxt50--

