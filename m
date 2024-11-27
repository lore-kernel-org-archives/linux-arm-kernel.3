Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267DFD6ACF4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 16:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hB9Xh72VW9EY+zK59eMd1FIwzbZov0foAMkTJrept4A=; b=v5wj6oJX/DlNfXqcFuL4vx46+a
	pc01cBZB3BLP075K5hoZJSzVLc67voeBxyBtnjfp+j3kVp+fB2a79NWiHbjvjPgpK3G5ElwX45z0i
	/T6aijFzVl7K7vlM4GqjZHhwxFD2XCKyc18xnwARonSFYf8HaJ0orOgwuXhcUGXmnn/ISG3UZ+OoV
	z2HjVX5T3+wZb3OA4IOtbgpm8kNPUhhTuQF1jDie6zXEXKkhFqT1787CdkTjP3Y/N383g/PS/H1Rb
	2Q/r4Yw0O5t4azTu4m58vt8xLJHbnTuru2/rOKRAOnRVTFd3edGPjM+Y+KLzPSAByaFfbcxuj2Uxn
	QLSbH2rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGL1Q-0000000DeMX-3kOl;
	Wed, 27 Nov 2024 16:36:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGKzs-0000000De69-3iUl;
	Wed, 27 Nov 2024 16:34:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AF7125C56F5;
	Wed, 27 Nov 2024 16:33:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26921C4CECC;
	Wed, 27 Nov 2024 16:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732725275;
	bh=hB9Xh72VW9EY+zK59eMd1FIwzbZov0foAMkTJrept4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d9leOM0c59TbObqiL7+ozbJjH+pRogDcMZald3bYtsytIBPo/9hxKdBD8ixnrtz+l
	 p4SrWcQRxuIlMdi3vL37Wfy2OEwgIREgB8vFAe5s6ty24kjdqG/VS9yMzJJgtxXZzK
	 EkwwUfvcy1RLoZ1dFraUB5XG1INf0TMlRCexal6JacrXTH5h+ejGET89D3FG27i3Rx
	 kW1zIYLGgP6vc9M6knzHeVOwt6TK7v4VyvO4JjERv7oezhYt3kKZlWp+i3TsWAqQQV
	 vC8OWd+rTirsFnxqPUeCE9qfylWQzRt0XLx/L+9yHVpt72YNX1FE4/cHjPHGtmZEgz
	 CJl/sjUuhQJqw==
Date: Wed, 27 Nov 2024 16:34:29 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Roy Luo <royluo@google.com>, kernel-team@android.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: phy: samsung,usb3-drd-phy: add optional
 orientation-switch
Message-ID: <20241127-expedited-worried-89e3603eb0e3@spud>
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
 <20241127-gs101-phy-lanes-orientation-phy-v1-2-1b7fce24960b@linaro.org>
 <20241127-unturned-powdered-d9d1b695732d@spud>
 <20241127-pushing-baboon-4afafcf8322f@spud>
 <fba9c9df33dc2e060238a9bb3466a2fea020efde.camel@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZR1J5D9xohh12xiE"
Content-Disposition: inline
In-Reply-To: <fba9c9df33dc2e060238a9bb3466a2fea020efde.camel@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_083437_009403_206A58DF 
X-CRM114-Status: GOOD (  20.30  )
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


--ZR1J5D9xohh12xiE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 04:27:09PM +0000, Andr=E9 Draszik wrote:
> Hi Conor,
>=20
> Thanks for your review.
>=20
> On Wed, 2024-11-27 at 16:02 +0000, Conor Dooley wrote:
> > On Wed, Nov 27, 2024 at 04:00:59PM +0000, Conor Dooley wrote:
> > > On Wed, Nov 27, 2024 at 10:58:12AM +0000, Andr=E9 Draszik wrote:
> > > > orientation-switch is the standard declaration to inform the Type-C
> > > > mux
> > > > layer that a remote-endpoint is capable of processing orientation
> > > > change messages.
> > > >=20
> > > > Add as an optional since not all versions of this phy currently
> > > > support
> > > > or even need the orientation-switch.
> > > >=20
> > > > Signed-off-by: Andr=E9 Draszik <andre.draszik@linaro.org>
> > >=20
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Actually, this patch unconditionally adds the property to the binding.
> > Is it valid for !gs101?
>=20
> Good point. I've only made it required for gs101 in the next patch, but a=
s-
> is, somebody could still add it (in error) in !gs101 cases.

> I guess it's best to squash patches 3 and 4 in that case, and update it to
> disallow for !gs101.

SGTM, go ahead.

--ZR1J5D9xohh12xiE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0dKFQAKCRB4tDGHoIJi
0tYOAP9rTl2TqNpo8uGk6OWIn9r76xINLkrcaIkMySG1Pa/oQAEArFBtipMlzKaR
UVQkQlpV6fOug4+hBcQK5BIJfyo3YwU=
=Vv35
-----END PGP SIGNATURE-----

--ZR1J5D9xohh12xiE--

