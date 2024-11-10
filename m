Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8B8D5E38F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 09:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0wtpfkEmN9TnpSt9kWyIfHjD/NJzBYrneyOwbFIleHc=; b=R727f4ok5vIjG/
	9gnWLRl2lrSqbmfmTT2Mvo/EzRq/hsyA7TsitubzM7cBHEXHSN3t47mGM228UrCIcV3/1qtnnnyML
	smFYnrKxPqLwjaDqKviuOui/+t6zpSTR7tMbKEuJO5kl0Z+vVl9fIYQWognKh7hqt7Qv+KWB2lbfk
	u9R1DGNBfvoGE+4jJMu+rrFFtC63ZTcIu6+0i/T+6Vjf7wcUMv15q51gTUOHxLs8Y15bWCZTvYnbf
	BNxHyJlzkOqC2cMe4RqPdCyIxrTKJE0TTQbHS6MeMe8MTiRtSw74EfRXliiuSCWmENRcGb8KKrYXm
	L7me35zUyxJbEoZ7CpFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tA3th-0000000Eatz-2Zdu;
	Sun, 10 Nov 2024 09:06:17 +0000
Received: from mail-lf1-f47.google.com ([209.85.167.47])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tA3rv-0000000EaTU-0wxi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Nov 2024 09:04:29 +0000
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53c779ef19cso4262577e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Nov 2024 01:04:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731229463; x=1731834263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0wtpfkEmN9TnpSt9kWyIfHjD/NJzBYrneyOwbFIleHc=;
        b=XfgMZiqHXeKPOISbmtTrT9uuladoS4PlWjc8FsYaYRlj/bPCIUrw4sYXv4G451RbVg
         LK5705KVryGI/eCDmnlm6t737DhXVdE6sikI0gYi/xkoBiT7pILMq9UjBTJz7Bp6oGCk
         s6ZyvNYbJPgeyDfruzRMxQW0OeQ5lHwzWx212XwoqOKC+G3wu5sCvH+jqZwEeR6Xvc0P
         rR8r3esMS56JaoZNSQ1FHWxnFpDrOoyRocm6E6/X6DhrJ+m3GfjnZPVaDhnn3DcRGLTB
         iwKwDWmBhZ82Qbqd/0hn4fEp4/MJEtnOvYElh82azuntlum8qF3/y/oVCM9lw9cs8D5V
         XwgA==
X-Forwarded-Encrypted: i=1; AJvYcCUb3PsNR1gYX8F1nH0txbdoFigC9y6WSz+NHN9cy5JGee6z11FF7JMzoOGnMeob8chNGoTEtZS5eNJeDkV1jmzQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxSEMonO5DXYj0H518LDBP42nX9ub2DsnnECLX4WxCSBPOnSNXN
	ugu9m5nFfSivSeJowyaQVrrT+xUQ4OiAJ5c7c7SnO5zXxIVaFj7nOmA6f1pZ
X-Google-Smtp-Source: AGHT+IHASzXabTMdKPTV2B16gZnN7/xXmmtXhQmBAkcltRO2NRblttnLNa0Hwo4GoJeBhdugzVPwuA==
X-Received: by 2002:a05:651c:881:b0:2fb:628c:2580 with SMTP id 38308e7fff4ca-2ff201e6d03mr44713701fa.2.1731229462542;
        Sun, 10 Nov 2024 01:04:22 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff17902152sm12522281fa.57.2024.11.10.01.04.20
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Nov 2024 01:04:21 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb5111747cso29510751fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Nov 2024 01:04:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWuFtasVsmoiI4+4vqpgxRAdrIwrH6h4m8sIfvNix6CUOvKFiTYP2GLNGKqMHfxDVtZ5uCMCkKHfqF0Tvg6rNDN@lists.infradead.org
X-Received: by 2002:a2e:a552:0:b0:2f7:58bc:f497 with SMTP id
 38308e7fff4ca-2ff202e1810mr39484121fa.28.1731229460191; Sun, 10 Nov 2024
 01:04:20 -0800 (PST)
