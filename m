Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C90ACC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 10:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lM5799hYbOtl8BgA3ry1OiBiBY0Nyz/X3iGyGpn5EXs=; b=3kxb4xXYXJWyoVe/6CJ7QhqMVs
	NE+jWZmmbeSlM9GjQjvxsnYvI+uybn46BOlWm4BCx8ToaMiJrJQPR131Ifo5/RHyyAnlw3QruhxYY
	r1AQKsptEOEpcIkE3q9HWCnbntPJVwgTfhqWEM+qqRZ+7dJdRr5K0MVLLgmEe9r2rR659vFWgvFVs
	2oNi89pMdxPWLOrB7syBObHPn17ATs5zJwt8D1gjdHWyRszvdb/TKv/kQ+LnoykiNKsLVSu1XSBSG
	zSxgtG7C8PKnce8eTeZ8iVIr/uQDyOFRAvGQuhML9vD0mu58CI58xNjoJlIW1NR54ZcmZxsVdyGGR
	0xiEyEtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIOC-0000000HOfG-1bia;
	Thu, 15 Oct 2026 10:08:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIOA-0000000HOf0-2bEj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 10:08:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 094B960120;
	Thu, 15 Oct 2026 10:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2A451F000C4;
	Thu, 15 Oct 2026 10:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792058921;
	bh=lM5799hYbOtl8BgA3ry1OiBiBY0Nyz/X3iGyGpn5EXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D59gDZmelu/o3/Ac+U0lCPgT+RcvOu3H816ykDIkMyX48jN/0babJH3w6r5VIww+C
	 koC7cB1guHUajCi+G1D4KIPh3qzffhdyBFRZ0yDBYPNV/m/Tf9/TjPQDzmKMdXsrXO
	 gTEGD6BCiU1WNsdeSqJDfvWyVtuYqjcYOckLJ/n2EMvUOyLRHi373b1mFKiLm5Crle
	 rXvLTD1R7RS4C3v3hkWWm6u8Q1E+1OBqBVdGF+MnBTy/bbyuNGY+HxtYfZD/44lEBQ
	 JHEJ9Tvmbxj/Q49j1JmdQnYsAIPRVgOe8z9M2f7+kGJ+Xmvt5EuyCvHY97WIKYK5qC
	 r3FiXQ14xDWSw==
Date: Thu, 15 Oct 2026 12:08:36 +0200
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
Subject: Re: [PATCH v2 01/10] dt-bindings: watchdog: apple,wdt: Add t6041
 compatible
Message-ID: <20261015-adept-supportive-anaconda-dd6fec@quoll>
References: <20261014-apple-m4-pro-max-initial-devicetrees-v2-0-961edd8d661b@cyberchaos.dev>
 <20261014-apple-m4-pro-max-initial-devicetrees-v2-1-961edd8d661b@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014-apple-m4-pro-max-initial-devicetrees-v2-1-961edd8d661b@cyberchaos.dev>
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

On Wed, Oct 14, 2026 at 08:56:08AM +0200, Yureka Lilian wrote:
> The watchdog on the Apple t604x (M4 Pro/Max) SoCs is compatible with the
> M1-M4 SoCs. Add "apple,t6041-wdt" as SoC specific compatible.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


