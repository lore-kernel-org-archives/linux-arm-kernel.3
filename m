Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96668CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 05:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/psBy+Jgvatfvvf8zNKoD1kHN5hnr8RpxXntok5OONI=; b=BGzYA0P8Oo4ApeFMJGZ24xKLAs
	/jjyU+cgiT4U2UwhrjBZQXWy42gqMZGXV4CS1O2UpG10m4pD2WPv6FMHDSdVutTHwqb0wsi0s5SMa
	1HqEcgDnBHn1o/5wxPAdT+YZQ0rCzwUOftPKcCriVZRrb4Pka0xu7D0+B17dXACo4lZpqMF4fmPme
	8ZMGTf6WgFEtxy6Nsd3ikDUqXqN/V+Gu9Fq1gcO3zDhX2yt3Z2tPPA3y0C39kJjycZhbCyzn2jY+4
	7icZbwr3oKJTZ5nyLsSP/TPOv2knrPYTUD5+tk5kFAr3/kcdmqw89us1rmnUme6miZHVKywStqiip
	mo9iEFsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSxq-00000002roL-3mc0;
	Mon, 08 Jun 2026 05:55:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSxq-00000002roF-0PYy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 05:55:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F19C46001D;
	Mon,  8 Jun 2026 05:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8771F00893;
	Mon,  8 Jun 2026 05:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780898156;
	bh=/psBy+Jgvatfvvf8zNKoD1kHN5hnr8RpxXntok5OONI=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=WyPoKIKco7VmL7NDVBM79GDRt3qtu5GoODeti7ZQGDXZHZpuTwIR1kYabDknL8EOD
	 VGLzsQ1oVTVOYd3PXfKVRpN9TB/7VNbQsMt/N4FiB6Y2ODXdyPazn7qjdmx0J5DcH+
	 5haSWZIwmZUShgfU2ub3tY9xcng1u8sB+KZT5OPC7SJb3HxSoHf9l0uXr3zQMqa+zx
	 GplqWfNZv5T41sI46gjYrvCncmlOKLijWBc5lKHVgbXMaFhreRoxAdOpyJliFQgPXv
	 ny1OKs0a9R2udkNdNtsCsqdRNuJieneFbffUQVjgbi9JXI85FUNqh+2DKEwPZ0G5Il
	 j4P9W4eWpHVcw==
From: Vinod Koul <vkoul@kernel.org>
To: Frank.Li@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, dmaengine@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20260407032755.2758049-1-shengjiu.wang@nxp.com>
References: <20260407032755.2758049-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] dmaengine: imx-sdma: Refine spba bus searching in
 probe
Message-Id: <178089815387.15844.2917826633500399356.b4-ty@kernel.org>
Date: Mon, 08 Jun 2026 11:25:53 +0530
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


On Tue, 07 Apr 2026 11:27:55 +0800, Shengjiu Wang wrote:
> There are multi spba-busses for i.MX8M* platforms, if only search for
> the first spba-bus in DT, the found spba-bus may not the real bus of
> audio devices, which cause issue for sdma p2p case, as the sdma p2p
> script presently does not deal with the transactions involving two devices
> connected to the AIPS bus.
> 
> Search the SDMA parent node first, which should be the AIPS bus, then
> search the child node whose compatible string is spba-bus under that AIPS
> bus for the above multi spba-busses case.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: imx-sdma: Refine spba bus searching in probe
      commit: d52d42e2e5d9f13166e81ac837ebb023d1306e61

Best regards,
-- 
~Vinod



