Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE06C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 09:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/bSlJSdmlkbWHZjun7hsykkC3laoNdDkksj4oYoPL0=; b=PeLE9B6464fZ4t0UcXzZSVTob/
	1R6hx62Nh5075oViqMh3OZbWzB4as/cyQpHQq/e24/bgHlld0JEINf0zUEPX8Af1DgRCPl7H8iITB
	T0SWdcvHJAIXquXFQyPH5JRx3DtV+cm1+G8wI4W7wOcPQ6BBgtVIRYlzfwuXq8V92Oo2B2OVRvxKg
	9Hdgtdi+2R5Dkv4Rxs0JBbEr/YUa4O4M3cLahL9/LlzaI5Xi72vyOD3JI8502Zl1jeTVu79abdcEH
	n2ouViq56Mi6j4nAcanNAN2ls/MPBJfTjBk34szIP1Et0sCwQQ2aodceQC4pluplhmVtdeuuGpgdf
	Pk0J7ahg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFrlq-000000033Tb-2h17;
	Fri, 16 May 2025 09:54:26 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFrhw-000000032vp-3n80
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 09:50:26 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so15146365e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 02:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747389023; x=1747993823; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w/bSlJSdmlkbWHZjun7hsykkC3laoNdDkksj4oYoPL0=;
        b=fQPK6A7aYSk8zfpJU6WYeNavmuL8S47K48QM992XS+QjlQwd4hmIL8GeNB44HhNaSE
         7sFWlNil4PYusfpM4wSVmZAWQMqsFQjpjIZODdPv2G4Vq9nKGIdehGaidv7XwzihoOLS
         KxiYUBT1sk9hWN1IAviXr9Pib7FGDfmaR3OJEIcrJANipskfu00JW3LhfHZ/GRjYhxWW
         y+ZeHr7SpUqpCl+CwYiDbAhxRir0lIsxFs/M+ybDR5MlrwojiBZT/5TX9ysd58X0IpCA
         PP2pPgH2uT+Tf9jiPW54/uBeW+51Ik41sLaa2rK2EAeaFdqhEPH5JZROmvLlhmz6Qtbx
         X3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747389023; x=1747993823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/bSlJSdmlkbWHZjun7hsykkC3laoNdDkksj4oYoPL0=;
        b=Di3P2JpwSYfkB3ONuv+9SHGy61+0pHlWU2mnV+xlAbIqct2fPV/9BiZIifwCZ1DPeF
         a6gSSCjXFng3sDNBUvkC2iaooO2V6L73R3ngSzJiVxLimoTit2W3NVHxdlztj8BHMy19
         42QSd6U8EIwvtgcS0A/tbS9FtehXVyoNCFjNJbbygIiIDlTZFVH52r9gv12KLri2FGyV
         ETDTN5jV+zSIKUQWM+GrX5TVzmCQp4xgHj0jzdInZTks2oPY2Ypexs+TZTCL/O9lqZI+
         WkqK8oc5NHx4UcUR/zqHy1zpiQn4YIJrsFOaXmQzPibSfyuJdxk1vzOAXEEAYnm7l9h4
         WW+w==
X-Forwarded-Encrypted: i=1; AJvYcCVlY87qCJp1HcQ5LT11ZAjDoacqwU5b49GRn2P2/A9uIm0o2BMMN+BQgCUVAjQkD2BKbL3VA3NXeX4hPcUHPWGN@lists.infradead.org
X-Gm-Message-State: AOJu0YzJqqvziAjOZbCtEDXgTZQvfaeUEVMqyAyCb6ARJ/lQJdTXj9IK
	3Dm2qtlL29ZgRWT1F+Pky824Ly+pf5kSFEKQniCEYgkkVEp4ORHyzmHBIiMrcvDOY9U=
