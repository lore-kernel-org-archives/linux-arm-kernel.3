Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22568FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 08:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRm2k79xTisXBIWWt8D5usInaBAOhjC3Ue5G7GGc7y0=; b=36hVboPnTVssVFWcar04/bWYIo
	BsymoMSROS3bjRfGu7frPjSnHpYHJSxYA62xtb2SQGZKS/2gvf3PlNlLYnGIgsZJkBU+L3nkLvuEf
	3MlS+ri3ORe5WBHZiQnkJXGmz7EuFIesNkMzofWDBRk88GxkU2QOddkaK3EyzhBPnQkCwKeIGW52J
	w21+1kXaUeH1eMAW5HPudfW13WHMM564LPlAkoxg2oPgiIYRpgVpDHx293Q3rUL3iCX93wTm5Mh5a
	SfZ1jCpN+DXT4EB4EKUoIz2Pd5hs4scCs2IJR+WJq7zwuchhFmZrh1o1v+s4NE5suEPRSQ2Ekp1rJ
	JJOTizUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHe7J-00000000ul4-0SYk;
	Tue, 28 Apr 2026 08:48:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHe7I-00000000uky-213g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 08:48:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5CA660141;
	Tue, 28 Apr 2026 08:48:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A22AC2BCAF;
	Tue, 28 Apr 2026 08:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777366107;
	bh=mYuU6MXaswUtoHhacsBHyqLEb3RQrKd2tVDX/wlE3eI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z1UvRjJE6dflfyQhl8JY3L4hVKRTdb2yQn2oMGAXOIbVRq0ZE7yZrHlCJiQWzyqOO
	 Ayl4xpG2K9JvWcjNz6M84OnOonhmyhzMHQSWPUKF70T+ZedmFx4i6rIq8l1oGhDjJH
	 /p4D/qUIvM2cdbG/6+bIUxDPrDJSn+Dl6gwmVi0oh6fY9PCddZGxaVzSLwgaA7sSzQ
	 j/F8H1o4gReMWS3wfLhSk+uW2mBiTSAYnrRi/6PWHd+4xq4UuHFidugqYKbhaopTOD
	 ndEHGwLH3UfYPox7uUHMjZullYmSdqb+weGzUd5oNgqJovNthw4Vr8OTgr38Myi8q9
	 NFTyzHQvLk4Yg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id EB9C01AC5841; Tue, 28 Apr 2026 09:48:24 +0100 (BST)
Date: Tue, 28 Apr 2026 17:48:24 +0900
From: Mark Brown <broonie@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, shumingf@realtek.com,
	rander.wang@linux.intel.com, pierre-louis.bossart@linux.dev,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] ASoC: fsl: imx-rpmsg: Switch to core
 ignore-suspend-widgets support
Message-ID: <afB0WHueZ5AGF3Vi@sirena.co.uk>
References: <20260415081942.4183108-1-chancel.liu@nxp.com>
 <20260415081942.4183108-4-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9UPrFDxvpRfQw9KX"
Content-Disposition: inline
In-Reply-To: <20260415081942.4183108-4-chancel.liu@nxp.com>
X-Cookie: Victory uber allies!
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


--9UPrFDxvpRfQw9KX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 05:19:42PM +0900, Chancel Liu wrote:

> @@ -274,6 +257,15 @@ static int imx_rpmsg_probe(struct platform_device *p=
dev)
>  		}
>  	}
> =20
> +	if (data->lpa && of_property_present(np, "ignore-suspend-widgets")) {
> +		ret =3D snd_soc_of_parse_ignore_suspend_widgets(&data->card,
> +							      "ignore-suspend-widgets");
> +		if (ret) {
> +			dev_err(&pdev->dev, "failed to parse ignore-suspend-widgets: %d\n", r=
et);
> +			return ret;
> +		}
> +	}
> +

The other error handling paths here have a goto fail to do cleanup of
the of_node in the platform device.

--9UPrFDxvpRfQw9KX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnwdFgACgkQJNaLcl1U
h9A7RQf/QUn+qnt2gIgZyXelbB3F/TVFy2HzRTJNgNigI/pP+0D9evGIAfFSilHe
bY/DChXlgzVcbleDy0tYinjOEJCFWMFbM5geexzQDCeLBVttOFJBxGFg+6miD3ny
XBfA3eBsgWML7fjtuVl8L9VvSoY/VqAxOlVd0ezQQhdPv1/+OTZ6tKMC2sfijJQi
OEo5m8hZpyStL9ez+64ZtCGJp8YjUa4yCqjEnqqCRvVAiJZCySLZHY3qQx19x4F/
biWimRE9KOg4o7MaSjodS1el8vIllMT13FpJMud9r3TnHhIgG9IRNrUdtdgBtriI
lVH1KxPbEDVL6hP8ny9Ick5+7MOiaQ==
=7KNo
-----END PGP SIGNATURE-----

--9UPrFDxvpRfQw9KX--

