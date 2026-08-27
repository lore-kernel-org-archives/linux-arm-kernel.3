Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A35FC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzMGBct2T5j19pFzqr+r438MOOPyyfPFxEllccYYNUA=; b=gJ7NNWd/ElWj8/HXheMFiimUXV
	5uv53mKBiQCt20X2oTyZiAt4yH2ECcPcr348Vhhqt2PQsQ/uPOc6fgUxKOR76kZZuToWWwvgg6oLc
	TjUNIyax7vfNxaurhch0/3iiENses1CyXslQlQFukDouetcd99+QH9z76X2TbhKbk7IIsaoQhoE38
	yY7Csr2ASJbskSCYPVJdcqiUG5oyDR469dl7B3RAflKimFIVV40o/rUO5OmIqZyNCCHHV0QtEfGDm
	gLbBShsh8CKRY/fdtp2Ab+MWgjwRzxwLc8H9R7ARAbJ4AgSHxr1NIF6zKb1dVxeONfnySc0Gguis1
	IHhT8AFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzd0H-00000004Lrr-1khd;
	Thu, 27 Aug 2026 16:31:01 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzd0D-00000004Lqd-3n8a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:30:59 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6a3fda88184so3856119a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 09:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787848256; x=1788453056; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mzMGBct2T5j19pFzqr+r438MOOPyyfPFxEllccYYNUA=;
        b=UHGxIwsS47KEz2e9B2QY4GHRF1spINOCR3mEuDUhv9M7wiVUtGh64g/8C/GpXKJKfm
         GEjcqCD/h2wYl1AyvpIV5n0J5kzcciG/VNvcaZ/guD2lm8JGZk2v5QhgeyVGngRND2mp
         XOAEUy134S0s/JlIgVi3BLEhw6+bh59s1PmLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848256; x=1788453056;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mzMGBct2T5j19pFzqr+r438MOOPyyfPFxEllccYYNUA=;
        b=ALyASmE6Q+sqs5OZxJO0/ZBMuY+4774g1jvcU53rHQ/fVHKcudPm1/DjH47MftQ+Vx
         TLiRqG0+j3ErlfEkv9SmfqmZP1HuIOvnxKl18toEOHPc609dBzIydqi+qMPI9SASLx8y
         hjKXbM78XOl5LJDUKppbdEDMyxb8A2xBszgxawhO3zM3fIxw+ti3wEBoglX5Yt28jSVL
         9YvenJbIQUsX3/ISxr5LKw1d6JyN4KUdcNBk8vP9GwtAfRVGkoNTDSoORiwYbGuSJRX5
         FiXdr/KzeW/Jhly+MAtnxGX5zHWivbGSk5S/3SzFzGix2VzSnGnK69m2/Pnep+JLlzph
         Ei3w==
X-Forwarded-Encrypted: i=1; AHgh+Ro+1wLYfcbr77iZMR7fxt4FoZ2wizb+khzoRrobT8iU4TIipfUDFNDKvkwqyj5g9UizbRQOajT/vKdnd7LItgQr@lists.infradead.org
X-Gm-Message-State: AFuF++nKHRq9SxwwePWK4sxZK5qmHsvpxFXxZc35IRJDD1CrU1QDuckM
	MQ30Iv3nEWfc+xA81WDc64vsgsDkZKnxgCWVUxDQXMwgvbt28stkyTfCJlRAV9clC14BPV5hLzd
	V/tXR5afS
