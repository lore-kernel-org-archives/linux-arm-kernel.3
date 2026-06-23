Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E26CDB471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 20:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3RhUwooFwRxx3GisCh/vJn3sB9qCf4G8uwEEmtd3BLM=; b=XrLcIhoYTw9qwVhzGZyx0pE4jO
	/4OZ4jzQkuk5m1Upd0vSnDoxTZNlfPLqkHUCG1WM1rMvPVkOhXdbHCAyjFR23+wB0sPT9BJsSqTv8
	4mJRyRx6+DsO5u+R+XxBORwv+zsKnY3PcOsXkOZY02X4Q4mQwcrfsnjYrTdcX41+hjChWuk0H7dQv
	uiSsQJg/IWZzd0jREbe8Vja1Y/TUeVmMO+igFYK3TEfE9Ur2shgL8ZpmwXCvmpvaQIPsL9miQ8vVw
	Wzghb78JX5b2b5pH7h8vYWTgIrgSk/YQV5beb5jToOxcymrcxLsIS91i+LNoDkwNFwbaF4krQMNIm
	jXeHTokA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7Vx-00000006pjD-1W8n;
	Tue, 23 Jun 2026 20:14:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7Vw-00000006pj6-0A2U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 20:14:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 439684373A;
	Tue, 23 Jun 2026 20:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 825BA1F000E9;
	Tue, 23 Jun 2026 20:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782245670;
	bh=3RhUwooFwRxx3GisCh/vJn3sB9qCf4G8uwEEmtd3BLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ArvqaJoPikGqUfb+98b682XDPHtnWUlkdu41diEaQOLkpo3Q91ZWiXEcvyqj/6YRm
	 ZfQLVpX/G7T6H6EgrNJf9G7whb69yhUL1/kW+ym57bVialzun4QcPZVO4CcpE02viw
	 dIw1dhKHHEdVMGAykZmoPPyQbYjTeIxH6IEByXumw8Hw1ozK024smQhxVuJELVQln1
	 ZVLJnzAzaz7gXI4ZP5EwrW+iJgyYj1mSt/iKdcllnOMt7KvFNGJ/QoER5BOXXqQC0i
	 L8CMqzeAw8/l8Fd6jBHctH2lNykqaWLYg2HDVH3XsrGQzHmCqmTTUd7br7bx2ybFNE
	 vjebByopwu08Q==
Date: Tue, 23 Jun 2026 22:14:27 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Vincent Jardin <vjardin@free.fr>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Wolfram Sang <wsa@kernel.org>, Kaushal Butala <kaushalkernelmailinglist@gmail.com>, 
	Shawn Guo <shawn.guo@freescale.com>, Stefan Eichenberger <stefan.eichenberger@toradex.com>, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 0/2] i2c: imx: fix SMBus block-read of 0 locking the
 bus
Message-ID: <ajro79ZTzd9h-nZn@zenone.zhora.eu>
References: <20260525-for-upstream-i2c-lx2160-fix-v1-v1-0-f30ab53dd97c@free.fr>
 <20260525-for-upstream-i2c-lx2160-fix-v1-v2-0-26a3cc8cd055@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-for-upstream-i2c-lx2160-fix-v1-v2-0-26a3cc8cd055@free.fr>
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

Hi Oleksij, Stefan,

any chance you ca review this?

Vincent, please, next time don't send v2 as a reply to v1.

Thanks,
Andi

On Mon, May 25, 2026 at 06:43:14PM +0200, Vincent Jardin wrote:
> i2c-imx rejects a SMBus Block Read byte count of 0 (valid per SMBus 3.1
> 6.5.7) and it returns without a NACK+STOP, leaving the target
> holding SDA so the bus is stuck until a power cycle occur.
> 
> The same bug is occuring with two independently introduced spots, so the
> fix is two patches with their respective Fixes: tags and backport ranges:
> 
>   1/2  atomic/polling path       Fixes: 8e8782c71595   v3.16+
>   2/2  IRQ-driven state machine  Fixes: 5f5c2d4579ca   v6.13+
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
> Changes in v2:
> - Handle when count > I2C_SMBUS_BLOCK_MAX the same way as count == 0
>   Reported by the Sashiko AI review on v1.
> 
> ---
> Vincent Jardin (2):
>       i2c: imx: fix locked bus on SMBus block-read of 0 (atomic)
>       i2c: imx: fix locked bus on SMBus block-read of 0 (IRQ)
> 
>  drivers/i2c/busses/i2c-imx.c | 36 +++++++++++++++++++++++++++++++++---
>  1 file changed, 33 insertions(+), 3 deletions(-)
> ---
> base-commit: 6916d5703ddf9a38f1f6c2cc793381a24ee914c6
> change-id: 20260525-for-upstream-i2c-lx2160-fix-v1-0cba0a0093e5
> 
> Best regards,
> -- 
> Vincent Jardin <vjardin@free.fr>
> 

