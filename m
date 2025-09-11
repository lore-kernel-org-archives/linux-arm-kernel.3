Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8AFCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 14:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HbBobC0v4eff32ngfVq0VfnRgl2Ah0/8T2f7fqD3KKw=; b=qljMRnu6w4GRS5lAGqmwosLyPs
	6RFRD80hb7XlOvpXPIDSvqDlxn2wWocyA/nje1IE1/8cpKd7HEaSngZmGKZUV1o/kMLKGIsnIUMmW
	7pIBLcHETcGKkuwF9v/JiIdVZ8bVNIEIH/tIJejDRtqpxbxoYOjiZVm9Y0DPOmyauEmCjaR/sRUce
	CpDX8SFIY0JVswQkv/bSqHremjiQPy2Ah5/clVUvDR2evtVJAkw3UK5FtdY5VjeFQmUalr16FuCR3
	rYj4mmKAvbKFGk2NUH5dDQlyiOjCEtQvUh9DIf5HDjy2+0h0FaMnzY6Ekzv6aqfJ8NcmbGDVhGbJp
	XFCHMshg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwiSE-00000003cMJ-2bBx;
	Thu, 11 Sep 2025 14:39:18 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwiSB-00000003cLq-3xLn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 14:39:17 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e9e137d69aaso531372276.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 07:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757601555; x=1758206355; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HbBobC0v4eff32ngfVq0VfnRgl2Ah0/8T2f7fqD3KKw=;
        b=Hp8sy9OdvAeIZ047QLD62FINXGzmy8ukNQSW/5c2G9r1kDWAgNH365WAvL7Izt7JyQ
         PqxM6pefzg0hEDq09f2PPnURLt/wHhfXxh+YSkIg2D8Ec9fBlzK5Awa3Fh3hpLEinv8B
         BK4aUw3/xUBQu76TSVsKTimtYUCmS37tsxVGm+NXcsQkWGzQYzUDKxCdvUWpHeXclJ+P
         q+z+hQLQmMHeTC332AhykLMNyQK+Bd5ltE2lxbZlbAxUXUaefV7PcWTm5Wt4ww7+IAwa
         FfsqrmH7wnbpm7QtX2DcGopXm8KthK3vhycIbHeVA0ac9q+8shhZNDR7Xd4PC5e4O2mr
         n2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757601555; x=1758206355;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HbBobC0v4eff32ngfVq0VfnRgl2Ah0/8T2f7fqD3KKw=;
        b=N4lZ0AzHthBW3+Hvm6FYe8Owc66ptcO76lxdMOXhEZ8mCgexC1AL6vsEFBpzIBg3qV
         qYtK9JzUMyYmfn4yInDbnHivLiRoNA708xju3pp01qqQh45G2gugJPWRHtURaCqnMhm1
         Bu1om9UUbwOnWG5+hXHKSbyApfseMbnvHmitCSkUEEkf9n2pXztnDEJp99uHkbDx6Hff
         HfRNMGWBQP9RsL7Qm1zxmaXT8PzvqkgfFPmiWO+P7dANMY+ZHdkJtcamNzXQzOd4b8WF
         vZXzctY/hnmgT8Z5p1yrfIHC9fEh2p2PaKHZr5dU04P2T3ePG/7M9EWBT0ucHBtA1jxi
         gHLw==
X-Forwarded-Encrypted: i=1; AJvYcCVBpXvgYEDG8mThWJIsk/qBUkDvnBq5itWkbQWvBOn9JM8FslkmAoMMo6yIk5mfCUVHcXElIyIntSX9CMkNecWo@lists.infradead.org
X-Gm-Message-State: AOJu0YzU4cWott9RincKy9RblBrl7VNyeQGy7JeG4044Xumj0cXjZOR4
	FhDUAWv2ppdM69L5QqcfbSevLb2jkfYHRODFXy35DqMzKtQskGEh08fK8hPo7BqukXrgS3c+jcM
	Agz6E0XZmNkEAF3UAiAaYkb8idTJi4EnRiWU50JDe3w==
X-Gm-Gg: ASbGnct+8VWwSNmEjAszjFNJEf2pkxeYXtjAda4S007Bp4ViZqXdo0y96nMbdyuR+jT
	67Hu2flEZkY+lfogPN6Cyo3OfLzNRvCj9dTW0OPDy5CRp9tW5FGWt5vLEk1cGMGuBc1O4yjmY8A
	zQgmhO8xU1pbkwJZubWURCNxSUM1juLGaXNT0c7imfrYVp/B3WhwByYzaiFT1gxmyaWoNT63L5t
	ddJeh3TNfBWjkZxkpdvdNCrRS77Vw==
X-Google-Smtp-Source: AGHT+IFpL041NgNSYHspWH4yA4/NKoHQ52gMrPlor7yXw7ilhVJwKEDCxgkx2t/OXO5Qx5pnzT4qSKghDDvsooOyxsE=
X-Received: by 2002:a05:6902:2b8d:b0:e93:2a04:5ca8 with SMTP id
 3f1490d57ef6-e9f66ed6197mr17981110276.20.1757601554561; Thu, 11 Sep 2025
 07:39:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250908-tisci-pd-boot-state-v2-1-a1a4173cf859@ideasonboard.com>
