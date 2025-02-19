Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324A5C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 14:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfeKlX7pXgRi7R4JhhSFexI5hR+puM3QgUM/1fFuIdY=; b=biQSaxC2mNopkl1DVibip62igr
	f4c2FfTxGG2br0S31yNVrNO2TKcmAkHQD8AG0LfA2SC+/vCup4gmsScKIz0RsgfwxGIoOSQjTFAuR
	NsnZ/utT6Yd2g6LyNyMDTzxy1+oJnSM9GwxLZgb3q4njpBcTMlwNtNN65EDLvPuKQGDJmgGUMbq4h
	uPSe1h5vfClrgZ8c7TJjCqdxSL9QgBvQnhxx5wT3qiqn0u8TgqjqlXsMW873V5wJzHrEX7dBqtny6
	TMaV2S5F3OLMIxoD9b//hGq5KjP7YP8AQwjTXNqbEebG6wz2hst1M144LQInGRXzwWKxoiSvxeX/o
	ilc971Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkmD-0000000DCi3-0QTn;
	Wed, 19 Feb 2025 14:10:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkki0-0000000DAW9-10rU;
	Wed, 19 Feb 2025 14:05:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 999F9A4281F;
	Wed, 19 Feb 2025 14:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B65BC4CED6;
	Wed, 19 Feb 2025 14:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739973950;
	bh=85tPlsB4usIu6yhe/BHQqQ4y6WX5bDga5umRKzU2bKY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BUlQLfY8V3xQrs5YrlQNv3smrE6Q7+YS5w+c+n95W1TBOprHNjsOYaI1d93dFRSuS
	 Jj6eNJrTjb30dsRR2H83KNhHckPWX1D30v1Z3L8HrjzhCmVACDogFuUUKz60P0tNM4
	 phxfX9Ewg14lO3NDcDO6v+/G5OlFXIcawGUCSrR9tsd5ViNVr0HgRpqiMHIaJL9QoQ
	 35ebM/cE25/0P9ThxM2X6VnbAAdRnyD5jDmSeqJyVzut7DBFvOBlg5T3VvTvE4AVlz
	 zd+5enri1W/wbw3Q20QvWCmbTIm7SS08GAiDJ3gAy/KAwFAJYJWsUWH8wA23aixsGj
	 gDmAcyEcRG4Gg==
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fc0d44a876so9791814a91.3;
        Wed, 19 Feb 2025 06:05:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWFGSNiKwpFbxA3gbX6b9h8KZzvUvvNU8XUPW0s737rgXgNK1IwEKvOAOeOabpOUKhZhYfs4urdAvcVFV/hp6Ek@lists.infradead.org, AJvYcCXEOLbuWt32ArpupYf+TUy76tzZPqmBjhKEg6eeemzqjOg7ofO5/8kPSHKqtCV7OpNqp0HqZYCgci03/mjh8BQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yza/vIEmHhqmTNl4M+DFSDp0+JFKflK7QyZimEDOEitglcp6KlZ
	1YT+S42haYXfGEsEU5xufD5hOxhQCyabNaDPDBJSnQ2wmBigCpy+FpjFCpOqqZUw+ma7bcLq45o
	TOVcYoOzqp/uQEe+pVtj6sTsUVw==
X-Google-Smtp-Source: AGHT+IEsdOUobKrxzG2bHgh8FAnY3IxI3OdMrs5IpBFPR0BmaGsai+pHLZwpl46Br4o8jc93c37YtHPS/ZvBONvysZQ=
X-Received: by 2002:a17:90b:510c:b0:2ee:ab29:1a57 with SMTP id
 98e67ed59e1d1-2fc40d13203mr28805344a91.2.1739973950021; Wed, 19 Feb 2025
 06:05:50 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com> <20250217154836.108895-20-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-20-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 19 Feb 2025 22:06:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-BaK-160A4=oWKkEuYnJE69BXqk7CY3yoc71zn-M9y+Q@mail.gmail.com>
X-Gm-Features: AWEUYZlzg0d2_e6rOyz76Y9yADZ6uIl1Va12EUEGab7yKc_JPlmQYlOnNcjVbhg
Message-ID: <CAAOTY_-BaK-160A4=oWKkEuYnJE69BXqk7CY3yoc71zn-M9y+Q@mail.gmail.com>
Subject: Re: [PATCH v7 19/43] drm/mediatek: mtk_hdmi: Fix typo for
 aud_sampe_size member
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com, 
	jie.qiu@mediatek.com, junzhi.zhao@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com, 
	ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com, 
	jason-jh.lin@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_060552_420650_CE27B339 
X-CRM114-Status: GOOD (  13.60  )
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

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2025=E5=B9=B42=E6=9C=8817=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8811:=
49=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Rename member aud_sampe_size of struct hdmi_audio_param to
> aud_sample_size to fix a typo and enhance readability.
>
> This commit brings no functional changes.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index 29000cfcf761..6257503ce639 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -136,7 +136,7 @@ enum hdmi_aud_channel_swap_type {
>
>  struct hdmi_audio_param {
>         enum hdmi_audio_coding_type aud_codec;
> -       enum hdmi_audio_sample_size aud_sampe_size;
> +       enum hdmi_audio_sample_size aud_sample_size;
>         enum hdmi_aud_input_type aud_input_type;
>         enum hdmi_aud_i2s_fmt aud_i2s_fmt;
>         enum hdmi_aud_mclk aud_mclk;
> @@ -1033,7 +1033,7 @@ static int mtk_hdmi_output_init(struct mtk_hdmi *hd=
mi)
>
>         hdmi->csp =3D HDMI_COLORSPACE_RGB;
>         aud_param->aud_codec =3D HDMI_AUDIO_CODING_TYPE_PCM;
> -       aud_param->aud_sampe_size =3D HDMI_AUDIO_SAMPLE_SIZE_16;
> +       aud_param->aud_sample_size =3D HDMI_AUDIO_SAMPLE_SIZE_16;
>         aud_param->aud_input_type =3D HDMI_AUD_INPUT_I2S;
>         aud_param->aud_i2s_fmt =3D HDMI_I2S_MODE_I2S_24BIT;
>         aud_param->aud_mclk =3D HDMI_AUD_MCLK_128FS;
> @@ -1529,14 +1529,14 @@ static int mtk_hdmi_audio_hw_params(struct device=
 *dev, void *data,
>         switch (daifmt->fmt) {
>         case HDMI_I2S:
>                 hdmi_params.aud_codec =3D HDMI_AUDIO_CODING_TYPE_PCM;
> -               hdmi_params.aud_sampe_size =3D HDMI_AUDIO_SAMPLE_SIZE_16;
> +               hdmi_params.aud_sample_size =3D HDMI_AUDIO_SAMPLE_SIZE_16=
;
>                 hdmi_params.aud_input_type =3D HDMI_AUD_INPUT_I2S;
>                 hdmi_params.aud_i2s_fmt =3D HDMI_I2S_MODE_I2S_24BIT;
>                 hdmi_params.aud_mclk =3D HDMI_AUD_MCLK_128FS;
>                 break;
>         case HDMI_SPDIF:
>                 hdmi_params.aud_codec =3D HDMI_AUDIO_CODING_TYPE_PCM;
> -               hdmi_params.aud_sampe_size =3D HDMI_AUDIO_SAMPLE_SIZE_16;
> +               hdmi_params.aud_sample_size =3D HDMI_AUDIO_SAMPLE_SIZE_16=
;
>                 hdmi_params.aud_input_type =3D HDMI_AUD_INPUT_SPDIF;
>                 break;
>         default:
> --
> 2.48.1
>