MIME-Version: 1.0
References: <20241107014240.24669-1-andre.przywara@arm.com>
In-Reply-To: <20241107014240.24669-1-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 10 Nov 2024 17:04:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v64HUp4Xwgc3fw1fMVTBQFV2kHSVbs7=XBufzJpQ9hkuzg@mail.gmail.com>
Message-ID: <CAGb2v64HUp4Xwgc3fw1fMVTBQFV2kHSVbs7=XBufzJpQ9hkuzg@mail.gmail.com>
Subject: Re: [PATCH] mmc: sunxi-mmc: Fix A100 compatible description
To: Andre Przywara <andre.przywara@arm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Yangtao Li <tiny.windzz@gmail.com>, Cody Eksal <masterr3c0rd@epochal.quest>, 
	Parthiban <parthiban@linumiz.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_010427_290356_A7F2E3EC 
X-CRM114-Status: GOOD (  23.42  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Nov 7, 2024 at 9:43=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> It turns out that the Allwinner A100/A133 SoC only supports 8K DMA
> blocks (13 bits wide), for both the SD/SDIO and eMMC instances.
> And while this alone would make a trivial fix, the H616 falls back to
> the A100 compatible string, so we have to now match the H616 compatible
> string explicitly against the description advertising 64K DMA blocks.

Would be nice to know how this was discovered, and how the correct size
was determined. As far as I could find, the A133 user manual says its
64K.

ChenYu

> As the A100 is now compatible with the D1 description, let the A100
> compatible string point to that block instead, and introduce an explicit
> match against the H616 string, pointing to the old description.
> Also remove the redundant setting of clk_delays to NULL on the way.
>
> Fixes: 3536b82e5853 ("mmc: sunxi: add support for A100 mmc controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/mmc/host/sunxi-mmc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
> index d3bd0ac99ec46..e0ab5fd635e6c 100644
> --- a/drivers/mmc/host/sunxi-mmc.c
> +++ b/drivers/mmc/host/sunxi-mmc.c
> @@ -1191,10 +1191,9 @@ static const struct sunxi_mmc_cfg sun50i_a64_emmc_=
cfg =3D {
>         .needs_new_timings =3D true,
>  };
>
> -static const struct sunxi_mmc_cfg sun50i_a100_cfg =3D {
> +static const struct sunxi_mmc_cfg sun50i_h616_cfg =3D {
>         .idma_des_size_bits =3D 16,
>         .idma_des_shift =3D 2,
> -       .clk_delays =3D NULL,
>         .can_calibrate =3D true,
>         .mask_data0 =3D true,
>         .needs_new_timings =3D true,
> @@ -1217,8 +1216,9 @@ static const struct of_device_id sunxi_mmc_of_match=
[] =3D {
>         { .compatible =3D "allwinner,sun20i-d1-mmc", .data =3D &sun20i_d1=
_cfg },
>         { .compatible =3D "allwinner,sun50i-a64-mmc", .data =3D &sun50i_a=
64_cfg },
>         { .compatible =3D "allwinner,sun50i-a64-emmc", .data =3D &sun50i_=
a64_emmc_cfg },
> -       { .compatible =3D "allwinner,sun50i-a100-mmc", .data =3D &sun50i_=
a100_cfg },
> +       { .compatible =3D "allwinner,sun50i-a100-mmc", .data =3D &sun20i_=
d1_cfg },
>         { .compatible =3D "allwinner,sun50i-a100-emmc", .data =3D &sun50i=
_a100_emmc_cfg },
> +       { .compatible =3D "allwinner,sun50i-h616-mmc", .data =3D &sun50i_=
h616_cfg },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, sunxi_mmc_of_match);
> --
> 2.46.2
>

