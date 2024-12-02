Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5478D78321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 15:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZdmxpNfvpO1w4hAAEKWGZSvaKeExVY5BF0241uhp8o=; b=cFBbx007W5cwKThFYfe709BSZ6
	tcFs+aDK1zxjdMuhtaLRPZL6ualJLOehQ6wPzMkmKtFRzNe8v1ZCi+Bc0xGYfb9+kDEqu1wFAQixu
	z1e5zfkvNWY6m8cbsGf7lt8/DLEFM9NVdxITEwfeaD//Udl+QSjqh6P93Igxb/ngtBHtsU+VWRBrd
	Aldz7zAKSFRPhZhsXxmqWluRJ/tnsN23/2tOWT0Zs5L1ndDc/z0OPsBIK3b883rAOdnL295iR/LgY
	9Qdf9K1d/0eBJWXurJI+vf5rqsN+iL+i30fvR2D29sIfYcgrI45Ci3g+2r3kO/G4Hdy5WNx8sAVtA
	FF+GDNuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8JQ-00000006eCg-3re3;
	Mon, 02 Dec 2024 15:26:12 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8Hc-00000006dm0-0CvR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 15:24:21 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e396e33d47dso3815941276.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 07:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733153058; x=1733757858; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vZdmxpNfvpO1w4hAAEKWGZSvaKeExVY5BF0241uhp8o=;
        b=vz0LpQcBWCb/qEYGNO3niJkcB2nGba5aAFATvegnZuGLAdVdAKZyxXgFSSC7Zjk1S1
         3awExIWMk9AN7mjU/tMN5VQJ/SulDmMvCciTYbhrP2QbSSujiXvm1sX6wLYo5lM3TvlO
         vyu783JKS1nM4wLLjoupGI2+8gzxM1wJklTGb0p52hE0GPTax4hMXw3YkOHg5XsjIxko
         quDM70gatoiC6vZwW+Vp8bwe8phGSxIc4HCnnLOG5LEZ0cAFOMuS0lIh/6kmoKD3knvQ
         xynclVvlj5Eki2EoW9g4TLV3eZQKyNzzHnMKieRfKybH8KtD0kSVUHKi4ul1pELrW7tE
         qWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733153058; x=1733757858;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZdmxpNfvpO1w4hAAEKWGZSvaKeExVY5BF0241uhp8o=;
        b=BNm4duJ5ujlR5YMseqgdmpX67cb9SYXARW5rFRPVeDh0yMtg5fwA2R4vk0/GB0PWKF
         yZmKeUNRDls9uRjh7u3q29GIJ2Mye4cnoBGKlAS9UNmZMNnuHiN2Fjq7vfbVWc8d8ris
         As/c9IbQkOBch84+PwAmRYWY2xuYvVMGBXs/dCgLH9FZw8qaucR92pCniKN0YHlsgL/I
         448LMgi8/Z7Uyo5Jcrm0DoFGQ9s9gYQrX2KF25rDIBeYcIJdlrVUDqqvAnDkni6l1H5R
         tdaYLMrj9IMLTxMV5sHvnxA+RLnQ7cQl39uPFycMZG4v/wKq6wgVMoUoF1UoThNLcQgJ
         zjYA==
X-Forwarded-Encrypted: i=1; AJvYcCXnqlH9UA2MkSd7su+5HlR4TDAuDokakvnwNas6gb+5q4/0A5T+arvSMzA4u0bHe7stxsYDgy/cKY22bMdIkQqU@lists.infradead.org
X-Gm-Message-State: AOJu0YxmLmnSLefAqLTWIyMCDw+7Kf6ywlcfoE6KvGBS9oKMvYcjH36i
	coGycppxXvpyytJJGm3cTVk4olISv/JaoJ0eKszZRU3keEbafaY09P8Icwf/3BC7bH2O6dvgB83
	Q0tOuyKFW2/uWGGbrlCai2lqQ77l2pqNeZ1eLCw==
X-Gm-Gg: ASbGnct7axp1V0aCrzEFX3zvqKoVcpvXlX4+ZU1tJJRh5zzlHZZytql81VeJwOtZkzS
	zAB/pj51MMSgv5pJS3oUmyS6Ilkk+UYq4
X-Google-Smtp-Source: AGHT+IFOFC5zPUF0itgIKsAUHr0BlLtuJZtIXZEze3rfpOri9Ohtmk1VeC2LzJL5dOFw7QQghHYnT6Ig09tgFYZXMYk=
X-Received: by 2002:a05:6902:18c1:b0:e39:8482:5d5f with SMTP id
 3f1490d57ef6-e3984825e68mr13245250276.46.1733153058435; Mon, 02 Dec 2024
 07:24:18 -0800 (PST)
MIME-Version: 1.0
References: <20241125083357.1041949-1-ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20241125083357.1041949-1-ciprianmarian.costea@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 2 Dec 2024 16:23:42 +0100
Message-ID: <CAPDyKFpkSRmGhZ68m7TyQNSqYKa7gnHigKpu4nKOpb-HWfCdeA@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-esdhc-imx: enable 'SDHCI_QUIRK_NO_LED' quirk
 for S32G
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Haibo Chen <haibo.chen@nxp.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-mmc@vger.kernel.org, s32@nxp.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Christophe Lizzi <clizzi@redhat.com>, 
	Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_072420_088515_36458D93 
X-CRM114-Status: GOOD (  15.44  )
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

On Mon, 25 Nov 2024 at 09:34, Ciprian Costea
<ciprianmarian.costea@oss.nxp.com> wrote:
>
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> Enable 'SDHCI_QUIRK_NO_LED' quirk for S32G2/S32G3 SoCs.
> S32G SDHCI controller does not have a LED signal line.
>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index d55d045ef236..e23177ea9d91 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -304,6 +304,7 @@ static struct esdhc_soc_data usdhc_s32g2_data = {
>                         | ESDHC_FLAG_HAVE_CAP1 | ESDHC_FLAG_HS200
>                         | ESDHC_FLAG_HS400 | ESDHC_FLAG_HS400_ES
>                         | ESDHC_FLAG_SKIP_ERR004536 | ESDHC_FLAG_SKIP_CD_WAKE,
> +       .quirks = SDHCI_QUIRK_NO_LED,
>  };
>
>  static struct esdhc_soc_data usdhc_imx7ulp_data = {
> --
> 2.45.2
>

