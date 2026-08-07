Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FBDC5AD05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 22:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a08ege2A6PubBI8+f0PrNyavH3OH8v6KWoV1np/vCzI=; b=LWAk6CBvOAMxAoQa0pJ08K2lkn
	b9mq56x9LZEfJYWGUfiWyW1BK+w3P6N7zxEV5C/J0IdVppyPEQZxZe9GbxDwl//Kz+u+OpYBYVU7/
	G0PNbArBL0XQ8IhuUCwBw+Ae+dPXvDqA1ERNvjIsHBDx/fQV+ZEikN4hpdz+9yeauxj3aObGq5/+Y
	iizVeCo6DoOywdOJDIVFmM0YkB9xvf26222BbfZ78cjOenxFleN5AOR1+VVUitlxRQJcivD3Fv3ts
	RnlTiW+XqDUxvnmjiiF2q4Yf9TDBfk5dZ/EPE+vZa+dELeXug2RzPO5vGZQsTEFub//4De6CQ/biN
	bB2NORJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsTR7-00000008pmw-1FNF;
	Fri, 07 Aug 2026 22:53:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsTR5-00000008pmm-07U9;
	Fri, 07 Aug 2026 22:53:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5367843DFA;
	Fri,  7 Aug 2026 22:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061471F000E9;
	Fri,  7 Aug 2026 22:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786143186;
	bh=a08ege2A6PubBI8+f0PrNyavH3OH8v6KWoV1np/vCzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VEjeYbm0F0jk6hgaUvD7udZN9KLlRTlcmx6WiHpm78T8ZNvzuDgjhP1HjvQw2pyGf
	 PbSJ24h9+tiX8tXdbaGCj5Jhw41++NsRISoVaEmhvd6b1GaqfiuP1Nu3o1tHuy//qj
	 hiJrSNL/Jyc82J76wQCQBESN0X26C0RNcycsUeRbRyyEKWqWHXuNi4sYVEU+aQyx6I
	 LZqeAGLuSw4mdbB0Ioa+26PULe/cZvpd7puAWSKXph5Ar2ZmZRxgJfk2cNXwisqhQx
	 Z3U3Fuz/avDeDQnKJt4GxvwqkIBiob59bGfAhndOg9LkkaP6Jasb4iiHQajvbce9ES
	 iquwEFePYuFJg==
Date: Fri, 7 Aug 2026 23:52:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	bui duc phuc <phucduc.bui@gmail.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 4/4] ASoC: airoha: Add AFE and machine driver for
 Airoha AN7581
Message-ID: <8146f434-1e16-4ebd-80a4-b9c27bfa45af@sirena.org.uk>
References: <20260807200936.201827-1-ansuelsmth@gmail.com>
 <20260807200936.201827-5-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L/1rhFeghNUEqwsR"
Content-Disposition: inline
In-Reply-To: <20260807200936.201827-5-ansuelsmth@gmail.com>
X-Cookie: 1 + 1 = 3, for large values of 1.
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


--L/1rhFeghNUEqwsR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 07, 2026 at 10:09:34PM +0200, Christian Marangi wrote:
> Add support for the Sound system present on Airoha AN7581 SoC. This is
> based on the mediatek AFE drivers.

> Also add the machine driver to create an actual sound card for the AFE.

This should be more patches, the machine driver should be a separate
patch at a minimum.  Possibly PCM and ETDM drivers too.

> +static int an7581_afe_pcm_dev_probe(struct platform_device *pdev)
> +{
> +	struct an7581_afe_private *afe_priv;
> +	struct reset_control *reset;
> +	struct mtk_base_afe *afe;
> +	struct device *dev;
> +	int i, irq_id, ret;
> +	void *base;
> +
> +	afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
> +	if (!afe)
> +		return -ENOMEM;

We allocate afe here with devm_kzalloc() so everything is zero...

> +	afe->irqs = devm_kcalloc(dev, afe->irqs_size, sizeof(*afe->irqs),
> +				 GFP_KERNEL);
> +	if (!afe->irqs)
> +		return -ENOMEM;

...then we allocate an array using a size read from the struct which must
therefore have zero elements.  We also didn't assign dev, either we
should assign it and use it consistently or we should drop it and use
&pdev->dev like the first allocation.

> +	/* register component */
> +	ret = devm_snd_soc_register_component(&pdev->dev,
> +					      &mtk_afe_pcm_platform,
> +					      NULL, 0);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Cannot register AFE component\n");
> +
> +	ret = devm_snd_soc_register_component(afe->dev,
> +					      &an7581_afe_pcm_dai_component,
> +					      afe->dai_drivers,
> +					      afe->num_dai_drivers);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Cannot register PCM DAI component\n");
> +
> +	platform_set_drvdata(pdev, afe);

The component registration might result in a card being instantiated so
we need the driver data initialized before we try to register.

--L/1rhFeghNUEqwsR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp2YcoACgkQJNaLcl1U
h9ARiwf+LpDqvrfwUmAxX0QX50R8ii4KPIXyv5I0qvKJZcQ4j3ofe+outq7w/7zh
nJsC2gzVvtmzP7LOx3TdiR4pj1w2uRSI9ymg2rKoU05VzD3CEIjNtm/YIqPbd8cR
T4WQlImD5NQ9K7U0NgP1N+y7uX8r0QMikrRUMiw6k/D8CzaSsmZ6fCL8RQq0ge6O
oUJqMGcsdRn5x4ppuwy4y8FIn/Z73xEoAHWTQrf6jtLPBM8f++3t66ULaDKhwf+L
+uflmWRcVPBtXHGwQaqYImTilXTk6wYVmMqj7OBEuLnKiHyYN5bA4Lm53gbqUBE4
9Utlm+txNJsPR3uhLbGfxdFrZ3+lQw==
=/wv4
-----END PGP SIGNATURE-----

--L/1rhFeghNUEqwsR--

