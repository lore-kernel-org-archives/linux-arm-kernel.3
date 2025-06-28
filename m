Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85F2C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 15:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1iErK1ojfiDxlxxV8lTT22eEyRckpvFzivwsJR67WM=; b=M44dSklgkanm9Kcsbk+G17VALj
	AZipzL2piL4FE2X4bcmCbyPFmu0u56EF51HhkAKlpuism9ujEIFCA+vM9WAubw82Mp/kZynPcUTuI
	2HvkekoUj+B7ND+exBZ01K3WBBkVqZd+04cHLnGCZs1Vo+dIrmfMClSKrKsJmuFa6oKQbixEJBOmu
	41Zh8629tusmLYMT3Agcn6CX8tQMCD4jzmNm1VcjANt6DKn69W8A5p1zbqyIyxXYBJ1V0j6xreYLd
	uNrLWfzU9xCPu03YanDWdq4c/ipDdlKnfcGaWSsdxJNpGYJf1xhWJiohd0KcZzBYtm/keX2scjnKo
	S4/cWWvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVXJU-0000000Gwsf-2K0h;
	Sat, 28 Jun 2025 15:17:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVX6v-0000000Gvzt-1dLv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 15:04:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 16F48A52346;
	Sat, 28 Jun 2025 15:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64264C4CEEA;
	Sat, 28 Jun 2025 15:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751123095;
	bh=0Uv+q8exRiL1GkMTHmMha2ITO2bvRewQYj2lGsHH2xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mvXZ011Klyqgb/e5srWsSfAhSZLWqO6EyuJeMz9PZaNkc2XVlqGX8zblovVR1s2Bt
	 ZJkVi/EqQDqm19J7xUzgcN1kRGk0j2wgY2LYfqdSu5y8nVyepSQBPfh8hTNrQaOKTH
	 1Sn9vO3Oz8a1SAlz8o49bFRQUagIwPe90w+j3Zsk=
Date: Sat, 28 Jun 2025 17:04:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sergio Perez Gonzalez <sperezglz@gmail.com>
Cc: michal.simek@amd.com, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shuah@kernel.org
Subject: Re: [PATCH] usb: gadget: udc-xilinx: validate ep number before
 indexing rambase[]
Message-ID: <2025062834-botanist-crop-4aec@gregkh>
References: <20250627060125.176663-1-sperezglz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627060125.176663-1-sperezglz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_080457_490462_E802D38E 
X-CRM114-Status: GOOD (  16.08  )
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

On Fri, Jun 27, 2025 at 12:01:22AM -0600, Sergio Perez Gonzalez wrote:
> Issue flagged by coverity. The size of the rambase array is 8,
> usb_enpoint_num() can return 0 to 15, prevent out of bounds reads.

But how can that happen with this hardware?  As the array states, this
hardware only has that many endpoints availble to it, so how can it ever
be larger?

> Link: https://scan7.scan.coverity.com/#/project-view/53936/11354?selectedIssue=1644635
> Signed-off-by: Sergio Perez Gonzalez <sperezglz@gmail.com>

What commit id does this fix?


> ---
>  drivers/usb/gadget/udc/udc-xilinx.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
> index 8d803a612bb1..0c3714de2e3b 100644
> --- a/drivers/usb/gadget/udc/udc-xilinx.c
> +++ b/drivers/usb/gadget/udc/udc-xilinx.c
> @@ -814,6 +814,12 @@ static int __xudc_ep_enable(struct xusb_ep *ep,
>  	ep->is_in = ((desc->bEndpointAddress & USB_DIR_IN) != 0);
>  	/* Bit 3...0:endpoint number */
>  	ep->epnumber = usb_endpoint_num(desc);
> +	if (ep->epnumber >= XUSB_MAX_ENDPOINTS) {
> +		dev_dbg(udc->dev, "bad endpoint index %d: only 0 to %d supported\n",
> +				ep->epnumber, (XUSB_MAX_ENDPOINTS - 1));
> +		return -EINVAL;

Any hints as to how this was tested?

thanks,

greg k-h

