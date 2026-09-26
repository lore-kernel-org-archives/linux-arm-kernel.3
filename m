Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8234EC98318
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 04:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVg6kyIA3oQ5VRc7uY2GimtumPTbXkZayceo4DWR9Zc=; b=VkBUiBhFbNevOJvcVzT1foKfUL
	c3Rk+cR0XrfEaXcUgqhFvWq0DMHWYEk6bavKLxtM0IpjTPf6lku7YWzTZdOL2PRZ+RMMH4mt21PT7
	mbNURufMBYMk7B9yjVWnGUCOfcP2wDqh4Ab6EwdHIadDD2WT6ZsxiyjLWqucYNQPq1asrgCAKtkk9
	fAEEi0KGn2sJHX/SCBDtr9rHa2GrUoP5b1iKkRxNyHccUFi90tjsa798gYi18t19oqvkJA5TojO7W
	v0rRcTcVwwunzkTom3eHYfGqro0bmOyQWTVFstPMIo8091TvNhWOP3FeCZkAXQQv6R8VQQH2iQ7HV
	L1JXwOEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJuN-0000000Ewfn-2oQ0;
	Sat, 26 Sep 2026 04:21:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJuM-0000000EwfZ-0kD6;
	Sat, 26 Sep 2026 04:21:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 84132436EE;
	Sat, 26 Sep 2026 04:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA5511F000FF;
	Sat, 26 Sep 2026 04:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790396465;
	bh=zVg6kyIA3oQ5VRc7uY2GimtumPTbXkZayceo4DWR9Zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oY+D7toNMIjgUTAssuya5MlJM155tCtb/vLMkULL9ubASUSrNz1w/xoHlDMDxDiH8
	 oGddMEDod89gxU+ErfMzAD7B4BpHbhrWw7hv68N2pbHWQM7cyYBdXRSfXJy0mydK9G
	 BiIOsiCt/QnCO3F8UXkqJVrERvaEbHybqrv+ddKbjsOG4FWRzGzwmystZcTAla7ggm
	 hp0px1SVdqPZxNfh+M+3VFBc0P/g+lsD4Y7X9hWVmGbqvS3JWWpNXRqEAE4tEPxQbc
	 46bWOl8zlmOSdtKtfOf0/DORSJgB9KtuMNkDFeIH0eBp5FUeGYAlUFAlsJQMj5jYc2
	 CRhfJ9lVNQ3XA==
Date: Sat, 26 Sep 2026 06:20:50 +0200
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
	devicetree@vger.kernel.org
Subject: Re: [PATCH v15 15/16] phy: rockchip: usbdp: Cleanup DP lane
 selection function
Message-ID: <udkvgo2hdwnynae7fndztk56k7cxb2xt7onbqbe7qtti3qzqw3@y5hzgs6g4dvr>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-15-80e2c11d1ce8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-15-80e2c11d1ce8@collabora.com>
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

On Tue, Sep 15, 2026 at 03:50:02PM +0200, Sebastian Reichel wrote:
> Use FIELD_PREP_WM16() helpers to simplify the DP lane selection
> logic.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

