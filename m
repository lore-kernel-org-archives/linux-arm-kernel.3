Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59216D3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 15:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vMOElam5lFCQ00bwoN+FTpOkP8287mrJpVz34H2qYuM=; b=2/rMJi29fxtjOSzr0wPQzThX88
	76NwGFib8pO1IhtD1+yUVoJ5jVkiOewIZY/tzmEB2H6iBnZ+jWwZ8LEez//NpLCzyf38sZLLLwBhI
	DGKsP5PDVYNngv+b4DbxwybIpApGVgZfnq5b7jOVvVA4LeQNAWvGaLZmNCHQAUc8YOaHFI7twwHtk
	8ESK3vybNl+e1FmUEubZQ69G5KrMrKppLHPAqKAILr5vdJG38vVE2DlCyz/8dERKX81eMMQ3W5pQj
	RA57Jpx6prQYNCB29UG4sd2/FR5lREWOYzXAksyKR5Xz4XSeypPSeHVGw+wG+14TcSrsUA1lgOwlD
	F7qiY9Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZt3a-00000002qxC-3dIr;
	Sun, 28 Dec 2025 15:51:46 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZt3X-00000002qwp-3efR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 15:51:45 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5957db5bdedso9772144e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 07:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766937101; x=1767541901; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vMOElam5lFCQ00bwoN+FTpOkP8287mrJpVz34H2qYuM=;
        b=BQuEQWGjDVCpgWuzfnMdnzlAJ8PoXZz0ks6jhj1sY9tzt4avrDe/cL2M/VquFq0JF6
         qH9Nbv9CLnRhLX8n+6PLPoT3DxWtOhFq0Yq3AesDf+MEfWuO1tGoRtKhdNxAmZZpcXIk
         oLJQXiPgmYCzy82rctDJp0eLK9DcY6IxL6Y8sEorbEbCfWbVjYQA6tiQVDnLh+/gTI7x
         FDkAJjUOsFnd/j+8yhzfVJ44gVX6W1qFu/U5rCz7pceOHGeTowW9wdxdhBbgR9QNiLBH
         vs/Cman7WDMBFYVEuXwJRYRElrkpozidIifFj0F3vxP+IoMTjrE1gCNOL0qyGpT7zNOp
         s7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766937101; x=1767541901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMOElam5lFCQ00bwoN+FTpOkP8287mrJpVz34H2qYuM=;
        b=Ga0O6MWnvuP7Lzvy3zcnZvKS2vY9ubYaXvo/8p9iPK0S5A7ozAZymmi5RPWWzN7LXp
         pc4ASoTLX23sRI8+XoRy/sCez8uFESPSWdUutyU27etpl8/G5a/JVTBfXJX0VtZdGvG2
         ruRKBc4Qim1WsJviD+udANU+tYDT09W1t4BkeBgbXsnmcSuagKrQa8Z3NZKUvwa/zIpm
         B6yFYJeDl2nB+l5ZwaF+j4LrDjKA61qO4gsC+foSl4Il1OzYmBZEORgejltZnRUzE+/O
         S+NSektMKP2BF5s/Asvsmbk2gW/J7RzzG8qoiZ68VUuO0dBMJr03xFMvwWbGbQ0dgOKG
         Ek6g==
X-Forwarded-Encrypted: i=1; AJvYcCXybw7CTlcfhmk3XVU/h6uZT1Ik0VJN/Z8Vt8P8WA7yWLVWpnvUD7J6k96pPIiQeyjVTSD3eJL1TOaVesgVGe35@lists.infradead.org
X-Gm-Message-State: AOJu0YyifmL3D5JqYxv09/xjHQuhEkojE/KtCq7dfsfOS6gNqwkd0bWT
	RFwRYJyOCQqYMwnCBricJhLPBFT3giYrpXSLyvkAvDEF6cPW2D/ltiptqYO0MRdTuswp5YlU1Oi
	tmKYb7GRGloaHVkrgXo4h705aftT1Wrf9H7Lg43o4rw==
