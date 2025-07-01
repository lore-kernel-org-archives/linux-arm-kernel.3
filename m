Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210B1C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 07:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjaRJYK+1UcIp7B8xbxQAZvnYJOvsgJNZoAUSxcuYgo=; b=gYb5K5oUI1vH9EQzUi8nIECI/R
	uhHK0EsyLpyuzp+Eprv+Ro2bpqPQiudVw2fc2ljGkZAN45hsLnqwpNHSOSYq1Tzg1CdGt9y4RYfxI
	dqJSwlzH3zKf9p7NhXjgIBHutSSx3vvyTYwJyQaqveZ4iNsIblYGpoAQwCFRAfrTeSsZoUIl0UH4r
	bGhBB3Us1Q36a3X74aGnIAG5JKbyeNvV677KQOlRItenwzgkX7bfoOYjlxL+xtXRMv9mA3ML7wQb/
	LAb1MXD/Thn0SP3csiXhJb5SmhR09+9ZCD515wa4alWtD4amNgW2qlfB1GZjz/fmYADpAo7SIpyTA
	Oxj+oSeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVO6-00000004GdF-0esC;
	Tue, 01 Jul 2025 07:26:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUgd-00000004B6P-1LWS;
	Tue, 01 Jul 2025 06:41:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6697161136;
	Tue,  1 Jul 2025 06:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293A8C4CEEE;
	Tue,  1 Jul 2025 06:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751352106;
	bh=d4M1ipo/BpY2fq2FFDmvRZtLeK+GPtRI5SDJlqTCwgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eMwivqhBRxQZvzeiAF6cYrziYyySpvSnAN9nqOZ3tyn7zFJZMCRwYfOtfKRX8Dmt/
	 rv8OOOXQB8aDwqXx4JP+AacsdynnnFrYoKV6ftYOOV/tqCcGnDppocqF3pcaiWhHnR
	 V+yyTfTeiPL9xHhnGRQm3ZTx2oGQ+/iRxnZaIx/Xd1lMb/F/vT49YYUPaHz6h2GGEg
	 HtTGvtTPt2KjJDF6godQRokbsAmUyVkYtzYmhqQpJLaC0nhZX/cpz/iJ1b17ccXeYI
	 xjGWPVyQNhmeS4gJVcQiybqQgpw7UEWPOU6mI8LoTkBh/CCKE+ckAC2qclYbzEvvjh
	 RW4mssWEqSN1w==
Date: Tue, 1 Jul 2025 08:41:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Wunderlich <frank-w@public-files.de>, 
	Johnson Wang <johnson.wang@mediatek.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v7 02/14] dt-bindings: net: mediatek,net: update for
 mt7988
Message-ID: <20250701-rebel-mellow-parrot-fda216@krzk-bin>
References: <20250628165451.85884-1-linux@fw-web.de>
 <20250628165451.85884-3-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250628165451.85884-3-linux@fw-web.de>
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

On Sat, Jun 28, 2025 at 06:54:37PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Update binding for mt7988 which has 3 gmac and a sram for dma
> operations.

I asked why you are updating. You claim you update because it has 3
GMAC... but that's irrelevant, because it is easy to answer with: it did
not have 3 GMAC before?

So same question: Provide real reason why you are making updates. That's
why you have commit msg.


> 
> MT7988 has 4 FE IRQs (currently only 2 are used) and 4 IRQs for use

mt7988 or MT7988? gmac or GMAC? SRAM or SRAM? and so on... it is not
easy to read and understand your commit msgs.

> with RSS/LRO later.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v6:
> - split out the interrupt-names into separate patch
> - update irq(name) min count to 4
> - add sram-property
> - drop second reg entry and minitems as there is only 1 item left again
> 
> v5:
> - fix v4 logmessage and change description a bit describing how i get
>   the irq count.
> - update binding for 8 irqs with different names (rx,tx => fe0..fe3)
>   including the 2 reserved irqs which can be used later
> - change rx-ringX to pdmaX to be closer to hardware documentation
> 
> v4:
> - increase max interrupts to 6 because of adding RSS/LRO interrupts (4)
>   and dropping 2 reserved irqs (0+3) around rx+tx
> - dropped Robs RB due to this change
> - allow interrupt names
> - add interrupt-names without reserved IRQs on mt7988
>   this requires mtk driver patch:
>   https://patchwork.kernel.org/project/netdevbpf/patch/20250616080738.117993-2-linux@fw-web.de/
> 
> v2:
> - change reg to list of items
> ---
>  Documentation/devicetree/bindings/net/mediatek,net.yaml | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> index 6672db206b38..74a139000f60 100644
> --- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> @@ -28,7 +28,8 @@ properties:
>        - ralink,rt5350-eth
>  
>    reg:
> -    maxItems: 1
> +    items:
> +      - description: Register for accessing the MACs.

Why making this change? It's redundant and nothing in commit msg
explains that.

Best regards,
Krzysztof


