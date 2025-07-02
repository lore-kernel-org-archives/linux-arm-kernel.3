Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BB5C83013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 07:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFEn8Mwx7iZb4bcLt1+4BA8J7VwQHTbrRClWAd6OzhU=; b=1yAK/dX9BJZG00iqdJ1KijzBsX
	CroCa+wqiy8kJUWvQ+T+nlXOUB+RN77jbaeTPUjlnU8BjWjeB+p7e8MLJpW/w/A6I585u5Czdazpu
	76NlXU+/GfQuaWiGXvBGk2iCU0LnbpX+uIpv6ujLr1uLHRj0t/hrkAjYsAESOKY8Jp8HNlkHAk/KJ
	K5jxBl0ybgxnCVRl9po2sKcbJhCk/KzEVxEKj4EJ2c5dZunofvEuKl1j1zp9RLibhLCclo9QBBH7L
	xMdq//KGrJBgLwn0y2OToIACqkpHoGpX6LU6pxeWfQdJeAV03jsjlyFuHlwBlznw8wvGRJMgOK9KX
	vBOLZ/3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWsDP-00000007XON-0Rmu;
	Wed, 02 Jul 2025 07:49:11 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWsB4-00000007X3E-09nV;
	Wed, 02 Jul 2025 07:46:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OFEn8Mwx7iZb4bcLt1+4BA8J7VwQHTbrRClWAd6OzhU=; b=TY+5wL4gDFSoFVqQeDom46pQ3Z
	DslEO6a82orDnsC9xr7tvmwE9LkDnW1GS1RQeYPD4PSM3xE0VsV6qjCsxtVrRIs7Dt8+xW9DKeK/g
	jEkUCwbXdJFtMPrHOp4p8hlz5likS8jO47le2YGqEcIhCcgzZhZ+Wze7mORKVH0L7ijQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uWsAk-00HYRS-Hx; Wed, 02 Jul 2025 09:46:26 +0200
Date: Wed, 2 Jul 2025 09:46:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>,
	Frank Wunderlich <frank-w@public-files.de>,
	Eric Woudstra <ericwouds@gmail.com>, Elad Yifee <eladwf@gmail.com>,
	Bo-Cun Chen <bc-bocun.chen@mediatek.com>,
	Sky Huang <skylake.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v4 3/3] net: ethernet: mtk_eth_soc: use generic
 allocator for SRAM
Message-ID: <e5d6ac18-4d38-4a01-abd5-8bd4d6c3b05b@lunn.ch>
References: <cover.1751421358.git.daniel@makrotopia.org>
 <88ae2a765ef809d36e153430bf60aac6ce81d6f1.1751421358.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88ae2a765ef809d36e153430bf60aac6ce81d6f1.1751421358.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_004646_072619_284CB3EF 
X-CRM114-Status: GOOD (  10.85  )
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

On Wed, Jul 02, 2025 at 03:38:15AM +0100, Daniel Golle wrote:
> Use a dedicated "mmio-sram" node and the generic allocator
> instead of open-coding SRAM allocation for DMA rings.
> Keep support for legacy device trees but notify the user via a
> warning to update, and let the ethernet driver create the
> gen_pool in this case.
> 
> Co-developed-by: Frank Wunderlich <frank-w@public-files.de>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

