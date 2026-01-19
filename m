Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC99CCF2D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 09:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0tFE/AVqw6l7os+M3C9eO0i9mKqrHAbantht9EwqFA=; b=wl5G3YYW5nFpEz6MKviPJHLvNJ
	dOfC0sU7dG/88V8+99dztdbP3ZzeS3bZxob5S78vkZrQl7lAKfg5s4wtidGfp6WYcToQFCrNrjJut
	pzG1r2mYGRsG2BH/YXIL6nMdb/VXsnrTXOOpGeZSm3Lh9q/8tGWzfRDvHsVQhUAv7a7OTT29OSArg
	2oqy3/t5Fz4Q/m4qe3FX2GCudCfafaxXjX/bjNs+hXmM+D0u2mt1fVEPuUU1haaGU5EUjO9FgJLF2
	zmZTxwFGM2vaVQ5iXg7ic+LblNZGR3G1T49Mk371tb8DYbcmmU/9893yTWo998gFSlwJFeLVn1cy7
	BANzKcag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhldm-00000001dtj-0nGv;
	Mon, 19 Jan 2026 09:33:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhldg-00000001dtM-3dkF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 09:33:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CBCF416F2;
	Mon, 19 Jan 2026 09:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC1BC116C6;
	Mon, 19 Jan 2026 09:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768815214;
	bh=/4SR4V4CxGLt5YZR1VuSCKd7opFB3UpRFapIrS+K6Qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OQMc4otX7TzNsUxgq+3vqJY7WADVUcOotynEgop6JKkAftaKHNK9pzTlY1I5chFPy
	 v0HJ1TWzaYSLOcHJ18dG7RFBE7nmtuiTWwAVSSsGniFgNdcJ3QEQadNVArH6WKynGB
	 xvEVfJiREpj9USkaJP00p/xit4+UD9/vMMnoL9dM=
Date: Mon, 19 Jan 2026 10:33:31 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Abhash Kumar Jha <a-kumar2@ti.com>
Cc: pawell@cadence.com, peter.chen@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, rogerq@kernel.org, u-kumar1@ti.com,
	p-mantena@ti.com, theo.lebrun@bootlin.com
Subject: Re: [PATCH] usb: cdns3: host: Add null check for host_device before
 accessing its members
Message-ID: <2026011935-ransack-unworldly-7cf5@gregkh>
References: <20260119082242.1922599-1-a-kumar2@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119082242.1922599-1-a-kumar2@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_013337_669426_4FEEE3E5 
X-CRM114-Status: GOOD (  16.37  )
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

On Mon, Jan 19, 2026 at 01:52:42PM +0530, Abhash Kumar Jha wrote:
> In cases when the xhci device is not populated, we see a nullptr
> exception when resuming.

How can that happen?  What changed to cause this?

> Add a nullptr check for the host_dev before accessing its private data.
> 
> Fixes: 3a85c1011540 ("usb: host: cdns3: forward lost power information to xhci")

No cc: stable?

> Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
> ---
>  drivers/usb/cdns3/host.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
> index f0df114c2b53b..8cc7fc1de6193 100644
> --- a/drivers/usb/cdns3/host.c
> +++ b/drivers/usb/cdns3/host.c
> @@ -141,9 +141,12 @@ static void cdns_host_exit(struct cdns *cdns)
>  static int cdns_host_resume(struct cdns *cdns, bool power_lost)
>  {
>  	struct usb_hcd *hcd = platform_get_drvdata(cdns->host_dev);
> -	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
> +	struct xhci_plat_priv *priv;
>  
> -	priv->power_lost = power_lost;
> +	if (hcd) {
> +		priv = hcd_to_xhci_priv(hcd);
> +		priv->power_lost = power_lost;
> +	}

Shouldn't you be returning an error if something went wrong?

And what protects hcd from changing right after you tested it?

thanks,

greg k-h

