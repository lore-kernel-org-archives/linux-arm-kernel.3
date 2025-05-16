Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FE7C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 11:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2AqmGqN5e9uC85s7uORYRVeMii5+2Yzv/IhwZ4KrwIU=; b=VMya6Fgl3A3LsOTYDPWibyrML7
	g5ZFcKyPD71b4LUPR66G+qMAaymDy2dZpickS+TRM7VjnYz2eU/TTRfNsT60VmWyk8/qAJD/uw3Tp
	RgBURZjIFqEFV1hzkA6RQfdnQ4msR3auaRumkxsqUF/VqD0D1Ord9AksSLwvtOqSmO0I8VH7ICxCr
	y3R48xThqK/VuY5KXcaiFOMlLneMnTxL+Vy7Z8Ezt/wFNyY0mv4u3d8QycwDswpqlWc7iehjqcB6u
	kEQkXYrUDvvvjJs2OHX/On1N6GpXUTsWEEcsE5Khd9e7WgfIylE1LNNME9fBERIxhJmM505FYhpUc
	tI/VB7SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFtiF-00000003Jsy-1ONz;
	Fri, 16 May 2025 11:58:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFtgD-00000003JgB-04t7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 11:56:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 977DE445FB;
	Fri, 16 May 2025 11:56:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA2EC4CEE4;
	Fri, 16 May 2025 11:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747396604;
	bh=2AqmGqN5e9uC85s7uORYRVeMii5+2Yzv/IhwZ4KrwIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kmiZuIehGhZXjIhOYRSZT6vMgdgMmBTy8kx1fGSxOvvtXIUteyeTc5zPjmb8vTl2A
	 84A/Rwuh22taieqtQ4NgToC6gs635fvRsRohHCEa09i0ouB8aA7p7r5iNzQM4WIzhl
	 BCGW7B0U0LVAJW1hXbnvRaenPTC3z+vanNuQ+AcBU5s5jl9Vl/MMI2+kBXpQeVciWl
	 qxSqXL0EIbIMizBIhzHmddZNE2ZvHmwkQMsekoVbeOYeZDVFBf9qBgNorPNWOfhvhK
	 0X0BXRgoBpH1Hk8RO3u5szvzNeN4hbLi1xJvPTH/90I21Xkq67a8RI7MC9pUdFqL/h
	 iE1StynY83otA==
Date: Fri, 16 May 2025 13:56:41 +0200
From: Mark Brown <broonie@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v9 5/8] regulator: bcm590xx: Use dev_err_probe for
 regulator register error
Message-ID: <aCcn-aaY6TBGszSZ@finisterre.sirena.org.uk>
References: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
 <20250515-bcm59054-v9-5-14ba0ea2ea5b@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aOx5XsQqjeptAaq9"
Content-Disposition: inline
In-Reply-To: <20250515-bcm59054-v9-5-14ba0ea2ea5b@gmail.com>
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_045645_078818_E2A25C52 
X-CRM114-Status: UNSURE (   9.37  )
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


--aOx5XsQqjeptAaq9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 15, 2025 at 04:16:32PM +0200, Artur Weber wrote:
> Instead of calling dev_err() and returning PTR_ERR(...) separately, use
> a single "return dev_err_probe" statement.

Reviewed-by: Mark Brown <broonie@kernel.org>

--aOx5XsQqjeptAaq9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgnJ/gACgkQJNaLcl1U
h9BpQQf/VH7x+cuXZKUB2cbpP1PbxJTGJt+ciMTQ94KrX/8CMGvxkA8DivhPILpY
xKQJ8MTXtyLQSJSS+6rVvRFQgIvmo1d29OMiPRGzzCoAxlnktD4hRRxcThDNvCLX
OpIehzCFyyFlAERk8mIUs6MW3RuZ2+55uMmQ7c0FTMF8MwwI2wBYzrFkp4nvlDMx
sceTQ3OvR4qQYf60tx7UlqRM1xLpQHGwULjSwFPMsEjGRMyxbHYibZMqlN8hOtlK
Dt0j70x0QGtJI2WppmPqmCKIE3dAwcgItDoS511aE1/0WuIFHn9OfHlUNnjN4uCf
7MZv5A6k3QLDYcuEibOxYCb3N+VT5g==
=Hcs7
-----END PGP SIGNATURE-----

--aOx5XsQqjeptAaq9--

