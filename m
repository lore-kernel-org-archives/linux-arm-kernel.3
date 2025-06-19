Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF90C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 21:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p78c4pFSZsl/cYAu+NblAgf0zSrytRvAYqFqDj5uriw=; b=ScR2WHgyr5cBZe0vIsr+PUYxOD
	46PPYLl76eG6DjdHIPUzsYHVrAtIrDdfnp6ww2KTDTqLP67EjDEgUMsF9PTrbgSURj/akUCeRqsvJ
	BGDPyUQ9J507KLQi+rEDZivIntBU+0J8tuQyUl/DCfsV5WCBLLLSVKhcXSdmZTQYtQFySUG8qen3m
	d9gTKEek0t9XmnJzlHWL2iF6WHV4RL1Nw4YcuwlXLDJncbzziltS/WidyrZwFIo9vJWYEwgdi8jRf
	KGqR/AFh2TbVZuj2IxrYEIWjmMfFt76kagiXjUuciMSiipDudr8S+O4t74w3DMJwKfoiHe+VmcKzh
	xdNXebyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSNC6-0000000EKP3-0qFV;
	Thu, 19 Jun 2025 21:53:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSN9s-0000000EKFx-0k3F;
	Thu, 19 Jun 2025 21:50:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=p78c4pFSZsl/cYAu+NblAgf0zSrytRvAYqFqDj5uriw=; b=vwlc3ekOINkhRghcoe6/+IXwj0
	anuJlyiboOwB4gTx5wFPmQIh8ZLldn4lTsXVOBzd9ctUvyL0EPK4ifg67GlWNWgW05W+5RhlM2fjD
	VdjGBB4R4bPL5fcVtSa45yjp3RX6Zp1KkBZYrEiDpSXx/6e7R5Ub8tDO/bfMw/kl3ofWpV0D+xXMb
	/mpotHo70MsV7BAIEd4WEDOVsjyCE29O9/Lwf9NZr79067oLYRGW0m74nVIOpQjxizzekTiUmgops
	P4ol8wnMkj7mWZEYoyOj/zlvqFb+GcqtwvtroC21Nga67uaJjg46x6jZLl+uqgzL9UQSNia5BFmG7
	LQEBK9Yg==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uSN9k-00086P-8T; Thu, 19 Jun 2025 23:50:48 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Alexey Charkov <alchark@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/2] RK3576 USB Enablement
Date: Thu, 19 Jun 2025 23:50:38 +0200
Message-ID: <175036980219.1524492.2279804764361633284.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250619-rk3576-sige5-usb-v5-0-9069a7e750e1@collabora.com>
References: <20250619-rk3576-sige5-usb-v5-0-9069a7e750e1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_145056_238044_9C7C4F17 
X-CRM114-Status: GOOD (  14.94  )
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


On Thu, 19 Jun 2025 20:36:35 +0200, Nicolas Frattaroli wrote:
> This series is the result of what I thought would be a quick 10 minute
> job, but turned out to be more like 3 days of pain, suffering, and
> confusion. This should be expected with USB Type C though.
> 
> The first patch in the series extends the inno usb2 PHY driver to fiddle
> with some GRF flags in that driver when the PHY is connected to a USB
> Type C port. Without this change, devices on USB-C simply don't
> enumerate at all, as the state machine gets stuck waiting for vbus to go
> low or something along those lines.
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: rockchip: enable USB on Sige5
      commit: 64df8e2e207a2152201ef3515baacd8816c13282

Adapted to the other Sige5 series I just applied.
Please double-check.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

