Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2DAC98328
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 07:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f58KgYFLlHqoxRMag1PJ40k7YF7iSwH7HFuc7gT+hfk=; b=dGvJ6WOc46Se17N6jFlQYBDPqy
	8CYESguVo0EHHQA2uANznW9U4QeXxjzY37bewhQT6kzBbMe3bZiPic0AJP77rm92BgwQb1SZNTkwd
	NCoDtSN31hTOrEGrgJw+ekccvzSXKPrfaG0w/2Ly6H8G25OZ2d4PncMlRxcojlhAXZWiwMpAfDo8A
	lxE2FDu81+MB3IvjUdDzbLaRvpsWH86/rldK2EeSoBri7ptgq3Oivy5m9NtG93wAzzqSRMi6pc05P
	3FfOLLPdPzJGJQab5VuFmIW6pDT8DhyjcrBScgYQWW1f2bIQqcP11Pg/C8HAsQLBi9+7TiexwF+H8
	/FdZQJMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAN8s-0000000F7p2-2OMs;
	Sat, 26 Sep 2026 07:48:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAN8q-0000000F7oE-3XSn;
	Sat, 26 Sep 2026 07:48:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E9EBB4013E;
	Sat, 26 Sep 2026 07:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7181F000FF;
	Sat, 26 Sep 2026 07:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790408895;
	bh=f58KgYFLlHqoxRMag1PJ40k7YF7iSwH7HFuc7gT+hfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BKZetOO5Se/CsuiAwVlykgedBosV+jhO0fcjH5fordh3MW+rTaXLVa+hCYaR5CYdg
	 hNK9gwYNvby1aO4zSigICnezRuuf18KGLuFC00fNPoErFQK/mEakb3foqWYssSSxPC
	 RRj4w5kd/+I5mO1hGbT40Tw6RQ4uKSpRw2MRmSUZIpSxAu2mjI/JB7Hbz5LQheI3oJ
	 D0VRSxIgZg33Ftmkxtwv6IoXZp1RTf/I8MwkVww5m8vIpTGg4GeUfvkecpnevNlvWk
	 lePo7TbNcx1B1ZPU2DKlvYj+NCD7n7PxAOOHW9l/vI2RGMEfZAVuBK2x9esZrOUDOZ
	 cbRnMfh7bNOQA==
Date: Sat, 26 Sep 2026 09:47:58 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Igor Paunovic <royalnet026@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v16 1/6] phy: core: add notifier infrastructure
Message-ID: <vntwi7qi7eok6pryljuryex4jy7qajpidwpzcqavs25deso7kj@eafhk333wtev>
References: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com>
 <20260924-b4-rockchip-dwc3-rockchip-glue-v16-1-126a2e9133c3@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-1-126a2e9133c3@collabora.com>
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

On Thu, Sep 24, 2026 at 07:25:37PM +0200, Sebastian Reichel wrote:
> Some PHY devices with multiple ports (e.g. USB3 and DP) require a reset
> if the configuration changes or cable orientation changes. This is a
> problem, as the consumer device will run into undefined behavior.
> 
> With the new PHY notifier API introduced in this patch, the consumer
> driver can hook into reset events coming from a PHY device to handle the
> PHY going down gracefully.
> 
> Note that this uses -ENOSYS instead of the more sensible -ENOTSUP for
> the stub functions when GENERIC_PHY is disabled to stay consistent with
> the existing ones.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

