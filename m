Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56D8D5B841
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 15:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ord/Jy3WahxWv6+pZLQ5784ppmb+r7KH+dg1CMH4bX8=; b=rs10z6BVNFat+ot6xp4Zn5nndz
	v7REp1fYv13/3iD7A3aB2QMfM+y2pyGVYyEI4hKNUDk0jzt0SuNE9cP30MoAKpC48DfyXescp+G6u
	8hxiZcX9Pf+GMOJlfZ47EL1J7utVrEqqJXRLArefWvkUtcVLfQty7y8MzoTPcmPwP5S+Rk0KjR9qs
	dXZ74lTSIFpOdsWgHi4YhChFtS6QDKHFx3eHoJk7nbKceiO1qzM6alBY69BU9atV5xdIRlLwQBZNw
	bUvaIR0w4YoPM05xR6EVUSfjilwCv1V4CqBhFpA/8Sk1hSQMOSdRd66ra/i6BoNvjMNt5e4WZq1bl
	hrTLCkJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAkT-00000003uhR-1VoC;
	Mon, 15 Dec 2025 15:44:33 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAkQ-00000003uge-3zgt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 15:44:32 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-787da30c50fso35125547b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 07:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765813470; x=1766418270; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ord/Jy3WahxWv6+pZLQ5784ppmb+r7KH+dg1CMH4bX8=;
        b=QwTOLnxyPYYS3ATaEKUy1a3AOPPbs9grSbCHffq+5uvMte8BbEbuXjfpSWhY5ZPDKT
         98FoTu9iNiGETzWX/UydCZ3qecE8+9Bfj+0hIGXzHPhDJlQZO9yVo9Zidnwq4oyqhCnX
         XF54E9BMWW6if5np3/nH0uR5jyyClHVImnCzqI0V1wcVHgiZJxkuvTEn0VzuW3WLZprr
         Yvn3L55fUoCH6hlf4l8JyWyIgSeLgDw3Twy6/6vm2zbaIPzH/BIMs3caFTSwcoM0c0xh
         CRKFgNzE9vxPehH3QlwVA3Qwxo9DxialRsJEuKcgjebIO0uEqs3t7/Q/HFeEkig8zxQl
         KNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765813470; x=1766418270;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ord/Jy3WahxWv6+pZLQ5784ppmb+r7KH+dg1CMH4bX8=;
        b=BgDz4FcBBZ/upcGkXgYzImcbn5s5z10YgLytfQlKk/UKSMuWBzUxQ8WptAR05RnJKy
         x9OZn7g45T4nGzmPN9XUgjOUnEoRKNZFAwf0ErrqrJq2rOj6J03sBpbXsK6EWjBXOz7/
         DZL6LRqJ3HwRvnUzdCPfl+ailZBVsk/K2mruyBXdGxgQJvZ2C+8d11FhNfRbNMoIs/95
         wiXoeni+cQg2uhhLchpjmUfb4VgEvrpKRBQUKsZ7YJjoIA+aGofvF9N7NMyTZOc7yGDD
         6UGCpvpGYcx0uXUqZWANhAAB9oFf9e59QUJL7Rv9iBD+1zBZJ7V6UFn2HC4vJQZAHbzE
         xzpg==
X-Forwarded-Encrypted: i=1; AJvYcCX2xxredkQAjG2iiTFWjTpDbxh2WaYGo7gd6tNy9X/LaVlgGYFIASW4vn80NzhE/GeucxnkwHNQduYL9t3HlYZx@lists.infradead.org
X-Gm-Message-State: AOJu0YziW3UmIx2YwDLfGEzKAspOGMQ7rzD9VwhZt48Mt1aD55r8SVDZ
	qARktdudb8AgBbxepTK9rsfunXUKw2gI4DYrFn3y7d7YQI+BZTXsV9Vs+rKByXu0jSs494PrakV
	U1pgHaakYcOEsle+Gm2s1lh+SP9uCqCgSkd6o5ANvoYfP2zeDVTjq
X-Gm-Gg: AY/fxX4Sw/E0yEKXm1gJqzwTpQ9iK1cy1YTO0YtmvFKMVUCdDkjtsLWEGUGBDOnwkrf
	z/c+mLPymZlZCd3uYktoTWLrHiTRaKZUKRdGHQzZfF1r8v+Z65mPQylK2NGTiOoyelKZDKI/duf
	yrwQ+zSISqjLgH8b5JIltDG1xTzAo5uYIszVK++zL8gooMZJyr1N0J8JBCVnHTjheGFk3fyH0ux
	ClBaeF3cMmeU/SOlD/sQuG734hsXyMWc+SicdLD8RZ0lDZnuQxtaWeK/acvaafNwE6Q4TzQHc97
	wMSn+Zw=
