Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C34BCCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 14:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uw6/hzM0Va4fKQxWOcWodfV3dKIrVId8Rctb0V+ktgM=; b=jUadLnI1lA0w2FCrfSbVTX5zS9
	4j+p2Nav4BZtq3HoeVqp0CmlaBisG2fHOmu800kUIKR331cAMEbh3cbewm1tNyAkdlqP+uuGkmyCp
	34WIPJLtbetRrm7XpFo7YKUaX4UvPY2y0PpP0nrrDHFbC0vWNPY5bXVZjqZ39WtDHdzlB7duXbAHB
	B/lvIiZy7GoAeVBQ7qYRJ4++8AToFvw8dD9g/rFJk4YSQM4y2o9ffhLHvrybIucKrNjeih1JluIB+
	AzLZYSjronyieZcxqy5qNAkDUzo5vyVT+Sn5y9/4q1VVL4QgTb8dWA1IRr20xMn/sop4LNqsZA6dt
	SaEKFpIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZfr-00000003B5I-348u;
	Wed, 22 Oct 2025 14:18:47 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZfp-00000003B4Y-1dAc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 14:18:46 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-783fa3af3bdso59253807b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 07:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761142724; x=1761747524; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uw6/hzM0Va4fKQxWOcWodfV3dKIrVId8Rctb0V+ktgM=;
        b=Qu4ohxwnwroI26MvSBu6lww/XFBxSUWV27RFlts3EnXEAAAhk+43EdEcQBobAtWfSj
         63UGUlyh5pVREN/2+Ohl/scbmOYkDca7sgk33vdiUSeovnGSEXpWENbf39kE6PjTPvdW
         kaQLB+MBV2iMowqgzp5tZaaQlrZc0845Dz6MbCycmF9+HWKPaz8cEjrAPRcLBNReJTMM
         UHBWOvHSR4P8WQTGBmMtZi6502NGXb3Ucu4H2iq8Irhv8VM3Ps3rhWSLG3XxtDL2aJja
         U4vXKIPhPZ28/dLNiGUIa7KoCzNz0fTQRHkL6vjxUt8JFZE2ohrOOOYr7f5ui70Vr3r/
         F3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142724; x=1761747524;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uw6/hzM0Va4fKQxWOcWodfV3dKIrVId8Rctb0V+ktgM=;
        b=VZuXj02f+jVeW8JJ92vNjPqBk86I3T00sY33yJ+GWrGft7hpKUqSOCPC32Mz+4FUaK
         6rFr+ZXxTJyTcCmdm6tYWJHm620vn16A5flyxIxBKB2ce/mfK8edvUnMqAMoPpP15fo3
         1Q8leK0wbsKy2QWEVDoA9H92jt3B6uEKOztdfTksuFBLBy/lx6hR9mqeXLLRTctkgYg9
         DP3+rTRf0/9E9/hNuZlJfy9B6XZY5112wYV9UrQkzhTyR/byILcDFBvV6+U1tOJijfa0
         5+59ZfBHtBTvPH+SqDJxG4T5qKXOGPsZS5kSTTPKIhkIVJnohj23KFWGQl5H/++JHZIS
         ISuA==
X-Gm-Message-State: AOJu0YxUOwuQUb04SV7fbGbMn3KBebVV13l8umdiSA0rSzbQPsG+qRgY
	P6x9ApBeAAigsbuBiMLaSAQSlJLjC5ZW1A8y3QY67aGQcREQwbI6iy12yjn0FrYAYsC8A8xzDfj
	Nnvn2j59jVHhbEbI9Avb8Os5ATrqmzc+FlZESRfYPDw==
X-Gm-Gg: ASbGnctvZyO8qUgVpwTiXOJ6XmbVamP7kDQaG93N85gSXeRukP8VrZ7zuFrIsHVvcaH
	ZU1D5ZInx/04B8D7Nf5z6KlQRuMVMKQPv8TtCG3npEm++tY091tt8SNpXnWWv83Da5/uDSs4OT6
	Y03kNVvnxSjEJNCtWy5irTdOoUYJigVgRPp3UMcTwNps/yCsqt4PidYqX2i0afSMwA77O6KIAGm
	ZtPd86jsofZ8Chru1O5bMcgWd257DddEYfx9kaTJbz+nwcKq+Uba2oGgVps1SIzpcObXjF4mhzl
	4IA8zaA=
