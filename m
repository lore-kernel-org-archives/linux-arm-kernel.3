Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFDCCA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 20:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uM7kzQOkWTbu7yBd5obpklNYYjW2PU8E7YXI4VJ3tYg=; b=B4ZH3BzR52M1JUM/quP+Bsbcp6
	Ah//LySzXb94r/CiP8ODZI2zZCqCcGp1dfmNdmdVJap3uVTmPBFbHyWtP51Sr0ycMN2wRqLD6doul
	dYBlWOsepHykv89jCg/n64tZU20t8dYoZLCsvYYay7cXtkUdBJN58KLxqpgRxDENVLW9W6MR0KI3t
	Z93PHFyZO4n9PDEYsRx4hLLSZHtsgwPIIfCg3mWlJr/fPBDWHbJPRDxDEhVn/50y2KuC9Xsk11x4d
	HBTqbuybJhEvZxpveQ+5HCbD5ql+Sy10Y5Svw7S/EsCH48UAucVZ2JstWO05EVJFtMj85Z8cZWOwQ
	o+n8abjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqdsg-00000009c3z-2uaK;
	Mon, 25 Aug 2025 20:33:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqdoI-00000009aks-1wSF;
	Mon, 25 Aug 2025 20:28:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D87A560240;
	Mon, 25 Aug 2025 20:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33FF3C4CEED;
	Mon, 25 Aug 2025 20:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756153737;
	bh=ComM35XaOofwnrs4E6SooCBJVLjt4r+F5uISZovHRbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mK8TnozMk+hiGthqg6YeyX5K9pIAYMFPVR75G238AJAo/HCD9a0QSWhpYZF+II6/+
	 GYnnrODQVztWLZDy50ntAhUkMwszDSRpzIeUdpj0fvCTUad/qcaM32Hh7FD8r22o/N
	 5t8SohtCCDesXq7etFZD551C6gCqYtprq5G6EeeE=
Date: Mon, 25 Aug 2025 22:28:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: xion.wang@mediatek.com
Cc: Arnd Bergmann <arnd@arndb.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	wsd_upstream@mediatek.com, huadian.liu@mediatek.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] misc: Prevent double registration and deregistration
 of miscdevice
Message-ID: <2025082533-ranked-simply-4b63@gregkh>
References: <20250825084556.10358-1-xion.wang@mediatek.com>
 <20250825084556.10358-2-xion.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825084556.10358-2-xion.wang@mediatek.com>
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

On Mon, Aug 25, 2025 at 04:45:47PM +0800, xion.wang@mediatek.com wrote:
> From: Xion Wang <xion.wang@mediatek.com>
> 
> When repeated calls to misc_register() or misc_deregister() on the
> same miscdevice could lead to kernel crashes or misc_list corruption due to
> multiple INIT_LIST_HEAD or list_del operations on the same list node.
> 
> This patch improves the robustness of the misc device driver by preventing
> both double registration and double deregistration of miscdevice instances.
> 
> Signed-off-by: Xion Wang <xion.wang@mediatek.com>
> ---
>  drivers/char/misc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/char/misc.c b/drivers/char/misc.c
> index 558302a64dd9..2f8666312966 100644
> --- a/drivers/char/misc.c
> +++ b/drivers/char/misc.c
> @@ -210,6 +210,9 @@ int misc_register(struct miscdevice *misc)
>  	int err = 0;
>  	bool is_dynamic = (misc->minor == MISC_DYNAMIC_MINOR);
>  
> +	if (WARN_ON(misc->this_device))
> +		return -EEXIST;

You just crashed the kernel if this ever triggers (remember when
panic-on-warn is set)

So please, if this can happen, properly handle it.

> +
>  	INIT_LIST_HEAD(&misc->list);
>  
>  	mutex_lock(&misc_mtx);
> @@ -251,6 +254,7 @@ int misc_register(struct miscdevice *misc)
>  			misc->minor = MISC_DYNAMIC_MINOR;
>  		}
>  		err = PTR_ERR(misc->this_device);
> +		misc->this_device = NULL;
>  		goto out;
>  	}
>  
> @@ -275,12 +279,13 @@ EXPORT_SYMBOL(misc_register);
>  
>  void misc_deregister(struct miscdevice *misc)
>  {
> -	if (WARN_ON(list_empty(&misc->list)))
> +	if (WARN_ON(!misc->this_device))
>  		return;
>  
>  	mutex_lock(&misc_mtx);
>  	list_del(&misc->list);
>  	device_destroy(&misc_class, MKDEV(MISC_MAJOR, misc->minor));
> +	misc->this_device = NULL;

You are overloading the pointer here to mean something, please don't.

Again, why would this ever happen?  What in-tree driver does this?

thanks,

greg k-h

