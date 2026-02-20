Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFB0C5ACD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 17:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0trHNOrgefpSNI9Sqms7GIwOoQ1xOeXiRaiveU2TCY8=; b=Qj4oaDBm/fG8jOOfR5o2wtcMrU
	6Y4YfXPXSI1vLNqKY6vU3WLm+Zh9NnNGkcxC6rivtbfIXvx3ks8Ok+npyFB3v7FBxev3huoeAVdtm
	+FxAc7XYHByBzQJtWdztOeiQv4iQI7EaH83SWeUGWJvnh5HLjUPVWonOzFPLB8bc95QaD2+buwVsR
	9uU1eaJJMshvOXZkQcTUvkUpIcQX0MobwR6pcZVyshX65Y/3RciErX1USlT5NsZSkTDQnYR5aIwMY
	EnPnDrGt6Bw39wUmawfUv+VJMT9Nyjme7KXebluktU7C94WvNy+DrCXiJ5Zroiz7531Uma+4YG0se
	ljfxPOKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtUMl-0000000FNLY-0Vbe;
	Fri, 20 Feb 2026 17:32:35 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtUMh-0000000FNKw-0XJV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 17:32:34 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-8cb49f63238so138755585a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Feb 2026 09:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1771608749; x=1772213549; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0trHNOrgefpSNI9Sqms7GIwOoQ1xOeXiRaiveU2TCY8=;
        b=HOkjUR81BFNs0PAryVbmU2e5aJ44mtX/uPQThVYKstY1Iauz7xPG94fihtKToQfvbk
         Ybv6pPj7A5k/MlkCNhmrOU68ffWvr7nHc4GCMGRiVyWv4ziqlCnxYZs7F8w4ye/XOpde
         YnzMRwqeRB1PejXdEazNcWk9hZL8PmGEOmPlb4TcFy+kSGI3UaJpeirkQMiSzDSy3j1x
         ed95bTPncjVJUX5ZpsgpKYT+NyTR4n00ZQKb2rqtn0wBFEGUdg2vOPl1mYrDj4WvGtmA
         xSxfIaIsxV3Iqb4up5najE7cHDdXzbKsFlLGit2YbHgvrMdtJVFFb6BuqrhfshYvHXsG
         cPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771608749; x=1772213549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0trHNOrgefpSNI9Sqms7GIwOoQ1xOeXiRaiveU2TCY8=;
        b=duW3TL3nHncq26yzWQeSTgnNYphBb+D+Rz/FuCoLwMoxEpHZXk/obMX+kXUKTndFTZ
         CZy9gC1slLdw44tKOReTSrL/NaY5AVBMCAxZP9wMpACZEWjT3cSS4XwZA81FAcr3yrKT
         QMtbVEBSFjWDsWf4gcULho3+TVjdYwUmiaRfvJ4evT8wNlzKOI0X+aeSbh6YOygKjgwZ
         8v5P+L6tWkyOldEV9UDDw6xgCctJSGTq0iT/6cwzuRkjnkpL/iCma9e5iTsMlOphd25H
         YbUweT6XW60/kcHt5fvM9SilQKg0jqlYI+E9LDTHfd0PTlaZeFtTXSlPHjZ2r6i65sK8
         /7dA==
X-Forwarded-Encrypted: i=1; AJvYcCW5lb6fOxbas7DoIPfYxHpeK++Wmr83cAdz+z2k/nmLsWpWVk5hTIshEXNyv6CwxkUl7eoVEbHy5wlTKkXehJ3B@lists.infradead.org
X-Gm-Message-State: AOJu0Yyssn8ZwbHK2azqZ1GSC/bZgmO+VUXHlZqoWTZ4l/unOs2ny8+5
	5JihYbPHnkj84sNq17b06cxCSzO8BCJY8yBFg2BFHbG/UjFBC0KQt67EZB71qJK9Wg==
