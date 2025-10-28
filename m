Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1F3CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 09:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hE0Jy4PLs4ppQPPmdZeYyTiDE0WvbsyHYaFTOAMSNuA=; b=Ww+o6nN6yIR/ZIdeR4/L81K2w2
	Nks0QJkFmn73QR4e5wztiR+AOqBj6XqEg3YNtpL+jaMMvxon5jeKIWU4eb695nGOWYySntgfhMvU2
	yO8FuiAE3ZGs/Sd0vrVCJhwm6FFjycFmUZn9Iv3suyc2CcFDcEKUYHsVeT148s7ULnCJ2m+EQ86ze
	JWMhr1c3GtZvb8ayyVW+ZNqp+8ClsmeAj2hzoNVb8LULDy9AIg2dVP3APGA8wdWivWfT16ob/3WAn
	IlrZETsiBHS6qdm/hCeJhtHZGajQht3+BTzz6YJpRTCXX0XkZ/OXi09PYEKl0hilCcUqdyYORVMxu
	QJ+YDPWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDffs-0000000Fbqm-3LG1;
	Tue, 28 Oct 2025 09:07:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDffp-0000000FbqI-2laC;
	Tue, 28 Oct 2025 09:07:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E59448AC3;
	Tue, 28 Oct 2025 09:07:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90AA4C4CEE7;
	Tue, 28 Oct 2025 09:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761642444;
	bh=WxHpl51n4EsbakrBuVvz8JyJIZAFgGu/0ttTPMvNUy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EmOliCbjaJFIBi3/P+bJGAth59P2tigGVXrNf2RUceOZ/7LeIkWtjbse/HPE1i+pA
	 eelsPmrxYGTM1UgelXb8fx+Nc4SbsK1UKfNku3/OjHqmXN9Rw27T9ruUu2dotDKRFB
	 moe3tGqpqvpwIyROnOP1pOCcUsX+HXlmze8SHn9w=
Date: Tue, 28 Oct 2025 10:07:19 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] usb: mtu3: fix possible NULL pointer dereference in
 ep0_rx_state()
Message-ID: <2025102811-helium-caloric-cac5@gregkh>
References: <20251027193152.3906497-1-Pavel.Zhigulin@kaspersky.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027193152.3906497-1-Pavel.Zhigulin@kaspersky.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_020725_743560_FC71DCB7 
X-CRM114-Status: GOOD (  30.26  )
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

On Mon, Oct 27, 2025 at 10:31:50PM +0300, Pavel Zhigulin wrote:
> The function 'ep0_rx_state()' accessed 'mreq->request' before verifying
> that mreq was valid. If 'next_ep0_request()' returned NULL, this could
> lead to a NULL pointer dereference. The return value of
> 'next_ep0_request()' is checked in every other code path except
> here. It appears that the intended 'if (mreq)' check was mistakenly
> written as 'if (req)', since the req pointer cannot be NULL when mreq
> is not NULL.
> 
> Initialize 'mreq' and 'req' to NULL by default, and switch 'req'
> NULL-checking to 'mreq' non-NULL check to prevent invalid memory access.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: df2069acb005 ("usb: Add MediaTek USB3 DRD driver")
> Signed-off-by: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
> ---
>  drivers/usb/mtu3/mtu3_gadget_ep0.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3_gadget_ep0.c b/drivers/usb/mtu3/mtu3_gadget_ep0.c
> index e4fd1bb14a55..ee7466ca4d99 100644
> --- a/drivers/usb/mtu3/mtu3_gadget_ep0.c
> +++ b/drivers/usb/mtu3/mtu3_gadget_ep0.c
> @@ -508,8 +508,8 @@ static int handle_standard_request(struct mtu3 *mtu,
>  /* receive an data packet (OUT) */
>  static void ep0_rx_state(struct mtu3 *mtu)
>  {
> -	struct mtu3_request *mreq;
> -	struct usb_request *req;
> +	struct mtu3_request *mreq = NULL;
> +	struct usb_request *req = NULL;
>  	void __iomem *mbase = mtu->mac_base;
>  	u32 maxp;
>  	u32 csr;
> @@ -519,10 +519,11 @@ static void ep0_rx_state(struct mtu3 *mtu)
> 
>  	csr = mtu3_readl(mbase, U3D_EP0CSR) & EP0_W1C_BITS;
>  	mreq = next_ep0_request(mtu);
> -	req = &mreq->request;
> 
>  	/* read packet and ack; or stall because of gadget driver bug */
> -	if (req) {
> +	if (mreq) {
> +		req = &mreq->request;
> +
>  		void *buf = req->buf + req->actual;
>  		unsigned int len = req->length - req->actual;
> 
> --
> 2.43.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

