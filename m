Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CECD78333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uSc4oaHdwRNziEqNhHrjMgTiwYs2HHk19dmenoRtAWk=; b=TZe92tpD83PwqDkKEKCX3V5xLi
	gVYYfBDheDCE0BIUXyQR6hJYEKDZDQCO4eQSfNOBsbTy7Q/s4c1kYVLix+e1neE1KWvWsSp34IUda
	pLdssQcwLYDmNUChfvXeYBkq/2sPet6nxAt9DrwJcUYIHdKAHjpMSUZeNsFsn2+lJTUPa7VTUZcIH
	G3+xIG1vwGo9ZkqRBf44RDJ4uo4zx3o0fiRhdl1IXa3RsFevuAiP8x4nyEcYlyhhNL93LLcjvgOA7
	dLtAvqPLKLKn74X2C+HoPpb73lTXwyT6nNqfSDqGSGZzArWaeKjwb4cIr4MmZaDmLLl21A/u5GZg/
	Hlk8fC9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9I6-00000006qfo-09ZV;
	Mon, 02 Dec 2024 16:28:54 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI92V-00000006nUs-21ZN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 16:12:48 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-6ef824f40dbso14464887b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 08:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733155966; x=1733760766; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uSc4oaHdwRNziEqNhHrjMgTiwYs2HHk19dmenoRtAWk=;
        b=ORfRDOr6yyF57/rKUROJZdGS9lwmHMCJd7zple/wi38briR0wL/MxnSLnRCuaFDo78
         xfcr4YFIDaErxOg2OhFwankO+bhHLX7/a8xy2Ons9W36RKfxSRF1K75NB/0wdZuRxPXR
         lHQXGIDLD40kKoC/4hjPgfghMb4y8mjyViHsYA8wDbSX9wQmcOJZNhGatKkLS9psOPbJ
         io3ov/ZdunbpiFdw495eNU+qwvJ5Bh/VJVTdlUTe50gTR2x9w8kiSJQUDQQaQr0ACa8g
         x5OJ+nTsl49HacgQV7cLpNzK6mi8tH3pYkdrQBMOKFdhLtOD9Dsu7DF8h/b5DEL3uFKW
         XEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733155966; x=1733760766;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSc4oaHdwRNziEqNhHrjMgTiwYs2HHk19dmenoRtAWk=;
        b=sWy8MEy4IQCFQxcPIPeCgG7ncAPe/7ecWLoUXkHUKr2Jv7f+UcgzWdJJPNZih7+gsm
         OSI3NLq0fGFwSc9Fk24xfI/i4G7TRQ1LQGpVnf60xb5aOjG1YCO+tVlYiIi3FBpxuz6B
         aZgyWsUv0Fu+TkZTS+HFuWSjTbDiyAvIMxkopt34Td5AA17zPG/T3OtqeEmJhp8DW+8B
         Y+vnjMimq7e1M1qRJdh81gic8tjn/MIFh58ibWtAcSwf/l4ZSeM/pGnE6G1dYhQVh+FR
         PrDXt+3ZsWYER3TCX9tYk/ld2mnIiXLDvIvbWROvRGiXbHfNXl6VMCoBqGyVP0s6DsX2
         X9eg==
X-Forwarded-Encrypted: i=1; AJvYcCW0GmoHaAd91r/+OD4bzLWdVja/4Ce9Rn9jgS+csaIdk+5xyap1Wlyule+7/2kmYS7ynezkWRpWj58v8DziPVy1@lists.infradead.org
X-Gm-Message-State: AOJu0YzTta8qkPsVWvNAM+4CPLM94k12GLTAD1uePd4BGlIjUDvJ9iH1
	w+bFb91RQoz+JsNNAVAbKp0q+vlOCGs/3/eMWPh/pwOo4VthU6YRQXT5zLtCKe0kRIrA0hvUFcV
	M6km8bS8uNd5MYEwMAjTyhGflSiallqylO/P6HhRF80Mlh8oj
X-Gm-Gg: ASbGncuGW7GxgTILa9Q5LzM2tsq7Wqo2Kz1UoPtexnzHSHR+/86eFBslt/hvitcniEB
	RQ+wggEo1lgQlwwTPp1nxm9EB1PAuCbUE
X-Google-Smtp-Source: AGHT+IHONp0dk8Yoe87v3UNeSPiKD8c6OQO1yBQtzwhyjC1T8YXjuupz6BUT7dFNeVR/yJzTpI+zO7gY+3/7XDn2iJM=
X-Received: by 2002:a05:6902:e13:b0:e38:b34d:121a with SMTP id
 3f1490d57ef6-e395b8af561mr22234937276.20.1733155965799; Mon, 02 Dec 2024
 08:12:45 -0800 (PST)
