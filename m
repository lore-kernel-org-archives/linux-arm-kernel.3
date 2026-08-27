Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338DBC61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ICFnTYRS7s0OrNF+UlxpgEZVwggu1x23aonWDAOIy30=; b=GM8n3MTn8xDxB+Rn/Oe1GHIUWg
	cPBLEtAnJY1umEZsaF+i1shpOAhtTkmlXuJetS9WEYigTVRIyiFJSQnhE2jS4fkwHHEqSRzaHv3q5
	+aeL2oSEudhUq0v0h4F3JN7yrNs5r0GG6ieol1tYQ93DwDzVnYzaLs8L4izp7aHLX0Erdi3FVx/Uy
	i43LdD+y7bfydqCss1DBg1duBAWS7xW++Wl3Yz5tAT8o/D0B/Pj1/suKxCypjb0bOqIpa9pEPWsu2
	qQKdL4TZNbTZjawJCSC5RSBG0XDVNLKMhm5OQEWYinlzXMD9SNEl7iK5HGdZ6yzsR4Vqy078jzs0p
	8s4SfS6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcmS-00000004Iwx-3NuZ;
	Thu, 27 Aug 2026 16:16:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcmQ-00000004Iwb-3xhP;
	Thu, 27 Aug 2026 16:16:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4922E407EC;
	Thu, 27 Aug 2026 16:16:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588A41F000E9;
	Thu, 27 Aug 2026 16:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787847402;
	bh=ICFnTYRS7s0OrNF+UlxpgEZVwggu1x23aonWDAOIy30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oZLTvTKVh0ryslM2uHLc5UUJ+i+wFQHdBHG3enmsirsX00mIRPMPcG1HcmmJDPfh6
	 324w7+u0jLRPTBsZO7OApM+CRZKOGJjZPRQsCKh3O/tC18cc0FNnL/az59Kd2DjebX
	 pXriDpMt885numb9rjthDKIamxtaooUxAKhMqYqNKmtuB8ZblUcPiQIi6baG0USE+L
	 QfCk/FnayvhDokIe3Nfj1z67okVoY5xfnoy1fSfDAmTcgmBIK2mOaThNEPZkjUvV5j
	 JoOQQTfGzQu/+JHIr1ji8pGyesamRN5K1Ny2F5l1tsWTpDJZBkL6oImlDF90iIgKAm
	 J2G+KVt1xgzpQ==
Date: Thu, 27 Aug 2026 21:46:38 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Frank Wang <frank.wang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	Igor Paunovic <royalnet026@gmail.com>,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v14 28/38] phy: core: add notifier infrastructure
Message-ID: <apBi5sGBpPfwTW4G@vaman>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <20260813-rockchip-usbdp-cleanup-v14-28-b5ad9c68fa11@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-28-b5ad9c68fa11@collabora.com>
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

On 13-08-26, 22:52, Sebastian Reichel wrote:
> Some PHY devices with multiple ports (e.g. USB3 and DP) require a reset
> if the configuration changes or cable orientation changes. This is a
> problem, as the consumer device will run into undefined behavior.
> 
> With the new PHY notifier API introduced in this patch, the consumer
> driver can hook into reset events coming from a PHY device to handle the
> PHY going down gracefully.

Hmmm how will phy get notified for these events. Typically there is a
separate hotplug mechanism to take care of cable changes.

Looking at implementation of this, It seems to me there is checked on
power-on, so maybe notifier maynot be right one... ?

-- 
~Vinod

