Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA09C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 03:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wiIuEcxJHxHcC9qQ4G2FrJQ6QHq9Q5CgIOwL5I1TyD8=; b=LWfOUTwtuqJu7zekGcsmY+4Zgn
	N33PWVeXjbStvme1jegsnNkkLtAZjbDxkWdVc5Ryz+Y8TgqQLo/0jjcO3RITU45kxuYZGmJDdQS1F
	esNcyhaaf/DjcPkGs701W36HyZS2gnglkiETatxtP2NBhrFp2b0hVjqMJuK1nT25NRrrE579cunOX
	vIRvHAfiq3/dlsuNFdnWLujCJjrSyjlWw88tycWjx/6KgAK8lI6QC1+cNDr7KXM+X2riWNur6TE1G
	v0Yz8CoLIUoJV+iifQpo9QoQchpEwt7eaNU+JxwQWwK6xTN8WqZZEL0QTvJFYQOwyoyib+1MvJU/v
	RBrRm72w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJ5Z-0000000EtwR-0Upc;
	Sat, 26 Sep 2026 03:28:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJ5X-0000000EtwC-154Y;
	Sat, 26 Sep 2026 03:28:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B6FE4429B;
	Sat, 26 Sep 2026 03:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F851F000FF;
	Sat, 26 Sep 2026 03:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790393314;
	bh=wiIuEcxJHxHcC9qQ4G2FrJQ6QHq9Q5CgIOwL5I1TyD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CDw4uRxsgwF6gEQnfAe/EPbjMXGNFyCujdlTCYvYSZo6bF6iJTsr3KTLRm4X5QLtu
	 4YY/gwk1uBiSHECVcWJAdHbENyN7OLh+3/wamTzLJy9Clsfi35StQbrBM5zxtS/J59
	 nyBaePuHyAJkhslRtnoSrF88aGZXZszpiMZGCntuerIAtGTRk1E3ntJfwv3oIRTVj3
	 ad0ORYDu4S54XwnGKajN4nJXe0Mk2WGKONjTjeXvTRwq/ECEcE5WSxtZ9Nbc65ZHKl
	 CQ14xNWBbZnI/DfOyTqw5tk9ojxOGrrc4y/YFW+Qr0aQtEzsj9sl2WjlL7JU7RFXXz
	 9ysjv96UtnmjA==
Date: Sat, 26 Sep 2026 05:28:18 +0200
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
Subject: Re: [PATCH v15 03/16] phy: rockchip: usbdp: Do not lose USB3 PHY
 status
Message-ID: <yriwlzd7fiolepmi2rkdgdis5bk634biomttmdwdxiqcdgv5g4@ps3efdu6q5pe>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-3-80e2c11d1ce8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-3-80e2c11d1ce8@collabora.com>
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

On Tue, Sep 15, 2026 at 03:49:50PM +0200, Sebastian Reichel wrote:
> By default (i.e. without manually enabling runtime PM) DWC3 requests the
> USB3 PHY once and keeps it enabled all the time. When DisplayPort is
> being requested later on, a mode change is needed. This re-initializes
> the PHY. During re-initialization the status variable has incorrectly
> been cleared, which means the tracking information for USB3 is lost.
> 
> This is not an immediate problem, since the DP side keeps the PHY
> enabled. But once DP is toggled off, the whole PHY will be disabled.
> This is a problem, because the USB side still needs it powered.
> 
> Fix things by not clearing the status flags.
> 
> Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

