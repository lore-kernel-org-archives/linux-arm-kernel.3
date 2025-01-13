Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB60E7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 12:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8uYjioPZNuJ6YChCFOyKD8QRQiGxZ9HzZH2bKWJtRrI=; b=grdOGe1ZQQMiSYuaXxN5preCRm
	B6d2Ss4q9hmwd75aHxKWUNAjVS/5lyH4JliK1lrGDwNV/6WebIjJKyeQerkz/3urOZ6arqeyxhtbh
	kZH0LEMirgJ3eqVksCQj7g/VsWnkD926MdL5iBfRmGxDoYhi8fxIx/de2l3EkZkstLC536gBW5FmG
	dYK746ONEZrvCmNLsgXgGYMP4f4IoB7yQtxeO6qFYS7cG3De2UapK0u0cs5ZUs3YtLgDjYgC38q7y
	VQqt+JJFobQ6+m06Yy/PYXSIMRPkL3E0eVHSUHRzuaBuYW24ytf6oj+UNMCLo9L5zcMZR1F44VPjr
	UNzSBdtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJrT-000000059Ri-0l1h;
	Mon, 13 Jan 2025 12:48:07 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJpA-0000000595R-2utV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 12:45:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8uYjioPZNuJ6YChCFOyKD8QRQiGxZ9HzZH2bKWJtRrI=; b=Fae87ay4QR+GdKJIedcJz0wjs/
	JToWgOq4sJJF2L5iGuef0qYPgR80j6hXyz7/BzqV1uUpAw3Wbs8VThMOOmsXhgkN4+Ewae9TQUX2b
	8/qnj/aQlyQp6TC/vT6yhxqTbGwxWfAD7cHPMCP1mi5iNg8b+dU4uP9BHapG4QZHEQM7Do3MP0dUs
	qTUz5RTaV4RiCmNlCmfgBYCScYwG8dYruq5rxIx0ETN3DDX7CvXoRB2QOK1Kw7cSlzdCpAOLwDL2Y
	6jAMtcreKo8R7DUFfk2xpNT/OBWgeH1XI/ruzTlogHqbpZoGPHorkLNpSrk5pr/eRMvsOfsWYqIkM
	OwUN+7RQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44950)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tXJp4-0006cH-2R;
	Mon, 13 Jan 2025 12:45:38 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tXJp1-00045B-28;
	Mon, 13 Jan 2025 12:45:35 +0000
Date: Mon, 13 Jan 2025 12:45:35 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ma Ke <make24@iscas.ac.cn>
Cc: sumit.garg@linaro.org, gregkh@linuxfoundation.org, elder@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4] [ARM] fix reference leak in locomo_init_one_child()
Message-ID: <Z4UK7__tlAZrucRd@shell.armlinux.org.uk>
References: <20250108033049.1206055-1-make24@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108033049.1206055-1-make24@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_044544_750048_FD47356D 
X-CRM114-Status: GOOD (  24.08  )
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

On Wed, Jan 08, 2025 at 11:30:49AM +0800, Ma Ke wrote:
> Once device_register() failed, we should call put_device() to
> decrement reference count for cleanup. Or it could cause memory leak.
> 
> device_register() includes device_add(). As comment of device_add()
> says, 'if device_add() succeeds, you should call device_del() when you
> want to get rid of it. If device_add() has not succeeded, use only
> put_device() to drop the reference count'.

I reviewed a previous version of this patch, and commented about the
commit message:

 The commit message is not quite correct:

 "After calling device_register(), the correct way to dispose of the
 device is to call put_device() as per the device_register()
 documentation rather than kfree()."

Alex Elder also commented about this. Please fix the commit message.
What device_add() doesn't matter, this code isn't calling device_add(),
it's calling device_register(), and the comments against
device_register() should be appearing in the commit message, not
the comments against device_add().

Thanks.

> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Changes in v4:
> - deleted the redundant initialization;
> Changes in v3:
> - modified the patch as suggestions;
> Changes in v2:
> - modified the patch as suggestions.
> ---
>  arch/arm/common/locomo.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/common/locomo.c b/arch/arm/common/locomo.c
> index cb6ef449b987..45106066a17f 100644
> --- a/arch/arm/common/locomo.c
> +++ b/arch/arm/common/locomo.c
> @@ -223,10 +223,8 @@ locomo_init_one_child(struct locomo *lchip, struct locomo_dev_info *info)
>  	int ret;
>  
>  	dev = kzalloc(sizeof(struct locomo_dev), GFP_KERNEL);
> -	if (!dev) {
> -		ret = -ENOMEM;
> -		goto out;
> -	}
> +	if (!dev)
> +		return -ENOMEM;
>  
>  	/*
>  	 * If the parent device has a DMA mask associated with it,
> @@ -254,10 +252,9 @@ locomo_init_one_child(struct locomo *lchip, struct locomo_dev_info *info)
>  			NO_IRQ : lchip->irq_base + info->irq[0];
>  
>  	ret = device_register(&dev->dev);
> -	if (ret) {
> - out:
> -		kfree(dev);
> -	}
> +	if (ret)
> +		put_device(&dev->dev);
> +
>  	return ret;
>  }
>  
> -- 
> 2.25.1
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

