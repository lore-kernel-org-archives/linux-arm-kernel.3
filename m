Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC66D5B164
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 08:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fz7RRww98aR7+TFIOi8xsXZBrEV8mkiqw5q+W3z+x50=; b=ROglelLB0lYM+8ZUTktq9eVsDC
	kloROYbYwqUjgVlxYDlXv4Q7p/bvskKm55PTKugHqdJ3YE6INaS9zYFO3kXWud/OqBtVyrcciCjXq
	dbNs8PWD3PB8tiPx/JUsS8FQXaO83G+GbwRSvnM/bnrJ7JbPexN1G9Cb4nHK213o7Z92DAZOh+5DY
	k5oqSkT8nJiX/62kldYDOat8QD5+RsuYh8yE47Xocwharelnj3+JGnzVilqMIE/cxJ1omKYrehML/
	72sd84u2JcmyhkttoU3dPPbo90wCltDfVx2xJTjkB4hXW0PzoVO/tFRFjrkQWm7HTFKXXB9M6OAuF
	De0s6ABw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hIU-0000000DdBF-1dUX;
	Tue, 29 Oct 2024 08:09:50 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hGU-0000000Dcow-0m8w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 08:07:47 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so51092075e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 01:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730189264; x=1730794064; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fz7RRww98aR7+TFIOi8xsXZBrEV8mkiqw5q+W3z+x50=;
        b=iCYI1zL43UZh7krkP8bdPWgCg1id9yH+SvFMjurd85W6QT9zYcI/kaYs+HJchKHIAT
         IGn9fAV8cmnrT8TnE0hBpMsLW9tLJ3a6DjJmUpQozM4LobIBDR6wT8P5NIhhl01AQS/d
         Isry9ojpiy7tapuhFTR4QE2/tOq/r0K3BqwynliwEV///lp+B5z41NBX6vs1MGPTrpOy
         qZ40fpgUO5l+HsUN+BW1X4Tk25kZ281X4zLkODWg6VaITw5KZzZUiuwr2Fz0PMhuews3
         Fip/cYUI8xoN944TA4g24AYE+YzZjvYoUAw2/8IoCB+KnlPpho9DGvnxlhacW83QAA9e
         aW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730189264; x=1730794064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fz7RRww98aR7+TFIOi8xsXZBrEV8mkiqw5q+W3z+x50=;
        b=IsXGX8R+gVCy8QSu9vpEQdyiEMnPi9QYjO90OwttZt46WT1IbgwBwYXMKJAVFqOl2V
         wMYfeMH6aBQwcqSiODlR7p2b+nKmrIcMGB4QhTuVVW1mDCcVbxkncfT7kdJQ4wF1cSQp
         OgZwmmGueGm0TIO2RLnTN0wPUeXbwDbLjVvigy0zhyjoQay1bOtAMB5ykwT6AHx8oF2J
         5Ge0oFE2dhA19k/NBDmjpC97aghTQHxsA8hLMwK1jZgCUSIM8vp/gizK+PrNR6B9wkL6
         tRa8Xm8p5xfflLxEd4hhwOKVO4NpxPhNBgX6XdTSw1bXqRTkJhX1sMq5BVyl3ATVyPZB
         Kxbg==
X-Forwarded-Encrypted: i=1; AJvYcCUoYthcT8rBniGurKsENXCKPIdCwRXTodiZrGjEVHk6y/W1bx0m5sY3wYO3CyKYj6bPm0ia5znzMz1ML8GcmYSB@lists.infradead.org
X-Gm-Message-State: AOJu0YzI6g4ZNtmh080HYLtzSItOO96iL7HUtoXSBnRjwaZZWVxGupIP
	YQBzBdem/x/2mGqoguiDoM27xvbtXWAVGEdI9SkJX+NRauLwlU7HECOZ1TtlhTI=
X-Google-Smtp-Source: AGHT+IHdtLAytGreUBiJVRVj0CzK2hX+LtTYIjY1HGXyXgeH85JAHHDcJqmfe2WqX6/D5uWSIjYTxg==
X-Received: by 2002:a05:600c:4f51:b0:42c:a574:6360 with SMTP id 5b1f17b1804b1-4319ad2d6aamr98759075e9.29.1730189264124;
        Tue, 29 Oct 2024 01:07:44 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b9294dsm11699741f8f.105.2024.10.29.01.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 01:07:43 -0700 (PDT)
Date: Tue, 29 Oct 2024 09:07:42 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, pratikmanvar09@gmail.com, francesco@dolcini.it
Subject: Re: [PATCH v3 2/3] pwm: imx27: Use clk_bulk_*() API to simplify
 clock handling
Message-ID: <zbtjpemahkpoabonf2td2i62qrlbb2xv7wlw3te752h6hgnsjm@ba7sdyqgbvms>
References: <20240910-pwm-v3-0-fbb047896618@nxp.com>
 <20240910-pwm-v3-2-fbb047896618@nxp.com>
 <7kplk52i7e2nha5ym4loza5oc3lwghifjfk3aut24w3hjagfk3@zusb2naeaevw>
 <ZxfMZobFdBA7ffhU@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bgnhgnnffifnsrec"
Content-Disposition: inline
In-Reply-To: <ZxfMZobFdBA7ffhU@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_010746_255147_6C352341 
X-CRM114-Status: GOOD (  14.27  )
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


--bgnhgnnffifnsrec
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/3] pwm: imx27: Use clk_bulk_*() API to simplify
 clock handling
MIME-Version: 1.0

Hello,

On Tue, Oct 22, 2024 at 12:01:42PM -0400, Frank Li wrote:
> On Tue, Oct 22, 2024 at 08:53:40AM +0200, Uwe Kleine-K=F6nig wrote:
> > I applied just this patch to
> > https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/=
for-next
> > . The others are still under discussion, right?
>=20
> Yes, thanks. I think 32k is not necessary and need more research.

OK, thanks for confirming, I discard these from patchwork.

Best regards
Uwe

--bgnhgnnffifnsrec
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcgl8wACgkQj4D7WH0S
/k6ehwf/fyJogWx9JiTzSrjVr39U4buCC6TCylJbTGIiYDJGRW71DmfsuQ1S8OP7
nsN41Lb2xbF4Gn0s1IgZph5+a47bIwqzDINtl7YJ6Zj4HuHMC3dDE6GNjCi7uHr7
JvWfImw8m0R9jvEPL25ukoSgqFNeBYJHYVssLk86hZWC4ffVePMXpTzGQNVgMxey
LsUqNa65gIVzdxzBETe7bE0qZeidDFssFVBBBT0AduDDbB3NGpD9lb0Qa7Du3V0T
4ci550yhekpPrtartCbPKvFb6cfcOvT/mOdNqhAM12F3g3WOnx8au/XT1TMgu6o8
A880c+BSCnfEAgpF9xctUfVlLQL8Ow==
=EBhu
-----END PGP SIGNATURE-----

--bgnhgnnffifnsrec--

