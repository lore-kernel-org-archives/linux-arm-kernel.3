Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4EAC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 03:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0tjl432vTB1/RxQoxphlMy3vxL19wMdIIx/XIy1XXaw=; b=ag0PoNZO8eEYq65Fri5LXO8sJD
	CipNySaw4yJy/8r00B5oXVb7pSl29IzQ1hiGLzbXJgN1oE6rKVxk1fSW+5GVu1e7J8eFy3mG+emH8
	j/WadYw2o+8VX6ieRiVyxTDj+lYJvPPiD6bCl44gLZuo14BOkwTa7lNnjmVAAhX2HreNMogqv0lf5
	/c0vA8+dcogThPsOKRH56Oj+tp3m9v0Cc07VHKFXgbfa+0+RD6KyX2VmHpKvu5l1+kJiOMCvCu3kz
	eC1N7hCyDLINwBLePu4V0rKk7gfZLEeG11Nlz2GBm52k7cijTFOqNe1x1v3aiuThzSDGvkWCJFKxk
	S612G/cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJ7Q-0000000EuAF-1qhT;
	Sat, 26 Sep 2026 03:30:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJ7P-0000000EuA0-0Gwg;
	Sat, 26 Sep 2026 03:30:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CFABE43C4A;
	Sat, 26 Sep 2026 03:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E27241F000FF;
	Sat, 26 Sep 2026 03:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790393429;
	bh=0tjl432vTB1/RxQoxphlMy3vxL19wMdIIx/XIy1XXaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P56hscMjemKRrSfSpBib9EPK+8htmF1XvGOAzY3DdgA2RQxClSgLaUrEh8sOH5I09
	 BhvZxI/MCLcWzLZdGnJ9aRRD2TRjnrKqIhfZq1U/feQkbL9aLSX/z9qduoyKlM4aaQ
	 IzMuj3+RXDIvgu2MKksua1s3inWPwy3YBdFwXYlT4WXsGJjB/wX/audzcTIZzylQfG
	 qQI6liUinBuHvWxfOj7wfWbPNeXuJZg6qscby9QNVsWa3DsSqSlY74NIAkOa6cobGZ
	 W12r7ShPqSW4JLIUYsID8Wu/YtfmOCmRY6tZV3Ee95BaJ/wwM0pj2YLctYK6zjs/bW
	 6qGbkkf9jsD+g==
Date: Sat, 26 Sep 2026 05:30:07 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Yubing Zhang <yubing.zhang@rock-chips.com>, 
	Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v15 04/16] phy: rockchip: usbdp: Fix
 devm_clk_bulk_get_all check
Message-ID: <vbzcpznlyxsuqbfnn3ywpuvk4kpokgodd73tgv27i6szk3acpv@5kt2d2rprpcn>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-4-80e2c11d1ce8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-4-80e2c11d1ce8@collabora.com>
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

On Tue, Sep 15, 2026 at 03:49:51PM +0200, Sebastian Reichel wrote:
> If devm_clk_bulk_get_all() returns -EPROBE_DEFER, it is replaced with
> -ENODEV, permanently failing the driver probe instead of allowing it to
> defer. Avoid masking the error code to fix the issue.
> 
> This effectively drops returning -ENODEV in case no clocks are being
> described in DT. This special case will now be handled by the follow-up
> check searching for "refclk" and exit with -EINVAL.
> 
> None of this will be hit in practice, since the driver is only used by
> RK3588 and RK3576 - on these platforms the DT is validated to contain
> the clocks and the clock driver is force probed early. Thus there is
> no need to backport this.
> 
> Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.kernel.org/
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

