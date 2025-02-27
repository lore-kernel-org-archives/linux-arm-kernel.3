Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F68C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 20:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0C8mD/FSYr5jgJYg1hxasgHtPYza9uBsy/xfnfhve/o=; b=ijIwUP9Qm5nOd9PaLYaIRbSopq
	fiideBLECkJADg2CnEAOXEqP6f/xNvgOBCKfBn1JGe0yc3qOTwj8dEcx/7RCCVzDEZClhhfAl8RGk
	REb/sdDoeq3vFXh70lWQ9+hrZcbRP1WBn0pSNXr8+xeTz47kUAZIkV0Iv7b8WuDWVasE+aNhe30MK
	DwO4J8J1SzTKI1XVLIP5Wq6dbzR8y5gBCxmvXKzA++qDKFYWecwQbae1k59aYa5PQa9L8MAW8LBu4
	dX6pKWLTZINUO2QRD6cP8ynY1tzD29DfvsnQgRO4FJ5GSQuaWb6F6Tr04F7nHFUBR+BQ1zOInh9aS
	GPP307Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnkPk-00000008lak-0mNW;
	Thu, 27 Feb 2025 20:23:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnkOB-00000008lI4-3Mx3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 20:21:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 231F85C5695;
	Thu, 27 Feb 2025 20:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94CCFC4CEDD;
	Thu, 27 Feb 2025 20:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1740687706;
	bh=yJLvp2oI0sbx31hYDIXLNAAq0hg/gtAY3C68UTWPF8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CvlEYPyqID3xG6JZnddwKCBj86r3Ccp80AYP8Ur+fzaXY/aU9kwpIhJiV7j0AEFfC
	 ikcFpnhFkTSSMgHP+SXGqfjt9zHxjNb7cz9GA8d1V9by1Vo7X4ytcXHk0q7Rxzzs97
	 f0YbwqkoW1aVPUHeNo9CPAAGczlcJVUYyF5h0YEk=
Date: Thu, 27 Feb 2025 12:20:36 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Oliver Upton <oliver.upton@linux.dev>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] xhci: Restrict USB4 tunnel detection for USB3 devices to
 Intel hosts
Message-ID: <2025022709-unread-mystified-ddf1@gregkh>
References: <20250227194529.2288718-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227194529.2288718-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_122147_883604_B55141C8 
X-CRM114-Status: GOOD (  21.87  )
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

On Thu, Feb 27, 2025 at 07:45:29PM +0000, Marc Zyngier wrote:
> When adding support for USB3-over-USB4 tunnelling detection, a check
> for an Intel-specific capability was added. This capability, which
> goes by ID 206, is used without any check that we are actually
> dealing with an Intel host.
> 
> As it turns out, the Cadence XHCI controller *also* exposes an
> extended capability numbered 206 (for unknown purposes), but of
> course doesn't have the Intel-specific registers that the tunnelling
> code is trying to access. Fun follows.
> 
> The core of the problems is that the tunnelling code blindly uses
> vendor-specific capabilities without any check (the Intel-provided
> documentation I have at hand indicates that 192-255 are indeed
> vendor-specific).
> 
> Restrict the detection code to Intel HW for real, preventing any
> further explosion on my (non-Intel) HW.
> 
> Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: stable@vger.kernel.org
> Fixes: 948ce83fbb7df ("xhci: Add USB4 tunnel detection for USB3 devices on Intel hosts")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/usb/host/xhci-hub.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
> index 9693464c05204..69c278b64084b 100644
> --- a/drivers/usb/host/xhci-hub.c
> +++ b/drivers/usb/host/xhci-hub.c
> @@ -12,6 +12,7 @@
>  #include <linux/slab.h>
>  #include <linux/unaligned.h>
>  #include <linux/bitfield.h>
> +#include <linux/pci.h>
>  
>  #include "xhci.h"
>  #include "xhci-trace.h"
> @@ -770,9 +771,16 @@ static int xhci_exit_test_mode(struct xhci_hcd *xhci)
>  enum usb_link_tunnel_mode xhci_port_is_tunneled(struct xhci_hcd *xhci,
>  						struct xhci_port *port)
>  {
> +	struct usb_hcd *hcd;
>  	void __iomem *base;
>  	u32 offset;
>  
> +	/* Don't try and probe this capability for non-Intel hosts */
> +	hcd = xhci_to_hcd(xhci);
> +	if (!dev_is_pci(hcd->self.controller) ||
> +	    to_pci_dev(hcd->self.controller)->vendor != PCI_VENDOR_ID_INTEL)
> +		return USB_LINK_UNKNOWN;

Ugh, nice catch.

Mathias, want me to just take this directly for now and not wait for you
to resend it?

thanks,

greg k-h

