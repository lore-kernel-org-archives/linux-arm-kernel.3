Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6CBC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGZIHHTdUio4mkdGxDuE5j03JDM6UM0QavShcW0kz4s=; b=Qn5qI6CXlsnp7Ph379MNqlmOxB
	M4a1OyZokcmk1eULlL05Z+NExPw+hEigg9Hfal6WNlFWBDtXAE8j+CmCax4K1i/W6xyXtsbY6BR7E
	GDtcLNFSAG5OBKHw4WLllaOd52MVczCT9g/JxynyJ94xUnyOFEZLxX/gLioMrHi5Z8Rnf2HtWOZbX
	uAxTLmhbZh9ZFMyjCY9574DzsjJmEeu39GOOeFo00fz20GYAit9ZZ4i/MOr7wCN0g0S+B6EA0FtZC
	x1npVrKvqMSB0GQqAnzdVkMZJt8oRjYaxkKrxxydea9TT6+nMuUwm+JvQ3GK6jS/yFhagUoyL5uSC
	Hrav2hMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMpL-0000000AH60-3Enm;
	Wed, 11 Jun 2025 14:53:19 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJNQ-00000009igF-3qY0;
	Wed, 11 Jun 2025 11:12:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749640329; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QG5faVQFbIILrQTW0ZBXfFI76UtWGMdYguxmkoNxLeYGZxz5CYct0Yx9iNLeae3/tCHH2I4N5a6bsxQ4mRDVLOBAlg/IZNk4PeTxILhhlr/u2hG/nICo8JhnfZa73EWj3mgeWLCpQLOQfNBv142DEpwNxQBscR6Rpe0r8P8wW4Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749640329; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YGZIHHTdUio4mkdGxDuE5j03JDM6UM0QavShcW0kz4s=; 
	b=OJ4Q9V8NQwUR04DQtcMguwUsuXp0JconZeDK71kK+3VwSMwd78fbknjfvi5uSAH0v8UO8FZuG5s1UZhNPzRWtQW0erifIJEhOcYwZWf8q730GpGYjQmRQzJqSDy9nd7rmdw78CBZ0dJLkJpJbdwoeXBm4lY6rEYw6XENBFPJ09Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749640329;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=YGZIHHTdUio4mkdGxDuE5j03JDM6UM0QavShcW0kz4s=;
	b=bfUeNl7IIh2Pr0yrDjsQ+LpveA1vvUP5D3xOghqP6cidbjLzkL8vOt0OtQHTLlqM
	pFooA2LJg3iteB8yqobdy0VEnFFKR130gk7YxuCBNZpKqLUMOFYjvhPax9hnDm73bJv
	6OAMhPUge9VeaEgSM/kl1OC4xsXVfwjRAVNFLxSg=
Received: by mx.zohomail.com with SMTPS id 1749640327308121.2139749325595;
	Wed, 11 Jun 2025 04:12:07 -0700 (PDT)
Message-ID: <8e551fad9bd1627b9ed6f20be7d88bdc3438d482.camel@collabora.com>
Subject: Re: [PATCH v4 01/10] ASoC: mediatek: common: modify mtk afe
 platform driver for mt8196
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: "Darren.Ye" <darren.ye@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Date: Wed, 11 Jun 2025 13:12:01 +0200
In-Reply-To: <20250610092852.21986-2-darren.ye@mediatek.com>
References: <20250610092852.21986-1-darren.ye@mediatek.com>
	 <20250610092852.21986-2-darren.ye@mediatek.com>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_041217_015192_9C9F3559 
X-CRM114-Status: GOOD (  15.93  )
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

