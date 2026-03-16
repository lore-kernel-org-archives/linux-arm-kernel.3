Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0487F53D69
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 15:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Gq1eBaEcIEjNH/OfJcPwaRMPgUoxIYY1WJRFUp5FfU=; b=YRLfv9VC3KysbWU/j28CjuK50d
	5sSDJB+fK8OvvIzOjHckC2NN/w3JzREdiGDav/K9Em1EPtQuy3dDp/h8tLHheYKLDYjmipiloyhM9
	f46oX32EQh0e+ZOeDErhQcscTKXw96+I6G1VGAzLuVHvAGFQbeDiLHjWpPFc/B383hFQkWITRSgCb
	fph6HEGf5v8Sq8izemf2OeoNz+FB+Fjln6my7EIRhd5tzZHCyubqqLzuKwNFoonvoIgG6zagtNnyd
	CnW/2/ABmRFSGpTgzmxenng0A+ra2i379mNWh0sc+ZJk3sujrww0CWicChMeTEWHPiVEAeCfO92u5
	B+qE5e4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29g0-00000004J3c-3MEo;
	Mon, 16 Mar 2026 15:16:16 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29fx-00000004J23-0dLr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 15:16:14 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-38a3066b68bso42758291fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 08:16:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773674171; cv=none;
        d=google.com; s=arc-20240605;
        b=AtcCCctXiPUQzcYKxypu59pYwSGlJY7+9l1f0/XKBDFRqBmW0vqdcGJgd/VKWSup7h
         RCohiqjXVRzv9A2UAuPR7lQtrSrpBEyIMmaR0rUDDir3OsGZWi4i0t3QM4ep0+gC83PE
         BktSGgcHisrt3vDs9qwGMMzcflwwWbuI0yJH3FXbPTjjltlkq0NMxKzqIQvTcBp1ShUK
         jWkU6vxwx2D5Vdjbfn/WJ37DDSkyPFK1aE1jqwijBLK56WYAfe1vCrSFEICpCw77Vdrf
         RYYWwfzcHqCeqvlP9WBbFFs5+VlBISoKmWXQB1V9XAaGE72rkrmd/szmwweYHbgvmtnp
         VLew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9Gq1eBaEcIEjNH/OfJcPwaRMPgUoxIYY1WJRFUp5FfU=;
        fh=Q/zM2qLu80k+3GAqXMPiQI4mXZeQjiwBby5xzuaJDA8=;
        b=P8sZZrzA0iJVzeXn8eKD1/RGv/mrZfQ4rcSWCB6Q1NWFRZlUJTpMgyJPbdWvHV7FCT
         2bdbW5p1BSrOu/Ks1G2q50eifScoGeNYEWPicD5gRLLCd2eKb1GES72uIUaCgmMy9np8
         w7Wv0BvRosF4RAeAgKjG9maBmwDAQrZEMbmCgVCRiJAcsy5IiFVIDxfJcRwrbtcE20sB
         SIoygIsnxf648TCYI/CDwx4n5BEpLA6vBlducOYG1dHMxXyHYbh2za8CHhq3kB82Uuwn
         fMxWhsg+5oGubI3nRyqcJJcRPc3gJQ8dqgjUjg/GlRYCvntkb0ZR7iYDVYjdISEcR5+L
         xHyg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773674171; x=1774278971; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9Gq1eBaEcIEjNH/OfJcPwaRMPgUoxIYY1WJRFUp5FfU=;
        b=xfy4fqD3MK6x1mesqyLomDffUZCk3HtfwFvsdk2hBhEIltfkbUt4WHkZGu+QRMfyJo
         BadpQ5pnrajnHx0VY8lHJLdTsYoi2GciOaAuRfqYlLcVgfNZRXxnO5Gjq5/92+r6OHsl
         X8md8tUVNO0WQP/84LstOQnAt8CfmYOpuY2p/6muMaYHz7Cz45iEgDMAwQR/IazQGjmt
         1qDCDjEiFxfrhSwnjSzRl1H9O9lbWFHSmoDtEhh8OJbjUrG5jZ76dx4f+UOi3YfrbB/Y
         4NWhY9l6busiMcUT+cS+qTKY0PMwLidCQ0UQqaJqnHZ2dQrafrWGPc2/bE+rWwUwzJPy
         bNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773674171; x=1774278971;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Gq1eBaEcIEjNH/OfJcPwaRMPgUoxIYY1WJRFUp5FfU=;
        b=R89FUkh2W+nu2guwlpjLhlUiO8sBQOAqrPAPNjb1yiS4L8/PUa36j22sbOttBrTHrD
         uOqKKA1nt6FRbx+3nmt4ALaKOffjJtaT39r+v7WJxXhOxKA6zJ2rTxP2YpeTN0zLKgEq
         DifXKEg454GAWad2lNAUdQ0p3V6XfgMYJzttRL8foinapKZOZ37sBsWcNJhm0PZS0KXu
         3bsC5HJfytsswk1uNnZ9K7VyZBwsWuxdnVMHyAKk4JfafkD70OO43OlWGgnWZ09Y2KYz
         aYVxqS/CBtxCHFfD50lt8tblEUoQug3ZBqLckbBQ3STj+rsTadPPf2Wb3+QpoVe3566D
         ClCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeHF1oNRHHvB/wzZf5bOcQR0KjbLeQ1Tw7j6x6xUq4LlJhHLnP2JENFSTC8+Zy0mzmI1cqXt85D+1JxLrS/mMB@lists.infradead.org
