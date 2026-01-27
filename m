Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2500AD2FEC5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 17:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PlNmfFoygixWkI7H3Z8R3RRT3c5a4skQJi9DgZ6SblU=; b=uLCaobTtG92NI6j/FPQEllpsvT
	7V8gtnRSDh+aMAuv6oere6Xzy3Ae2KRUQo+X97Y03X6TyF6cg7ElSe/MNG9g/e5ojKje0uJLvrn2X
	MHSXvCIH+rtgC+nFmlJGnYBh2vke+ZhciDEy1iMS5WXpLegRQwvFGKsIb3EA/PDh7WmEkiJWFpBeC
	EiX6hl+8sy7jQrIZ4xCqd/UHnB2QGoLcNd25w/VBck7iE5OmXyBMnP11HqyjHS1ErGgnC52S44Lt/
	Y/ZVotuQBlZAh7gna3UYA28YX9Qw0JWBu24SAu/YV4efhsA7Sz2+bKBK3wRCv27j8gFU0vxZAXeIC
	kUHjxlJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkmuu-0000000Ejmk-2VLe;
	Tue, 27 Jan 2026 17:31:52 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkmud-0000000EjlU-1BN6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 17:31:36 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-50331ac1fedso7397631cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:31:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769535089; cv=none;
        d=google.com; s=arc-20240605;
        b=YIdUE1Qqqfi85z/4oYsrR8ofhF1tZlLHSye3EatN9GKxGp0dbEMmTiegNXPKRmvbsy
         vcS5aihjdqadfH8I9aH1oKJBKzPpdDjDmWBoSkACHl2RDVz/XrSE/Plwbbr6DQ4WeNHQ
         ZTxF7SZ/e+0W9KqfGI2E288uVDSNsjOB0bCTPU2CjMES5G7YHqe8vFLUtPjyoBWQp/si
         UmhflrrFz2sKL4qqA8HPtMLTdGaMyfg/IExQ170OIKOp2v4zW2kgCrcBEATOzj71k0zd
         6Vra//lD9drbpp7NyOl5jcGV1DiqDkamgFH7US814Jy4fXZKUqD1ZRGXbpbVqrppiLpa
         az3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PlNmfFoygixWkI7H3Z8R3RRT3c5a4skQJi9DgZ6SblU=;
        fh=mKyeYQtMGvDm1pdFjMjj8E5nxWM/cUKa+mCSfXkKhcw=;
        b=SkZxGQmNUs+bIoQ90Moflhon8jGFABlOky0a+lPDXJZ/o4I9u/n2WgEoBpptG3FO0y
         /PxoIHlt/c+pkdQQnm708TbxkSFXf6/Y8GqyApp2vYiLfdk8aOZ7nSjzSDu3abNwV15A
         M4sNfMeFLqAaX0NKQmMEyzB/Qe/x00gYzRZkBgc4p6Gvofw4KPPfWCqzfKm34JbTIv4h
         72GXtr6G6rUcdt7YxbFE6nUa8ln8320i8R/pANgOYRZEmay/Wnhx4ElPbO8kTEbE8eQU
         IhxlHA5F04Lzqs7Ta1OJANdPd2rjXOVKxrqy2lnmy3YX+4Ok5CVschmHDXbkb7ROXd3Q
         IcWQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769535089; x=1770139889; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlNmfFoygixWkI7H3Z8R3RRT3c5a4skQJi9DgZ6SblU=;
        b=k7d1bG+Ob2MRxLAUnLjZ3AyE/fQVr02OF62+ui38huBn/JEdGvNKc2d2yS29KIAYHh
         gvp0U/nzPgsyL9q/cIcHc429ImVqehhYSHfEBXoiVCm0PPLQeXeVS2dQqBEUxMD/Aov1
         1qJh6mT7M+XKE+oc1Lgiu5WSX/A8IAprEv3uBuDFopjzobRq+jQmx4M/LY2X2STikqNw
         vvRqs9yXrIDfIWPUi/X52Hk+15QLBwpBp1t8IYSOb06rjRwyN3Qk8ODtWRH9GlFhAVmV
         /+FD5Lwq2H7qj+1Nz0fSi8WV5tQpyPI010Fpi1rhjm092q9MRGo3Lfki+SMmuWZ/W4fV
         AC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769535089; x=1770139889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PlNmfFoygixWkI7H3Z8R3RRT3c5a4skQJi9DgZ6SblU=;
        b=xDD3VIBE6/yI1G59EmklbwdYp7X6ii1nD18LDFicHk0Fgh/TSDz4i9A9ncdmz6HM/9
         suBBYA7Q1hB9wFAT89ynHbgaHDoXnLe6xmoGsNhoyMx5zhueIvgv9STSY53c0wjHTkWy
         l+R9hES+lxN2HAlYbqimg0SfYRGeOXmGbWWIPfHwgCoz7jGGop/nCZ7CfPxuvwyxhIb1
         Bb7rvEKc1SlGdmrFkt6ATH4jSwPYcKq4Itj366YoPfPPAgvI9b8A0ps1Z1vL5E7YA8Pa
         fl/elkMUkvKS1azyEGqTJvgQzDE8D6bRf7RhsNiSTdsvJ6rW3LjAdYqAcxF/wKHGMzVi
         v06g==
