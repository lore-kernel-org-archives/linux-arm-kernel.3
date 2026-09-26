Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD47C98318
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 05:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V4Uv0cSAB9UTyUWue5M6jsVbXMzQgfUfM+GObQtw8C0=; b=GqB15/jMWfcwQrSxiNY0fpI4ES
	K9hAoml9Jdi1C218n7H063KL8FpqiRQVTwq5KlaMOAFioAUfZdoClJAwVxQ53V3TqD2G9cwj5VihP
	+vUmmlYDx/p5m6yvEtGWw21ruoy7jn9HUc10Hy4hBmoA96NBXClnelTm4s1EqH6obtNMATeWGCk34
	XsF530DfI2JUp+gJZbpKf17EOehKas601Uh4Q3YxRXIhACKr9jq1sdwOV8GYFG8ZhzTsqy3spsuba
	G2jfCe8ffXmCz5R/rzoR3QQC8cyy5b8AOwr9woYK8e6ufMEUzRjl++w2A+dN8HcAf0RTq/CsSeEN3
	2D+6Suuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAKry-0000000F16a-3hLT;
	Sat, 26 Sep 2026 05:22:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAKrx-0000000F16O-2fTS;
	Sat, 26 Sep 2026 05:22:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0BCAA4399E;
	Sat, 26 Sep 2026 05:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C8641F000FF;
	Sat, 26 Sep 2026 05:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790400160;
	bh=V4Uv0cSAB9UTyUWue5M6jsVbXMzQgfUfM+GObQtw8C0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XhJmakD9rdsQmnm2CWbG95Z1z+2qjKqCcKx2EuRXqj7artFwYutKt3vY76nBQy/RH
	 2ZYGPuLKIJwD1ztMY33CK8jaGOnp4mvkBim/qKPUikGi/8M8JQVmVe2APgskOeBq5u
	 QspDVa/+mJfO6zMLbMBnti9g2bYxgQGR+GzzP2Z2Zyj6gw0s1Pmag/LUF78d1TunxV
	 Fy3OerQv5i11q4tJtFSnEcX5yJLofso5MoSZ0zuD+865mtSMSzG08CxkmgyCMGQpHL
	 0UydsJ/OI2IuBiQfAbTY4qVYOL2vXV7Gue7UmXi9VluCxFhcUwtasoerSncszCy0Ks
	 gGGP/DxO5/GBA==
Date: Sat, 26 Sep 2026 07:22:23 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 09/11] phy: rockchip: usbdp: Avoid xHCI SErrors
Message-ID: <ystdx2e7no6pepijitdwpqopt2k2lm7ubawzko6o2fr52oqzwk@qqaqsnrgrag3>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
 <20260915-rockchip-usbdp-cleanup-part2-v15-9-8d507cb1174f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-9-8d507cb1174f@collabora.com>
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

On Tue, Sep 15, 2026 at 05:06:12PM +0200, Sebastian Reichel wrote:
> The USBDP PHY provides the PIPE clock to the USB3 controller, which
> means the PHY must be fully running when anything tries to access
> the xHCI registers.
> 
> When switching between USB3-only, USB3 + DP and DP-only mode, the
> PHY must be re-initialized resulting in a short period of the PHY
> being disabled. If the DWC3 driver decides to access the xHCI at
> this point the system will fail with an SError.
> 
> This patch avoids the problems by disabling the USB3 port before
> re-initializing it. This does a couple of things:
> 
> - forces phystatus to 0 from GRF (not from PHY)
> - switches PIPE clock source from PHY to UTMI (safe fallback clock)
> - num_u3_port=0
> 
> The last part will be ignored, as DWC3 already probed, but the
> clock re-routing will avoid the SError. There is a small delay
> afterwards to make sure the mux happened. The datasheet gives
> no hints how long it takes, so delay time is a guess.
> 
> Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

