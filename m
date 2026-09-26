Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929E2C9831E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 05:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XLu4w3tZoE/U6Lmgmazw/7zuFC7EGlznuS3/yeMf4oQ=; b=YV5Yc+JhFuEmfLfEnx/Einynzb
	QtoE54Tl83OdUj16r0uwee4Uz/iLIpro/0RWZ7pKUMTLb8m0jpD1KEZKb1m1zTMKwyDbZ/vqJBOtZ
	beK8zbwuV79H3CC8eOYxvqMIEdUoTXBqaYyM5quu0HLaEPbpsQlRMkDvbNooxfYOtGotpnHNLXLAS
	xJWAi0FfLsGi4v1GGugTI0wZdb+dB7/OyUBOIM/8MBbl4jpCmSeup9+Y1RiKzhq5YomiCnVJQSUR6
	w44Wu+XJSnOvoZCew/tfo10t4BYAquCklQm6HNU753j6uGe8nrDD/q55Gnaf3Ph4xKRiz1waGMojz
	luDbUEew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAKht-0000000F0BO-2cqH;
	Sat, 26 Sep 2026 05:12:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAKhr-0000000F0B8-3PaN;
	Sat, 26 Sep 2026 05:12:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D0AFE6022B;
	Sat, 26 Sep 2026 05:12:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBFE81F00893;
	Sat, 26 Sep 2026 05:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790399534;
	bh=XLu4w3tZoE/U6Lmgmazw/7zuFC7EGlznuS3/yeMf4oQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hw8ZU1D6Yml8tToKjBbk2tq8mT0UgHz/H945Zovmg6ktDWcfJBuV5X9yITN4Gh4tQ
	 HcxSEH1SoEwftLJZjyKTibqObyvPEdUmtXbuRLlvOr05XK8FNnVi1jU4et0yOYsX26
	 n2YnwFgQMu8aq46p4lbRDppXEUFsdAMGVhic2BqoTSXUWoQkKy34wuIukcvoKjBy58
	 7DkvVWIp3Hmp3eZwA7fyh9hWkGPniae2e3cFLLVB1z/yZd9aXMSnQZDtKTdt42h6Sj
	 Ot903xI8WqUwmXo4GHXm92Z456W+5P+WIWgZWYW2vIbW4dybqcJMnBLASxT0KTKjAS
	 VhgvNDFY5aDnw==
Date: Sat, 26 Sep 2026 07:11:54 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 05/11] phy: rockchip: usbdp: Properly handle
 TYPEC_STATE_SAFE and TYPEC_STATE_USB
Message-ID: <jly6x4dqrd4gr24oo5d37b3nx6xizuu35bd4thh7vjcprqomjv@lf7mc5dpmeyc>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
 <20260915-rockchip-usbdp-cleanup-part2-v15-5-8d507cb1174f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-5-8d507cb1174f@collabora.com>
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

On Tue, Sep 15, 2026 at 05:06:08PM +0200, Sebastian Reichel wrote:
> Handle TYPEC_STATE_SAFE and TYPEC_STATE_USB Type-C state events,
> so that the muxing is properly updated when exiting DP AltMode.
> 
> Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/message/20260619155020.CC7361F000E9%40smtp.kernel.org
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