X-Gm-Message-State: AOJu0YwY6ZFGSxlema+yniCjLhZVQzV266oCxOJE9gRzevuI6JKD8VC8
	iVv/FHHgL4B5DqT3hutnF0B4Fhu4yLxoVzk4qGtomesGa5HkL8B/HdHHQRTgL4gi8CmTV0zJoWg
	0lB4Qtv4OUjZKdVFqDFKuSdfBO90R1+HoIqXBI+kGwg==
X-Gm-Gg: ATEYQzymuSywJGC6R5X3Y1Bt1m/XNJGaRq2A8+I4tMyFE1uaR52WhwvBsFkpIWNLwEI
	n6H9jFfPs8wtizezGUCQNw2IyCMSIpobbWaS9F3yN/nAWKmgs/T/8jOGKQJ2BB5OQLmlCHIvECb
	5Lalnw0NE3IeXuqLm7RJRBaL8fh642jG2yJ506RbfgCXttsksD1Vom/0+0ZFSWGGrSdGq7ltoAe
	ih1G8ablqLiSPkmwFGGYCyd342frEDNOW/UIMK71xDFC+IsjS4c2FGZUypPcozUNjBPUgqq6PdB
	5f1iYlGh
X-Received: by 2002:a05:651c:544:b0:38a:aba:9c0b with SMTP id
 38308e7fff4ca-38a897d365dmr43927571fa.27.1773674170737; Mon, 16 Mar 2026
 08:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260311095009.1254556-1-ziniu.wang_1@nxp.com> <20260311095009.1254556-3-ziniu.wang_1@nxp.com>
In-Reply-To: <20260311095009.1254556-3-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 16 Mar 2026 16:15:33 +0100
X-Gm-Features: AaiRm52yvrWjzyiC1WQIkEheabNUD7pScP7tLn4Y188s1jdcCNFrCPgRy13YRRo
Message-ID: <CAPDyKFoU9hE_ZRbiK8m6Hso-xGQEdTpaTvJshTdSbpD-Kqra1A@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] mmc: sdhci-esdhc-imx: add 1-bit bus width support
To: ziniu.wang_1@nxp.com
Cc: adrian.hunter@intel.com, haibo.chen@nxp.com, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-mmc@vger.kernel.org, s32@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_081613_251213_CF39B035 
X-CRM114-Status: GOOD (  17.31  )
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

On Wed, 11 Mar 2026 at 10:48, <ziniu.wang_1@nxp.com> wrote:
>
> From: Luke Wang <ziniu.wang_1@nxp.com>
>
> Add sdhci_get_property() call to parse common SDHCI DT properties,
> including "bus-width = <1>" which sets SDHCI_QUIRK_FORCE_1_BIT_DATA
> quirk for 1-bit data bus width configuration.
>
> Remove the duplicate "no-1-8-v" property parsing since
> sdhci_get_property() already handles it.
>
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 97461e20425d..b607d4ffc562 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -1813,8 +1813,6 @@ sdhci_esdhc_imx_probe_dt(struct platform_device *pdev,
>
>         of_property_read_u32(np, "fsl,strobe-dll-delay-target",
>                                 &boarddata->strobe_dll_delay_target);
> -       if (of_property_read_bool(np, "no-1-8-v"))
> -               host->quirks2 |= SDHCI_QUIRK2_NO_1_8_V;
>
>         if (of_property_read_u32(np, "fsl,delay-line", &boarddata->delay_line))
>                 boarddata->delay_line = 0;
> @@ -1833,6 +1831,8 @@ sdhci_esdhc_imx_probe_dt(struct platform_device *pdev,
>         if (ret)
>                 return ret;
>
> +       sdhci_get_property(pdev);
> +
>         /* HS400/HS400ES require 8 bit bus */
>         if (!(host->mmc->caps & MMC_CAP_8_BIT_DATA))
>                 host->mmc->caps2 &= ~(MMC_CAP2_HS400 | MMC_CAP2_HS400_ES);
> --
> 2.34.1
>

