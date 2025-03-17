Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4B3C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 10:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FX4+nDjPa97pvqp6xc2jGfEChrIN3m+xL1+vCvUQBXc=; b=rM8kY2n2LhwcHCqo+I2a1AdhSx
	TUKBzzJ30bwt/m17Y5WErSZ2pG7UPZIuls1x5DKaC/mM2PGrG8dkPCZJcLKaVO40VHHrD0/S7P2fT
	8tyDjV6fiWfhQ6UdsjVFRbSr5VD6WsDxdIrHxovBS5ZabS5RUQVTOnrtQ+0mc0P6bQ+40XFvV5PWj
	AooCcyYgUr6D3Yu0mxWYyzy6YILt5wGnYn/AagNoJ98jZQeljsZvTdPwEOVWlhRWBRrouqgfY6Q/G
	0TxPbg2+VS0cE0Z12oD/qZUStuBwIRyxmXjfckM2Gn/TjW4XGE+tXcblBK991ZHqHapmIPkwbw2FO
	9Aojb0Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu87l-00000002GpO-2s5K;
	Mon, 17 Mar 2025 10:55:13 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu84b-00000002Fx8-03ej
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 10:51:58 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-6ff0c9d1761so36688437b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 03:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742208716; x=1742813516; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FX4+nDjPa97pvqp6xc2jGfEChrIN3m+xL1+vCvUQBXc=;
        b=qr5YdhfDKK0tqiD8FQp+XR7dFZw7WDkHzPNJXRssbYQX+2IYRFLDjDHk5Qr11tVDQZ
         +poy83m1/re+GQlDYv0LaOa+0Y7U+6vDCBR29QO1bWxZtO8WLk3OgH+j35DFrCE7/00X
         9kUHJpwtwI4TI/xPVANoBkEqTDl8IvkPmEYx56Gylu1fB6a/AMi91mc5/cJytaHBGQfd
         5XINXjrUEAeKq4wDMpUltJlP6oIgwi4P1hxGUl4ubojvAxw5tM2iV52OfBYushwZaXzV
         0QxkBWgFZ8P5CbifO2CE2+VAKjd43SZYblgOp9TWaE4AJm8p8ncR+vqlxs09slOGuU1N
         vQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742208716; x=1742813516;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FX4+nDjPa97pvqp6xc2jGfEChrIN3m+xL1+vCvUQBXc=;
        b=NdeHksLmL4oEGJEkJlowSRMuPlEQlxZKf8c/iSjaO+TqkOUUA+esNF9/tlE7YBwyLZ
         Z/hu1zMSKjOXK/hWoneSfWZe63v3GT+S7Gq8+InNLJhAYB0vl4Y9GiRRCmgcHBYf63jc
         0pRD1ARMz2C/J1S+7fkyL/cm4Pcp/0SOTJJRo8Js9zbGsTM+cv3lHFIs0B4D4ogwsZrn
         udnsXwVYVSDg0WjQURTQNDqqgi2qFF6Behru8vGwqBZ5wBkQcHKh7bW77CNGLkZMIfkk
         rD3tKvg9a04zffJbktV7Q2L9UHltq0Sf8Zbpx3/cm3LEUZqGdu243E6etm258d7FVfI1
         acQA==
X-Forwarded-Encrypted: i=1; AJvYcCWx56i3C1IwYYC3opisfES1KzDkI6r5+X3b/3L8hR4yPLjIKACZfzq9XSEFd81j0/7qgW3kMYeuLSezZ2enWdnG@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7rZF3bR7vdikFLcMCLPXuzByj/DNnJQBChw0NHhx+LT7MSHoa
	8eZpaUC4Y6fwXO7oU983zZoEdyyALAT9v89AMZZvVzAHBNmyOJCuo64Bnhhp1ntIm9hbP5oqj9C
	0ilZiWw8To2cqz0KqoPcZrUPeoSNYsV7u7EEriw==
X-Gm-Gg: ASbGncsxk1fQUUzJdw+HoT5kvpdNaqVgNQMA0rquIzF87XgsvAuoDiEmyXlF3vYulUA
	77xkXc0o4d64E3XUYcb8GO914G5fhkM/b3+J0dd9OGMmaDDNeCyvHzhp59U5UKWibSh5rN+YxYD
	lxvSSRtVRAbbrqukORpdEXpeLp3S0=
X-Google-Smtp-Source: AGHT+IFZ/UCb9MAufxXsxDOXjmjeGY1kTReIoU2wd9M3G+bvTRZCBrdHJdToart9NFB/Ee7YBzyERYwjT+84mB4ubDo=
X-Received: by 2002:a05:690c:48c4:b0:6f5:4304:fb8 with SMTP id
 00721157ae682-6ff45ef2016mr162355087b3.18.1742208715994; Mon, 17 Mar 2025
 03:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250311165946.28190-1-kamal.dasu@broadcom.com>
In-Reply-To: <20250311165946.28190-1-kamal.dasu@broadcom.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 17 Mar 2025 11:51:20 +0100
X-Gm-Features: AQ5f1Jr1xpf9ZmYsy9fSxESDDI1HTBIwGCZnYOTiOa6oMo4jyXPgFf1L5kdmj9g
Message-ID: <CAPDyKFoDh-9L49Yh+Xv10t9Dt_Vyvn7dGCb5dKV0RiNJi5aoZg@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: sdhci-brcmstb: add cqhci suspend/resume to PM ops
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: Al Cooper <alcooperx@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_035157_053708_705D2FCE 
X-CRM114-Status: GOOD (  17.81  )
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

On Tue, 11 Mar 2025 at 17:59, Kamal Dasu <kamal.dasu@broadcom.com> wrote:
>
> cqhci timeouts observed on brcmstb platforms during suspend:
>   ...
>   [  164.832853] mmc0: cqhci: timeout for tag 18
>   ...
>
> Adding cqhci_suspend()/resume() calls to disable cqe
> in sdhci_brcmstb_suspend()/resume() respectively to fix
> CQE timeouts seen on PM suspend.
>
> Fixes: d46ba2d17f90 ("mmc: sdhci-brcmstb: Add support for Command Queuing (CQE)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-brcmstb.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
> index 0ef4d578ade8..48cdcba0f39c 100644
> --- a/drivers/mmc/host/sdhci-brcmstb.c
> +++ b/drivers/mmc/host/sdhci-brcmstb.c
> @@ -503,8 +503,15 @@ static int sdhci_brcmstb_suspend(struct device *dev)
>         struct sdhci_host *host = dev_get_drvdata(dev);
>         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>         struct sdhci_brcmstb_priv *priv = sdhci_pltfm_priv(pltfm_host);
> +       int ret;
>
>         clk_disable_unprepare(priv->base_clk);
> +       if (host->mmc->caps2 & MMC_CAP2_CQE) {
> +               ret = cqhci_suspend(host->mmc);
> +               if (ret)
> +                       return ret;
> +       }
> +
>         return sdhci_pltfm_suspend(dev);
>  }
>
> @@ -529,6 +536,9 @@ static int sdhci_brcmstb_resume(struct device *dev)
>                         ret = clk_set_rate(priv->base_clk, priv->base_freq_hz);
>         }
>
> +       if (host->mmc->caps2 & MMC_CAP2_CQE)
> +               ret = cqhci_resume(host->mmc);
> +
>         return ret;
>  }
>  #endif
> --
> 2.17.1
>

