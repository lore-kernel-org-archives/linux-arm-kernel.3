Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F78CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 02:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LxUF+h7S30BNbJmH4g7pCp3lBzmymefVuj0S5lsfjbg=; b=PNRGcEhJgqGnNFJKhbnHtup6Mz
	93GEn7bxS2krNiGU0ywsLEVpTDLHWSulVklSRXNFO5avGWsxTAKGWCWFH0wv5F7z4hJ/hhmW/vAdM
	Vv9iu02vzlhN3f/8yQvyo1mPgR89f23vyp2sPscPZLEXv7HkZBA1dAF6mgOwiwrTuoiYc1FJtuQEK
	FyXLZYYRpsujEydPgnbrKgqJw9AL1XXbn6tHxbunwe7YTn9IoepNqjPw+ZR4G/rGMho1Z8dTxL1La
	YsBFEz6bYVZwGTX+WFO9Wwa6GZ28KQ+bJw8iillV8elGT2V/rVmdItjd8yOMJd0iK4clc6jYASytO
	mp/Zt34g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ0TL-000000081AF-4Aba;
	Wed, 12 Nov 2025 02:20:36 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ0TJ-0000000819i-1zQ8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 02:20:35 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3410c86070dso248868a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 18:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762914032; x=1763518832; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxUF+h7S30BNbJmH4g7pCp3lBzmymefVuj0S5lsfjbg=;
        b=YIelYShQtN+EoxUfnXxd4y3JW+no81buND78/dENRk2n70gwGUwbSAQHgjeUlY8oAe
         bBlG5skTYZGrRXfZDBgkNlC39KB5HV/C3sFav4EFImpvjxSh87EXatUr5P71/2SbLZ+u
         kvRGy6TKmkv27fFOfqfCPPYxAwvhO2o2ftzAOzyQ+wmBzaJvgaIKSf9vrQc905ASU0jq
         iKcu6r1vmCq7deQ0cb6QvS7JOz5PTews2m12PszfbakQ8MWxa2w92/ucL3TFlcoAM4X3
         JXnPQQA19qolnMYWQTBF986BksGOc8aNGYpZMLtrKUO0AKqA/JrGWMYiIr3fcwT3eFUN
         5U6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762914032; x=1763518832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LxUF+h7S30BNbJmH4g7pCp3lBzmymefVuj0S5lsfjbg=;
        b=tNmlZWUh0NoByTlo2AndIhIyqkCoEYINtNHM6zQu5s379luSuXmpExVUCp1UJtvoQJ
         erb2rAyMYKw7CHAdMCk1syBwIttzg/kYTepmk5xLai4a1bz5yfJ2lw2wcL0R+Dtly06J
         vdiUqIwkGhZ1eik9azsnO6l2pPrV8+MspS8BWWGsNAmOxp5fFS/4TiNV7ZhJ6pbv6q4m
         Vb2Ve5hYGKArI2FLKsyOokWPiRbfeUXkcYKz9L5aXmlRJluT+SNXJEl2AFdMFhpkFa+6
         aH0jXHIA/Q6ZY9x6uIOxfBvrvbDuyttX8jyZVoGckW2xfhyaAh8UVfwaogpAJdpdpvdH
         IzjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaiLY663v6ER/uunoaPH3Li6bqWDfXs7F8Ljkm/4foSSkueAfw5sIfe3zQWbfQ5plN9scKvkp6hiCuQFYWP3nb@lists.infradead.org
X-Gm-Message-State: AOJu0YyQxIFEvi1J0ya5TZK4NQ378+wVbodJonsVf422YKQUXy9fiR4F
	ET0zEYUiK7Ol0s171if1nUwuoWfhG5cQjcJGdfq2wFJPlPwkXknZ2avoTmIPe4xg75iuuvovTAE
	GjHutpRLa9W2UD+SpqiFxDB5cgsvknNI=
X-Gm-Gg: ASbGnctqPfmltW7uRv/PizqGkE9sq/5JtfXfAYbfVG5c+GZgLtcjsuKE+SaAkbgtK9b
	HQKkuWyz1AQhsPyETQ5Klpd5zhRUnICU7A6g0NCc2iI2q3m8csqhQlUSmB9G3GajihDYiLdhoqC
	zmzH/Y+ZdrXNx2tr6feeb5LqJDU1A4v004ty55mmpVmoSwnq9oi+wRHwe6cyufdNvvfh3mjkXDi
	qCJ6a6cuPl3GhoTT4Q8Y6X5a402k6gL2k29sosm3i3fUvquVuhk/5NLkGj/
