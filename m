Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E48C98318
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 05:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfX+s/Rj3EZVwKgY0T/HU2G6C2z+npd4jy7BQreJ1TI=; b=3G5TYhfclBq5ql837pryWLdoWt
	+WbRLRP4a4UnqbMOfGY/E8VBOBpMoHJKRiJvOPM+15xxlLYmjzcxCixrXVz3wQpHGnlwUJ04N1BaL
	RXZGBUWp3jt2XXNWtV38vq/FY3fBR0MCmz04UjEvym27oJklANiqhP0Z0Fs2wbHcDo+4IdrcdZK9U
	AZ5lccmZ8ujVCS2Zr7nAntP47oun6PzGQ2rkRXnN+5NEJpLSSFpnnoFpPixvWM73/clkiIPkz/1Q8
	tFEgHwjuvqxIjCJl4HJ7KFgG0M32QFAnMkrmkapXWGF3v4Wgd8YRr0Rd9RVZI8D0OZJUrVH4rAEkO
	cEuy5aig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAKm1-0000000F0ZK-2brJ;
	Sat, 26 Sep 2026 05:16:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAKm0-0000000F0Z5-1dbY;
	Sat, 26 Sep 2026 05:16:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0ACB143793;
	Sat, 26 Sep 2026 05:16:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBE611F000FF;
	Sat, 26 Sep 2026 05:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790399791;
	bh=JfX+s/Rj3EZVwKgY0T/HU2G6C2z+npd4jy7BQreJ1TI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BbapK8RGn0VbM0QdxOR9zO1pX18IO//gqzZRxcJ533Wjs0mhq9ACOMSYmN9oIbv0o
	 +HRyCBZsVLJiuiBNdSVMUbTAJG7gEG95T/aQYENdbnpSCgyobsd7ra7zLu58r54rC9
	 t8iW0xiX65uvkwVx8Jsuk85KPKw4EA7ND3aUKld2NOhpLkF9i8iA8aTfQE1qgk+q6p
	 Eyz7q8XOWXhZoSZxqsYhQ2Ba+wYQosrkTr9k2k8mKroGg7VhMOzDGhkzQBfcWmZ0hp
	 KeaGBVSy+k1oTVuvCaRhOsFLEBZRN27zKC1EQPDHOWJs3CAjOowj25sfP/tap6wjYX
	 wMeRdRn4CRwMA==
Date: Sat, 26 Sep 2026 07:16:13 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 07/11] phy: rockchip: usbdp: Hold mutex in DP PHY
 configure
Message-ID: <2pgdtb5su76q36vqrqp4as3cbejhr7heiqcp4e7d4gjug3lvm4@xyyvwcn5jhn5>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
 <20260915-rockchip-usbdp-cleanup-part2-v15-7-8d507cb1174f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-7-8d507cb1174f@collabora.com>
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

On Tue, Sep 15, 2026 at 05:06:10PM +0200, Sebastian Reichel wrote:
> rk_udphy_dp_phy_configure() accesses some variables from the struct
> rk_udphy, which are updated independently from the USB-C framework.
> 
> The USB-C mux/orientation switch functions already hold a mutex to
> ensure mutual exclusive access to the struct rk_udphy states, so
> simply hold the same one in the DP PHY configuration function.
> 
> Reproducing problems due to this on real hardware would be really hard,
> but could be possible when quickly re-connecting the USB-C connector.
> 
> Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/linux-phy/20260612164627.23D391F000E9@smtp.kernel.org/
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

