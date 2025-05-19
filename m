Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3261CC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 12:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7Zhmo/JpzcMaAMKKOwzh6ja2t6tkPpPMCDNoaM6o58=; b=Trj0etjOxIP16KYbUoqPjeK5Fw
	+KyUexL5qC4ukNYwxNCsqaSN7jVcqdOzO/YsCTbfMJYndl15uD0YUqHFj7YecbX8M5D0BIW1La10Q
	2EpPc/yXNcjuVk27G8fVbh120R1W21P5JCKaIZlJ1le6rH6Qk50vrvr2hzQDoe0yIVg9at4URQSa5
	1DKyDCfQGAFiGF64dhLG2zi0De2uEbsQJ6ci9vfqMHS6s6UjGVbcq+DakW4bA/MATsYttDdB8rIwI
	5ZioaaeRhNJZqoPyrqWgDSDn5+pZXzlp32mfWx+1XJWCW4O+5KAtacvGsomCcUN+HB6JH1eHF+tS3
	U8UVKX7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzoV-00000009BTm-2pTc;
	Mon, 19 May 2025 12:41:51 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzf9-000000099vC-41dj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 12:32:13 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e694601f624so3078023276.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 05:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747657931; x=1748262731; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B7Zhmo/JpzcMaAMKKOwzh6ja2t6tkPpPMCDNoaM6o58=;
        b=x9+JV+sqdwU+O4luJr0jLpdLt8OddGsLUTv6FWubD7KReGQGeq6BWg+YJuy8QjNhPd
         bO0V2EMhorjPQKXCMX8uYgC4T6QYV4YJkBgOgm9GDjwoMlD3pl5w0TsZbGw0Cg96Ulpv
         6jcDkQ9Dd27KCXP20m0l33o+NucGR6uRR7DNGmEMXPK7e0FJfICLVQcs1EEEUTGhiokZ
         QcCnaZnCrHrD5y1hipGzFo5RVpuUhJHpXh4YTcaPqVJXIZxoO1fCzad0T0ojyplCt/5B
         czU5zI5Efr87Vpp6AFeSog8awsPXOBKTZJBJLjBu7ABFzRY4b123rEUXTxxjPLQKuYFJ
         FYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747657931; x=1748262731;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7Zhmo/JpzcMaAMKKOwzh6ja2t6tkPpPMCDNoaM6o58=;
        b=eA2Y6WvZEdNV6mNkRK6dqZAG/IbVCMjwoOGOVDQ9q335W2GosDo1lqc5N09opUnImr
         L/Dd0QU7vsLvjT5/PZ3PVkvAUhiB6iYkaA1sgz9r8zkqtyvZIJIqzgX0k5lqsXwZ975p
         o7g1m9Z5E1kjEIde5yFuVbr14gtAdboAGJNKuNYUBkJ2/uxQwKTCRLtPLKRXEOCE1+uS
         jaZJ2Wf6KTaANyTV2rO6dubbJfYCDsHwo/EdQjrba2E30m/bTeuBl8B4j0jM+QxSFkuv
         uE7qfR+1rwfFQPjw9u8JFtFR0Mc2d75G31dq7jNwKXau5dr4jlQHnEHq4wGlXLwFzQzv
         +DJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI2vFD9Knyq8lTzb3SiG16eyUTbBn25+awI20kG8weIqxYeVYa46dkfozpbukF77DCdRd0NHaKMARasi/KrznL@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjg+twXvat+m951urEyQk0dejd20fZhBIt0d4Ab5khls9rYd05
	OWVyCFvIA8XpAUBZ4312JC7Bfbtv4kZespcaN8+tlC20rRm/55r/eBYw7Gyd3pZdR/qJ8RL6ay7
	EUkjbT1T+8iU5YjFtEwQwHXUkFPKeBdHHlwwY8lXQJw==
X-Gm-Gg: ASbGncsBIE33wtY5RzzGrFBgF2dNwJpmZvRXTQqSPi1rxER2vcRG9sXIgzURXxKuosE
	1Q76pTfyGkoY/KFy0b2d+D91QumKEJeJ/kW1wgSY/nZvjrO27JoPZpSJr0eHVdWtxpQLIGIVFU/
	T3xPZPmvmKzrWbOsIbFjaV+vBHIfIb69VMPg==
X-Google-Smtp-Source: AGHT+IHMRf8bcz5aIkiyV4tAaS8tGQtUKO6bhUpbLyg9woenXTM/y8WVzmZJnfWYm+84x/Es23zMYwq7B9ivClzWPz0=
X-Received: by 2002:a05:6902:1b03:b0:e7b:8524:3f5e with SMTP id
 3f1490d57ef6-e7b85243fb8mr12802970276.10.1747657930730; Mon, 19 May 2025
 05:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250514094903.1771642-1-ziniu.wang_1@nxp.com>
 <20250514094903.1771642-2-ziniu.wang_1@nxp.com> <0bda0bba-cfc6-403d-b36f-9c625e5bafb2@intel.com>
In-Reply-To: <0bda0bba-cfc6-403d-b36f-9c625e5bafb2@intel.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 May 2025 14:31:34 +0200
X-Gm-Features: AX0GCFtU3S8coUHVXTKQU7bBOE0kHTmWJQ63OQyAYKI9Qe1enSPXNA1WeuzFizU
Message-ID: <CAPDyKFp+ATxghU2g1XxVLB1Oy4TkFvUqj6SpyKCV_ro9bayXtQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mmc: host: sdhci-esdhc-imx: refactor the system PM logic
To: ziniu.wang_1@nxp.com, Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, haibo.chen@nxp.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, s32@nxp.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_053212_021282_4276BA83 
X-CRM114-Status: GOOD (  33.21  )
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

