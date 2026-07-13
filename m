Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19E6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 04:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PAJlGm06FdpPNE7UoP/ZDlHwM5ZAN6RmcnqlknM3U8=; b=C6YNyJlLNgm1RbRmxO9SpRZEdi
	gnOaZgyG2uGz8PBwucMR/iHoTU25zdsWehcPeuhS2wNpycuKElCnROMeSGt54hbALeL26CVc4igHj
	22BH/DXPjT2Kb+4ZopdePhR84ojH59fHH4H3L+UUvaoIxl+Sy6LFhCgPhz+NtYCM3VNZCEabxuoOi
	XJeSD3m9XsKffwVCeuYuQvKMYKuIwJjqm/esR2Pmg/ROlJ0xYDcpqDdw8JUGPz6Lnuu/c6Re3dAUo
	BMHxyPTal7/3LzGwHpy1VL/QEC3fFrhoWP4c18Tk0ob4hDeeIkWsVoQ2CU/qxDyEh2TXuZNZYhkpp
	E+BVaSHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj8ZW-000000087J6-2gv2;
	Mon, 13 Jul 2026 04:47:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj8ZV-000000087Ix-1KB2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 04:47:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C9F842DE9;
	Mon, 13 Jul 2026 04:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1190F1F000E9;
	Mon, 13 Jul 2026 04:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783918032;
	bh=9PAJlGm06FdpPNE7UoP/ZDlHwM5ZAN6RmcnqlknM3U8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=0mMAEGUuZ+pvom+KPpTGZ/jy2dn31zcecZPV462JSSnQOYNsGMieQl7Qs8RG99wDe
	 ysif8cOHHXdhAKuohY0T/tomxmuYxDjz+GBytCjV/RTSQ7BK+b/JpJBv7nDy1J95gr
	 oHnQWFGN9XqHHtwZPrtQKnV8hkfpAhuF0LA/vzJg=
Date: Mon, 13 Jul 2026 06:47:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: demiobenour@gmail.com
Cc: Russell King <linux@armlinux.org.uk>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Biggers <ebiggers@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] drivers/crypto: Mark QCE as BROKEN
Message-ID: <2026071312-uncover-refining-8cac@gregkh>
References: <20260712-qce-broken-v2-1-b2dfff47f7f5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712-qce-broken-v2-1-b2dfff47f7f5@gmail.com>
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

On Sun, Jul 12, 2026 at 05:31:31PM -0400, Demi Marie Obenour via B4 Relay wrote:
> From: Demi Marie Obenour <demiobenour@gmail.com>
> 
> This driver is harmful:
> 
> - It is much slower than the CPU [1] [2].
> - It Has a history of bugs [2] [3].
> - It does not have exclusive access to the hardware [4], causing races
>   with the secure world.
> - It register its implementations with too low a cra_priority for them
>   to be actually used [5].
> 
> Therefore, disable it to ensure that nobody builds it into kernels they
> intend to ship.
> 
> In the future, the driver will be used for processing restricted media
> content.  However, the kernel does not currently support this.  Since
> the driver will have future uses, allow building it if COMPILE_TEST is
> enabled.

Why not just delete it now, and then bring it back when it is needed in
the future?  Otherwise this will just trip up the static code checkers
who will attempt to "fix" things in it.

thanks,

greg k-h

