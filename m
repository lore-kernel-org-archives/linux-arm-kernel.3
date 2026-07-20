Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86A0C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 13:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9RuNvHiYQSpCu7hRKF5vsfmrJAEpbUJoQoLPDmTFVM0=; b=I/Alk7D0wPLMofVcRlm+tzOvJs
	joh+8Z0jOvkLFdR7oNycqPDqX5gTVKqh7LbOFan8qBIChCmyeG+6cP09SPA5GOWEVV95FUqPNy1qj
	a3Q7igX+q89oBtKh5I9bYEIQZd8pK2V6oqDo+cxeg4LlNYorgG3nKEdmaQrTmvnjyroKPB8wageUh
	9PtC5nfkCLI2yToBguswsrUjocVhI3Z0nr93p39qOBGQvsyvZjCOmbQGbigo/mkWOLrlhAJJwgjpD
	dfzfXc3Ht41KitAb5Uk6D8+Lz6ErRLzm/rl++5H6ZP2sjwyp5/bDtkDprjkPn5P2sVI/prJmoEfaL
	adLeQE2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnsC-00000006m52-1blp;
	Mon, 20 Jul 2026 13:17:32 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnry-00000006m1D-2dor
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 13:17:20 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49546c690ffso25136175e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 06:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784553436; x=1785158236; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9RuNvHiYQSpCu7hRKF5vsfmrJAEpbUJoQoLPDmTFVM0=;
        b=X7/3prREQa7S0Woq+os5dYyimwDqj9cDciQKVeiqdnJmqczaerFpWCCjz4rVpU5uZE
         FeMrY8RtJXYykEpopzqI6GhUpFeXGtCP/nb/jQ6p2nFV21JD4I9zn46ATQjzzH0g45bw
         3zxH0kazXT+5iqGOTWeCXX52xTObAOKG7ckb5dzD6kFmXCtLKGM3ZLLWql71gxtrLmV9
         vbNXiiV6PTHLjxCd4nCwBHdrZzKc+v3k8tiUNWKS/UN50s7zH/0sZLLvDouDsDcpgO4J
         yUexbOY1LV2+9WW5hyla8QYbWk+fpFN2nThe2PGDlw5WnephA6u1Ngu3zbUVQuuOUMz8
         iUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784553436; x=1785158236;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9RuNvHiYQSpCu7hRKF5vsfmrJAEpbUJoQoLPDmTFVM0=;
        b=MiFCmgScq14rwsFkNmmwhX64dzs3dF8vaW1B0GvnGAUvkmlL4lKUicvuTjBfBiqCC5
         EzKVJbk1QGmDqoWqaWfnZMrcdXMeVHIiMktVwD9OGtJX3EX7TwWdji05KdytNyXLVfbQ
         DULyl6kczF9N0DL8WllgVhcGUw3VSoplPEj7rcXI7pQQdmiBM1m+bAvKrK9pYRYIU5Ze
         Caky5w2bbn2vlWAmpyOJ7NhhXp1n0lh5maKEZwULAfZZHptlMqvmZ89uLFOlYVAX83Da
         fIobV9FOM2vNDaWkJtwS1Hfuebk8LYU51pb2Z9Q/vGuGStN6xjAIPWrGLJQd0psKHfqa
         rctQ==
X-Gm-Message-State: AOJu0Ywa9wruzOGTZCL3rhyJxVBByJZ1CIv/T6VhwTDfrdMriNiKhqti
	isZEfpaO4k7Dg35AdxZ79kvZ7O3gHGIy/Be9dkiLmNcfpiTSEqfarGPcGxxBRqntpag=
X-Gm-Gg: AfdE7clw/5uNzt8Cv9gGoBiVuCnToHq1PNOfK0XaHkj67UtQtHF/Gzw8w3sW5zYcyii
	5+rjZ01vHzMx3aT5kJXNGTBjWTZalga3s1E8tLzB4F3hf7xsTA3uqHRhi++ZhaXIVBIG/VE/xmn
	g75yQ01dOwm6icDjP5y2OIwJLeYVstp3CMxDmfeeUJL4WtTOByA+LW2uGHFkakXnXVnx4rgW0TJ
	S3cE++XpyeHCC3RtjLACfIOviirKwlVp9itNm8+bvyrhVUBcEoH4ulvas1tsu2akVpsA7OV8Zzu
	711t4YurpPMXOMXVCbeUbedO37VEjGt7tjXUeovLcT/iz/xwKp2o3+4VRCq6uKUOrfC5ijSODLO
	8jnNwPNiuQFDv6evQewX7k/8AJQT8fp+eooWEr4lxhOqHC8Q2EvfYK66IGDEi7/cPkM/T145xAR
	UasmpuFpaVBzWmDjeb/EG/hgItglSafYzW4HtHRTQSDsyIqfySeNjODcOyFdN8OfQNwVrGovNuf
	NqK
X-Received: by 2002:a05:600c:198d:b0:495:5062:17f9 with SMTP id 5b1f17b1804b1-49550622f5cmr109488985e9.30.1784553436531;
        Mon, 20 Jul 2026 06:17:16 -0700 (PDT)
Received: from localhost (p200300f65f47db048587886ecb5b26b2.dip0.t-ipconnect.de. [2003:f6:5f47:db04:8587:886e:cb5b:26b2])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49561a30c56sm58826165e9.0.2026.07.20.06.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 06:17:15 -0700 (PDT)
Date: Mon, 20 Jul 2026 15:17:14 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] virt: arm-cca-guest: Drop unused assignment of
 platform_device_id driver data
Message-ID: <al4frY52ASoPFWAS@monoceros>
References: <1420ce71c3be5056a384be9c733f5df3277bf61a.1781690829.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wukvoajg5b5ihi23"
Content-Disposition: inline
In-Reply-To: <1420ce71c3be5056a384be9c733f5df3277bf61a.1781690829.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_061718_688529_B60D4078 
X-CRM114-Status: GOOD (  12.87  )
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


--wukvoajg5b5ihi23
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] virt: arm-cca-guest: Drop unused assignment of
 platform_device_id driver data
MIME-Version: 1.0

hello Catalin, hello Will,

On Wed, Jun 17, 2026 at 12:28:26PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> The driver explicitly sets the .driver_data member of struct
> platform_device_id to zero without relying on that value. Drop this
> unused assignment.
>=20
> While touching this array use a named initializer for .name.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>

Do you have this patch still on your radar? Should I resend? To someone
else, too?

Best regards
Uwe

--wukvoajg5b5ihi23
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpeH9cACgkQj4D7WH0S
/k5KVggAqqSnfKFBW2RkBhi0t4/zo9I9xw89Xj4L5EW87c52wmUzZP6btLQl/mxm
7KdFvCaIfsEtHpwxBzll0zUQa8yioWtBI0N7yMZqFzMF4pq+Lvxufs4ip8nY5Y8J
1pO0WBfEwcnBSGDbalcVmy7HCahJe8Mta6ygMhBiQh57yNdgUHyoPoMSSR2DD2hc
E9JZJwv/Si5AzR/Anb1QmRkbo6GRo0WtBO01PbVX8eX8xP/U2OY6cRaQvH4wyiYX
qo6uh0OVINC1ZzMf3iFGLqhnVkR3E/vvri7A20/I9PsvE+jL4ITaxz5ca+5PdU69
gAkIYDRVVgRQnfz6I8X9F4x7FHGTSQ==
=Ch+n
-----END PGP SIGNATURE-----

--wukvoajg5b5ihi23--

