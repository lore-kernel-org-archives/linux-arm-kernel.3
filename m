Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F63CF53D69
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 15:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRG8t2fwa53hb2NLk5hHr7swK0mnrB3Ou8aFpV71p8Q=; b=hWoP1vAXnOHn466OqGF+PqfOGq
	OAcCP8I4AqzB+w24Av0sWWYZJ3824uyHXuzqAT6IXJg2TKPGB1k8TPrIF1kJkH9fYc71oaCRN2ErA
	nkruBSjbSabf2JFES9lVhlc26gA0HuqhDDQAOoXdDLR5WAHUOD8c/wPd90hxYlIMcDeEgpHTObLp0
	TIkak3HhibvG93i7GFAJroorl15UHJalBsAdRyG7IRmGF1FjJ+8sdD/qpNXiTXo30wo7yvBJEmlwt
	ChT5MYb1a11IJavPT5S6mwoyl4JLGb10j87fKY/zlxDmeHc6gG9nfRpGkuOo7Vgfoit7GNfsCaHW3
	ApcvN/7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29g9-00000004J6m-0Tvy;
	Mon, 16 Mar 2026 15:16:25 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29g0-00000004J2t-20wo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 15:16:17 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5a107b387a5so6105671e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 08:16:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773674174; cv=none;
        d=google.com; s=arc-20240605;
        b=SRpu+/8UDnqAQrjDevR0l0RSFiy0/0JwVfLr508SM+Z5hFDBcDs1ZDWJMNVkv4i1qg
         t3D+bSQWG4K+zEW0ePC9nIbpFilT5yDjjLNjefZZ+btyRpyX6JzK+Q0pjd1/hfCDGCEy
         uNAKL+AzQK1ulLTKuWto+EJ27P7MsV3thoufk7hKGr8v8Do8BWjt5mtOeQuR26bNuIPJ
         NYOHPN4nRD2MtqrCg3bcuKULuwOpCdzuxw9Ovz+JP0me9NnxDv1EDEmxkcVWrogN5Ii6
         l0W7ippdJpxQyCE8JdGrB4CHyFH5v5mQgtfyvyMVA8kA4FEQq4XjFt9MGTa8MitRXOKV
         O+kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pRG8t2fwa53hb2NLk5hHr7swK0mnrB3Ou8aFpV71p8Q=;
        fh=T91dPBXDVpPmrRkucZgY17xgpCAfu6AEJYr4rh356b4=;
        b=GFGNPx8yewBtYLVvcfPFV9mRaU8KkOL3mkr5JWrtt4svggFOXIgK0WNl6Zw+7lr4aE
         +5Qz78sJ+K4kcZdbyLGIO8xp+GZnS0HlxRzE7rGpZAwa0UmHzzW9sbiQueJi2lC4Gnri
         ImHiMvTLarRoeg/AXhV3FDUfHbpYveO+LKujwSi3YZPhN3AMbMzoLLufC1l9apLKhdlq
         bMq8MWOOWbJz3+q4tA4Kca4AQEsIin6TlC3XJTEImyvS8rtp3Tu3apeDV/ZEfzkbtAGM
         avRqYElTxKhNFEpupzLbH+iH1xoWCBMG7IbzcXnsVoPTLGD0rE357b9f4u1hla+3bWav
         6Kbg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773674174; x=1774278974; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pRG8t2fwa53hb2NLk5hHr7swK0mnrB3Ou8aFpV71p8Q=;
        b=YPJL6AvvUhZEBdH3+z2+eIS6WWN3kjH8RC3RBYEK6es9qsQuYaLIvNARRPsCgrLHwZ
         w3GZvF4Lj6ELQk1xeIwO6k/lVcEUPbZB+TSudqnJKF1Dwm4HYixQzTw8DZx2OkUC2At5
         pfCbkoHWKkQT3oFdz+PlsvJ5hur1Ma9CONPdxs0rEDcKZJ5F5kufISZM/8dOy51TcIyX
         fXWRzu/YHvlQfHHf0aaqZ/Dxr0ROeK3M/nh3tSVuzZ7ppTtjUqnw7ih9Cvjn29tKXY7/
         dF2I0CiMRh/m3xi0p2QQ302L1DAusKtaqEvtSrRvgRPuqnIZSrm18Z9WU69jAVKnGy9s
         s+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773674174; x=1774278974;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRG8t2fwa53hb2NLk5hHr7swK0mnrB3Ou8aFpV71p8Q=;
        b=ELrBQXIzyhw//6afbBohyTKbwobnN09wCYer/IbNu5l+sxJBAYPpdR5JdITS8h+I9/
         pvh2KkyyKMDwYxdA4ujw2G5yuy2cM6vVrtqQpO6nOqFDj3lv/ifImGgNn0AqGMQlQOpE
         BW9VJ2wXvRwHo+8K1n/UZZQUZRZp52+zqZaQfbcF3KJagNK3IWpCr2L/MgB6pZ0qrakZ
         OKiDRrW9buq8h+xky7VrRVREG252EF90YFXf8EEE0+oS9rf/PYEskXP/nbLyEvR6qzsY
         /NZSeMJWKjEB/dnPV83pDKOkfIVHm9+EgYTOB6H2tVDPJHZ1gK79aG3YwwaZMvvFv9ed
         Q3/g==