In-Reply-To: <20250908-tisci-pd-boot-state-v2-1-a1a4173cf859@ideasonboard.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 11 Sep 2025 16:38:37 +0200
X-Gm-Features: Ac12FXzjgykrwXF_mwcytWvOKCsY08WwCbQyF230DEbX6oK_0mRBUlw2K8vwsXE
Message-ID: <CAPDyKFqj1Ed85z8Zwt5hioOGhiCxX95JZcHz98b6=zXm8tjR0A@mail.gmail.com>
Subject: Re: [PATCH RFC v2] pmdomain: ti-sci: Set PD on/off state according to
 the HW state
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, vishalm@ti.com, sebin.francis@ti.com, d-gole@ti.com, 
	Devarsh Thakkar <devarsht@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_073915_993427_60541119 
X-CRM114-Status: GOOD (  45.56  )
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

On Mon, 8 Sept 2025 at 10:35, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> At the moment the driver sets the power state of all the PDs it creates
> to off, regardless of the actual HW state. This has two drawbacks:
>
> 1) The kernel cannot disable unused PDs automatically for power saving,
>    as it thinks they are off already
>
> 2) A more specific case (but perhaps applicable to other scenarios
>    also): bootloader enabled splash-screen cannot be kept on the screen.
>
> The issue in 2) is that the driver framework automatically enables the
> device's PD before calling probe() and disables it after the probe().
> This means that when the display subsystem (DSS) driver probes, but e.g.
> fails due to deferred probing, the DSS PD gets turned off and the driver
> cannot do anything to affect that.
>
> Solving the 2) requires more changes to actually keep the PD on during
> the boot, but a prerequisite for it is to have the correct power state
> for the PD.
>
> The downside with this patch is that it takes time to call the 'is_on'
> op, and we need to call it for each PD. In my tests with AM62 SK, using
> defconfig, I see an increase from ~3.5ms to ~7ms. However, the added
> feature is valuable, so in my opinion it's worth it.
>
> The performance could probably be improved with a new firmware API which
> returns the power states of all the PDs.
>
> There's also a related HW issue at play here: if the DSS IP is enabled
> and active, and its PD is turned off without first disabling the DSS
> display outputs, the DSS IP will hang and causes the kernel to halt if
> and when the DSS driver accesses the DSS registers the next time.
>
> With the current upstream kernel, with this patch applied, this means
> that if the bootloader enables the display, and the DSS driver is
> compiled as a module, the kernel will at some point disable unused PDs,
> including the DSS PD. When the DSS module is later loaded, it will hang
> the kernel.
>
> The same issue is already there, even without this patch, as the DSS
> driver may hit deferred probing, which causes the PD to be turned off,
> and leading to kernel halt when the DSS driver is probed again. This
> issue has been made quite rare with some arrangements in the DSS
> driver's probe, but it's still there.
>
> With recent change from Ulf (e.g. commit 13a4b7fb6260 ("pmdomain: core:
> Leave powered-on genpds on until late_initcall_sync")), the sync state
> mechanism comes to rescue. It will keep the power domains enabled, until
> the drivers have probed, or the sync-state is triggered via some other
> mechanism (e.g. manually by the boot scripts).
>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Makes perfect sense to me! Applied for next, thanks!

Kind regards
Uffe


> ---
> Changes in v2:
> - Clarify the current state wrt. sync state in the patch description
> - Rebase to current upstream
> - No other changes
> - Link to v1: https://lore.kernel.org/r/20241022-tisci-pd-boot-state-v1-1-849a6384131b@ideasonboard.com
> ---
>  drivers/pmdomain/ti/ti_sci_pm_domains.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/ti/ti_sci_pm_domains.c b/drivers/pmdomain/ti/ti_sci_pm_domains.c
> index 82df7e44250b..e5d1934f78d9 100644
> --- a/drivers/pmdomain/ti/ti_sci_pm_domains.c
> +++ b/drivers/pmdomain/ti/ti_sci_pm_domains.c
> @@ -200,6 +200,23 @@ static bool ti_sci_pm_idx_exists(struct ti_sci_genpd_provider *pd_provider, u32
>         return false;
>  }
>
> +static bool ti_sci_pm_pd_is_on(struct ti_sci_genpd_provider *pd_provider,
> +                              int pd_idx)
> +{
> +       bool is_on;
> +       int ret;
> +
> +       if (!pd_provider->ti_sci->ops.dev_ops.is_on)
> +               return false;
> +
> +       ret = pd_provider->ti_sci->ops.dev_ops.is_on(pd_provider->ti_sci,
> +                                                    pd_idx, NULL, &is_on);
> +       if (ret)
> +               return false;
> +
> +       return is_on;
> +}
> +
>  static int ti_sci_pm_domain_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
> @@ -231,6 +248,8 @@ static int ti_sci_pm_domain_probe(struct platform_device *pdev)
>                                                    index, &args)) {
>
>                         if (args.args_count >= 1 && args.np == dev->of_node) {
> +                               bool is_on;
> +
>                                 of_node_put(args.np);
>                                 if (args.args[0] > max_id) {
>                                         max_id = args.args[0];
> @@ -264,7 +283,10 @@ static int ti_sci_pm_domain_probe(struct platform_device *pdev)
>                                     pd_provider->ti_sci->ops.pm_ops.set_latency_constraint)
>                                         pd->pd.domain.ops.suspend = ti_sci_pd_suspend;
>
> -                               pm_genpd_init(&pd->pd, NULL, true);
> +                               is_on = ti_sci_pm_pd_is_on(pd_provider,
> +                                                          pd->idx);
> +
> +                               pm_genpd_init(&pd->pd, NULL, !is_on);
>
>                                 list_add(&pd->node, &pd_provider->pd_list);
>                         } else {
>
> ---
> base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
> change-id: 20241022-tisci-pd-boot-state-33cf02efd378
>
> Best regards,
> --
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>