On Thu, 15 May 2025 at 14:53, Adrian Hunter <adrian.hunter@intel.com> wrote:
>
> On 14/05/2025 12:49, ziniu.wang_1@nxp.com wrote:
> > From: Luke Wang <ziniu.wang_1@nxp.com>
> >
> > Current suspend/resume logic has one issue. In suspend, will config
> > register when call sdhci_suspend_host(), but at this time, can't
> > guarantee host in runtime resume state. If not, the per clock is gate
> > off, access register will hang.
> >
> > In sdhci_esdhc_suspend/sdhci_esdhc_resume, remove sdhci_suspend_host()
> > and sdhci_resume_host(), all are handled in runtime PM callbacks except
> > the wakeup irq setting. For wakeup irq setting, use pm_runtime_get_sync()
> > in sdhci_esdhc_suspend() to make sure clock gate on.
> >
> > Remove pinctrl_pm_select_default_state() in sdhci_esdhc_resume, because
> > pm_runtime_force_resume() already config the pinctrl state according to
> > ios timing, and here config the default pinctrl state again is wrong for
> > SDIO3.0 device if it keep power in suspend.
> >
> > Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> > Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
>
> Looks OK to me, at least, although Ulf may still have comments.
> Otherwise, for both patches:

Looks good to me too!

>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>

Both patches applied for next, thanks!

Kind regards
Uffe


>
> > ---
> >  drivers/mmc/host/sdhci-esdhc-imx.c | 50 ++++++++++++++++++------------
> >  1 file changed, 30 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> > index c0160c69a027..7611682f10c3 100644
> > --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> > +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> > @@ -2009,11 +2009,14 @@ static int sdhci_esdhc_suspend(struct device *dev)
> >       struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
> >       int ret;
> >
> > -     if (host->mmc->caps2 & MMC_CAP2_CQE) {
> > -             ret = cqhci_suspend(host->mmc);
> > -             if (ret)
> > -                     return ret;
> > -     }
> > +     /*
> > +      * Switch to runtime resume for two reasons:
> > +      * 1, there is register access (e.g., wakeup control register), so
> > +      *    need to make sure gate on ipg clock.
> > +      * 2, make sure the pm_runtime_force_resume() in sdhci_esdhc_resume() really
> > +      *    invoke its ->runtime_resume callback (needs_force_resume = 1).
> > +      */
> > +     pm_runtime_get_sync(dev);
> >
> >       if ((imx_data->socdata->flags & ESDHC_FLAG_STATE_LOST_IN_LPMODE) &&
> >               (host->tuning_mode != SDHCI_TUNING_MODE_1)) {
> > @@ -2021,9 +2024,6 @@ static int sdhci_esdhc_suspend(struct device *dev)
> >               mmc_retune_needed(host->mmc);
> >       }
> >
> > -     if (host->tuning_mode != SDHCI_TUNING_MODE_3)
> > -             mmc_retune_needed(host->mmc);
> > -
> >       /*
> >        * For the device need to keep power during system PM, need
> >        * to save the tuning delay value just in case the usdhc
> > @@ -2033,9 +2033,13 @@ static int sdhci_esdhc_suspend(struct device *dev)
> >           esdhc_is_usdhc(imx_data))
> >               sdhc_esdhc_tuning_save(host);
> >
> > -     ret = sdhci_suspend_host(host);
> > -     if (ret)
> > -             return ret;
> > +     if (device_may_wakeup(dev)) {
> > +             /* The irqs of imx are not shared. It is safe to disable */
> > +             disable_irq(host->irq);
> > +             ret = sdhci_enable_irq_wakeups(host);
> > +             if (!ret)
> > +                     dev_warn(dev, "Failed to enable irq wakeup\n");
> > +     }
> >
> >       ret = pinctrl_pm_select_sleep_state(dev);
> >       if (ret)
> > @@ -2043,6 +2047,12 @@ static int sdhci_esdhc_suspend(struct device *dev)
> >
> >       ret = mmc_gpio_set_cd_wake(host->mmc, true);
> >
> > +     /*
> > +      * Make sure invoke runtime_suspend to gate off clock.
> > +      * uSDHC IP supports in-band SDIO wakeup even without clock.
> > +      */
> > +     pm_runtime_force_suspend(dev);
> > +
> >       return ret;
> >  }
> >
> > @@ -2053,16 +2063,19 @@ static int sdhci_esdhc_resume(struct device *dev)
> >       struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
> >       int ret;
> >
> > -     ret = pinctrl_pm_select_default_state(dev);
> > +     pm_runtime_force_resume(dev);
> > +
> > +     ret = mmc_gpio_set_cd_wake(host->mmc, false);
> >       if (ret)
> >               return ret;
> >
> >       /* re-initialize hw state in case it's lost in low power mode */
> >       sdhci_esdhc_imx_hwinit(host);
> >
> > -     ret = sdhci_resume_host(host);
> > -     if (ret)
> > -             return ret;
> > +     if (host->irq_wake_enabled) {
> > +             sdhci_disable_irq_wakeups(host);
> > +             enable_irq(host->irq);
> > +     }
> >
> >       /*
> >        * restore the saved tuning delay value for the device which keep
> > @@ -2072,11 +2085,8 @@ static int sdhci_esdhc_resume(struct device *dev)
> >           esdhc_is_usdhc(imx_data))
> >               sdhc_esdhc_tuning_restore(host);
> >
> > -     if (host->mmc->caps2 & MMC_CAP2_CQE)
> > -             ret = cqhci_resume(host->mmc);
> > -
> > -     if (!ret)
> > -             ret = mmc_gpio_set_cd_wake(host->mmc, false);
> > +     pm_runtime_mark_last_busy(dev);
> > +     pm_runtime_put_autosuspend(dev);
> >
> >       return ret;
> >  }
>

