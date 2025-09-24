Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BB4CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 00:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cCdQuWMSBorsyja2Ch1l6GXItVozkz899teDhpu3jI=; b=VuEojG5Z5YjCDhv8JwlM3Fv8Tn
	2I9/IzyuYeb3cst9EQ2yoGeLI4Popg3Co4lwZ/l2kB4taE74Sx1ZAU7OzZbIXLTgH1QdOivc90mGB
	la9XcP+b1GfIOn1t2T5CzliqKOlqyEMuJAT0suFUCsD4OX6TamCXEe+5/yri8zV0nqTnwnYnCotOo
	eGqTBWQfPBZOzRiiQiirWX2K7sNoS2uZ8mOQ6t15RcXUpP0XJzPHZ6cpFiQVNmMIW/Aih6YxyR+OT
	s4QrUWcpmcwcuK266wvMCAfbM+quhvHZGI+CFZ/B66mB44WL11ca1EOPCQZRM/oJgsko4A0rwm2Vj
	inP183hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1DU5-0000000FDyN-1euv;
	Wed, 24 Sep 2025 00:35:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1DU0-0000000FDxu-30F4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 00:35:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CFEB540490;
	Wed, 24 Sep 2025 00:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17DBBC4CEF5;
	Wed, 24 Sep 2025 00:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758674143;
	bh=DRhxi2T0h0T058uT0q5WDIBIuhGBboq7dtvoADz/Vcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rnbO/Ue6pEe98CQSQtGfI/WCHp27rIl9ETccr9wK+XKbPEhAVgOEGrmuG5DdpnxYB
	 6V2epqcVFYfp6oNtXqyPk2zHR++EaJK21xyt50aEfVAg8Bh8K/nbuTVeEpEqIWtwAb
	 KXVY1tj1exQGp2xVpevO/ziNcdTCFWrLiAfB3uAvrREIb6SYKMzJPotf3swUuapCSY
	 BFY17Z56mWjoU7tKyyVmISX+fR8PZbEAJBxY7jKlLW+JXQoNIddc05W0Zd2dHI1Zpb
	 14Qh/897rQXmwBSe20Lwo84HWIC38peCrSERGRqLRl0H+Ckpo/UGlBhPaU2tdiYWcz
	 G65sFg9c4Rrfw==
Date: Wed, 24 Sep 2025 08:35:37 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v4 3/5] usb: chipidea: core: detach power domain for
 ci_hdrc platform device
Message-ID: <aNM82SUSoQN6cKkD@nchen-desktop>
References: <20250922-pm-v4-v4-0-ef48428e8fe0@nxp.com>
 <20250922-pm-v4-v4-3-ef48428e8fe0@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922-pm-v4-v4-3-ef48428e8fe0@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_173544_780977_51F89FB8 
X-CRM114-Status: GOOD (  20.90  )
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

On 25-09-22 10:21:08, Peng Fan wrote:
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
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter

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
>  	if (ret)
>  		goto err;
>  
> +	dev_pm_domain_detach(&pdev->dev, false);
> +
>  	return pdev;
>  
>  err:
> 
> -- 
> 2.37.1
> 

-- 

Best regards,
Peter

