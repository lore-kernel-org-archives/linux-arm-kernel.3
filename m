Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F8AC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 17:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39FDW1iBleAYEn7xhDFenbNL76Y5Vr3j48V/WMdQHms=; b=B0pvgkLT7MMZJJ9JabfdAI0gAF
	KOBaBbaLEH+5aSzRes5UmZBSqFio6hQVCitExjGfFqNJ5PZhk/F9y9czDwoMkl8l5WAoq26OPycWW
	FTeOXrxrkz3tziuaS6dq9HO8WK7bnB3MI/eASWoPjouFb2SBVD1+fBYzRyC7/vwoyS65YYWdJKVqD
	y41c3RJIsOcSbEn9RFyHneGFv2JCd8lGdAC5CB+kCyLVHEAj+f7Bjlynq35gM2d/+fGb+X+c0m0AD
	hbz7WpU0vkL3sRp1lygYrh5NYW8YU4kpJiD0prqjSA2jKsev4T/zCW2S5NDuG6yzmSwaAHE0u3pqm
	22zxeHwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6X4O-00000007bVH-46Rr;
	Tue, 15 Sep 2026 17:35:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6X4N-00000007bV5-3H0C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 17:35:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E77FD600CB;
	Tue, 15 Sep 2026 17:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3EB11F000FF;
	Tue, 15 Sep 2026 17:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789493746;
	bh=39FDW1iBleAYEn7xhDFenbNL76Y5Vr3j48V/WMdQHms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pgaj2bP5DrqGvx/3WqSGLRb/PQIcCCAc7m4hinrbcCyI2uUaLsCYHyY20o0qiWe9E
	 3RHqreO0iOHfl4AZoje9x9PeFfbrmV0KeHC5JKTvLEwtj4Lg5me7bz+rBmF6BtRhSy
	 AY9N7DIXo+XAZrcm7WgGeeLwC6EshU9/ROmHHy7QnE1Z7Gj9LyqSY5ptG89X1ynQpO
	 wjnAtxFFUXRLjFNTRcc5KFPCFDZFUFM8xN9GsK9CTgoi6PIwPgyjRS3SvqKAnoilEZ
	 YTY18zhIQwLsgIFNwpHPj3dWyNhJDY9/BroRpgJEmcXu9n2SAUZkZJ/3P8j1Zk14rh
	 lOg+hT20tfAkw==
Date: Tue, 15 Sep 2026 18:35:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Tianchu Chen <flynnnchen@tencent.com>, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH v1 2/7] ASoC: sprd: Replace dma_request_slave_channel()
 by dma_request_chan()
Message-ID: <444f1340-f690-440d-85e7-4fa7d66644d5@sirena.org.uk>
References: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
 <20260915100931.3593242-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Eev+jrxCI2X+PyJ/"
Content-Disposition: inline
In-Reply-To: <20260915100931.3593242-3-andriy.shevchenko@linux.intel.com>
X-Cookie: Void where prohibited by law.
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


--Eev+jrxCI2X+PyJ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 12:04:23PM +0200, Andy Shevchenko wrote:
> Replace dma_request_slave_channel() by dma_request_chan() as suggested
> since the former is deprecated.

> @@ -171,13 +171,12 @@ static int sprd_pcm_request_dma_channel(struct snd_=
soc_component *component,
>  	for (i =3D 0; i < channels; i++) {
>  		struct sprd_pcm_dma_data *data =3D &dma_private->data[i];
> =20
> -		data->chan =3D dma_request_slave_channel(dev,
> -						       dma_params->chan_name[i]);
> -		if (!data->chan) {
> +		data->chan =3D dma_request_chan(dev, dma_params->chan_name[i]);
> +		if (IS_ERR(data->chan)) {
>  			dev_err(dev, "failed to request dma channel:%s\n",
>  				dma_params->chan_name[i]);
>  			sprd_pcm_release_dma_channel(substream);
> -			return -ENODEV;
> +			return PTR_ERR(data->chan);

sprd_pcm_release_dma_channel() does:

                if (data->chan) {
                        dma_release_channel(data->chan);
                        data->chan =3D NULL;

so this won't DTRT with propagating the return code.

--Eev+jrxCI2X+PyJ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqpgekACgkQJNaLcl1U
h9Dv6wf8DIt782FfFomog7Ok5wncm/S0jGMUale3g0wtB7TmjZWZulho4w/W+9Op
NQdoSarIoFdY4G5RQQaXN9YY/+b3euC8guuyXq2oU9Qzl25W2xTey7eh/bLshP0D
RC7HQG5RWrDTvJYpyglVFP7TWTTVXtoP7c+2ZMjTps1+Ou6UvJvt/XYuFtS74beB
ol+eLO6z606nI9p3R2rCyMrZhDQUUzAe90WEtBgyAaN/obA4Wi6K0/itsLBIn0xu
9AFytXi9/IsoSIZ+BmgOkN29ZdtHW9dTM6Lo0w2d4YC718HywHRkqRPDcLagd8qc
Wgz7Rz3kFsOpWXRBzsrpPBjNQUUafg==
=1aFq
-----END PGP SIGNATURE-----

--Eev+jrxCI2X+PyJ/--

