Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24B5C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 12:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9f2kGS3RxUxSPapMDtL1tJEQtW0+ImMsTFSFoL+7YA0=; b=c/rH8L+VU7l8Mm22ABrbtG0ktR
	VesOFg9lHou6XM2j/ESDaQyetQGqylQjTW1Ac3RF4NFrVLCFFmHXlbjEgm/6O+fkfZwROUb342tRH
	JE44DX86EwaFm3yr6s2hkFrc6MdhC0HorZQfAaalTm8tywK6l4EjgKlpXr5FymofZVxLygPVOr4vZ
	Mn2u7JytHbtqdgOxvKIvz1fOK3LwVv9Yr83bTT90i0HLczmFwzTvF5HWjWUnKbZYk8LXH+rzMvQpw
	3Do5nGbbu45WtGZbGLNaECeEbNFKxtJq9yzBENmFttNfGszjksuIlm4jP/wHf9j4UNZw4dSAwJtmI
	2+fdik2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZq7l-0000000BjTc-38GO;
	Thu, 10 Jul 2025 12:11:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnwI-0000000BOIq-1Shb;
	Thu, 10 Jul 2025 09:51:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F6AF5C4941;
	Thu, 10 Jul 2025 09:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B34C5C4CEF1;
	Thu, 10 Jul 2025 09:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752141097;
	bh=ysqkpnLH5eHCh7kN2peKuvz2QENB7fUs4hX/rZeXMI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XogLWYsYrW52faB+LJo50ovT6WWOmctuyU0wl1eXn/u+z1IqrNMwRzsKuH2PYos6G
	 gXMZJtf7yDibAbCPDdv5QcSM9ljX9W2mQiVgF1roWgdVohRfZZQp+EhBTOfOCVwyzp
	 hebYtTxfSpS4mDbSuc/uJEG6EV3xIIH1Mu67BmLjolOH/3C50FIx+KJJkhemu8fTMB
	 6nQQgOaHyM7Q0WrSKu9ofqNT3t2Ai9CsqvY07ysiHUNtwB4t6widDA8B3zQ9suwGrP
	 bbCxQYy5TRtAwc26pFTZKiIoUO24IOVZiIyYG+ZWqyZmkZFpVM2mKxGDGIBlS09dWS
	 +2jVfMv+JJiKg==
Date: Thu, 10 Jul 2025 11:51:34 +0200
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
Subject: Re: [PATCH v9 02/13] dt-bindings: net: mediatek,net: allow up to 8
 IRQs
Message-ID: <20250710-tasteful-crystal-partridge-770464@krzk-bin>
References: <20250709111147.11843-1-linux@fw-web.de>
 <20250709111147.11843-3-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250709111147.11843-3-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_025138_426954_D4932D46 
X-CRM114-Status: GOOD (  11.34  )
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

On Wed, Jul 09, 2025 at 01:09:38PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Increase the maximum IRQ count to 8 (4 FE + 4 RSS/LRO).
> 
> Frame-engine-IRQs (max 4):
> MT7621, MT7628: 1 FE-IRQ
> MT7622, MT7623: 3 FE-IRQs (only two used by the driver for now)
> MT7981, MT7986, MT7988: 4 FE-IRQs (only two used by the driver for now)
> 
> Mediatek Filogic SoCs (mt798x) have 4 additional IRQs for RSS and/or
> LRO. So MT798x have 8 IRQs in total.
> 
> MT7981 does not have a ethernet-node yet.
> MT7986 Ethernet node is updated with RSS/LRO IRQs in this series.
> MT7988 Ethernet node is added in this series.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


