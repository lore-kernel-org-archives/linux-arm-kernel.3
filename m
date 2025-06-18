Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6F7C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 14:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0yNglyrMOZ78JyNR9Sp0rHahct09b8RGeUMHfCfYXs=; b=RxXSdcmjuBcc98FlV3iP/XKiv0
	CazW0PyWXmI9wcSQBFf8R31pW5PnWRgVM4KRUgp45hnhnpqPU6BnXnnB1VunUUrToUEose/eI/Y/R
	kpEq2kw/OCYAu1Y/eP1L3rNM9qJkQShDQKX0IdYOD3rYBggsVvjkz/M9ko/MOPl9cCwMr/DNJSAjD
	cP1vzzEN6y+nYph54VUeW6luR3ZIkC/0jhpNg/sq6FcSmr93w5INaS8jcGu98ujGHSaZuU/zo09ZK
	xX5tAsT4Wz60/fNsCdfgBTNL3nCGxByc/R79CTmD4kJzDkFLpOErXfDd0Kl06snqX0mNaro2j0Hhz
	O4VXGboA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtws-0000000ATDy-35LF;
	Wed, 18 Jun 2025 14:39:34 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsLe-0000000ACW7-2yMn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 12:57:03 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e82323de932so4110338276.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 05:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750251422; x=1750856222; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0yNglyrMOZ78JyNR9Sp0rHahct09b8RGeUMHfCfYXs=;
        b=MQMuQ/5E3kEYD/Ulqh5Za8BxWOf/yrY/zbYVOg39O35Ow3lG9LEzsWtSWt8+kY/wK1
         op8T2HkwUzYQecBR4K6HQUr9GITmakD6tymjrPc/jjmOYQm1hhxnKVINsBDWaMFoprMU
         eKuEJ8F5joIGmxLpFXbQEiDnwStlJeU781PM5Wco3F11FbqU5fTk5Mi5lYcS+cR6iJMr
         9e93xliur9Y1O6z7A81dkYYZB+q5xBlkJnu2E1HbVRfvXjhXa+2kqZuYYo4/utmsphzR
         jVe+dJw1oj1rXqBFOWWuCFa8rqh5TXQeo68od1aXkgahj2sqQxRTc6aONkr8+b9Hp3O7
         eVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251422; x=1750856222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/0yNglyrMOZ78JyNR9Sp0rHahct09b8RGeUMHfCfYXs=;
        b=PmXlzwoa2nGl/83bheQzgKesKS6nUYae9GBb+AR0H66UmUOHX1Wd+HMKv3pt5jLgGO
         n++N/luSwmtXHIiJjFbH+9MHnJBXpvS3N9c5f3o+BH4NjZzhvEmo6UL1K1qnCh+tAO1s
         cCpGgNNgsClYXR7zZQOeS0JLzksiFeOX6AY4q3RmBypbXvW2Asy2CzY176aw70Z0CYa/
         mY2u3+m9ASMRaM0MKZnaD6iYYk42mbjbLOCKKiDCd+DlO6eeWBLoB9njSU8tF86qVdj2
         ay7o8O4CxRRf0bz8bWriJ07Uv0jILiGvfLBK88f3pT3R0JYeE8gQAO/apTL4s7G95m1k
         YdZw==
X-Forwarded-Encrypted: i=1; AJvYcCUDxM/SmQ9HFGGyG6rmpmgIkINNDIttHncydka0wTyDcZ8WDJS1+Ln/t0AwKN7FzoK7WIVKubnS82d1e8Xc9qit@lists.infradead.org
X-Gm-Message-State: AOJu0YxLRt9EDDRpRQbV9kuVgvuDYCGq7tw0eBpANjwWGQJngRhfrL7q
	qamFiHfZKtmyHKbQS7nc6UGmbWo9TjONv68eCScfy5U2IBm1DvBHQM5rOvQQokcym/kdhhsE2Nr
	b2n25zJ1+N1G5mxk11qvRWccLf3SD5/Gw5k5PILQr6g==
