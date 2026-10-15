Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37E9CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 10:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UgZrFqMIAdCiB4C4Y0lOCBcHe4KCtn30JJJoEvXzBWM=; b=KkGS9dOCrSiDA/Ltl6yrUah1qu
	BHj3Vgs7XfX23mYsRShv5FK05cx4i9SCAMi+wpYPn/i283kpK/VOCoLsUmf345K3h9Gows6aQOS3U
	msgJlxipLzgAYl+KdG4Kj1gT/E752bPYqoPQTRtdXzsLUCQM0lD/PgYYEcNBgu35xYPwikdmx16Mj
	nbWJ9cRpXOC0sy1WxCbLvceS0SIQOUbARvwednxruSZ2FqMoijqEmcCf/mHEo5JSfToocVExjquyd
	KvscmlCTcPsWtP/g+jvSJvhcpt7bb/9SxKtA4xCONLUf8Yc5yLPw94YOyLtvcsNEE5hXkvKRhcdZB
	BYy3hzzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHINf-0000000HOZP-0vAR;
	Thu, 15 Oct 2026 10:08:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHINd-0000000HOZB-2g0B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 10:08:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6560A43B6F;
	Thu, 15 Oct 2026 10:08:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0145A1F000C4;
	Thu, 15 Oct 2026 10:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792058889;
	bh=UgZrFqMIAdCiB4C4Y0lOCBcHe4KCtn30JJJoEvXzBWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O6D45R/8JViR1CPmgUkxAZ+roCfzOCQyr2hlgmIwhGbuqb92AjuyZY9eDde2+pNgD
	 FPwtH50OEbhBMtMTtjydfsJFEohL2rIyg6ByJpblt4wEvU59dZACZQjez5JxZ/k9WZ
	 S+3e2usebuxlg2QMWGt830OOl0hsPrmKnuj1boyC+Oip9QJG9WdMJ+wBTo8nXIvkCb
	 zH5dFgeoruPbKCtCkXtyVGcbeS1HRZ4GbGS0MTSeOl2nFjmTcK5jw40A4YAD4CHqr1
	 PJnNTk1IwgsLcraWJKUcI/+igKSRV7cnM1jj7C9vFQUpzDv4EZm9A5rJXlqWIbuBAQ
	 A9yX/gbjFECwQ==
Date: Thu, 15 Oct 2026 12:08:04 +0200
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
Subject: Re: [PATCH v2 02/10] dt-bindings: interrupt-controller: apple,aic2:
 Add t6041 compatible
Message-ID: <20261015-audacious-swine-of-fertility-e148d9@quoll>
References: <20261014-apple-m4-pro-max-initial-devicetrees-v2-0-961edd8d661b@cyberchaos.dev>
 <20261014-apple-m4-pro-max-initial-devicetrees-v2-2-961edd8d661b@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014-apple-m4-pro-max-initial-devicetrees-v2-2-961edd8d661b@cyberchaos.dev>
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

On Wed, Oct 14, 2026 at 08:56:09AM +0200, Yureka Lilian wrote:
> The Apple t604x (M4 Pro/Max) SoCs use an AIC3 as interrupt controller,
> same as the previous M3-M4 SoCs.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


