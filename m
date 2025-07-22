Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2FDC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 07:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1N+wgj9qJtb+bRk0/YzXSA+bhNFySP+cY66IIckDgM=; b=fav9v72WiU4DA4jm6+CpuSMtUy
	cscU1J6j5wXDyfb95Gu0l1lqAvspAHTCMMBKl4h5FGziv6AiqMgteKCDcyRnCiZIoH9c24hRZXLeu
	+52b4Qg/AW+D5MGM6SDU2/kMbpIDLRfBTlZ4kShwZDnHS623IhjFPssiPpS1yQLV7vSqmRPyMoHCK
	daS83Kl+2+Vg+yjkQAoAI19BZIRbISljnol3z+UJN2NZyOhvf1LhhLRaRnAsBAyuKLYimf1KSsxxP
	PsIJbNzMdt0X2y51Jwnhe06KUPXkEudcn1iYOkT+DQITg4fq0icp7VnDuwQa1VigsUhqwWFtetCPJ
	kF49glUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7ea-00000001iJE-3mWz;
	Tue, 22 Jul 2025 07:43:12 +0000
Received: from mail-lj1-f169.google.com ([209.85.208.169])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7Zq-00000001hK7-33lV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 07:38:19 +0000
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32b4876dfecso54682791fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 00:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753169897; x=1753774697; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1N+wgj9qJtb+bRk0/YzXSA+bhNFySP+cY66IIckDgM=;
        b=KAomp+UmzsqjK9yOKliV9aJWnbWRIHRbRk+/iG2e2GC7C3+cjPaTomY1/GgsmSX0YN
         sksof9v6HmcnI3HozqnniqpoIHTiNks6zjYanqQVTIH7gbZBFi8vVxn5jsu5NdQWDb8q
         iqEU4lTxFKbLAGZUXfmKBE/S5otSwKYngq2rA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753169897; x=1753774697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1N+wgj9qJtb+bRk0/YzXSA+bhNFySP+cY66IIckDgM=;
        b=WmSQYXai54WUSuZPYSRGfcJT0lQikvnldOJAjDPLZtx+8um4VreFXOcgF+36H3u0sB
         KAQdCGUw+nrieR0N30y8pK9TrUhCxEwjcp6Zwtv5DJ5LMAOiuFeN216IxgcFT/f91F1z
         Ie/HXiETfj6FtmoTK8g9GScYlCvPLWS8O3XAXmIFIpA1z9dSjLRvBnlFGs4Fa8ORaQjF
         4uyZ73rsAq/ftS43LJodtjssVYWDUpHtd+f5gm0rAFIBx1kipkwEt22fXGTXMlOVXgal
         srx8Shc7n+AnWzbYT9xs9hABgRWSfgf0VagOJdf5CajMZIS6k8zI8ILXdkumaOkxKGc+
         kkUw==
X-Forwarded-Encrypted: i=1; AJvYcCWOvdz8/FcROxGgBEtCYIKw4mLPu4qCMJNXzbLYKUzkGeksa54yGqoMIFfqjRu84CAv6Zt47dn+7cWtY7UW6gkY@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr9a365NgtEbW8ACqnIxWqnBm0oyFB+nV9GlIqfSQF+HzEjhBa
	jtYG3colXi6N+zEjQdXFE287ndQE4VfDjswYtzxihulwT8MpIfIMMJAb/GpTues/FHFyw7ZZvPb
	PJRJ3O3Tx+OOE0nH5rt6dr19m7WP6wK0gCSnzuhpA
X-Gm-Gg: ASbGncvcyK57vqby5gSrmZf1F1Q37eIMbrmveBKsqoKdVp0pDtKRgh9Y4Snsf6OoFFO
	N/GeK0s4N0kHe0JVtf0BdHpR4lZKPlXeP+hoHiZlN9fppfcdmJvd1JBwR4doz1Xcw7PYOH/PUjR
	kL16TqnnXP/AG6BMpcMmit63rGXncAdr8+6R6Z3u5jFGPqFAJI/ArcOqQzxh5qp3LuU31tAEOB0
	ASeQDo77LoMuuaSpBxn7F6tPQHfGDGPfsM=
X-Google-Smtp-Source: AGHT+IHIEXGhSQKNLTR3joj0qjwcB1T77Dp8iSOMV7/+3N11OuF7i8eFvD4xY1tQQW+z6w+ni2WlHZTcDNTAtH00llM=
X-Received: by 2002:a2e:b8d1:0:b0:32a:e7b9:1dc9 with SMTP id
 38308e7fff4ca-330d24f7ef4mr6438751fa.3.1753169896490; Tue, 22 Jul 2025
 00:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250708111806.3992-1-darren.ye@mediatek.com> <20250708111806.3992-2-darren.ye@mediatek.com>
In-Reply-To: <20250708111806.3992-2-darren.ye@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 22 Jul 2025 15:38:05 +0800
X-Gm-Features: Ac12FXx-ybyxFVMO-dZm2uMvhIKao-9eybKP9nlbQtMW_02h967WNikXB-wqqjk
Message-ID: <CAGXv+5HQcGiUnsaOxHz86Y8JxUHh6e0ypusFEBLKchNx3fqKBA@mail.gmail.com>
Subject: Re: [PATCH v6 01/10] ASoC: mediatek: common: modify mtk afe platform
 driver for mt8196
To: "Darren.Ye" <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_003818_801363_0244054E 
X-CRM114-Status: GOOD (  24.49  )
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

Hi,

On Tue, Jul 8, 2025 at 7:33=E2=80=AFPM Darren.Ye <darren.ye@mediatek.com> w=
rote:
>
> From: Darren Ye <darren.ye@mediatek.com>
>
> Mofify the pcm pointer interface to support 64-bit address access.

  ^ Modify

