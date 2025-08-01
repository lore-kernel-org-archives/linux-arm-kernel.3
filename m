Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66800C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 12:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GM7VspiuNJbWJfvQBErQDCx2bV8UH8sNG4aEdut/aes=; b=VBwJU2GB8aXJaEOOCpOv0NXEuV
	KJenYB+rDx+FA5gYWGZm7ZyLxXsZ7moc1RtWKOhCCrupMXhNFiW7g2uLsIOQUOOvf8BlO3rOzwMyo
	r1A1B6cdECCAG7QR/REBNNfCaXzOuJGOeM86YzxKa2xSuJH4T68ibheXXXEPqVs66kTjCod6Bm5ad
	YSipWPUm9Qbqf/mFbnYAmrAgnEpKMoM0wKijNUw6IjfR4bYHqd2NGq5dENF+S+ITVhZClvDHY1QUB
	3bAEw0I3OTJ4iQORkio13TKNwzKv1gj2wqVUu/inXDKuqzhOjzksh5C+I19w+HbjseblZmnrlelqw
	TT+OHL+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhowN-00000005xaw-1aRH;
	Fri, 01 Aug 2025 12:32:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhoW2-00000005fKf-09YN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 12:05:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C9284457F1;
	Fri,  1 Aug 2025 12:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF6DC4CEE7;
	Fri,  1 Aug 2025 12:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754049935;
	bh=GM7VspiuNJbWJfvQBErQDCx2bV8UH8sNG4aEdut/aes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LX2QbAFzWP4riFP/JJv51l2FyaX9fyPK28wMVGHcCfFKEtSFKVpZ0FgtSPOucSLlo
	 6F9mQvqm5SbUGEKvWIVf7NTkzhFFSQF2fpERwB3xIoq9+aJoX6tV0y0j2re+htZDca
	 4TQ/su42Nre4xrONdEbvGAZiJlHIUeul9jjsER/2v6tU+kfhy9CnqhrYZlssjmWglo
	 MCc+SQaTDvuVBDckvzUSTZz6AVRbpgDqBqAYpi/Vb85APyR5ixD4tqWKZ9AfeD/m7l
	 I7xHyotIH7HMM4PjyI7zDUo1D42nSzZfZ9OX1u3wkM/BCIfYQv1wRpF60Ua25tRbcc
	 Dg3O4I4BmkLTQ==
Date: Fri, 1 Aug 2025 13:05:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Joris Verhaegen <verhaegen@google.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, kernel-team@android.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, linux-arm-msm@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	Miller Liang <millerliang@google.com>
Subject: Re: [PATCH v4 1/3] ALSA: compress_offload: Add 64-bit safe timestamp
 infrastructure
Message-ID: <13ad9530-8e9a-4955-8844-aaf49146e988@sirena.org.uk>
References: <20250801092720.1845282-1-verhaegen@google.com>
 <20250801092720.1845282-2-verhaegen@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3hce4ALIJPGSBrPW"
Content-Disposition: inline
In-Reply-To: <20250801092720.1845282-2-verhaegen@google.com>
X-Cookie: Who messed with my anti-paranoia shot?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_050538_100556_7F544A58 
X-CRM114-Status: GOOD (  10.41  )
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


--3hce4ALIJPGSBrPW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 01, 2025 at 10:27:14AM +0100, Joris Verhaegen wrote:
> The copied_total field in struct snd_compr_tstamp is a 32-bit
> value that can overflow on long-running high-bitrate streams,
> leading to incorrect calculations for buffer availablility.

Acked-by: Mark Brown <broonie@kernel.org>

--3hce4ALIJPGSBrPW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiMrYcACgkQJNaLcl1U
h9AdmAf+IBbNJ4JZ0K2alkJmSZ4ClSpvLsc0OJHhkr8kbAMrBOyFn67A/Hw95kxf
x3856yC73oTlON1VWQ1DCxThT1ubwy4iK9vnC8dmfKo7ZgkUVdY8dfcoVG7QPeab
ZySf3lBoPZ/S2gVGj6xJATKtWPD4llhjHtICjjKT9zhVCSZgHaY9W048zBrnEw00
vLxTiYQrYcDgygYjmfRkOBZw6z4n6C4jaesRnMUJfx5uUrb1kwDnPTsS+aIEA1MZ
uKirsvNKBuPvnxBbadHLFnuJfWHLBcKjGH5WkO8F5DFYMzW1UgzUpZJEhK0IZyMc
lP89DWksuDpwBsl8JcYJ4mW+VgxX0Q==
=8Yki
-----END PGP SIGNATURE-----

--3hce4ALIJPGSBrPW--

