Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D5CC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 15:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvisue5QPH6gBWf5Ajo7QVKxcBk4AHOQBMnbNhZWhMA=; b=U6SNtkYzrVsW56afPoORpBoqa8
	bmC81w1nokP4ri6UgMd2XlcErQejpqJCCV/06x+t6u6i9D7a9k19Qr/9AoHgPHutnZnmJtJmx7pVK
	xjaq4FJGYQR8H1xW9zdd/iQk/OSVnlhnbLbCfB2RCeN4WaTixiOR+bQRAVDIdAR9nMOWrf8IOc9Jj
	CbbKOZCTvOSLwRQItvPyQmaRZJ9Z5oNWN2u2R4MwpzuZYlQPCSeZftNpRUR/6Si82FrAJf7jvDGx2
	0KjEYVbQ7Am8G6jJQcBrP9TZXLpImz+aq8DlxSos7rP1Y3nzaNXGJoxnfKej9WsXjePiOkO1nr3s3
	WeHMgLUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjecm-0000000CSTt-2JG7;
	Tue, 14 Jul 2026 15:00:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjeck-0000000CSTO-1m2h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 15:00:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D750D41B03;
	Tue, 14 Jul 2026 15:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EFFA1F00A3A;
	Tue, 14 Jul 2026 15:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784041241;
	bh=jvisue5QPH6gBWf5Ajo7QVKxcBk4AHOQBMnbNhZWhMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JBxoa8DSQH3dpepqMHLAFDRVZiLzaaF39XmBG1J8hvUs12cUW011ITxT4xIw9xFlF
	 bGRjv7XLDolkfJDY79GoMM9bz24P4Kwi2dMjraXCYb2xAwqZKYYByq13HDq2VONymU
	 T55vX9YJ3N/1XeidPaZat9jp3w3WQoYikNLQxAk9i7c0wpzzZD/dzgb+OQoKaSU4HD
	 77Srfg+kpG7BOf0QxyxvOxhpOQBTVCXX6DAL46w8pbDne9PbUhL6hG6VQeWvkK+bmX
	 PAVm6a9aCXMAuBanxihaD+fv7XpgO1Y0wBrEStVuWurga+GYp9fj4spJ1E0YEa/kOm
	 KZ4eghKGkz2Kg==
Date: Tue, 14 Jul 2026 17:00:37 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Vincent Jardin <vjardin@free.fr>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Wolfram Sang <wsa@kernel.org>, Kaushal Butala <kaushalkernelmailinglist@gmail.com>, 
	Shawn Guo <shawn.guo@freescale.com>, Stefan Eichenberger <stefan.eichenberger@toradex.com>, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Carlos Song <carlos.song@nxp.com>, 
	Stefan Eichenberger <eichest@gmail.com>
Subject: Re: [PATCH v3 0/2] i2c: imx: fix SMBus block-read of 0 locking the
 bus
Message-ID: <alZO9GNx51oPBQuP@zenone.zhora.eu>
References: <20260713-for-upstream-i2c-lx2160-fix-v1-v3-0-073ac9e103a5@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-for-upstream-i2c-lx2160-fix-v1-v3-0-073ac9e103a5@free.fr>
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

Hi Vincent,

> Vincent Jardin (2):
>       i2c: imx: fix locked bus on SMBus block-read of 0 (atomic)
>       i2c: imx: fix locked bus on SMBus block-read of 0 (IRQ)

merged to i2c/i2c-fixes.

Thanks,
Andi

