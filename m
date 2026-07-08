Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8A4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 08:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYW55XLHCFJgarGHlK8rdPs4cxOeLL3xFE4MYa42nnI=; b=DNTrU/loweLcyI3CXgnFZIcbOy
	FLfB5FX4K/I8tYyzlFebNYIcMpJb3xIU+vY6DzH0KOgq0C9U1987PT2YPrnh4AyiKPT1ATScD1mGI
	4cI7vW751CZBJq0xVsb5W3dB9gDxt7CGsia1XKTca9uBvS6L1CHzevDvyS+iRQ1Y7f4OelAn5Z/QH
	DbapFq7r40UNnv2CBfzPksbjxyAsF828URcC+cEpjtwxlF3WTmcC9KiDpH09FXYu2/fpgoONdKxqa
	RGLEpRKmP6y8XtVBtwJs7lQTnK8+T1HubK0KqmJXjiARgFvHGsXWNnGYP27V2RTJIPyDAr9q22Hg6
	A6ICxMBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNmI-0000000GdYW-1vTo;
	Wed, 08 Jul 2026 08:37:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNmH-0000000GdYN-1gzq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 08:37:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 24D95402C0;
	Wed,  8 Jul 2026 08:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BC411F000E9;
	Wed,  8 Jul 2026 08:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783499829;
	bh=vYW55XLHCFJgarGHlK8rdPs4cxOeLL3xFE4MYa42nnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bnvx+knCUJGGa/+vbkoEIot6or+TnOlVO/lWt4cbsKUITIz8l9gX6FIPizpok2Sb+
	 EkJW1JvrgXvaTjco1LSiQ3zAjeLLHpAzvBVjA18bhARz3WR2eYjXThPyREoglq6JeK
	 UL/yGMDmP2n1Ip+KfDJuYLvVsWAhHbn6aVOo8Mj8gGN8Kac6ztDapDbYPcOQ5+gWvl
	 DIK26PUNn3rWTFqCMODwmT+U8nCsVVXf8QqlthPR8fpQzJyKC0BtsAu1UFuOlD/Eti
	 l/CjedmhUbdNm7Rauew0rHocOAgyOtmLb4oaSWyxKl6e3XlxxzmpYOz/2DueHjtOJ9
	 h1cZRErSyIEIg==
Date: Wed, 8 Jul 2026 10:37:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Thomas Gleixner <tglx@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Hector Martin <marcan@marcan.st>, Linus Walleij <linusw@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Sasha Finkelstein <k@chaosmail.tech>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 04/10] dt-bindings: arm: apple: apple,pmgr: Add t8132
 compatible
Message-ID: <20260708-chubby-fuzzy-dragon-ab8ab2@quoll>
References: <20260705-apple-m4-initial-devicetrees-v1-0-e5655ee56523@cyberchaos.dev>
 <20260705-apple-m4-initial-devicetrees-v1-4-e5655ee56523@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260705-apple-m4-initial-devicetrees-v1-4-e5655ee56523@cyberchaos.dev>
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

On Sun, Jul 05, 2026 at 03:17:23PM +0200, Yureka Lilian wrote:
> The PMGR blocks on Apple silicon M4 SoCs (t8132) are compatible with the
> M1/M2/M3 predecessors. Add "apple,t8132-pmgr" as M4 specific compatible.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


