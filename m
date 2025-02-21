Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77026C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 11:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwohrPAvCZ/qg3MA5g5m35rC3ir1Vy9aIxHkgumCgKo=; b=1n3xOYTc4f8KavcwfxCBHCWVYv
	He0xHo/SP99ntwVXsI72jZh7D2CLtUTletexmVcdEPeQcKACJrUCU9TNbY2Z6/687Pi6xuP6FlyDj
	WwT0giB8R/gKXpUxhbjAkRKmE0LKZhgQIB7LE3pnmbgma/5jeTuBRFS/0wlRp1JtbnFm68lKNCNgP
	I6G2PPAv99X1IR2XxUpSiwJNk20w1xEi6oDK6L+U6ur8wcRBrazN9JpGkzRyDDGaWLuhwOHWsyQMa
	o4Pr6BD90fnBW9FpskaG3mmZ3fU8tZsS8t3z5mHnSLZ/TvTQWFQFPdybbZJ98BbISsskfDgLj7tM7
	m2kbDxUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlRL5-00000005LaJ-0Me6;
	Fri, 21 Feb 2025 11:37:03 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlRJa-00000005LKR-2Szh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 11:35:32 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-868f322b8dfso1258763241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 03:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740137729; x=1740742529; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwohrPAvCZ/qg3MA5g5m35rC3ir1Vy9aIxHkgumCgKo=;
        b=ZyATv2ZwNanx3xmQ9CdLdVhJEffqW2Lr8tE+5zbhTt82drzKdmWAP1Nmv7zksWdwsV
         SfuTEUQAHE3DtwE+Fnw0FREJDksVIEpbnzJoz1n+qfhbFFUKxDHS28vpt4npHEp4pBkU
         pvnL5hgxkSpbC2qrXQSjC9Nhgvra6ZQh1GGIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740137729; x=1740742529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwohrPAvCZ/qg3MA5g5m35rC3ir1Vy9aIxHkgumCgKo=;
        b=iW1mZi+rnVt+8yKg53TNNvnOsk064JSJJYYC7lGKXgoUdQHbEi3+Iu2IRLQk/d7Xwb
         UlDtosQNuIrYWOYCyY/DfJrc/Y9BXo+LSMXBAgZB3lw/lxmiXCLmcZyoDDnFEefOZha8
         3H1S1sXW38FVnuk114LaIHyXPhgATn1015ZSTYBr/RaMcMdL6uh/Obg/RqK2X9e8tDid
         BSz6SHMxeh8fbP3/lJos7KM02kp/O5x99Lt25CkE3N7yYLDRUif7u3qIVWhkC1wgIW5o
         oIAE873Bd+1wayTLY7Z3+AKiC+d2PE8vGumdyBpJntTcXHPwvrrEMRejWEBYt77FXJNd
         O9Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWNxzyn7mXn8OroT9+S28PTxUQaRUIw+qY9UqcyoHDoPtv9p3+5y9saGSg9Er49332tKnHmKu8VyLJrDxjPlvbN@lists.infradead.org
X-Gm-Message-State: AOJu0YwOrmfUMUA625Yt3FOaKeielD9yEG56IeQ5Yg7FHjuw+scVxRgM
	XHKX2WxxyA8bFXMQ4Rod2iQ6+IpoitLSX9tXO5vEN75U3EkRkQNBdQmBW/D2VadJDdU95k8dibI
	=
X-Gm-Gg: ASbGncsEKjm4rHm5rfNW6VyfJrlPn1jtHnNghDTUD2RM8fDTC/uzuPaulKG8Xf02lb8
	laTUTH7AL2h/bU/Q1yMgUyhyVJMYyt3w34MCC5EihVEHd17w5vluZT6KW53dUljXkGpsEOqIAXE
	n3Nu6HEIY2Nmnis9/UfV3DVGE/CvhMiQM82p5ammA1s9ZJpsij6bD4dzG1IbrgIDVPiJhxCFvFZ
	dACOupNNR2j2OhM/soWpX9xKx93ylw5cUddTt34emvSGKf0HsQ+Sn9oMvsY9WPAafTlE3HnPBNv
	pRZQpDBKKhVgXevvfwVYGzA3rM1lrue5ZI7af11GpXHJqGMIxuZ9fKH5x+koaQ==
