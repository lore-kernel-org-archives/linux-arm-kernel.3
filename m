Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E03C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 16:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CtmdG6WXQsfL+iqlX99cR+kUk06H7B+pqUNW8uqAW5c=; b=Ys2/rT1N4uYP4e5wDR1tM504eO
	YUzFXY4f0ysm/FBieTv0jvN9v9FBxaUbkDuv1JKFzmC77XWH4LE05HND3e+y0+dHCa1tsQ3m0Q63N
	IXFN3sBe4XTZbxW4p6R3WY+lE8MU5xSwaUSuivz7ptvN7mAeFknG4vsha/x6NP9dtzX0gJLL/Br8/
	j0w/W8lLK1peesVsNAKq+zVsKVOkmwPsaSeSDCaiqxUuL9im+tLgXGjzj6x8McSOs6iWEIGYC4Q/T
	cP2ZyHGGtfvTsz6MIoYAageRqQbU9xqvUcarllEnp/UDjF+XXJk2xX7QeS13uUnPHqnrttxZk4kBy
	DvvaHB8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LUa-0000000CO3Q-45vB;
	Wed, 09 Sep 2026 16:49:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LUV-0000000CO2s-15CB;
	Wed, 09 Sep 2026 16:49:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A12B6600CB;
	Wed,  9 Sep 2026 16:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5152E1F000FF;
	Wed,  9 Sep 2026 16:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788972582;
	bh=CtmdG6WXQsfL+iqlX99cR+kUk06H7B+pqUNW8uqAW5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BDdimfjC4kJnh2nelU1CQ87s2cKn5KwuSGaFlUT8TuCSMQzYokvf+LtOMEvQUEJWP
	 sJlkaFF2WM8ocTVMTycl/89Ej7MkFfAgRO3h1+jhPeAXMVy3E2kPACtmZsDulf8HrF
	 R6l+0vE+M3sfXKNSGZtXxMb97JoFsiqtknCNNxOWxYmsKI1rNK2W8UD869cAQ4N7Ds
	 jy9GvYpnUsqi0jKPlNrNqTN9/LOaEbFnmXKa8eoP5UY7jXCey7kyZrfa7vc5NLdnAJ
	 WH9dWyjEEaeNOQTmaF9JVMqCTPDVPtTncEbha3YfI4w2a/sZsdJoKXa/VCX9cgW304
	 IG1iAcKx5xwIQ==
Date: Wed, 9 Sep 2026 18:49:31 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Andreas Zdziarstek <andreas.zdziarstek@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Jonas Karlman <jonas@kwiboo.se>, Frank Wang <frank.wang@rock-chips.com>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 0/2] phy: rockchip: inno-usb2: fix USB gadget
 hot-plug on peripheral-only OTG ports
Message-ID: <6ly7ywoptz5ipixy65mh4bibf6cqj237nxa6ujuy23o3rvql3l@zxceopmephl3>
References: <20260706223627.113814-1-andreas.zdziarstek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260706223627.113814-1-andreas.zdziarstek@gmail.com>
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

On Tue, Jul 07, 2026 at 12:36:25AM +0200, Andreas Zdziarstek wrote:
> Hi All,
> 
> I had an interesting time trying out the USB OTG micro-USB port on the
> Odroid-M1S (Rockchip RK3566) on the mainline Kernel. My intention was to
> set up a cdc_ncm+cdc_acm peripheral gadget as a hot-pluggable debug
> port.
> 
> For the most part that went swimmingly. Just not quite with the
> hot-plugging. The apparent first problem was that peripheral mode only
> works if the host is connected at boot time of the RK3566 Kernel,
> regardless if the dr_mode settings is "otg" or "peripheral". When no
> connection is present at boot, gadget setup fails with a
> "failed to enable ep0out" error and the port seems to end up in an
> unrecoverable state afterwards.
> 
> I investigated a little as to why. With my very limited understanding
> of the subsystems involved, I think I have identified some problems.
> All seem largely related to each other.
> 
> * The M1S references its 5V OTG VBUS switch as phy-supply of the OTG
>   port in its DT. The phy core unconditionally enables that on phy
>   power_on. From then on it powers its own VBUSDET input, making further
>   cable VBUS detection impossible. Also, apparently, after reading the
>   schematic, that means even with a cable connected at boot (and
>   peripheral mode therefore working), the board will try to back-power
>   the host. Seems my host port is pretty robust, luckily.
> * The inno-usb2 driver seems to generally lack DRP power supply VBUS
>   switching support? At least PHY and VBUS supply are semantically
>   treated the same.
> * The inno-usb2 driver's state machine powers off the Phy in several
>   places: on an initial no-VBUS sample, on DCP detection and on
>   disconnect. That seems to happen unrelated to controller-initiated
>   phy_power_on/off calls and looks like the main cause the gadget setup
>   fails and then borks the controller state.
> 
> My proposed fixes are in two places:
> 
> * set the micro-USB M1S port to "peripheral" in DTS and remove the
>   supply node. The board has two USB-A host ports, so device mode is the
>   most likely usage scenario for the microUSB and real compliant DRP
>   does not seem to be in the cards in the current state. Also, this
>   fixes the potentially harmful back-powering issue. (2nd patch)
> * keep the inno-usb2 phy driver from autonomously powering off when in
>   peripheral mode. This makes hot-plugging and gadget-setup without a
>   connected cable work. (1st patch)
> 

I'm not an USB expert, but your proposed fix does cause high power consumption
by keeping PHY always ON even when the cable is not connected.

To fix this issue properly, first I would investigate whether
rockchip_usb2phy_power_on() is called during cable connect or not and also at
the right time i.e., before the DWC3 gadget driver starts to drive the
interface. If there is a race here, it would still cause the interface to be not
up.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

