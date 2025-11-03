Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD289CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 17:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W8C2ciZCBfsiVumA87QmNudtAih3M40XdGPKL7rnXzk=; b=IhS4tQasTcVJzC
	3P1voIw4ZDX1NBX0vCi08Tuhe4GHruARidDikqxrKhwjdw4C0DbtOTgwheU0l/Ftr/kQuwUMGl58b
	CYi+J89SRC5mjKfrJWTmC+bG33k25C6ajFO6FhNCkzj1HoYH9QmGxAj9O55SFQ1vepamRcnZIpR2l
	HwH6DqVoD99APjqDIpE+LnTE8NlJjDb0ptmWlN39uDuz95ZGv7F2VlyhxI43eUlNJGxEmGdelpy4h
	/iGSzVvt7li4sXtRxGgjuH4MMil0vBAaoSh8EBATkhYhWSMMzTJzXK37RrKQ/YZp9iFjjJm/wAsV4
	03tb4HombaXgp1tbxP2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyEl-0000000APMB-0F3M;
	Mon, 03 Nov 2025 17:20:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyEk-0000000APM1-098r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 17:20:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A2CC6013B
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 17:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0368C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 17:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762190456;
	bh=Cw8Tr0pt0izwPilVv5nGs/i4ufdA9dFbRs4VQY6zikM=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=gMmcAhiBsVSyCkOM0mRYgkYZA9tJDSvK2wgh3qZwFULWhvuXi8erf2rkr/MwaAaKA
	 fw2ML9KSCqXlPeZgkwSyurKcuqLMA35nwK2qQ0C+4tXt6DCRv6SBnvnR3Y0ZzRJ2is
	 xEMh5Fex5rWkiAKYDk1zV0DJro/oYmo46qNlrrule9GFz1EZ2d+i9bGQhCeC76L2cR
	 LSaGQGR0st+3+0WNqNJbdF2+qKzGRo9WavHL/e95h245XBEB2hF+uuN2wWEAWpdWKg
	 bFcHCnLRxBqbLvNmg4iYxqhyRLpJbGgWx3uKZI/NAhWbpgI8Beyv1bk0jQe5hkUZSh
	 UxBEpH8miuwgw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37a2d9cf22aso19812591fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 09:20:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXn3ldd60lSVc3a/rrYy464r2U9DpgQ8NyqKqxIuD80/NaImIKfV4IVa4VnBri3ykXL2HDQPDKiQxAGthpt6FPn@lists.infradead.org
X-Gm-Message-State: AOJu0YwV0yu/DKjmql4fKiA5gLF+gn8J3eFrb33+U44q39k0/whL9wVC
	EpBCHbushf/zHveTjBbkKQPawgrHCboG6vmexkmwE7gH1IxqYMF1ejDDov+Res4v0jYDvxDU1nd
	mhGac/Bt/SPhEPzkV62qcds9RsHyJH98=
X-Google-Smtp-Source: AGHT+IHRUi6EAD6pMQNRdNYhSlcQIuKYSqaTxdXDqRJl9lmDDHFEVrdVEd5CRyApfZOE2sDZkcCOjtV9/2hQgNU4yLg=
X-Received: by 2002:a05:651c:23d3:10b0:378:f3b6:f762 with SMTP id
 38308e7fff4ca-37a430aa81amr317571fa.8.1762190455235; Mon, 03 Nov 2025
 09:20:55 -0800 (PST)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-28-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-28-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Nov 2025 01:20:39 +0800
X-Gmail-Original-Message-ID: <CAGb2v65x+b8FXUfM_XbaSxKbKb2bMydmwAHZCm+AMd5f1gW1Aw@mail.gmail.com>
X-Gm-Features: AWmQ_bkmnwYwJfDQIAiND4eRiNPut9jjWdyj2va-IjgdPAkREnfrJWQqH0QGSVs
Message-ID: <CAGb2v65x+b8FXUfM_XbaSxKbKb2bMydmwAHZCm+AMd5f1gW1Aw@mail.gmail.com>
Subject: Re: [PATCH 27/30] drm/sun4i: mixer: split out layer config
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Later special plane only driver for DE33 will provide separate
> configuration. This change will also help layer driver migrate away from
> mixer structure.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---

[...]

> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/=
sun8i_mixer.h
> index 40b800022237..8629e21f9cf6 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -164,34 +164,44 @@ enum sun8i_mixer_type {
>  };
>
>  /**
> - * struct sun8i_mixer_cfg - mixer HW configuration
> - * @vi_num: number of VI channels
> - * @ui_num: number of UI channels
> + * struct sun8i_layer_cfg - layer configuration
>   * @scaler_mask: bitmask which tells which channel supports scaling
>   *     First, scaler supports for VI channels is defined and after that,=
 scaler
>   *     support for UI channels. For example, if mixer has 2 VI channels =
without
>   *     scaler and 2 UI channels with scaler, bitmask would be 0xC.
>   * @ccsc: select set of CCSC base addresses from the enumeration above.
> - * @mod_rate: module clock rate that needs to be set in order to have
> - *     a functional block.
>   * @de_type: sun8i_mixer_type enum representing the display engine gener=
ation.
>   * @scaline_yuv: size of a scanline for VI scaler for YUV formats.
>   * @de2_fcc_alpha: use FCC for missing DE2 VI alpha capability
>   *     Most DE2 cores has FCC. If number of VI planes is one, enable thi=
s.
>   * @vi_scaler_num: Number of VI scalers. Used on DE2 and DE3.
> - * @map: channel map for DE variants processing YUV separately (DE33)
>   */
> -struct sun8i_mixer_cfg {
> -       int             vi_num;
> -       int             ui_num;
> +struct sun8i_layer_cfg {
>         int             scaler_mask;
>         int             ccsc;
> -       unsigned long   mod_rate;
>         unsigned int    de_type;
>         unsigned int    scanline_yuv;
>         unsigned int    de2_fcc_alpha : 1;
>         unsigned int    vi_scaler_num;
> -       unsigned int    map[6];
> +};
> +
> +/**
> + * struct sun8i_mixer_cfg - mixer HW configuration
> + * @lay_cfg: layer configuration
> + * @vi_num: number of VI channels
> + * @ui_num: number of UI channels

Missing kerneldoc for .de_type field.

Once fixed,

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

