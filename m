Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EA5C79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sm+VRBme+F4AuNb+2Kn1vUGzPGQfC4nUbsqtHhdSZ/E=; b=0DHOeSqpcCdBg2E1s5YKVKfuDt
	KzqMtEHeAEswvxFOk6lmOzp3LgM8n5RUQuX/rBGK2yBvg0ZZ+UfdI+eI687lJuIvaYVoXi3Zkyvjq
	Lt3kOQKEFCnqHAv7l6B90RPeG0xJEnvJSytKaG7Ayza8fUTi/DuO6+LbLTwCBax1Se0BKg/jDkYZW
	thjDvNo9z5n4tkdUrFzD2ntmkBnqhZwReb+A8Xm86mndgDUrHdPZAW9bPPqcVKN30N12Y28QEScTV
	NaoA7Iu3WIpcpYNF5BO5C+iGyVTXhp+PpPQ9GvGrXuzW1gvgZkkCnmFLWwTbcQmK7LaP+hP7kR+py
	jV0qj7Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DNA-0000000B4Df-1ynW;
	Wed, 09 Sep 2026 08:09:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DN9-0000000B4DK-0ykG;
	Wed, 09 Sep 2026 08:09:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7AD9D601FD;
	Wed,  9 Sep 2026 08:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 950721F00A3A;
	Wed,  9 Sep 2026 08:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788941374;
	bh=Sm+VRBme+F4AuNb+2Kn1vUGzPGQfC4nUbsqtHhdSZ/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QhsnwWMJCrZct8Q2pdFFjenhpYM7e6e9TH976YqW3/MOEg74s0ZVEsG5yHxNY5Uqr
	 fgnU3An42MDdrqfIpp20LvljYyzaX92a81GuHhY32pMCR9j+2Cc3/EZwWElpXDBZXC
	 LHW7//sFoGziJMYR/tfrnRZHtYczuOG+c4qAHVD/aWdaFlHf50DaVTKdth3dNYHZsH
	 1nRlagNSRHCxRGK3pja+9McUw4n+p3NccxfYHcVoUmOciAw9zvi70ohaVZ849jn5XB
	 muM/kMDc7d9B7nFYzHZa9Mx/fPoDr3DgBqoyn5cY5rtCJBpW2afGhiScstwAht4yzN
	 n+dI15ddVTlrA==
Date: Wed, 9 Sep 2026 10:09:25 +0200
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
Message-ID: <jgkyhjlex746xmqgr6vwxihfkzjmtvhsvrzk5ovud7zrc2bqo5@xwdlrrmdrkx6>
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

