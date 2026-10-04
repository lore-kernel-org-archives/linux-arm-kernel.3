Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E99CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 19:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fHpsQQE9UqZSe0QhSH0h9jwrnaiFKyY1RtBFt2yz6ic=; b=flKXdUoNM3sMuJsKySFvS0qArU
	zqETW6U0aRJyL4NbhgMC0t9lSFrSjvXf8eub0Au7nvk99Ny98mbs5kZy5OMaWqBPzCL1SAeT1mOOj
	jxCAL6tKHi4MoWz/YJzRnfexG2jwBHJ7MCUjRlm6LVCBdLLooSlDg/hx2BBcL83umWePxOTFSYvzr
	Awmzktg+kjHWBJVtFuI5PBcduUjvKgoE5Oo4GN+zR2xG6xwUy56JGsOBMo/32ghDveFgofsJ2jEc6
	/Bs/h3S4cUGt/NYUHEOmKiA6cAm4OFi1++cvWHg4dGpGaPeAYCBFjiv3K8O+SzbYrc3FIx7tztrZu
	SBka/Q5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDSDj-0000000FDgF-3IB5;
	Sun, 04 Oct 2026 19:50:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDSDh-0000000FDff-4B20;
	Sun, 04 Oct 2026 19:50:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BAD0560120;
	Sun,  4 Oct 2026 19:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2591F000FF;
	Sun,  4 Oct 2026 19:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791143398;
	bh=fHpsQQE9UqZSe0QhSH0h9jwrnaiFKyY1RtBFt2yz6ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GTYpig44CmD7J9NXSJw7/SMbL4VMMNy1Kuiwyuem7nGHuWilQPmQs3gdbb2cAvSnf
	 AAr36sjLMyEyYgjYzSZY8KDE6HSqGa9ON/z4OZ0OqWe7cRcV6EbSBWcfuTaGPMMzrm
	 S6hRKq9dBrLlHWQhigsLakpjfDJH80lxfym05GPY97ojB0DuHu0LGHnhD+Ht1fzPss
	 0rqZ1zytuqIVL3XeIh6v983CHqleeN6zYyXgiC8+6C1Xw8J1ZLhNrsVda2K5DtsIjU
	 CAnYDHg8ouApvJoC4UNFg1+hnktA8YXkjkIbu2aYmLdAw8zj1DP7XSv57BS7lnMLYI
	 neMDQ4BWUl9Mw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 3E52E15057AB; Sun, 04 Oct 2026 20:49:55 +0100 (BST)
Date: Sun, 4 Oct 2026 21:49:55 +0200
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/14] ASoC: mediatek: mt8195: Fix FE startup error
 handling
Message-ID: <asKt42FgsbhSbQUP@sirena.org.uk>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
 <20260925044908.450775-7-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zpsLVCv47P2G2sR/"
Content-Disposition: inline
In-Reply-To: <20260925044908.450775-7-phucduc.bui@gmail.com>
X-Cookie: Use the Force, Luke.
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


--zpsLVCv47P2G2sR/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 25, 2026 at 11:49:00AM +0700, phucduc.bui@gmail.com wrote:

> +	ret = snd_pcm_hw_constraint_step(runtime, 0,
> +					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
> +					 MT8195_MEMIF_BUFFER_BYTES_ALIGN);
> +	if (ret)
> +		goto err_fe_shutdow;

This will return 1 if a new constraint is installed which is not a
failure.

--zpsLVCv47P2G2sR/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrCrd4ACgkQJNaLcl1U
h9Cm2Af6A4vUdvyN1uEnYTiYxlbgJWEz7e8VfvjDWGTzpY+Wl1WIHmqvqpNtzg/v
zQ7LubxbjautsYjHrxroDG92AAcrpooqmg+Xn8wVbCvHcEolPxtKfs0DNdcHl3Fl
OaKCC49hoLS90R/ZjmzF73ir0qc4v+cj64qqdRcr+Qv72vamZJhalrvRXVulKQmy
2TSgnR+poBZ8mf7vg5xN26s7jFf1plURkdtTMa25dfib1BJhhvI3ZlG94imEAcmk
evboxK/bNhL46fp+doSCqOHlWCQOIj/Chv2wwSqgz9sSS8B7q3YC6HlMMYwtKhYO
H11o2NTntzyGzv7YONxUC+31iB3alg==
=GJcp
-----END PGP SIGNATURE-----

--zpsLVCv47P2G2sR/--

