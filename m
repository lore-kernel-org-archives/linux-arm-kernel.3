Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEA3F53D65
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 15:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KlM6cFVmM/SaOx6burFPACi9y9V71qm4hfXUPER/Krk=; b=2UbmGqiwZsPL6DvOMT2R/8+vsW
	dLTWhzv+zI06r3Zd6me/DDvoxIVidO6hoaJWt17mq3kI8ejTmtQpwwWCG160whNNW01qiWfxprf4z
	igz1k0h/UcNuSNQ5Cq8oQ/0nWI7A9geD1nQP4+qq7hAGyg6sFeM3zuqfXrLO9IwMceD23ByKKmLbp
	rZJ+uei8nTFlEs3HVZknCcJ2vjdhCcIVwlzxA0SZ3ocwtyHThHQjbO0PAiDC+GESHMI2fmfuwzMUn
	UQB2hMKjsYt+2EEoQXntX0jD7xPAnH3gULsNE/BaEKr8zOAyMSxp012FZqPtKyEnUqjUPmw/ddOzo
	//ahgSqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29ft-00000004J1J-204q;
	Mon, 16 Mar 2026 15:16:09 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29fr-00000004J0Z-2Qvy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 15:16:08 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5a0fc5e2c59so5257543e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 08:16:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773674165; cv=none;
        d=google.com; s=arc-20240605;
        b=VItJpNKF6uBJMY2MUAw328gs9n0m//toNFTDz3cBubT+nMKELymcLSUC23z1j++gbR
         6UB8K0rvKiTHJhO3+jc1MgQMf4biLTrDOpZtyDPzye1aiHHUJBAD0VF/zmvuTSnR5VcH
         Tri2uNuHLZmJQSHsx8bmJzcnKO8ItVM7XOXkZcjsUetOWa+DmQzUifT4+xxcDscQrAaP
         4zfd6ytIHyKrL2NEATnMhVprQTaOU46gBhfxXvnRAe8bHxKujg8gDi3EIhxVKNCW1Qky
         IA+BnddVuV7doaE5QINrYxRiqI5YJKT6t/Gm71WdHLTDf9IWlwPkdIYQ6b5MVm53QKTb
         SELA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KlM6cFVmM/SaOx6burFPACi9y9V71qm4hfXUPER/Krk=;
        fh=FCVNorYmGOes0SljoBPx481qauIDsOzc9GncCpV6lOA=;
        b=gsxjwhvxPYpnqqZeUbl2ByBqSbWF9OKpLuvOnw1qh3fruBFw+i/9g7IZqCw+2mkOZU
         u9/08/5tTBAuYI7f8zBE2VAbJYAQb2DUrR2UGwzJv84JPDtIWLxtBKmoH3FFg0VMa+Us
         CEh3M1XuMWNDBxCBoJ0KLblaAlzwlg/B32WEYD0xwxfj5FL1pT9/yShI3KM9lzHKvVAM
         jNFTN8OgHUaCSmop5rDqqI867szW9yMuZ+r844a5Ch3xtzKwW/+Xs0fh069jk696OZRy
         cnXQ2rvtLPt4CwWgyJQVlH2DdbeDQpIvFTH6e3CPRaLD3N4PED0515HHJV5jivRR7coN
         gqPg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773674165; x=1774278965; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KlM6cFVmM/SaOx6burFPACi9y9V71qm4hfXUPER/Krk=;
        b=aVu8OsnmHHd+AidBFebSy1bW/dDTO1D4RWN5Jy+hUiZW37FrKjyhx5oIwSNvWSjzZ2
         0K87jAcYeVQf0olY+QVFhhT9cCzN68J+ryFMp8PU/kaqF9qnr+YJfUES4s2pwQE4WIph
         m+GiqGmgisGnBbOPxhjrhEXYD3p6AmZOAFaj8aoBBhtsMtQGGKXP1pon21ZB+FHQlNgw
         rrkYI9HMFDwBI9tUQ+DLKaPffL9dppsypxGdClmWnweB/+7A+lA/hBq7AGAvwCR/0egN
         K2DXxpX+RMBFwt2Gs/qn7ly0oWwT19DPXOkXw3UjKBEFQlMVL7LZI1LVKEvElufLWe/8
         6wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773674165; x=1774278965;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlM6cFVmM/SaOx6burFPACi9y9V71qm4hfXUPER/Krk=;
        b=DbKwRA3cbhe4gjDxMbOmO9qxX+deYOR3fkI+wcphuTx5OAXlKgupJ91R7euVRgvUxQ
         Zd6JbzEWsmm8I8Gt1lCvUND3hW3ujhHWvG0+pDtZuYUGY1yPbDhJKHxWxjvCSUKTkxWo
         q6JfBt+NPqrXT6UUJxhTVhEb0xOeWnPzTg67aYRQ5HUrFJOCclpdqd/by9fdjhWe53q2
         CI3Z6kVGbxW0Wmsv5ozi6R8B0z9buJOtVXgvnfevnmbm258bEdbQSw1KdWzwMQBirG/Z
         +fSyVHx+Rat4R1j7wAYpxsir+eh15LA5+IMzuuMvsEytjqe8DsdlMcPUuJHCuwMOz9sI
         9RLg==
