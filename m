Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF70CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzEB3oyqwg8o4qvK1OgqXlnhNgSoMuFMpP/k/75t3xc=; b=h4TwqKF64xN4aZq6na+YG9DnpJ
	v4dzRMEPCZ9xRxTvPhyil1dsXZdbQ5SCjWfAnytQz1e24krqvpj9F3tdKTwTNvygIaDUVK7pmtbKz
	51tw6gRcV8pE/RsHKobX4K4cFc2lvQG4pbJD7F8rp2RnR8hwgTtDAKHWwino9r0oNPTgXbC2j44HN
	h3gujCGX3XR7XFLPTMa+OIQtDhLpVcRKhqQSl2lwqUbELo0DWL8LQyz+4KHB3skj3uWjYxnOmRWWx
	OAimIfS8SCW1oR/mJpgiHE+iYQBZ2C/eDbmwydqobW6wawg7lfUNApqcjpjp5XUmbXmCnMlOxZCsF
	4/tEyqXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGJ5-00000000IXP-3mLR;
	Thu, 18 Sep 2025 15:12:23 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGJ3-00000000IWT-3V36
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:12:22 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-ea5bafdfea3so1249686276.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 08:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758208340; x=1758813140; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jzEB3oyqwg8o4qvK1OgqXlnhNgSoMuFMpP/k/75t3xc=;
        b=MSVy9HK1hdrfsogC6LXfrnOq5UdcwLLt6Jd3Z4NcCMmGiweaWKyvxu+1OqIbCSLIO4
         7zeduBgxubJvbhX77AR21aX8oPozDEsXa+bf8kDBHBgPaPhC0xBeKqWoJ+PFyD9AAYwT
         bcPSt9fE53CljxyKXqIxzbn3RwpyNj4ay26Pb42S2qImBNGjv/FBS6ueNQVXZO/azczh
         afvIriNvyFXZJD/7tHtZyY8BM3xgjP4dNL0vsHMw4Atoc+VbJjlMzk0pSmm50h5sNFnr
         LtlrFuScAn6rH8jJNXTtP6PDv/+RsKmMNboiV5GUviRJk0nlA8ywvqVOAqJ0Lal9hs9m
         L06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758208340; x=1758813140;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzEB3oyqwg8o4qvK1OgqXlnhNgSoMuFMpP/k/75t3xc=;
        b=WBQLPnrN2rT2DrS9eMHvuFrVc3z053DJTXGz5GMYktSqrxX8uwYZXxciOsGsV5nuKL
         acku/S0v3m0G1NAp4pLIMNcQNhUPMff2u1oeDkH24qPUvBzTWLxyvjzWTPOK0gKt3JVa
         uorvLIO1oClSyBzGcb+fe8kevjo+SEz0kyaTnxkPssBqZ7JKOa4OhRzLhEeJ3ndeENLm
         wMwZ6uLx5bpf1wse87TG6pPGrWFSreJGQsDPeHQE7XKcjirThrA+hVDEYD+Jc35jlmgG
         YNFSYrhXiee4LYf98NQuJa2SvgCja5szEOGUQ38/mJwyUuvqwsjia7sgYm2jk8v7hmGa
         Y/UQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvCSqeMbLcliAPu9gbplcOBjTR/ssVjXFWf1Di9WoUKQ1J9BFFirvKPuaEzVXFd8PjOuwFCI5A7bm/IJOfId73@lists.infradead.org
X-Gm-Message-State: AOJu0YyVCYRggLR0Jg2VitGHOzyu413nhzVDVOjG7PTnUnYMSV2HMLoP
	fDnssnF9HbSG15MoPZ6aurcN/1QFq6SgwxQZEvDb5FeiDmQCAF3pdPNWZa1DXG23bhIS8DGbqGm
	gH9GCsi+RSRJ9F7EZ02BS8RfSWxdiKWAO76sZZJB+ig==
X-Gm-Gg: ASbGnct+d0A3mBsUN2wZ1azIG1AZkZ09So8B3OUDJM31Q/0O+QS2q+OSgiPztTXl+x9
	JlMP8pCXUn7DAMw1FmXShDpWgyubGGWINZkXiJ7CyilRx4Fs1vhjWyPZb5kcO24GkzKGIOVwAOX
	ZsPM+8mmlY6+E6W66WcN9lXU1U5PT13HEwnQKhyQi6N6oMx4+eq1p+lZZSN6cL5pyelzu9PjC4i
	p6It3WCzGf3o9unDb4cqdGxn0OafC0RyfSGpA==
X-Google-Smtp-Source: AGHT+IFOOt5NOlhICVzaBKD3GERcW4IuNpGDCitHn0o/LFtu2/I5P/MFLfzOEfmO/oH8TvqHphqHmXeYL1qjVazMwlA=
X-Received: by 2002:a05:690e:4287:10b0:633:b6b5:ef2c with SMTP id
 956f58d0204a3-633b6b5f5bbmr4133202d50.27.1758208340325; Thu, 18 Sep 2025
 08:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-pm-v3-0-ffadbb454cdc@nxp.com> <20250902-pm-v3-2-ffadbb454cdc@nxp.com>
In-Reply-To: <20250902-pm-v3-2-ffadbb454cdc@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 18 Sep 2025 17:11:44 +0200
X-Gm-Features: AS18NWAvbbmow72oBLB0fop6cXMFfTOtiltZJomLBqlvFFcV_ry6i4BBGlzd4Ow
Message-ID: <CAPDyKFqyLV7UF0E4WxYQrqv3HNuSZCet=F62Lvt7nBYJMOZQeg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] usb: chipidea: core: detach power domain for
 ci_hdrc platform device
To: Peng Fan <peng.fan@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Xu Yang <xu.yang_2@nxp.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_081221_880392_BB5E55B1 
X-CRM114-Status: GOOD (  21.17  )
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

On Tue, 2 Sept 2025 at 05:33, Peng Fan <peng.fan@nxp.com> wrote:
>
> From: Xu Yang <xu.yang_2@nxp.com>
>
> When add a platform device by calling ci_hdrc_add_device(), this device
> will reuse OF node of its parent device. If power-domains property is
> provided in the OF node, both two platform devices will be attached to
> the same power domain. This should be unnecessary and may bring other
> inconsistent behavior. For example, to support wakeup capability, these
> two platform device need different power domain state. The parent device
> need NOT power domain on for out-band interrupt, but the ci_hdrc device
> need power domain on for in-band interrupt. The i.MX95 Soc support
> out-band wakeup interrupt, the user need to enable wakeup for the parent
> device, but if the user also enable wakeup for ci_hdrc device, the power
> domain will keep at on state finally. To exclude such inconsistent
> behavior and simplify the power management, detach power domain for ci_hdrc
> platform device.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Seems reasonable to me!

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/usb/chipidea/core.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 694b4a8e4e1d8583dcbf4a42f8c2dfd785d5745c..70597f40b9997a9766934c67bbbed38e96c210f8 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -27,6 +27,7 @@
>  #include <linux/kernel.h>
>  #include <linux/slab.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pm_domain.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/usb/ch9.h>
>  #include <linux/usb/gadget.h>
> @@ -915,6 +916,8 @@ struct platform_device *ci_hdrc_add_device(struct device *dev,
>         if (ret)
>                 goto err;
>
> +       dev_pm_domain_detach(&pdev->dev, false);
> +
>         return pdev;
>
>  err:
>
> --
> 2.37.1
>