X-Google-Smtp-Source: AGHT+IGxCBxLGLcpkIj+jez6ANmJ4exNQ8Wr/4dDc0WAdU190RCcv+pOqA12XWUdU8Vjc9SvszOHHjoOqEIbTFqx89I=
X-Received: by 2002:a05:690c:6e13:b0:789:2e24:b786 with SMTP id
 00721157ae682-78e66e070d3mr187460127b3.52.1765813469661; Mon, 15 Dec 2025
 07:44:29 -0800 (PST)
MIME-Version: 1.0
References: <20251211075603.533033-1-ziniu.wang_1@nxp.com>
In-Reply-To: <20251211075603.533033-1-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 15 Dec 2025 16:43:51 +0100
X-Gm-Features: AQt7F2qa6bOsFFPkIXDOILPIyziznpqvGTVPwjQsBL7LP2bNagwnbWCy9hfeguc
Message-ID: <CAPDyKFo4o=V9H-U+HBGTtog58=0QkDzepBR2HFqU7Giede8xAg@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: sdhci-esdhc-imx: wait for data transfer
 completion before reset
To: ziniu.wang_1@nxp.com
Cc: adrian.hunter@intel.com, haibo.chen@nxp.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-mmc@vger.kernel.org, imx@lists.linux.dev, s32@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_074431_001438_14ADBA87 
X-CRM114-Status: GOOD (  21.45  )
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

On Thu, 11 Dec 2025 at 08:54, <ziniu.wang_1@nxp.com> wrote:
>
> From: Luke Wang <ziniu.wang_1@nxp.com>
>
> On IMX7ULP platforms, certain SD cards (e.g. Kingston Canvas Go! Plus)
> cause system hangs and reboots during manual tuning. These cards exhibit
> large gaps (~16us) between tuning command response and data transmission.
> When cmd CRC errors occur during tuning, the code assumes data errors even
> tuning data hasn't been fully received and then reset host data circuit.
>
> Per IMX7ULP reference manual, reset operations (RESET_DATA/ALL) need to
> make sure no active data transfers. Previously, resetting while data was
> in-flight would clear data circuit, including ADMA/SDMA address, causing
> data to be transmitted to incorrect memory address. This patch adds
> polling for data transfer completion before executing resets.
>
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
> Reviewed-by: Bough Chen <haibo.chen@nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v3: add define for timeout value
> v2: amend commit message
> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index a7a5df673b0f..97461e20425d 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -216,6 +216,8 @@
>  #define ESDHC_FLAG_DUMMY_PAD           BIT(19)
>
>  #define ESDHC_AUTO_TUNING_WINDOW       3
> +/* 100ms timeout for data inhibit */
> +#define ESDHC_DATA_INHIBIT_WAIT_US     100000
>
>  enum wp_types {
>         ESDHC_WP_NONE,          /* no WP, neither controller nor gpio */
> @@ -1453,6 +1455,22 @@ static void esdhc_set_uhs_signaling(struct sdhci_host *host, unsigned timing)
>
>  static void esdhc_reset(struct sdhci_host *host, u8 mask)
>  {
> +       u32 present_state;
> +       int ret;
> +
> +       /*
> +        * For data or full reset, ensure any active data transfer completes
> +        * before resetting to avoid system hang.
> +        */
> +       if (mask & (SDHCI_RESET_DATA | SDHCI_RESET_ALL)) {
> +               ret = readl_poll_timeout_atomic(host->ioaddr + ESDHC_PRSSTAT, present_state,
> +                                               !(present_state & SDHCI_DATA_INHIBIT), 2,
> +                                               ESDHC_DATA_INHIBIT_WAIT_US);
> +               if (ret == -ETIMEDOUT)
> +                       dev_warn(mmc_dev(host->mmc),
> +                                "timeout waiting for data transfer completion\n");
> +       }
> +
>         sdhci_and_cqhci_reset(host, mask);
>
>         sdhci_writel(host, host->ier, SDHCI_INT_ENABLE);
> --
> 2.34.1
>