X-Forwarded-Encrypted: i=1; AJvYcCXOkesUpMMB3m0YVQmhTu5gsq649GB+upEu+GmjnDAhcSx4kDFahBUTjiVWNDdzloWhm4h09u4ZwcyJpFOgqlTQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/y6Z/u7ckRa/59UBe5eK+jlOXuNPV4jhu30nPt/IYuXLUnDWO
	LBtZ15lAmLpWOrn1gUJkubYRlyO32H9tFcIZdsaFHoFVjb1nq8arWDVjb/p0iNQZpVjyr+4eRiU
	Dt00EDx6vv3lk6omBFz0kyc9svjxbX6fLwhbDzut2YA==
X-Gm-Gg: ATEYQzyq/AB3XH8p8fzQTyQqWb/Rp9nSjQhhbMXYh2J0BxRVvlQevrCno3T051TNLhI
	OT9gIds2fG4dkJdyzBI2lf7BqnHnizP3lciy8vnaofQtkdosOfyKZYqOL8qOwBD+RSmSzsYQ5fR
	P3jRctTiwrl1HmdMcwY6FBV28ua9CyGhKKGmQX4spU0jenc97CXKGimBcm48yXiy6XopZCDqe5E
	x8vB/hv++K6x6zYXg9g/u8w0gd7OCaN5HLjQpDnVaWOnzit+ig//vmc8272PWz/tokzBM1Fz6kT
	ruSRRJ27
X-Received: by 2002:a05:6512:1558:b0:5a1:448b:317b with SMTP id
 2adb3069b0e04-5a162b08ea8mr3109007e87.42.1773674165204; Mon, 16 Mar 2026
 08:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260311095009.1254556-1-ziniu.wang_1@nxp.com> <20260311095009.1254556-2-ziniu.wang_1@nxp.com>
In-Reply-To: <20260311095009.1254556-2-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 16 Mar 2026 16:15:29 +0100
X-Gm-Features: AaiRm50g4ixBgJVGHgml85tjVL8FL6K6omKlK_jwEmgNVXMLTx5qLAygbxIzv3g
Message-ID: <CAPDyKFqbNj0vxNNRoZQ=xSijASA1eWCHfZVabPznQqJ-vrBUYw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] mmc: sdhci: fix timing selection for 1-bit bus width
To: ziniu.wang_1@nxp.com
Cc: adrian.hunter@intel.com, haibo.chen@nxp.com, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-mmc@vger.kernel.org, s32@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_081607_642914_F5727A65 
X-CRM114-Status: GOOD (  17.55  )
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
> When 1-bit bus width is used with HS200/HS400 capabilities set,
> mmc_select_hs200() returns 0 without actually switching. This
> causes mmc_select_timing() to skip mmc_select_hs(), leaving eMMC
> in legacy mode (26MHz) instead of High Speed SDR (52MHz).
>
> Per JEDEC eMMC spec section 5.3.2, 1-bit mode supports High Speed
> SDR. Drop incompatible HS200/HS400/UHS/DDR caps early so timing
> selection falls through to mmc_select_hs() correctly.
>
> Fixes: f2119df6b7646 ("mmc: sd: add support for signal voltage switch procedure")
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index b1a3cd574c84..605be55f8d2d 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -4539,8 +4539,15 @@ int sdhci_setup_host(struct sdhci_host *host)
>          * their platform code before calling sdhci_add_host(), and we
>          * won't assume 8-bit width for hosts without that CAP.
>          */
> -       if (!(host->quirks & SDHCI_QUIRK_FORCE_1_BIT_DATA))
> +       if (host->quirks & SDHCI_QUIRK_FORCE_1_BIT_DATA) {
> +               host->caps1 &= ~(SDHCI_SUPPORT_SDR104 | SDHCI_SUPPORT_SDR50 | SDHCI_SUPPORT_DDR50);
> +               if (host->quirks2 & SDHCI_QUIRK2_CAPS_BIT63_FOR_HS400)
> +                       host->caps1 &= ~SDHCI_SUPPORT_HS400;
> +               mmc->caps2 &= ~(MMC_CAP2_HS200 | MMC_CAP2_HS400 | MMC_CAP2_HS400_ES);
> +               mmc->caps &= ~(MMC_CAP_DDR | MMC_CAP_UHS);
> +       } else {
>                 mmc->caps |= MMC_CAP_4_BIT_DATA;
> +       }
>
>         if (host->quirks2 & SDHCI_QUIRK2_HOST_NO_CMD23)
>                 mmc->caps &= ~MMC_CAP_CMD23;
> --
> 2.34.1
>

