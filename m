Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26F5C9831E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 03:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xBq0wqS8ZLPavDCOyvU1lYPGX/xfQxgO7HPGHAPjgcI=; b=mtYYraAqngSj6XxY1Y5R0UB/E3
	zdM6579hC6k72hPlCGdPdqrtnse1sye/KhWCuGfGu3CJ5kerFANF/UkJd+h0AmPO/0F3cIPln3Wik
	pmCYe9CAFO35Wwme2vltzyvy9ZF7nYDFMnlU68wJf6RZRohAI9CLKBC0/qVjvSfo3kVH+oNL2B8W/
	xFPrrL6kivqeCTwSIojhRdMkBq9mM0QjrN0PFILMqcF9QzDIRJJRCRGOApK0cXLbfc2E6sudUSzmu
	fh0vxjFr5KyBA1eQDAzlyCRQwe1O/Z0YxyKANiXwbSR14VjfxEyYjWcjsPW0+ys1SWMqUqDpy/Ida
	EeLeCryw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJ9v-0000000EuWw-34st;
	Sat, 26 Sep 2026 03:33:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJ9t-0000000EuWN-1bY9;
	Sat, 26 Sep 2026 03:33:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C1388424AD;
	Sat, 26 Sep 2026 03:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B8821F000FF;
	Sat, 26 Sep 2026 03:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790393584;
	bh=xBq0wqS8ZLPavDCOyvU1lYPGX/xfQxgO7HPGHAPjgcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MQuT/BjpuMRR8WZUmnI1eSoCv4GzAzAxru3zpCWCe69TcZwZLABAurhbK0B+eXlTt
	 27BYP7L3jvDgZ81ZDbgiS7bgjaNuV3TKANREe+B9HXka3inU2OPnTAksQGq8FvsJqy
	 y26kClKs6fySMLvAq3/+UKYmRXVJ+hxiqBVlQFCm5uNzDfSNPv2C1+NzvEpTsRK/12
	 pkzCm37Ey8SIDxgNnFvgvaJeWxaasfn69g/LviacM1v+rW/EDtw9aX2qdWFdBxhBGY
	 XUrJbo371T+EsKNjJYY7etEKwCtvZNaX4bRlFtjvQ+B38LNg5YmZqIAxxAr5Qrux02
	 YMkY+Wn74m3zw==
Date: Sat, 26 Sep 2026 05:32:46 +0200
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
Subject: Re: [PATCH v15 05/16] phy: rockchip: usbdp: Handle missing
 clock-names DT property gracefully
Message-ID: <pfqtqhvssmsxd23n5i3hps5nimqaqe7y65lakzmm2tc26lxc5o@zd2tvlp7vyuu>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-5-80e2c11d1ce8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-5-80e2c11d1ce8@collabora.com>
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

On Tue, Sep 15, 2026 at 03:49:52PM +0200, Sebastian Reichel wrote:
> The rk_udphy_clk_init() function would currently try to do a strncmp for
> a NULL pointer, if DT specifies 'clocks' property, but no 'clock-names'
> property. Fix this by making sure the clock has an id string set.
> 
> Note that DT binding requires setting clock-names, so this is only a
> problem when booting a non-compliant device tree.
> 
> Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/message/20260619154349.071321F000E9%40smtp.kernel.org
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

