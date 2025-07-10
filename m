Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FDDC83F20
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 11:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WtffovqX64Gup4hAyBrcApNT+0IV+LKHJusd+ujgz3Y=; b=mynlorVAuyVidQSSXDW+87LfwX
	9GSr+ff1AfA7As/ExQduJ6Z55YbDDrN60kW56PkA5oz8+CX2LF13dwdWFBrg7O7w+6h12FgpxQDoU
	OYWFAjtyM+ShymOQoHmcb6mTKOC2hmRUfJUxZnyr/kqXEwvRJQPaXsnKIiZAiD/GUolCTlwhlDjQj
	OieCyUxLpzRle9NNR8YtAcv4qYx9CUOBx3sdiwNyUxh+oNROf1giaN8w1Ti63hPDZLR0V9JiPYlMh
	AYiWYf3YVt+jDAX06d79JfXHwySnZ/4MA8ggW4Ld+qlcmiBz3z6pOHA9P6JeGn7dEYYsZ976WqrSp
	t3YSPyKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpLQ-0000000BcsK-127A;
	Thu, 10 Jul 2025 11:21:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnxF-0000000BOSC-0wEW;
	Thu, 10 Jul 2025 09:52:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 92BB45C6CAB;
	Thu, 10 Jul 2025 09:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9595C4CEE3;
	Thu, 10 Jul 2025 09:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752141156;
	bh=/HJYYChAy20DN1nkebvN+gQiiYH8PgHrzFXUdHv1QKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5BWyxpHwKCnatmuyA0n/neImgZGYGMGy2RhjjVP8r9hJ60tyjc53VqlbIcspNnhR
	 qHrjedu2jDjzVOa0Rs7z7QKD/k5GDHr34HAdmuBm/JN52DTMSF0yNQFmNy9haNa1Ov
	 2xgc4xh1MHaTDf3aEHsN7Egt0qJ82vlvS17nSv86quml+wwcVVp1PaChwjhipZ26Df
	 F99+QMGldthrABMOQ7wJyKoEWY6Eg5SgEnaQcQy/GRoh3tzecGYtyR7SwhyW3aTXje
	 HtD7ULTPrjRTISSkrdwQjv2e/Lkyl7f5V7hniWLnCtKee+CXNsuBcZ0PYY+f+iQeqO
	 r7Im83PPJgYDQ==
Date: Thu, 10 Jul 2025 11:52:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Johnson Wang <johnson.wang@mediatek.com>, 
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Landen Chao <Landen.Chao@mediatek.com>, 
	DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
	Daniel Golle <daniel@makrotopia.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Felix Fietkau <nbd@nbd.name>, Frank Wunderlich <frank-w@public-files.de>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v9 04/13] dt-bindings: net: mediatek,net: add sram
 property
Message-ID: <20250710-masked-intelligent-dalmatian-caccbc@krzk-bin>
References: <20250709111147.11843-1-linux@fw-web.de>
 <20250709111147.11843-5-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250709111147.11843-5-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_025237_298656_03E9B32E 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jul 09, 2025 at 01:09:40PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Meditak Filogic SoCs (MT798x) have dedicated MMIO-SRAM for dma operations.
> 
> MT7981 and MT7986 currently use static offset to ethernet MAC register
> which will be changed in separate patch once this way is accepted.
> 
> Add "sram" property to map ethernet controller to dedicated mmio-sram node.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


