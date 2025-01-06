Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F16E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 09:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UB3S6kcd+Omc6ye56NC6ow7U03F1ihd9mp0kuIOyzfY=; b=0PziuhLqQOEAfhEx+plcUqe+xe
	i87NSGG9vprft2sJaE0/GAUJ/FcfUuimUpD/1p64A3HYVdX7RUNOw/Ij/+VLozJapoqMVpZpWDlwH
	hwr1ciKU/zOn7wEmBPbiVE90iQCSKnexmuB2YwEJjBmKPZzgYK/RwEpp7h+NSYzWsYKfFXcDIqqRW
	+V7ciESeE+Nes+o6TDu4mRRhJTXQ0kaG/3VqVoNs2+jlzVFmgGGesxV80JKGoBUh2ELBWYQdQFneZ
	khXAoj4spRcLOYckkZQm7Zt7kkikfNm0nzEY+631530r+OXLX+oPH3gwcTqzDw5ZjhbZa2gW8EkBY
	F/Yfuo/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjk0-00000000k1v-0XuH;
	Mon, 06 Jan 2025 09:49:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjiK-00000000jqu-3p8g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 09:48:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UB3S6kcd+Omc6ye56NC6ow7U03F1ihd9mp0kuIOyzfY=; b=u8ATxVr2+q/It4195z3R2JW17Z
	n4BxjFVG9gkVWLrh+y8ahgYOsghmOyC185Cuk1U6JQic3S+wpsSwzBvL+Zs2ffOdF85PPuO4E4/K7
	Hc9SUbiuqnbYc3LksInEkcZIXA/MiaVK+C8GGrjiqTNepW2nC9cefkXyPRH5SzMVgn/tsa4y+I1iz
	FYzPy28nKJHKOxdlLs5CEycDC0czUMHCLosz/2v30z0h/1icHpZtDFjwAms7vv/d8KLzZ14YKQnyP
	oc585AlVHEEenpQ2PnVbF1de9w0VXnr0v2asZSFBjB4GG3mvwdFjMhk6FxIyHYxQgI/BjfM424GS9
	KeOZ62Bg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39272)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tUjiH-0005bA-2h;
	Mon, 06 Jan 2025 09:47:57 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tUjiG-0004B1-2W;
	Mon, 06 Jan 2025 09:47:56 +0000
Date: Mon, 6 Jan 2025 09:47:56 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ma Ke <make24@iscas.ac.cn>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] [ARM] fix reference leak in locomo_init_one_child()
Message-ID: <Z3umzMg6SbHh75vI@shell.armlinux.org.uk>
References: <20250106074743.313384-1-make24@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106074743.313384-1-make24@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_014800_961783_3EF95BC3 
X-CRM114-Status: GOOD (  19.91  )
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

On Mon, Jan 06, 2025 at 03:47:43PM +0800, Ma Ke wrote:
> Once device_register() failed, we should call put_device() to
> decrement reference count for cleanup. Or it could cause memory leak.
> 
> device_register() includes device_add(). As comment of device_add()
> says, 'if device_add() succeeds, you should call device_del() when you
> want to get rid of it. If device_add() has not succeeded, use only
> put_device() to drop the reference count'.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Changes in v2:
> - modified the patch as suggestions.
> ---
>  arch/arm/common/locomo.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/common/locomo.c b/arch/arm/common/locomo.c
> index 309b74783468..9e48cbb2568e 100644
> --- a/arch/arm/common/locomo.c
> +++ b/arch/arm/common/locomo.c
> @@ -253,6 +253,8 @@ locomo_init_one_child(struct locomo *lchip, struct locomo_dev_info *info)
>  
>  	ret = device_register(&dev->dev);
>  	if (ret) {
> +		put_device(&dev->dev);
> +		return ret;
>   out:
>  		kfree(dev);
>  	}

This makes the code layout quite horrible.

Instead, I suggest:

	dev = kzalloc(sizeof(...)...
-	if (!dev) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!dev)
+		return -ENOMEM;

...

	ret = device_register(&dev->dev);
-	if (ret) {
- out:
-		kfree(dev);
-	}
+	if (ret)
+		put_device(&dev->dev);

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

