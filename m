Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2B1EF48CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 07:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8T5o+WgGfW/lBoBXgg51mLpZKPQ9oP0YY1GV2iyeVDY=; b=WDJCKPhWOhoId+ongwNhDRpIW2
	g+hVTLavnQUVCg7hTZXChF6RBFFDBgp4hqAwoNybF/SFZWA+pgf2qaDPYa2H1DEEX6CrEB/fp0htM
	TmHWmM/yuXZiP6oFor9a4uvFt6z0V0UaviNY02xaRl8Vd3Jz8PPyuLP6g5HiFKkHUbMtBzvYMJkqA
	2V0xDjqr9zKL+TjWs6wDJOeJxsFkd3HhgMtTvS5PQlwMmMccyA+GCJ+M6DovrUWoIcFfq/kmfOGyn
	BVuRXr7FVTmRcwk2ZZ9fFHKf19AbDG5u7+zJ5gda2EZAMeA6hRppeO7Ze3K/Vx+fJb27VqymmY3DX
	1mmOZihA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqna4-000000036HX-29DD;
	Fri, 13 Feb 2026 07:27:12 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqna1-000000036Go-21wn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 07:27:11 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4836e3288cdso3483145e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 23:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770967627; x=1771572427; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8T5o+WgGfW/lBoBXgg51mLpZKPQ9oP0YY1GV2iyeVDY=;
        b=KjfMZgh/fyMjNirGLUCpzhNIzQXNWtMUGsUM3ywZON6P6CJ/8H+PFFpXaVdXHNjdcs
         t06O+IvWA81tkNsyxSO54PaOAaSvOou9GvRx3Ehz59Gex3U+sNpFiYdw5see6lCnfZbl
         tFhKUmtpJt8wJhP0CLqlPiyDyNusNASHqeclgf7Ly3J+KDO7TOCthPhO5whm+LktX1eJ
         DIQEJvbHvJILrKGOVxz6Bwa9Vt2p9JS9js/Nip+Oz0EneX5cKDSxkK17EE8xOfru+v80
         5TdZi2yYvQAF+9Of7LT3vOGDDuEhWmHBL3pI1vmFTf8tESYxGC6/Kbw0BNES6pAEvIao
         UmXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770967627; x=1771572427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8T5o+WgGfW/lBoBXgg51mLpZKPQ9oP0YY1GV2iyeVDY=;
        b=Lu+E0S5AUZnkKWQtJ1MD/bbFJsyCdDACY/S80XnqHr2E1dzaaL49z02RhLt7X3GkQu
         dAd0A07Yz4JPkKR4uZfL2d713Z3gVXHUAMHUWTU77Dhb34p/w8nPAbFloYpen3yyVNeS
         PjacLnFgTjmlE2OVnR60xCv4kDhOe/Zej5fgg86anUzlg81E614tnW51uuRbF0RLz0PN
         8Yeh/E99SNT+R3ca8HqGvu9tjNyCr0IwlJ25RWaxgHaENIVoa+AzYbbe88FxcvRE5nhK
         2svdGaQD5yAUISHgy4dlCJ0+CS3NxMRz/KajDIAVNdtJa6rpd3GryqLZ1C2fmM6mq85v
         etdw==
X-Forwarded-Encrypted: i=1; AJvYcCUGnIdODoTquTPF0YCXOdMY4I+UM4mFDPn7QnfsYAL6qolUvfBr98vGsMbCSKpEyYOB+rpZ64Ot9ztLxzbh1Lzb@lists.infradead.org
X-Gm-Message-State: AOJu0YxL8KczGlWUtJ/QgWz7zHlgCAV84OjtMJ24Ikp26EeV1e18tg+F
	9+FE0Lxpi6jh78a/kFUS+wbCXsS4zbXKYpIfX9ArtSecyotBEYBzD+/yXBAm+2aOhWA=
