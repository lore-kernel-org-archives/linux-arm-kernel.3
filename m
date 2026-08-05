Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140E7C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 12:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rV4qGQhCNjjmrMlx+J3hPf4u/Ce3KAQb3Bb72ZeU0IE=; b=OCvS+pBxD1+dyWzsS0ILfsWcnF
	ODrWHwqu+fPVwPUQykn7Cz+ycX6md4JOcYoKOf2AS97w2x7BHscfQnk/Coml5LnJLvIJEY6ANajt1
	rZTzQBC7//vooLe1gxSPFGAAcHa5TGiR3OF1YEpius6w+iuaZTNNzB3Gblnz/vLynNEXvbzoYL2g8
	X4QQOhOhcgHEuDSKCUdHtrZJexGvSG0ir3+1VtbG6njcYpDoKWErKWlWijZjAbF9NhrCASbYBlEJe
	zz01kDQWKQYSIbNiJa6/sEU6rC7hdWtgb4wltLufzo1HmRB+AZOVJ3fSMh2GCnuXdQrm/fJvwQ8xF
	ME95IhFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraUW-00000003sN1-3G2H;
	Wed, 05 Aug 2026 12:13:00 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraUU-00000003sMd-3XnZ;
	Wed, 05 Aug 2026 12:13:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785931978; x=1817467978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5ijllbdsV/FH4IkEjrIYuPh6CC2tKw+DyF/rMHbH20U=;
  b=J4XJTRXfQoCqwAPWHn2q82yEj7P+hMvEAuiGHQOSEilYWSwCJZHrroen
   1ERNgKZZdZvurfurwh0fjuOyPh9QBkADHa+YQSCxZzbsfW/DoHFlWGSJu
   rnRbhAiGhUl0vd4CHiyFd5A/OLjnCZYM+gIQ8QNBK3cE6SgnMOkELe+Jm
   sZZTF58r2qyN/+7fs7pxIJ98O5P0g/huLrk9Df5WY2PjuQtVKQUbD5FWd
   EcTcadhK7R41Fs9j50CYSHmNx0y56N8q5AkPE5+LKT2EQblpHtPrfj06Q
   kYepiy3HE2BFqtqmKtH4GnN7WIr5uaabHFkJbLyBp3Ofw4KmvDNMJyIBD
   A==;
X-CSE-ConnectionGUID: 4PqlN3wdQb2WoVgyrUn+DQ==
X-CSE-MsgGUID: 9cYs/dHsTHyXNwb/Nnz8Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="90387643"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="90387643"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 05:12:58 -0700
X-CSE-ConnectionGUID: FAkFdOu5QsCP4pHGOnociA==
X-CSE-MsgGUID: Nh73dU2XQFKj0cMs0CYhEg==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 05 Aug 2026 05:12:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 3B2DD99; Wed, 05 Aug 2026 14:12:55 +0200 (CEST)
Date: Wed, 5 Aug 2026 14:12:55 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Pan Chuang <panchuang@vivo.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:USB TYPEC CLASS" <linux-usb@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 11/11] usb: typec: Remove redundant
 dev_err()/dev_err_probe()
Message-ID: <anMoxwOHNqg9VPHu@black.igk.intel.com>
References: <20260731035448.252289-1-panchuang@vivo.com>
 <20260731035448.252289-12-panchuang@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731035448.252289-12-panchuang@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_051259_000830_58BB0D7D 
X-CRM114-Status: GOOD (  18.59  )
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

