Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32E0C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWWMyiRyHQgnIeqT2FsVGOyXULdTvyWYrbxiNMTKbzc=; b=hmavNPM/aQ1npkto7O3GTK94Iz
	HxYy9uMXl/i2ty9rbI4+ULzeTA3ku2hsaA3p0krXRNFP53SmvnsDYJntNSGKwx8zXCFxH0eghVI34
	aebTAIhhLy7GUiHWrHXsL+X0kyGq/pMCDOMhoSU62JmjL8MIQ/DWD7ZfNAlmkEGLZMSU8G8q8uhNL
	LfGimv7w9qZ0iy3W+eBGzZIvhkq28Pp1sV9VpcduJ6p1/T6+g7RqgIsg1p1hLERaCgVPayUzz8GGw
	WP1SYC8e2xsOixAqmurv/9BilJsoqBA22QQsYk42/ZkahPP0VPZlTf2Tw73GNJsTwzvGjE0i6/0y3
	kfpuV5fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqu3U-0000000HRGG-2cVv;
	Mon, 03 Aug 2026 14:54:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqu3U-0000000HRFj-03JB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:54:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D9965403F3;
	Mon,  3 Aug 2026 14:54:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A471F000E9;
	Mon,  3 Aug 2026 14:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785768854;
	bh=LWWMyiRyHQgnIeqT2FsVGOyXULdTvyWYrbxiNMTKbzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fNMCSboL3Q4QfowHWSTQl4JGBKt7K2MpilPyyL7bcEHAJ9Nj8N/OlLUXPRngp3m9w
	 e5ZCPSNNOmvz2UDmhRh7vDfrEaBgLlJVOr472RvCkZocJKhbOAHnLjJTXPhwpAeJDd
	 mUggtZjIrCuWKohhfIobaJuy6Cuv1c3MMYitaG2s=
Date: Mon, 3 Aug 2026 16:53:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v4 5/5] serial: imx: serialize imx_uart_ports[] lifetime
Message-ID: <2026080341-agreeing-context-ca78@gregkh>
References: <20260731181844.11330-1-kmehltretter@gmail.com>
 <20260731181844.11330-6-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731181844.11330-6-kmehltretter@gmail.com>
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

On Fri, Jul 31, 2026 at 08:18:44PM +0200, Karl Mehltretter wrote:
> imx_uart_probe() publishes its devm-allocated port in imx_uart_ports[]
> before uart_add_one_port() because console setup uses the table. The entry
> is not cleared when adding the port fails or after removal, leaving a
> dangling pointer.
> 
> A sibling probe can register the shared console through that stale entry.
> This was reproduced under KASAN on QEMU mcimx6ul-evk by unbinding a
> sibling UART, unbinding the console UART and rebinding the sibling.
> 
> Keep the entry valid through uart_remove_one_port(), then clear it. Protect
> port addition and removal together with their table updates so sibling
> operations cannot interleave. Reject an occupied slot rather than
> clobbering an active port during a duplicate-line probe.
> 
> Fixes: dbff4e9ea2e8 ("IMX UART: remove statically initialized tables")
> Fixes: 9f322ad064f9 ("imx: serial: handle initialisation failure correctly")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/all/20260719162850.043B41F000E9@smtp.kernel.org
> Link: https://lore.kernel.org/all/20260719222501.CB4CB1F000E9@smtp.kernel.org
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Backport note: the removal fix is self-contained. Complete probe-failure
> coverage also requires patch 1. With patch 1, all fallible allocations
> precede console registration, so rollback can safely clear the table.
> Without it, a late allocation failure (only reachable with fault
> injection) can leave the console registered after imx_uart_ports[] is
> cleared, turning the pre-existing use-after-free into a NULL
> dereference.

None of these should probably be backported, so this should be ok :)

thanks,

greg k-h

