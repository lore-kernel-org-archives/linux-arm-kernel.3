Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83F8E9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 17:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2QoaA1a1z1o827vFixfzEX1eaEmLUTQygP4V8sK0ePQ=; b=o7I41r1wzn60OMya7M8fM5SPYu
	RgmqhNti1iktzi0jKeaGeTJcvy4T2RE3zGHcvGjpUAg7CZ5rOGMixjMS+AwRpoa6iLro6mkkPt1Ny
	6s1aeLKIAfMdSpCiPCmPM5BsiEiJVUDx4jBVRnYvbqpbvtGKpvJ7p6G5Zo+qZPL5CxM089RU2DsCw
	Xy0B3q3kFFsWjf32lvgkCStbm0mISGMYin/MgMnYQflcIEXtjDE8Y8QGU1ur4ov+Lcp1tooMcEgj4
	j3atIi6462MD8Qv8K4p8ZzriPjgSNe1nptJK0CjBYWS3plB0p0lL8J5vD+OxqiBxdBkae+ei730RT
	K/Bpprdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsl3x-0000000A98k-2OCH;
	Wed, 18 Feb 2026 17:10:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsl3w-0000000A98b-1kIz;
	Wed, 18 Feb 2026 17:10:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 83CC16132F;
	Wed, 18 Feb 2026 17:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 800B4C116D0;
	Wed, 18 Feb 2026 17:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771434607;
	bh=vrf31UGQC7sMN9Bk+WuN/fZZA5/1kvKQF2i8RKcU5yQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a51d1zNwz1POKc4pDTtQf1eSurysdgjW4USBKHRNkWN5NWDL4O12xpFHC4QNXdo+e
	 AtPIH6yg4AafDwg5IWuPV41L+/o0/kSWq2DimzAum7w/80/XeuM+vSgzYaiYZHr+J7
	 GQvSCXHRR3bAisqevcFki5EHjv6zPqnPAwv+ZC92Xdw4rQXwjZfwN80YvpMtt/+0l4
	 oL+hi3siKlhRHK+1/Ard8Yvp01bvO4L3KDcyInir179EYz2enOg2/WPMjDNuEQLudX
	 C6p0hM1QHZE7WzQIKA3rIjbxT/IVcNzpPMhr4cSGC/3rSpC9LmrqbqfQCj5zisXJsA
	 rKV04kWTP/H0Q==
Date: Wed, 18 Feb 2026 17:10:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	alexandre.belloni@bootlin.com, thomas.petazzoni@bootlin.com
Subject: Re: [REGRESSION] Re: [PATCH v1] ASoC: rockchip: i2s_tdm: Re-add the
 set_sysclk callback
Message-ID: <e1cea076-fb1e-475e-b6a5-383370a69722@sirena.org.uk>
References: <20250117163102.65807-1-detlev.casanova@collabora.com>
 <DGB6VK7LC8N7.322SYGWZXPL5W@bootlin.com>
 <DGI2YVYBECUM.3O0UN9VMKF7FJ@bootlin.com>
 <34f61d25-607c-4967-bc67-3c7517c7fe14@collabora.com>
 <DGI8RSUWQ7W8.MDY7YGXPA5LX@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Sg2fNopepba5YOFW"
Content-Disposition: inline
In-Reply-To: <DGI8RSUWQ7W8.MDY7YGXPA5LX@bootlin.com>
X-Cookie: Avoid contact with eyes.
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


--Sg2fNopepba5YOFW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 18, 2026 at 05:51:51PM +0100, Luca Ceresoli wrote:
> On Wed Feb 18, 2026 at 5:01 PM CET, Detlev Casanova wrote:

> +		if (!mclk_rate)
> +			mclk_rate = DEFAULT_MCLK_FS * params_rate(params);

> With this, and DEFAULT_MCLK_FS defined to 256, arecord is working again.

I did have the revert queued, but a fix would be even better if the
patch could be sent?

--Sg2fNopepba5YOFW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmV8mgACgkQJNaLcl1U
h9B48gf/d+VlDiIQX8LVKF3Pt5LLWdaLDPBQPRcJUMtlQ3Gq527LeYabfnGZzMxW
c7XCtu6ZCsfeslgZ9bXWWUQOEQSOfccHBVZe/OdwDhnosl6/w4ZJgtwiFKRdgFgF
EQnD5U3CAtJdxsVsWTwZHubB3aW5wGACbckm1r3VQCAA2dz9CH9XAsm90Cc5Gk72
Sx9vIqBBdlh/dRaI+J6d3zPJ4PHzskknUMBdfMSXafQAyGF2LCxNZ+isYxjiCKK1
Ely+fHBIqUSpj3Z2uUetG7jqvRLr0XYjPXel3pl96RXulhkKXuu1rX6SRpGhoXMq
/GEAda+ItwVRTta9P2EIXFwPqN5cHA==
=3Is/
-----END PGP SIGNATURE-----

--Sg2fNopepba5YOFW--

