Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926E1C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jmAptIvHqywkparkAJXS/X7IeXr9c/AeAy6RqWrrvUs=; b=I1LnYxEdf7ra3ArECKckSaE4Wz
	ElZ2+mEgv9iQQx7KsxhR3kSCtHqWSYdbg8gK7D9hgaDQpa5RSc4xXE5gR0R2IXAPHmG3zXWbvgCGA
	4wE3fN1AfoMdFdaSW0n3xmzAiy2sPmtyPQxpkhqGg/26ggsB2mxnU57RFSkvxlBr3RoDpLeUHlzQV
	m+MPep5MdibzmhY5dCAvQ4po/zdKO/7lOJe58TVExs3i2yb7RhOE9YxIeKQFo+/FSXX+tXL7+kq+U
	tCiWVfraVaEPypPflOaMIxFjZTx0p6SXAKnSzqm+Yn9qY34cbMSYrGEaB2zMZbjL4kdMfTiFGFxwR
	S0k8LGWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lD0-0000000BMnP-1PRr;
	Thu, 24 Sep 2026 15:18:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lCz-0000000BMmz-3wtQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 15:18:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 07E0D601DE;
	Thu, 24 Sep 2026 15:18:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8046A1F000FF;
	Thu, 24 Sep 2026 15:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790263080;
	bh=jmAptIvHqywkparkAJXS/X7IeXr9c/AeAy6RqWrrvUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cdulPwzd7jLXujpWA6xkurhmXp530xNSTW0b4ozNRsvbS8lc9Hg6AJYZ3CLrnCpoA
	 AgYI8zKTjeh0XbekQ8PpGahLG/qAdbFprLenvsPzEcE3b+RRQqFbLl4L3+/SZWpBNd
	 RsQsJWq5MOr1pVU7Ur9PGdeZt46y+vFXt6nAwpLry2CzXbQ9V59d+OEKKh0qSXm/Lc
	 AQenRp72jTYJCjjG8ACdf4vrUNVT3glLQasLf+oJnKxRLWqYxc3qKCLoN8geFjBwwg
	 GR1NQeaaRTfEXuFNQDA83AGAFjMBZkqoO9Yk4YLmmKrJdyeJAHW1BMA7GSP8boL9bO
	 8IWUvM7CEjmBw==
Date: Thu, 24 Sep 2026 10:17:58 -0500
From: Rob Herring <robh@kernel.org>
To: Mikhail Kalashnikov <iuncuim@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Juan Manuel =?iso-8859-1?Q?L=F3pez?= Carrillo <juanmanuellopezcarrillo@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v6 1/5] dt-bindings: thermal: sun8i: Add A523 THS0/1
 controllers
Message-ID: <20260924151758.GA75925-robh@kernel.org>
References: <20260913145527.18148-1-iuncuim@gmail.com>
 <20260913145527.18148-2-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913145527.18148-2-iuncuim@gmail.com>
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

On Sun, Sep 13, 2026 at 10:55:23PM +0800, Mikhail Kalashnikov wrote:
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
> 
> Add dt-bindings description of the thermal sensors in the A523 processor.
> 
> The calibration data for both thermal controllers (THS0, THS1) is split
> across two nvmem cells at different offsets, requiring the two cells
> to be read and merged. To maintain backward compatibility, the name of
> the old cell remains "calibration" and the new cell is named
> "calibration-second-part".
> 
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  .../thermal/allwinner,sun8i-a83t-ths.yaml     | 34 +++++++++++++++++--
>  1 file changed, 31 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
> index 3e61689f6..792081af5 100644
> --- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
> +++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
> @@ -24,6 +24,8 @@ properties:
>        - allwinner,sun50i-h5-ths
>        - allwinner,sun50i-h6-ths
>        - allwinner,sun50i-h616-ths
> +      - allwinner,sun55i-a523-ths0
> +      - allwinner,sun55i-a523-ths1

Why the 2 compatibles? What's the difference between them?

Surely this has been asked already, but nothing *in this patch* answers 
it.

Rob


