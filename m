Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C3BC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 08:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKFlmy94vGms3q+8yoOryQB2R7lIFvrQJ2IENZn4QY8=; b=JvzjsTmVCcFn9rp5ze0hv4rX35
	EMaVItj1d5ypJHV1btwycE1TvYBJNvAIdUX12zCjJtNI1xAEHQQeebyNQhS4+jsqgQDR9JOWcgeKD
	YhJV7CwmsrWeswXKFJmwryPOGl8L8Vo+IoqAv9JMaQCMAoS6zxs24kAl/4geavW/dgcLVHfxWSiE3
	VUE2rvg5TS7c9BPFKPi2Y9bcxLKYOa16i75MH6UElv5tE682YJRtktL4+ov5jRKmRt3ebzLQj/04m
	DDYlfbhOO0i+5CmkUazpipsm00LEHEeB7raL2Rcrj2blP16iOVduaFE0zoZKxzJcEfMWrRzxWux8t
	detDiloA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77Df-0000000ArNm-0MXC;
	Thu, 17 Sep 2026 08:11:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77DY-0000000ArMN-0r2x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 08:11:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 55F59600D4;
	Thu, 17 Sep 2026 08:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40EDF1F000FF;
	Thu, 17 Sep 2026 08:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789632699;
	bh=xKFlmy94vGms3q+8yoOryQB2R7lIFvrQJ2IENZn4QY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZOpm035eWyG8a9NKUBPJ7ynlFx1LEbAVQ2UIy9fUjwMrqEDUp6500b4FdfC7TaL8K
	 AQZeLdcJ3NT0bFXb7Ko7GnzF4jiVKJfx9RD2tf6los9vAP2HsQd3keqfdrNnS/DiQt
	 ZWrtC56j84I6lc4YmrEbbQwCgH41ELqc/xuazy96bJ49UMuPh6Mjb28gHx3wTAg39e
	 Gy9xOsOgECq9onHZxHzlIyh9E1H0xtCKSvYhV8nIqeCeEnXpxWCRWEYmVebfw/NPc+
	 CnD7gDXwHTZPW+ZY3kfJo7JBm8DU38Rd0PvsdGlbEiNGYTvjL97rUmH1/ExtsDdqUF
	 fe9Yevo7ibzKg==
Date: Thu, 17 Sep 2026 10:11:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org
Subject: Re: [PATCH v2 03/20] dt-bindings: arm: Add the actual power domains
 on U8500
Message-ID: <20260917-humorous-galago-of-tornado-e4ade5@quoll>
References: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
 <20260914-ux500-power-domains-v7-1-v2-3-9d0c17e1f816@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914-ux500-power-domains-v7-1-v2-3-9d0c17e1f816@kernel.org>
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

On Mon, Sep 14, 2026 at 01:54:31PM +0200, Linus Walleij wrote:
> This file has been left in an unfinished state just defining
> the root power domain for the U8500 SoC. Fix it up by adding
> the actual existing power domains in this SoC.
> 
> The PRCMU code and old regulator driver is mentioning some
> *_RET domains, this means "retention" and is a state in the
> domain and not a domain of its own.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  include/dt-bindings/arm/ux500_pm_domains.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


