Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806A9E6529E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Feb 2026 22:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CH9BC69jP5RCt/eJVwGMK2W67lZNWhB3HFcUKx/WFj4=; b=lE2CYC6SsXezCBj/m68q67jWdV
	FjPogkAUYTu2wJ5nrnkwtbSh9FupdFuobY0hn6YdVE56iyNleKm3VhlSkpyNWp6DDXttYGd/Pfzav
	6zw9SWDG6TlBF/zwNqMcqq9tKjFDSc7mj2UVNpZofh6ZPrgIRvhtP0Fauu2unmH7neOgL5xStWGpt
	0em6A9AUc4/oUNFAEosRyFY0aXcP7mNS5glbKUzRGsPTNmeHWZl1n0qLmRvFIO+GmIOUVLyEOmPnv
	DCDCtVpvoZQGxYJszeFM7GPWCDh2XXemaxw5NNMyAyTD1iQ43G2JJ3ytnoRMtHtPUEZkjlsrbDN/k
	gJy+kH1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmfr6-00000004COt-1fWq;
	Sun, 01 Feb 2026 22:23:44 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmfr2-00000004CO4-0cXn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Feb 2026 22:23:42 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso32076705e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Feb 2026 14:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769984617; x=1770589417; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CH9BC69jP5RCt/eJVwGMK2W67lZNWhB3HFcUKx/WFj4=;
        b=0LOYrNyoDOwZB+ZVvTUiPFkGT+obGL8/Muxp8ub4UP7zHoZRoj4opUFaYPCiXIqjm/
         ePE3y9/HnMxsICg2u+OHLbsA0Tu+w/dPwKrOgjg3dGoP8P6ETS2PgBWa1BMzRf/AqB52
         NALobUMlNubzaO9wmLqwq8vhZw7V1cE6jgXMgZStC5/SOXwnDlMg7vzfhkxKcfuQsUZl
         u/1P9t3Gf9ms0oNUjG74sE9pWpzFLg5/gJAipSp3hNI1+lCCCsagzVXXADe+9GD04JPH
         w8jdOi8AB5PESwCRcztqhwRF1rWvrpu3DYKyEzhADpS+zim4AGMug22PLFY6+YwM8SVO
         CXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769984617; x=1770589417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CH9BC69jP5RCt/eJVwGMK2W67lZNWhB3HFcUKx/WFj4=;
        b=dI69nLc4maqC+DqAXZs5SZmwLWA14pLgvGPdIoU/E27h6qmhvRg9zbEYRT55AVSh5E
         Wnw7J3jh3dVmnIeXuC/d6wqBgOxbMfFx/9tN0xzrwcmDX4fuxMUlsT0fes0Pyl55jgs/
         MTx5xRycZDhtrECx+Ez6E9TdtCEH7/cUZNwXCBDMN5M0ctXdWttLzn3MOTNahlqjAyfJ
         5AxNL8ghCkPXABCHLeBo24vmDQaYv7HAJiDmy5MqQazDNCisVyaZSvPSmot/1jaPS8vu
         xF9USX/XyEQ6iC0Md5l5eUxJbsOGfGN/ON6fWkH1h2eB9dB26al1U8L+Z0UL8J5vhvJP
         aNCA==
X-Forwarded-Encrypted: i=1; AJvYcCUX7evaia6nY9cWCwAKXgV1tIEKh7nTgNZ9M6QnA6aDikd9BohcxrAzJAfMToXlO0fLcRDRR+ertOjTp+XYDtBZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwEvmvHAadZdB67+Pje5HQiyCYWQ6BHaQBtBlhOrja8QGO1YwHI
	DnPAb6Vv68sxRlxIGasUxE7g+xzsfdjV54flgVEzwdGPBsWw77y7e2EeZDHBOGQvAwQ=
X-Gm-Gg: AZuq6aJ4bx1HVkKvPU4IC4QDCLEkgrnvZbd/wn2gEbAppWlGE1DtBQxh4e+fkv8T91M
	68X6fnuxxksKt15bSeDx9ZdCzqPoin5sYw3H3D7RpoC2lmJmghwLu3tXbj6mUDg6hy+PvCNHw5D
	fSZnd9trlq9gsMfpkPYRhSoSM2Wk+iM4Qopw6ilpkNWHWnPZ7/dX+f0qutBnvY8AglV9RcMpnDL
	X6uJR25npPZruyST/L1rgmCXLg7P/d2Nidh8AZCyn9XUSaNMjGCwserZqeQm68Uffyp7bX+hYod
	pqsnffOpvJPwTZdbeTEMZKak69HVjiTOuH7Y7J+16+B5LxTYFtLIPl3N9hhHU0OV2gDq9kgbFKx
	hjFqHcqEzvVhFZVdTIfYjwZNVhe4dq2xa/dobZLtLWe3w6atchNU/gvmV4+4KOPDrz2sqQKvV/A
	mlunSfE4DpSuUZgFTqi3clyH8qEEY6
X-Received: by 2002:a05:600c:19cc:b0:480:690e:f14a with SMTP id 5b1f17b1804b1-482db4563b7mr126551145e9.14.1769984616317;
        Sun, 01 Feb 2026 14:23:36 -0800 (PST)
Received: from localhost (212-166-21-66.win.be. [212.166.21.66])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4806cdd79c7sm362884475e9.2.2026.02.01.14.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 14:23:35 -0800 (PST)
Date: Sun, 1 Feb 2026 23:23:34 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev, 
	Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>, Michal Simek <monstr@monstr.eu>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 5/6] i2c: xiic: cosmetic cleanup
