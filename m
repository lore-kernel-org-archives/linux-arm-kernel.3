Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D13C79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sm+VRBme+F4AuNb+2Kn1vUGzPGQfC4nUbsqtHhdSZ/E=; b=OcMePRGYtg7CxAdTT7d+rtItVi
	dX4Ze1XJxrp8Dngf7mHx/DzTCGKDHAxz6gJb7WsVyQZcjZwNYSRgxvGBFqhuTKxi8C8DBs+ItUgLy
	CosGL/m03CACQR738pDxDtXWpj3VSMcmDJkkaQ9nYifGoc8wd8hJggpwdjuAg6AFU7TCIcYXNK3WW
	TMogIMHbdBCyUJRJpeD9wURG6b+VM2Ogjc9Ysq42PjI9LevoDgLOkkQoeh8g7Em8cEu0/p+xWQQMJ
	IEA5Eh/QLdDpFRgzv/4BfPTiMxS/xEJZVnp21lUQfYwjQ8kfzYxoiW33Hi04mqNbAqo8lM5VU2Nvs
	sujcR5SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DKT-0000000B3hG-2uBv;
	Wed, 09 Sep 2026 08:06:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DKS-0000000B3gn-3elV;
	Wed, 09 Sep 2026 08:06:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C592416FC;
	Wed,  9 Sep 2026 08:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C13751F00A3A;
	Wed,  9 Sep 2026 08:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788941208;
	bh=Sm+VRBme+F4AuNb+2Kn1vUGzPGQfC4nUbsqtHhdSZ/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aQtPW4G32f4EnPI9Vax3cgfcFE+MuZgnZC4DiQ4fx16mqMnDsJUFzr0acgxVCZ9Tg
	 kDYW/dh5hFmWpcwX49VXFahtF/7ob+nthDqJM2KzhswsVSROq2cJ9gJqhEySyobGgu
	 nEJNz+vrr0su31LpGOPw+jfrGj2m0jp+fVYbEteNWZpDxSYsU+XrskFhslBZ2G4TjL
	 TyChczVlZXeVT4V+kW+H/ZoC5NNjc+G5MyWwJnJXikluq6S03k59k/eZbh9VYfLK1x
	 wLt0aZ2cUsaKrM1YgH6uDyJse13E7ROAdyhc7G656AspLEJoojTEcp1fS/jewgOU1b
	 sLHfLq2ijPjdA==
Date: Wed, 9 Sep 2026 10:06:39 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Pritam Manohar Sutar <pritam.sutar@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Johan Hovold <johan@kernel.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: samsung: usbdrd: propagate GS101 PIPE3 lock failures
Message-ID: <nfz2nsasfgf5ob4zqrs7aywwct2lbcnri4ltel42iebwu27piw@zyb3u3rhaph2>
References: <20260623135349.42739-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260623135349.42739-1-pengpeng@iscas.ac.cn>
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

On Tue, Jun 23, 2026 at 09:53:49PM +0800, Pengpeng Hou wrote:
> The GS101 PIPE3 initialization checks the PMA PLL lock and then checks
> the CDR lock. The PLL helper returns an error, but the GS101 PIPE3 init
> path dropped that result. The CDR helper only logged a timeout. PHY
> initialization could therefore still return success after either the PLL
> or the selected receive lane had not locked.
> 
> Make the in-file SoC-specific phy_init hook return an int so helpers
> with real failure results can propagate them through the existing PHY
> init paths. Keep the register-only helpers returning success and use the
> new return path to report the GS101 CDR wait failure. Other SoC helper
> paths keep their previous success behavior.
> 
> Fixes: 32267c29bc7d ("phy: exynos5-usbdrd: support Exynos USBDRD 3.1 combo phy (HS & SS)")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

