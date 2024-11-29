Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529F4D70E03
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 01:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QDeUT98KS5fxKKoSZqvb3ItVf0xcYnDtU/zOpzcHAfI=; b=q3jjsgiGimn4Atxo8JCHqBNcxf
	rk2g7lQkVRNDb0oWK97gfoX3Bpgq8+iWxy/WRQvw/ChC1V2jT1vUNgEpTdLrittsrd5/zcNPqQppV
	zfQzdjb4xxaaZvGvO9awdhflxdBOuy1TnDD3EuqAa4/S8vz6a3tQitTKV6z5GVHQq9y9tKbTmt/qp
	jQPTdTtvjGpmCm/0GeyTzrf80BhskVtN53Josu1O+nqi2afmCTchSFJ+dG60qMq0DaapCS7L+gE4H
	geoXnlGt3PT63GmsgrMhOeD0advCShfc0F/2n4ZVdxs9/92kUjSmbevNNLhIYcdPU9BGjMSzSDQ6/
	NcFH6TsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGqEd-0000000GhrC-0uqh;
	Fri, 29 Nov 2024 01:55:55 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGqDd-0000000Ghlf-3J58
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 01:54:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=QDeU
	T98KS5fxKKoSZqvb3ItVf0xcYnDtU/zOpzcHAfI=; b=Equ7yXOskTQtUcbAMe1A
	Prc8PyWfJzaXvfvhcYPt3wnDgrd247CTnqYrL6jSaHv9h/gtJnB3eKvNsd1tBPDo
	ghb+izK7AuXrBJu7QlQUOHCrIuiUpTYLvutU17QfGMwLWzZ4c1Kz20NAaSt2GB6k
	aMKiFNsqFyZjzBxv7F3trHz3S34GqBfAL5dvIrqUXte8gUN8owK9vdHg3TUldKdm
	/Z6dBkHWCyp3TSrGNOCpQbZi1/gAX3u4THQIWY6jwhqbtzxDZCqMjrNjIYmHqcic
	Lsc7MCILk4CQioEV9dKIPpOTqN9nTCw2Np1qeOZbpu9RmJTwKNnKu7YQxKYcA6qe
	SA==
Received: (qmail 1195842 invoked from network); 29 Nov 2024 02:54:51 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Nov 2024 02:54:51 +0100
X-UD-Smtp-Session: l3s3148p1@v+UOfAMozKdehhYU
Date: Fri, 29 Nov 2024 02:54:51 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Carlos Song <carlos.song@nxp.com>
Cc: Frank Li <frank.li@nxp.com>,
	"o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: imx: fix divide by zero warning
Message-ID: <Z0ke6xBY_xnnh4Vc@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Carlos Song <carlos.song@nxp.com>, Frank Li <frank.li@nxp.com>,
	"o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20241125141521.1612947-1-carlos.song@nxp.com>
 <Z0SxUhBmp06ScnfP@lizhi-Precision-Tower-5810>
 <AM0PR0402MB39372A814D43DBCD5AAD1595E82F2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QM6MgxSTAC5BqVvj"
Content-Disposition: inline
In-Reply-To: <AM0PR0402MB39372A814D43DBCD5AAD1595E82F2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_175454_103178_1150506E 
X-CRM114-Status: GOOD (  12.66  )
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


--QM6MgxSTAC5BqVvj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > You sent this patch twice?
> >=20
> Yes, because I meet a net error, I send the patch out and wait for a
> half of hour, but I don't see the mail in the mail list, so I send it
> again, but another one come in after 1 hour.. You can dismiss the same
> one.

You can also check 'http://patchwork.ozlabs.org/project/linux-i2c/list/'
to see if it made it to the list.


--QM6MgxSTAC5BqVvj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdJHusACgkQFA3kzBSg
KbZTshAAl9m1FL+HhV82/XxjaECfvKy4bK+kBkt1Si6Df8V2/0RO/0I1Y3D1yT86
VkInNDR/pn5hH0yJsm4oZTOg68S+GFZtC5txrtZQuQi0SJePaGbyj2egfTpo/RXQ
PBqLqTKe5Y7Kkmyz9SeDG0E02MQC4j6lVCdXlpytC9lpnvgk5FVNWNFPVAQG72B0
jV/iPv1V+edP3od5TbRmiLN9PAAlX3LUKqCVfdSskx+fE3wvms8aK0fOh+LjPxkJ
CAikKY6spXg3U3xxRkwl1IixAwL4J/2R9HAMl3Qjy+nSGX+YK9iAgRbqJnzpGB9i
cZSXo9elSM0kTFEtw34/499YU9eDuPHjPa7RtNwKAURYgmgkzRYsiizFK5+I4ZBM
9mPqhYBcnQoBe/7IopD+AgtnQdcdYeSZwwKCLkk29rR1mTfnl0ty1hFDa5gCPrO+
jmiWawqsbnMT600PuiPHGiUT4eL/o/kUhTMKPqWOJU8oVW1UtRUIOzt0l1YVyQ4M
igS4alxzIgveQB0cK7HA6OpgrYOtVu+xzawLH2HPBToiqhjzQFKCiKkslShUk8R1
Q383wN8DhHSCf+OV6U5yizPc8Ga6+Jj7mz1S8e9atA0kc+lZeUmRir9fyQqozRZm
nHBLYjG+D8E9OMiSxuUMSUIBDoECy09im6oLNzQeAZMYAcUm41Y=
=0PZf
-----END PGP SIGNATURE-----

--QM6MgxSTAC5BqVvj--

