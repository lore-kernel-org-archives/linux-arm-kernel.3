Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B268C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 08:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1uCQ9dcSGrRgpul3lxvARc030/WE5LZcLhyIlW7d0M=; b=iu3uErDjdQ9iqiklaPYz0fbcN0
	Wh7xdVGkcHoORKaWWog4xfV/kOUQI8lB7tuBkiGXoF9j3Iz74kk2Lw8pNct8+G7sEFvMWtJp/r25W
	YP+lLL56kBce/TbA7SRHHhXNFjh/SRqn43+6UKbYG+cHYUm9HQfG3TIXpfF4aJPrnTHjB0agCtOvE
	Xl6UjAPoLii5UEoMrs+cXdh8fdwHeedZd4ec5wV7/fQQhF86ZEiYLIsqrA2xRyAL/ract2g3M0T1E
	ogz+eCKLZ5PyWxUggt/RF4QCRNkr5LmPNN47BXmqW4NKON0U218qFepPEpvgIEI4LdPjrzxTLNsif
	/ap63PwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgO7-0000000C1Hc-3tJp;
	Fri, 18 Jul 2025 08:24:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgD2-0000000BzT4-03rH;
	Fri, 18 Jul 2025 08:12:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1796C5C667F;
	Fri, 18 Jul 2025 08:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A87FC4CEED;
	Fri, 18 Jul 2025 08:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752826366;
	bh=nPyCE4EJ89fmwm9m6eHxfXIrYOe/RLqv1W0KQKVxAu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UCWKQrxw4hIODjx81BJaPQA1xlN9NoK/jrwxR0cWdL8KNYM8LvVSrFrn33nkd6z6F
	 yj7aPIuc0tbkZ+I91hx+UPI1sg+lArTAf4dxbhvCaMdOwUciDadpm5IazwRPXtbXVh
	 ujM4oMGWxrzFa88FYYol01kUuVnL32p8DXs8dIktVYtxiM+5UWRay6CVKfDSW8tXiQ
	 WaRICnboRxwj/j5jxN7Ij+p5IHtu4Dz4ltalgTPV4dTzztudxnEG05IBUbSuH+s0d3
	 aePvPs1xX8y3JHI1Pf4mJlvhkZi1Fw6msIumCYut5LKIpzMGk3cEmjOOuU8ZQBLGGb
	 66Zdz9jt6mORQ==
Date: Fri, 18 Jul 2025 10:12:44 +0200
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
Subject: Re: [PATCH v2 5/5] arm64: dts: rockchip: rk3399-evb-ind: Add support
 for DisplayPort
Message-ID: <20250718-serious-earwig-of-current-18fad5@kuoka>
References: <20250718062619.99-1-kernel@airkyi.com>
 <20250718062619.99-6-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250718062619.99-6-kernel@airkyi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_011248_093951_89905FC8 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jul 18, 2025 at 02:26:19PM +0800, Chaoyi Chen wrote:
> +&i2c4 {
> +	i2c-scl-rising-time-ns = <475>;
> +	i2c-scl-falling-time-ns = <26>;
> +	status = "okay";
> +
> +	usbc0: typec-portc@22 {
> +		compatible = "fcs,fusb302";

Look at your binding - it said you don't have fcs,fusb302 - but directly
port plugged to the PHY...

Plus this looks like the switch. I don't think you really addressed
previous comments. Please give it a time.

Best regards,
Krzysztof