X-Gm-Gg: AZuq6aJLUGLXSkON2hOsv5X15tugZmtZWDRVPfMBPrAgVeRLvZ5NTl4LcuZEkFU51jv
	vZ3E1IoHuEebF4/nPFxowgaExpUiC7BkvBdWMzmsNgOTuNpR409UL/Ws4CqKdg1sc/Rva9D2x90
	P/hGAdxjf2l9GE66lPUTm09xN+fKlKpDZYEFqMBMGwfYQtpqtZik8Bcly2Y2eqmHZQTIE94KNM4
	cDgdIBbwfWEhwrwtY6X0HQmg4d/Dj06cBUs/qdw6NfCOClwq4uNhV4BRefthM8imBLv+9YZ0Ct2
	m5PiiYQMUwV/0+sSU4IqQBMEYqxlPi1aQzrUJLb7QHyhSR/KO3752pPqBq6SWyv43+BdIC3kLsu
	oXi4mfY1Lz1o+KzHtlFAHHZ93p90F0ExyOlCHDQXvr3qpQj71nJluX71VcWx8NhMzKTSSPqMBlD
	YMDFqB4u7bVhqYH3/FfErZjRAW
X-Received: by 2002:a05:620a:1a85:b0:8c6:c08d:275b with SMTP id af79cd13be357-8cb8ca800cbmr38474085a.58.1771608748986;
        Fri, 20 Feb 2026 09:32:28 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::4383])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8d064007sm2642085a.19.2026.02.20.09.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 09:32:28 -0800 (PST)
Date: Fri, 20 Feb 2026 12:32:26 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] usb: ehci-orion: remove optional PHY handling code
 remnants
Message-ID: <d28ec80d-3083-4217-9923-93872bbbd07e@rowland.harvard.edu>
References: <20260220-ehci-orion-drop-phy-handling-v1-1-01abd9f168cc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220-ehci-orion-drop-phy-handling-v1-1-01abd9f168cc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_093231_575033_395F14CB 
X-CRM114-Status: GOOD (  25.96  )
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

On Fri, Feb 20, 2026 at 02:27:02PM +0100, Gabor Juhos wrote:
> Since the USB core code handles the generic USB PHYs automatically, the
> optional PHY handling code has been removed from the 'ehci-orion' driver
> entirely by commit e04585184dcf ("usb: ehci-orion: avoid double PHY
> initialization"). However, the devm_phy_optional_get() call has been kept
> so the driver still gets the PHY even though it is not used for anything
> in the driver.
> 
> Drop the remaining code, and also remove the 'phy' member of the
> 'orion_ehci_hcd' structure to simplify the code.
> 
> Fixes: e04585184dcf ("usb: ehci-orion: avoid double PHY initialization")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ehci-orion.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-orion.c b/drivers/usb/host/ehci-orion.c
> index 34abff8669f8bf096f4547b6ce0977eb130b3c8d..eaaa49712a8c64928771eb317165091480245d0f 100644
> --- a/drivers/usb/host/ehci-orion.c
> +++ b/drivers/usb/host/ehci-orion.c
> @@ -12,7 +12,6 @@
>  #include <linux/clk.h>
>  #include <linux/platform_data/usb-ehci-orion.h>
>  #include <linux/of.h>
> -#include <linux/phy/phy.h>
>  #include <linux/usb.h>
>  #include <linux/usb/hcd.h>
>  #include <linux/io.h>
> @@ -60,7 +59,6 @@
>  
>  struct orion_ehci_hcd {
>  	struct clk *clk;
> -	struct phy *phy;
>  };
>  
>  static struct hc_driver __read_mostly ehci_orion_hc_driver;
> @@ -276,13 +274,6 @@ static int ehci_orion_drv_probe(struct platform_device *pdev)
>  			goto err_put_hcd;
>  	}
>  
> -	priv->phy = devm_phy_optional_get(&pdev->dev, "usb");
> -	if (IS_ERR(priv->phy)) {
> -		err = PTR_ERR(priv->phy);
> -		if (err != -ENOSYS)
> -			goto err_dis_clk;
> -	}
> -
>  	/*
>  	 * (Re-)program MBUS remapping windows if we are asked to.
>  	 */
> 
> ---
> base-commit: 2b7a25df823dc7d8f56f8ce7c2d2dac391cea9c2
> change-id: 20260220-ehci-orion-drop-phy-handling-d93c15c92042
> 
> Best regards,
> -- 
> Gabor Juhos <j4g8y7@gmail.com>
> 

