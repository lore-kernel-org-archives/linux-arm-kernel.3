Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFB8CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 15:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CyqMjRcBNzsNW4+u7ngkuXlJ7cl2LUvTia3Gu9mccqo=; b=z5KPFXKlroUs5O/hD/wSNoK0Hy
	ra1EaPX8Nd6gcZ8Z+aAaiCwl+Jh+GLupUfcePkUYA1RGDxrENuytCFJ7hxoprJAXwLa97y77EStJJ
	JfnkNx1VJmhEdnqt1TeUrtTDz7OF96ipvi9CH+ph4lh6qI9uu2EmzW7LFlS3T0585qsKn9uWK7Nw2
	s5GJni7HRc+F90va+fQrk/MKL06W8FOBFHf7isMB+bkxX/G9wp/7Ea1MVN6n1FtpVdu8OB3oRvPeO
	cjrZgYUkOzj9s3Zccg8o8z8XuZ8eKKKhE3la4N4wUFbjgCiUdJ7LBaV7T2NjiZ6Tx/17uyTEiCYzv
	QpluegDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhRX-00000009gpd-1E3z;
	Thu, 11 Jun 2026 15:35:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhRW-00000009gpG-1I5z;
	Thu, 11 Jun 2026 15:35:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1673741A8D;
	Thu, 11 Jun 2026 15:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A441F00899;
	Thu, 11 Jun 2026 15:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781192142;
	bh=CyqMjRcBNzsNW4+u7ngkuXlJ7cl2LUvTia3Gu9mccqo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Nkcb7rNGVLCJ2HdS9QQfPdbdGLjE9oRSbWoVk17PMAvYXTitn6IKehO9rvyNIF9+p
	 OupNCoPq7xtTtjkTTrZ7rrZP2G4hQMB2+Z7MgayrgKhDinKH87J7J06Z7bIjEVFxlF
	 mP95yrpByTg0PHFcM94Z0hvmP8NZAD56bkkIeTheNnLGvCYw+WC0yBD+uoD5trapRB
	 kmLvwLACjzRG6QtUpistPnKLsZtG96Vi62jDMF1bFZbNdcdkn3qkhniB2ZrZk8KHK+
	 VnlSiC6oVM+6CkZfYaWhFizOLaiMbeur0OBwsAqMzH0pWKEJqpSewHevj7SQIKeAkR
	 wtnf3sIBOA2jQ==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
 Felix Gu <ustc.gu@gmail.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sashiko <sashiko-bot@kernel.org>
In-Reply-To: <20260609-lvds-phy-v1-1-6ad790c6d0ea@gmail.com>
References: <20260609-lvds-phy-v1-1-6ad790c6d0ea@gmail.com>
Subject: Re: [PATCH] phy: freescale: phy-fsl-imx8qm-lvds-phy: Use
 synchronous PM runtime put in reset
Message-Id: <178119213836.568088.17165360220822956179.b4-ty@kernel.org>
Date: Thu, 11 Jun 2026 21:05:38 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Tue, 09 Jun 2026 22:48:50 +0800, Felix Gu wrote:
> The mixel_lvds_phy_reset() function pairs pm_runtime_resume_and_get()
> with pm_runtime_put(). The asynchronous variant queues a work item
> to handle the idle check and potential suspend, which can be cancelled
> by a subsequent pm_runtime_disable() call if probe fails after the reset.
> 
> Switch to pm_runtime_put_sync() to run the idle check and suspend
> synchronously.
> 
> [...]

Applied, thanks!

[1/1] phy: freescale: phy-fsl-imx8qm-lvds-phy: Use synchronous PM runtime put in reset
      commit: b28ec8ce03d8f9a0f7a9ec84f1ed9b5a6f393791

Best regards,
-- 
~Vinod



