Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE194C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 12:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHsufu+SF6+BkfAoJdbGGEtsqtE+xN15rWNgtA6qUrk=; b=gra8T1jwGTMTUjcJHktb5K2l+P
	Yj7PvuIdNSPrq0QO0IRB5oRuQdN+GmAi8ycbcAFwbw4RYUr52Wo9Qv+pmzi3J9JgMkyvrZTjX8krM
	wBeR0aNWW/HReo8xInEEfQYxMxHAwjJT7/tpy+0P+T+sEkc8iNzpasJzLLgHwrxlGmESTw3b3mbVH
	PX0h4COZVM9CCrEz6pLkUH9a1ZFqmblrL8LvihXHjcR7psfhYzz1eFYBnKiT8o5JAt80W0lIcjpX8
	gEnNCLwA5uV/gsdHWHd+a6OPwziGp6OMmpBsef5LFoivE9v0mQfPWW7kkvztFWhNjDDj5N/GBuDdj
	04Z4wTVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzsX-00000009CAh-2l7d;
	Mon, 19 May 2025 12:46:01 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzfJ-00000009A1B-3Zun
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 12:32:23 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e733e25bfc7so3785588276.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 05:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747657941; x=1748262741; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vHsufu+SF6+BkfAoJdbGGEtsqtE+xN15rWNgtA6qUrk=;
        b=kTpY6nnG/5MT70k28Y0VE+rj+s6g2TyiqZ7ibu970WGV0AVK9IvHOCMeus3vK0yjlq
         UxPdrB0NRk3bTLnKfG9IVu2b7K0QQDPREJKhuXAYgeH83Yb4W6Z6X2zazqC0xOhNVdXq
         6zBGMXQAWa0Rwj/zgA0cZQi1/FmuCUryIaElPB0pUvCWIyI9sDq02XF2FqNGMfkZMYu4
         JaaQTJtGwR/DQEt+qON8gX/vmCttm1dppU8UMUnR94YhH4mYP3m90psWk7E+3aHFdKTo
         eNmOfRdGNmO1BkA1vlRry657uZT80XrFfPXd3BFV4ir0xLabVCrrieIrObOJcjfbPw+b
         vZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747657941; x=1748262741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vHsufu+SF6+BkfAoJdbGGEtsqtE+xN15rWNgtA6qUrk=;
        b=meSfIzZ+Faw4foIVcm/fk3FQFsk5k1vtB/JurdRYnPoJGcDfe64ZgTMhEkkzTtlB/f
         x2yA0s9H9Vx5R9/ohaPcaQyb2lCNrmFvx6ek2ZnsHT0JVt5v5ZtL/Fc85JEF4QE1IAYR
         1AdhsGTwoGg2WHbSsBbA6VO8iC1h7netlv4swQcrp5duuGWrmPOKvjDwAWrGEG+OWPBu
         LAT0q6RuvE4raRPo+9WeI9EQZJduYgH7bz6O0ex9KqjLS4cghSXmhVbI+WK4tkzoyvnM
         MFAkTuiHjyQAqtf6hqf0/RN4y6lGY//GlIXgUsWAISioCKK7iQFaskNUaREpk9u+bAS4
         3jbA==
X-Forwarded-Encrypted: i=1; AJvYcCUi9l6YWY4NzYO7kpCm+yFrfBqEDugNtP0I9gmWVNeEOs+KLJErh0nQSTQTzKIKsHrOpg1USWm3U6RqI6pIsW+M@lists.infradead.org
X-Gm-Message-State: AOJu0YxMSoraefu+3jSekLKEm8axv3SdzC9ujHO4fxfWS4grFj8JdTsm
	iCF9m6vvDDFxLqlGMMkxG1k5l7O71TbRpsCGMoGi5Y0WwH/7xoge+eAav4g4QiTXb/uLP4kmgwy
	x0zoMxheiEoYbY/5G2u2jQXrwSZRCFb5sPBHIiCdGcA==
X-Gm-Gg: ASbGncuBiPcbyD+P6724SqG2POKQPv/IwHjpW+WBXHUBzrkUV20rnV1r+zwaEIXC3GH
	VQ+mbmwKUz6GfE4rg6dz2+CblyZMg3CW4F2lruMLvaNHK4cG8a3SwtrvBRaAT8j3xunPo4g8lNm
	aEvPFwF0f7utLF0ql+OvWlOG/4WlRb13H7Gg==
