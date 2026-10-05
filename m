Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651A0CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 08:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1W0d+UxyN6NyR02OWmZk3vrZ/qpuzcycxmpO18/UqA=; b=02dPf4Gzci2vjDIRwc3+mKeBBB
	z+qeVZNCXqIlgRs6Ppqzpb4XWgOnBrpokoG+WRAQJJSG0hrcVQL/yIS2k5q/pSDnJu7qByVD9LXgQ
	p+ex/vSZxIvebAOGShgtt8A8ernulP9bkXxEmHNS2VoXLLFL8inZ/p4xDM2JLv6YBmzga1IQtVozr
	SyFI20xJpFm8QcyqoDi52pc5wUq48NJ4ByKMmBnE5jik9q0XUuyNIarf52tN/dAV3J3SBMPGQkdgu
	aSMCsQc+WKorfmZaSi6EF0gWXJzRMBWteq2T7w/D6JulIJooUfDIyOCUL1WYFGyLs/TKvWiY/nQJt
	dhK662zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdml-0000000FqTV-1Tl8;
	Mon, 05 Oct 2026 08:10:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdmj-0000000FqTJ-2n2Y;
	Mon, 05 Oct 2026 08:10:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1FDB760230;
	Mon,  5 Oct 2026 08:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D901F00893;
	Mon,  5 Oct 2026 08:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791187856;
	bh=x1W0d+UxyN6NyR02OWmZk3vrZ/qpuzcycxmpO18/UqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CSpKwxqNWyx2EIT6SI+NsQM6C0H17sq5KiRmYKWdcHTFMmSIXRMGjLGgYB9w9QHeC
	 u/fcZoZLK6xiDItwlfhgKoni0AryDPcnheJlQYZVBu5l0AJ4+svgWwXCktAihFBMgc
	 AOT7si3UMiODyJsyxWE+Sb3K+62/hKhyARoWR1W/n52uqYkngdg9x/v5Cq0z5pKK4/
	 92ucD2to4qOUKzpoWu7ANL+moCoz/bLHpigdtw/mNwk2vGPhZQXrBYefHI05XMsnOK
	 4hVD9J1k8mv+7wsG02mocmj/FCpnjWN0eqAvSyX9dmVeY4bOEIloLAvJcZzGS+Y/2k
	 j90VzZDaX2SCA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 2F1AB1AC57CE; Mon, 05 Oct 2026 09:10:53 +0100 (BST)
Date: Mon, 5 Oct 2026 10:10:53 +0200
From: Mark Brown <broonie@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
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
Message-ID: <asNbjSrPYVbeqSae@sirena.co.uk>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
 <20260925044908.450775-7-phucduc.bui@gmail.com>
 <asKt42FgsbhSbQUP@sirena.org.uk>
 <CAABR9nFyEJBwXP=4SjuGNfGQJub2y_DPE87c6j6BPmqMBgjESA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sUcAnahCRvqeHeGI"
Content-Disposition: inline
In-Reply-To: <CAABR9nFyEJBwXP=4SjuGNfGQJub2y_DPE87c6j6BPmqMBgjESA@mail.gmail.com>
X-Cookie: You will forget that you ever knew me.
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


--sUcAnahCRvqeHeGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 05, 2026 at 02:12:38PM +0700, Bui Duc Phuc wrote:

> > This will return 1 if a new constraint is installed which is not a
> > failure.

> Do you mean snd_pcm_hw_constraint_integer() rather than
> snd_pcm_hw_constraint_step()?

Sorry, yes - Noticed it in the _fe_startup() that was called just
before as you say and didn't specifically check that function.

--sUcAnahCRvqeHeGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasNbjQAKCRAv73Ows9A4
iRNfAP4wqJV7pRyYOXXDTCy+JSwPo1kGj0jzlAZ1N4Sz4PZCegEAngA2eR4CykXu
huQWaGzmx7Q8fpn7SbSPhCVbfBI9WAI=
=F9Hz
-----END PGP SIGNATURE-----

--sUcAnahCRvqeHeGI--