X-Forwarded-Encrypted: i=1; AJvYcCW/UhpQK0NTem0qiHb2WJY8vapztpxmgFnH9Hl1jI3smM++DC7PgNt7956Irj6aRpLCdj67eBDO1r8rvhjl8r7Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9AEbTpvI//uUEIqZ3rJ9RoJcE+WiMo+XVjp7wn3SEnQaT9Oac
	yf80NGw6gOgV72iSGmhK5+E44iMgr9KsXqyd+gXv5vBh6Y8pBwqX3PgRCxnJEiZLMmjkvKGmSKu
	BW+pXzKzhm8obR3pTa36IC7DIaW8u4jynyIceAQTFxQ==
X-Gm-Gg: ATEYQzxlHTadrsjrWtBI079YHgYDwzRO2gz9r63wdoQDl3L97O4Ks0nEjKdV0E/gOdR
	LGBNRtHzkhwa/D0xkQgPqIHSUt360qEy8QRGYv5hf6xzvVTSqdAC5ckayt7vt0FwXlfUt2BMDDA
	FKqgGE7vqABjWTfQFHrTPHNr1oMi/Yac2PBPhxc2YnxzmN9Edzl3evIukTds49jV6xRVF+ce1PJ
	6/rH7uC2Y2E107Bh6op8x+w8KngQNmYeuVcnA2Zusm+0Ln7gGOyAxlB9q4SP06TfU3fRd5AU68n
	vmfyc6nN
X-Received: by 2002:a05:6512:3d28:b0:5a1:18ad:b55a with SMTP id
 2adb3069b0e04-5a162b14fedmr4185167e87.40.1773674174186; Mon, 16 Mar 2026
 08:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260311095009.1254556-1-ziniu.wang_1@nxp.com> <20260311095009.1254556-4-ziniu.wang_1@nxp.com>
In-Reply-To: <20260311095009.1254556-4-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 16 Mar 2026 16:15:37 +0100
X-Gm-Features: AaiRm52ArtuP-ygMvRxB8MkKlR8r_NeTZwYYmgYJ41n5nYfFvCkoTG5n4kfwkpY
Message-ID: <CAPDyKFraNEd9UG8QO5PEGkgRxS_43Szt+2vwXtqAP2CBjYSCpw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] mmc: sdhci-esdhc-imx: remove duplicate HS400 bus
 width validation
To: ziniu.wang_1@nxp.com
Cc: adrian.hunter@intel.com, haibo.chen@nxp.com, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-mmc@vger.kernel.org, s32@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_081616_552254_DD22EACD 
X-CRM114-Status: GOOD (  14.98  )
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
> mmc_validate_host_caps() already validates that HS400/HS400ES requires
> 8-bit bus width. Remove the duplicate validation.
>
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index b607d4ffc562..d49069986efc 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -1833,10 +1833,6 @@ sdhci_esdhc_imx_probe_dt(struct platform_device *pdev,
>
>         sdhci_get_property(pdev);
>
> -       /* HS400/HS400ES require 8 bit bus */
> -       if (!(host->mmc->caps & MMC_CAP_8_BIT_DATA))
> -               host->mmc->caps2 &= ~(MMC_CAP2_HS400 | MMC_CAP2_HS400_ES);
> -
>         if (mmc_gpio_get_cd(host->mmc) >= 0)
>                 host->quirks &= ~SDHCI_QUIRK_BROKEN_CARD_DETECTION;
>
> --
> 2.34.1
>