MIME-Version: 1.0
References: <20241121075231.3910922-1-shengjiu.wang@nxp.com>
In-Reply-To: <20241121075231.3910922-1-shengjiu.wang@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 2 Dec 2024 17:12:10 +0100
Message-ID: <CAPDyKFrm8wv7uFAumx5d6uMhr=LLUT8_RsQhNMF4DyOUe7uMFg@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: imx: gpcv2: Adjust delay after power up handshake
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	shengjiu.wang@gmail.com, francesco@dolcini.it
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_081247_517780_8A051004 
X-CRM114-Status: GOOD (  18.46  )
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

On Thu, 21 Nov 2024 at 08:53, Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> The udelay(5) is not enough, sometimes below kernel panic
> still be triggered:
>
> [    4.012973] Kernel panic - not syncing: Asynchronous SError Interrupt
> [    4.012976] CPU: 2 UID: 0 PID: 186 Comm: (udev-worker) Not tainted 6.12.0-rc2-0.0.0-devel-00004-g8b1b79e88956 #1
> [    4.012982] Hardware name: Toradex Verdin iMX8M Plus WB on Dahlia Board (DT)
> [    4.012985] Call trace:
> [...]
> [    4.013029]  arm64_serror_panic+0x64/0x70
> [    4.013034]  do_serror+0x3c/0x70
> [    4.013039]  el1h_64_error_handler+0x30/0x54
> [    4.013046]  el1h_64_error+0x64/0x68
> [    4.013050]  clk_imx8mp_audiomix_runtime_resume+0x38/0x48
> [    4.013059]  __genpd_runtime_resume+0x30/0x80
> [    4.013066]  genpd_runtime_resume+0x114/0x29c
> [    4.013073]  __rpm_callback+0x48/0x1e0
> [    4.013079]  rpm_callback+0x68/0x80
> [    4.013084]  rpm_resume+0x3bc/0x6a0
> [    4.013089]  __pm_runtime_resume+0x50/0x9c
> [    4.013095]  pm_runtime_get_suppliers+0x60/0x8c
> [    4.013101]  __driver_probe_device+0x4c/0x14c
> [    4.013108]  driver_probe_device+0x3c/0x120
> [    4.013114]  __driver_attach+0xc4/0x200
> [    4.013119]  bus_for_each_dev+0x7c/0xe0
> [    4.013125]  driver_attach+0x24/0x30
> [    4.013130]  bus_add_driver+0x110/0x240
> [    4.013135]  driver_register+0x68/0x124
> [    4.013142]  __platform_driver_register+0x24/0x30
> [    4.013149]  sdma_driver_init+0x20/0x1000 [imx_sdma]
> [    4.013163]  do_one_initcall+0x60/0x1e0
> [    4.013168]  do_init_module+0x5c/0x21c
> [    4.013175]  load_module+0x1a98/0x205c
> [    4.013181]  init_module_from_file+0x88/0xd4
> [    4.013187]  __arm64_sys_finit_module+0x258/0x350
> [    4.013194]  invoke_syscall.constprop.0+0x50/0xe0
> [    4.013202]  do_el0_svc+0xa8/0xe0
> [    4.013208]  el0_svc+0x3c/0x140
> [    4.013215]  el0t_64_sync_handler+0x120/0x12c
> [    4.013222]  el0t_64_sync+0x190/0x194
> [    4.013228] SMP: stopping secondary CPUs
>
> The correct way is to wait handshake, but it needs BUS clock of
> BLK-CTL be enabled, which is in separate driver. So delay is the
> only option here. The udelay(10) is a data got by experiment.
>
> Fixes: e8dc41afca16 ("pmdomain: imx: gpcv2: Add delay after power up handshake")
> Reported-by: Francesco Dolcini <francesco@dolcini.it>
> Closes: https://lore.kernel.org/lkml/20241007132555.GA53279@francesco-nb/
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe

> ---
>  drivers/pmdomain/imx/gpcv2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
> index 6e6ecbf2e152..760301ad8e39 100644
> --- a/drivers/pmdomain/imx/gpcv2.c
> +++ b/drivers/pmdomain/imx/gpcv2.c
> @@ -403,7 +403,7 @@ static int imx_pgc_power_up(struct generic_pm_domain *genpd)
>                  * already reaches target before udelay()
>                  */
>                 regmap_read_bypassed(domain->regmap, domain->regs->hsk, &reg_val);
> -               udelay(5);
> +               udelay(10);
>         }
>
>         /* Disable reset clocks for all devices in the domain */
> --
> 2.34.1
>