On Fri, Jul 31, 2026 at 11:54:45AM +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() and dev_err_probe() calls.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/anx7411.c               | 4 +---
>  drivers/usb/typec/hd3ss3220.c             | 4 +---
>  drivers/usb/typec/mux/it5205.c            | 2 +-
>  drivers/usb/typec/tcpm/tcpci_maxim_core.c | 3 +--
>  drivers/usb/typec/tcpm/tcpci_mt6360.c     | 1 -
>  drivers/usb/typec/tcpm/tcpci_mt6370.c     | 2 +-
>  6 files changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
> index 41df115912b9..2c41e00819f8 100644
> --- a/drivers/usb/typec/anx7411.c
> +++ b/drivers/usb/typec/anx7411.c
> @@ -1529,10 +1529,8 @@ static int anx7411_i2c_probe(struct i2c_client *client)
>  					IRQF_TRIGGER_FALLING |
>  					IRQF_ONESHOT,
>  					"anx7411-intp", plat);
> -	if (ret) {
> -		dev_err(dev, "fail to request irq\n");
> +	if (ret)
>  		goto free_wq;
> -	}
>  
>  	if (anx7411_typec_check_connection(plat))
>  		dev_err(dev, "check status\n");
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> index 3e39b800e6b5..64648686bf8b 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -436,10 +436,8 @@ static int hd3ss3220_probe(struct i2c_client *client)
>  						IRQF_TRIGGER_RISING |
>  						IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
>  						dev_name(hd3ss3220->dev), hd3ss3220);
> -		if (ret < 0) {
> -			dev_err(hd3ss3220->dev, "failed to get ID irq: %d\n", ret);
> +		if (ret < 0)
>  			goto err_put_fwnode;
> -		}
>  	}
>  
>  	typec_cap.prefer_role = TYPEC_NO_PREFERRED_ROLE;
> diff --git a/drivers/usb/typec/mux/it5205.c b/drivers/usb/typec/mux/it5205.c
> index 5e1a120b2e3b..2ab2ba6a3cbd 100644
> --- a/drivers/usb/typec/mux/it5205.c
> +++ b/drivers/usb/typec/mux/it5205.c
> @@ -250,7 +250,7 @@ static int it5205_probe(struct i2c_client *client)
>  		if (ret) {
>  			typec_mux_unregister(it->mux);
>  			typec_switch_unregister(it->sw);
> -			return dev_err_probe(dev, ret, "Failed to request irq\n");
> +			return ret;
>  		}
>  	}
>  
> diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> index 998693a61839..52dbbbe53691 100644
> --- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> +++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> @@ -542,8 +542,7 @@ static int max_tcpci_probe(struct i2c_client *client)
>  					(IRQF_TRIGGER_LOW | IRQF_ONESHOT), dev_name(chip->dev),
>  					chip);
>  	if (ret < 0)
> -		return dev_err_probe(&client->dev, ret,
> -				     "IRQ initialization failed\n");
> +		return ret;
>  
>  	ret = devm_device_init_wakeup(chip->dev);
>  	if (ret)
> diff --git a/drivers/usb/typec/tcpm/tcpci_mt6360.c b/drivers/usb/typec/tcpm/tcpci_mt6360.c
> index 881ffacbfd77..d4010ea5183b 100644
> --- a/drivers/usb/typec/tcpm/tcpci_mt6360.c
> +++ b/drivers/usb/typec/tcpm/tcpci_mt6360.c
> @@ -167,7 +167,6 @@ static int mt6360_tcpc_probe(struct platform_device *pdev)
>  	ret = devm_request_threaded_irq(mti->dev, mti->irq, NULL, mt6360_irq, IRQF_ONESHOT,
>  					dev_name(&pdev->dev), mti);
>  	if (ret) {
> -		dev_err(mti->dev, "Failed to register irq\n");
>  		tcpci_unregister_port(mti->tcpci);
>  		return ret;
>  	}
> diff --git a/drivers/usb/typec/tcpm/tcpci_mt6370.c b/drivers/usb/typec/tcpm/tcpci_mt6370.c
> index 7d6c75c70985..2e85cb05ed37 100644
> --- a/drivers/usb/typec/tcpm/tcpci_mt6370.c
> +++ b/drivers/usb/typec/tcpm/tcpci_mt6370.c
> @@ -168,7 +168,7 @@ static int mt6370_tcpc_probe(struct platform_device *pdev)
>  	ret = devm_request_threaded_irq(dev, irq, NULL, mt6370_irq_handler,
>  					IRQF_ONESHOT, dev_name(dev), priv);
>  	if (ret)
> -		return dev_err_probe(dev, ret, "Failed to allocate irq\n");
> +		return ret;
>  
>  	device_init_wakeup(dev, true);
>  	dev_pm_set_wake_irq(dev, irq);
> -- 
> 2.34.1

-- 
heikki

