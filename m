Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5BDC982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 06:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1N06q9Iqt+n0HPR6BLN3adBn216qx/G71jg+AxnkRRA=; b=oV+culqmkTjqezAFBABanoGWO0
	5od8MFn4rndbvoLDs2nCGnWqC6uzq9eFAdM1GBhEqRhJYlcjm7DW9oTkoQMxx3u3f77SDgivZ/SbD
	tznH45fLPsYtSL8+OgbCve5KYfgng1RNXidd3nm/1rj1yX8li/m+eUfZx1t7Ij6+lFmanHsiiolp+
	hkqdsYXE1ShZFbNXDT90EUz4lw2x0gR0Arxnt+QhZ/OrdwS/F/1R3hzxW5IdVjA6N/t7LLanajvb5
	Jc4nKMgB1amfNzZbMGkZxRuMpWLN9CuJYhsGzKd0MFkEpEHkVr+ZXky7mDNQ+iEGH7WmDjNbYhNvB
	H0+AP8Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8u5R-00000004LeL-0wvd;
	Tue, 22 Sep 2026 06:34:41 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8u5L-00000004LdU-2mKz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 06:34:37 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com; s=arckey; t=1790058875;
	 b=Qpchecr0cZSSGtoc0vk3L55wo4MKuiCtmT34cqORrDN5Gt0godpNUvuPrsvvmjUXxzeqM0DrGJ
	  JrMn6iZM2weWbwCcIINd3hWnLRc2jjrI2OU3xuQZyJeqkgw3c/EHYyoDixOLkwaP7moC0pIkVU
	  5uD/pakJ5wwbSYI7q+gtpOZHLIHZRgw3FDe8do5+Ft55HKDAHhZADt82fyJCTT5CySUyH8HCSR
	  WFcjSjH9SEFePIkfkzUnySmFV5PaXQQdXwZSQh1m3Djtn8QSCx91igmFUPMz3DFn/y12qRt/5D
	  uXOgItq7pEcYBhbdIanDUyC5v6cRQ13Ly/dy/12VadGwag==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com; s=arckey; t=1790058875;
	bh=KRF7mzrEcefx2cCAz6FPvzYQT9GQwppHdJJE1JW4tjU=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=CuvN+1wq71+VlrcDCRhz3dtYJnb9qoBv6fMQKwOrDRNvC10AcNEDW6RJZ3HlQFbHPNP300mAwE
	  7rzGnd4dE3hVU9jG6KX9Wy2fZdb6hC22uNN34sIel2/jKMK5WNdrMki7+3XzvhTVuYftMst8L1
	  jNlGPD/TDPFREQuPdHgV/Yw4yrzqqrIll2W23ueh23Kbruga8RJeIzW1Mf2pOAQacm3YVzuKin
	  zezEFER61IwwBuFZXIGZkLkkwk5Pza+ublciAT/TOBpmWXFa2IVNbV7gIZ2KWVs/hf3a/c/Zjn
	  eSWwqUcBCTOQHZJTY/2CZNzEww41wmm/Lk7BjyPc+/CmJA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=1N06q9Iqt+n0HPR6BLN3adBn216qx/G71jg+AxnkRRA=; b=DGp/npwUY1WAxkrCPfDosG/grM
	XqKMEuI9UL+IVBVN5mN0bMo8ay3r07+F69Eo3/8rjW54G7h9WKgicNP2m+wSkwDQ01KznSq2u38vG
	vJGPI8aREF6gIxTxOH/4QSR+XtUpx+Y54wsygKVcCfoBo4RSxjEWiHZ88r3rplnjSqd4=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x8u54-0000000HBVx-3jUT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 06:34:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=1N06q9Iqt+n0HPR6BLN3adBn216qx/G71jg+AxnkRRA=; b=HEhwwlRP3qLm1x3BiOx6/yErcr
	96L28DUv90dLTh0ICYZlv0l89z1LKoBL2EJReSJMV5nKubxJKxfixgaZ7M87PYUyWr0yZowCyQJpI
	IW7lUfbEyr5lOpT1TxOKPf4g6mfNdBq1FffppbX4hO7MlJiY+VMQr+iNf6j8+PILWI0Y=;
Received: from [79.43.46.244] (port=60174 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x8u37-00000000JK3-0fLD;
	Tue, 22 Sep 2026 06:32:17 +0000
Date: Tue, 22 Sep 2026 08:32:15 +0200
From: Francesco Valla <francesco@valla.it>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 05/12] remoteproc: always report VIRTIO_F_VERSION_1
 feature
Message-ID: <arIgI4E5rGXq9H0P@bywater>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-5-dac8c5eb4aa9@valla.it>
 <arFRqopkkJf7Nlq4@p14s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arFRqopkkJf7Nlq4@p14s>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 7b3e744fa8054856a496c064f424bb39
X-AntiAbuse: ID - 7b3e744fa8054856a496c064f424bb39
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x8u54-0000000HBVx-3jUT-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_233435_752390_DD981680 
X-CRM114-Status: GOOD (  25.92  )
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

On Mon, Sep 21, 2026 at 09:47:54AM -0600, Mathieu Poirier wrote:
> On Wed, Sep 16, 2026 at 11:10:50PM +0200, Francesco Valla wrote:
> > There is currently no way to report the VIRTIO_F_VERSION_1 using the
> > resource table alone, as the per-vdev feature array is limited to 32
> > bits.
> > 
> > Considering that the VirtIO 1.0 specification is now ~10 years old,
> > always report the VIRTIO_F_VERSION_1 feature, as some drivers depend on
> > it.
> > 
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> >  drivers/remoteproc/remoteproc_virtio.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > index 74e0da970f1d..cfd66d9d1c9e 100644
> > --- a/drivers/remoteproc/remoteproc_virtio.c
> > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > @@ -249,7 +249,7 @@ static u64 rproc_virtio_get_features(struct virtio_device *vdev)
> >  
> >  	rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
> >  
> > -	return rsc->dfeatures;
> > +	return rsc->dfeatures | (1ULL << VIRTIO_F_VERSION_1);
> 
> I understand this.
> 
> >  }
> >  
> >  static void rproc_transport_features(struct virtio_device *vdev)
> > @@ -275,14 +275,16 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
> >  	/* Give virtio_rproc a chance to accept features. */
> >  	rproc_transport_features(vdev);
> >  
> > -	/* Make sure we don't have any features > 32 bits! */
> > -	BUG_ON((u32)vdev->features != vdev->features);
> > +	/* Make sure we don't have any features > 32 bits except VIRTIO_F_VERSION_1 */
> > +	if (WARN_ON_ONCE((u32)vdev->features !=
> > +			 (vdev->features & ~(1ULL << VIRTIO_F_VERSION_1))))
> > +		return -1;
> 
> And this.
> 
> >  
> >  	/*
> >  	 * Remember the finalized features of our vdev, and provide it
> >  	 * to the remote processor once it is powered on.
> >  	 */
> > -	rsc->gfeatures = vdev->features;
> > +	rsc->gfeatures = vdev->features & ~(1ULL << VIRTIO_F_VERSION_1);
> >  
> 
> But I'm having trouble with this one.  
> 
> First bit 32 of vdev->features gets cleared and then bit 0 to 31 are assigned to
> rsc->gfeatures.  Why bother with clearing bit 32?
>

Bits > 31 gets silently dropped because rsc->gfeatures is a u32; this
was inserted to explicitly drop the flag that has been inserted before
and avoid the "silently". It has no real funtional impact and can be
safely dropped.

> >  	return 0;
> >  }
> > 
> > -- 
> > 2.55.0
> > 