X-Gm-Gg: AZuq6aLldqgYzLgThgj4apSKOKpiE7X9Tv1B8YjfKN7HN7SJPRzMSrLqTtLXU2p1lf0
	kTz+epygfmVrV4qQHyGuiC0m+2W4VFvFIngH/G9CWPiGWQf+9KG/IjUk1ZXxGhCxdx24HqN/Wm2
	kJPotwUBF6ApGvdpidi5h0ScytJa+7Y/9XIXYtUBFE/l4kLashfcQlz4H05ByCXYDkKBKllPop0
	caPgpAtUG/GMGqub/W/501+up6CcQkPsP5DOi/H1XthFmOyGtwn4B9Zs7PRDU8QTE/8I7ibz52R
	zCTS7UQY3jAn9QuF47zlmPwKY1/SnQm6W+CPDkpVtXFW7etzuQi5DN/O0C4nb6cIciUZfYTua/L
	5oU2UX1y/3gKOoWp9qNUVPTAIT5VYzTVq90ZMuYkjnbqTN5mX5NTSXnJcwhDSsuXx+mT7fF3Pth
	vpieutAGp2CxMsQ+cWgAuHtYcqjKo0W2cSaC1pMaFcaHPhTl+p6tzoAY8tBls2b3Y/17HSCFJCK
	gc7eAtGnU2RMls=
X-Received: by 2002:a05:600c:34c1:b0:475:ddad:c3a9 with SMTP id 5b1f17b1804b1-48372fd3c43mr11757265e9.13.1770967626654;
        Thu, 12 Feb 2026 23:27:06 -0800 (PST)
Received: from localhost (p200300f65f20eb04101188b09ed9186a.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:1011:88b0:9ed9:186a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48371a10cacsm17260195e9.4.2026.02.12.23.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 23:27:06 -0800 (PST)
Date: Fri, 13 Feb 2026 08:27:05 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] RM: dts: imx: set #size-cells to 0 to align with
 nand-controller.yaml
Message-ID: <aY7SFS3LUC6rFwSB@monoceros>
References: <20260211-imx25_nand_dtb_warnings-v1-0-2f06aaa1e3b9@nxp.com>
 <20260211-imx25_nand_dtb_warnings-v1-2-2f06aaa1e3b9@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="suzgqi3scqpas5au"
Content-Disposition: inline
In-Reply-To: <20260211-imx25_nand_dtb_warnings-v1-2-2f06aaa1e3b9@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_232709_677005_0BC9C6E9 
X-CRM114-Status: GOOD (  11.68  )
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


--suzgqi3scqpas5au
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] RM: dts: imx: set #size-cells to 0 to align with
 nand-controller.yaml
MIME-Version: 1.0

On Wed, Feb 11, 2026 at 04:19:40PM -0500, Frank Li wrote:
> Set #size-cells to 0 to align with nand-controller.yaml. Remove the
> redundant empty clock-names property from the NFC node.
>=20
> Fix below CHECK_DTBS warning:
> arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dtb: nand-controller@bb000000 (=
fsl,imx25-nand): #size-cells: 0 was expected
>         from schema $id: http://devicetree.org/schemas/mtd/nand-controlle=
r.yam
                                                                           =
     ^
Missing 'l' I guess -------------------------------------------------------=
-----'

Best regards
Uwe

--suzgqi3scqpas5au
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmO0kYACgkQj4D7WH0S
/k5AVgf/QsQPSAIdM1RxlXudv1+osYGz6GEEo592KE57oRkdUvtyYxJXlqICexVq
CcrktfuQdhxHkTa+TGp6zt0D5ud0nzXjBYtGZVIhE6iKYiav5EiFArQ3wPcvnDQP
3x1upQR/8SgvfyApCIlLo47oipzbM/RDXrq7oKBgQQlvfjTdDJWeEn/+DAMULR//
7/32JHfGYcuRTzcn5CRi8QotO47K9uUcx3Hp96n78OcP2CgahlMpdlQTU3k4YDMZ
Yn1AJ+Ip34Pnhwi6RKW3AtyTLTsSmsgtogie1n20MHuTG7FGGLFze6oP6AWaxmDl
Ed8LGzeR90IPomEYk2RYoB/o4eurFg==
=y1p4
-----END PGP SIGNATURE-----

--suzgqi3scqpas5au--

