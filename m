Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2DEC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 01:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrxRr4vN1QffOgAzGFhmLk5eM9zHR1XwC0OkgxSAfu8=; b=qI0y89+/rGxXOb5gtn3YyOxN0X
	Y+bperrzZZO3izRHMHLSZ9TngMrn83tciNRp0aMu8CREWK2yrVOk7kJgmomi6K3SkpygHi0Jj8O7/
	pr0+EIsrVZauTR2OUWFsfrBPEH0bGOpF5OBVV6V3pk0zWjkOnHgqW7FHtDjkBY1DsATVO5Hz5BwQR
	SAZ+5ezXkbnpEfb7u/JSFYaddww5PsIOs1/1u0hbdbGvpnNO+mzuf3PJ9nPxzRW5bVUfmMqRGMIQ8
	6EpVUifspruf6monufSzhr0xZlEniKUwK0DwjZc7muLy3F59hZ7OLjowIMuhEhDT/V8Kb01bQhRTW
	GpRg4+Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttzhj-00000000t6X-3YfU;
	Mon, 17 Mar 2025 01:55:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttzg4-00000000stJ-1u0R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 01:54:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 356A95C05CD;
	Mon, 17 Mar 2025 01:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE1DC4CEDD;
	Mon, 17 Mar 2025 01:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742176442;
	bh=NrSoCCK1NOd0oAcJL5EcEkPkW3Rredkc6BKA7Ayr8kM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JXGVIMnZ3XkUx+cvH2hEXwshiydvkt14xEy07irr0XVvt8LfOxEp/KWYTFnyioQLP
	 IID4vpGjQ2M/2yOJDIaSYuijJCOxfEPz98CgfEKGSqrF/iloGz2WCdbCJl+yY51iE8
	 iHlZw6+MxuSpvsHyBUlV0VjuSn9j6L6oUHBr68PlJvWFw/UzjC7Si/3UfRXTH8hMK+
	 nJuH9mOGjpGEhpLCX2PuCeW2OC693BDALe/rsWo5wpX6hhH4GTZNUHhj478J6ZVxrr
	 rRAePlyWcjf79a9po2Uo6fUqfs0xwIMNjNAYAn9H2t5n7QTpj8Nv29LJOhuyXRMULa
	 kE6nU2yzxC1fw==
Date: Mon, 17 Mar 2025 09:53:52 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: Frank Li <Frank.li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Sebastian Reichel <sre@kernel.org>,
	Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] usb: chipidea: ci_hdrc_imx: fix usbmisc handling
Message-ID: <20250317015352.GA218167@nchen-desktop>
References: <20250316102658.490340-1-pchelkin@ispras.ru>
 <20250316102658.490340-2-pchelkin@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250316102658.490340-2-pchelkin@ispras.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_185404_549039_543FBC2F 
X-CRM114-Status: GOOD (  18.05  )
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

On 25-03-16 13:26:54, Fedor Pchelkin wrote:
> usbmisc is an optional device property so it is totally valid for the
> corresponding data->usbmisc_data to have a NULL value.
> 
> Check that before dereferencing the pointer.
> 
> Found by Linux Verification Center (linuxtesting.org) with Svace static
> analysis tool.
> 
> Fixes: 74adad500346 ("usb: chipidea: ci_hdrc_imx: decrement device's refcount in .remove() and in the error path of .probe()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 1a7fc638213e..619779eef333 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -534,7 +534,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  		cpu_latency_qos_remove_request(&data->pm_qos_req);
>  	data->ci_pdev = NULL;
>  err_put:
> -	put_device(data->usbmisc_data->dev);
> +	if (data->usbmisc_data)
> +		put_device(data->usbmisc_data->dev);
>  	return ret;
>  }
>  
> @@ -559,7 +560,8 @@ static void ci_hdrc_imx_remove(struct platform_device *pdev)
>  		if (data->hsic_pad_regulator)
>  			regulator_disable(data->hsic_pad_regulator);
>  	}
> -	put_device(data->usbmisc_data->dev);
> +	if (data->usbmisc_data)
> +		put_device(data->usbmisc_data->dev);
>  }
>  
>  static void ci_hdrc_imx_shutdown(struct platform_device *pdev)
> -- 
> 2.48.1
> 

-- 

Best regards,
Peter

