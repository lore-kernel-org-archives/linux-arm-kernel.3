Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A51E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 08:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2S3PhJ8RakNFN2ZNGYVv9qnlRZ5AL3BC9CtYpxM3yU=; b=GitYebUEJnxS0J3Y7dMXC3uJph
	VDy0NpKI5ayWqiBAcQlofKAe7NVL3KIx2urNid3iqNThpvEGWt+xJIvMv5ayJhQ4Zt189UoQ+YdmV
	fAySpiZW63QCiElCaNormj4HcLnKU5ki6RKe+P1zLRQm23V0QMtSSyXQrGmcg0fOHWXwp92cm4kT0
	8JfRNqHFmmQgkB2eOTS1UykP9glglukKob8ZUEZu9QZivSiHuM3s4s+3FMywzgVR6/+KwDuuQqFSj
	rMD23N80lz9JyZeFoT7fjPPSZy0DivSRbxlopFM2L7XYX2awrjKEljngnS42CoyuR2+Xf7Eui57LD
	yNDROSHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQjHV-0000000FTSg-1mpQ;
	Thu, 26 Dec 2024 08:31:45 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQjGI-0000000FTNM-3YoF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 08:30:32 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so6570204e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Dec 2024 00:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1735201828; x=1735806628; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2S3PhJ8RakNFN2ZNGYVv9qnlRZ5AL3BC9CtYpxM3yU=;
        b=P5POj0mrh1gusbuSYDwYBBZfn2KuL+o+wGpgJV0iiQEvzX8oXIPPD2h4y3kfWajwTq
         /kVS2LHW+2I3nulOhrGLpJjrs7qkRjJDWLTuWluW3ALyoBSRuyr27Q9xXje9ZyquDtP/
         LzqesfI47CFJig0PDykY//hp6QR6MLcOCDGPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735201828; x=1735806628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2S3PhJ8RakNFN2ZNGYVv9qnlRZ5AL3BC9CtYpxM3yU=;
        b=xJP6wPMX2dOyTgkTZTGx47roBo5kAuRDS+z0vOWHBmA8zGQWvWSgJ+DOVc3AQtbPHv
         lDU6kJhuJNMFo0S9/9VEyO8ux07iEhaOXmg59Rk68l7vvZ1aAd7QfZ0aQaotY1XiYJXL
         CnHxKENqwNApv4Dn6nQW1tLx2wcKOPVB5boe+UMpSrQhXasfXcEBK8wes5miYg1aM+yw
         b9Fjjt0pJdKeYQgT+za6QpEg6VvJENnmpcg5FRvngbWaXHbmV9vExVDZkc+fSLzaneVO
         Tn9v2EIOcdwb38+MTY+65AQ0WrAlFRHguQNOE6I5ssk6cXs+DZd0fCxWHy84kt3Pvzl+
         aylg==
X-Forwarded-Encrypted: i=1; AJvYcCVl7Q/HZC+siHxh8mXvbN5qoj717fAAjBqR3jnv5iWwIetBRC7xH/a/f0SnjkIlOFFTAKzKSnI4TDUCCX5VAFvQ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywxl1iaSM0CDeJR3CL/ewK7TKtbIvnfZTe0Oe27h9QnzQRZGl5Y
	vDEBKW5sj6Mv5MWRg456EF4uhiixsfusxzv5IOFUFDD0yfK6E3yyeAwbjGGL0bBue4S991BqWjR
	vHqfmIjQ9Y7Rjat8j2MZsQfBGoKdFGnUJEcTS
X-Gm-Gg: ASbGncuC9sE4dRGMZq2tNC2Tg3rz1Gja61pJLryS+xDg6Q1NB0IvG3LJuokGoyDa8Og
	pl0tdN2L7hmts8N5A/amXLpTNros4jYG6eVj9n5C7ESKKNd28KmZvb+leCEgUUn7pvQ==
X-Google-Smtp-Source: AGHT+IGrtTwpjhhwhEtLkMigzaaB7SQidO5BfU1GsTXFJn5f4BLy579qZREaSEycCfwK3L6T9pvM3RblbNdUBiHFoWI=
X-Received: by 2002:a05:6512:4485:b0:542:2972:4e59 with SMTP id
 2adb3069b0e04-54229724f79mr7301629e87.28.1735201828402; Thu, 26 Dec 2024
 00:30:28 -0800 (PST)
MIME-Version: 1.0
References: <20241203-mt8188-6359-unhardcode-dmic-v1-1-346e3e5cbe6d@collabora.com>
In-Reply-To: <20241203-mt8188-6359-unhardcode-dmic-v1-1-346e3e5cbe6d@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 26 Dec 2024 16:30:17 +0800
Message-ID: <CAGXv+5EG8LbgaWc-Lp_KQc8Yf+m_4TRo8R7B0S7-rXYpnak+7g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: Remove hardcoded dmic codec
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Trevor Wu <trevor.wu@mediatek.com>, kernel@collabora.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Fei Shao <fshao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_003030_919067_1D293FDD 
X-CRM114-Status: GOOD (  21.71  )
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

On Wed, Dec 4, 2024 at 3:22=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Remove hardcoded dmic codec from the UL_SRC dai link to avoid requiring
> a dmic codec to be present for the driver to probe, as not every
> MT8188-based platform might need a dmic codec. The codec can be assigned
> to the dai link through the dai-link property in Devicetree on the
> platforms where it is needed.

A followup question about this. The DMICs on the Chromebooks are attached
to the PMIC codec's input side, which then converts the signals to standard
I2S and passes them out to the SoC through its AIF1. So the original code
was somewhat incorrect, though it works.

How should we describe such a connection, given that the MediaTek sound
bindings aren't a full graph?

> No Devicetree currently relies on it so it is safe to remove without
> worrying about backward compatibility.

Removing it didn't seem to cause any issues for the Chromebooks that
do actually have DMICs. I suspect the only difference would be that
the wakeup-delays no longer apply correctly.


Thanks
ChenYu

> Fixes: 9f08dcbddeb3 ("ASoC: mediatek: mt8188-mt6359: support new board wi=
th nau88255")
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  sound/soc/mediatek/mt8188/mt8188-mt6359.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediat=
ek/mt8188/mt8188-mt6359.c
> index 08ae962afeb92965109b303439419bc6e7c2a896..1550e56ab57d54b179ebe5cbd=
60db1660bb0bd2c 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> @@ -188,9 +188,7 @@ SND_SOC_DAILINK_DEFS(pcm1,
>  SND_SOC_DAILINK_DEFS(ul_src,
>                      DAILINK_COMP_ARRAY(COMP_CPU("UL_SRC")),
>                      DAILINK_COMP_ARRAY(COMP_CODEC("mt6359-sound",
> -                                                  "mt6359-snd-codec-aif1=
"),
> -                                       COMP_CODEC("dmic-codec",
> -                                                  "dmic-hifi")),
> +                                                  "mt6359-snd-codec-aif1=
")),
>                      DAILINK_COMP_ARRAY(COMP_EMPTY()));
>
>  SND_SOC_DAILINK_DEFS(AFE_SOF_DL2,
>
> ---
> base-commit: b852e1e7a0389ed6168ef1d38eb0bad71a6b11e8
> change-id: 20241203-mt8188-6359-unhardcode-dmic-ba7649f8a72b
>
> Best regards,
> --
> N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>
>

