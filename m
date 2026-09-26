Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC9DC98318
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 07:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5Ve5aCU1EyBV0r6rgDy9orC+fjCn3d6sZyhy9CDc68=; b=koyY9PT6Vm1KTIdA4cYh5ZfyAY
	4m0JxhQ71T8VKeyhFKHQrzQsuaFaWIxVqSp5QtyRL8q/B/fpOkMK9TxVmmoyvBhqwQGAk3n4sxt3F
	asfhPYQHQxJqgf8h1f3HnDUQWZT2pW7854psLmlxuAnTmkKOmzfNvyL8TZz4GWlB8WXAMkb25UMtn
	TVEpxiHh7kvsd0Tuvt5qWPNV+ABMYj71fhgL7v5/RohQeHbMa2pRWyxgBGrh+8jDQdUt4srQQtDnv
	Q8sE4xjuzxGFI26yu8gCSSzVmqcAgdKey+wBc7+NAHFgW0HH+Z9BBdnZdqIdOSHTjHQ5koTLFIpLE
	XNmxpujA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xANGV-0000000F8SN-2ucm;
	Sat, 26 Sep 2026 07:56:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xANGT-0000000F8S3-3uxk;
	Sat, 26 Sep 2026 07:56:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B5476601E4;
	Sat, 26 Sep 2026 07:56:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 987901F000FF;
	Sat, 26 Sep 2026 07:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790409368;
	bh=W5Ve5aCU1EyBV0r6rgDy9orC+fjCn3d6sZyhy9CDc68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EhiaLJ3nFsoq3nc2vNaeQvVblpK3bFt6jiLyUMEyrNrbuCG741Ku24JsSmxLU5QTa
	 iFz+lnTKL+GPxm7OJkO5ZgxPsca1k5YYRfZIrFLvXM3guAH+yGxkrv0hjONQmGsO2e
	 9qhE7R/0eL2W1wvmDc7nMN26vLShPTrRhqwbDx4Te9+PUfkmQqATQFnqfeDgziNv0v
	 j+dCmgpN+hpGwDAH9z9D3C+7tXjROEHlfv8wgGJLTsc8KuK9VbvE9Jw0NnwURoCnVR
	 u9nyBA+4fLG/f6kIujQavFbhsdR0BI3MxWaAA52TmnEqvFr1f4o7WIPQ6ZZ23g3fjb
	 ws87FBothKG0A==
Date: Sat, 26 Sep 2026 09:55:50 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 2/6] phy: rockchip: usbdp: Drop -EPROBE_DEFER hack
Message-ID: <5ajj34ec2wuvlxw3o5zpfbgzea5wzeq44xqhdxcu3aln2zdn2e@extxpxbzoqgz>
References: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-0-9ad90a456953@collabora.com>
 <20260915-b4-rockchip-usbdp-cleanup-part3-v15-2-9ad90a456953@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-2-9ad90a456953@collabora.com>
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

On Tue, Sep 15, 2026 at 05:32:49PM +0200, Sebastian Reichel wrote:
> The hack to return -EPROBE_DEFER when the lcpll lock timeouts is no
> longer needed. The driver now does a reset during its PHY init, which
> avoids the problem.
> 
> Since rk_udphy_status_check() is called after the probe, it should not
> return -EPROBE_DEFER.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

