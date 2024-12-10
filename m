Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0387FE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=besKoqTUl8UspqMzSV4i/1U3YcYukO65Us63dIVJlmo=; b=tAqa0cmkzZewDBDwKmMCthG0Ue
	rrrBMLjPhhPQ0cIGVoU0hT6iB+Vkz35zd+ygPfpQPEW0hJcqHP/bcYFJpHvUu+vK/LS+xwC15XP+7
	q+gofQJdKA1X5U3VV60V1Padf3DjF6tOsCNUS372BAd/UwvTtdAQ+OFAhRwN4GHFsxqv5qSy0YxxE
	+ZBYaAfQClPYyms/WEm5hfCkLu3lYCT8QXkTfmj0y0eFXvV++O0ofMLs4AxmHuBxQY6Q4LqI1oLjN
	ckuqbpY8O0e6+VtFG/NIarIbekgl56ozbJdGnBn5N3dmu4ewJtBf69tglAjUCShNBkfKkwq/vn9rm
	DV/72B9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0qt-0000000BfxP-2qhs;
	Tue, 10 Dec 2024 14:04:39 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0ou-0000000BfRg-3koh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 14:02:38 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e3824e1adcdso4271991276.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 06:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733839355; x=1734444155; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=besKoqTUl8UspqMzSV4i/1U3YcYukO65Us63dIVJlmo=;
        b=vBWjnmnKhrinlQrUoTRAm98tL3qru4st9hPj4Gt29HxSKs7zpBuXUkKU/Ym7WIuZ4y
         8s2e+uApzm4zZTAZ9XhlyvFXKZnaP8bgDyG+iT5Mxehm33q3lwWdx72GZgWqQwk1N4ru
         MY8yChkyXW+AQaQyn9KtiqYMENOHOOMiJbvsyhA1IDHa6vqtNlKmIaZcJD/oG6bUkyVc
         xsynlsbok8ywzyPprtBru7YklUxQZL0NJ5PG7kD/jN80LOMbNEttBCed8S9jk/APdPvq
         fzssgEq+43rtr0+L53ueHUAJlhF7D4mVf660KTGc+GvQ21fERJhGoJ76eZH5BOMCCyiu
         2BeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733839355; x=1734444155;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=besKoqTUl8UspqMzSV4i/1U3YcYukO65Us63dIVJlmo=;
        b=gFbDS71g19MwGhxiIbHUdLVhA84X7VW+KeorLutFYglBNrL2ErFk4oD5Tx5qUuTYEi
         M1hhOGAxPiNpFBwW0dTEvs5qkj/Q1x2+PRvUsNFtmAS+OsOeUVB0mDk9/ZPxejqjeDsV
         VehCFxFqSX9yz7gWV52MGkYB32oNBm240AR2+V8YWeVsoU0GoLBMX2VaR1EL1KV0PPjs
         E74PvOv5E4QwjwKWmU/l3GfJj87O9NrH4LsUlFnYMVs81aakInBHst3gomnUUlfgZ1CP
         7flnHO46e2GwCDLBGWVaG7RteZgXk2JTOJd02093b8ODYn07o/I0wvCPz4LDF2PZvikS
         nHjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoFoaf+B0QX1RRF51VS0/3VbeQ/fEGUcPw5oyMzpNySFTGkB1Fks8mFKDJjN5Nwd9YHyRiuT7DqmOUJyyM1+xU@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq1hEHb3VXscVOsqAfYA6gxVmf8hz/RFdY/GQGmXHak5GturSW
	Uonf0Sy5jiZR86fG4OLYDp0PU9A4vAje3MuVwYPnMkjkUB6D3JaocNVxgCAMvwjds9h0cyMGUIt
	I6jl+BAq3l2w+mB2RtRLjkL9R+BPoEhvCdbY5lmLcBIF7tF/I
X-Gm-Gg: ASbGncs1R3V8/1GqOdnRq8KrpyO19ZeRAGKQkVmIXy1TqSB914PKwV+EbKllS3n4F4/
	7JsXFoxxy1zE1yPGL15/EwAawmhJZnaktNPa/
X-Google-Smtp-Source: AGHT+IFN1yCbB7HlDLaJwtDy5HM3+UgGOrK5CihsW5CiH9M8fU1rwshFqKnyFZ0DMkKGTqWE5e1F/csj0lrK/77hhbM=
X-Received: by 2002:a05:6902:2b86:b0:e30:d4df:4974 with SMTP id
 3f1490d57ef6-e3a59bdca97mr3979566276.40.1733839355475; Tue, 10 Dec 2024
 06:02:35 -0800 (PST)
MIME-Version: 1.0
References: <20241206112731.98244-1-peng.fan@oss.nxp.com>
In-Reply-To: <20241206112731.98244-1-peng.fan@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 10 Dec 2024 15:01:58 +0100
Message-ID: <CAPDyKFrM6wX5uWY8g0pgZNEZn8uG5hbD4JsAijBenOMWkEgD4w@mail.gmail.com>
Subject: Re: [PATCH 1/2] pmdomain: imx8m[p]-blk-ctrl: Suppress bind attrs
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pm@vger.kernel.org, aford173@gmail.com, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_060236_931517_2BA356CD 
X-CRM114-Status: GOOD (  18.70  )
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
> The blk ctrl drivers on imx8m series are registered as platform
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
>  drivers/pmdomain/imx/imx8m-blk-ctrl.c  | 1 +
>  drivers/pmdomain/imx/imx8mp-blk-ctrl.c | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> index 23db85b7aa9e..912802b5215b 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> @@ -894,6 +894,7 @@ static struct platform_driver imx8m_blk_ctrl_driver = {
>                 .name = "imx8m-blk-ctrl",
>                 .pm = &imx8m_blk_ctrl_pm_ops,
>                 .of_match_table = imx8m_blk_ctrl_of_match,
> +               .suppress_bind_attrs = true,
>         },
>  };
>  module_platform_driver(imx8m_blk_ctrl_driver);
> diff --git a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> index e3a0f64c144c..411dd548c67c 100644
> --- a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> @@ -862,6 +862,7 @@ static struct platform_driver imx8mp_blk_ctrl_driver = {
>                 .name = "imx8mp-blk-ctrl",
>                 .pm = &imx8mp_blk_ctrl_pm_ops,
>                 .of_match_table = imx8mp_blk_ctrl_of_match,
> +               .suppress_bind_attrs = true,
>         },
>  };
>  module_platform_driver(imx8mp_blk_ctrl_driver);
> --
> 2.37.1
>

