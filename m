Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECEBC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9ngDNGkZRiVWGtgvkMRHPkUgF6S7Nt/Bo4JqOL13oI=; b=MPalk6Ep0MG8CeXNH0DKe7GuzS
	uwHbkVmFJapCjoWVfw8Gu3uLdojL/v6Sx3MDwANapowaDTJuWvgTM8JhO8egdVdzLRqTN1Rm4/cbb
	Gvzp2aH1uUOupqCjqtEneAARIlMJFtd+wDWmkff+/AwK4BONF4eI/44i57frx1IGEmpcBEP8AAWOX
	IJfoFHHTLUihyELfSZ+1+w2UxznZ53rOMJcPt8qonN6z0jbv3Hmsz06AVv9IupKl3OuXExL19QXCA
	GNAqsLoEe1dbZBtJdw1p9UcpcDRlaNMNWBCokIaR24Oj2s+RbY9IOeEKACzhlxdQU43bzUrpP3+KT
	r/gng8uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I9a-000000087Lk-01Hx;
	Tue, 22 Apr 2025 18:15:30 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Fnj-00000007m9u-1hv5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 15:44:48 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-7081165a238so5950067b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 08:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745336686; x=1745941486; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K9ngDNGkZRiVWGtgvkMRHPkUgF6S7Nt/Bo4JqOL13oI=;
        b=DdrzTdoHHe2NN5LznqENfSYk5Xb+IMiE9Y8cRWk6df8Me9nyTmgCPjvsiIq/JvXbVx
         TGSKSWm2yZ/05ONFWRso/GgwIVhH/9uOxYFTprGOfkCo6h1xdEKb/dKIdtH/DRI4Thk3
         GkCsg9GEDcnq0kcvSc0X3GLJ6RvPOjPApQcWVNKiIIsWJpcwhqmvolppqlGmn5QisYHG
         rRHaNJnAbyyK48IzTJ6CtTwSFLV7VPhqabfZgirTLNteaG15P/NbwLkVMoye+JM9BUmQ
         OWjI/1Fob4j57F770B+haQbVGHWbLb5rB07MvTmk/+kYFgqJdAwndDENa4y/xqIJlBmR
         lvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745336686; x=1745941486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K9ngDNGkZRiVWGtgvkMRHPkUgF6S7Nt/Bo4JqOL13oI=;
        b=nmiU8AtMUX8F+G7lqKMsST+aDA/qky77+VLusVgzbQfNN51wkPm6qUjPgvcsBKtIau
         NElAiqMOtG5wEkBaP7linazbIXv2VqTKzb/9oX21haDYZe8FgjcFXFfwNEyPbjh+Hw7Y
         Gy+9xZ0Y0eOezoT4jDoDdPw8L0l57NPFGtpek8bdp3nR3+Nrw866hEHe9nWe6XP4bfL/
         bUqQNjTLn675KSUbir+++bi8MnG0vzNW7cgm29Dj3N9NSG9dzc0BiMgeRlc/niWFK292
         b2SP+wbC1+WDH96dG7N8pvEoOwYcfbgxZdPJJ6PMvGV4ZI9mhiSY30yYuFMxWmPfqS8k
         2jLQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/TvDCBcoRD8D4z+TjbbQl9xaGgX7KJfclvhWu0Ri+feetlgyDSxfExTU3fjmTyvRWiswNCcsLtv9bthgj2P/8@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+lm//+OZVTbWC/VPoN38tS7JTubytdHQXIpa9pLPfUKzPv5Mc
	wtwa+js3TcXwyxARlxdbz5dEt57oWE5kO4w1klYiRA1reEMlpzRJ5khGOYzQSdaryw0ulDBVl1L
	GHlAnmb16aSTv60lEzUfK4TBdyAbuWf2zyceb3g==
X-Gm-Gg: ASbGncvKDuU4xx+iOjdQ3hTafCCYoWAMatKLOEGWN1YjVHY/7QDDgXDsNIMxRLcbsCt
	i1GYlfbin4CfmWdiBEZlmpCX3ffzy6MLNuy8jI0EWD/Cv7MMLVLRMhq9aR5KXbFMaPu2sIfGSdP
	VodwdsVQ3DDmx3xv9sQXI5BOw=
X-Google-Smtp-Source: AGHT+IE3NCo/U+OdWL0RzxeIBOTKrxCpneJJYIv5a9wSEqVGqkMe/Lxmi2wisNM7ZZMHxbrfn2WvD6fXWik7UjeBc4U=
X-Received: by 2002:a05:690c:6e0d:b0:6f6:d0a8:8d65 with SMTP id
 00721157ae682-706cce25937mr208437997b3.28.1745336685661; Tue, 22 Apr 2025
 08:44:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250409072604.3410459-1-ziniu.wang_1@nxp.com> <ac3546ef-bffa-47ac-9c65-c3250da5387d@intel.com>
