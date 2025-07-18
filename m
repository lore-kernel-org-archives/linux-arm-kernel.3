Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA782C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 08:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrpwPeiUHlmCona7+1b9Lx66LvGiZlAjcaqcJBP8Hk0=; b=EdaO5qtEAD3xl+I+Q4haV10Gdo
	EJdv5e8OGdKhAd6xGoGm3OuIqOysuzTDz6tDTO7eU1uiw4+TkwjpUyrm+XfBA0XKpkZlcwUi2WtXY
	Xw7phh1UDGlkNUqTWGFrG3pSR8yzLxLbqCu65DbBZnruk7LJ7fkpp01zvvmfMzn2ZuPpbWMMyY4Tc
	BF90FnUGA9qmrQ5WYLpl2MhRmRlMnhwA/Ze/pvMYWpnXCIL5bvOwgVMDyQu0kONIrjJJoQJCPhBNp
	bpzks6N+S7mbVsxjTKmhGtOSl1ZzzANs6F+UvQUcUjRDTeqsuuuEUmlRCcSvOiSu0uLrI0MrRAbo2
	m3iigdHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgJG-0000000C0Yz-0jZa;
	Fri, 18 Jul 2025 08:19:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgAW-0000000Bz46-1sxI;
	Fri, 18 Jul 2025 08:10:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2861D41A4C;
	Fri, 18 Jul 2025 08:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 719E1C4CEEB;
	Fri, 18 Jul 2025 08:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752826212;
	bh=pYKJJ2hQUpdG2dVQ13Xx5f+NtvuXuDTByPwbcBUy+ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qhKKMwFU7zuaBUi4JjVCyKOTLven1T/f3a8B6gZ+ti4Ac0/5uaHiXKYRdjUuz5R8q
	 FVep+nERjFceG9fK8v6gAZYFXdfix9YEmlIlfo1+3Sk9Ivro9aDG/boJh6UbFBr+mV
	 f01GQ8YGzYPvh7ZP2c6mx+CzPlqCrRq1m3fmBV5qzHoMoJY3scMszEhYD2RQzzK+NE
	 xeitHBg5OWV5ZXrYnEGIkqZlvxHBL9CQoNJp9fvaozaZN4zW1tdNynssq9DUuIGXn8
	 oxDiTm1Id5woKqn8v1cT1OLl45daF+yZXV5Bz1goNQyl1rJvNHV/MJY6gRmAhhKRzV
	 yhsxyywjg6bFg==
Date: Fri, 18 Jul 2025 10:10:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Yubing Zhang <yubing.zhang@rock-chips.com>, 
	Frank Wang <frank.wang@rock-chips.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Amit Sunil Dhamne <amitsd@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Chaoyi Chen <chaoyi.chen@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>, 
	Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: rockchip: rk3399-typec-phy:
 Support mode-switch
Message-ID: <20250718-psychedelic-panda-of-defiance-ef6aac@kuoka>
References: <20250718062619.99-1-kernel@airkyi.com>
 <20250718062619.99-2-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250718062619.99-2-kernel@airkyi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_011012_517386_9424ECE1 
X-CRM114-Status: GOOD (  11.32  )
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

On Fri, Jul 18, 2025 at 02:26:15PM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The RK3399 has two USB/DP combo PHY. With the help of external Type-C
> controller, the PHY can switch altmode between USB and DP.
> 
> Their connection diagram is shown below:
> 
> external Type-C Chip0 ---> USB/DP PHY0 ---+
>                                           | <----> CDN-DP controller
> external Type-C Chip1 ---> USB/DP PHY1 ---+

It looks like your "external" controller is not described. Look at your
port property - "Connection to USB Type-C connector". Lack of proper
hardware description leads you to claim that the PHY is the mode switch.
I have doubts on that.

You already received the comments that you need to come with rationale
why making PHY a USB switch is correct. I don't see the arguments for
that.

Best regards,
Krzysztof


