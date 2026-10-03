Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE30CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 09:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7Cqps3I7ChVDkfGpYIwv5W5QyZBtV/wchFikLgUd30=; b=UPF1czfswl15whJIeeC0IYlMf2
	l+6AAdt6KTFVP3y0b27QK9u4Ggw4EAjXeJCCq+OHNfKn5K1WEa2QZ8h5A2Irq2ynbnOPyI2Y6n75f
	T2sZqfySAezKwH4AMvtmBn+H8nkU/xx5/hijU4yhXry/YswYcV5FVvXn65U+gjkNqnzHMEKR9bccL
	YlqVcv3VQKZTWhheg0h77W+Gg9hU9+j/U8ZmxAMSnYTxKH/vgaBp0ylzJPzhhO0L7NEtwoTUegMuc
	A9KKigl6Wala/1MAQz/wOCnfoGH6koLi4mWD0KUt/ktrbQNEiT1c3hydMbUlt5e5uezF5fSS0Fdmv
	dx0isRMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvfG-0000000DEWL-36HH;
	Sat, 03 Oct 2026 09:04:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvfF-0000000DEVt-3m7J;
	Sat, 03 Oct 2026 09:04:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 56CAA60534;
	Sat,  3 Oct 2026 09:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432F81F0089C;
	Sat,  3 Oct 2026 09:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791018257;
	bh=r7Cqps3I7ChVDkfGpYIwv5W5QyZBtV/wchFikLgUd30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ifsv1HpTllRjuu7fRpQtXxhQXDdrFcHAzARMmhx+d0R+gZ6eAYie2pV4O1aXnLYOY
	 vcZGUlC2cwlJOCpajrRIorSilCW1DUSoHoNzVh4IjzXfttEYPC1lcrmHYlmHNCEfmN
	 sB4ziC3sjmt/onjTlQUba1XPFTYQpeX/65W3ivSDa9DWoNETMRLMf7ksu0Ii1TFhOr
	 YiBszfZok4J5UWgbDyHqJhYfpcw3dcPFjIzGSa2tPD6UNa1RG1T8ON4zenRDVfscgH
	 qXc44TtRs8L5/6mxVvELB0rVqEE2ltB5etHgXfPHBKvszaQU2GF7oPWaCe2hEFPvwX
	 5jQl56+Y07PTg==
Date: Sat, 3 Oct 2026 11:04:13 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH v16 1/6] phy: core: add notifier infrastructure
Message-ID: <asDFBIVf06-VaWdx@parshuram>
References: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com>
 <20260924-b4-rockchip-dwc3-rockchip-glue-v16-1-126a2e9133c3@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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


Hello Sebastian,

On 24-09-26, 19:25, Sebastian Reichel wrote:
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

I dont think this series has the usage of this.

I think I am still not convinced why a phy should notify as I dont feel
we have any mechanism to notifying. Checking status and letting people
know if not really a notification mechanism... Maybe add a status call
instead?

-- 
~Vinod

