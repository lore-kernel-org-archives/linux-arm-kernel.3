Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC37BC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 02:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ijzecyyt3sP4F7RY7Ama0QURyYsGqWr6WbhQf2v7ihM=; b=tzws2/yBhB5qOG8DP0gEPaBPIP
	BsYAUscocbH/PeCUoyGvrpNy3gqSGMrDO/2ThnWoroJf3KrE2lVD1dpK8VpLj9qYAVSxnf23XJffI
	CrmlxHuyGIRkQH0gwGcEmUJWDDkAeXm07UlFXX9E49zfm2q8hbq49SsbjR0Og0E/HDau+2ld7Y7qD
	APR3HhjNSq+oOsEiaH94UV6IIqodYw+DcIRNj0+kgzHcNTAHeDEkFcse+QnUewiVHve7RLYADk/yD
	2af0b4+oNPwk8yOtyo/ieOW60wN8ttCi29F8W/tC5yu07i2A46Z9t9zIxp3eOEvHxjBzG6LPRqqs4
	kRQS9Ayw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNMhz-0000000Gxv8-2kTi;
	Fri, 06 Jun 2025 02:21:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNMdA-0000000GxUF-3fEw;
	Fri, 06 Jun 2025 02:16:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C222F6154F;
	Fri,  6 Jun 2025 02:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC362C4CEE7;
	Fri,  6 Jun 2025 02:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749176187;
	bh=wLz27OhmpWOMF3fZD3h6HrziarJBuqb8KFTIz16hHw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UO0WxtgspT3sXf83z00pbvllyXup00F2TBOsDTsnrDvz7k6/tNj2tS5ONZKgsPIs8
	 15wuH6zUVfYCe+nMzxk1cK71LSsghqiqDyLh5jhrgxtbCKwfmHL3QZ0+NUcTolc27o
	 3/dVaPwhsm+pjURPXv5Po9fGfd/aU+MdE1Xt6KCvZ4E7HeUyEYZ017Ko0QpdEe/Sc3
	 +4kiBCJylIRv0UeE8KoSEQQgpL2jA64C6BRnodYo9RUahwvE0omYECytN4eiCsJw1F
	 58BGmv4K2IGDP1n6yhBuK176Jlu94Ea+nW5yYj8jcsw5DPORs6bRZiqyC/ThFfp1VL
	 CwM4Jt1sxwAuw==
Date: Thu, 5 Jun 2025 21:16:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
	Ira Weiny <ira.weiny@intel.com>, linux-pwm@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dave Ertman <david.m.ertman@intel.com>, devicetree@vger.kernel.org,
	Kever Yang <kever.yang@rock-chips.com>,
	William Breathitt Gray <wbg@kernel.org>, linux-iio@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Leon Romanovsky <leon@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	kernel@collabora.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 2/7] dt-bindings: pwm: Add a new binding for
 rockchip,rk3576-pwm
Message-ID: <174917618272.3791802.11051043079285296957.robh@kernel.org>
References: <20250602-rk3576-pwm-v2-0-a6434b0ce60c@collabora.com>
 <20250602-rk3576-pwm-v2-2-a6434b0ce60c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602-rk3576-pwm-v2-2-a6434b0ce60c@collabora.com>
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


On Mon, 02 Jun 2025 18:19:13 +0200, Nicolas Frattaroli wrote:
> The Rockchip RK3576 SoC has a newer PWM controller IP revision than
> previous Rockchip SoCs. This IP, called "PWMv4" by Rockchip, introduces
> several new features, and consequently differs in its bindings.
> 
> Instead of expanding the ever-growing rockchip-pwm binding that already
> has an if-condition, add an entirely new binding to handle this.
> 
> There are two additional clocks, "osc" and "rc". These are available for
> every PWM instance, and the PWM hardware can switch between the "pwm",
> "osc" and "rc" clock at runtime.
> 
> The PWM controller also comes with an interrupt now. This interrupt is
> used to signal various conditions.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../bindings/pwm/rockchip,rk3576-pwm.yaml          | 77 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 ++
>  2 files changed, 84 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


