Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F339E7DF08
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 16:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dFkuMT/PbjlmykiEzaX0lWh1FmgYYTDl3OTPj1VFmSY=; b=KU4L6sHyAjiv6ghPOzD0bkcO7F
	dL5TCKddZuxudvmvslY05oLTJ/tUsLxF3YNiSPkVsyS0vmIoVdeVCrF0WoDxv4O2Zo8oQolkOQsSx
	08JBupTdNXFLmFDAVwHwTU4mRZVkHuo+6Hjq8PXI+5h93zaMCXvFwg1I+bQLoUxbIzQ0F6RJGywEw
	3BimQisa23NyG20O16edHR+eMgvImhdcxThLgXgeBGYa2sha3J+B7w9eR+FPrFr22v/RqgdtFT6Eo
	KD4CUAyeEVK+rHzGq+f2BIVtY8UlM8Hzp+TIYM5r9zumhAIb9pvnRUy/WYQ5fs86i4h1tIxQIip/L
	JymtkZFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmxCD-00000005KMS-3p4P;
	Mon, 02 Feb 2026 16:54:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmxCB-00000005KLx-3yX4;
	Mon, 02 Feb 2026 16:54:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EBAAE419F4;
	Mon,  2 Feb 2026 16:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3571C116C6;
	Mon,  2 Feb 2026 16:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770051278;
	bh=dFkuMT/PbjlmykiEzaX0lWh1FmgYYTDl3OTPj1VFmSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kI8WLpuYhsvo6gYvA61W/ciV+aGtbvKXKU+5m7TEoukt08Chnc1n9CkRrqroECPrN
	 MbhZ3R+dsdxBL9CtiFBCYhlKOSzsTxECZQVxO6JuRk+Ad5/Lfhsji5zkkJEmHBGjVc
	 AQQZWDOC3SCOztTIXdav3VmmVTZ7MMt/AN0+L/8usZiFYfKLHNQpNLXIpc7+3igurc
	 l6QT/rJ9P4v1zA/KqWEakBz2DdoTznGWy2K/sG1FCPR+TeSCHjb0ofIP9yCcZJz1TW
	 U+ohk0EKSvoLp1xMlxgbswOaIklRLgUbij0n/hKcAABmC0KzLQaJXglOvZwAhReMMj
	 Z62dzUs4rlLUQ==
Date: Mon, 2 Feb 2026 16:54:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
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
Message-ID: <e98290b1-274a-4f8c-b629-11c1167b0370@sirena.org.uk>
References: <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
 <6678782.DvuYhMxLoT@workhorse>
 <daa1906b-a112-4158-aec2-ad1d29b4fe35@sirena.org.uk>
 <3745487.e9J7NaK4W3@workhorse>
 <176962688200.4027.9869545980331892869@lazor>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/Ml7kgeSsfDfeG+D"
Content-Disposition: inline
In-Reply-To: <176962688200.4027.9869545980331892869@lazor>
X-Cookie: Save energy: be apathetic.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_085440_010516_F55A240D 
X-CRM114-Status: GOOD (  12.77  )
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


--/Ml7kgeSsfDfeG+D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 28, 2026 at 12:01:22PM -0700, Stephen Boyd wrote:

> BTW, I don't know what this patch is actually fixing, so I'm going to
> revert it. When it is resubmitted please describe the problem you're
> seeing.

The patch is still in -next today and the issues it causes are still
visible.

--/Ml7kgeSsfDfeG+D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmA1sgACgkQJNaLcl1U
h9CLcgf9EffwFr6JBb9N99fIsh3a56gSqW4r3a8ReNkp5RkHVfGkrLGXLY/JQlcA
lPrw0kTevGyqgvtyy9FVxO6qL4vSyMp/detgVS/sfQ5C1PpSBziZ9UbCg3icdnvL
/Wf5HqiF+tjB6iKlXZ/HjI2ZRqs81oZgPf5bXrMSKMcw61Xp9OTJkvZOd8jK/V+k
otYmjdIjM9+RCc3NFkhC/o7kNZu3iAuP4E1BnwjNbjkl4jKqhPF/vbP6uepW7r3L
0n9k8ZThsA6zw3nsC2nGR2vKqjlhqfHk9fZamyuDRLfmMtSy97Iesx4b3LxcbY/g
WFA/Shdt6/EseS46U+3RtkyEp/ncCQ==
=Y9/u
-----END PGP SIGNATURE-----

--/Ml7kgeSsfDfeG+D--

