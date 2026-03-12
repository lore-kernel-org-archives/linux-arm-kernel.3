Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BC7106703B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 14:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6n4CvkDQwfZuGO8lkDKj+djG8yXoligbc/BFyaKYgM=; b=qGM9+gviwVrUE00puxM3tT2+hS
	yBTfa/KHZCLnlqCKT1VJ2XEtZ3l21hZ44eEMYcD7eJVBncy7AXvOZUZLR4AQ9M4INuzG7TzV4st3L
	hkS91mXVDDFLNbY8Yc+8zFMr8Ztp5uNMRWXErrEDHUkbJnoGzIUyeyrPngvnCX02Q8mIFkIe1hsGb
	h1TAFY8Xg+juZ3PWWby84LIcmW9t4KPEKJI/avgYcSPqo99PFLtIUsgz3MT2yfY01u2PcgkPEOmsF
	77djM27gtcR6AckGqHbGnytwIXpz7bKpanpqGcOKvBOkeO9jZ/AXhnIpvNR0r+f4sMOPL0yT2koPU
	9K48rOzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0h6C-0000000EDU5-15Wt;
	Thu, 12 Mar 2026 14:33:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0h69-0000000EDTV-3djd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 14:33:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2CEC9401FA;
	Thu, 12 Mar 2026 14:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3179C4CEF7;
	Thu, 12 Mar 2026 14:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773325993;
	bh=hAqiSIPHV6ZBtT4ry40ie+ToTsclopBhbBmC3I37NGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RcSOu1SnEJQJuIIa4HOnXsEmrDTtj2Eq/Y4YzU1yzmHbRx1bJL+NCNR6Tl7twkZkw
	 hh0ItLcS3/IYKU6IBAN/XGDH9fySq3ULcSBAcDegHRpIatPOWR97xugE49nDTs/9mv
	 uMvoHa0lUo9mFVyY76byD8zxQpBAlEElnQPpsmZMqTTH/453cCqpN7eJXHiA7qh6sb
	 pt3CbCSSosij9eVHRMG1pLnFJZTn8BjycpF4y6iBmnBSTtIAQr3NBvUHdkAftgpRtQ
	 MrJ/VgJd7DE6hJsy6Z26G2h389OmPQrjiutt9vdJy3gANgIMG6PLd8SvoCUk5+1DRT
	 xjluM+5aId5hw==
Date: Thu, 12 Mar 2026 14:33:05 +0000
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Frank Li <Frank.Li@nxp.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH v3 7/7] ASoC: tas2770: expose SDOUT bus keeper via
 set_tdm_idle
Message-ID: <6a3cc78a-77bc-473e-bfbf-caffbe8f25bb@sirena.org.uk>
References: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
 <20260301-tdm-idle-slots-v3-7-c6ac5351489a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IXXiSMaL5DxziIGM"
Content-Disposition: inline
In-Reply-To: <20260301-tdm-idle-slots-v3-7-c6ac5351489a@gmail.com>
X-Cookie: I feel better about world problems now!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_073313_954668_2FAC521E 
X-CRM114-Status: GOOD (  13.90  )
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


--IXXiSMaL5DxziIGM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 01, 2026 at 06:05:26PM +1000, James Calligeros wrote:

> +static int tas2770_set_dai_tdm_idle(struct snd_soc_dai *dai,
> +				    unsigned int tx_mask,
> +				    unsigned int rx_mask,
> +				    int tx_mode, int rx_mode)
> +{

> +	switch (tx_mode) {
> +	case SND_SOC_DAI_TDM_IDLE_PULLDOWN:
> +		ret = snd_soc_component_update_bits(component, TAS2770_DIN_PD,
> +						    TAS2770_DIN_PD_SDOUT,
> +						    TAS2770_DIN_PD_SDOUT);
> +		if (ret)
> +			return ret;
> +
> +		break;

This and all the other cases only updates the bits it's specifically
setting for the mode, so _ZERO and _HIZ don't update the pull and this
doesn't update the _KEEP/_FILL settings.  Not sure how often anyone is
going to change this at runtime though.

> +	case SND_SOC_DAI_TDM_IDLE_OFF:
> +		ret = snd_soc_component_update_bits(component, TAS2770_DIN_PD,
> +						    TAS2770_DIN_PD_SDOUT, 0);
> +		if (ret)
> +			return ret;
> +
> +		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
> +						    TAS2770_TDM_CFG_REG4_TX_KEEPER, 0);

Actually this does _KEEP but not _FILL.

--IXXiSMaL5DxziIGM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmyzqEACgkQJNaLcl1U
h9C9VQf/fZCHVpmQ9kpNtJbiGpHrvPe+rIlhBNyQU3d3Ae6pe9l6B5REJOofNuXd
93N4y6V0PdC8ua1LFqj7YsQXCNcvEFBXhRS+NY8K6+6QwqG4umZ1PwI8G7zMWw/i
kkboFELiFULhwmm1iTWox0SYqLnUTY0dwyTHnli0mTLApQA4fiaHYFFSp2uWl4WY
rbxnjqQbQtRVi08wPAUU/QoSAw42L72c3DZBhug+eWONv1u54O4G0ssZVc9SqWQ5
xAa9PzAWPRasGfrSzPuUHBh4AT29P1tI3Z+a1eRkiTL8e8zG9qW9E8iRTU3Cnfri
7ebNB/ybAN6A+DlJmlSnVXW1zzIaog==
=mZC6
-----END PGP SIGNATURE-----

--IXXiSMaL5DxziIGM--

