Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F28CC624DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 21:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=quKv1rg6pN+umTyA545IWVQ1rBGqQJEp9oxgK3g6RGw=; b=j+L4ybTmIKmh9rkSaSyxZ0Y5kz
	Xj6voJ06/hfsga+fWJQiimCiHQIURVmWlnwyQUUhiIqQ+7vYqNb57/X+NkauKHiYY68pRAEehuCJ8
	7jVmPZqtf2EMgQe6sXWffnAkgVdLRT0fsCdbe2VBTI8JPRncMN6Uw7jHnwskoOTVz7nh7NT5/SUbC
	rF5aKsihlNxhD8ukJaupQwevf6/sJpFpcsLmQHiRcutye1E4GuTCC3IH90opMfaljbGLg+v6C5/2P
	zJHrKOtbwwXQz2oZ2fQ1eo8KdDq5hrryE5RV3r036Ra1FhY1rh62cRlvvx5SS4uAYk0i/Whrw37bJ
	mnS6fKeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2FIj-00000000fh1-1Jmo;
	Thu, 03 Sep 2026 21:48:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2FIh-00000000fgq-3nNR;
	Thu, 03 Sep 2026 21:48:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 57401413A4;
	Thu,  3 Sep 2026 21:48:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37ECA1F00A3D;
	Thu,  3 Sep 2026 21:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788472131;
	bh=quKv1rg6pN+umTyA545IWVQ1rBGqQJEp9oxgK3g6RGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BFMFDVM3yEgciUwtoLDAAByrSVF03uuc1pkH7HG9T2Bv3gCgYOTe4+8EVX4cWXLpD
	 Kcp+2mYzPrBN/Dik3bzhdZ8gNIb0i3xgTKWFtTVBmWE9FkJmmmNZ9bR77YQ4Bsd1Pz
	 8xQwunwMljim2cv1I3uFXvl/YUwBHGWqKhue9vLuTySNdQ/sXZOpojMvbQ34GBFi6/
	 /wXaP/5oY0tHpsq+GcwOZB8svsTmyrlqdbl4ZHKzJfPIYrNBW/zGOvvamQRr5KFm6T
	 fJdR2nZR+ZUKYRc9+Cpg8LdD09oGA7Tkh//tdXMOxZKNVnBuNG7/dZu6GKatFy/NqF
	 CrWB7zhwVDtuQ==
Date: Thu, 3 Sep 2026 22:48:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Gary Yang <gary.yang@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v2 10/12] ASoC: SOF: mediatek: mt8186: Use
 devm_of_reserved_mem_device_init()
Message-ID: <df541310-cc36-497e-b3c9-5ad4f15ebfce@sirena.org.uk>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
 <20260902194712.2003414-11-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="adSxNV/7OHX/0sHK"
Content-Disposition: inline
In-Reply-To: <20260902194712.2003414-11-mukesh.ojha@oss.qualcomm.com>
X-Cookie: One picture is worth 128K words.
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


--adSxNV/7OHX/0sHK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 03, 2026 at 01:17:10AM +0530, Mukesh Ojha wrote:

> -	ret = of_reserved_mem_device_init(dev);
> +	ret = devm_of_reserved_mem_device_init(dev);
>  	if (ret) {
>  		dev_err(dev, "of_reserved_mem_device_init failed\n");
>  		return ret;

This should update the error message as well.

--adSxNV/7OHX/0sHK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqZ6zsACgkQJNaLcl1U
h9DZrQf/YSIAHnk7hN7pE7Wn/BXo7i2+AbAx760M7Jjj4JLAx4B8xR3G/roBycBa
YlMdDcPSgyZezWgNZIQqCLEB74saROdDr+LhPEEdvS/NHEtGrmizgYrrsfckCNL8
o06imN4sCBPtRuYEz3VHAFwyvfh0tjjfCCX5XMA8O6TvzuI34ZPFlj68TBH37s21
3kNBWJ1q/I5WXVDLATLAYazVhaWyqpVk9ZkM/s6N68wux/FHfefKGXgE8ybX5x1W
1eRkWUr0NBRfYxGPskc0rE76rM2v/zEocyTJGvEpLSdLnM/X69iT+AZ8bu5LRvo3
P5ZJaZqkXfXR2WTTRJ3Hc9HCCgT6QA==
=bK8O
-----END PGP SIGNATURE-----

--adSxNV/7OHX/0sHK--

