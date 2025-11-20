Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBF9CF8549
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/m/EfXUk0AXcxfD539Kfk5u/zv15JVjuO6EnxA/ftU=; b=DtBirGFhLa1gaUnH4c6UcDEXBD
	oD7U4F1WPZ4QFAdxvXPP63JNzdEQfpFbedkImLv0mF4c7AymlCRUpLUbzc1wCiYsWW7hcaieLb6sX
	BnZFpX8X0T9ZzJ4bd/MfSQjRpPf8X9Xk+ZJNDc3tm0xw1YCTuC5VIcpdEdTzTpW+dwsRXS3WbehAu
	xRXwKbZJ3aFz7Mooit6CxUVqC15qLWANkkT5wQAw358dMLkZyH6/tP/eR5A68YAMxtEe1b9b01lWw
	f2/SJ49AEnx20EVMBpBcc8RG3nvl35FOHMfplGIYotBXby2MFngplghS/HUl2Ypt3ipQSu1b+rroN
	p3m7B7Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8CE-000000074A9-1wlh;
	Thu, 20 Nov 2025 17:11:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8CC-0000000748s-00ee;
	Thu, 20 Nov 2025 17:11:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A903A44215;
	Thu, 20 Nov 2025 17:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F7AC4CEF1;
	Thu, 20 Nov 2025 17:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763658707;
	bh=PD7zSy2DUzt2FkGyp5vvTIfvxYWDS94+zaKXi5No4Fo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LQjUp6y75EqXNoORw6oxhq6T08GscOn2QsFBGxshNyIY/1gtHAkhuCx18Ogb9GLV7
	 hHsuv4/ygKSS3dtdnalT0T3btoDv6nNXDWYZ418c8bC6EwJLU+xeXOdcSPJXFOghMi
	 cagm4XcnQ4JkXTmN4pHmgpqVN8r841R73APmwsGeQQH8fOFvMAGpe08kGwSuRh7VJp
	 CwlPrBeBmTV7gf4NyV+UaejxlOBkvq95+/Oe5UKGierCP16V/otGTTssQyu7W+OrC3
	 4yEdBin+OH8Y4HnstUoz9m/1vVKLX9sr5cOgKK4X+1RIiL4cArynyRGJbg4fA7kF8o
	 5P0/Q3WH8gnjw==
From: Vinod Koul <vkoul@kernel.org>
To: Frank.li@nxp.com, kishon@kernel.org, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
 Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250925013806.569658-1-xiaolei.wang@windriver.com>
References: <20250925013806.569658-1-xiaolei.wang@windriver.com>
Subject: Re: [PATCH v2] phy: freescale: Initialize priv->lock
Message-Id: <176365870435.207696.4457416829154592287.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 22:41:44 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_091148_068205_33B80FE2 
X-CRM114-Status: UNSURE (   4.92  )
X-CRM114-Notice: Please train this message.
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


On Thu, 25 Sep 2025 09:38:06 +0800, Xiaolei Wang wrote:
> Initialize priv->lock to fix the following warning.
> 
> WARNING: CPU: 0 PID: 12 at kernel/locking/mutex.c:577 __mutex_lock+0x70c/0x8b8
>  Modules linked in:
>  Hardware name: Freescale i.MX8QM MEK (DT)
>  Call trace:
>   __mutex_lock+0x70c/0x8b8 (P)
>   mutex_lock_nested+0x24/0x30
>   imx_hsio_power_on+0x4c/0x764
>   phy_power_on+0x7c/0x12c
>   imx_pcie_host_init+0x1d0/0x4d4
>   dw_pcie_host_init+0x188/0x4b0
>   imx_pcie_probe+0x324/0x6f4
>   platform_probe+0x5c/0x98
>   really_probe+0xbc/0x29c
>   __driver_probe_device+0x78/0x12c
>   driver_probe_device+0xd8/0x160
>   __device_attach_driver+0xb8/0x138
>   bus_for_each_drv+0x84/0xe4
>   __device_attach_async_helper+0xb8/0xdc
>   async_run_entry_fn+0x34/0xe0
>   process_one_work+0x220/0x694
>   worker_thread+0x1c0/0x36c
>   kthread+0x14c/0x224
> 
> [...]

Applied, thanks!

[1/1] phy: freescale: Initialize priv->lock
      commit: 95e5905698983df94069e185f9eb3c67c7cf75d5

Best regards,
-- 
~Vinod



