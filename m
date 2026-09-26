Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C09C98318
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 07:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ZjpK0JF2cbHk95sp5z75srSxbkoRMjDiFL2rI+O++w=; b=h9YEW/qhovIDScSVIViHfFpctX
	IsJt1g7CLEiJHPhHutC14eHkwXjLcI1L/HqK28loQeTN0rieTQbhHsTops2Xu2txrbZXKcR9u2E2m
	3e95QNYPzdpUEITH2rou+FhZZ/EmmDxrlA2xj4jKZjhXcQ/HcN1qVsLgtTHDMKJ5v6cBWwqpDSo5k
	elwARri6W/VE+cvfAzal0LRJoPRXKfae/SrMD4zhKwKQZhga8dhpl3ogjL4XvISKfxXcKitmMlcyh
	GBl2Jtn0rgkO6db0i+elpNa11V8YsIZqzjpPwC6x1UGWw2EHCT/2oporp3GQItWjrKFoU6dXPD5Rn
	iXPZzItA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xANCM-0000000F85b-1i2T;
	Sat, 26 Sep 2026 07:51:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xANCL-0000000F85O-0k1T;
	Sat, 26 Sep 2026 07:51:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CF05B4363D;
	Sat, 26 Sep 2026 07:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560021F000FF;
	Sat, 26 Sep 2026 07:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790409112;
	bh=2ZjpK0JF2cbHk95sp5z75srSxbkoRMjDiFL2rI+O++w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ROLQiP8aWqQQ69Hn/WkAeq1snYbT8drZS+6o19Ia14LkQiCjM1vr1ZvQfzKYQTXKK
	 EqUIJHbdRUlY4NSV8Z1FeoNE23zwF0QzFXFH9VFg51Ca/WyPCQ2PD6XHE9UxBEbRoc
	 IVi5PG/Wy9e8NixqFQi/nBnLIh3b7LEo3EkzntQrAWnNeMoHhndkR1kOmsAEqEzWql
	 xEeKz0leX6MpQYE+IiPN28mfQpOy2jep2cTrTjQ9qSLtclI6cbtASZMercHGtL8eJ2
	 tgN6SUC2+OO2qB7f0fQU9N5Yt7I81BSJ7C36SMn4DEbyOjJyjA1U3EtOPglZpDgibS
	 vAfMT+VeamWAQ==
Date: Sat, 26 Sep 2026 09:51:37 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Igor Paunovic <royalnet026@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v16 4/6] usb: dwc3: rockchip: support PHY reset
 notifications
Message-ID: <totpimqouuaa4lysn57ga36y5u7htss5kju26s3yi3ey4d2vmr@4vpymy6enqhi>
References: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com>
 <20260924-b4-rockchip-dwc3-rockchip-glue-v16-4-126a2e9133c3@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-4-126a2e9133c3@collabora.com>
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

On Thu, Sep 24, 2026 at 07:25:40PM +0200, Sebastian Reichel wrote:
> On recent Rockchip platforms (at least RK3588 & RK3576), DWC3 IP is used
> with a USBDP PHY providing USB3 and DP. This PHY needs to be reset when
> the mode changes, which may happen when plugging in different USB-C
> devices.
> 
> If the USBDP PHY resets with the DWC3 IP running, its internal state
> corrupts resulting in the USBDP PHY not being able to lock some PLL
> clocks, which effectively renders USB3 unusable.
> 
> To fix the issue this adds handling for the new PHY framework reset
> notifications, which will assert PHYSOFTRST before the actual PHY
> is disabled and will deassert it once the PHY returns.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>  # PHY

- Mani

-- 
மணிவண்ணன் சதாசிவம்

