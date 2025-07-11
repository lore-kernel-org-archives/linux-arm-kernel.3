Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E447C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 09:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ksn587LwQGnOVtjPmSeGM14Xwc66lrZWBn8JfHWAj9I=; b=sDrVddHNlD+l/xXuYyQyh0uCaN
	I4VMDIjkB21wT1/NEv5EOGG1EzMykMmBbTXEIBE56qMrCPBZbQXSHYVRL12+nArwA24jr80iYMAFZ
	KaZiZ5p8/cyWavew1S51exd2SU8H1gvSZtUtDTOZLhHfZkGtnejNksvGnzAJdgpBXLBcQqyvePYi1
	ZyxYx+JEDR4rM0ac6y/hnimAXDRPtfext/e1MuJEI1uGa9ULvxVu7pgumifqz8mzIvxeJ2wy1dKbK
	bX4a75CD3IQrMjC70dcxj31bfxRgt0dDosS0WK6x2XqssHLKRM3pIbjlt9xRVTVmHXw4hg66L+H/l
	mwG5A4DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAOo-0000000ENRM-2kwT;
	Fri, 11 Jul 2025 09:50:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9LK-0000000EC6s-1a75
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 08:42:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 829775C62A9;
	Fri, 11 Jul 2025 08:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57547C4CEED;
	Fri, 11 Jul 2025 08:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752223373;
	bh=Ksn587LwQGnOVtjPmSeGM14Xwc66lrZWBn8JfHWAj9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KPDJ634INOzYR5WVlOFN6hgNAUb2r3fN1dKrdghH7OOwASHtsPjVgU3/sZ3oz4r+v
	 4/dQB2yxCTnvhuAK32QPrvKu7GixkBHTZzTUgkJPZ2RzqINnAdLEu8GHL+DWoCd5Yx
	 qiRbnAOx08Od9VmKi2qwypohZ+m5aNosps+826CXxnaybcMvbn3Bh0gTi/Fy3NapVU
	 jRdE7UWULkn+c8UtMDoa/1fqAdZd9gOD8oyd0SRG7Ys+1u9oCgmMvEAJzOKGi15lG+
	 rk8rIQUOizEocjrWlhfTdeO82Wy04bzlToCNxOP1Qi6SSQyGB/wX5ds1IDlrGbsuy8
	 BbkHhIMAt4sJw==
Date: Fri, 11 Jul 2025 09:42:48 +0100
From: Mark Brown <broonie@kernel.org>
To: George Verhaegen <verhaegen@google.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
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
	linux-arm-kernel@lists.infradead.org, David Li <dvdli@google.com>,
	Miller Liang <millerliang@google.com>
Subject: Re: [PATCH v1 4/4] ASoC: codecs: Implement 64-bit pointer operation
Message-ID: <aHDOiIPriOa65BL-@finisterre.sirena.org.uk>
References: <20250711082441.4193295-1-verhaegen@google.com>
 <20250711082441.4193295-5-verhaegen@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R6veuuaDGFY/uZCc"
Content-Disposition: inline
In-Reply-To: <20250711082441.4193295-5-verhaegen@google.com>
X-Cookie: Do not cut switchbacks.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_014254_498053_2DD68A75 
X-CRM114-Status: GOOD (  10.15  )
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


--R6veuuaDGFY/uZCc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 09:24:36AM +0100, George Verhaegen wrote:
> From: Joris Verhaegen <verhaegen@google.com>
>=20
> Signed-off-by: Joris Verhaegen <verhaegen@google.com>
> Tested-by: Joris Verhaegen <verhaegen@google.com>
> Reviewed-by: David Li <dvdli@google.com>
> Reviewed-by: Miller Liang <millerliang@google.com>
> ---

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

(I suspect you've actually written your name in a different forms in
your git config and mail client but it's not adequately obvious.)

--R6veuuaDGFY/uZCc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhwzocACgkQJNaLcl1U
h9D8TQf/TfiZ5LH0t2t/gOySQJEWcgmIAuNt3zfQsrVDV8A5qqKogbPV75loZN6m
Eyvcog4WCIoJ4w+VNEL8E439Uk73Z25kCbdPYWnwQhZSFgE8ZpR7HD/LSbKFhc6d
emjLxS+zGnk6t/sl32u6/gLpr/aONk7oYV5e5vhxFuIsyfhttyBSFLWBANDkfegR
NTakl5zHb8GwXTdioJciuBnfyk2A+VHk+jdE9Wd13fi8Mpq6OB08OufGE9SFbMx7
hbdO7t82aZcBIILzKP+op7T62kV1SOOboIT7yomeLLUQMHkxA3s4eQ3oEy10o24L
tSUYZbnJm2Gx7zFMZZfCaR6Jik9plg==
=v/M6
-----END PGP SIGNATURE-----

--R6veuuaDGFY/uZCc--

