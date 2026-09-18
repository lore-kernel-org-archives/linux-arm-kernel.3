Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB351C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 18:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLZnhkcbCs2cGW8z2qAspQRyV6RDHbz3ypUhIp/hIoE=; b=bJvAHQYEuAwwlVOwietDUd1ARS
	r3D398ZivrPvFOfsL5ixlSBf8w/5rQBHb/p5RIPNHKqbrJJAXQ52F5tlTqfKoLqi/MItefIJxsBGK
	Zdv5piRtgxknO3FDlL01AZYe/MVWmq38oGARFRNsqKHQS2sFMqd9mrAWB5rWEDpkQPLR3XwO60pJi
	fmUKpgMwecp0a1ZGvyopQrietNtbcV8g71P98Npy7Y/jBLqW1C9mACkoqmmc6k1NU6FsdxTlG4qqp
	CHAzKfUm4Q7eJTY7B0WaRHDfcy5vFHZllHTnu0NYs5DoT375dvWYSwmmJQCUCWJQLv+rhGKuVrKKI
	i0LDQd5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dJ4-0000000FJH3-3ndh;
	Fri, 18 Sep 2026 18:27:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dJ4-0000000FJGo-03UV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 18:27:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 22CD8602CC;
	Fri, 18 Sep 2026 18:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B8821F000FF;
	Fri, 18 Sep 2026 18:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789756048;
	bh=WLZnhkcbCs2cGW8z2qAspQRyV6RDHbz3ypUhIp/hIoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UOhzJEHvKuUqYkqOMv6WEMzOnah9ODgXw77d8su//Qz/QRBWSYMq30HRBZyJfcBPs
	 GIZ0OpjHyVy60b4/F1ETe9qo8pNdupvvo+ok3kKVVu8M+JCnDwuXZxoDENMojh7o5Y
	 Xhd/tG3jhRVJnTgRENawjOtynb06j161CAXuxBExwL/NjG26R2w+bV+wQy6N6xbOQu
	 jcuby6T2fvjbrjeFFjNRj7bTdtmRGglf5GCzVWBwZ/6MdTA/zbi7RPQ9WqDGWCfqfW
	 0A3eJ8sE6AJR7jDevEuz8/ry5S9XKC/yaGsa5LxjZHwGj5TUEL5ShBFxDLx3dbv/nU
	 KYurNwwtu06Kg==
Date: Fri, 18 Sep 2026 13:27:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: Dinh Nguyen <dinguyen@kernel.org>, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	devicetree@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: net: snps,dwmac: allow stmmaceth-ocp reset
 name
Message-ID: <178975604551.1250907.16038130786685150489.robh@kernel.org>
References: <20260909080559.2028-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909080559.2028-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
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


On Wed, 09 Sep 2026 01:05:59 -0700, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> Arria10 SoCFPGA DWMAC nodes use reset-names = "stmmaceth",
> "stmmaceth-ocp", which matches what dwmac-socfpga looks up for the
> OCP reset. The generic snps,dwmac binding only allowed "ahb" as the
> second reset name, so Arria10 DTS failed schema validation.
> 
> Allow "stmmaceth-ocp" as an alternative second reset name and drop
> the related TODO from the Altera SoCFPGA DWMAC binding.
> 
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> ---
>  .../devicetree/bindings/net/altr,socfpga-stmmac.yaml          | 2 --
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml         | 4 ++--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


