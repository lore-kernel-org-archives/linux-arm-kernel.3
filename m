Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19C3C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 11:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndgQ6kaCgk3fpnFUCA4YQhJBs5itv48fCfGXFazSnLY=; b=oNd2657b68pOJtH9bewQu54tR2
	+jz13Q+QtDbULee4SbE29bkJwoH2HhJya5lYkmS5XBLwOYXIThIrvry107mBcZyMLYIoQe/kYyGvd
	1Q/cVeWZCN1bHQOvaE/xFq5xDrwEEVbzaebIu0r9vtmY5RtDhPNgbBRhdBuH8uTdRuRk6ttZuVzvV
	RQndbtkKsy9NTDUIG/mVD51NORdOeH+4qZRTmKbCLyx4tuT/8M25ojmWPVVW+MPxmCgYzDujQG8Nw
	TfFUCFuqQhVzLpS/ZT2U2RqZ+8HgJfN9FRDqWgdmpj+u/xsHu5xqyVIK/ZsWniVilM1BDImAE5yTn
	IfbVhKuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugib0-0000000Gd28-2UjI;
	Tue, 29 Jul 2025 11:34:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugiYX-0000000Gclh-1lx9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 11:31:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CA61C5C0F2E;
	Tue, 29 Jul 2025 11:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35CF3C4CEF5;
	Tue, 29 Jul 2025 11:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753788700;
	bh=y4vGbQPemKBalKQIjXvDv5t7GDCaowzVXc0y68AGVhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gh4BWWnN1B38M5qEC5SU5f91E5va0e5qOxwTmr43pxSnjArVIFXNwbgy/YdjU6yig
	 ow7GVuylhQ1CzlsFSq214lJLqgA+T4NuZQvOi3IsTQVUx/7Jk5+6iaPZ5In8AkV1kK
	 ppnAx+AbdjGFbkn9u5Ql+bivqgNJy83iCUI0WNy6q7n5tEuKkng9SxuwtFNhTnVf0U
	 x5doAH37MXCTMyeLuzs2IMta58XcC/kccyOvuMNR9V3dVEd9SmVYY7B1mXv+pPfWxo
	 oNTZOakA515YdJQoEtw06lv6cPD/RFiqwLG5igj5KPh0xLwozlfJ4MN0qdMfVxNqXc
	 pS/yI3Wsby/fw==
Date: Tue, 29 Jul 2025 12:31:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 04/10] coresight: Appropriately disable programming
 clocks
Message-ID: <f9fb2174-5bc5-4c7b-b74b-8542b4f7cbe0@sirena.org.uk>
References: <20250724-arm_cs_fix_clock_v4-v5-0-63f648dae021@arm.com>
 <20250724-arm_cs_fix_clock_v4-v5-4-63f648dae021@arm.com>
 <b3782b8f-8c09-4fb8-bec6-186102cc66a8@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QMmVRuHtuPBSW/9q"
Content-Disposition: inline
In-Reply-To: <b3782b8f-8c09-4fb8-bec6-186102cc66a8@sirena.org.uk>
X-Cookie: Short people get rained on last.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_043141_505653_01FAE30E 
X-CRM114-Status: GOOD (  14.16  )
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


--QMmVRuHtuPBSW/9q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2025 at 05:45:04PM +0100, Mark Brown wrote:
> On Thu, Jul 24, 2025 at 04:22:34PM +0100, Leo Yan wrote:
>=20
> Previously we would return NULL for any error (which isn't super great
> for deferred probe but never mind).
>=20
> > +	pclk =3D devm_clk_get_enabled(dev, "apb_pclk");
> > +	if (IS_ERR(pclk))
> > +		pclk =3D devm_clk_get_enabled(dev, "apb");
>=20
> ...
>=20
> >  	return pclk;
> >  }
>=20
> Now we pass errors back to the caller, making missing clocks fatal.

Thinking about this some more I think for compatiblity these clocks need
to be treated as optional - that's what the original code was
effectively doing, and I can imagine this isn't the only SoC which has
(hopefully) always on clocks and didn't wire things up in DT.

--QMmVRuHtuPBSW/9q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiIsRYACgkQJNaLcl1U
h9CP7gf/a6QGIQvui9I8RFs1artw7Ym1nwZpYTmbZEe1GpG3O3wU/Xrwqci8/bIm
+xr5ymPxS+a+Po2e4bJZ1suPpFq/wp15/HzEF6DpEGWdgjvokn7JkteNO3UohWNw
3o67pP6Il9kvUL6W2tRk4GQqqUGITGMlaiHX4Qqc2CuhJTHcNMNYXm3FpXQBeNBL
xXUy04CjKL9I8kqWu/6bnAB5mSjj1MwDtWhQcWi/Xt83VwfeXIHTgMFDdIR3c62S
xZ4KU5uHpxSLqY6dns5JbM6Ibqm3EKmVX1O0ZOTyPD7QgYusdNsQ+zaXqYVhPXAg
yOtwcnHJpB/euhvB9Fui1K+ORnlDEg==
=PiH5
-----END PGP SIGNATURE-----

--QMmVRuHtuPBSW/9q--