X-Google-Smtp-Source: AGHT+IGQJih7ABrJkyHXOxVQqXeWFy+8tRFAAwAelY8XbJK42oN2ccbF+YYkI6zd7QDW809w0lHa6Kx2D4jNl++RLr8=
X-Received: by 2002:a05:6902:1201:b0:e78:f901:6074 with SMTP id
 3f1490d57ef6-e7b6d39c8e6mr15228387276.5.1747657940585; Mon, 19 May 2025
 05:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250516-b4-usdhc-v2-1-3fccd02f5602@nxp.com>
In-Reply-To: <20250516-b4-usdhc-v2-1-3fccd02f5602@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 May 2025 14:31:44 +0200
X-Gm-Features: AX0GCFu0noKnxB0Y5FfzLidgfrO3RarPEU6zn_6BF2jOJDmCis2kwv2FoOkskmk
Message-ID: <CAPDyKFrknTGmptb4K28eHtELEdu_7WXtJwV5L5zyxfzuGeR5WA@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: sdhci-esdhc-imx: fix few build warnings
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Luke Wang <ziniu.wang_1@nxp.com>, imx@lists.linux.dev, 
	linux-mmc@vger.kernel.org, s32@nxp.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_053221_890453_85E16257 
X-CRM114-Status: GOOD (  19.09  )
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

On Fri, 16 May 2025 at 09:44, Haibo Chen <haibo.chen@nxp.com> wrote:
>
> drivers/mmc/host/sdhci-esdhc-imx.c:1566 sdhci_esdhc_imx_hwinit() warn: inconsistent indenting
> drivers/mmc/host/sdhci-esdhc-imx.c:1251 esdhc_executing_tuning() error: uninitialized symbol 'target_min'.
> drivers/mmc/host/sdhci-esdhc-imx.c:1251 esdhc_executing_tuning() error: uninitialized symbol 'target_max'.
>
> Fixes: be953af79cc6 ("mmc: sdhci-esdhc-imx: widen auto-tuning window for standard tuning")
> Fixes: 541a95e64d76 ("mmc: sdhci-esdhc-imx: optimize the manual tuing logic to get the best timing")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/all/202505160225.Csr5USfq-lkp@intel.com/
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index c0160c69a027826c4099c9bcf82cd4d83f1113fd..741db169f44d9c9c1e5e1dee591b72221fa1e2b9 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -1216,8 +1216,8 @@ static int esdhc_executing_tuning(struct sdhci_host *host, u32 opcode)
>         int win_length, target_min, target_max, target_win_length;
>         u32 clk_tune_ctrl_status, temp;
>
> -       min = ESDHC_TUNE_CTRL_MIN;
> -       max = ESDHC_TUNE_CTRL_MIN;
> +       min = target_min = ESDHC_TUNE_CTRL_MIN;
> +       max = target_max = ESDHC_TUNE_CTRL_MIN;
>         target_win_length = 0;
>         while (max < ESDHC_TUNE_CTRL_MAX) {
>                 /* find the mininum delay first which can pass tuning */
> @@ -1591,8 +1591,8 @@ static void sdhci_esdhc_imx_hwinit(struct sdhci_host *host)
>                          * wider, give auto tuning enough space to handle the sample
>                          * point shift cause by temperature change.
>                          */
> -                        tmp &= ~ESDHC_TUNING_WINDOW_MASK;
> -                        tmp |= FIELD_PREP(ESDHC_TUNING_WINDOW_MASK, ESDHC_AUTO_TUNING_WINDOW);
> +                       tmp &= ~ESDHC_TUNING_WINDOW_MASK;
> +                       tmp |= FIELD_PREP(ESDHC_TUNING_WINDOW_MASK, ESDHC_AUTO_TUNING_WINDOW);
>
>                         /* Disable the CMD CRC check for tuning, if not, need to
>                          * add some delay after every tuning command, because
>
> ---
> base-commit: 484803582c77061b470ac64a634f25f89715be3f
> change-id: 20250516-b4-usdhc-bcd8cea08ed6
>
> Best regards,
> --
> Haibo Chen <haibo.chen@nxp.com>
>

