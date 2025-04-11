Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D30FC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 13:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n+npKFLH8wMm64bDctYCHs8oB5bTWNC0x6PimPO3Q0A=; b=2yK+v5X+5DCBUVp+z3cO7Ux1IV
	VpjVJCxk4d9LGswFQ0FWLoVCOs7criJJZWrXhlnPNin77iBMa83WV5CGpezrQzoICqbIRBtuLg0/K
	dBt6Ryj7c+XQCufbCuP+ScJWxG1cFOFyiOh7P8UiXjYSCl+BlqM6LotFEet4rksUVIkEJVS+gvE+w
	3hUIVflkx4oAZ0h37F/UiiUqveFaz+rJRSDTsN2Msyqwm9cap7dcm3+q+Jgg5lcXIkC51SHWjjY2i
	h31vsgeh6ryDAoQvhbTsDDY+P/ZEo4GBztO3nA3Un6eghzLlAkrYSyQZK2cfbeBE0jKCpk304TBOT
	n53ORDPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EQO-0000000Duvq-3MOi;
	Fri, 11 Apr 2025 13:28:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3E5e-0000000Dqvp-4Ad5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 13:06:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E5F436845F;
	Fri, 11 Apr 2025 13:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506F3C4CEE2;
	Fri, 11 Apr 2025 13:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744376797;
	bh=5O79GdJMUP1u1auDATSqpr2gGJykXZlL0f4n5WLQaS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oCHB33EIcwBAAJPW7SO/vLL7mLGzXBClQFxfPq7Pgaq4qkNo00L4MAAaaVSAl5pBX
	 DJFRwHCd9ksWW1uOxVAsehLtq31xgQ1QykeaPmW3bkqaRv2Lb+R9tGQi9GUpUJKs7G
	 VvvXPitxaU4AHjFjlBLbtnqMzVAC89ik78+Jrdf0=
Date: Fri, 11 Apr 2025 15:06:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] usb/gadget: Add NULL check in ast_vhub_init_dev()
Message-ID: <2025041119-debit-cosmic-f41c@gregkh>
References: <20250405113020.80387-1-bsdhenrymartin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405113020.80387-1-bsdhenrymartin@gmail.com>
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

On Sat, Apr 05, 2025 at 07:30:20PM +0800, Henry Martin wrote:
> devm_kasprintf() returns NULL when memory allocation fails. Currently,
> ast_vhub_init_dev() does not check for this case, which results in a
> NULL pointer dereference.
> 
> Add NULL check after devm_kasprintf() to prevent this issue.
> 
> Cc: stable@vger.kernel.org	# v4.18
> Fixes: 7ecca2a4080c ("usb/gadget: Add driver for Aspeed SoC virtual hub")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
> V1 -> V2: Add Cc: stable label and correct commit message.
> 
>  drivers/usb/gadget/udc/aspeed-vhub/dev.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/dev.c b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
> index 573109ca5b79..5b7d41a990d7 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
> @@ -548,6 +548,8 @@ int ast_vhub_init_dev(struct ast_vhub *vhub, unsigned int idx)
>  	d->vhub = vhub;
>  	d->index = idx;
>  	d->name = devm_kasprintf(parent, GFP_KERNEL, "port%d", idx+1);
> +	if (!d->name)
> +		return -ENOMEM;
>  	d->regs = vhub->regs + 0x100 + 0x10 * idx;
>  
>  	ast_vhub_init_ep0(vhub, &d->ep0, d);
> -- 
> 2.34.1
> 

What kernel version did you make this against?  It does not apply to
6.15-rc1 for me :(

thanks,

greg k-h