X-Forwarded-Encrypted: i=1; AJvYcCWG1p08vSqX3vUb70nKAqIPzHWJzDONbrG8Icdxg+QUPoFT6Z9bDr1ogf3g1NoiTsEYheOiU/r6PYgUTUtP+ZqS@lists.infradead.org
X-Gm-Message-State: AOJu0YwC7ndx9qU1wEcv0isMwtcVa/MbXPRcTaJryqMWagV6fCUYln87
	MX0G/qN+46gRqqFfKKwhmO572a7rkjZiNw5afHSACsRe15Ngkp4adWsS6CfJ5OYbmG47x8UGVHe
	rCQs3OqjRcsK0i/AMS/atUrLr49Fj0p0=
X-Gm-Gg: AZuq6aLI1IJhkmMxap3oN/AhQrsCSxvnHjV5vNfoSLPmHhtdajLfhmDpjsdrT35ENDQ
	zpdde+HHvKLL6FhybtLulaQSBQVhh/5xA4y2xM/q2ISetfahvzLUV8r9NEcjVfOGDASfOBDrh/X
	6iccspCxrsWvNk8ha+pXHmN3xNBN4YQXP5XcKU+WA4RGhpq0YxqK53fBXty4/RSdCsxlEye3+DY
	m3RCRq55vPhJiMhvXjtwzLFi/jIh1NDRd8R8jR4P3K7rBMPgnulqDRvM792fF5zi00rGKs=
X-Received: by 2002:ac8:5a85:0:b0:503:2f49:6f81 with SMTP id
 d75a77b69052e-5032fc262a9mr32087791cf.74.1769535089137; Tue, 27 Jan 2026
 09:31:29 -0800 (PST)
MIME-Version: 1.0
References: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-0-a7c547072bbb@collabora.com>
 <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-4-a7c547072bbb@collabora.com>
In-Reply-To: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-4-a7c547072bbb@collabora.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 27 Jan 2026 21:31:18 +0400
X-Gm-Features: AZwV_QiRBuULTXUycKkcZHEVy2gS4ko9kDhO5KYckrC2F3g82wjmaKUQO-30ews
Message-ID: <CABjd4YxVQfp=ZuovBhAzqX9pDBnBmntQoxkr5vXnToPc3pRARw@mail.gmail.com>
Subject: Re: [PATCH 04/10] ASoC: rockchip: spdif: Use dev_err_probe
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_093135_432363_BC48A836 
X-CRM114-Status: GOOD (  20.00  )
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

Hi Sebastian,

On Tue, Jan 27, 2026 at 8:08=E2=80=AFPM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Cleanup the probe routine a little bit by using dev_err_probe
> instead of dev_err.
>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  sound/soc/rockchip/rockchip_spdif.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
>
> diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/roc=
kchip_spdif.c
> index 841ef499ed7f..20ed64c1fa42 100644
> --- a/sound/soc/rockchip/rockchip_spdif.c
> +++ b/sound/soc/rockchip/rockchip_spdif.c
> @@ -279,11 +279,9 @@ static int rk_spdif_probe(struct platform_device *pd=
ev)
>                 struct regmap *grf;
>
>                 grf =3D syscon_regmap_lookup_by_phandle(np, "rockchip,grf=
");
> -               if (IS_ERR(grf)) {
> -                       dev_err(&pdev->dev,
> +               if (IS_ERR(grf))
> +                       return dev_err_probe(&pdev->dev, PTR_ERR(grf),
>                                 "rockchip_spdif missing 'rockchip,grf'\n"=
);
> -                       return PTR_ERR(grf);
> -               }
>
>                 /* Select the 8 channel SPDIF solution on RK3288 as
>                  * the 2 channel one does not appear to work
> @@ -334,16 +332,12 @@ static int rk_spdif_probe(struct platform_device *p=
dev)
>         ret =3D devm_snd_soc_register_component(&pdev->dev,
>                                               &rk_spdif_component,
>                                               &rk_spdif_dai, 1);
> -       if (ret) {
> -               dev_err(&pdev->dev, "Could not register DAI\n");
> -               return ret;
> -       }
> +       if (ret)
> +               return dev_err_probe(&pdev->dev, ret, "Could not register=
 DAI\n");
>
>         ret =3D devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
> -       if (ret) {
> -               dev_err(&pdev->dev, "Could not register PCM\n");
> -               return ret;
> -       }
> +       if (ret)
> +               dev_err_probe(&pdev->dev, ret, "Could not register PCM\n"=
);

Shouldn't this one return the error code, instead of falling through
to 'return 0'?

>         return 0;
>  }
>
> --
> 2.51.0
>

Best regards,
Alexey