In-Reply-To: <ac3546ef-bffa-47ac-9c65-c3250da5387d@intel.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 22 Apr 2025 17:44:10 +0200
X-Gm-Features: ATxdqUFxVnXPCSEBPjHmKlVJnatv7iIefwywUip8-eI--PGoBu-PH0qykz7ZccM
Message-ID: <CAPDyKFpmK3ZGyqgXFsZ43aU_JG8JG-mw751Lcbk3PZ1_9xLnyQ@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: sdhci-esdhc-imx: calculate data timeout value
 based on clock
To: ziniu.wang_1@nxp.com, Adrian Hunter <adrian.hunter@intel.com>
Cc: haibo.chen@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	linux-mmc@vger.kernel.org, s32@nxp.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_084447_444541_F7816FF6 
X-CRM114-Status: GOOD (  24.54  )
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

On Tue, 22 Apr 2025 at 12:24, Adrian Hunter <adrian.hunter@intel.com> wrote:
>
> On 9/04/25 10:26, ziniu.wang_1@nxp.com wrote:
> > From: Luke Wang <ziniu.wang_1@nxp.com>
> >
> > Calculate data timeout value based on clock instead of using max value.
> >
> > Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
>
> We overlooked that Haibo wanted the "bit[23]" comment dropped,
> but nevertheless:

I have dropped the comment when applying, no need for a re-send. I
also added Haibo's reviewed-by tag.

>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>

Applied for next, thanks!

Kind regards
Uffe


>
> > ---
> > v1->v2:
> >  * Added SDHCI_TIMEOUT_CONTROL to esdhc_writeb_le()
> >  * Removed esdhc_set_timeout() to use common __sdhci_set_timeout().
> > ---
> >  drivers/mmc/host/sdhci-esdhc-imx.c | 24 ++++++++++++------------
> >  1 file changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> > index ff78a7c6a04c..a34cabee5916 100644
> > --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> > +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> > @@ -870,6 +870,16 @@ static void esdhc_writeb_le(struct sdhci_host *host, u8 val, int reg)
> >
> >               esdhc_clrset_le(host, mask, new_val, reg);
> >               return;
> > +     case SDHCI_TIMEOUT_CONTROL:
> > +             /*
> > +              * ESDHC_SYSTEM_CONTROL bit[23] used to control hardware reset
> > +              * pin of the card. Write 0 to bit[23] will reset the card.
> > +              * Only write DTOCV field here.
> > +              */
> > +             esdhc_clrset_le(host, ESDHC_SYS_CTRL_DTOCV_MASK,
> > +                             FIELD_PREP(ESDHC_SYS_CTRL_DTOCV_MASK, val),
> > +                             ESDHC_SYSTEM_CONTROL);
> > +             return;
> >       case SDHCI_SOFTWARE_RESET:
> >               if (val & SDHCI_RESET_DATA)
> >                       new_val = readl(host->ioaddr + SDHCI_HOST_CONTROL);
> > @@ -1385,17 +1395,6 @@ static unsigned int esdhc_get_max_timeout_count(struct sdhci_host *host)
> >       return esdhc_is_usdhc(imx_data) ? 1 << 29 : 1 << 27;
> >  }
> >
> > -static void esdhc_set_timeout(struct sdhci_host *host, struct mmc_command *cmd)
> > -{
> > -     struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > -     struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
> > -
> > -     /* use maximum timeout counter */
> > -     esdhc_clrset_le(host, ESDHC_SYS_CTRL_DTOCV_MASK,
> > -                     esdhc_is_usdhc(imx_data) ? 0xF0000 : 0xE0000,
> > -                     ESDHC_SYSTEM_CONTROL);
> > -}
> > -
> >  static u32 esdhc_cqhci_irq(struct sdhci_host *host, u32 intmask)
> >  {
> >       int cmd_error = 0;
> > @@ -1432,7 +1431,6 @@ static struct sdhci_ops sdhci_esdhc_ops = {
> >       .get_min_clock = esdhc_pltfm_get_min_clock,
> >       .get_max_timeout_count = esdhc_get_max_timeout_count,
> >       .get_ro = esdhc_pltfm_get_ro,
> > -     .set_timeout = esdhc_set_timeout,
> >       .set_bus_width = esdhc_pltfm_set_bus_width,
> >       .set_uhs_signaling = esdhc_set_uhs_signaling,
> >       .reset = esdhc_reset,
> > @@ -1777,6 +1775,8 @@ static int sdhci_esdhc_imx_probe(struct platform_device *pdev)
> >                * to distinguish the card type.
> >                */
> >               host->mmc_host_ops.init_card = usdhc_init_card;
> > +
> > +             host->max_timeout_count = 0xF;
> >       }
> >
> >       if (imx_data->socdata->flags & ESDHC_FLAG_MAN_TUNING)
>

