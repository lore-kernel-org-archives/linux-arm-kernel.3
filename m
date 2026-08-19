Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D268C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 07:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M34KX+Pc2IGBqMteXVnYN6PgKHrJIKH4HQnI+YeHSrw=; b=x/Y7NKRlencmzVOm1eT2bOAy3U
	cClW7FAcybAqPIZE/qE+9xCq3X12vABA4DpcC8bT18UpenurzqvGC/GcgbF694xML708YBLz64pk2
	eWPsiy5EV3OvItybIf4jVQVoEsA2hPKr3qXIr0yMd5GRDvsVuZ9Z8sR/I+gttwxTSpQ5jT31iK2U8
	4USLphIOwHoCmfwdB/xNK8l0+1O3XCjTAodp9G4lREkkUcMHRxE8JnmSsoCizyhqopm7RyGvxJcUl
	gZZ1nrJB30ZcVd5kAQI1SlUwiDnjpY9bphlCwm4yq0h0f0EogaFFZ+76u6tMnw2+ANvxBjonGcEJ4
	NzE29MkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaHu-00000009990-2l2n;
	Wed, 19 Aug 2026 07:00:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaHt-0000000998u-2WMP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 07:00:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DDD9A6020E;
	Wed, 19 Aug 2026 07:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03BC51F000E9;
	Wed, 19 Aug 2026 07:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787122836;
	bh=M34KX+Pc2IGBqMteXVnYN6PgKHrJIKH4HQnI+YeHSrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RTIf9opbjRG03FOf+ucBAR0RkwIyP3j7P0JvikgYXIdsXTCaCqMMrO1IilszSGGt+
	 tuH+i33UooEK2i7MHcniW6HcUN3ykCWpfbkJUBcEBnci5iWNgrkZUFaVL9AhpV32x/
	 XE+nicKCp982tc+8Qrengh/6ilzuocDqZE8GWuRRhKEVh4HMS5zBZJTvYHlEsi0h7g
	 Nz/Liu2kA7KLo0DW9KKGGYqM//aotsY8HWdc8mvAbZfmuRKsFM1DFwsMDNPgg+gTYf
	 bJ7/hpnDNCQehvrVNbDZ5PN6RaU+Km+D4SWMnRRiurrup45vmhZ+PnD9j0aNSvDsBW
	 RAwh9EAKy96UA==
Date: Wed, 19 Aug 2026 09:00:33 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>, 
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: mxs: fix DMA channel leak on probe error
Message-ID: <aoVUdXdbzZNOgSkD@zenone.zhora.eu>
References: <20260815151720.3757460-1-ruoyuw560@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815151720.3757460-1-ruoyuw560@gmail.com>
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

Hi Ruoyu,

On Sat, Aug 15, 2026 at 11:17:20PM +0800, Ruoyu Wang wrote:
> mxs_i2c_probe() requests an exclusive DMA channel before resetting the
> controller and registering the I2C adapter. If either later operation
> fails, probe returns without releasing the channel because the remove
> callback is not invoked after a failed probe.
> 
> Use devm_dma_request_chan() so the device core releases the channel on
> probe failure and driver detach. Remove the manual release from the
> remove callback because the channel is now device-managed.
> 
> This issue was found by a static analysis checker and confirmed by
> manual source review.
> 
> Fixes: 62885f59a261 ("MXS: Implement DMA support into mxs-i2c")
> Assisted-by: unnamed:claude-opus-4.8 typestate
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>

merged to i2c/i2c-2.

Thanks,
Andi