On Tue, 2025-06-10 at 17:27 +0800, Darren.Ye wrote:
> From: Darren Ye <darren.ye@mediatek.com>
>=20
> Mofify the pcm pointer interface to support 64-bit address access.
>=20
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
> =C2=A0.../mediatek/common/mtk-afe-platform-driver.c | 47 ++++++++++++----=
-
> --
> =C2=A0.../mediatek/common/mtk-afe-platform-driver.h |=C2=A0 2 +
> =C2=A02 files changed, 33 insertions(+), 16 deletions(-)
>=20
> diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> index 6b6330583941..a86594dca2b7 100644
> --- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> +++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> @@ -86,29 +86,44 @@ snd_pcm_uframes_t mtk_afe_pcm_pointer(struct
> snd_soc_component *component,
> =C2=A0	const struct mtk_base_memif_data *memif_data =3D memif->data;
> =C2=A0	struct regmap *regmap =3D afe->regmap;
> =C2=A0	struct device *dev =3D afe->dev;
> -	int reg_ofs_base =3D memif_data->reg_ofs_base;
> -	int reg_ofs_cur =3D memif_data->reg_ofs_cur;
> -	unsigned int hw_ptr =3D 0, hw_base =3D 0;
> -	int ret, pcm_ptr_bytes;
> -
> -	ret =3D regmap_read(regmap, reg_ofs_cur, &hw_ptr);
> -	if (ret || hw_ptr =3D=3D 0) {
> -		dev_err(dev, "%s hw_ptr err\n", __func__);
> -		pcm_ptr_bytes =3D 0;
> +	unsigned int hw_ptr_lower32 =3D 0, hw_ptr_upper32 =3D 0;
> +	unsigned int hw_base_lower32 =3D 0, hw_base_upper32 =3D 0;
> +	unsigned long long hw_ptr =3D 0, hw_base =3D 0;
> +	int ret;
> +	unsigned long long pcm_ptr_bytes =3D 0;
> +
> +	ret =3D regmap_read(regmap, memif_data->reg_ofs_cur,
> &hw_ptr_lower32);
> +	if (ret || hw_ptr_lower32 =3D=3D 0) {
> +		dev_err(dev, "%s hw_ptr_lower32 err\n", __func__);
> =C2=A0		goto POINTER_RETURN_FRAMES;
> =C2=A0	}
> =C2=A0
> -	ret =3D regmap_read(regmap, reg_ofs_base, &hw_base);
> -	if (ret || hw_base =3D=3D 0) {
> -		dev_err(dev, "%s hw_ptr err\n", __func__);
> -		pcm_ptr_bytes =3D 0;
> -		goto POINTER_RETURN_FRAMES;
> +	if (memif_data->reg_ofs_cur_msb) {
> +		ret =3D regmap_read(regmap, memif_data-
> >reg_ofs_cur_msb, &hw_ptr_upper32);
> +		if (ret) {
> +			dev_err(dev, "%s hw_ptr_upper32 err\n",
> __func__);
> +			goto POINTER_RETURN_FRAMES;
> +		}
> =C2=A0	}
> =C2=A0
> -	pcm_ptr_bytes =3D hw_ptr - hw_base;
> +	ret =3D regmap_read(regmap, memif_data->reg_ofs_base,
> &hw_base_lower32);
> +	if (ret || hw_base_lower32 =3D=3D 0) {
> +		dev_err(dev, "%s hw_base_lower32 err\n", __func__);
> +		goto POINTER_RETURN_FRAMES;
> +	}
> +	if (memif_data->reg_ofs_base_msb) {
> +		ret =3D regmap_read(regmap, memif_data-
> >reg_ofs_base_msb, &hw_base_upper32);
> +		if (ret) {
> +			dev_err(dev, "%s hw_base_upper32 err\n",
> __func__);
> +			goto POINTER_RETURN_FRAMES;
> +		}
> +	}
> +	hw_ptr =3D ((unsigned long long)hw_ptr_upper32 << 32) +
> hw_ptr_lower32;
> +	hw_base =3D ((unsigned long long)hw_base_upper32 << 32) +
> hw_base_lower32;
> =C2=A0
> =C2=A0POINTER_RETURN_FRAMES:
> -	return bytes_to_frames(substream->runtime, pcm_ptr_bytes);
> +	pcm_ptr_bytes =3D MTK_WORD_SIZE_ALIGN(hw_ptr - hw_base);
> +	return bytes_to_frames(substream->runtime,
> (ssize_t)pcm_ptr_bytes);
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(mtk_afe_pcm_pointer);
> =C2=A0
> diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.h
> b/sound/soc/mediatek/common/mtk-afe-platform-driver.h
> index fcc923b88f12..9809e60db511 100644
> --- a/sound/soc/mediatek/common/mtk-afe-platform-driver.h
> +++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.h
> @@ -12,6 +12,8 @@
> =C2=A0#define AFE_PCM_NAME "mtk-afe-pcm"
> =C2=A0extern const struct snd_soc_component_driver mtk_afe_pcm_platform;
> =C2=A0
> +#define MTK_WORD_SIZE_ALIGN(x) ((x) & (0xfffffffff0))
> +
> =C2=A0struct mtk_base_afe;
> =C2=A0struct snd_pcm;
> =C2=A0struct snd_soc_component;

Tested-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> # on
Mediatek Genio 510 EVK and Genio 1200 EVK