X-Gm-Gg: ASbGncvcv17pL3WvlRX0lAX2JXpynldCjCQ0+D3cFEUF3vI8HAlUuyhj+b0dxWv2IDH
	8xuZIouVEbBOtDWv0agNaPh5O1U6sdaKA6NYw4oqRKpqVtBiG3NY9CgBN3ZXKmgcS9ZRQmpEnmK
	OPt8RnW0dXW2ukLsPFJ1bi3malyUEtYnFETGfVzup1mtvBmwtVmyG03EU4cdGhKBNO8CG5vpgKL
	y8m7g3AZai/O8ZA1iYCGeuPS9yX+WfM9fEePfAujUKQ7KigBG3a3dmShDYS+pQZ7JwHHIazUZCX
	/mcSBCbD0IRib8e+G8//cxre7kXkb3OulpvgNl758jzbAFnhj2vn0lByQlwPI6NSlzYO0/mAxyI
	uACVMVdkv4F/zFRn5zrk8cGJPtKlG
X-Google-Smtp-Source: AGHT+IG8U8vuqf70rCyQDtiOWmQQMlATnOz4eXDJINSunO9kjrn7q2b9sgtlTI0vMJw9CTIra++GNw==
X-Received: by 2002:a05:600c:4f42:b0:43d:abd:ad1c with SMTP id 5b1f17b1804b1-442fd60b64dmr24944235e9.6.1747389022959;
        Fri, 16 May 2025 02:50:22 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442fd51583dsm26876685e9.22.2025.05.16.02.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 02:50:22 -0700 (PDT)
Date: Fri, 16 May 2025 11:50:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH] ARM: dts: stm32: Add nvmem-cells to ethernet nodes for
 constant mac-addresses
Message-ID: <k5sznrkn6shjn3d5uj675sktkgwf3aivfr7hchialln433ktjs@u42bfyo7tnej>
References: <20250328171406.3307778-2-u.kleine-koenig@baylibre.com>
 <xvhstvgs5bpfebeolozdbxh2empviijqq6hg2k2kuav5xykpqw@a3jgkrqzj4xm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6opi2kcagpe26yym"
Content-Disposition: inline
In-Reply-To: <xvhstvgs5bpfebeolozdbxh2empviijqq6hg2k2kuav5xykpqw@a3jgkrqzj4xm>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_025024_942435_7BC927A3 
X-CRM114-Status: GOOD (  17.03  )
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


--6opi2kcagpe26yym
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ARM: dts: stm32: Add nvmem-cells to ethernet nodes for
 constant mac-addresses
MIME-Version: 1.0

Hello,

On Thu, Apr 24, 2025 at 05:07:00PM +0200, Uwe Kleine-K=F6nig wrote:
> On Fri, Mar 28, 2025 at 06:14:05PM +0100, Uwe Kleine-K=F6nig wrote:
> > The efuse device tree description already has the two labels pointing to
> > the efuse nodes that specify the mac-addresses to be used. Wire them up
> > to the ethernet nodes. This is enough to make barebox pick the right
> > mac-addresses and pass them to Linux.
> >=20
> > Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
>=20
> I wonder if this patch is on someone's radar?!

I still wonder. Is this just due to -ENOTIME for the maintainers, or are
there doubts about this patch?

Best regards
Uwe

--6opi2kcagpe26yym
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgnCloACgkQj4D7WH0S
/k7CMQf/WwQ49zZfeEgNvOM7sUOEODuoH5TsG5AeMQFlVrrfQhA4KJYPKKM36JLN
aGpv/eqpwjRlZY6ur8W4bTvjTMfO8vWhQgHTJV6uR5ZWkOcaTxjrjLtmCj2yRF2J
jeip+Wm6yq9kgdADVApinoD38wgz8V1oUyT/JpQZNUe20lnsxAKYo4mb0L5mjWu9
Np9Vfgu3cPmB9liK2DFaCJ7j6NGXhkCiILu2+9egPMCdF+m8ZYhCBryCULuP2lub
aZ8EW1P2lBercWsbHqq1HZ15EiHZpJbcxRD/yt5qBhrRbSLD0oHixaDXF+yJM5ws
pGB/wSviPXFOMFjOvhbUMlI7zcIaEA==
=riy4
-----END PGP SIGNATURE-----

--6opi2kcagpe26yym--

