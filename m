Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D7DC369D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 19:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IYNM3CNs298BwOjvOQH3AU9kAASJ1hVHCcEXbMhH4F8=; b=C2Rv6RtKJTxSgjgRdli2FF2i8U
	tDsufoZxwwyoeOFm8RdonfeBKJtdPfD+ObwKPdiCtuvELCkNJb4S3s8rjY1ZgFeDNDxLuX0mAgPLA
	7vGKlrDqUlv/gvZEMANISxefJCu+6up7qhmT16N9RkoIIibwnfAFsa8mZ6yuavLb1yOmDi0qpaObJ
	BKGLPkJUBS95pqT5em5HIsrs8zK3GoFjG6Bhl5dpTrJ4bBk6wYVjeLt6dEyY2vlpGUZloK8FJMTFJ
	EX3V7E37vLcwzKIYHr4HTcq4vXiIKsOMyuV0MBo0egGLzUnVWMFfz8CvIIOTtxJsD2Kdrxpih88EA
	MiU3mCtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81zg-0000000F8NX-3vlp;
	Thu, 24 Apr 2025 19:12:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81XZ-0000000F3zU-20Jr;
	Thu, 24 Apr 2025 18:43:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A364461137;
	Thu, 24 Apr 2025 18:42:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85CE9C4CEE3;
	Thu, 24 Apr 2025 18:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745520196;
	bh=e0MSzpfeZC3u0OgpBJaU+o20GeKZiZpJAI9t5/+pTns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z4K1d5z2cVAWYRQuDmGg4VfmJIxPQ1MXczD7on+t4QRic41MaX0ABN0CH+8pHP7zJ
	 u6/dNxHsQiy2MT3hX7M+fni8jNGzFyWsNCU1gd4srDlXdQtxT7LQIhkWFHO6TNvpOl
	 Ajfy0ck5+T/Q+TWz25umNhwixgWG8QjSX4ccVikYXMzjiumeRjnQSXfGkoYu9aQ2DJ
	 b2yPsrUoFgnmFRIeYU21CJlbWC0gyG1Ya4aPoQgCI8ev1nWzKe5OCfIh0Ilv0DEnR4
	 eE49muGXrVDxVaio6NWhxgZ91cC0dqjxvAD83gWnopvHPlnszERNmm0tCFH3ksc/f5
	 2dijTq4Fa2RIQ==
Date: Thu, 24 Apr 2025 19:43:11 +0100
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
Subject: Re: [PATCH net-next v3] net: ethernet: mtk_eth_soc: convert cap_bit
 in mtk_eth_muxc struct to u64
Message-ID: <20250424184311.GM3042781@horms.kernel.org>
References: <ded98b0d716c3203017a7a92151516ec2bf1abee.1745369249.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ded98b0d716c3203017a7a92151516ec2bf1abee.1745369249.git.daniel@makrotopia.org>
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

On Wed, Apr 23, 2025 at 01:48:02AM +0100, Daniel Golle wrote:
> From: Bo-Cun Chen <bc-bocun.chen@mediatek.com>
> 
> With commit 51a4df60db5c2 ("net: ethernet: mtk_eth_soc: convert caps in
> mtk_soc_data struct to u64") the capabilities bitfield was converted to
> a 64-bit value, but a cap_bit in struct mtk_eth_muxc which is used to
> store a full bitfield (rather than the bit number, as the name would
> suggest) still holds only a 32-bit value.
> 
> Change the type of cap_bit to u64 in order to avoid truncating the
> bitfield which results in path selection to not work with capabilities
> above the 32-bit limit.
> 
> The values currently stored in the cap_bit field are
> MTK_ETH_MUX_GDM1_TO_GMAC1_ESW:
>  BIT_ULL(18) | BIT_ULL(5)
> 
> MTK_ETH_MUX_GMAC2_GMAC0_TO_GEPHY:
>  BIT_ULL(19) | BIT_ULL(5) | BIT_ULL(6)
> 
> MTK_ETH_MUX_U3_GMAC2_TO_QPHY:
>  BIT_ULL(20) | BIT_ULL(5) | BIT_ULL(6)
> 
> MTK_ETH_MUX_GMAC1_GMAC2_TO_SGMII_RGMII:
>  BIT_ULL(20) | BIT_ULL(5) | BIT_ULL(7)
> 
> MTK_ETH_MUX_GMAC12_TO_GEPHY_SGMII:
>  BIT_ULL(21) | BIT_ULL(5)
> 
> While all those values are currently still within 32-bit boundaries,
> the addition of new capabilities of MT7988 as well as future SoC's
> like MT7987 will exceed them. Also, the use of a 32-bit 'int' type to
> store the result of a BIT_ULL(...) is misleading.
> 
> Signed-off-by: Bo-Cun Chen <bc-bocun.chen@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v3: don't use Fixes: tag
> v2: improve commit message

Thanks for the updates.

Reviewed-by: Simon Horman <horms@kernel.org>

