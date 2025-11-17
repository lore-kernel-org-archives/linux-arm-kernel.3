Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CAFCCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 02:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kiclg+ICV3isWwwDeMvQP4a8YD6UqUKW5pl+uehC4+8=; b=Wt6pWtiMx+4Um/YF7cw1cGR/Rn
	gwCAFuxf1+dGeC4yFeo091qk47cu/azPvb+6EcnGu2GSidLSAGp/EzCsOZpW82aYljmbbOkO0cw8B
	x9/X8z67Fah6jDnprov0csxrEutW3x42os/EpjgNU30Ych1r/qD5tduWyKjwzOXg24WDvf+5M5nnC
	bQuRRjV0vhYt8Wp9NqlOcHYww5sD6bugXXS42bxY4dTwbRrJa9JVjHMNPeCscbKtaMNqixwGWwVGI
	Uhz2qYHbYv/8uSeyKutQWiYH/pgobfquedAKLJBmMm3rhMIlRiUwfpGytDWuhqKpoEFJngTLX/otv
	g1VWTUnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKojc-0000000FIB7-4BIz;
	Mon, 17 Nov 2025 02:12:53 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKoja-0000000FIAk-3Dx6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 02:12:52 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4ee13dc0c52so10183501cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Nov 2025 18:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1763345569; x=1763950369; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kiclg+ICV3isWwwDeMvQP4a8YD6UqUKW5pl+uehC4+8=;
        b=QKwbD7AvjBicfqadfBIbNs74TrsvuEVEv5w2n7auYgnqui1hXGp4pQX9/EnqVpC6ir
         6L0bYPruPJx6UM3fcKWqQJoZNFox+5Cl7FHXXMPXWmi0teodll2st4lIWcW7ZI9akwaj
         3t+3vMqYAX7xdzLH7qBSV+7M0hpmRqEFpcNto8sVN2/5ZPW58tYvffMc0FU47wsNbfC3
         EczCWOWFLxXSv0P4DBkJO6DnmTH7UPkDw88a5Hec8ThM1TcxRU/n1ezA/BEufHK4nn43
         bZHcVjJbWxJl6tr6qSbqlE2vYkLfYc44lLGINnxQfovFMTK6g+DAcUIwOGmCnRxFylI3
         jbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763345569; x=1763950369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kiclg+ICV3isWwwDeMvQP4a8YD6UqUKW5pl+uehC4+8=;
        b=ULUdGERxUvmriarl2DTkhXa6nmBdqg3VxQvF6P88OD2ck3rTP9T9sRuVoL/jIb6lzp
         leWTjFqACldUUC9jVKipMCLaFm/0bMPYnR7dxI30madDeyXD0HT2WoMDQjuF8OHZcODG
         93EmEcAyxoXRRp7xV4G685YOUQ+KnanatvxyDEBzKWINnwp33q0M54yD+gmaShJhFAD1
         D1aeuXqCq/uluRJOCH4licA9p8r//PlkScnBfxeIfp43Yck/RNIj5pf+oBwLpdm1O0+V
         8IfAe3m+DpR2OqBXxyswpw7XafjZRss98Q1vrHVTv808kE/Bvtfud0tfFs8ie90X79RO
         lxLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx7SS5bH1rrj85q2Htu17juBnqS98LkZ5HkV9A9NG6h+6brNPkZQDMdrvv9fwAuIX5wNzoCUBnCai2S4517h15@lists.infradead.org
X-Gm-Message-State: AOJu0YwfvIfko6uQJEKyDMsCXawGmRIvPv307rQAMGXyqsvxwlw/2EIp
	qzD9MqNfrA7/GujOihFRKRCgGC7/KUCzga5k1S/Uj4cJ5/jxkFYhQ41apgiLrCkzRA==
