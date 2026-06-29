Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2F3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 21:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5j/JMV1yfh/YR/oT6Vo6fxFZTTv2P3Ka0Eqjwg4hJFs=; b=ygRXYZB0Zozv0CgS1Gbt4GBuYg
	QvoNAz+i/c/bSbirlrqdgDYdde5A1NkwtgNQd0/d3eqXw3/OzUkSnpWOuz9+FwEDfM9M9o1xwLAlL
	VrekU78GsXVLPBn1wNMqRrCJcYYSbIhW+6wtpNWkeKH/eupZg5Mr+btEyLc7PGghxcvvvo/akc1aC
	PYUK3pkwcub0fbPgg1g4fgtIjPa2ON9T4yML5WgaGevDnBKwRc3ofs+/HupeEs2ks6broW88SG4nc
	vaNzg9Z57jlfiaS4cHAOidUhmBCyWUB0GmiBahEhRD4obGgwJtQEOY3ZqFG38MuS/4CJXVoUHLPHv
	arQvLUhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weJhi-0000000FWCi-0M5q;
	Mon, 29 Jun 2026 21:39:46 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weJhf-0000000FWCJ-3fnk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 21:39:45 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-493b1710405so7431405e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 14:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782769182; x=1783373982; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5j/JMV1yfh/YR/oT6Vo6fxFZTTv2P3Ka0Eqjwg4hJFs=;
        b=GI8DQy7jW5nXIXn1MTEn9OQmb/WR7wzZUTVsCUheyDEleCnbJZGYGWDMMF8bGqzvrO
         lxtw36cjaptnq5tFCSLWXPEUbd/mrTcspqkleV3YQ3s4aQ78r6XjNYOEn9yYkd/rBZsm
         f64gDIFszmlgVlRWvnSe8LOgMm3Z/P5R3znYD0UJ5EFKSwvV8cYwijPYfr0+lqB4O1a7
         45jQT2d/4t7lvQeaLrC4r1K+pyfXx7ez/wWz949yM1WYx2p0JZGjoe3ODvZfD8KBFFxF
         lxpVkdp7Cm+grV1mxpxQ2bAMrkQZ6qGAnFJ+pkVsj6naRVHrf4GZ2IfdpnHiWay+nZEn
         yP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782769182; x=1783373982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5j/JMV1yfh/YR/oT6Vo6fxFZTTv2P3Ka0Eqjwg4hJFs=;
        b=KZ68ia4sBhRGAkNKDnlNmnilkb4RHu8NiXUe7rGbLyXhNpIkLzDCNxenOG2BGr9IAl
         X0Gski1+Xxoq+fR4VIvk0Dj3XWV/Ihl93Mkl1ewm+ZzOrXNpXrbZgnZc3p96MA3KYi2n
         VOBAleFivIUqvav1yZQI6vJnCoj9gptKS0ltSkpG5+iPAprQIhGVlZ/7Uchrd6eTA1DW
         FGsdl+gBwIAuaQ0Sl9Y5QAhz0/GzBnZqqCSgIvTh4bvuccKBQLgPgOz6THcwXgOys6Bj
         MohQhS9vk6jye/VnH/EZfokNE7Byh4myqLjbEyg33RD0huTvU5AOp21FK8FNTpq516vw
         BNfg==
X-Forwarded-Encrypted: i=1; AFNElJ9jsg4NVCIS16DVKRHrjWJtb47SoWOvt2/fm5oRxpDK4e123aRGfVCPba2KROvWsqacb+aadecpTHU/PQvO5I0R@lists.infradead.org
X-Gm-Message-State: AOJu0YysHrN1eGFcj9A+rAQZuI1kXnWlWPXymLyow4YJVj7YXQma1HAj
	ikpOXkhEuueYrQOxt50XyG3g+f5CTl4Y2hcM2obZXPBNDig7zuW9W8Gfsk27y4TWKkg=
