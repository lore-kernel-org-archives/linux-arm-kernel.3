Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C205D4337D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 17:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4CFpVNMwGPMLHkiKn9CxHazr1rQaQ1DQ5YmH8gbPaM=; b=yfyENo5UeRpK5khYmBuAn9PJxC
	IXnt/LgidKHdyacJ67RPn685ZRbq+apC39kdx+WvrhBT54I39hCfrHIde5D/RFr5vrrBb7UOyv2u6
	EkIJf8+3eUM4eLaCLg7zeSVEvPhEkBjBY/sF/m81MF2YFtnhaMzCnfzAIw03xpZLmQBn8JcKAEgqi
	u6Xa1BwTtxS3Gx/EJH+x1nnsmQ/g4I8eEBjY3dCEFitr3ZYNYohJINUgJvAeTTY+0OVsd44GljKW3
	SKeqNFrX5cOKzt65iwijBZhnaJk8Kj7hIFhlAZeylrTTQEc+uF8U9PeShw8jt+RWgQ6K1zFeit65W
	wwEzUKkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t95rl-00000007jxO-0gEE;
	Thu, 07 Nov 2024 17:00:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t95oM-00000007jPZ-421p
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 07 Nov 2024 16:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=d4CFpVNMwGPMLHkiKn9CxHazr1rQaQ1DQ5YmH8gbPaM=; b=Zw9bNIcxUxG1l/5hIy2pjzywpM
	BWm9aXdj5IvmCHmlj01KY0WVkVdspc80ihy3A7HxBmeR5+Eyr/UBYp/oYFwkz9VTPLHb1VUaqyX0O
	ksp9fuoaStIddTGjvEVKlGtEQ/u36e+FwfqS4SdRUxrbswpRzKL7/odnX0wMTydBd0pI2Vgyo5Tbm
	iSBojcRqREyNevAGblUVIk8KiZ0QwKRIm9WWNnLFMMlQWgkbqQGFutGbXbl8Qd77lLK6TPhIJTHKp
	yO7C24kv0Bv5M1FYJqeQaq2wK+TsLm/vBeAOtwDW77d+1TGs+DMFPmGIaMZzWsvW0/0Y7qL8NGjNO
	YfWhl2+Q==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t95oJ-0000000CADS-2vQO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 16:56:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DAEABA448BF;
	Thu,  7 Nov 2024 16:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC68C4CECC;
	Thu,  7 Nov 2024 16:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730998599;
	bh=d4CFpVNMwGPMLHkiKn9CxHazr1rQaQ1DQ5YmH8gbPaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ESwG9v9k/PbQRXcfACcR7LEy9hKW+uGDQwbaPrIMU1yCDnh8qajuBDdTUw4tTKZ30
	 h5Azc2zR8L61YpaM2gvAtX012+vIj8M+1bYTvDFi9HwD65Y4h7MzdigGOZM77TaiYP
	 POOGfY++Glr6rwSfBvDWrur+p1yWDsC/Vis9HHAFtJ1xavxtZL/345JIPOjHOLoYZI
	 h0EEWGFxf8hnMdQhEwql3FzRG/1SojWeQ3Ord2buB65d68c/+vPiegoanmuKR/FTXj
	 eS/1lEo6a6CUCtJYrysCjTHtQLRLOgSn+kmi308z0bXdA6p+peKtxAfGpivJSSHdoN
	 ElVql11NtCCOw==
Date: Thu, 7 Nov 2024 16:56:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Pengfei Li <pengfei.li_1@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, joao.goncalves@toradex.com,
	frieder.schrempf@kontron.de, marex@denx.de,
	hvilleneuve@dimonoff.com, peng.fan@nxp.com,
	alexander.stein@ew.tq-group.com, m.othacehe@gmail.com,
	mwalle@kernel.org, Max.Merchel@ew.tq-group.com,
	hiago.franco@toradex.com, tharvey@gateworks.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	ping.bai@nxp.com, ye.li@nxp.com, aisheng.dong@nxp.com,
	frank.li@nxp.com
Subject: Re: [PATCH 1/3] dt-bindings: arm: fsl: Add i.MX91 11x11 evk board
Message-ID: <20241107-halved-playing-d36d4ff339eb@spud>
References: <20241108022703.1877171-1-pengfei.li_1@nxp.com>
 <20241108022703.1877171-2-pengfei.li_1@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j5cmay0eqb/03zTR"
Content-Disposition: inline
In-Reply-To: <20241108022703.1877171-2-pengfei.li_1@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_165643_888323_7AF6531E 
X-CRM114-Status: UNSURE (   7.71  )
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


--j5cmay0eqb/03zTR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 07, 2024 at 06:27:01PM -0800, Pengfei Li wrote:
> Add the board imx91-11x11-evk in the binding docuemnt.
>=20
> Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--j5cmay0eqb/03zTR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyzxQAAKCRB4tDGHoIJi
0tl6AQCH53zKDA+LzcstqvCZfZB5CD4le7oKsRX5iV5KuHtR5gD/XIgui2iXLoF5
1t615YPpUGK/CWiO8w8Kg/oNwPOSJQo=
=oG0s
-----END PGP SIGNATURE-----

--j5cmay0eqb/03zTR--

