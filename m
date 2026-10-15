Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A46CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 10:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p7EZk+lzmJeE4LsSw3GX37rQBpfI6r8PK791dC690Ys=; b=H9fsAfI+aScR5P9WtvFvLVvv2B
	mn+V13FszZv0o/t6pNUVYC6zG0uG9uwQ/bNh4LNkGDDT0tnO/y6kKa1Bn2CObTgCsd6OoL8DzkybL
	czhNU7W2zzI/Ye0SfRWv6ycGAGOd/vEg4ciag+JRsxN/wkeqmuaIW4mMNXxLMH1zIiBEtLtXkNOOZ
	wbHYcVpILbz7JClDF7yrNg9FmUXdhS+DE4hGeKsTT/c8XvrPgARCTWpQF2SRroeHRWsQZJypyuYcY
	PLWFQCqXGA+sC9SXeNbZVnt33wAP+C6a2ozJLsGR9MgBykQErw8obaopAim1LX4wmLqqnR8HnWDbF
	wEMK97MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIbg-0000000HQBq-1Jmc;
	Thu, 15 Oct 2026 10:22:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIbf-0000000HQBk-03Zu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 10:22:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 636A8601F0;
	Thu, 15 Oct 2026 10:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A49321F000C4;
	Thu, 15 Oct 2026 10:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792059758;
	bh=p7EZk+lzmJeE4LsSw3GX37rQBpfI6r8PK791dC690Ys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h7hyC0PSOMUerNNnkjhU/TJSkF39Piqr/V/PlCuAddZo8a5N8op1k8zN5aSMFQG4s
	 2x/FRnIKtf2E3E+Rz6yt/bS7TLMNWPvSq69DheZPEjBQzdgoX1AuiZ3cMXG5lfIwMQ
	 Tie17QNVvqnO8HSuwJtjRnjCQy51t0aEv3GsOgmaufyxj9dHOcio/e9kX64SpkhNqh
	 r6NCMvdbjTTFkpC8Ruqc71yEp5suyxmdvjBRlXco6hG+F69rh82BTrGannRzy/yXwb
	 g0acbs+f5wvA2FVbLe3UGElQIkSjTkyDdMKtZZwpWkaWgfyAAVvWDwUVpV1Ba8XQa5
	 HXCCFGkg6Tx1g==
Date: Thu, 15 Oct 2026 12:22:32 +0200
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
Subject: Re: [PATCH v2 05/10] dt-bindings: arm: apple: apple,pmgr: Add t6041
 compatible
Message-ID: <20261015-unselfish-camouflaged-ant-decc86@quoll>
References: <20261014-apple-m4-pro-max-initial-devicetrees-v2-0-961edd8d661b@cyberchaos.dev>
 <20261014-apple-m4-pro-max-initial-devicetrees-v2-5-961edd8d661b@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014-apple-m4-pro-max-initial-devicetrees-v2-5-961edd8d661b@cyberchaos.dev>
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

On Wed, Oct 14, 2026 at 08:56:12AM +0200, Yureka Lilian wrote:
> The PMGR blocks on the Apple Silicon M4 Pro/Max SoCs (t604x) are
> compatible with the previous M1-M4 SoCs. Add "apple,t6041-pmgr" as M4
> Pro/Max specific compatible.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