X-Gm-Gg: ASbGncu0MlKjNAnrNNdlnIAfYsAf8IJqh8ZkCW8b9Y49BTZax3YWILh94ooPCVnyEOH
	M2T3vIzU/g2xhzjyuiROZ2+PHms1WxIEWNfP582AX2l2l7A7WExvlzUUVLDmb4rGd13WXewMKSU
	Gnpf1+tT91FJebpMkALdWMOmRzvnGCbEF8shDCWTUNbzo=
X-Google-Smtp-Source: AGHT+IGKJ/9nezM0CjL8LTlmXkuqqs1XvYRULfznlZkJ00Zas9fy/8SeNVFH78QNFQr9m4QBfV7T9IMSOGKFGfTViCA=
X-Received: by 2002:a05:6902:100d:b0:e81:9aa9:88cd with SMTP id
 3f1490d57ef6-e822abe0669mr22502028276.8.1750251421799; Wed, 18 Jun 2025
 05:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <m3ldr69lsw.fsf@t19.piap.pl>
In-Reply-To: <m3ldr69lsw.fsf@t19.piap.pl>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Jun 2025 14:56:26 +0200
X-Gm-Features: AX0GCFt2trdH5lvp26KlouAeiTYZ2alEevH8lFXOfNjGnwSoGAScAqPAkE83GxQ
Message-ID: <CAPDyKFo_oTWWX-PNNA_Dpq0fjbmhzoLCgd77NfDO=Q_JZ8hZ-g@mail.gmail.com>
Subject: Re: [PATCH] imx8m-blk-ctrl: set ISI panic write hurry level
To: =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_055702_744111_CB725430 
X-CRM114-Status: GOOD (  14.38  )
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

On Fri, 9 May 2025 at 11:26, Krzysztof Ha=C5=82asa <khalasa@piap.pl> wrote:
>
> Apparently, ISI needs cache settings similar to LCDIF.
> Otherwise we get artefacts in the image.
> Tested on i.MX8MP.
>
> Signed-off-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>

Applied for next, thanks!

Kind regards
Uffe


>
> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx=
/imx8m-blk-ctrl.c
> index 912802b5215b..5c83e5599f1e 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> @@ -665,6 +665,11 @@ static const struct imx8m_blk_ctrl_data imx8mn_disp_=
blk_ctl_dev_data =3D {
>  #define  LCDIF_1_RD_HURRY      GENMASK(15, 13)
>  #define  LCDIF_0_RD_HURRY      GENMASK(12, 10)
>
> +#define ISI_CACHE_CTRL         0x50
> +#define  ISI_V_WR_HURRY                GENMASK(28, 26)
> +#define  ISI_U_WR_HURRY                GENMASK(25, 23)
> +#define  ISI_Y_WR_HURRY                GENMASK(22, 20)
> +
>  static int imx8mp_media_power_notifier(struct notifier_block *nb,
>                                 unsigned long action, void *data)
>  {
> @@ -694,6 +699,11 @@ static int imx8mp_media_power_notifier(struct notifi=
er_block *nb,
>                 regmap_set_bits(bc->regmap, LCDIF_ARCACHE_CTRL,
>                                 FIELD_PREP(LCDIF_1_RD_HURRY, 7) |
>                                 FIELD_PREP(LCDIF_0_RD_HURRY, 7));
> +               /* Same here for ISI */
> +               regmap_set_bits(bc->regmap, ISI_CACHE_CTRL,
> +                               FIELD_PREP(ISI_V_WR_HURRY, 7) |
> +                               FIELD_PREP(ISI_U_WR_HURRY, 7) |
> +                               FIELD_PREP(ISI_Y_WR_HURRY, 7));
>         }
>
>         return NOTIFY_OK;
>
> --
> Krzysztof "Chris" Ha=C5=82asa
>
> Sie=C4=87 Badawcza =C5=81ukasiewicz
> Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
> Al. Jerozolimskie 202, 02-486 Warszawa