X-Gm-Gg: ASbGncsDDoDEJOEHY+906JRp6fp3GrS64AoUm4XvXOwRjwUrd3nNDTxx89qKmBGV/Ak
	sRzOQdpV2FB0oabi/y8gj+prN+05ApIrDuH8vTYnk4Bd/FBvDHNOFKfJck+l69qZBZn+NKy0EeJ
	jepAtUtNuNBrSNESVeT4zNHuwS5EFD9L+6W0MO+9kCoKVOjdSYGFLLhIxSkYqqHN41CECZDDH6U
	7NnA/+r5vqkJYXLG8tobx2cdYO/V5M5rSzLo+Z2J4+mwQpHQbrDnIt2p2doV5K91uw17jyR7ilz
	vknb7LWjdB9ueuGnEo7TziJjps8e19wMRn1GCZdOwIUb0lp5uoY7UHaUZzPEyDGakBUZS7r4tp5
	QQfrKDep08dM5odZdpcGKjYwmDrX6BRWIKtcCC8yE4ZvTLEtMV3zvHclqsb0cXczFzkA3/mTtAZ
	Vm9A==
X-Google-Smtp-Source: AGHT+IF7aGO2MtqCmmlI9cMAEmYhFjVvHTERbxwvkt+rHOGTTynDRbR2K+xvEJ5DiSzvgQDHQlegoA==
X-Received: by 2002:a05:622a:18a2:b0:4ee:2510:198a with SMTP id d75a77b69052e-4ee25101ab2mr9280681cf.39.1763345568881;
        Sun, 16 Nov 2025 18:12:48 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::e258])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee16389879sm29098271cf.24.2025.11.16.18.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 18:12:48 -0800 (PST)
Date: Sun, 16 Nov 2025 21:12:45 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Ma Ke <make24@iscas.ac.cn>
Cc: vz@mleia.com, piotr.wojtaszczyk@timesys.com, gregkh@linuxfoundation.org,
	arnd@arndb.de, stigge@antcom.de, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] USB: ohci-nxp: Fix error handling in ohci-hcd-nxp
 driver
Message-ID: <288508e8-9d97-4c90-a0d4-ef6798110211@rowland.harvard.edu>
References: <20251117013428.21840-1-make24@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117013428.21840-1-make24@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_181251_063660_E32BDBCA 
X-CRM114-Status: GOOD (  24.45  )
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

On Mon, Nov 17, 2025 at 09:34:28AM +0800, Ma Ke wrote:
> When obtaining the ISP1301 I2C client through the device tree, the
> driver does not release the device reference in the probe failure path
> or in the remove function. This could cause a reference count leak,
> which may prevent the device from being properly unbound or freed,
> leading to resource leakage.
> 
> Fix this by storing whether the client was obtained via device tree
> and only releasing the reference in that case.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 73108aa90cbf ("USB: ohci-nxp: Use isp1301 driver")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Changes in v2:
> - only released the device reference when the ISP1301 client was obtained through device tree, not in the non-DT case where the global variable is used;
> - removed unnecessary NULL checks as suggested by reviewer.
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>


>  drivers/usb/host/ohci-nxp.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/host/ohci-nxp.c b/drivers/usb/host/ohci-nxp.c
> index 24d5a1dc5056..081b8c7f21a0 100644
> --- a/drivers/usb/host/ohci-nxp.c
> +++ b/drivers/usb/host/ohci-nxp.c
> @@ -50,6 +50,7 @@ static const char hcd_name[] = "ohci-nxp";
>  static struct hc_driver __read_mostly ohci_nxp_hc_driver;
>  
>  static struct i2c_client *isp1301_i2c_client;
> +static bool isp1301_using_dt;
>  
>  static void isp1301_configure_lpc32xx(void)
>  {
> @@ -161,6 +162,7 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
>  	} else {
>  		isp1301_node = NULL;
>  	}
> +	isp1301_using_dt = (isp1301_node != NULL);
>  
>  	isp1301_i2c_client = isp1301_get_client(isp1301_node);
>  	of_node_put(isp1301_node);
> @@ -223,6 +225,8 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
>  fail_resource:
>  	usb_put_hcd(hcd);
>  fail_disable:
> +	if (isp1301_using_dt)
> +		put_device(&isp1301_i2c_client->dev);
>  	isp1301_i2c_client = NULL;
>  	return ret;
>  }
> @@ -234,6 +238,8 @@ static void ohci_hcd_nxp_remove(struct platform_device *pdev)
>  	usb_remove_hcd(hcd);
>  	ohci_nxp_stop_hc();
>  	usb_put_hcd(hcd);
> +	if (isp1301_using_dt)
> +		put_device(&isp1301_i2c_client->dev);
>  	isp1301_i2c_client = NULL;
>  }
>  
> -- 
> 2.17.1
> 

