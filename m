Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A402E668B3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 15:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WC9wEnYWL0EQTioee95kVRsxy7FIR1mXYlHTKXGxmeo=; b=tJN0rnxc5Mt1lQ6ICRuoXdTlPh
	n/Fngy2ch3+mNDAADRRnBDfW2iZR+E6lXiKR49ISg807KDngF7LD96FJLfjR5TkKdOUvpjMRfXM2U
	LUrpRnzeKqb0ovFYvEexYAQTKXTr6OQjSf8odAE2Rd3Tpg/B0bfYx/V+uA5Jyrd+97mSmIkbLvGij
	1xqfNO/r0Io5Dv0tqR9d9srkesxQKJX5lvwP0VF1JdS+7Uru6N8EyLgLzW9o60S+jaL/lcgIYAnKA
	aDnr/xGvErlBDeynI0ayp9/z1eEYMaEBA9by7MmlT4BLO1GFb9U679/L+Tmw4cI4mIrNamPVCQzGi
	wZ/rNC2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFEA1-00000006CMB-0fb3;
	Sun, 24 Nov 2024 15:04:29 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFE92-00000006CD0-2PMy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 15:03:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=WC9w
	EnYWL0EQTioee95kVRsxy7FIR1mXYlHTKXGxmeo=; b=L4AEqI5k01J/FeySqABI
	nNclRVmRuyS38g9Cr1vsP8MkrZHR1YvaE7ZK+aWjdrDryvLW5Eo7sXoPQ+VXbXMa
	c1WdP5Z6kLDnPBm0mB39YyAdS9cMlxtBfKKRAK3NKPmHVVnH5NQFrumiwSY7P3TU
	5pL8UyABxiVO/j2O5DxyKmyAehv5sItYSVELSrqGnv594hegzTg5k0oRZF+qt43T
	iDPKeaJ0B2O5NCC4h9BqlOdMWZu2Yxt695isPbdyPWim8tQRcNG5AgZX9Uh9OKtt
	433cccRvO+fNqZXrF+oj4ZNymgV5Ozl3wCMr1jKejYZIv43IntX+zfXiKGyeKZF/
	vQ==
Received: (qmail 2182007 invoked from network); 24 Nov 2024 16:03:20 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Nov 2024 16:03:20 +0100
X-UD-Smtp-Session: l3s3148p1@Hg6l6qknlNpehhYY
Date: Sun, 24 Nov 2024 16:03:19 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Kees Bakker <kees@ijzerbout.nl>
Cc: Manikanta Guntupalli <manikanta.guntupalli@amd.com>, git@amd.com,
	michal.simek@amd.com, andi.shyti@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, radhey.shyam.pandey@amd.com,
	srinivas.goud@amd.com, shubhrajyoti.datta@amd.com,
	manion05gk@gmail.com
Subject: Re: [PATCH 2/2] i2c: xiic: Add atomic transfer support
Message-ID: <Z0NANy2xoSE7TDY3@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kees Bakker <kees@ijzerbout.nl>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>, git@amd.com,
	michal.simek@amd.com, andi.shyti@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, radhey.shyam.pandey@amd.com,
	srinivas.goud@amd.com, shubhrajyoti.datta@amd.com,
	manion05gk@gmail.com
References: <20241011104131.733736-1-manikanta.guntupalli@amd.com>
 <20241011104131.733736-3-manikanta.guntupalli@amd.com>
 <d50b2caa-4d3a-4c1d-986c-6fb3c0a2f850@ijzerbout.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZqCwWEwsOzAY94AY"
Content-Disposition: inline
In-Reply-To: <d50b2caa-4d3a-4c1d-986c-6fb3c0a2f850@ijzerbout.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_070329_458500_51F7DA98 
X-CRM114-Status: UNSURE (   9.72  )
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


--ZqCwWEwsOzAY94AY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +	while (xiic_rx_space(i2c)) {
> Let's remind what xiic_rx_space is
> #define xiic_rx_space(i2c) ((i2c)->rx_msg->len - (i2c)->rx_pos)
>=20
> > +		if (xiic_getreg32(i2c, XIIC_IISR_OFFSET) & XIIC_INTR_RX_FULL_MASK) {
> > +			if (!i2c->rx_msg) {
> This check is suspicious. If i2c->rx_msg is NULL then the while
> above already dereferenced a NULL pointer.
> What is going on?

Valid point. I'll remove the patches from the pull request.


--ZqCwWEwsOzAY94AY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdDQDMACgkQFA3kzBSg
KbbqPg//Vnc4Zxwvj0fkEhvE8HZHChebEMmwLbL8JSx7dPb/7T3LeJUn8lJTP8Ta
UGCf4yx10M81atf8cRiupbI3lbphZ6KYoJ8C6Mui4wmu+1hI+7ve2cw44a/wGZJ9
HQ6KubeOwRaAAGG9ThlZ7B2zxCMrZl1pXQ48EG1Ct+Naxs61o0fPHvo8ja5x20QY
fqAN0URK13wBDnupixnge6eqiui0gUxZEdNHz6B12/QpMZg5xRTyR4xHlUeGjvkf
ivVVYjno2vCaI/+aOq3HXZMVr/e6cTbvcbmyxSasW2m+GaKccCX5vpS6t30bjc3E
Wm0JZDNxX/H5Gh9eXj6iAeAuGi6uwdRxuNgXKtkA7R9QE5PWUCReycmEScQheg1X
K9zxO1nyIkLRR+W+hFfT18MSyZJztBsopo9KT12zH+3CpvGtebYnK1wvlfiX97Br
Edq783MhPavJSjklmowJOdryPgFnP9wDapg1OQcYISFvGM433mWshk2y/xDUvHF3
HxU5iAXWF4B+RahGIp5yqHRLEs/+pqWiAW041qdmB2yGMF4Ma/3ZSMAvzsyKuJVq
gQGVsm7VB262s9O3J2ty54Ata60KCMHoI6TyoLwW6V7Kej635a2+y0sLkozvf5lX
6cQ380SDtvF8QnGqxG+gQelOLpfBPaQT6NqfTvs1T5B4sDz1BYk=
=pjrq
-----END PGP SIGNATURE-----

--ZqCwWEwsOzAY94AY--

