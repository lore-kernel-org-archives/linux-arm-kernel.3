Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA49DC98328
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 08:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QK32ylyDoH0zAV4vwyAyLOZNTmoVdUY+VttMWRrH5ew=; b=CuC4e1NE+LRSS1pozZmSOPjQ+U
	nWSuieBgrJpypiFe3CyTEAspQWqx7iPZAP4Qq5XkPlPnNRsja31okigAZyKyp/xWy7W0u5VCFQclp
	iKfPpD8pCy50x1eJSjtr0Vo1uC5wlWjoH4vDNMxi9V6V1SFMZV62Z1pCepmN+o+ZKMI/fmzFiw60I
	yxGvGxMmw8sVIUJeL0xZamoqYnaWVZa9uvDXEbMvQyh785kLC7HWWBQxtvJEopB1m1udl2dXW8aTl
	lWkV2lPTrDdE02ZTJpC/7rEmfMmPYZuvdbdTSNcdJGYfhebPoZ2Jbpqx4spzQCC0U53fhQLBhMQyw
	C9LcEQNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xANLE-0000000F91L-3Sj8;
	Sat, 26 Sep 2026 08:01:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xANLD-0000000F913-2x6j;
	Sat, 26 Sep 2026 08:01:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2EC6D601E4;
	Sat, 26 Sep 2026 08:01:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B771F000FF;
	Sat, 26 Sep 2026 08:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790409661;
	bh=QK32ylyDoH0zAV4vwyAyLOZNTmoVdUY+VttMWRrH5ew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jBH2GJ7TlAbuheZ6f41Ha5r5OuPJBAKdtbR7zFb51DfgxlYVjB+KOTXLoN+MIeSGa
	 A6oM80uvpfX+5F/Ct9kLzOyoHcQ5skBmxCMBj4uiyG1Zi+CyJYmGKTnpHhXvy1o9NJ
	 H1+ji0PTns1m+JixHXGSiXWoktZmnYZTDxCbm1ExkZK73vwhghEt/D89Vl1FOuWSa+
	 kNM1XVhXB7XTSL7zchwmJOkJcDw4getq2OkP7DCdBUTpDLyzukur3cnJLjVfse5/2l
	 qRHydKSXcoG0luBEDAacKNRW5qUpFlr3BXxa9qczM0sRqYbKwFTZHYzvNgMZ0A1Jrt
	 TPSUB5wC0lqMA==
Date: Sat, 26 Sep 2026 10:00:47 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 5/6] phy: rockchip: usbdp: Re-init PHY on mux change
Message-ID: <j4mqvu3tjzcjb2ghnwhwiyaf3qjdmwqvqtcary5tm4ni3dhbyk@yvqphx5drlmc>
References: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-0-9ad90a456953@collabora.com>
 <20260915-b4-rockchip-usbdp-cleanup-part3-v15-5-9ad90a456953@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-5-9ad90a456953@collabora.com>
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

On Tue, Sep 15, 2026 at 05:32:52PM +0200, Sebastian Reichel wrote:
> Ensure that the right part of the PHY are powered up when the
> mode changes. This ensures the PHY is re-initialized in the
> following two scenarios, which are currently broken:
> 
>  - cable orientation changes without DP being involved
>  - switching from DP-only into a mode with USB support
> 
> Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

