Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A96E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svYQuLfhEmqpsKGv5zmj/4CoEXZ8crstXQtR8B+VCUI=; b=IqmUpPZCPDcgsHA87oA2SDCKIL
	/coDUsfyFAdn0c92fBcPaAe0WiUb6tY7TqvuJX4mQhQKdqSG5LcKECgOpfD//B6fYP2bM9vSwbMLc
	MGxQsGvId3/ONZDocIfAFDluic9ugQZdo+urIvFX4hGkq4Omh4gb89R88XabgaW8olSiIYDpYyGT2
	oq0u86gw3EXmpwzP8Y6yzjfidalB0/eZMv4RCci1vsrPTKZO92vjO1tKp3IDWkTwY+Y6kMgDooEtN
	1+0CbAPzER/wW0rANECykBHFLEzDbHeFyQnDnVKOT6a+N2Fif7O1nUJ9/unCEmIa3MgJHxV8ieFAJ
	dIFzzToA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0ru-0000000BgBM-1Tcr;
	Tue, 10 Dec 2024 14:05:42 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0ow-0000000BfSH-2JRI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 14:02:40 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e396cc8c9a1so4881293276.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 06:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733839357; x=1734444157; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=svYQuLfhEmqpsKGv5zmj/4CoEXZ8crstXQtR8B+VCUI=;
        b=nGcZmpHSpE0d7TZ6s8EIEomzm260R2DrHujEwGDkBqdkMElYPzVqWZeV/bszanBzaj
         ExS/lxN+X5xEMIyzwW4bWHfNC22WaWzml2oXOSF0yFmSd57EHRyhOl9xKnYz20G5vAd7
         OvUn2GapjX2Kfhkjo3uP8/wqWBXB2C6a6islqfCoA+eqSFSdgMH0A0BIDBqO0CLO0Mbz
         nt/sz16TdrA8wh/szc7wPrrpASOGgTIRftKg4C4bGm87ObEeXGphXPTHHqoakGBlKg6l
         im1HL+2EW6KF8WSCwzlmOYhCyT8QldiobvuKBTwgWfIoyN7JbsPmoxdVvwR7sGmYpmDs
         xxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733839357; x=1734444157;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=svYQuLfhEmqpsKGv5zmj/4CoEXZ8crstXQtR8B+VCUI=;
        b=MlRQpkru+q78nzh9Yjr8beqSn8ZK8m8XKjFi+lKQJf/1Tr+/ZEPq104PzLs1JYZ8KX
         HGa8mKvVA3c2dR+4bujaLNwKPnfX5gyI/rv54zXSSUdF9nPklzLvrdVnAln67tZuGNI5
         xW/dng8HySfN5slW/uciM2fYp3JFV5T4bvesKi6EsjkfIaWxaktR3piv2X+nszwqmrQ6
         slnu788s/ZudvS9LnSUrrjxWz93qq1F4d/SQ6XffaczH/sO6zGYZ4shkjubensULEl9Q
         bqRU2ghdUKWaF2XXZHHcerrou3Tid1v9jdMgtN9L7P7BPDCTbi9iN4qBvSvPQLSWuKH6
         3XOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTKgk+js37ExWflsGCjBDqMtljHqCs+xNrGco57wOnFtj0wjz2a8Z/AOMPY7OfRL65HaiTw/k52ATBKGg3vh7K@lists.infradead.org
X-Gm-Message-State: AOJu0YzDX8XcgmRJYkocfiocwXdYNdMHLrJAp3Pa/QUR92jPewTtY205
	odBYiLR1VMP2ENjfJRcXMYduRwbsLnkvjumZhaa0gaDHooUHgiFeWtbOO40lu0fGcq9KLSuXIRY
	0HUUEA1KYmcEETV6MvMkEfQu6sRMaTeIH1CeVIA==
X-Gm-Gg: ASbGncvI7KsCx7iSQcBPAiNIBx3aLWyrqsRGYcVNGM3mNG25oKO7Kr+JH1w0by+glet
	Dr2p4aYgU8LqBaiaeQIe/Jva8UaDj/uaqwEGx
X-Google-Smtp-Source: AGHT+IEzJ57H7PCrVou6RI7FrtDurF9EfDkpfB6eGI/q6LZuE371TG4kiUTgbNmxJFhn26kfli9GuUqdDrNxsUfzIjY=
X-Received: by 2002:a05:6902:1501:b0:e38:b399:590b with SMTP id
 3f1490d57ef6-e3a5da3808amr3395172276.2.1733839357084; Tue, 10 Dec 2024
 06:02:37 -0800 (PST)
MIME-Version: 1.0
References: <20241206112731.98244-1-peng.fan@oss.nxp.com> <20241206112731.98244-2-peng.fan@oss.nxp.com>
In-Reply-To: <20241206112731.98244-2-peng.fan@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 10 Dec 2024 15:02:01 +0100
Message-ID: <CAPDyKFpWfqpgmMpuq+69ee2FU7wOSgHUmfEcLpS1Dy2vx8c-MA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pmdomain: gpcv2: Suppress bind attrs
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pm@vger.kernel.org, aford173@gmail.com, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_060238_588120_0A5FD9FF 
X-CRM114-Status: GOOD (  19.12  )
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

On Fri, 6 Dec 2024 at 12:28, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> The gpcv2 drivers on imx8m series are registered as platform
> devices and this opens the possibility of reloading the driver
> at runtime.
>
> But this doesn't actually work. There are some hardware sequence
> dependecy between blk ctrl and gpc, also power domains are used
> by other peripherals, so fix this by explicitly suppressing bind
> attrs.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/imx/gpcv2.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
> index e67ecf99ef84..4db4d666f5bf 100644
> --- a/drivers/pmdomain/imx/gpcv2.c
> +++ b/drivers/pmdomain/imx/gpcv2.c
> @@ -1437,6 +1437,7 @@ static struct platform_driver imx_pgc_domain_driver = {
>         .driver = {
>                 .name = "imx-pgc",
>                 .pm = &imx_pgc_domain_pm_ops,
> +               .suppress_bind_attrs = true,
>         },
>         .probe    = imx_pgc_domain_probe,
>         .remove = imx_pgc_domain_remove,
> @@ -1549,6 +1550,7 @@ static struct platform_driver imx_gpc_driver = {
>         .driver = {
>                 .name = "imx-gpcv2",
>                 .of_match_table = imx_gpcv2_dt_ids,
> +               .suppress_bind_attrs = true,
>         },
>         .probe = imx_gpcv2_probe,
>  };
> --
> 2.37.1
>

