Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B685CC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 10:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mYBfMwiTI0HuoRBpQtV8NM8t6EOqAZpyYmmAOuAh4mA=; b=D2sawuehk5VT86oBbMF0xnWRif
	LP8EG9IsSKy0gyN4teunK1WJIOb4H9oQTP5Wf8Vlo6wB3CwMRJ6f66egVbJixFK0fs8/1BEQeXAY7
	yABBd8ROH9PZ4A8lp9vHLhh3uShAY53PMrI60c7SKcYtbqLNX99DfHW1JNiUh2q1uU/82yt7etKUa
	fcAUMhenY3/gdqCukQkBXIG4rjpr8vWHByvAjzIkpIRtLtEVC3Tl8L7hcbAowH7VCGWBr8bdWOkwn
	8mkVTC2kV7q54pT03CWV8C6zhWhbkHLzb+6FgxPwXtE8fXdoTwAGi4PaI2M1mc4GQMiyOU3kuJzNI
	Vy5AVYkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIdT-0000000HQgA-3vTN;
	Thu, 15 Oct 2026 10:24:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIdT-0000000HQfn-0U7Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 10:24:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C7E8601F0;
	Thu, 15 Oct 2026 10:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333B81F000C4;
	Thu, 15 Oct 2026 10:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792059870;
	bh=mYBfMwiTI0HuoRBpQtV8NM8t6EOqAZpyYmmAOuAh4mA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jnM1gNwOFnII7fIg2tTDV029l5K3lKllCnkAkp0Q7uJ9lZORN29D/zL1mGmxmozL9
	 72ukYJ+Rg4qf/KtOmshXtCDEP/orbv7bacWVQ9bYMTEUQo3DG+m4EU6H/mIfdN1lBu
	 YFK81QgtgNEgVKUAdJZa+byVgrNsx3QqUv1R5I8uF/vxtBDUEWuSglUe2Sf1Swv+S/
	 gu438xESVRPuqT7w2OpmfH4Nqp9CuRkewAGKIERjeMWPg6jnkNhNs+QIJLPXczp5XS
	 asBGJOULBLOMN38pAM4OkFEfCSLCRQ1EBL2ScH/Fx2bnf/DN+Ghxqcep5kA4pPzvLT
	 BMY7dusPpuvZg==
Date: Thu, 15 Oct 2026 12:24:25 +0200
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
Subject: Re: [PATCH v2 09/10] dt-bindings: arm: apple: Add M4 Pro/Max based
 devices
Message-ID: <20261015-peach-quoll-of-intensity-b21ded@quoll>
References: <20261014-apple-m4-pro-max-initial-devicetrees-v2-0-961edd8d661b@cyberchaos.dev>
 <20261014-apple-m4-pro-max-initial-devicetrees-v2-9-961edd8d661b@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014-apple-m4-pro-max-initial-devicetrees-v2-9-961edd8d661b@cyberchaos.dev>
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

On Wed, Oct 14, 2026 at 08:56:16AM +0200, Yureka Lilian wrote:
> These devices were offered with M4 Pro/Max SoCs.
> Add the corresponding compatibles:
> 
> - MacBook Pro (14-inch, M4 Pro, 2024)
> - MacBook Pro (14-inch, M4 Max, 2024)
> - MacBook Pro (16-inch, M4 Pro, 2024)
> - MacBook Pro (16-inch, M4 Max, 2024)
> - Mac mini (M4 Pro, 2024)
> - Mac Studio (M4 Max, 2025)
> 
> No iMac with M4 Pro/Max SoC was released, and the Mac Pro was not
> updated in this generation.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/arm/apple.yaml | 27 ++++++++++++++++++++++++

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