Message-ID: <r2qkeep6jf7xxjzckn72z4avgx3qiqh4g2fkvzeyu2p2o54bff@xs4kzlong7cn>
References: <202601311615.10yziOui-lkp@intel.com>
 <81522270-1703-48E1-B64C-8CF174E1EF94@nexthop.ai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v37yrfnsg2gibrlx"
Content-Disposition: inline
In-Reply-To: <81522270-1703-48E1-B64C-8CF174E1EF94@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_142340_365101_C57DDF32 
X-CRM114-Status: GOOD (  21.36  )
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


--v37yrfnsg2gibrlx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 5/6] i2c: xiic: cosmetic cleanup
MIME-Version: 1.0

Hello,

On Sat, Jan 31, 2026 at 06:14:58PM -0800, Abdurrahman Hussain wrote:
> > On Jan 31, 2026, at 6:35=E2=80=AFAM, Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
> > kernel test robot noticed the following build warnings:
> >=20
> > url:    https://github.com/intel-lab-lkp/linux/commits/Abdurrahman-Huss=
ain-via-B4-Relay/i2c-xiic-skip-input-clock-setup-on-non-OF-systems/20260130=
-054653
> > base:   63804fed149a6750ffd28610c5c1c98cce6bd377
> > patch link:    https://lore.kernel.org/r/20260129-i2c-xiic-v7-5-727e434=
897ef%40nexthop.ai
> > patch subject: [PATCH v7 5/6] i2c: xiic: cosmetic cleanup
> > config: i386-randconfig-141-20260130 (https://download.01.org/0day-ci/a=
rchive/20260131/202601311615.10yziOui-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87=
f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > smatch version: v0.5.0-8994-gd50c5a4c
> >=20
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202601311615.10yziOui-lkp@intel.com/
> >=20
> > smatch warnings:
> > drivers/i2c/busses/i2c-xiic.c:1539 xiic_i2c_remove() warn: pm_runtime_g=
et_sync() also returns 1 on success
> >=20
> > vim +1539 drivers/i2c/busses/i2c-xiic.c
> >=20
> > e190a0c389e601 Uwe Kleine-K=C3=B6nig    2023-05-08  1529  static void x=
iic_i2c_remove(struct platform_device *pdev)
> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1530  {
> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1531   struct device *de=
v =3D &pdev->dev;
> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1532   struct xiic_=
i2c *i2c =3D platform_get_drvdata(pdev);
> > 36ecbcab84d023 Shubhrajyoti Datta  2016-03-02  1533   int ret;
> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1534 =20
> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1535   /* remove ad=
apter & data */
> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1536   i2c_del_adap=
ter(&i2c->adap);
> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1537 =20
> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1538   ret =3D pm_runtim=
e_get_sync(dev);
> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29 @1539   if (ret)
> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1540   dev_warn(dev, "Fa=
iled to activate device for removal (%pe)\n",
> > 810199f7315604 Uwe Kleine-K=C3=B6nig    2022-10-19  1541   ERR_PTR(ret)=
);
> >=20
> >=20
> > pm_runtime_get_sync() can return 1 on success.  Perhaps use
> > pm_runtime_resume_and_get()?
> >=20
> > 810199f7315604 Uwe Kleine-K=C3=B6nig    2022-10-19  1542   else
> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1543   xiic_deinit(=
i2c);
> > 810199f7315604 Uwe Kleine-K=C3=B6nig    2022-10-19  1544 =20
> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1545   pm_runtime_put_sy=
nc(dev);
> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1546   pm_runtime_dont_u=
se_autosuspend(dev);
> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1547  }
> >=20
> > --=20
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> >=20
>=20
> This maybe a false positive.

It's not.

The blamed commit 2557b4ba04df ("i2c: xiic: cosmetic cleanup") has:

-       ret =3D pm_runtime_get_sync(i2c->dev);
-
-       if (ret < 0)
-               dev_warn(&pdev->dev, "Failed to activate device for removal=
 (%pe)\n",
+       ret =3D pm_runtime_get_sync(dev);
+       if (ret)
+               dev_warn(dev, "Failed to activate device for removal (%pe)\=
n",
                         ERR_PTR(ret));

So we need

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 37a15065db60..a5334b7c46d8 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1536,7 +1536,7 @@ static void xiic_i2c_remove(struct platform_device *p=
dev)
 	i2c_del_adapter(&i2c->adap);
=20
 	ret =3D pm_runtime_get_sync(dev);
-	if (ret)
+	if (ret < 0)
 		dev_warn(dev, "Failed to activate device for removal (%pe)\n",
 			 ERR_PTR(ret));
 	else

Best regards
Uwe

--v37yrfnsg2gibrlx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAml/0mMACgkQj4D7WH0S
/k5SaQf+L43J+R9BBhzzRsM+a56bqT+f6V9BbGxQCgPvb2ug8BZRliJSX8Q3zsFm
EaNRAQ5tL6LTRPZUsMsJskjVpizKEtFORW26RjcmlLbTqpKj9e24IWyIczVmHaih
dFIe69J7Kzl6o2HzEpjf942SS2F2HD8JoJbx2GYTVnmsYM8w0JX1PZRO8+EZ5jo3
KJxf556LsB5aK5nw2bOy7JlZYw9P2P1kH/bTMvFNf/+6u4XDGYkHmh2t1SWPSDks
llkR84RXfcWTLzCW3uX9ecgAfNUVZ1uZxbPCF1yyz4cHJ0rFOCE6NLpHjwXpRrDS
A6GLXBGHlpfLu3RSWb/jClQ3kpk5MA==
=tXAs
-----END PGP SIGNATURE-----

--v37yrfnsg2gibrlx--

