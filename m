Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1F4F5A8AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 18:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZnX9yztV0/MnLxV1PqQMKtkhGKJfRB3mxac7Alud1bo=; b=eXq/ya/cRp0gctNJJp0RYKbgbo
	/Ao6Nl/pJ51xFemBwevguSsCpzRddD2M+6GMFm9S3/1vW6xkkfbuC48jrm0s+nMH00fdydiZAIHmR
	yPixPmHNQn6e9l0P8+9NP7E8UEEv7EFHcjPv89tWjL2W2gPE+uwdPs1I1h6H4bFY8swpzGmHYr8Oi
	gIiQk8vSAQWG+HWPuAGnCOqJm5ea9Rg9cJXaOyi+slhADwfIoJc4nh0rwABcwnVbUgaB1B39llKzi
	DD8+rWd0kTQWk/mRAOV6I/Qis/12ejwjkmzdQ+B34wGKNsxwGniRuMH32TupaoJmNy4rn5LZXdx06
	BPKtynbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEt2Y-00000007X8Y-35zs;
	Mon, 20 Apr 2026 18:08:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEt2X-00000007X8O-1Tfm;
	Mon, 20 Apr 2026 18:08:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 56FA16014B;
	Mon, 20 Apr 2026 18:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E4DC19425;
	Mon, 20 Apr 2026 18:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776708488;
	bh=2nn2NZ44rKzXTLFfO38sfqAzBiN9AedaozeHdtaU54g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FyIKIOxyioDE++KLwaVnbPeHrDrLexB22rwK6SGAQ5+svxGh6xCEWnSuCtrLgrI3o
	 I0xryMzw5Q+H9iROtrAXoIP0ghhDTOKGHhdE+Y9Dp5iKXvAauFFfm8h2U2w9yajV5n
	 pJv4LnGScHctv3C9pjfmv4TTbIgw7uQQIfFMRwKAae1fNFG1thDAsG0CxOkNBj9mU8
	 Gf2iJwf4KsT9+UZFudBGgqKqv6blKswZAhZpJfaKGSpAj0A435G3msSKoS809xz2ME
	 /LbGMYLGtfzR25umFZ/kvzsKIWmQ7R20mq1+HHFY7m0jz1OOEZf+e8W1iMyXPAbDG3
	 8pvgYSo9Oj1EA==
Date: Mon, 20 Apr 2026 19:08:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>, Cyril Chao <Cyril.Chao@mediatek.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 5/9] ASoC: mediatek: mt2701: add HDMI audio memif, FE
 and BE DAIs
Message-ID: <95e1067c-3c8e-4dd4-997d-f3be9d2cba29@sirena.org.uk>
References: <cover.1776646435.git.daniel@makrotopia.org>
 <59f911bb1a855a00c0d9dd4760f10ff0030fedb6.1776646435.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jvJgKormJ2TC3jlE"
Content-Disposition: inline
In-Reply-To: <59f911bb1a855a00c0d9dd4760f10ff0030fedb6.1776646435.git.daniel@makrotopia.org>
X-Cookie: Sales tax applies.
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


--jvJgKormJ2TC3jlE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 20, 2026 at 02:13:34AM +0100, Daniel Golle wrote:

> +static int mt2701_afe_hdmi_trigger(struct snd_pcm_substream *substream, int cmd,
> +				   struct snd_soc_dai *dai)
> +{
> +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +		/* Ungate HDMI and SPDIF power islands. */
> +		regmap_update_bits(afe->regmap, AUDIO_TOP_CON0,
> +				   AUDIO_TOP_CON0_PDN_HDMI_CK |
> +				   AUDIO_TOP_CON0_PDN_SPDIF_CK, 0);

It looks like we have clock API clocks for HDMI and S/PDIF on this SoC
(see clk-mt2701-aud.c) - are there going to be problem with peering
directly at the register?  We do manage some clocks via the clock API
but not those ones.

--jvJgKormJ2TC3jlE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnma4EACgkQJNaLcl1U
h9ACNQf/THgMc0UA4YHXPSQgC7xwdqabDnTemhp2DF0amZkEYC6jkp4hf2k0DLml
G+j2VcumFyYOggfzi7ELJxb+xR+3iVYFg/a5whf4X6Qm9GOVhq5uHrYEXEhtIbZf
+eJsmSTKFe2idDmfZxo4gijNVhupkVCA7AE2TRRDlcebh5P2VLKT1W5WNuk4mdeS
9anRlfsFCvMJlYI4eyYNmKJ5eQ/zXDL7IAf9mhJG/9xbWjvut904xCN+tfmW4Jht
LlNBdQ58oUYy+ytzen7omr8nZTOfvIrvv+new7BLXiRWW2nsiK5ciLZ1nke9TgPi
eonLfX98fitWZyJrd0ZJpE3qWnsgeA==
=f+8p
-----END PGP SIGNATURE-----

--jvJgKormJ2TC3jlE--

