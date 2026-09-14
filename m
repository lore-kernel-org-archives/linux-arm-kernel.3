Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CE2C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 18:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9gXA1RkdX4vMZMFUGwaIE3uoUpXpiFuI92B74HJ7J0=; b=zCAHMYemJeE3PFlG2g2eYmFkfs
	pu6PtVlmkMMNskyXrufIbQXdOMzmwqcaGx9P8JoSrybAdF//bDFULnIktHcPzJysu6IJ+EaFREBK/
	JXnC+7nC8pFI+pyEhvUpVxjGxm2dIjZysgU0ZNonmU4NiIFnvmAZos5l/8UQacRH3envuIGrg3Yry
	2CsPW+4P6AhjJxJ3GVxKC+1uP0LCAjBCR/HbkPZRFvxtmeKFKcCb4TWK8N32V/x6F2+nCct3z3nTk
	mwlEnLV6c0F6q/1bFWqMoO6dHTaqmb8wUtXQQlj3WsqsklvLkWjJK/33Mpu7PI6E2+YRBQYbwVjEP
	2KJJPqQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Bgj-00000004TaN-3lIu;
	Mon, 14 Sep 2026 18:45:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Bgi-00000004TZx-0TBN;
	Mon, 14 Sep 2026 18:45:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6524A60142;
	Mon, 14 Sep 2026 18:45:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF77B1F000FF;
	Mon, 14 Sep 2026 18:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789411555;
	bh=i9gXA1RkdX4vMZMFUGwaIE3uoUpXpiFuI92B74HJ7J0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HqNwQCAvMKD+GtGTB1UVnO5oeUzfzRSCLeRIQ/NI/5YC/RG8r3BPF3gt7Th8nmezh
	 52/bjdtG4ljm5K2ylaznkBZ7klnQGPV+ZMsV/hFoADQuNk8YHaCYp+yofBFuAvnJZe
	 ElLgLdKytCXrZdC6yCKHeoDbIQEcWWTVds2fhZpJEDzuVQ1nK9Bp319qhycp1fdkeN
	 bWn/RODdLH2egWxUnfOaxYwKI40pI80/tPR6AkuP+W07vm6M08Yrox09wCd4bZYP7I
	 cwkWlicYtvLmI0ccrZstiC05EfQg4gETzi5+40U10PA4kJMGRZYxFhUBBcuRe7kVRF
	 h7NCB+gOQnemg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 4D626FDBA8E; Mon, 14 Sep 2026 19:45:41 +0100 (BST)
Date: Mon, 14 Sep 2026 19:45:41 +0100
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
Subject: Re: [PATCH v2 5/12] ASoC: cix-ipbloq: Use
 devm_of_reserved_mem_device_init()
Message-ID: <aqhA1bSbwBL3z5Ad@sirena.org.uk>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
 <20260902194712.2003414-6-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v9z/FgVXq66TVnlQ"
Content-Disposition: inline
In-Reply-To: <20260902194712.2003414-6-mukesh.ojha@oss.qualcomm.com>
X-Cookie: Orders subject to approval.
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


--v9z/FgVXq66TVnlQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2026 at 01:17:05AM +0530, Mukesh Ojha wrote:
> Use the devres-managed devm_of_reserved_mem_device_init() to ensure
> the reserved memory region is released on device removal, fixing a
> missing cleanup in the original code.
>=20
> Acked-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Gary Yang <gary.yang@cixtech.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  sound/hda/controllers/cix-ipbloq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.

--v9z/FgVXq66TVnlQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqoQNQACgkQJNaLcl1U
h9Cx3gf/aYLthuCMsMEQmoOqZmVaK7lkMZtutXAHSpVqlCF21WT8OUo8CHJUBOZO
CqqF3j8USYxrpXTArB7zXq7WjIcSTQLU8LUANUpbY6zzjnwSJqg7no6Q/C2LdLAw
6dCUZtYHRI5VmtEScEHPn+M3k+ny5NTAqKy9uwlQ+uthFreN5pEpmoFQiUmSQgik
M4mnRZQQA7yQpfBDt2pp69KONsBH91wD3R0wcj7oHOOV8ma+CYtWty1uEOGtStBC
5Vd9j6aOTBGU/3G/VzC8nl61V3K+bZX3AJZVBpGof1eV/sAxYW/MsT7wy0RZkAwM
Lnu7P4u43Mi56mCA9ewYHpNXBgl0zA==
=q00i
-----END PGP SIGNATURE-----

--v9z/FgVXq66TVnlQ--

