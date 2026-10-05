Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD9DCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 08:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1Tdp41tcttMIXzEsnKaz7v2lLzbgncTRrts6HtrK/4=; b=c1h0sX5M5GsB0v24Z/1seubVZ2
	+ZMp04QgYiPYmfA7Ea4COEKSEjQBk8F7Ovd+q1WKVjouyeU12ykpRZfJZaZThbj1d4YfG3JfP6MwN
	jeCcT11jMHaQSh2nQJ3z4AM9sFmPTx6pj1p95c4raRBtLmu2daSvi3VGD2foN50mAe8eBvmpfGvIt
	guMtURi8GM5J6ki2Iz8cHnPJhZUcmP9OQcuT0xskqFth56mpJa6QZQZ69nS4uushQNfNnQqPQqOQS
	u2uoY6+dxKjsDO4C7lBE13yVqTCg1l0q6KkxQFFL1jnm8xXVMLFVCldzr3RKn3ph6JeVUe3HvHfAL
	0fn7Squw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDe5d-0000000FtEV-2GmC;
	Mon, 05 Oct 2026 08:30:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDe5c-0000000FtEH-1UHN;
	Mon, 05 Oct 2026 08:30:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F374A433DB;
	Mon,  5 Oct 2026 08:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34EFC1F000FF;
	Mon,  5 Oct 2026 08:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791189027;
	bh=N1Tdp41tcttMIXzEsnKaz7v2lLzbgncTRrts6HtrK/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mc6BgPdstjE5mHOMP9Ya3gYfkxM1G9DPWSSKfzHGlwaMcKj+ezqoYdXv7kfxGT/GC
	 OJqs/GNzf80R3VURsLMxkqwM7dWfJK4T5iqD1j8k9Z5NJpIZc76GEfLlzK8mXFUEIN
	 mqc1FyvB1KMU+TFC+H827L6eA8DHmaQmsZa7xyxQRzeMtf68Z3yQ1jOB8goX8cs9aM
	 T6kJXIkHI4tR+E+OLG1Uu221MxzfZdS7wB572QKdMl+GsTRSYU/GAfAe6OOHNsfjAi
	 5tcLGHhA0q0hjePPSsKc/eI+ZxvDOaxTvzcmHVkkjcMFK2j3CT9zKYBz4wsZ+w2B+S
	 uDf7pmmzAT7CA==
Date: Mon, 5 Oct 2026 10:30:24 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH v16 1/6] phy: core: add notifier infrastructure
Message-ID: <asNgINDic6A3Gvtq@parshuram>
References: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com>
 <20260924-b4-rockchip-dwc3-rockchip-glue-v16-1-126a2e9133c3@collabora.com>
 <asDFBIVf06-VaWdx@parshuram>
 <asJGziv0N3qtXo6_@venus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asJGziv0N3qtXo6_@venus>
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

On 04-10-26, 14:44, Sebastian Reichel wrote:
> Hello Vinod,
> 
> On Sat, Oct 03, 2026 at 11:04:13AM +0200, Vinod Koul wrote:
> > On 24-09-26, 19:25, Sebastian Reichel wrote:
> > > Some PHY devices with multiple ports (e.g. USB3 and DP) require a reset
> > > if the configuration changes or cable orientation changes. This is a
> > > problem, as the consumer device will run into undefined behavior.
> > > 
> > > With the new PHY notifier API introduced in this patch, the consumer
> > > driver can hook into reset events coming from a PHY device to handle the
> > > PHY going down gracefully.
> > > 
> > > Note that this uses -ENOSYS instead of the more sensible -ENOTSUP for
> > > the stub functions when GENERIC_PHY is disabled to stay consistent with
> > > the existing ones.
> > 
> > I dont think this series has the usage of this.
> > 
> > I think I am still not convinced why a phy should notify as I dont feel
> > we have any mechanism to notifying. Checking status and letting people
> > know if not really a notification mechanism... Maybe add a status call
> > instead?
> 
> This series contains the infrastructure and the consumer of the PHY
> reset notification (dwc3 rockchip glue driver). The producer/sender
> of the PHY reset notification is the first patch in the USBDP part 3
> series. I grouped the patches like this, so that this series has PHY
> patches followed by USB patches instead of PHY - USB - PHY. Patches
> must be applied in the exact order (i.e. first the patches added the
> PHY reset notifier infrastructure, then the DWC3 notification
> consumer and then the USBDP notification producer).
> 
> The broader picture solved by this is (pre-existing race condition
> issue in USBDP):

Thanks, this is helpful to understand the context. Few questions on
below to help me understand more...

> 
> 1. USBDP PHY provides critical resources to DWC3 USB controller

what resources are these?

> 2. USBDP PHY needs to reset to reconfigure (e.g. enable/disable DP side),
>    which means the resource is temporarily not available

Who invokes reset, I guess the controller (dwc3), so it ought to be
aware of the reset condition.

> 3. DWC3 accesses its registers during the reset -> SError, because PHY is off

I would assume that dwc3 should know about it as invoking entity..

> 
> This series combined with the first patch of USBDP part 3 changes
> things, so that it works like this:
> 
> 1. USBDP PHY provides critical resources to DWC3 USB controller
> 2. USBDP PHY needs to reset to reconfigure (e.g. enable/disable DP side),
>    which means the resource is temporarily not available
> 3. USBDP PHY driver sends pre-reset notification
> 4. DWC3 goes into a safe mode after receiving the pre-reset notifiaction
> 5. USBDP PHY does the reset
> 6. USBDP PHY reset finishes, USBDP PHY driver sends post-reset nofication
> 7. DWC3 returns to normal mode after receiving the post-reset notification

> 
> This avoids running into the SError.
> 
> Greetings,
> 
> -- Sebastian



-- 
~Vinod

