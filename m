Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08F1C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 20:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EF07bYQF/ZYxrzomEQL7rlSHz0xz/GSWte75vLxX5+E=; b=A/RMUgjONA9QJvWoLvMHV1+qgF
	dxNg+qVeP131s7vQO7Wg2IB+H1A3VDtw9KWm8DBIJ4kgM13x6TA74c6hDuy4bleIOklnLcuVNdsN9
	7DpCQ1z/NzOwqXDYipPgtFUh3NFrXrQCxE6XnIzDIFl2vYzSIUikEOzp6t+Bag2GEgjegJgt80udC
	oe5LQoIfzSBYbrnY7rQCqwdcqsczia0to+EI/q6lzfaYP3k4PFwvxu1EPzSGSzr2V0PGFCECJOZc3
	rTHeGK2sI+4ag72cs0HE7MHD6fLzpDzhsCl8PEoiKraLw32cimZACTMeVDX3oWKj27vBayA7a7KkD
	nsZdn+eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Pap-00000000nIW-3MfB;
	Fri, 25 Apr 2025 20:24:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8PYx-00000000mzX-3TeE;
	Fri, 25 Apr 2025 20:22:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B0422A4D3EB;
	Fri, 25 Apr 2025 20:16:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88AAAC4CEE4;
	Fri, 25 Apr 2025 20:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745612538;
	bh=wXqKgQLXu0pmPXFCcvDgT2+FyDTeHkeFZOaIw/uzcDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DNlKRJt9QDMv5Q7m2gOZrfWEgrlazWvRVs+TAkaxn5FoezSrGLFptoB7bBmtERprB
	 DGc6OzbOGH6IYtAnaqHOes5+v70QfIJUtdDJeO2esl6ZCB0bcUqeVLaTgMCmY8WOig
	 WeMD3yeRlrObFnfeP+bd1ViPelHcFf6slDAoNWptn2Y8XqN6jU7lmbjj3RGcaqu+PC
	 zRZWDVq/t6rST2Hs2ukbi1fpmbBhnz1mbiGWbliYOriMvdkC5VhVGaiTLlzUZH5yZO
	 KbCYrZfG3d0TzU5+UucmGwN/3wr0t5GREN1eVOd9dMheF92DgVWHHMLhaAcxCSAzRE
	 ZUwFh4XHrYpnQ==
Date: Fri, 25 Apr 2025 21:22:13 +0100
From: Simon Horman <horms@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
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
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: sync
 mtk_clks_source_name array
Message-ID: <20250425202213.GU3042781@horms.kernel.org>
References: <d075e706ff1cebc07f9ec666736d0b32782fd487.1745555321.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d075e706ff1cebc07f9ec666736d0b32782fd487.1745555321.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_132219_932129_0C169B23 
X-CRM114-Status: GOOD (  11.17  )
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

On Fri, Apr 25, 2025 at 05:29:53AM +0100, Daniel Golle wrote:
> When removing the clock bits for clocks which aren't used by the
> Ethernet driver their names should also have been removed from the
> mtk_clks_source_name array.
> 
> Remove them now as enum mtk_clks_map needs to match the
> mtk_clks_source_name array so the driver can make sure that all required
> clocks are present and correctly name missing clocks.
> 
> Fixes: 887b1d1adb2e ("net: ethernet: mtk_eth_soc: drop clocks unused by Ethernet driver")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Simon Horman <horms@kernel.org>


