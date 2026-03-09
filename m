Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63629F417F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 15:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WuwhvHPE2tCeD+MbeMecD1Z+QOEOnL8/jIQcurr77Rk=; b=Ldpr/40eCgmbDY+Atuk7DXp23u
	OQrYKR/+82KVvCSzC2Etme7R8XHxEHizq1Y39aFURHoALe0gzL4bAkLaicg4LZ4gbuUXCEwbS8HIv
	nCHiDYadstjdfUnrrPgNX/8FPCtHIqZd2tuW2Cioi5zW5jjNXZdPWSESrjBjMEtCZPaGyTry5iqLg
	n6hWMD6uUkxmf4z6qVhDLmLRwlEf7tEacKEOvTjwlELoOERxqZCOYkgtO73+vWkLcHMzQk3jzDcOP
	CVDAOr7178dRelzUzeRAXztwzxSREJloaEw0depjVuy/ALMkT5VdRNh29QBlVuRPnkLxhYDqXmp56
	gIWZIQWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcw3-00000007eDd-1MzC;
	Mon, 09 Mar 2026 15:54:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcw1-00000007eDU-3CKu
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 09 Mar 2026 15:54:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WuwhvHPE2tCeD+MbeMecD1Z+QOEOnL8/jIQcurr77Rk=; b=GlBrQPlqU5iLwKcN7lJxKCjXBu
	0+sYnmCuC4zpwRVThOflesG91VafOFtr6VKfQ+hCl707hZUY0BokwoSKvTE4Fqc87AsoX8K5FosJA
	MOaMtqM7lSZFgVNcQuPcoEUVovtBS5PNcurc+5LlHFlstKO+0SzY5YzUWmY3HCSG2HGHmQCU694Sk
	plITWKEOUvQJzr3HdUcNKrlYASyddGPFtzzc15fKiBxMiA9nUmxb3jE4pDVhL8pqObWRR6HjOhIVI
	G2m/LDU+zNoEqzULYywm6m7sZAXglXzXTgzC+nNinxB+Lyz7zR+UVIR08f4yYWzdtl96HCqG2WCmC
	h6Vj9tqw==;
Received: from glittertind.blackshift.org ([2a01:4f8:1c1c:29e9::1])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcvx-00000006Bbk-2YPg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 15:54:19 +0000
Received: from bjornoya.blackshift.org (unknown [IPv6:2003:102:af0b:fa00:dea6:32ff:feb1:177a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "bjornoya.blackshift.org", Issuer "R12" (verified OK))
	by glittertind.blackshift.org (Postfix) with ESMTPS id DFED777AAF4;
	Mon, 09 Mar 2026 15:53:57 +0000 (UTC)
Received: from pengutronix.de (p4ffb2dc6.dip0.t-ipconnect.de [79.251.45.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 7E2F84FC771;
	Mon, 09 Mar 2026 15:53:57 +0000 (UTC)
Date: Mon, 9 Mar 2026 16:53:57 +0100
From: Marc Kleine-Budde <mkl@blackshift.org>
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>
Cc: mirela.rabulea@nxp.com, mchehab@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
	skhan@linuxfoundation.org, festevam@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: imx-jpeg: convert kzalloc_obj() to
 devm_kzalloc()
Message-ID: <20260309-excellent-lionfish-of-symmetry-5c1a77-mkl@blackshift.org>
X-AI: stop_reason: "refusal"
References: <20260308060554.1764128-1-sanjayembedded@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rwfq522xc3dm3ibc"
Content-Disposition: inline
In-Reply-To: <20260308060554.1764128-1-sanjayembedded@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_155417_711558_01DA0278 
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


--rwfq522xc3dm3ibc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] media: imx-jpeg: convert kzalloc_obj() to
 devm_kzalloc()
MIME-Version: 1.0

On 08.03.2026 11:35:54, Sanjay Chitroda wrote:
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
>
> The driver allcoates memory using kzalloc_obj() and frees it in the relase
> path. since the allocated memory is tied to the lifetime of the device,
> devm_kzalloc() can be used instead.

What happens if you issue multiple open()/close() cycles per device
lifetime? Will the memory pile up, until the mxc_jpeg_remove() function
is called?

> Using device-managed allocation simplifies the error handling paths and
> remove the need for manual cleanup.
>
> No functional change intended.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--rwfq522xc3dm3ibc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCaa7tEgAKCRDMOmT6rpmt
0sDRAP0WU8x/a6pZA9ver9FOcvuFQgp4w76tuUH0fxv5Q5oK7AEA2nC/ZdCd6qJ7
qPjF2o2RBxHPuXk33kjBxpUC0D7hMAA=
=ttro
-----END PGP SIGNATURE-----

--rwfq522xc3dm3ibc--

