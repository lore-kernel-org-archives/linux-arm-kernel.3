Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2779CC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 10:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHtid+XkEJDH1sFeTyARS2z8ZkI836TbL20jIh9LMcg=; b=f2uf6unfDuV1D9ESUzGpTnyhRB
	KDxrP2vB0ioOci1zHQMOuwHSgaZECDqZWOkAeR6PVdekiAyKDI56+oSYtyyPF4B9/QEipbvXrWTyU
	A+6ZyO1jwUo0h0ibPyrU3OjlhK1gwsFVRrlZTpzCwmhAS1jT/2xTJ6hQ/0yz+Gzc7Ka5RcG0A+2x+
	xQA8MSBoXsCgNI7Aupm0eUgo8kCErQVOf6ptBkJh08+jJLICeW7NJhbjF/8+PWbOUIUuT3FVjzbKZ
	gpLNXJiOUSwysbqF/oULepIjLzQdb7x0Phiu3rgh3ndNe2zUhVPY6XX2I+/9tAG56F3PD5gWSBOkl
	s+r16dMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIOZ-0000000HOkF-3cve;
	Thu, 15 Oct 2026 10:09:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIOY-0000000HOjm-2m5s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 10:09:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 586B9413EA;
	Thu, 15 Oct 2026 10:09:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2373D1F000C4;
	Thu, 15 Oct 2026 10:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792058946;
	bh=QHtid+XkEJDH1sFeTyARS2z8ZkI836TbL20jIh9LMcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HmU7XA033MRi/BSHUylHulfgEVmIcwqJmFBZdwZQwgfuAUEjkrvYC35Jpl/2A8hcb
	 UIJ4DnS/UV/l/n+HNFOujGtGdzfZXQSfvMSIgeO669wCiagp+B5yeFXzbaMa/caWK0
	 r5P4h/WE6OUbFdebN5QiX8NE5fWpUALBMrVyIRQLg+qBvZS68cWaGwiC/28HvrzPze
	 k5qVbaaCXeT2fBN4rDt59zL0+QCBQTNKKqI++m90N0IdMm67lsEaO4MmYRBFXNdizT
	 X3IJ21WCOI2uJ6fc75R9GuEqgv+is0eo5Clr+sM/GeQiG7W12xLrRFFYT+M9Oy54V0
	 4F3dx/ZFPuBgg==
Date: Thu, 15 Oct 2026 12:09:01 +0200
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
Subject: Re: [PATCH v2 03/10] dt-bindings: arm: cpus: Add Apple M4 Pro/Max
 CPU core compatibles
Message-ID: <20261015-refined-lilac-caiman-cc989b@quoll>
References: <20261014-apple-m4-pro-max-initial-devicetrees-v2-0-961edd8d661b@cyberchaos.dev>
 <20261014-apple-m4-pro-max-initial-devicetrees-v2-3-961edd8d661b@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014-apple-m4-pro-max-initial-devicetrees-v2-3-961edd8d661b@cyberchaos.dev>
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

On Wed, Oct 14, 2026 at 08:56:10AM +0200, Yureka Lilian wrote:
> Add "apple,brava-e" and "apple,brava-p" compatibles for the M4 Pro/Max
> efficiency and performance CPU cores respectively. As with the base M4
> cores, there is no longer a generational codename, so we assign the core
> compatible based on SoC codename ("Brava") plus core type (E-Core /
> P-Core).
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