X-Google-Smtp-Source: AGHT+IFtc6HQrz/xKZ9emyb5FEGlT0SRf+ATUq6DWBXr3zYhujoZ6/yNyjXJ5nXZWWbTjr5BzqbESW0tw1NXrAGBcT8=
X-Received: by 2002:a17:90a:d88b:b0:340:be4d:8980 with SMTP id
 98e67ed59e1d1-343dde27552mr1630702a91.14.1762914032513; Tue, 11 Nov 2025
 18:20:32 -0800 (PST)
MIME-Version: 1.0
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
In-Reply-To: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 12 Nov 2025 10:20:20 +0800
X-Gm-Features: AWmQ_bk8d1h8tBpBrZUtGjow-hV3gnwT5P-EgH-CH9iaE3RQY3pwj7BwDScJKrc
Message-ID: <CAA+D8APHUZmP8qfta4=YL200hJkiikru8yQPddvBZyx-+-1ZtQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] drm/bridge: imx: Add HDMI PAI driver on i.MX8MP
To: Shengjiu Wang <shengjiu.wang@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	victor.liu@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, l.stach@pengutronix.de, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_182033_516210_ABD44427 
X-CRM114-Status: GOOD (  21.63  )
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

Hi Shawn

On Tue, Sep 23, 2025 at 1:30=E2=80=AFPM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
>
> Add HDMI PAI driver on i.MX8MP to make HDMI audio function fully work.
>
> changes in v7:
> - add back the mutex which removed in v6
> - add Tested-by tag from Alexander.
>
> changes in v6:
> - remove mutex in dw_hdmi_set_sample_iec958()
>
> changes in v5:
> - add empty line commit message for patch 7
> - remove blank line in dts node
> - add component_unbind_all when dw_hdmi_probe return error
>
> changes in v4:
> - separate dts for soc and board
> - bind hdmi_pai with hdmi_tx by moving some code to .bind() and .unbind()
> - add "select DRM_DW_HDMI" to fix build error reported by test robot
> - remove unnecessary code/definition in pai driver
>
> changes in v3:
> - add space and 'U' in asoundef.h
> - add more commit message for binding doc commit
> - add bitfield.h header for fixing build error
>
> changes in v2:
> - address some comments on commit messages
> - add two more commits:
>   add definitions for the bits in IEC958 subframe
>   add API dw_hdmi_set_sample_iec958() for iec958 format
> - use component helper in hdmi_pai and hdmi_tx driver
> - use regmap in hdmi_pai driver.
> - add clocks in binding doc
>
> Shengjiu Wang (7):
>   dt-bindings: display: imx: add HDMI PAI for i.MX8MP
>   ALSA: Add definitions for the bits in IEC958 subframe
>   drm/bridge: dw-hdmi: Add API dw_hdmi_to_plat_data() to get plat_data
>   drm/bridge: dw-hdmi: Add API dw_hdmi_set_sample_iec958() for iec958
>     format
>   drm/bridge: imx: add driver for HDMI TX Parallel Audio Interface
>   arm64: dts: imx8mp: Add hdmi parallel audio interface node
>   arm64: dts: imx8mp-evk: enable hdmi_pai device

Could you please review the above two dts patches?
Thanks.

Best regards
Shengjiu wang

>
>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    |  12 ++
>  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      |  69 ++++++++
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |   4 +
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  27 ++-
>  drivers/gpu/drm/bridge/imx/Kconfig            |  11 ++
>  drivers/gpu/drm/bridge/imx/Makefile           |   1 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c  | 158 ++++++++++++++++++
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c   |  65 ++++++-
>  .../drm/bridge/synopsys/dw-hdmi-gp-audio.c    |   5 +
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  18 +-
>  include/drm/bridge/dw_hdmi.h                  |  11 +-
>  include/sound/asoundef.h                      |   9 +
>  12 files changed, 382 insertions(+), 8 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx=
8mp-hdmi-pai.yaml
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
>
> --
> 2.34.1
>

