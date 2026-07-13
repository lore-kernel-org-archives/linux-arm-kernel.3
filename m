Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71139C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 07:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4SLrEtPKJZ9McaHLWnqLfegFeDqMlOMFc4Y8tHwrtXk=; b=VB3FAC6l6QaAXALNKgSSDmCOHo
	DIT5Z0o1DAzs+XepxOu52rpFWCeYAATfZkSFa2fNqh/B7NzpDZlnKPaQCUZgQplQhCdNab1fVpH5O
	5kTTCJfeBwrETx0zTesjjuG2IQxCRjmTZdNQAcMCwY5uMJkWNMXAF2Ct+7Q6AK2C7bTLMFq98DTMb
	ULkxlIbCdIKqeq1ClmUb423+Cr9zFubP3GqyZZnCRLB7FrC6eNpG8+z+h6B+mgx3qtrBOIf8U+Vv7
	qJaWeRJxNW1BuqgQvW+Q54KDvFR4S9LhTxDvY8amE+34a/p0PCGr0ng5/7aA8tYlpUyw0zC6WIwwk
	/asF0E3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBGB-00000008T2o-47UH;
	Mon, 13 Jul 2026 07:39:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBGA-00000008T2g-2a44
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 07:39:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 367004322A;
	Mon, 13 Jul 2026 07:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897DD1F000E9;
	Mon, 13 Jul 2026 07:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783928366;
	bh=4SLrEtPKJZ9McaHLWnqLfegFeDqMlOMFc4Y8tHwrtXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IIzr1qLNUULtevegyuR89oEHlFQ23S1IkHVuva7jxxnZTpPzRSOm3nITKPUQ2BnzM
	 d2C5gBOQaN2qIYb/XgMBqlSdeSAyZzo6nPXSONQ/Ac4y4Zn0Kcg2e6Svq6lVZjNzwn
	 ZYyTS/Qc39cObYasBpdjlWNRmanmuyhw9xJWMsjQ/Pq9Z6W/vuiO6pA4Mq8eF/Z6XZ
	 7ifQvDuNRBLXBLA1QLqcYYq8hxg+KJmYnR2twoRhcBvsB0+2bV6bytbkl4dzK0GOLL
	 mam3rDgJfp/mkXq72+uoSqUjRefvJQkEv8aFGGAcvbZotorH2qwU2BO1g7Rk2uV+/g
	 Q6A08PLBaqOCQ==
Date: Mon, 13 Jul 2026 09:39:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Grond <grond66@riseup.net>, Stefan Leichter <sle85276@gmx.de>, 
	Grazvydas Ignotas <notasas@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Ethan Nelson-Moore <enelsonmoore@gmail.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andreas Kemnade <andreas@kemnade.info>, 
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Sen Wang <sen@ti.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Niranjan H Y <niranjan.hy@ti.com>, letux-kernel@openphoenux.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, kernel@pyra-handheld.com, 
	mfd@lists.linux.dev
Subject: Re: [PATCH 01/16] dt-bindings: twl-regulator: Add bindings for
 exposing ti,twl4030-regen
Message-ID: <20260713-aquatic-memorable-griffin-cf9e46@quoll>
References: <cover.1783749722.git.hns@goldelico.com>
 <00718b18253a764c2a7c9a2b95c3b8c411796583.1783749722.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <00718b18253a764c2a7c9a2b95c3b8c411796583.1783749722.git.hns@goldelico.com>
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

On Sat, Jul 11, 2026 at 08:01:48AM +0200, H. Nikolaus Schaller wrote:
> From: Grond <grond66@riseup.net>
> 
> FIXME: not reflected in the bindings
> 
> +Reguired properties:
> +For twl3040 REGEN signal:
> + - regulator-min-microvolt:
> +  - Same meaning as in bindings/regulator/regulator.yaml, but must match
> +    regulator-max-microvolt.
> + - regulator-max-microvolt:
> +  - Same meaning as in bindings/regulator/regulator.yaml, but must match
> +    regulator-min-microvolt.
> + - startup-delay-us:
> +  - Same meaning as in bindings/regulator/fixed-regulator.yaml.

I don't know what that means.

> 
> Signed-off-by: Grond <grond66@riseup.net>

As explicitly written in submitting patches: we do not take anonymous
contributions.

Best regards,
Krzysztof