X-Gm-Gg: AY/fxX7rLZi3ycw233cVJUIpmXMA3vlMie84DbQydQiT0iJ4EDbDq10G3yJuIh+D1Uc
	NFkif7Mgp7y87N0VFPRp90VA4bOUYkPp2PpSS6zaRkkeS9ccR1FyBzDOjk1hu32ce72sf/VgmYA
	9a5nnDI7nc0cOWXvtHsy/HsYJ1ftghxj8d6AO677kFYNnoFlsYhuQdZUTyPUUnTtIBXrlj3uCDz
	sAJiPXxUhiNnq+y8l9TMXmzADaA0R4QxPiHSzrcwA5bTdFY/sRWmvNHlCOVxkjGuZBu9uZg
X-Google-Smtp-Source: AGHT+IHLUFVsnwRwkLFb3Tq4L6Zc3f/V8NutlxDmQ4VBL3ts9a5/EsxCVdAPRyCi+loA38VXEQC6iUojrpiM88ffZ7E=
X-Received: by 2002:a2e:a913:0:b0:37b:ba96:ce07 with SMTP id
 38308e7fff4ca-38121596892mr81755101fa.15.1766937100554; Sun, 28 Dec 2025
 07:51:40 -0800 (PST)
MIME-Version: 1.0
References: <20251211040252.497759-1-vulab@iscas.ac.cn>
In-Reply-To: <20251211040252.497759-1-vulab@iscas.ac.cn>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Sun, 28 Dec 2025 16:51:04 +0100
X-Gm-Features: AQt7F2q4HOmCP3AtHKfQGHLB3c99yZpMtVEIsP3Gmo2gfisxBcr_gBvsZWBQEl4
Message-ID: <CAPDyKFrPZqwDmgFuPfbpX+FF3-r9F-r+9+Mm5v8z5Wb7TQJvmg@mail.gmail.com>
Subject: Re: [PATCH v4] pmdomain: imx: Fix reference count leak in imx_gpc_probe()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_075143_945492_70B33D05 
X-CRM114-Status: GOOD (  18.00  )
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

On Thu, 11 Dec 2025 at 05:03, Wentao Liang <vulab@iscas.ac.cn> wrote:
>
> of_get_child_by_name() returns a node pointer with refcount incremented.
> Use the __free() attribute to manage the pgc_node reference, ensuring
> automatic of_node_put() cleanup when pgc_node goes out of scope.
>
> This eliminates the need for explicit error handling paths and avoids
> reference count leaks.
>
> Fixes: 721cabf6c660 ("soc: imx: move PGC handling to a new GPC driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Applied for fixes, thanks!

Kind regards
Uffe


>
> ---
> Change in V4:
> - Fix typo error in code
>
> Change in V3:
> - Ensure variable is assigned when using cleanup attribute
>
> Change in V2:
> - Use __free() attribute instead of explicit of_node_put() calls
> ---
>  drivers/pmdomain/imx/gpc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index f18c7e6e75dd..56a78cc86584 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -403,13 +403,12 @@ static int imx_gpc_old_dt_init(struct device *dev, struct regmap *regmap,
>  static int imx_gpc_probe(struct platform_device *pdev)
>  {
>         const struct imx_gpc_dt_data *of_id_data = device_get_match_data(&pdev->dev);
> -       struct device_node *pgc_node;
> +       struct device_node *pgc_node __free(device_node)
> +               = of_get_child_by_name(pdev->dev.of_node, "pgc");
>         struct regmap *regmap;
>         void __iomem *base;
>         int ret;
>
> -       pgc_node = of_get_child_by_name(pdev->dev.of_node, "pgc");
> -
>         /* bail out if DT too old and doesn't provide the necessary info */
>         if (!of_property_present(pdev->dev.of_node, "#power-domain-cells") &&
>             !pgc_node)
> --
> 2.34.1
>
>

