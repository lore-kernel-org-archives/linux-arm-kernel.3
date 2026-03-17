Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278C5FD876D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 13:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LxH2w51jz9p6LSxJXmwFCJAAno6Vdky+VTfMtvNcsZs=; b=tC8IeE4Zb7rtPHEsK7/o7Fov43
	MQY45REAmJPQOGqU7KF3IDidAiq0Koz7gajdYbqG8QauWcB4tGeoJNmSZ5uCV156f1HFCfODPJqkC
	1FGFDdzWg4xDgx0qUc+ZqyxpldgTDvWW9pdQFEW0qTYuURfTd/PmDNwGDfvVT8SRktUyXpHZ4QaqS
	zL2GLBtUopur+sE1pYMz3jcrfMd8KjUBXlxXvM+huCtAOagPhV/F3E2HEgYKc+6xKuagW6FHxlhOQ
	9wpOM5boc81r3YZN/Kv2J0hRq1pDumr2QHRr24aHxQWWz9l3cyngeu04fp4j3FaqEAgGORPsNFv/8
	bIXbhexw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UhC-00000006T7A-3YW7;
	Tue, 17 Mar 2026 13:42:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UhA-00000006T6g-3Zmn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 13:42:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9934140935;
	Tue, 17 Mar 2026 13:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DDBEC4CEF7;
	Tue, 17 Mar 2026 13:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773754971;
	bh=cvWFM54q957EernSWzHaK9Acqjw396q6QTQo5GDsp5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iy0TnZX5T2xqw3wl38rgvtDR9JClrVeBVTwEjQZgZeUSC1mQWBqW/7QANTOB+ItEh
	 ShMuJXNtUDliwfJuOm40uaMs7VLacYFs4/xaeXEHuP0wSrirTRQUbkPVUIy5LQqRBg
	 5FqbbtdDB6HEelqWDfyEDYrGwjyJR0xK/vDSLyQP0VRdzNtsewmCWmBhZdxRCQKhwX
	 UtjL/WYWVKM3oGNCuTfxvKwt4ApwDU0XE1YwK32qPu1CzE06K8OSKaNNjr+SM99ctm
	 IwndBkfvV/zVMP64fw2nCwDX4++guZiEpwi6CnKsiGxnn9bHiy/g4fHTg6er0m7Tod
	 qyBGCOjWy60qA==
Date: Tue, 17 Mar 2026 13:42:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, stable@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Len Brown <lenb@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	devicetree@vger.kernel.org, driver-core@lists.linux.dev,
	imx@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH] device property: Make modifications of fwnode "flags"
 thread safe
Message-ID: <94dcb275-4af0-4ca1-9b4a-5769bcc2c777@sirena.org.uk>
References: <20260316154159.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CESacuQ0/LxRTmli"
Content-Disposition: inline
In-Reply-To: <20260316154159.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid>
X-Cookie: Must be over 18.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_064252_931926_1A554B74 
X-CRM114-Status: UNSURE (   9.39  )
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


--CESacuQ0/LxRTmli
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 16, 2026 at 03:42:06PM -0700, Douglas Anderson wrote:
> In various places in the kernel, we modify the fwnode "flags" member
> by doing either:
>   fwnode->flags |= SOME_FLAG;
>   fwnode->flags &= ~SOME_FLAG;

Acked-by: Mark Brown <broonie@kernel.org>

--CESacuQ0/LxRTmli
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm5WlEACgkQJNaLcl1U
h9DSgAf6Ap5hH7yRkuhE3ZUXEU9Sw0nRKEWLWHq9c0Jd+k0j/ZH4K6YAePaTKleT
VU3Fsx4siP9rbVq9sWIZ4qtL2ChJw3LgqNNMe88HKsb5MLrcpbCzUEXe9mZHg9ke
tucJZVfd79aIWfTHelxkhI1ZuW+JNDId0+0NrI427Jrhou3kPYT7+gJmYXuMbWik
Pmc0B/+HNSZ5wx+ETM7Ki9+Yj+BY15QaBoNID1YqUpzKd6xrtRs/Ep414//xibo9
92kpTPrKdt92+B4iMU/YWQvPyUelIpmWR7aJ9I823NnLKHA5yvoEy1ff5WloKA6Q
MxtC9dhuaD1HfwqImmlLKtm0H6/ABQ==
=PgWz
-----END PGP SIGNATURE-----

--CESacuQ0/LxRTmli--