X-Gm-Gg: AfdE7clLIP2Bi+8RuQhRUwEIspnwPaiSfXPioam/SnO2aLLCJxZodHc+Rq3mMX7vjjV
	rut8ml2LlsDNDN7oNkqRJSItYRdYT7hl/okx6XZoBXLCMIsudQPIr8W6U00mjU7MWXXDWN7/UHH
	1uSj1re8zhT3fGYReD+5gd3qaLEAKch1+6G2MFn+2XfwfB4a0Ytbv5ljH27l7J5hA8FlhypeuW1
	EoHFlAIJv2YPSAGq4So1bFupHgFC8Oy0WViAWcraLtb1DSgtoilwB70qsNzcJWSkc12ZoYelnFA
	vbI40e7+GydYR+31WVLrfwSor1+Qka8D0JCMTuyp+sea/Ry/tb2q9gVd6ipnqett/PSRgObutif
	eZuWqUkkq+NdoSHyS37dJNK89OErXe0/KEtalf+r19b6AhDsPxzKTBC+ze0jIb+Zei2hViHOzBV
	NzIRi/nhRzmklhbRZ7tsdUGkDJt+wc
X-Received: by 2002:a05:600c:5298:b0:492:40df:d49c with SMTP id 5b1f17b1804b1-493b82ac618mr19908775e9.23.1782769181800;
        Mon, 29 Jun 2026 14:39:41 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:559d:eec2:887f:c200])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493b8d04907sm15984025e9.9.2026.06.29.14.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 14:39:40 -0700 (PDT)
Date: Mon, 29 Jun 2026 23:39:39 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Frank.Li@oss.nxp.com
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH] ARM: imx: Drop obsolte stuff from common.h
Message-ID: <akLlvHMcVpXDsS9l@monoceros>
References: <20260623104557.1801727-2-u.kleine-koenig@baylibre.com>
 <178276752372.2498119.8965955961315145259.b4-ty@b4>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2gwl24wibjwtmlgx"
Content-Disposition: inline
In-Reply-To: <178276752372.2498119.8965955961315145259.b4-ty@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_143943_958352_AAB11673 
X-CRM114-Status: GOOD (  14.49  )
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


--2gwl24wibjwtmlgx
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ARM: imx: Drop obsolte stuff from common.h
MIME-Version: 1.0

Hello Frank,

On Mon, Jun 29, 2026 at 05:12:07PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
>=20
> On Tue, 23 Jun 2026 12:45:57 +0200, Uwe Kleine-K=F6nig (The Capable Hub) =
wrote:
> > i.MX21 (and thus imx21_init_early()) is gone since v5.10-rc1 (commit
> > 4b563a066611 ("ARM: imx: Remove imx21 support")).
> >=20
> > The init_irq() functions are gone since v5.12-rc5 (commit e2c1b0ff38c9
> > ("ARM: imx: avic: Convert to using IRQCHIP_DECLARE")).
> >=20
> > And mxc_device_init() was removed for v5.10-rc1 (in commit 8485adf17a15
> > ("ARM: imx: Remove imx device directory")).
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [1/1] ARM: imx: Drop obsolte stuff from common.h
                           ^
There is an 'e' missing ---'  (i.e. s/obsolte/obsolete/).

If you want to fix-up that's great, if not, I can live with the shame
:-)

Best regards
Uwe

--2gwl24wibjwtmlgx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpC5hgACgkQj4D7WH0S
/k6/KAgAsFaXtrgz86LeL9gRjNk69aMhxBj55LBjrfYQkRcd2ELw8fKZOVe6XiiE
dyikdqZgsrSNIkQOyRYd7vHkUJRvPXeK4tpsumhoKIZdz3OPQdrZXPoKxlxcobEr
GMwo4CV0bFXSg0clo1tjsLUXoAOTgBDhYx3++XDKO6imyBblkmRy5oIBUPTjGfGx
Eszyi8SPkrmR4HFtXDyhtWX7+KxaiI0bc5wrhlDMLI1jAF+EIn3R6zE/8ZoP55RA
6J5Jr3HrtUM0iVShCgC5VKL6Uwp9t8Dj1G4o4ulHQk5a64uSsK+z7uGmQXAoLg6y
zMSUuSV1yhBv6kbgWFAbnLQuETkBYA==
=iJG9
-----END PGP SIGNATURE-----

--2gwl24wibjwtmlgx--