X-Google-Smtp-Source: AGHT+IEZKFc/2I4qV+cjBnw0I4CnaTKyC5z4nMxh0Wd+byX0l026eFXS5VFP2mZT2FgDTWg5uqhVmg==
X-Received: by 2002:a05:6102:304b:b0:4bd:860f:ff2 with SMTP id ada2fe7eead31-4be99122626mr3159650137.4.1740137729007;
        Fri, 21 Feb 2025 03:35:29 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4be54009b3esm2474008137.0.2025.02.21.03.35.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 03:35:28 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4b9486a15a0so1859532137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 03:35:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVQLU4zkqDrLMlrzXVm6IjDwQ+kFqe0iOXxRcge0wxC4BaJyiv1pSt8gRMe4yM7xTaq46kTdfZTTH3glENpQhFy@lists.infradead.org
X-Received: by 2002:a05:6102:2921:b0:4bd:22d9:b117 with SMTP id
 ada2fe7eead31-4bfc0fdf40bmr1459685137.10.1740137727505; Fri, 21 Feb 2025
 03:35:27 -0800 (PST)
MIME-Version: 1.0
References: <20250221-mtk-socinfo-fix-print-v1-1-20500f30ef66@collabora.com>
In-Reply-To: <20250221-mtk-socinfo-fix-print-v1-1-20500f30ef66@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 21 Feb 2025 19:34:51 +0800
X-Gmail-Original-Message-ID: <CAC=S1njHBs27TtTZXgED4wdLw=FrSDCazbb6ZssZywvSWV2h3A@mail.gmail.com>
X-Gm-Features: AWEUYZmV51gkv5en-4xAlrGPHtRp_UB_-TGQXQmxc_me0FZsV0tfUBhu-ic9sd8
Message-ID: <CAC=S1njHBs27TtTZXgED4wdLw=FrSDCazbb6ZssZywvSWV2h3A@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: mtk-socinfo: Avoid using machine attribute
 in SoC detection log
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_033530_675224_9F945BF3 
X-CRM114-Status: GOOD (  20.41  )
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

On Fri, Feb 21, 2025 at 7:04=E2=80=AFPM Louis-Alexis Eyraud
<louisalexis.eyraud@collabora.com> wrote:
>
> The recently introduced SoC attribute info rework avoided modifying the
> machine attribut but still used it in the log message on successful SoC
> matching. It leads to print a confusing log about a board-related info
> (read from devicetree) and not about the matched SoC:
> ```
> mtk-socinfo mtk-socinfo.0.auto: MediaTek MediaTek Genio-510 EVK SoC
>   detected
> ```
>
> So, fix the dev_info format to display SoC family and name attribute
> instead.
> ```
> mtk-socinfo mtk-socinfo.0.auto: MediaTek Genio 510 (MT8370) SoC detected.
> ```
>
> Fixes: da77c2d3d06c ("soc: mediatek: mtk-socinfo: Restructure SoC attribu=
te information")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Ah... my bad, I forgot to update the log. Thanks for the follow-up fix.

Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>

> ---
>  drivers/soc/mediatek/mtk-socinfo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/mediatek/mtk-socinfo.c b/drivers/soc/mediatek/mt=
k-socinfo.c
> index a15d8f854cefa90883377b47bbc16a7072ee21cd..ac7bb0cbff2df5e1c4033646c=
d3b644e67ee7f69 100644
> --- a/drivers/soc/mediatek/mtk-socinfo.c
> +++ b/drivers/soc/mediatek/mtk-socinfo.c
> @@ -87,7 +87,7 @@ static int mtk_socinfo_create_socinfo_node(struct mtk_s=
ocinfo *mtk_socinfop)
>         if (IS_ERR(mtk_socinfop->soc_dev))
>                 return PTR_ERR(mtk_socinfop->soc_dev);
>
> -       dev_info(mtk_socinfop->dev, "%s %s SoC detected.\n", soc_manufact=
urer, attrs->machine);
> +       dev_info(mtk_socinfop->dev, "%s (%s) SoC detected.\n", attrs->fam=
ily, attrs->soc_id);
>         return 0;
>  }
>
>
> ---
> base-commit: 964b0ceed00032fa0fa841fd61e5f315880a2d36
> change-id: 20250220-mtk-socinfo-fix-print-e83f3b3e50bb
>
> Best regards,
> --
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>

