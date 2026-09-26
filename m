Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0108AC98328
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 05:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qA9qIAMmCjARz40JpTVfVIYnp5V1ZghuG0xkDAvl1gk=; b=OwPkTMpGDVuQPGKpM7lAXGPL5p
	j8VnReU39xAlvxM5bDekRZLxQxugeuqLTwfSVOhqIMx1y95VveSg6fcNjFC/CmJLbcSsBiCmo5EEX
	BS5wwCiH0VEMiONAk5GHUSAZtN58dheOpTg3N0xL6vtMHUgWqoQrA6eR+dB6HeJqqNxXuuWzJIaY0
	2ueGJyoo1/VTmoUm1JKS3iRofdK0Z9OUdVLCM11FfNibrc2h5DRwtqommVpFaP2Q84wuoyGVfQxdF
	alCajRv5OiEGtT4qy+DDuUblP6vaS70fCOPJWSCBEGPx+qxE3SNm489LShBDXJDfmI3QfEPSpaluC
	hPHILJAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAKch-0000000EzOi-1hVu;
	Sat, 26 Sep 2026 05:06:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAKcg-0000000EzOT-167p;
	Sat, 26 Sep 2026 05:06:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DB9A360136;
	Sat, 26 Sep 2026 05:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EBF11F000FF;
	Sat, 26 Sep 2026 05:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790399212;
	bh=qA9qIAMmCjARz40JpTVfVIYnp5V1ZghuG0xkDAvl1gk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dQxII6A84G7BX1W95dZr8YSk/GpL9r3wOZ0CJCl6ye1NEVUs+nFWEeU8pl4/WCzDI
	 g/HMSZOXWcJa6a8SgyVV143dtZEH/KRK76UYLioRIb+fWpLG5dD5wBj8ps/F1yaepO
	 uk5A0UjeL0hDGnT086DfmQzQJuhHk8FYMxzJsYOjFjKZnoYxFH4sqLpV4EJQIbmN88
	 yU9U/GZlnwyFWYL+mBfrSatlNKFH0DuxxsD8HoJyM0H5j0mvC4damy9VmNIlPAvufA
	 2Rb32EKwNFTvrK8Piv3gu/uR3LBgIwzhGsyP5XFR9EOtCR4ZmEe9opH5XG7s9IEO2T
	 rGBQoqJSRGL2A==
Date: Sat, 26 Sep 2026 07:06:33 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 01/11] phy: rockchip: usbdp: Drop DP HPD handling
Message-ID: <tvoejocogt3s5fle4lm2cmlattki7nuzbyl7wzrfnvyn7etqa7@ltfhc3qvjmgt>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
 <20260915-rockchip-usbdp-cleanup-part2-v15-1-8d507cb1174f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-1-8d507cb1174f@collabora.com>
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

On Tue, Sep 15, 2026 at 05:06:04PM +0200, Sebastian Reichel wrote:
> Drop the HPD handling logic from the USBDP PHY. The registers involved
> require the display controller power domain being enabled and thus the
> HPD signal should be handled by the displayport controller itself.
> Apart from that the HPD handling as it is done here is incorrect and
> misses hotplug events happening after the USB-C connector (e.g. when
> a USB-C to HDMI adapter is involved and the HDMI cable is replugged).
> 
> Proper USB-C DP HPD support requires some restructuring of the DP
> controller driver, which will happen independent of this patch. The
> mainline kernel does not yet support USB-C DP AltMode on RK3588 and
> RK3576, so it is fine to drop this code without adding the counterpart
> in the DRM in an atomic change.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