X-Gm-Gg: AR+sD12aVuP98eqdy2RlsloYL6zF6pUgA1VMz5OOp5K2U1bzkJGauZtVIo6X14iiFO7
	+uDrQwBif8b4EXKYF2cCV3F/8VtcJjjwOAWozgBZLkzlB8u0lj2kyv/Hehr/R+lweWaDTJlaeUF
	McWcoJRR3sxH9MFUeql7Ao/JdkVu6NrRVLprndXgdbKoqQQY9LmJaykqszIJ6p6v//T4pfGpnKz
	QObpIwDB6Nwsh9IPO2U63MUf4H7s1Mu4U2fZG9q5USm4TugVHzzzPo1dj3w+qIBQF0qgUAt/XWz
	mdE4bC8MiPLnpYnswCqePEcum7V54FYyuFXQCBxEwMloKp4MA8Le5CvTCDtE/leH9qM+aB/HuuZ
	TMy3J50TXhJoj0dDedYldjq6eqmus5cL1+edWr9xOxwVcDO9xMCLKXn4NH219LT/K1BjVC/sZZs
	vhfObyjc3HeSzM+poo+5gEtu0pOM31ZliWwtGmi9BDVBolx5ICfADDUSHNFC4A2/OotNQVIIhd4
	eQTKb4mKCnDbsNvuLwKFsB2MIglr8DTfYO7Pg==
X-Received: by 2002:a05:6402:1f8c:b0:6a1:2400:baea with SMTP id 4fb4d7f45d1cf-6a5df629957mr4879978a12.10.1787848255863;
        Thu, 27 Aug 2026 09:30:55 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5edef3c26sm4106744a12.17.2026.08.27.09.30.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 09:30:55 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-69fc9f25118so2616250a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 09:30:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpuxyupeDEFhHORpqNmtA8nOH+wS4NjO/qT3GGOIgFdth8KENcLXDWEmfN01t+9D/LP01WMIu7fMpCnSbR1RWui@lists.infradead.org
X-Received: by 2002:a05:600c:1d8c:b0:49b:916f:1471 with SMTP id
 5b1f17b1804b1-49b91c1df21mr2431435e9.3.1787847852763; Thu, 27 Aug 2026
 09:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260825-drm-bridge-drm_panel-cleanup-v2-0-c6c88ba7ffd2@bootlin.com>
 <20260825-drm-bridge-drm_panel-cleanup-v2-4-c6c88ba7ffd2@bootlin.com>
In-Reply-To: <20260825-drm-bridge-drm_panel-cleanup-v2-4-c6c88ba7ffd2@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 27 Aug 2026 09:24:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VtDHWX5yXDE_CSMEZY9nTAd9372kkUAuti1K09zLywig@mail.gmail.com>
X-Gm-Features: AcwNN1VF3py5doozl6LD9Pr4fEpbkFlfT_OL-hoHyQ67imrOzi930oQk0T6UzBQ
Message-ID: <CAD=FV=VtDHWX5yXDE_CSMEZY9nTAd9372kkUAuti1K09zLywig@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] drm/bridge: ti-sn65dsi86: don't select unused DRM_PANEL
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Sandeep Panda <spanda@codeaurora.org>, Franz Schnyder <franz.schnyder@toradex.com>, 
	John Ripple <john.ripple@keysight.com>, Michael Walle <mwalle@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_093057_956811_60E039E4 
X-CRM114-Status: GOOD (  17.90  )
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

On Tue, Aug 25, 2026 at 3:11=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> This driver does not use the drm_panel APIs at all, so no need to select
> DRM_PANEL.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Sandeep Panda <spanda@codeaurora.org>
> Cc: Franz Schnyder <franz.schnyder@toradex.com>
> Cc: John Ripple <john.ripple@keysight.com>
> Cc: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kcon=
fig
> index 043596801a65..d46aa2eb01b5 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -474,7 +474,6 @@ config DRM_TI_SN65DSI86
>         select DRM_BRIDGE_CONNECTOR
>         select DRM_KMS_HELPER
>         select REGMAP_I2C
> -       select DRM_PANEL
>         select DRM_MIPI_DSI
>         select AUXILIARY_BUS
>         select DRM_DISPLAY_DP_AUX_BUS

Looks right to me. Ages ago it used panel APIs directly, but not today.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I assume you have a plan for landing the series. If you want me to
land this patch on its own to drm-misc-next, please yell.

