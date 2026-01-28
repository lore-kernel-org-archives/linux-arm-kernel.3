Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A02D3F07A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 15:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2w9sBWk8JNeGdOm1HJr2J+OoTFrNt1DP2d5ft9PGrns=; b=i5CKDdnlbkqp0cvx5gRUQOa5eB
	csbJEZAaSjox+O0ddzVf5Bznz6d402LlRiBv/N+4iGhxvgNOg8m0H9FQY6aC4bLVPaVePgERfvG42
	68Zk536prpxE9hAu+Q7iyTS+m2BbFLWrBNrEh6t37RlQtH6xrzu6B29bilsWt2UKyJQJ7mdLAsTTS
	KGLGNeX2w74szXF7yw19u47tny3nDM4UKLj8PxMBZN/Vt0gk22SoADjT/5TUZSDb+rCnzcdelYsTY
	JcQ8+g768ov9qmQ6BI/2kDzBcy2siqu8V/tCvm3LON05YnCy4UVBr9NR8w0tAo1I8LDVT21MQld9W
	d9zO+FJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7Mh-0000000GGf1-2Stu;
	Wed, 28 Jan 2026 15:21:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7Mg-0000000GGeq-0pNW;
	Wed, 28 Jan 2026 15:21:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9DE4C60007;
	Wed, 28 Jan 2026 15:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 207F9C4CEF1;
	Wed, 28 Jan 2026 15:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769613713;
	bh=2Zsk/TGT8bvlH30c7bRKqZGLnaPYjVqj8G+Sc2lAWs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kCZyoRxWNUIsCCMvdJMuVqsPnyFOgo0Dz+j9bCO81IaGAqfmRP6E44MZtGOE54wz7
	 PYx/pXKywHFPviblAtG93DMrCus/kadmva8+7KlzrBbCnVugfC95tzvjP1XLdnjdNo
	 E4XMqICu81Fu2hY1rtmKhAS3QCrzhAJGyyugx9J5C/JSGH0ADLPXBE/KVG/uV5YTl6
	 yO6QwXUNHnZyT46k6AX7ObD35jhWtv+zhUSaZd5hMDCJRv7CNxVrjaVHvn99fkWG2o
	 siuie3dlrJ8w9/LWTb4cl+uv6CGAxeZF53EjoS/iAnFEAJ414Is2wq56qfF5GdvhTV
	 78gZ/GgLBYN2w==
Date: Wed, 28 Jan 2026 15:21:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
	kernel@collabora.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
Message-ID: <9ed19fb1-258f-44c4-b816-73c0d7d28a6e@sirena.org.uk>
References: <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
 <6678782.DvuYhMxLoT@workhorse>
 <daa1906b-a112-4158-aec2-ad1d29b4fe35@sirena.org.uk>
 <5050249.GXAFRqVoOG@steina-w>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Md653eiPAQTQmKBd"
Content-Disposition: inline
In-Reply-To: <5050249.GXAFRqVoOG@steina-w>
X-Cookie: I brake for chezlogs!
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


--Md653eiPAQTQmKBd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 28, 2026 at 03:55:54PM +0100, Alexander Stein wrote:

> This is for TQMa8MPxL/MBa8MPxL:

> [    1.452788] __clk_core_init: enabling parent audio_pll1_out for clkout1_sel
> [    1.457677] __clk_core_init: disabling parent audio_pll1_out for clkout1_sel
> [    1.464270] __clk_core_init: enabling parent audio_pll1_out for clkout2_sel
> [    1.471760] __clk_core_init: disabling parent audio_pll1_out for clkout2_sel
> [    1.478360] __clk_core_init: enabling parent sys_pll2_500m for arm_a53_div
> [    1.485259] __clk_core_init: disabling parent sys_pll2_500m for arm_a53_div

As expected same result on i.MX8MP-EVK.

--Md653eiPAQTQmKBd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml6KYoACgkQJNaLcl1U
h9BdDAf+LJ1ulqGfbkvZOnVZ4oTowdg5gj2J/KhpHUh8wswREs3lsK+zE2HYPJqD
xzLz9colzYFWtcunlROoy6O4ypwx1NUnXp/zjQ7+cCwyOWVUpdbnHA6e/MPoEgVw
6ZtqmrqFRP8g8UagGfHwCaZ3PYpq5U5fXCCeh7COP3t16QxETZ7GpjQbJ1vSDtQD
zxvr7MIYQ4qcYNcQuFCruyRzm6JexqF36jElGYOzkePJbpQDyEAv1lJc9EhDPszb
Om/NNCgD3RbHcGlmRNhc2vG3HfR/5EY7rx+NrcMeoY5V07n0ZN+SgUDd5NdI+bw4
BDl9pXjpcl8S+/VV6CBMuiIKSj1qYA==
=YfRa
-----END PGP SIGNATURE-----

--Md653eiPAQTQmKBd--

