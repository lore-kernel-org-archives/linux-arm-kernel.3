Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8FCCC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 10:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZNzHE19mN9ZPlKLE+9F5Pf2M335AMCg0mWZd6cuQOw=; b=kpaL0j1BeOgGYLCzHOVEpjbD/g
	4Raujtw7e2ammvrhQhHWrvbzROE13PUhbQDlGWYWikqiMCzwOIl8JB88GtxkLzupvo+Q/SrnqFA8t
	IWNOOZH4Myfw+0QXw3m0uW/q9unzTTBlEx9Annv3EqvRZINti+6SVeYf5IKdduPB2+4gjp/MkXbdW
	cEFAei+t+iS9zkVe8yRI9ucs2+Im4c+hFISbRhLGcu1kXKndfNGWbJPCYQtTRwdlHhUUvyzch5GNn
	n6cXmgHerNaqCHEJwW4O90N91LE2Jo00ZgUTe7nHEzLZ+oS10cezPzuaAOuwYJ+BVWmmftROUdHmX
	hArZyP1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIcd-0000000HQRl-2v9J;
	Thu, 15 Oct 2026 10:23:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIcc-0000000HQRL-0v68
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 10:23:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DF9960120;
	Thu, 15 Oct 2026 10:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CEC51F000C4;
	Thu, 15 Oct 2026 10:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792059817;
	bh=oZNzHE19mN9ZPlKLE+9F5Pf2M335AMCg0mWZd6cuQOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kh0U/zW3Q5NUsLJJGoPaP3oyojNyEBmT604tlxiRpzHM+5suIBaSpBmuHepA9r+PF
	 Uq2Gp4XtkJyzxAiVLXVz+RIphSvEh/VgTsCI6OfP0RukW055CC+e43j5nrt/3Ct9g3
	 u5XKGHyj3mA/97BycDiV+PmvbmcDB35ZblWKYP242PmgQGLqkUTL8ePrITFAwN/lL0
	 65Rx6BHmY+lXXq/p4PabsGKmWOiY/Pt6k96OMBxO1/9gkpgmk2yfhZ0NDMMLtkJ+OM
	 +mW54gU3FLOJTA+qHT7pgUiB52SpTK7jvNkFYciPQmQApXupwEI3iA57s4RHp1fuc5
	 terQDrocurTQA==
Date: Thu, 15 Oct 2026 12:23:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Hector Martin <marcan@marcan.st>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Sasha Finkelstein <k@chaosmail.tech>, 
	Linus Walleij <linusw@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
	Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 08/10] dt-bindings: i2c: apple,i2c: Add t6041
 compatible
Message-ID: <20261015-fair-tan-viper-7ba5c2@quoll>
References: <20261014-apple-m4-pro-max-initial-devicetrees-v2-0-961edd8d661b@cyberchaos.dev>
 <20261014-apple-m4-pro-max-initial-devicetrees-v2-8-961edd8d661b@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014-apple-m4-pro-max-initial-devicetrees-v2-8-961edd8d661b@cyberchaos.dev>
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

On Wed, Oct 14, 2026 at 08:56:15AM +0200, Yureka Lilian wrote:
> The i2c block on the Apple Silicon T604x (M4 Pro/Max) SoCs is compatible
> with t8103. Add "apple,t6041-i2c" as SoC specific compatible under
> "apple,t8103-i2c".
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/i2c/apple,i2c.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