X-Google-Smtp-Source: AGHT+IE/ssjKsgNbWyRTD56nEBKJW2asWvaLPOCHb8EEj54O1bJSDo+k8w+24YvVr2gUStMBX/PvLBOUj2GgxSU7iC4=
X-Received: by 2002:a53:4c0c:0:b0:63e:15e1:9fd7 with SMTP id
 956f58d0204a3-63e161f67e4mr12769934d50.61.1761142723672; Wed, 22 Oct 2025
 07:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <20251017110320.1186555-1-sudeep.holla@arm.com>
In-Reply-To: <20251017110320.1186555-1-sudeep.holla@arm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 22 Oct 2025 16:18:07 +0200
X-Gm-Features: AS18NWDV7BIC157b-gQVcJT7XzXiV0BN9XKqDRJKl4NksXyQ22QZCyn3B_TBLZQ
Message-ID: <CAPDyKFq0FvfX3GcVTP3ZwTLT=9DVKwpLuWq-gm=_aFZd6jKLeA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: arm: scmi: Fix genpd leak on provider
 registration failure
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org, 
	Cristian Marussi <cristian.marussi@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_071845_462434_1F864829 
X-CRM114-Status: GOOD (  21.83  )
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

On Fri, 17 Oct 2025 at 13:03, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> If of_genpd_add_provider_onecell() fails during probe, the previously
> created generic power domains are not removed, leading to a memory leak
> and potential kernel crash later in genpd_debug_add().
>
> Add proper error handling to unwind the initialized domains before
> returning from probe to ensure all resources are correctly released on
> failure.
>
> Example crash trace observed without this fix:
>
>   | Unable to handle kernel paging request at virtual address fffffffffffffc70
>   | CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc1 #405 PREEMPT
>   | Hardware name: ARM LTD ARM Juno Development Platform/ARM Juno Development Platform
>   | pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>   | pc : genpd_debug_add+0x2c/0x160
>   | lr : genpd_debug_init+0x74/0x98
>   | Call trace:
>   |  genpd_debug_add+0x2c/0x160 (P)
>   |  genpd_debug_init+0x74/0x98
>   |  do_one_initcall+0xd0/0x2d8
>   |  do_initcall_level+0xa0/0x140
>   |  do_initcalls+0x60/0xa8
>   |  do_basic_setup+0x28/0x40
>   |  kernel_init_freeable+0xe8/0x170
>   |  kernel_init+0x2c/0x140
>   |  ret_from_fork+0x10/0x20
>
> Fixes: 898216c97ed2 ("firmware: arm_scmi: add device power domain support using genpd")
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe

> ---
>  drivers/pmdomain/arm/scmi_pm_domain.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
> index 8fe1c0a501c9..b5e2ffd5ea64 100644
> --- a/drivers/pmdomain/arm/scmi_pm_domain.c
> +++ b/drivers/pmdomain/arm/scmi_pm_domain.c
> @@ -41,7 +41,7 @@ static int scmi_pd_power_off(struct generic_pm_domain *domain)
>
>  static int scmi_pm_domain_probe(struct scmi_device *sdev)
>  {
> -       int num_domains, i;
> +       int num_domains, i, ret;
>         struct device *dev = &sdev->dev;
>         struct device_node *np = dev->of_node;
>         struct scmi_pm_domain *scmi_pd;
> @@ -108,9 +108,18 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
>         scmi_pd_data->domains = domains;
>         scmi_pd_data->num_domains = num_domains;
>
> +       ret = of_genpd_add_provider_onecell(np, scmi_pd_data);
> +       if (ret)
> +               goto err_rm_genpds;
> +
>         dev_set_drvdata(dev, scmi_pd_data);
>
> -       return of_genpd_add_provider_onecell(np, scmi_pd_data);
> +       return 0;
> +err_rm_genpds:
> +       for (i = num_domains - 1; i >= 0; i--)
> +               pm_genpd_remove(domains[i]);
> +
> +       return ret;
>  }
>
>  static void scmi_pm_domain_remove(struct scmi_device *sdev)
> --
> 2.34.1
>

