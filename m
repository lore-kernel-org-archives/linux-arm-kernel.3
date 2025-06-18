Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294A1C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 19:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bd5Oz0QcRTHeOq6fUu6c0Z1NcWn4wQETEI7MPv479G8=; b=fSIwXJAaAKamPMmbf16wyIKDIS
	1toumM7s+vUpGgSRnb79BctE/TP5z4mUgUNb5bY4/nnGcHYnZMNj6tfaCQp1fM+3y/5sz1hfhXJ0P
	A5LPr/iabm72LJnfl1vljRTWSKHs+HXgkEzVkT3QghrcRdiayWpth7e0tDbf/g8E3+qAOjMATvtYH
	8D4+LIlJ+1UpXpcVkl7/G7Skl/jdsRaQFTtC9QNAw01YwHVjmJ+fpd4kOe8ir3vU8/LC2igYPhc+G
	uxTWGpdaGECee8GPf4u/XT9ZXDDe9sXl4rbJqMdwENA7LWGXNYac0t32jg0ulcWPiHeR9OdF5Yxa3
	zX41fA/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyCM-0000000B9zt-1eow;
	Wed, 18 Jun 2025 19:11:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwji-0000000AsUR-03vq;
	Wed, 18 Jun 2025 17:38:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E0D234A96F;
	Wed, 18 Jun 2025 17:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640D9C4CEEF;
	Wed, 18 Jun 2025 17:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750268288;
	bh=i76VuE3Aq3hkZ2sq2815FwgqFtHsSev/sM8xJboxVA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gy4wyw7Y974jROrWoiVVP96W7MZfhfIw26Rom0+USF/ynDOVUyhqKUnvQnPHJRnJX
	 h9hkcAVWDmBqr6TbFW9u5tuscOsfQGmBfBsVzL3higBrMyKjGt4XMyyI2/HKnAMOHl
	 HyKkYg3mn+1yv778lVizhJZGsODXA/gPUMhgeuWn+xFUeoczWAn7rFYBH277UjiM2e
	 jq8XzslfshPrL7m4JM+Al4ry31QX0n5EJW+S/5YiGxlmv0eqtE1uY75IQQEgUwHqxc
	 y/qhRviqh/RTh26cf7OpNuWbhs0k0kihiHk9N/je41BR7VYiNzFaY4zwfoY8MM9vU4
	 NwSVJi031yZBw==
Date: Wed, 18 Jun 2025 12:38:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: DENG Qingfang <dqfext@gmail.com>,
	Jia-Wei Chang <jia-wei.chang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org,
	Frank Wunderlich <frank-w@public-files.de>,
	Georgi Djakov <djakov@kernel.org>, linux-kernel@vger.kernel.org,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	Kyungmin Park <kyungmin.park@samsung.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Felix Fietkau <nbd@nbd.name>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, netdev@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Johnson Wang <johnson.wang@mediatek.com>
Subject: Re: [PATCH v4 01/13] dt-bindings: net: mediatek,net: update for
 mt7988
Message-ID: <175026826312.2322513.8876769837630455596.robh@kernel.org>
References: <20250616095828.160900-1-linux@fw-web.de>
 <20250616095828.160900-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616095828.160900-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_103810_072464_D49BA585 
X-CRM114-Status: GOOD (  13.59  )
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


On Mon, 16 Jun 2025 11:58:11 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Update binding for mt7988 which has 3 gmac and 2 reg items.
> 
> With RSS-IRQs the interrupt max-items is now 6. Add interrupt-names
> to make them accessible by name.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v4:
> - increase max interrupts to 8 because of RSS/LRO interrupts
> - dropped Robs RB due to this change
> - allow interrupt names
> - add interrupt-names without reserved IRQs on mt7988
>   this requires mtk driver patch:
>   https://patchwork.kernel.org/project/netdevbpf/patch/20250616080738.117993-2-linux@fw-web.de/
> 
> v2:
> - change reg to list of items
> ---
>  .../devicetree/bindings/net/mediatek,net.yaml | 28 ++++++++++++++++---
>  1 file changed, 24 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


