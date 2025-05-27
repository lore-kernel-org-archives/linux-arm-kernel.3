Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96041C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 19:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lz3lkpMPyY9yI7Xw11Mgz2g3rTGvZWSMPU44zyQF+yI=; b=zduBnlkUyqvoE38Tr0J70gEDBJ
	kXeNOto9CPQbuRUuYNLAr9dryziNh181S5oOfHBY7jxugBTE+22l8sFGNQnqYCStjeCW/gwoGkh+x
	FSHWls9lgANNKKq5hrDqpciYxKPKz/E0vJix5+964YEcF6LNSBQtFxKzw7jlOKSEgWV80jP1eDjas
	FxUppC2yiM+RrOPvxpJRkUJNEPFaLVgJfq9SHmZb6US1FuIMK3BZ55iMA1CRcNhfMFiq6wPx/xw2F
	rhq/w/pHL9RJMEPIG695UhrCLg1LrzAMwFqifDPqZlTheGdrRyI42i2g9OViYDtOaN7LyfyPylcgX
	3vKH62lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK053-0000000BRgd-3ZMB;
	Tue, 27 May 2025 19:35:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJzz8-0000000BQok-1Kps;
	Tue, 27 May 2025 19:29:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B4F7C4AA1D;
	Tue, 27 May 2025 19:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63EBBC4CEE9;
	Tue, 27 May 2025 19:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748374153;
	bh=KARBt7V80dw1XzTrK5gyR4MyC6WRf9x90HmxHAgt/tY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y/DQK3SCftLvg27nD3SbPiFtBNHZ3FRWUj3S4hc4ChHoL8l80dysUcxZXMMzeThma
	 fouJ7OoEgi5bEDbKKEbwUYc8fe+B6j5hpHlp7QjxPh5Mf8HANBgd704ZtOQr4vWvNp
	 GZnmxS7JTjNrTdY5kUsXKA9DPErJ6SB1N5tZH7dAoue2z62bz3Mj8yYKfq2soojL+M
	 L7qWran14kF9Pci5zZUQPUYQOGP+06FjLgqYcL08lKg+jy33RZEsWKZ5wlFoNN7OIJ
	 XCHzS/XpunLpHZs33rpUMfGRyfEqmw6EK0cYgJY6AZE8X3NLal9R0OaVFEEg0SM5WU
	 LPde+tHeqWsLQ==
Date: Tue, 27 May 2025 14:29:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Landen Chao <Landen.Chao@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	DENG Qingfang <dqfext@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/14] dt-bindings: net: dsa: mediatek,mt7530: add
 internal mdio bus
Message-ID: <174837415111.1091232.14774319774329934407.robh@kernel.org>
References: <20250516180147.10416-1-linux@fw-web.de>
 <20250516180147.10416-5-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516180147.10416-5-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_122914_377999_FC557466 
X-CRM114-Status: GOOD (  11.11  )
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


On Fri, 16 May 2025 20:01:34 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Mt7988 buildin switch has own mdio bus where ge-phys are connected.
> Add related property for this.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v2:
> - change from patternproperty to property
> - add unevaluatedProperties and mediatek,pio subproperty
> ---
>  .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml   | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