And the subject should say the same, or shorter:

    Support 64-bit addresses in PCM pointer callback

> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Tested-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  .../mediatek/common/mtk-afe-platform-driver.c | 47 ++++++++++++-------
>  .../mediatek/common/mtk-afe-platform-driver.h |  2 +
>  2 files changed, 33 insertions(+), 16 deletions(-)
>
> diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/=
soc/mediatek/common/mtk-afe-platform-driver.c
> index 70fd05d5ff48..cab4ef035199 100644
> --- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> +++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
> @@ -86,29 +86,44 @@ snd_pcm_uframes_t mtk_afe_pcm_pointer(struct snd_soc_=
component *component,
>         const struct mtk_base_memif_data *memif_data =3D memif->data;
>         struct regmap *regmap =3D afe->regmap;
>         struct device *dev =3D afe->dev;
> -       int reg_ofs_base =3D memif_data->reg_ofs_base;
> -       int reg_ofs_cur =3D memif_data->reg_ofs_cur;
> -       unsigned int hw_ptr =3D 0, hw_base =3D 0;
> -       int ret, pcm_ptr_bytes;
> -
> -       ret =3D regmap_read(regmap, reg_ofs_cur, &hw_ptr);
> -       if (ret || hw_ptr =3D=3D 0) {
> -               dev_err(dev, "%s hw_ptr err\n", __func__);
> -               pcm_ptr_bytes =3D 0;
> +       unsigned int hw_ptr_lower32 =3D 0, hw_ptr_upper32 =3D 0;
> +       unsigned int hw_base_lower32 =3D 0, hw_base_upper32 =3D 0;
> +       unsigned long long hw_ptr =3D 0, hw_base =3D 0;
> +       int ret;
> +       unsigned long long pcm_ptr_bytes =3D 0;
> +
> +       ret =3D regmap_read(regmap, memif_data->reg_ofs_cur, &hw_ptr_lowe=
r32);
> +       if (ret || hw_ptr_lower32 =3D=3D 0) {

I'm not sure how the hardware is, but I think hw_ptr_lower32 =3D=3D 0
should no longer be a failure, since it could be 0x100000000 or
some other address with the lower 32-bits all zero. Instead the
check should be done once the addresses are put together.

> +               dev_err(dev, "%s hw_ptr_lower32 err\n", __func__);
>                 goto POINTER_RETURN_FRAMES;

This is out of scope, but maybe this should just return zero directly
to simplify reading.

>         }
>
> -       ret =3D regmap_read(regmap, reg_ofs_base, &hw_base);
> -       if (ret || hw_base =3D=3D 0) {
> -               dev_err(dev, "%s hw_ptr err\n", __func__);
> -               pcm_ptr_bytes =3D 0;
> -               goto POINTER_RETURN_FRAMES;
> +       if (memif_data->reg_ofs_cur_msb) {
> +               ret =3D regmap_read(regmap, memif_data->reg_ofs_cur_msb, =
&hw_ptr_upper32);
> +               if (ret) {
> +                       dev_err(dev, "%s hw_ptr_upper32 err\n", __func__)=
;
> +                       goto POINTER_RETURN_FRAMES;
> +               }
>         }
>
> -       pcm_ptr_bytes =3D hw_ptr - hw_base;
> +       ret =3D regmap_read(regmap, memif_data->reg_ofs_base, &hw_base_lo=
wer32);
> +       if (ret || hw_base_lower32 =3D=3D 0) {

Same here.

> +               dev_err(dev, "%s hw_base_lower32 err\n", __func__);
> +               goto POINTER_RETURN_FRAMES;
> +       }
> +       if (memif_data->reg_ofs_base_msb) {
> +               ret =3D regmap_read(regmap, memif_data->reg_ofs_base_msb,=
 &hw_base_upper32);
> +               if (ret) {
> +                       dev_err(dev, "%s hw_base_upper32 err\n", __func__=
);
> +                       goto POINTER_RETURN_FRAMES;
> +               }
> +       }
> +       hw_ptr =3D ((unsigned long long)hw_ptr_upper32 << 32) + hw_ptr_lo=
wer32;
> +       hw_base =3D ((unsigned long long)hw_base_upper32 << 32) + hw_base=
_lower32;

Instead the check should be here. And to follow the original logic,
if either pointer value is zero, the function should return zero here
directly.


ChenYu

>  POINTER_RETURN_FRAMES:
> -       return bytes_to_frames(substream->runtime, pcm_ptr_bytes);
> +       pcm_ptr_bytes =3D MTK_ALIGN_16BYTES(hw_ptr - hw_base);
> +       return bytes_to_frames(substream->runtime, (ssize_t)pcm_ptr_bytes=
);
>  }
>  EXPORT_SYMBOL_GPL(mtk_afe_pcm_pointer);
>
> diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.h b/sound/=
soc/mediatek/common/mtk-afe-platform-driver.h
> index fcc923b88f12..71070b26f8f8 100644
> --- a/sound/soc/mediatek/common/mtk-afe-platform-driver.h
> +++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.h
> @@ -12,6 +12,8 @@
>  #define AFE_PCM_NAME "mtk-afe-pcm"
>  extern const struct snd_soc_component_driver mtk_afe_pcm_platform;
>
> +#define MTK_ALIGN_16BYTES(x) ((x) & GENMASK_ULL(39, 4))
> +
>  struct mtk_base_afe;
>  struct snd_pcm;
>  struct snd_soc_component;
> --
> 2.45.2
>
>

