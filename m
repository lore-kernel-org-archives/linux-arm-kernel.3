Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C7BE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 12:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cADidBQ/mORQwHOuUzo09UeKlSlPquGLZ4XWeuQQwAg=; b=TL7ifAvuCc/D2yT4WZ5FJG3kAQ
	hQxtmy3Iso+IKsNWxTyZqAAa2Sr3+5T2PzpRNz8m8IqxiBGCyAwt7/AkfC+oxhlm76gUOeepo9Vm+
	HDCeJ5anXnPu/NEfMR2XRc+VZyPh2DcXCjB2ejMVGRXGI/ipTCPfjXl8EPLdWOH+rNoHgssUuCgyU
	GzfZGVv+S8IVdzKUdrLKtrTrqDSqJysE9HWdjg8ArvVJAcrWCtoIKNoKPTQclVSD2cM/l2DWsXs8x
	D7qBlzh90wvVRL/QUScyxxLkgXA/yparQDsprDn1SfBwoqVGu/3UUsXguZtUbgx1aFLac+upcxt1X
	E/UjbsBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUPlZ-0000000GoD5-2WKi;
	Sun, 05 Jan 2025 12:30:01 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUPkO-0000000Go4W-36mR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 12:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cADidBQ/mORQwHOuUzo09UeKlSlPquGLZ4XWeuQQwAg=; b=lUbWys8N7zxIpPiSDGnkrqoFCh
	9XP0gyrwqrdC9NfyL35X5v1+76RKADuFS/wH2yeFrQDW2wHOH2Qpf5schc8/S9KiUb52RkE59Y/hq
	7eFCr9VNPOw+jo3ZUk6+G2VURBiZuFopI7QsjVIC/+jAFMh8tRbk7YbLplYewUD30L6yMP6rAusRm
	MJylgvHsNAudhmRFwLv4bf3XczeMZpe+OqZhc5t4kVcJTOm5UwKCaqEvm/h9CAExtNcIEaz+t82td
	Q+iVZIsozsIhKimn6FIsO/d5Fd7TvXVLD3j049jH3zl/8rTXlf/cAYr8gX+Mia/evTMLNg0TSWl+J
	N13qY0KA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47624)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tUPkI-0004lF-1F;
	Sun, 05 Jan 2025 12:28:42 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tUPkG-0003Hq-2l;
	Sun, 05 Jan 2025 12:28:40 +0000
Date: Sun, 5 Jan 2025 12:28:40 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ma Ke <make24@iscas.ac.cn>
Cc: sumit.garg@linaro.org, gregkh@linuxfoundation.org, elder@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] [ARM] fix reference leak in locomo_init_one_child()
Message-ID: <Z3p6-LeZZ2ZGupEc@shell.armlinux.org.uk>
References: <20250105111156.277058-1-make24@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250105111156.277058-1-make24@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_042848_791401_C84141AE 
X-CRM114-Status: GOOD (  15.98  )
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

On Sun, Jan 05, 2025 at 07:11:56PM +0800, Ma Ke wrote:
> Once device_register() failed, we should call put_device() to
> decrement reference count for cleanup. Or it could cause memory leak.
> 
> device_register() includes device_add(). As comment of device_add()
> says, 'if device_add() succeeds, you should call device_del() when you
> want to get rid of it. If device_add() has not succeeded, use only
> put_device() to drop the reference count'.

The commit message is not quite correct:

"After calling device_register(), the correct way to dispose of the
device is to call put_device() as per the device_register()
documentation rather than kfree()."

This reveals that your patch is not completely correct.

> diff --git a/arch/arm/common/locomo.c b/arch/arm/common/locomo.c
> index cb6ef449b987..7274010218ec 100644
> --- a/arch/arm/common/locomo.c
> +++ b/arch/arm/common/locomo.c
> @@ -255,6 +255,7 @@ locomo_init_one_child(struct locomo *lchip, struct locomo_dev_info *info)
>  
>  	ret = device_register(&dev->dev);
>  	if (ret) {
> +		put_device(&dev->dev);
>   out:
>  		kfree(dev);

... and that leads to the second problem here - this kfree() will lead
to a double-free of the device. Once by the reference count dropping to
zero, resulting in locomo_dev_release() being called, and then this
kfree().

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

